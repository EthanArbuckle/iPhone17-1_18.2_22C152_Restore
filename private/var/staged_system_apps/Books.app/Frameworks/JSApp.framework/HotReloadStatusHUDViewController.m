@interface HotReloadStatusHUDViewController
- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController)initWithCoder:(id)a3;
- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HotReloadStatusHUDViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_626E0();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_6286C();
}

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_86860();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_hudView) = 0;
    v6 = (Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_text);
    void *v6 = 0;
    v6[1] = 0;
    id v7 = a4;
    NSString v8 = sub_86830();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_hudView) = 0;
    v9 = (Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_text);
    void *v9 = 0;
    v9[1] = 0;
    id v10 = a4;
    NSString v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for HotReloadStatusHUDViewController();
  v11 = [(HotReloadStatusHUDViewController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_hudView) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_text);
  v6 = (objc_class *)type metadata accessor for HotReloadStatusHUDViewController();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(HotReloadStatusHUDViewController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5JSAppP33_E222B00B621AE7255E22C290E7F82EA232HotReloadStatusHUDViewController_hudView));

  swift_bridgeObjectRelease();
}

@end