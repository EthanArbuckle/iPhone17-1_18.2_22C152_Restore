@interface MTPlaceholderManifest
- (BOOL)isLoaded;
- (BOOL)isPlaceholder;
- (MTPlaceholderManifest)init;
- (MTPlaceholderManifest)initWithItems:(id)a3;
- (NSUserActivity)activity;
@end

@implementation MTPlaceholderManifest

- (BOOL)isLoaded
{
  return 1;
}

- (BOOL)isPlaceholder
{
  return 1;
}

- (NSUserActivity)activity
{
  return (NSUserActivity *)0;
}

- (MTPlaceholderManifest)initWithItems:(id)a3
{
  result = (MTPlaceholderManifest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (MTPlaceholderManifest)init
{
  result = (MTPlaceholderManifest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end