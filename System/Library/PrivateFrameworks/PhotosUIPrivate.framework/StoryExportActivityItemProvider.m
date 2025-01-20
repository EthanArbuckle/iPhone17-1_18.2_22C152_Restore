@interface StoryExportActivityItemProvider
- (_TtC15PhotosUIPrivate31StoryExportActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)item;
- (void)cancel;
@end

@implementation StoryExportActivityItemProvider

- (_TtC15PhotosUIPrivate31StoryExportActivityItemProvider)initWithPlaceholderItem:(id)a3
{
}

- (id)item
{
  v2 = self;
  sub_1AEA3362C((uint64_t)v5);

  __swift_project_boxed_opaque_existential_0Tm(v5, v5[3]);
  v3 = (void *)sub_1AEF97E10();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v5);
  return v3;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1AEA33B38();

  v9 = (void *)sub_1AEF96DA0();
  swift_bridgeObjectRelease();
  return v9;
}

- (void)cancel
{
  v2 = self;
  sub_1AEA34DEC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate31StoryExportActivityItemProvider_storyConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate31StoryExportActivityItemProvider_aspectRatio));
  sub_1AEF93780();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_8_4();
  v3();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate31StoryExportActivityItemProvider_exportManager));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate31StoryExportActivityItemProvider_fullSizePlayerExtendedTraitCollectionSnapshot));
  swift_unknownObjectWeakDestroy();
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate31StoryExportActivityItemProvider_delegate);
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivate31StoryExportActivityItemProvider_progressController);
}

@end