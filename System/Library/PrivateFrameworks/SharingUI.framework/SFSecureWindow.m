@interface SFSecureWindow
+ (BOOL)_isSecure;
- (_TtC9SharingUI14SFSecureWindow)initWithCoder:(id)a3;
- (_TtC9SharingUI14SFSecureWindow)initWithContentRect:(CGRect)a3;
- (_TtC9SharingUI14SFSecureWindow)initWithFrame:(CGRect)a3;
- (_TtC9SharingUI14SFSecureWindow)initWithWindowScene:(id)a3;
@end

@implementation SFSecureWindow

+ (BOOL)_isSecure
{
  return sub_21DBAC768() & 1;
}

- (_TtC9SharingUI14SFSecureWindow)initWithWindowScene:(id)a3
{
  id v3 = a3;
  return (_TtC9SharingUI14SFSecureWindow *)SFSecureWindow.init(windowScene:)(a3);
}

- (_TtC9SharingUI14SFSecureWindow)initWithFrame:(CGRect)a3
{
  return (_TtC9SharingUI14SFSecureWindow *)SFSecureWindow.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SharingUI14SFSecureWindow)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC9SharingUI14SFSecureWindow *)SFSecureWindow.init(coder:)(a3);
}

- (_TtC9SharingUI14SFSecureWindow)initWithContentRect:(CGRect)a3
{
  return (_TtC9SharingUI14SFSecureWindow *)SFSecureWindow.init(contentRect:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end