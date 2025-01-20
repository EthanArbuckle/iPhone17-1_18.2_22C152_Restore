@interface CLTransitMacTileDataProviderResult
- (CLTransitMacTileDataProviderResult)initWithMacAddress:(unint64_t)a3;
- (unint64_t)macAddress;
@end

@implementation CLTransitMacTileDataProviderResult

- (CLTransitMacTileDataProviderResult)initWithMacAddress:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLTransitMacTileDataProviderResult;
  result = [(CLTransitMacTileDataProviderResult *)&v5 init];
  if (result) {
    result->_macAddress = a3;
  }
  return result;
}

- (unint64_t)macAddress
{
  return self->_macAddress;
}

@end