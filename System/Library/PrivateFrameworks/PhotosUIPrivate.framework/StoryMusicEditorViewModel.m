@interface StoryMusicEditorViewModel
- (_TtC15PhotosUIPrivate25StoryMusicEditorViewModel)init;
@end

@implementation StoryMusicEditorViewModel

- (_TtC15PhotosUIPrivate25StoryMusicEditorViewModel)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel_storyViewModel));

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1AEA1FDC4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel_selectionHandler));
  sub_1AEA1FDC4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel_cancelHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel____lazy_storage___flexMusicCollectionsLoadingQueue));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A9F540);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_8_4();
  v3();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A9F538);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_8_4();
  v4();
  sub_1AEA1D45C(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel_songCollectionLoadingState));
  sub_1AEA1FDC4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel_songCollectionLoadedCompletionHandler));
  v5 = (char *)self + OBJC_IVAR____TtC15PhotosUIPrivate25StoryMusicEditorViewModel_actionPerformerDelegate;
  sub_1AEA2489C((uint64_t)v5);
}

@end