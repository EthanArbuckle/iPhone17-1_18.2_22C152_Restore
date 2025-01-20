@interface RecentDialog
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC11SiriKitFlow12RecentDialog)init;
- (_TtC11SiriKitFlow12RecentDialog)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RecentDialog

+ (BOOL)supportsSecureCoding
{
  return static RecentDialog.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (_TtC11SiriKitFlow12RecentDialog)initWithCoder:(id)a3
{
  return (_TtC11SiriKitFlow12RecentDialog *)RecentDialog.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  RecentDialog.encode(with:)((NSCoder)v4);
}

- (_TtC11SiriKitFlow12RecentDialog)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11SiriKitFlow12RecentDialog_expiresAt;
  sub_1C9BEAA98();
  OUTLINED_FUNCTION_8_4();
  (*(void (**)(char *))(v4 + 8))(v3);

  swift_bridgeObjectRelease();
}

@end