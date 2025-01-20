@interface PXTipsHelper_Swift
+ (BOOL)hasInitializedTips;
+ (BOOL)isInitializingTips;
+ (BOOL)isTipInvalidated:(id)a3;
+ (NSDictionary)presentationDelegates;
+ (void)setHasInitializedTips:(BOOL)a3;
+ (void)setIsInitializingTips:(BOOL)a3;
+ (void)setPresentationDelegates:(id)a3;
+ (void)setTip:(id)a3 presentationDelegate:(id)a4;
- (NSString)presentedTipID;
- (PXTipsHelper_Swift)init;
- (UIViewController)tipPopover;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setPresentedTipID:(id)a3;
- (void)setTipPopover:(id)a3;
- (void)updatePopoverTip:(id)a3 sourceRect:(CGRect)a4;
@end

@implementation PXTipsHelper_Swift

- (PXTipsHelper_Swift)init
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PXTipsHelper_Swift_presentedTipID);
  void *v3 = 0;
  v3[1] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PXTipsHelper();
  return [(PXTipsHelper_Swift *)&v5 init];
}

+ (BOOL)isTipInvalidated:(id)a3
{
  sub_1AB23A76C();
  BOOL v3 = _s12PhotosUICore12PXTipsHelperC16isTipInvalidatedySbSSFZ_0();
  swift_bridgeObjectRelease();
  return v3;
}

+ (NSDictionary)presentationDelegates
{
  swift_beginAccess();
  if (qword_1E98CE428)
  {
    sub_1A9CEE9BC();
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  }
  return (NSDictionary *)0;
}

+ (void)setPresentationDelegates:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1A9CEE9BC();
    uint64_t v3 = sub_1AB23A4DC();
  }
  swift_beginAccess();
  qword_1E98CE428 = v3;
  swift_bridgeObjectRelease();
}

- (NSString)presentedTipID
{
  v2 = (char *)self + OBJC_IVAR___PXTipsHelper_Swift_presentedTipID;
  swift_beginAccess();
  if (*((void *)v2 + 1)) {
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  }
  return (NSString *)0;
}

- (void)setPresentedTipID:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1AB23A76C();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___PXTipsHelper_Swift_presentedTipID);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (UIViewController)tipPopover
{
  v2 = (char *)self + OBJC_IVAR___PXTipsHelper_Swift_tipPopover;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x1AD10DA80](v2);
  return (UIViewController *)v3;
}

- (void)setTipPopover:(id)a3
{
}

+ (BOOL)isInitializingTips
{
  return byte_1E98CDCE8;
}

+ (void)setIsInitializingTips:(BOOL)a3
{
  byte_1E98CDCE8 = a3;
}

+ (BOOL)hasInitializedTips
{
  return byte_1E98CE4D1;
}

+ (void)setHasInitializedTips:(BOOL)a3
{
  byte_1E98CE4D1 = a3;
}

+ (void)setTip:(id)a3 presentationDelegate:(id)a4
{
  uint64_t v5 = sub_1AB23A76C();
  uint64_t v7 = v6;
  swift_unknownObjectRetain();
  sub_1A9B3A8C4(v5, v7, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

- (void)updatePopoverTip:(id)a3 sourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v9 = sub_1AB23A76C();
  uint64_t v11 = v10;
  v12 = (void *)MEMORY[0x1E4FBC8C8];
  v13 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x60);
  v14 = self;
  uint64_t v15 = v13();
  if (!v16)
  {
LABEL_7:

    swift_bridgeObjectRelease();
    return;
  }
  if (v15 == v9 && v16 == v11)
  {
    uint64_t v19 = swift_bridgeObjectRelease();
  }
  else
  {
    char v18 = sub_1AB23C5AC();
    uint64_t v19 = swift_bridgeObjectRelease();
    if ((v18 & 1) == 0) {
      goto LABEL_7;
    }
  }
  v20 = (void *)(*(uint64_t (**)(uint64_t))((*v12 & (uint64_t)v14->super.isa) + 0x78))(v19);
  id v21 = objc_msgSend(v20, sel_popoverPresentationController);

  objc_msgSend(v21, sel_setSourceRect_, x, y, width, height);
  swift_bridgeObjectRelease();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s12PhotosUICore12PXTipsHelperC32presentationControllerDidDismissyySo014UIPresentationF0CF_0();
}

@end