@interface PlaybackTimeControl
- (_TtC9SeymourUI19PlaybackTimeControl)initWithCoder:(id)a3;
- (_TtC9SeymourUI19PlaybackTimeControl)initWithFrame:(CGRect)a3;
- (id)viewForBaselineLayout;
- (void)layoutSubviews;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PlaybackTimeControl

- (id)viewForBaselineLayout
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTimeLabel));
}

- (_TtC9SeymourUI19PlaybackTimeControl)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19PlaybackTimeControl *)sub_23A635198();
}

- (_TtC9SeymourUI19PlaybackTimeControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A635E28();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A634864();
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlaybackTimeControl();
  v2 = (char *)v5.receiver;
  [(PlaybackTimeControl *)&v5 tintColorDidChange];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTrackView];
  id v4 = objc_msgSend(v2, sel_tintColor, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setBackgroundColor_, v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_23A634A3C((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTrackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_remainingTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_remainingTrackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTimeLabelBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTrackViewWidthConstraint));
  id v3 = *(void **)((char *)&self->super.super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_style);
  id v4 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_style);
  objc_release(*(id *)((char *)&self->super.super._traitChangeRegistry
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_style));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_trackContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_trackMask));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_elapsedTimeFormatter));
  id v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI19PlaybackTimeControl_remainingTimeFormatter);
}

@end