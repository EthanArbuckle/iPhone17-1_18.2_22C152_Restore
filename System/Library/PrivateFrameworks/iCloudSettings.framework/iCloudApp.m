@interface iCloudApp
- (NSString)dataclass;
- (NSString)iTunesItemId;
- (NSString)subtitle;
- (_TtC14iCloudSettings5Icons)icons;
- (_TtC14iCloudSettings9iCloudApp)init;
- (id)init:(id)a3;
@end

@implementation iCloudApp

- (NSString)dataclass
{
  return (NSString *)sub_2629FD268();
}

- (NSString)subtitle
{
  return (NSString *)sub_2629FD268();
}

- (NSString)iTunesItemId
{
  return (NSString *)sub_2629FBBF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings9iCloudApp_iTunesItemId);
}

- (_TtC14iCloudSettings5Icons)icons
{
  return (_TtC14iCloudSettings5Icons *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                               + OBJC_IVAR____TtC14iCloudSettings9iCloudApp_icons));
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return iCloudApp.init(_:)(v3);
}

- (_TtC14iCloudSettings9iCloudApp)init
{
  result = (_TtC14iCloudSettings9iCloudApp *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end