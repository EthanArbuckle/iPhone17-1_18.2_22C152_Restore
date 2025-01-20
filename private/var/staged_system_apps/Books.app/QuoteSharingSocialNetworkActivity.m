@interface QuoteSharingSocialNetworkActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)activityTitle;
- (NSString)activityType;
- (_TtC5BooksP33_2C2BED1571008C9518B7996B9F10173C33QuoteSharingSocialNetworkActivity)init;
- (id)_bundleIdentifierForActivityImageCreation;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation QuoteSharingSocialNetworkActivity

+ (int64_t)activityCategory
{
  return 1;
}

- (NSString)activityType
{
  v2 = self;
  NSString v3 = sub_1007FDC30();

  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)activityTitle
{
  NSString v2 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (id)_bundleIdentifierForActivityImageCreation
{
  NSString v2 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return v2;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v4 = sub_1007F29D0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  v9 = self;
  id v10 = [v8 sharedApplication];
  sub_1003FCC00(*((unsigned char *)&v9->super.super.isa+ OBJC_IVAR____TtC5BooksP33_2C2BED1571008C9518B7996B9F10173C33QuoteSharingSocialNetworkActivity_socialNetwork), (uint64_t)v7);
  sub_1007F2960(v11);
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  LOBYTE(v4) = [v10 canOpenURL:v13];

  return v4;
}

- (void)prepareWithActivityItems:(id)a3
{
  NSString v3 = self;
  sub_1003F83C4();
}

- (_TtC5BooksP33_2C2BED1571008C9518B7996B9F10173C33QuoteSharingSocialNetworkActivity)init
{
  result = (_TtC5BooksP33_2C2BED1571008C9518B7996B9F10173C33QuoteSharingSocialNetworkActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5BooksP33_2C2BED1571008C9518B7996B9F10173C33QuoteSharingSocialNetworkActivity_backgroundImage));
  NSString v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC5BooksP33_2C2BED1571008C9518B7996B9F10173C33QuoteSharingSocialNetworkActivity_stickerImage);
}

@end