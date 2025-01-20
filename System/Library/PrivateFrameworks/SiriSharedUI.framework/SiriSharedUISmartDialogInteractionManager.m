@interface SiriSharedUISmartDialogInteractionManager
- (_TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager)init;
- (id)presentingViewController;
- (void)didEndEditing;
- (void)informHostOfViewResize:(CGSize)a3;
- (void)navigateWithPluginModelData:(id)a3 bundleName:(id)a4;
- (void)navigateWithResponseData:(id)a3;
- (void)performAceCommand:(id)a3;
- (void)performSFCommand:(id)a3;
- (void)performShowResponse:(id)a3;
- (void)submitIFMessagePayload:(id)a3;
- (void)willBeginEditing;
@end

@implementation SiriSharedUISmartDialogInteractionManager

- (void)performAceCommand:(id)a3
{
  swift_getObjectType();
  id v5 = a3;
  v6 = self;
  sub_20CA60738(v5, (uint64_t)v6);
}

- (void)performSFCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_20CA5DCC8(v4);
}

- (void)performShowResponse:(id)a3
{
}

- (void)submitIFMessagePayload:(id)a3
{
}

- (void)navigateWithResponseData:(id)a3
{
}

- (void)navigateWithPluginModelData:(id)a3 bundleName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11 = self;
  uint64_t v8 = sub_20CA81CD8();
  unint64_t v10 = v9;

  sub_20CA82F08();
  sub_20CA5FB5C();
  swift_bridgeObjectRelease();
  sub_20CA0B4A0(v8, v10);
}

- (void)informHostOfViewResize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_20CA5FD88(width, height);
}

- (void)willBeginEditing
{
}

- (void)didEndEditing
{
}

- (id)presentingViewController
{
  id v2 = (id)MEMORY[0x210553300]((char *)self+ OBJC_IVAR____TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager_popoverViewController, a2);
  if (!v2) {
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82E10]), sel_init);
  }
  return v2;
}

- (_TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager)init
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager_isLoadingCard) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager_previousCard) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SiriSharedUISmartDialogInteractionManager();
  return [(SiriSharedUISmartDialogInteractionManager *)&v4 init];
}

- (void).cxx_destruct
{
  sub_20CA202D4((uint64_t)self + OBJC_IVAR____TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager_delegate);
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12SiriSharedUI41SiriSharedUISmartDialogInteractionManager_previousCard);
}

@end