@interface TabSwitcher.BarBackgroundView
- (BOOL)isHidden;
- (_TtCC12MobileSafari11TabSwitcher17BarBackgroundView)initWithCoder:(id)a3;
- (_TtCC12MobileSafari11TabSwitcher17BarBackgroundView)initWithFrame:(CGRect)a3;
- (void)configurationDidChange;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation TabSwitcher.BarBackgroundView

- (void)sceneWillEnterForeground:(id)a3
{
  uint64_t v4 = sub_18C6F7FE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F7FB8();
  v8 = self;
  if (sub_18C3642DC())
  {
    char v9 = *((unsigned char *)&v8->super.super.super.isa
         + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentFadeOutRenderingMode);
    *((unsigned char *)&v8->super.super.super.isa
    + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentFadeOutRenderingMode) = 1;
    if ((v9 & 1) == 0) {
      sub_18C3D9704();
    }
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_s17BarBackgroundViewCMa();
  uint64_t v4 = (char *)v6.receiver;
  [(TabSwitcher.BarBackgroundView *)&v6 setHidden:v3];
  if (v4[OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_coordinatesGroupBackdropCaptureView] == 1)
  {
    uint64_t v5 = (char *)*(id *)&v4[OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_group + 48];
    objc_msgSend(v5, sel_setHidden_, objc_msgSend(v4, sel_isHidden, v6.receiver, v6.super_class));

    uint64_t v4 = v5;
  }
}

- (BOOL)isHidden
{
  v3.receiver = self;
  v3.super_class = (Class)_s17BarBackgroundViewCMa();
  return [(TabSwitcher.BarBackgroundView *)&v3 isHidden];
}

- (_TtCC12MobileSafari11TabSwitcher17BarBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18C570278();
}

- (void)configurationDidChange
{
  v2 = self;
  sub_18C3D9704();
}

- (void)sceneDidEnterBackground:(id)a3
{
  uint64_t v4 = sub_18C6F7FE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F7FB8();
  v8 = self;
  if (sub_18C3642DC())
  {
    int v9 = *((unsigned __int8 *)&v8->super.super.super.isa
         + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentFadeOutRenderingMode);
    *((unsigned char *)&v8->super.super.super.isa
    + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentFadeOutRenderingMode) = 0;
    if (v9 == 1) {
      sub_18C3D9704();
    }
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_18C56F578(a3);
}

- (_TtCC12MobileSafari11TabSwitcher17BarBackgroundView)initWithFrame:(CGRect)a3
{
  result = (_TtCC12MobileSafari11TabSwitcher17BarBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(void **)((char *)&self->super._viewFlags
                + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_configuration);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v4 = *(_UITraitChangeRegistry **)((char *)&self->super._traitChangeRegistry
                                  + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_group);
  objc_release(*(id *)((char *)&self->super._layerRetained
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_group));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_backgroundMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_backgroundMaterialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentScribbleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_contentMaterialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_separator));
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher17BarBackgroundView_systemMaterialView);
}

@end