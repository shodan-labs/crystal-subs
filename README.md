# subs

Simple subdomain discovery tool that uses the Shodan API to grab domain information.

## Installation

Clone the repository and run:

```bash
crystal build --release src/subs.cr
```

## Usage

```bash
subs <API KEY> <domain>
```

For example:

```bash
subs APIKEY cnn.com
```

You can grab your API key from the Shodan account page:

https://account.shodan.io
