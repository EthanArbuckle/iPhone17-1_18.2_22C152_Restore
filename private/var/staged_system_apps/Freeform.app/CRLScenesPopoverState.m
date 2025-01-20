@interface CRLScenesPopoverState
- (_TtC8Freeform21CRLScenesPopoverState)init;
@end

@implementation CRLScenesPopoverState

- (_TtC8Freeform21CRLScenesPopoverState)init
{
  return (_TtC8Freeform21CRLScenesPopoverState *)sub_1009CD688();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLScenesPopoverState__sceneInfos;
  uint64_t v4 = sub_1005057FC(&qword_10168A5D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLScenesPopoverState__sceneThumbnailImageSizeAspectRatio;
  uint64_t v6 = sub_1005057FC(&qword_10168A5D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLScenesPopoverState__activeScene;
  uint64_t v8 = sub_1005057FC(&qword_10168A5C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLScenesPopoverState__isReadOnly;
  uint64_t v10 = sub_1005057FC(&qword_10169FCE0);
  v12 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v12)((void *)(v10 - 8), v9, v10);
  v12((char *)self + OBJC_IVAR____TtC8Freeform21CRLScenesPopoverState__isCurrentlyEditing, v10);
  v11 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLScenesPopoverState__toggleToUpdateSceneThumbnails;

  v12(v11, v10);
}

@end