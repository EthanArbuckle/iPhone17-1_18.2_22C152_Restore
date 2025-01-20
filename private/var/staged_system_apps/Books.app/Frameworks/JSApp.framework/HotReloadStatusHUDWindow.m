@interface HotReloadStatusHUDWindow
- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow)initWithCoder:(id)a3;
- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow)initWithFrame:(CGRect)a3;
- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow)initWithWindowScene:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation HotReloadStatusHUDWindow

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow)initWithWindowScene:(id)a3
{
  return (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow *)sub_62CB8(a3);
}

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow)initWithCoder:(id)a3
{
  result = (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow *)sub_86F70();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for HotReloadStatusHUDWindow();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[HotReloadStatusHUDWindow hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  type metadata accessor for HotReloadStatusHUDManager();
  unsigned __int8 v11 = [v10 isKindOfClass:swift_getObjCClassFromMetadata()];

  id v7 = v10;
  if ((v11 & 1) == 0)
  {
LABEL_5:

    v10 = 0;
  }

  return v10;
}

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow)initWithFrame:(CGRect)a3
{
  result = (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA224HotReloadStatusHUDWindow_hudViewController));
}

@end