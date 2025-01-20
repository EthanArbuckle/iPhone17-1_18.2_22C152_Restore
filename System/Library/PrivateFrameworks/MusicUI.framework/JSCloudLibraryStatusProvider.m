@interface JSCloudLibraryStatusProvider
- (JSValue)isCloudLibraryEnabled;
- (JSValue)isCloudLibraryLoaded;
- (_TtC7MusicUI28JSCloudLibraryStatusProvider)init;
- (void)setIsCloudLibraryLoaded:(id)a3;
@end

@implementation JSCloudLibraryStatusProvider

- (JSValue)isCloudLibraryEnabled
{
  v2 = self;
  v3 = (void *)sub_22A093524();

  return (JSValue *)v3;
}

- (JSValue)isCloudLibraryLoaded
{
  v2 = self;
  v3 = (void *)sub_22A09357C();

  return (JSValue *)v3;
}

- (void)setIsCloudLibraryLoaded:(id)a3
{
  id v4 = a3;
  v5 = self;
}

- (_TtC7MusicUI28JSCloudLibraryStatusProvider)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

@end