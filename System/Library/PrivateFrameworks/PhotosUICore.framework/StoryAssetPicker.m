@interface StoryAssetPicker
- (_TtC12PhotosUICore16StoryAssetPicker)init;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)storyPickerHelper:(id)a3 didFinishPicking:(id)a4 promotedAssets:(id)a5 demotedAssets:(id)a6;
@end

@implementation StoryAssetPicker

- (_TtC12PhotosUICore16StoryAssetPicker)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore16StoryAssetPicker_pickerHelper) = 0;
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore16StoryAssetPicker_completion);
  void *v2 = 0;
  v2[1] = 0;

  result = (_TtC12PhotosUICore16StoryAssetPicker *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (void)storyPickerHelper:(id)a3 didFinishPicking:(id)a4 promotedAssets:(id)a5 demotedAssets:(id)a6
{
  id v10 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v11 = self;
  sub_1AA93EBC4(v10, (uint64_t)a4, a5, a6);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore16StoryAssetPicker_completion);
  sub_1A9BB8934(v3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  StoryAssetPicker.presentationControllerDidDismiss(_:)((UIPresentationController)v4);
}

@end