# @peachy/types

> **Note:** This package is meant to be used with [peachy]

TypeScript type definitions for GJS and GNOME libraries. Get full autocomplete, type-checking, and inline documentation in your editor when building GNOME apps with TypeScript.

Types are auto-generated with [ts-for-gir] data shipped with the GNOME SDK `master` branch.

> **Note:** The full list of available types depends on the libraries present in the GNOME SDK at the time of generation. You can find the list of all generated types here: [./types].

## Installation

```bash
npm install @peachy/types
```

## Usage

Add `@peachy/types` to your `tsconfig.json`:

```json
{
  "compilerOptions": {
    "types": ["@peachy/types"]
  }
}
```

Then import GNOME libraries with full type support:

```ts
import Gtk from "gi://Gtk?version=4.0";
import Adw from "gi://Adw?version=1";

const app = new Adw.Application({
  applicationId: "com.example.MyApp",
});

app.connect("activate", () => {
  const window = new Adw.ApplicationWindow({ application: app });
  const label = new Gtk.Label({ label: "Hello from TypeScript!" });
  window.set_content(label);
  window.present();
});

app.run([]);
```

## Versioning

Types track the GNOME SDK `master` branch from [GNOME Nightly][nightly]. This means they reflect the latest development state of GNOME libraries, which may include APIs not yet available in stable releases.

| @peachy/types version | GNOME SDK |
|-----------------------|------------------|
| `latest` | `master` |

In the future, we plan to support specific stable GNOME releases (48, 49, etc...).

## License

MIT

[nightly]: https://nightly.gnome.org/
[ts-for-gir]: https://github.com/gjsify/ts-for-gir
[peachy]: https://gitlab.gnome.org/vixalien/peachy
