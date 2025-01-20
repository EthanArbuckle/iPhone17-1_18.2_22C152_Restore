@interface WFHomeRelativePathFileLocation
+ (BOOL)canRepresentURL:(id)a3;
+ (id)homeDirectory;
+ (id)subpathFromURL:(id)a3;
- (BOOL)isSupportedOnCurrentPlatform;
- (BOOL)shouldShowUsersDuringDisplay:(id)a3;
- (id)resolveLocationWithError:(id *)a3;
@end

@implementation WFHomeRelativePathFileLocation

- (BOOL)shouldShowUsersDuringDisplay:(id)a3
{
  return 1;
}

- (id)resolveLocationWithError:(id *)a3
{
  return 0;
}

- (BOOL)isSupportedOnCurrentPlatform
{
  return 0;
}

+ (id)subpathFromURL:(id)a3
{
  return 0;
}

+ (BOOL)canRepresentURL:(id)a3
{
  return 0;
}

+ (id)homeDirectory
{
  return 0;
}

@end