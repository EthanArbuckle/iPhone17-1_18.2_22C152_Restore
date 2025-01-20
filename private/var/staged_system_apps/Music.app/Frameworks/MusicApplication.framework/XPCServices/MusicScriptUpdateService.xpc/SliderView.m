@interface SliderView
- (_TtC11MusicCoreUI10SliderView)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI10SliderView)initWithFrame:(CGRect)a3;
- (int64_t)semanticContentAttribute;
- (void)layoutSubviews;
- (void)panGestureRecognized:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
@end

@implementation SliderView

- (int64_t)semanticContentAttribute
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SliderView();
  return [(SliderView *)&v3 semanticContentAttribute];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SliderView();
  v4 = (char *)v5.receiver;
  [(SliderView *)&v5 setSemanticContentAttribute:a3];
  [*(id *)&v4[OBJC_IVAR____TtC11MusicCoreUI10SliderView_stackView] setSemanticContentAttribute:[v4 semanticContentAttribute]];
}

- (_TtC11MusicCoreUI10SliderView)initWithFrame:(CGRect)a3
{
  return (_TtC11MusicCoreUI10SliderView *)sub_100429768(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MusicCoreUI10SliderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10042B59C();
}

- (void)layoutSubviews
{
  v2 = self;
  SliderView.layoutSubviews()();
}

- (void)panGestureRecognized:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_10042A5A8(v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI10SliderView_elapsedTrackWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI10SliderView_trackHeightConstraint));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI10SliderView____lazy_storage___panRecognizer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI10SliderView_remainingTrackColor));

  sub_10004CAE0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11MusicCoreUI10SliderView_valueChangedHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MusicCoreUI10SliderView_cancelledHandler);

  sub_10004CAE0(v3);
}

@end