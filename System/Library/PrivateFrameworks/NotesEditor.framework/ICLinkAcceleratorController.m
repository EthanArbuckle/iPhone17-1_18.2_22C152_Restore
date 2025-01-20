@interface ICLinkAcceleratorController
- (BOOL)handleArrowDown;
- (BOOL)handleArrowUp;
- (BOOL)handleUseCurrentSuggestion;
- (BOOL)isShowing;
- (ICLinkAcceleratorController)init;
- (ICLinkAcceleratorController)initWithCloudConfiguration:(id)a3 mode:(int64_t)a4;
- (ICLinkAcceleratorControllerDelegate)delegate;
- (ICLinkEditorDelegate)linkDelegate;
- (void)didSelectAutocompleteItem:(id)a3;
- (void)hideAccelerator;
- (void)presentLinkAcceleratorIfNecessaryWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsShowing:(BOOL)a3;
- (void)setLinkDelegate:(id)a3;
- (void)updateAcceleratorOriginWith:(CGRect)a3;
@end

@implementation ICLinkAcceleratorController

- (ICLinkAcceleratorController)initWithCloudConfiguration:(id)a3 mode:(int64_t)a4
{
  return (ICLinkAcceleratorController *)LinkAcceleratorController.init(cloudConfiguration:mode:)(a3, a4);
}

- (ICLinkAcceleratorControllerDelegate)delegate
{
  return (ICLinkAcceleratorControllerDelegate *)sub_20C010C94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICLinkAcceleratorController_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (ICLinkEditorDelegate)linkDelegate
{
  return (ICLinkEditorDelegate *)sub_20C010C94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICLinkAcceleratorController_linkDelegate);
}

- (void)setLinkDelegate:(id)a3
{
}

- (BOOL)isShowing
{
  v2 = (BOOL *)self + OBJC_IVAR___ICLinkAcceleratorController_isShowing;
  swift_beginAccess();
  return *v2;
}

- (void)setIsShowing:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___ICLinkAcceleratorController_isShowing;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)presentLinkAcceleratorIfNecessaryWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AD811C0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_20C162DD0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2676BC908;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2676BC4A0;
  v12[5] = v11;
  v13 = self;
  sub_20C014C5C((uint64_t)v7, (uint64_t)&unk_2676BC410, (uint64_t)v12);
  swift_release();
}

- (void)updateAcceleratorOriginWith:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = *(void (**)(double, double, double, double))((**(void **)((char *)&self->super.isa
                                                                            + OBJC_IVAR___ICLinkAcceleratorController_viewController) & *MEMORY[0x263F8EED0])
                                                             + 0x110);
  v8 = self;
  v7(x, y, width, height);
}

- (void)didSelectAutocompleteItem:(id)a3
{
  uint64_t v5 = sub_20C15F950();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  uint64_t v10 = self;
  sub_20C15F8C0();
  if (sub_20C15F8E0()) {
    sub_20C012F38();
  }
  else {
    sub_20C0137B0();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BOOL)handleArrowUp
{
  v2 = *(uint64_t (**)(void))((**(void **)((char *)&self->super.isa
                                          + OBJC_IVAR___ICLinkAcceleratorController_viewController) & *MEMORY[0x263F8EED0])
                           + 0x148);
  v3 = self;
  char v4 = v2();

  return v4 & 1;
}

- (BOOL)handleArrowDown
{
  v2 = *(uint64_t (**)(void))((**(void **)((char *)&self->super.isa
                                          + OBJC_IVAR___ICLinkAcceleratorController_viewController) & *MEMORY[0x263F8EED0])
                           + 0x130);
  v3 = self;
  char v4 = v2();

  return v4 & 1;
}

- (BOOL)handleUseCurrentSuggestion
{
  v2 = self;
  Swift::Bool v3 = LinkAcceleratorController.handleUseCurrentSuggestion()();

  return v3;
}

- (void)hideAccelerator
{
  v2 = self;
  LinkAcceleratorController.hideAccelerator()();
}

- (ICLinkAcceleratorController)init
{
  result = (ICLinkAcceleratorController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_20BFCEB78((uint64_t)self + OBJC_IVAR___ICLinkAcceleratorController_delegate);
  Swift::Bool v3 = (char *)self + OBJC_IVAR___ICLinkAcceleratorController_linkDelegate;

  sub_20BFCEB78((uint64_t)v3);
}

@end