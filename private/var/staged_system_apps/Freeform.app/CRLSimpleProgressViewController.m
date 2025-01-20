@interface CRLSimpleProgressViewController
- (NSProgress)progress;
- (_TtC8Freeform31CRLSimpleProgressViewController)initWithCoder:(id)a3;
- (_TtC8Freeform31CRLSimpleProgressViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CRLSimpleProgressViewController

- (NSProgress)progress
{
  return (NSProgress *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                               + OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_progress));
}

- (_TtC8Freeform31CRLSimpleProgressViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_progressObservation) = 0;
  *(void *)&self->progress[OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_isPresented) = 0;
  id v5 = a3;

  result = (_TtC8Freeform31CRLSimpleProgressViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLSimpleProgressViewController();
  v4 = v5.receiver;
  [(CRLSimpleProgressViewController *)&v5 viewDidAppear:v3];
  v4[OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_isPresented] = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLSimpleProgressViewController();
  v4 = v5.receiver;
  [(CRLSimpleProgressViewController *)&v5 viewWillDisappear:v3];
  v4[OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_isPresented] = 0;
}

- (void)loadView
{
  v2 = self;
  sub_100643A6C();
}

- (_TtC8Freeform31CRLSimpleProgressViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform31CRLSimpleProgressViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_progress));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_progressObservation));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC8Freeform31CRLSimpleProgressViewController_delegate;

  sub_100523398((uint64_t)v3);
}

@end