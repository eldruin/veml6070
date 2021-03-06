# Rust VEML6070 UVA Light Sensor Driver

[![crates.io](https://img.shields.io/crates/v/veml6070.svg)](https://crates.io/crates/veml6070)
[![Docs](https://docs.rs/veml6070/badge.svg)](https://docs.rs/veml6070)
[![Build Status](https://github.com/eldruin/veml6070-rs/workflows/Build/badge.svg)](https://github.com/eldruin/veml6070-rs/actions?query=workflow%3ABuild)
[![Coverage Status](https://coveralls.io/repos/github/eldruin/veml6070-rs/badge.svg?branch=master)](https://coveralls.io/github/eldruin/veml6070-rs?branch=master)

This is a platform agnostic Rust driver for the VEML6070 UVA light sensor,
based on the [`embedded-hal`](https://github.com/rust-embedded/embedded-hal) traits.

This driver allows you to:
- Enable/disable the sensor. See: `enable()`.
- Read the UV measurement. See: `read_uv()`.
- Set the integration time. See: `set_integration_time()`.
- Enable/disable ACK signal. See: `enable_ack()`.
- Set ACK threshold value. See: `set_ack_threshold()`.

## The device
VEML6070 is an advanced ultraviolet (UV) light sensor with I2C protocol
interface and designed by the CMOS process.
It is easily operated via a simple I2C command. The active acknowledge
(ACK) feature with threshold windows setting allows the UV sensor to
send out a UVI alert message. Under a strong solar UVI condition, the
smart ACK signal can be easily implemented by the software programming.
VEML6070 incorporates a photodiode, amplifiers, and analog / digital
circuits into a single chip. VEML6070's adoption of Filtron TM UV
technology provides the best spectral sensitivity to cover UV spectrum
sensing. It has an excellent temperature compensation and a robust refresh
rate setting that does not use an external RC low pass filter.
VEML6070 has linear sensitivity to solar UV light and is easily adjusted
by an external resistor.
Software shutdown mode is provided, which reduces power consumption to
be less than 1 μA. VEML6070's operating voltage ranges from 2.7 V to 5.5 V.

Datasheet:
- [VEML6070](https://www.vishay.com/docs/84277/veml6070.pdf)

Application note:
- [VEML6070 AN](https://www.vishay.com/docs/84310/designingveml6070.pdf)

## Usage example

To use this driver, import this crate and an `embedded_hal` implementation,
then instantiate the device.

Please find additional examples in this repository: [driver-examples]

[driver-examples]: https://github.com/eldruin/driver-examples

```rust
use linux_embedded_hal::I2cdev;
use veml6070::Veml6070;

fn main() {
    let dev = I2cdev::new("/dev/i2c-1").unwrap();
    let mut uv_light_sensor = Veml6070::new(dev);
    // initialization step is necessary
    uv_light_sensor.init().unwrap();
    uv_light_sensor.enable().unwrap();
    let reading = uv_light_sensor.read_uv().unwrap();
    println!("UV reading: {}", reading);
}
```

## Support

For questions, issues, feature requests, and other changes, please file an
[issue in the github project](https://github.com/eldruin/veml6070-rs/issues).

## License

Licensed under either of

 * Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or
   http://www.apache.org/licenses/LICENSE-2.0)
 * MIT license ([LICENSE-MIT](LICENSE-MIT) or
   http://opensource.org/licenses/MIT)

at your option.

### Contributing

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall
be dual licensed as above, without any additional terms or conditions.

