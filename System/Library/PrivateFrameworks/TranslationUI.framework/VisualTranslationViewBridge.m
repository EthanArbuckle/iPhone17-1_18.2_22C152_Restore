@interface VisualTranslationViewBridge
+ (void)isTranslatable:(id)a3 completion:(id)a4;
- (UIView)view;
- (_TtC13TranslationUI27VisualTranslationViewBridge)init;
- (id)dismissHandler;
- (void)dismissErrorUI;
- (void)setDismissHandler:(id)a3;
- (void)setPresentationAnchorWithRect:(CGRect)a3 contentRect:(CGRect)a4;
- (void)setZoomScale:(double)a3;
- (void)showDebugMenu;
- (void)translate:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 completion:(id)a6;
@end

@implementation VisualTranslationViewBridge

- (void)setPresentationAnchorWithRect:(CGRect)a3 contentRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  v12 = self;
  v14.origin.CGFloat x = v11;
  v14.origin.CGFloat y = v10;
  v14.size.CGFloat width = v9;
  v14.size.CGFloat height = v8;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  VisualTranslationViewBridge.setPresentationAnchor(rect:contentRect:)(v14, v15);
}

- (void)dismissErrorUI
{
  v2 = self;
  VisualTranslationViewBridge.dismissErrorUI()();
}

- (id)dismissHandler
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI27VisualTranslationViewBridge_dismissHandler);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DB168FE0;
    aBlock[3] = &block_descriptor_139;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setDismissHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1DB1EE088;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13TranslationUI27VisualTranslationViewBridge_dismissHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1DB0EB788(v7);
}

- (_TtC13TranslationUI27VisualTranslationViewBridge)init
{
  return (_TtC13TranslationUI27VisualTranslationViewBridge *)VisualTranslationViewBridge.init()();
}

- (UIView)view
{
  v2 = self;
  id v3 = sub_1DB1DF608();
  id v4 = objc_msgSend(v3, sel_view);

  return (UIView *)v4;
}

+ (void)isTranslatable:(id)a3 completion:(id)a4
{
  id v4 = _Block_copy(a4);
  sub_1DB0E2EFC(0, &qword_1EBA4E580);
  uint64_t v5 = sub_1DB1F14A0();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  type metadata accessor for VisualTranslationService();
  static VisualTranslationService.isTranslatable(_:completion:)(v5, (uint64_t)sub_1DB1CE7E8, v6);
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)translate:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 completion:(id)a6
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA4E570);
  MEMORY[0x1F4188790](v10 - 8);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v13);
  __C::CGRect v15 = (char *)&v24 - v14;
  v16 = _Block_copy(a6);
  sub_1DB0E2EFC(0, &qword_1EBA4E580);
  uint64_t v17 = sub_1DB1F14A0();
  if (a4)
  {
    sub_1DB1EF5F0();
    uint64_t v18 = sub_1DB1EF6B0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = sub_1DB1EF6B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v15, 1, 1, v19);
  }
  if (a5)
  {
    sub_1DB1EF5F0();
    uint64_t v20 = sub_1DB1EF6B0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v12, 0, 1, v20);
  }
  else
  {
    uint64_t v21 = sub_1DB1EF6B0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v12, 1, 1, v21);
  }
  if (v16)
  {
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v16;
    v16 = sub_1DB1EE080;
  }
  else
  {
    uint64_t v22 = 0;
  }
  v23 = self;
  VisualTranslationViewBridge.translate(_:sourceLocale:targetLocale:completion:)(v17, (uint64_t)v15, (uint64_t)v12, (uint64_t)v16, v22);
  sub_1DB0EB788((uint64_t)v16);
  swift_bridgeObjectRelease();

  sub_1DB0E8BD4((uint64_t)v12, &qword_1EBA4E570);
  sub_1DB0E8BD4((uint64_t)v15, &qword_1EBA4E570);
}

- (void)showDebugMenu
{
  v2 = self;
  if (_LTIsInternalInstall())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_1DB1EF920();
  }
  else
  {
  }
}

- (void)setZoomScale:(double)a3
{
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI27VisualTranslationViewBridge_observable);
  type metadata accessor for VisualTranslationObservable(0);
  sub_1DB1EB168(&qword_1EA905FB8, (void (*)(uint64_t))type metadata accessor for VisualTranslationObservable);
  uint64_t v6 = self;
  sub_1DB1EF8B0();
  sub_1DB1EF8C0();
  swift_release();
  if (a3 <= 0.0) {
    a3 = COERCE_DOUBLE(1);
  }
  uint64_t v7 = (double *)(v5 + OBJC_IVAR____TtC13TranslationUI27VisualTranslationObservable_zoomScale);
  swift_beginAccess();
  *uint64_t v7 = a3;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1DB0EB788(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13TranslationUI27VisualTranslationViewBridge_dismissHandler));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13TranslationUI27VisualTranslationViewBridge____lazy_storage___hostingController);
}

@end