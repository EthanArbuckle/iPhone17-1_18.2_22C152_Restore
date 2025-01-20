@interface SAMPPodcast
+ (id)podcast;
- (NSString)seriesId;
- (NSString)seriesTitle;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSeriesId:(id)a3;
- (void)setSeriesTitle:(id)a3;
@end

@implementation SAMPPodcast

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"Podcast";
}

+ (id)podcast
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)seriesId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"seriesId"];
}

- (void)setSeriesId:(id)a3
{
}

- (NSString)seriesTitle
{
  return (NSString *)[(AceObject *)self propertyForKey:@"seriesTitle"];
}

- (void)setSeriesTitle:(id)a3
{
}

@end