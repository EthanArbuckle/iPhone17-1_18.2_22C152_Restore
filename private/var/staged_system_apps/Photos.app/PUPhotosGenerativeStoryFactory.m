@interface PUPhotosGenerativeStoryFactory
- (PUPhotosGenerativeStoryFactory)init;
@end

@implementation PUPhotosGenerativeStoryFactory

- (PUPhotosGenerativeStoryFactory)init
{
  return (PUPhotosGenerativeStoryFactory *)PhotosGenerativeStoryFactory.init()();
}

@end