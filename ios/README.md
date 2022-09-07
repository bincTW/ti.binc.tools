# bincTools

A small library of useful methods.

## Requirements

- [x] Titanium SDK 10.0.0+
- [x] iOS 13+ (for RelativeDate)

## Examples

```js
import bincTools from 'ti.binc.tools'

/**
 * method: relativeDate
 * returns a locale-aware string representation of a relative date or time from a given timestamp or date string
 * set timestamp or date property as input value
 *
 * @param {Object} properties
 * @param {Int} properties.timestamp a Epoch Unix Timestamp e. g. 1662566188
 * @param {String} properties.date a datetime string (defaults to mysql datetime format) - e. g. 2022-09-09 14:30:00
 * @param {String} properties.dateFormat optional to overwrite the default format string - e. g. dd.MM.yyyy HH:mm:ss
 * @param {String} properties.language optional to overwrite system locale - e. g. fr_FR
 * @return {string} string representation of a relative date or time
 *
 * examples:
 */

 console.log( bincTools.relativeDate({
 	timestamp:1662566188
 }) );
 // returns a locale-aware relative date / time string from given unix timestamp to now (e.g. "2 days ago")

console.log( bincTools.relativeDate({
	date:'2022-09-07 18:00:00',
	language:'de_DE'
}) );
// returns relative date / time string from given date to now in german language (e.g. "vor 3 Stunden")




/**
 * method: getApplicationState
 * returns a string representation of app’s current state
 * e. g. useful for handling remote notifications
 *
 * @return {string} active, inactive, background or unknown
 *
 * example:
 */
 console.log( bincTools.getApplicationState() );


 /**
  * method: createUUID
  * returns one or more UUIDs
  * e. g. useful as unique identifier / key for items
  *
	* @param {Int} quantity optional number of UUIDs to create
  * @param {Bool} lowercase creates UUIDs with lowercase characters
  * @return {string|array} UUID as string or array of n UUIDs
  *
  * examples:
  */

  console.log( bincTools.createUUID() );
	// returns a UUID like B12CDA13-EF42-4DF7-9E3A-667EDF7B7243

	console.log( bincTools.createUUID(3) );
	// return an array with 3 UUIDs

	console.log ( bincTools.createUUID(1,true) );
	// return a lowercase UUID like 7934e6dd-a287-4e51-a4dd-390aca3ddfab


```

## Author

Thomas Weber

## License

MIT
