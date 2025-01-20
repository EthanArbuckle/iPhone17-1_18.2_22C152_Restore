@interface FaceToFaceViewController
- (BOOL)prefersStatusBarHidden;
- (_TtC17SequoiaTranslator24FaceToFaceViewController)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator24FaceToFaceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)closeButtonPressed;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation FaceToFaceViewController

- (_TtC17SequoiaTranslator24FaceToFaceViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000E2F48();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000DFBAC();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for FaceToFaceViewController();
  id v4 = v10.receiver;
  [(FaceToFaceViewController *)&v10 viewWillAppear:v3];
  v5 = self;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  v9[4] = sub_1000E2F28;
  v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10008BA1C;
  v9[3] = &unk_1002CDE00;
  v7 = _Block_copy(v9);
  id v8 = v4;
  swift_release();
  [v5 animateWithDuration:v7 animations:0.25];
  _Block_release(v7);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  id v8 = self;
  sub_1000DFD98(a4, width, height);
  swift_unknownObjectRelease();
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  id v3 = [(FaceToFaceViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)closeButtonPressed
{
  v2 = self;
  sub_1000E2A24();
}

- (_TtC17SequoiaTranslator24FaceToFaceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17SequoiaTranslator24FaceToFaceViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_viewModel));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_sourceWindow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_targetWindow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_sourceViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_targetViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_closeBottomConstraint));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC17SequoiaTranslator24FaceToFaceViewController_onCloseTap);

  sub_1000324E4(v3);
}

@end