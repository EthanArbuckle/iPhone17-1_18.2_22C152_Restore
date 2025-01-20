@interface CLSubHarvesterAvengerExternalAdapter
- (BOOL)valid;
- (CLSubHarvesterAvengerExternalAdapter)initWithHarvesterExternal:(void *)a3;
- (id)clientIdentifier;
- (void)onAggressiveScanEnded;
- (void)onAggressiveScanStarted;
- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4;
- (void)setValid:(BOOL)a3;
@end

@implementation CLSubHarvesterAvengerExternalAdapter

- (CLSubHarvesterAvengerExternalAdapter)initWithHarvesterExternal:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLSubHarvesterAvengerExternalAdapter;
  result = [(CLSubHarvesterAvengerExternalAdapter *)&v5 init];
  if (result)
  {
    result->_subHarvesterExternal = a3;
    result->_valid = 1;
  }
  return result;
}

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
}

- (void)onAggressiveScanStarted
{
}

- (void)onAggressiveScanEnded
{
}

- (id)clientIdentifier
{
  return @"CLSubHarvesterAvenger";
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end