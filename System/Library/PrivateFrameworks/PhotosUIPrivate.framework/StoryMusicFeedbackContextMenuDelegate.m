@interface StoryMusicFeedbackContextMenuDelegate
- (_TtC15PhotosUIPrivate37StoryMusicFeedbackContextMenuDelegate)init;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
@end

@implementation StoryMusicFeedbackContextMenuDelegate

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_1AEB96570();

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_1AEB96FCC(v6);

  return v9;
}

- (_TtC15PhotosUIPrivate37StoryMusicFeedbackContextMenuDelegate)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate37StoryMusicFeedbackContextMenuDelegate_storyViewModel));
  swift_release();
  swift_unknownObjectWeakDestroy();
}

@end