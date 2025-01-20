@interface PUIArtworkURLScheme
+ (NSString)monogram;
+ (NSString)resource;
+ (NSString)systemGlyph;
- (PUIArtworkURLScheme)init;
@end

@implementation PUIArtworkURLScheme

+ (NSString)resource
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (NSString)monogram
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

+ (NSString)systemGlyph
{
  v2 = (void *)sub_1ACE76178();
  return (NSString *)v2;
}

- (PUIArtworkURLScheme)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArtworkURLScheme();
  return [(PUIArtworkURLScheme *)&v3 init];
}

@end