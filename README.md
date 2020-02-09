# UPC Validation

Verifies whether a string of 12 ASCII encoded digits stored in memory is a valid UPC or not. If valid, stores 1 in r0, if not, stores 2 in r0.

**Aboout UPC's**
Most goods sold in Canadian and U.S. stores are marked with a Universal Product Code (UPC).
The meanings of the digits underneath the bar code (from left to right) are:
  - First digit: type of item,
  - First group of five digits: manufacturer,
  - Second group of five digits: product, and
  - Final digit: check digit, used to help identify an error in the preceding digits.
  
  
