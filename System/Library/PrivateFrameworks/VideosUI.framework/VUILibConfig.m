@interface VUILibConfig
- (VUILibConfig)init;
- (int64_t)collectionItemLimit;
- (void)setCollectionItemLimit:(int64_t)a3;
@end

@implementation VUILibConfig

- (int64_t)collectionItemLimit
{
  return self->_collectionItemLimit;
}

- (void)setCollectionItemLimit:(int64_t)a3
{
  self->_collectionItemLimit = a3;
}

- (VUILibConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUILibConfig;
  result = [(VUILibConfig *)&v3 init];
  if (result) {
    result->_collectionItemLimit = 2000;
  }
  return result;
}

@end