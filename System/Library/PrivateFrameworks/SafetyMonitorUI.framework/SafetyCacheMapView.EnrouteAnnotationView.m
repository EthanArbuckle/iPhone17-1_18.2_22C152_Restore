@interface SafetyCacheMapView.EnrouteAnnotationView
- (MKAnnotation)annotation;
- (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView)initWithCoder:(id)a3;
- (void)prepareForReuse;
- (void)setAnnotation:(id)a3;
@end

@implementation SafetyCacheMapView.EnrouteAnnotationView

- (MKAnnotation)annotation
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(MKAnnotationView *)&v4 annotation];
  return v2;
}

- (void)setAnnotation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  id v4 = v5.receiver;
  [(MKAnnotationView *)&v5 setAnnotation:a3];
  sub_25B8705D0();

  swift_unknownObjectRelease();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_25B870A90();
}

- (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_25B8FFF78();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView_annotationHostingController) = 0;
    swift_unknownObjectRetain();
    a4 = (id)sub_25B8FFF68();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView_annotationHostingController) = 0;
    swift_unknownObjectRetain();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = [(MKAnnotationView *)&v10 initWithAnnotation:a3 reuseIdentifier:a4];

  swift_unknownObjectRelease();
  return v8;
}

- (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView_annotationHostingController) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(MKAnnotationView *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118621EnrouteAnnotationView_annotationHostingController));
}

@end