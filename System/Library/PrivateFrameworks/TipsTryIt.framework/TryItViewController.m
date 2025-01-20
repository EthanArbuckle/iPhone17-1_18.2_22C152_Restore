@interface TryItViewController
- (TryItViewController)initWithCoder:(id)a3;
- (TryItViewController)initWithLessonURL:(id)a3 tipID:(id)a4 collectionID:(id)a5 correlationID:(id)a6;
- (TryItViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TryItViewControllerDelegate)delegate;
- (double)preferredContentSize;
- (void)loadView;
- (void)logEndSession;
- (void)setDelegate:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation TryItViewController

- (TryItViewControllerDelegate)delegate
{
  v2 = (void *)swift_unknownObjectRetain();
  return (TryItViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TryItViewController_delegate) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (TryItViewController)initWithLessonURL:(id)a3 tipID:(id)a4 collectionID:(id)a5 correlationID:(id)a6
{
  uint64_t v9 = sub_25F78AFB0();
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25F78AF90();
  if (a4)
  {
    a4 = (id)sub_25F78BFD0();
    uint64_t v13 = v12;
    if (a5) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v15 = 0;
    if (a6) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v16 = 0;
    uint64_t v18 = 0;
    return (TryItViewController *)TryItViewController.init(lessonURL:tipID:collectionID:correlationID:)((uint64_t)v11, (uint64_t)a4, v13, (uint64_t)a5, v15, v16, v18);
  }
  uint64_t v13 = 0;
  if (!a5) {
    goto LABEL_6;
  }
LABEL_3:
  a5 = (id)sub_25F78BFD0();
  uint64_t v15 = v14;
  if (!a6) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v16 = sub_25F78BFD0();
  uint64_t v18 = v17;
  return (TryItViewController *)TryItViewController.init(lessonURL:tipID:collectionID:correlationID:)((uint64_t)v11, (uint64_t)a4, v13, (uint64_t)a5, v15, v16, v18);
}

- (TryItViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TryItViewController_hostingController) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TryItViewController_delegate) = 0;
  v5 = (char *)self + OBJC_IVAR___TryItViewController_tryItView;
  uint64_t v6 = type metadata accessor for TipsTryItView();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (TryItViewController *)sub_25F78C380();
  __break(1u);
  return result;
}

- (void)logEndSession
{
  v2 = self;
  sub_25F76E5D8();
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TryItViewController();
  -[TryItViewController setPreferredContentSize:](&v5, sel_setPreferredContentSize_, width, height);
}

- (void)loadView
{
  v2 = self;
  sub_25F76E7F4();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TryItViewController();
  v4 = (char *)v6.receiver;
  [(TryItViewController *)&v6 viewDidDisappear:v3];
  objc_super v5 = *(void **)&v4[OBJC_IVAR___TryItViewController_delegate];
  if (v5) {
    objc_msgSend(v5, sel_tryItViewControllerDidDismissWithTryItViewController_, v4, v6.receiver, v6.super_class);
  }
}

- (TryItViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (TryItViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  BOOL v3 = (char *)self + OBJC_IVAR___TryItViewController_tryItView;
  sub_25F76EED4((uint64_t)v3);
}

- (double)preferredContentSize
{
  v0 = self;
  id v1 = objc_msgSend(v0, sel_mainScreen);
  objc_msgSend(v1, sel_bounds);
  double v3 = v2;

  if (v3 <= 744.0
    && (id v4 = objc_msgSend(v0, sel_mainScreen),
        objc_msgSend(v4, sel_bounds),
        double v6 = v5,
        v4,
        v6 <= 1133.0))
  {
    return 644.0;
  }
  else
  {
    return 704.0;
  }
}

@end