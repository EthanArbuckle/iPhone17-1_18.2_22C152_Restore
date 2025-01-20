@interface TTRIHashtagEditorViewController
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (_TtC15RemindersUICore31TTRIHashtagEditorViewController)initWithCoder:(id)a3;
- (_TtC15RemindersUICore31TTRIHashtagEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15RemindersUICore31TTRIHashtagEditorViewController)initWithStyle:(int64_t)a3;
- (void)didTapCancel:(id)a3;
- (void)didTapCommit:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TTRIHashtagEditorViewController

- (_TtC15RemindersUICore31TTRIHashtagEditorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B940E554();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B9408334();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = v6.receiver;
  [(TTRIHashtagEditorViewController *)&v6 viewWillDisappear:v3];
  if ((v4[OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_style + 8] & 1) == 0
    && (v4[OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_style] & 1) != 0)
  {
    memset(v5, 0, sizeof(v5));
    sub_1B94089A0();
    sub_1B90CCA68((uint64_t)v5, &qword_1EB9B4D10);
  }
}

- (void)didTapCommit:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1B94089A0();

  sub_1B90CCA68((uint64_t)v6, &qword_1EB9B4D10);
}

- (void)didTapCancel:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9AD960);
  MEMORY[0x1F4188790](v4 - 8);
  objc_super v6 = &v14[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_unknownObjectRetain();
  v7 = self;
  sub_1B9970200();
  swift_unknownObjectRelease();
  uint64_t v8 = *(uint64_t *)((char *)&v7->super.super.super.super.isa
                  + OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_presenter);
  if (qword_1E9EFA5D8 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_1B996D300();
  __swift_project_value_buffer(v9, (uint64_t)qword_1E9F00BD8);
  sub_1B90C4268(MEMORY[0x1E4FBC860]);
  sub_1B984E260();
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_1B996F0D0();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  sub_1B996F080();
  swift_retain();
  uint64_t v11 = sub_1B996F070();
  uint64_t v12 = swift_allocObject();
  uint64_t v13 = MEMORY[0x1E4FBCFD8];
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = v13;
  *(void *)(v12 + 32) = v8;
  *(unsigned char *)(v12 + 40) = 1;
  sub_1B91147FC((uint64_t)v6, (uint64_t)&unk_1E9F00B90, v12);

  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
}

- (_TtC15RemindersUICore31TTRIHashtagEditorViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC15RemindersUICore31TTRIHashtagEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15RemindersUICore31TTRIHashtagEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15RemindersUICore31TTRIHashtagEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_commitButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_contentSizeObserver));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_tableDataController));
  swift_release();
  swift_release();

  swift_release();
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  char v6 = sub_1B9410C3C();

  return (v6 & 1) == 0;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9AD960);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_presenter);
  uint64_t v9 = qword_1E9EFA5D8;
  id v10 = a3;
  uint64_t v11 = self;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1B996D300();
  __swift_project_value_buffer(v12, (uint64_t)qword_1E9F00BD8);
  sub_1B90C4268(MEMORY[0x1E4FBC860]);
  sub_1B984E260();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_1B996F0D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
  sub_1B996F080();
  swift_retain();
  uint64_t v14 = sub_1B996F070();
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = MEMORY[0x1E4FBCFD8];
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v16;
  *(void *)(v15 + 32) = v8;
  *(unsigned char *)(v15 + 40) = 1;
  sub_1B91147FC((uint64_t)v7, (uint64_t)&unk_1E9F00B88, v15);

  swift_release();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9AD960);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC15RemindersUICore31TTRIHashtagEditorViewController_presenter);
  uint64_t v9 = qword_1E9EFA5D8;
  id v10 = a3;
  uint64_t v11 = self;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1B996D300();
  __swift_project_value_buffer(v12, (uint64_t)qword_1E9F00BD8);
  sub_1B90C4268(MEMORY[0x1E4FBC860]);
  sub_1B984E260();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_1B996F0D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v7, 1, 1, v13);
  sub_1B996F080();
  swift_retain();
  uint64_t v14 = sub_1B996F070();
  uint64_t v15 = swift_allocObject();
  uint64_t v16 = MEMORY[0x1E4FBCFD8];
  *(void *)(v15 + 16) = v14;
  *(void *)(v15 + 24) = v16;
  *(void *)(v15 + 32) = v8;
  *(unsigned char *)(v15 + 40) = 0;
  sub_1B91147FC((uint64_t)v7, (uint64_t)&unk_1E9F00B80, v15);

  swift_release();
}

@end