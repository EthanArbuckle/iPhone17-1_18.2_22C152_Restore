@interface LemonadePhotosChallengeItemListManager
- (_TtC12PhotosUICore38LemonadePhotosChallengeItemListManager)init;
- (void)invalidateGadgets;
- (void)navigateToGadget:(id)a3;
@end

@implementation LemonadePhotosChallengeItemListManager

- (void)navigateToGadget:(id)a3
{
  v5 = self;
  swift_unknownObjectRetain();
  v6 = self;
  id v7 = objc_msgSend(v5, sel_defaultCenter);
  id v8 = v7;
  if (qword_1E985F350 != -1)
  {
    swift_once();
    id v7 = v8;
  }
  objc_msgSend(v7, sel_postNotificationName_object_, qword_1E98CDFA8, a3);
  swift_unknownObjectRelease();
}

- (void)invalidateGadgets
{
}

- (_TtC12PhotosUICore38LemonadePhotosChallengeItemListManager)init
{
  result = (_TtC12PhotosUICore38LemonadePhotosChallengeItemListManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore38LemonadePhotosChallengeItemListManager_gadgetProvider));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12PhotosUICore38LemonadePhotosChallengeItemListManager_horizontalGadgetProvider);
}

@end