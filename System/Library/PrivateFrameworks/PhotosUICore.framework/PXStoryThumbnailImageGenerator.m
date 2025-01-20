@interface PXStoryThumbnailImageGenerator
+ (id)generateImageWithStoryConfiguration:(id)a3 size:(CGSize)a4 displayScale:(double)a5 convertToYUV:(BOOL)a6 storyLoadTimeOut:(double)a7 nonDegradedTimeout:(double)a8;
- (PXStoryThumbnailImageGenerator)init;
@end

@implementation PXStoryThumbnailImageGenerator

+ (id)generateImageWithStoryConfiguration:(id)a3 size:(CGSize)a4 displayScale:(double)a5 convertToYUV:(BOOL)a6 storyLoadTimeOut:(double)a7 nonDegradedTimeout:(double)a8
{
  BOOL v10 = a6;
  double height = a4.height;
  double width = a4.width;
  id v15 = objc_allocWithZone((Class)type metadata accessor for StoryThumbnailImageGenerator.Request());
  id v16 = a3;
  id v17 = sub_1AA40CB58(v16, v10, width, height, a5, a7, a8);
  v18 = (void *)sub_1AA40C244();

  return v18;
}

- (PXStoryThumbnailImageGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StoryThumbnailImageGenerator();
  return [(PXStoryThumbnailImageGenerator *)&v3 init];
}

@end