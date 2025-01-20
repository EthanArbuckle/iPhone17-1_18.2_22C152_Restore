@interface NSBundle(TVMLKitAdditions)
- (id)tv_launchImage;
- (uint64_t)tv_imageNamed:()TVMLKitAdditions;
@end

@implementation NSBundle(TVMLKitAdditions)

- (id)tv_launchImage
{
  v2 = (void *)MEMORY[0x263F1C6B0];
  v3 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceIdiom:2];
  v4 = [v2 imageNamed:@"LaunchImage" inBundle:a1 compatibleWithTraitCollection:v3];

  return v4;
}

- (uint64_t)tv_imageNamed:()TVMLKitAdditions
{
  return [MEMORY[0x263F1C6B0] imageNamed:a3 inBundle:a1];
}

@end