# Twitter twemproxy cookbook (aka nutcracker)

Installs and configures nutcracker.

## Supported Platforms

Debian and Ubuntu are supported, all others can be easily implemented.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['nutcracker']['max_fds']</tt></td>
    <td>Fixnum</td>
    <td>Sets the number of open file descriptors.</td>
    <td><tt>1024</tt></td>
  </tr>
  <tr>
    <td><tt>['nutcracker']['stats_port']</tt></td>
    <td>Fixnum</td>
    <td>Sets the stats monitoring port.</td>
    <td><tt>22222</tt></td>
  </tr>
  <tr>
    <td><tt>['nutcracker']['stats_interval']</tt></td>
    <td>Fixnum</td>
    <td>Sets the statistics aggregation interval.</td>
    <td><tt>30000 (30s)</tt></td>
  </tr>
  <tr>
    <td><tt>['nutcracker']['config']</tt></td>
    <td>Hash</td>
    <td>The configuration of nutcracker, it will be saved as the nutcracker yaml configureation file.</td>
    <td><tt>{}</tt></td>
  </tr>
</table>

## Usage

### nutcracker::default

Include `nutcracker` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[nutcracker::default]"
  ]
}
```

The configuration of nutcracker is simply specified as the `node['nutcracker']['config']` attribute and it will be saved as the YAML configuration file of nutcracker.

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Denis Baryshev (<dennybaa@gmail.com>)