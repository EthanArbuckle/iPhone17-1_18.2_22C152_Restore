@interface MedicalIDViewFactory
- (UIScrollView)scrollView;
- (_TtC11MedicalIDUI20MedicalIDViewFactory)init;
- (id)makeHostingControllerWithHealthStore:(id)a3 medicalIDData:(id)a4 displayConfiguration:(id)a5;
- (void)setScrollView:(id)a3;
@end

@implementation MedicalIDViewFactory

- (UIScrollView)scrollView
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC11MedicalIDUI20MedicalIDViewFactory_scrollView);
  swift_beginAccess();
  return (UIScrollView *)*v2;
}

- (void)setScrollView:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC11MedicalIDUI20MedicalIDViewFactory_scrollView);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC11MedicalIDUI20MedicalIDViewFactory)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MedicalIDUI20MedicalIDViewFactory_scrollView) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(MedicalIDViewFactory *)&v5 init];
}

- (id)makeHostingControllerWithHealthStore:(id)a3 medicalIDData:(id)a4 displayConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = MedicalIDViewFactory.makeHostingController(healthStore:medicalIDData:displayConfiguration:)(v8, a4, v10);

  return v12;
}

- (void).cxx_destruct
{
}

@end