@interface PXEditCleanupFeedbackActionPerformer
- (BOOL)didLoadInjectedActionPerformer;
- (PXEditCleanupFeedbackActionPerformer)init;
- (PXEditCleanupFeedbackActionPerformer)initWithViewController:(id)a3;
- (id)actionIconForFeedbackType:(unint64_t)a3 hasResponse:(BOOL)a4;
- (void)reportFeedbackWithType:(unint64_t)a3 asset:(id)a4 originalImageData:(id)a5 renderedImageData:(id)a6 summaryString:(id)a7 completionHandler:(id)a8;
@end

@implementation PXEditCleanupFeedbackActionPerformer

- (PXEditCleanupFeedbackActionPerformer)initWithViewController:(id)a3
{
  id v3 = a3;
  v4 = (PXEditCleanupFeedbackActionPerformer *)sub_1A9D97008(v3);

  return v4;
}

- (BOOL)didLoadInjectedActionPerformer
{
  sub_1A9D966C0((uint64_t)self + OBJC_IVAR___PXEditCleanupFeedbackActionPerformer_actionPerformer, (uint64_t)v4);
  BOOL v2 = v5 != 0;
  sub_1A9D97394((uint64_t)v4, (unint64_t *)&unk_1E981C910, (void (*)(uint64_t))sub_1A9D96740);
  return v2;
}

- (void)reportFeedbackWithType:(unint64_t)a3 asset:(id)a4 originalImageData:(id)a5 renderedImageData:(id)a6 summaryString:(id)a7 completionHandler:(id)a8
{
  v13 = _Block_copy(a8);
  if (a5)
  {
    id v14 = a4;
    id v15 = a6;
    id v16 = a7;
    v17 = self;
    id v18 = a5;
    a5 = (id)sub_1AB2305DC();
    unint64_t v20 = v19;

    if (a6) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v21 = 0;
    unint64_t v23 = 0xF000000000000000;
    if (a7) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  id v27 = a4;
  id v28 = a6;
  id v29 = a7;
  v30 = self;
  unint64_t v20 = 0xF000000000000000;
  if (!a6) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v21 = sub_1AB2305DC();
  unint64_t v23 = v22;

  if (a7)
  {
LABEL_4:
    uint64_t v24 = sub_1AB23A76C();
    uint64_t v26 = v25;

    goto LABEL_8;
  }
LABEL_7:
  uint64_t v24 = 0;
  uint64_t v26 = 0;
LABEL_8:
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v13;
  sub_1A9D9683C(a3, a4, (uint64_t)a5, v20, v21, v23, v24, v26, (uint64_t)sub_1A9D5E1E4, v31);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1A9D4DEA0(v21, v23);
  sub_1A9D4DEA0((uint64_t)a5, v20);
}

- (id)actionIconForFeedbackType:(unint64_t)a3 hasResponse:(BOOL)a4
{
  BOOL v4 = a4;
  sub_1A9D966C0((uint64_t)self + OBJC_IVAR___PXEditCleanupFeedbackActionPerformer_actionPerformer, (uint64_t)&v13);
  if (v14)
  {
    sub_1A9BF709C(&v13, (uint64_t)v15);
    uint64_t v7 = v16;
    uint64_t v8 = v17;
    __swift_project_boxed_opaque_existential_1(v15, v16);
    v9 = *(uint64_t (**)(unint64_t, BOOL, uint64_t, uint64_t))(v8 + 8);
    v10 = self;
    v11 = (void *)v9(a3, v4, v7, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  }
  else
  {
    sub_1A9D97394((uint64_t)&v13, (unint64_t *)&unk_1E981C910, (void (*)(uint64_t))sub_1A9D96740);
    v11 = 0;
  }
  return v11;
}

- (PXEditCleanupFeedbackActionPerformer)init
{
  result = (PXEditCleanupFeedbackActionPerformer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end