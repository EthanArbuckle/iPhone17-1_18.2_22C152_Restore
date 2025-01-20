@interface CBMetricsAggressiveScanEvent
- ($F9CA75CC5B4E604BACB273E5A2091FCB)discoveryTypes;
- ($F9CA75CC5B4E604BACB273E5A2091FCB)discoveryTypesPtr;
- (int)scanRateScreenOff;
- (int)scanRateScreenOn;
- (unint64_t)discoveryFlags;
- (unint64_t)scanScreenOffCount;
- (unint64_t)scanScreenOnCount;
- (void)setDiscoveryFlags:(unint64_t)a3;
- (void)setDiscoveryTypes:(id)a3;
- (void)setScanRateScreenOff:(int)a3;
- (void)setScanRateScreenOn:(int)a3;
- (void)setScanScreenOffCount:(unint64_t)a3;
- (void)setScanScreenOnCount:(unint64_t)a3;
@end

@implementation CBMetricsAggressiveScanEvent

- ($F9CA75CC5B4E604BACB273E5A2091FCB)discoveryTypesPtr
{
  return ($F9CA75CC5B4E604BACB273E5A2091FCB *)&self->_discoveryTypes;
}

- (unint64_t)scanScreenOnCount
{
  return self->_scanScreenOnCount;
}

- (void)setScanScreenOnCount:(unint64_t)a3
{
  self->_scanScreenOnCount = a3;
}

- (unint64_t)scanScreenOffCount
{
  return self->_scanScreenOffCount;
}

- (void)setScanScreenOffCount:(unint64_t)a3
{
  self->_scanScreenOffCount = a3;
}

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- ($F9CA75CC5B4E604BACB273E5A2091FCB)discoveryTypes
{
  return ($F9CA75CC5B4E604BACB273E5A2091FCB)(*(unsigned int *)self->_discoveryTypes.bitArray | ((unint64_t)self->_discoveryTypes.bitArray[4] << 32));
}

- (void)setDiscoveryTypes:(id)a3
{
  self->_discoveryTypes = ($C240CC9744FF9AA96969AB9D0FFFA52B)a3;
}

- (int)scanRateScreenOn
{
  return self->_scanRateScreenOn;
}

- (void)setScanRateScreenOn:(int)a3
{
  self->_scanRateScreenOn = a3;
}

- (int)scanRateScreenOff
{
  return self->_scanRateScreenOff;
}

- (void)setScanRateScreenOff:(int)a3
{
  self->_scanRateScreenOff = a3;
}

@end