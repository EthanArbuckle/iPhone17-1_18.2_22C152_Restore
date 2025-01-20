@interface SALCMTvShow
+ (id)tvShow;
- (NSString)seriesName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSeriesName:(id)a3;
@end

@implementation SALCMTvShow

- (id)groupIdentifier
{
  return @"com.apple.ace.livecontent";
}

- (id)encodedClassName
{
  return @"TvShow";
}

+ (id)tvShow
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)seriesName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"seriesName"];
}

- (void)setSeriesName:(id)a3
{
}

@end