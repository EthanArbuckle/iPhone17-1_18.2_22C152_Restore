@interface AmbientPhotoFrameEditorController
- (_TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController)init;
@end

@implementation AmbientPhotoFrameEditorController

- (_TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController_editor);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController_photoLibrary));
  sub_1AEB74BFC((uint64_t)self + OBJC_IVAR____TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController_environment, &qword_1E9A9E8F0);
  sub_1AEAA5868(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController_posterConfiguration), *(void *)&self->editor[OBJC_IVAR____TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController_posterConfiguration]);
  sub_1AEAA4BF4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController_originalContentConfiguration), *(void *)&self->editor[OBJC_IVAR____TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController_originalContentConfiguration], *(void *)&self->editor[OBJC_IVAR____TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController_originalContentConfiguration+ 8]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController_backgroundView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController_foregroundView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController_floatingView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController_keyAsset));
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15PhotosUIPrivate33AmbientPhotoFrameEditorController_pickerContainerViewController);
}

@end