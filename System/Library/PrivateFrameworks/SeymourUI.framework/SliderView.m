@interface SliderView
- (_TtC9SeymourUI10SliderView)initWithCoder:(id)a3;
- (_TtC9SeymourUI10SliderView)initWithFrame:(CGRect)a3;
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
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC9SeymourUI10SliderView_stackView], sel_setSemanticContentAttribute_, objc_msgSend(v4, sel_semanticContentAttribute, v5.receiver, v5.super_class));
}

- (_TtC9SeymourUI10SliderView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI10SliderView *)sub_23A788368(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI10SliderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A789C28();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A788C68();
}

- (void)panGestureRecognized:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_23A788FD8(v4);
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI10SliderView_onValueChanged));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI10SliderView____lazy_storage___panGestureRecognizer));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI10SliderView_styleProvider);
  id v4 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI10SliderView_styleProvider);
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC9SeymourUI10SliderView_styleProvider));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI10SliderView_elapsedTrackWidthConstraint));
  objc_super v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI10SliderView_trackHeightConstraint);
}

@end