@interface FMMapAnnotationView
- (BOOL)shouldShowCallout;
- (_TtC26FindMyNotificationsContent19FMMapAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtC26FindMyNotificationsContent19FMMapAnnotationView)initWithCoder:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_updateFromMap;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMMapAnnotationView

- (_TtC26FindMyNotificationsContent19FMMapAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = swift_unknownObjectRetain();
  return (_TtC26FindMyNotificationsContent19FMMapAnnotationView *)sub_10000CB04(v7, v4, v6);
}

- (_TtC26FindMyNotificationsContent19FMMapAnnotationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10000FA68();
}

- (void)prepareForDisplay
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  id v2 = v4.receiver;
  [(FMMapAnnotationView *)&v4 prepareForDisplay];
  if (objc_msgSend(v2, "annotation", v4.receiver, v4.super_class))
  {
    type metadata accessor for FMAnnotation();
    id v3 = (void *)swift_dynamicCastClass();
    if (v3) {
      sub_10000D784(v3);
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)_updateFromMap
{
  id v2 = self;
  sub_10000DD14();
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v6 = self;
  sub_10000E334(a3, a4);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = sub_10000EB1C((uint64_t)a4, x, y);

  return v10;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(FMMapAnnotationView *)&v6 traitCollectionDidChange:v4];
  sub_10000ED1C();
}

- (BOOL)shouldShowCallout
{
  id v2 = self;
  if ([(FMMapAnnotationView *)v2 isSelected])
  {
    char v3 = *((unsigned char *)&v2->super.super.super.super.isa
         + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_shouldHideCallout);

    char v4 = v3 ^ 1;
  }
  else
  {

    char v4 = 0;
  }
  return v4 & 1;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMMapAnnotationView();
  id v2 = (unsigned __int8 *)v4.receiver;
  [(FMMapAnnotationView *)&v4 prepareForReuse];
  [v2 setUserInteractionEnabled:1];
  v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_canShowBalloon] = 1;
  int v3 = v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated];
  v2[OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_isLiveAnimated] = 0;
  if (v3 == 1) {
    sub_10000F100();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerCircle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_centerImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_balloonImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_badgeImageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeCircleLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_stewieBadgeImageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_accuracyLayer));
  int v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC26FindMyNotificationsContent19FMMapAnnotationView_pulseLayer);
}

@end