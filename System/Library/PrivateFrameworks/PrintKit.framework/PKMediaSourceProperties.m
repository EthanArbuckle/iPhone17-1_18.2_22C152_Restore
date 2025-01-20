@interface PKMediaSourceProperties
- (NSNumber)feedOrientation;
- (NSString)feedDirection;
- (id)userCodableDictionary;
@end

@implementation PKMediaSourceProperties

- (id)userCodableDictionary
{
  v3 = objc_opt_new();
  v4 = [(PKMediaSourceProperties *)self feedDirection];
  [v3 setObject:v4 forKeyedSubscript:@"media-source-feed-direction"];

  v5 = [(PKMediaSourceProperties *)self feedOrientation];
  [v3 setObject:v5 forKeyedSubscript:@"media-source-feed-orientation"];

  return v3;
}

- (NSString)feedDirection
{
  v2 = [(PKCollectionSpecialization *)self params];

  return (NSString *)Printd_Parameters::_get_FeedDirection(&v2->var0);
}

- (NSNumber)feedOrientation
{
  v2 = NSNumber;
  uint64_t FeedOrientation = Printd_Parameters::_get_FeedOrientation((void **)[(PKCollectionSpecialization *)self params]);

  return (NSNumber *)[v2 numberWithUnsignedInt:FeedOrientation];
}

@end