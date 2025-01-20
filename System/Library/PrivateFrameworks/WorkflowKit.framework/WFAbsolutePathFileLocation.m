@interface WFAbsolutePathFileLocation
+ (BOOL)canRepresentURL:(id)a3;
+ (id)subpathFromURL:(id)a3;
- (BOOL)isSupportedOnCurrentPlatform;
- (BOOL)shouldShowUsersDuringDisplay:(id)a3;
- (id)resolveLocationWithError:(id *)a3;
@end

@implementation WFAbsolutePathFileLocation

- (id)resolveLocationWithError:(id *)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [(WFFileLocation *)self relativeSubpath];
  v5 = [v3 fileURLWithPath:v4];

  return v5;
}

- (BOOL)shouldShowUsersDuringDisplay:(id)a3
{
  return 0;
}

- (BOOL)isSupportedOnCurrentPlatform
{
  return 0;
}

+ (id)subpathFromURL:(id)a3
{
  return (id)[a3 path];
}

+ (BOOL)canRepresentURL:(id)a3
{
  return 1;
}

@end