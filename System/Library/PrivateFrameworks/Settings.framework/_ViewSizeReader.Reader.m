@interface _ViewSizeReader.Reader
- (_TtCV8Settings15_ViewSizeReader6Reader)initWithCoder:(id)a3;
- (_TtCV8Settings15_ViewSizeReader6Reader)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation _ViewSizeReader.Reader

- (_TtCV8Settings15_ViewSizeReader6Reader)initWithCoder:(id)a3
{
  result = (_TtCV8Settings15_ViewSizeReader6Reader *)sub_1E4DBE4D8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E4D88358();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  id v7 = v8.receiver;
  -[_ViewSizeReader.Reader viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EC0291E8);
  sub_1E4DBDD98();
  swift_unknownObjectRelease();
}

- (_TtCV8Settings15_ViewSizeReader6Reader)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtCV8Settings15_ViewSizeReader6Reader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end