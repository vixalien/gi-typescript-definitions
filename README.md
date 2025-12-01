# gi-typescript-definitions

This repo contains auto-generated types from the master GNOME SDK.

## Usage

```sh
git submodule add https://github.com/vixalien/gi-typescript-definitions.git gi-types
```

Then add it to your `tsconfig.json`

```json
{
  "compilerOptions": {
    "types": ["gi-types"]
  }
}
```

Then in your application you can use GJS types


```ts
import Gtk from "gi://Gtk?version=4.0"

const label = new Gtk.Label();
```

## Development

To update the types here, follow these steps

Clone this repo, and make sure you have an updated installation of GNOME SDK and the node24

```sh
flatpak install org.gnome.Sdk//master org.freedesktop.Sdk.Extension.node24
```

Then run this to update the types

```sh
./generate_types_in_flatpak.sh
```

## TODO

- [ ] Setup CI to automatically update these types
