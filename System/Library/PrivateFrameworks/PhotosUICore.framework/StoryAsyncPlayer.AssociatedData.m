@interface StoryAsyncPlayer.AssociatedData
- (_TtCC12PhotosUICore16StoryAsyncPlayerP33_89E403FA1DBB71A40DD90C42439721F414AssociatedData)init;
@end

@implementation StoryAsyncPlayer.AssociatedData

- (_TtCC12PhotosUICore16StoryAsyncPlayerP33_89E403FA1DBB71A40DD90C42439721F414AssociatedData)init
{
}

- (void).cxx_destruct
{
  v2 = (char *)self
     + OBJC_IVAR____TtCC12PhotosUICore16StoryAsyncPlayerP33_89E403FA1DBB71A40DD90C42439721F414AssociatedData_previewPlayersList;
  sub_1A9BF7288(0, &qword_1E981EA18, type metadata accessor for PhotosCollectionPreviewPlayer, (uint64_t (*)(uint64_t, uint64_t))off_1E5DA18F0);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end