@interface PlayControlsStackView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGSize)intrinsicContentSize;
- (UIButton)accessibilityPlayPauseButton;
- (_TtC23ShelfKitCollectionViews10PlayButton)accessibilityNewPlayPauseButton;
- (_TtC23ShelfKitCollectionViews18PlaybackStatusView)accessibilityPlaybackStatusView;
- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)initWithFrame:(CGRect)a3;
- (_TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView)accessibilityEpisodeStateControls;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)accessibilityPlayButtonState;
- (void)performPlayPauseAction;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setAccessibilityPlayButtonState:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PlayControlsStackView

- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)initWithFrame:(CGRect)a3
{
}

- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_154294();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  PlayControlsStackView.traitCollectionDidChange(_:)(v9);
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2 = qword_46FDA8;
  id v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_477BC0;

  double v5 = UIViewNoIntrinsicMetric;
  double v6 = *(double *)&v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (int64_t)accessibilityPlayButtonState
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_accessibilityPlayButtonState);
}

- (void)setAccessibilityPlayButtonState:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_accessibilityPlayButtonState) = (Class)a3;
  id v3 = self;
  sub_380DC0();
  sub_380DC0();
}

- (void).cxx_destruct
{
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playPauseAction, &qword_476390);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_oldPlayPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playbackStatusView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_episodeStateControls));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_infoLabel));
  swift_release();
  sub_154940((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_delegate);

  swift_release();
}

- (UIButton)accessibilityPlayPauseButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_oldPlayPauseButton));
}

- (_TtC23ShelfKitCollectionViews10PlayButton)accessibilityNewPlayPauseButton
{
  return (_TtC23ShelfKitCollectionViews10PlayButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                              + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playButton));
}

- (_TtC23ShelfKitCollectionViews18PlaybackStatusView)accessibilityPlaybackStatusView
{
  return (_TtC23ShelfKitCollectionViews18PlaybackStatusView *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playbackStatusView);
}

- (_TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView)accessibilityEpisodeStateControls
{
  return (_TtC23ShelfKitCollectionViews29EpisodeStateControlsStackView *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_episodeStateControls);
}

- (void)performPlayPauseAction
{
  uint64_t v2 = self;
  PlayControlsStackView.performPlayPauseAction()();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = self;
  [v4 locationInView:v5];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  uint64_t v10 = OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_episodeStateControls;
  [*(id *)((char *)&v5->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_episodeStateControls) frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [*(id *)((char *)&v5->super.super.super.super.isa + v10) hitTestInsets];
  v23.origin.x = UIEdgeInsetsInsetRect(v12, v14, v16, v18, v19, v20);
  v22.x = v7;
  v22.y = v9;
  LOBYTE(v10) = CGRectContainsPoint(v23, v22);

  return v10 ^ 1;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  CGFloat v9 = (void *)_s23ShelfKitCollectionViews21PlayControlsStackViewC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0mJ0C_So0M6RegionCtF_0(v6);

  return v9;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v7 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playControlsPresenter);
  v7[57] = 1;
  char v8 = v7[73];
  uint64_t v9 = v7[72];
  id v10 = a3;
  id v11 = a4;
  swift_unknownObjectRetain();
  double v12 = self;
  sub_34A474(v8, v9, 1);

  swift_unknownObjectRelease();
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v7 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews21PlayControlsStackView_playControlsPresenter);
  v7[57] = 0;
  char v8 = v7[73];
  uint64_t v9 = v7[72];
  id v10 = a3;
  id v11 = a4;
  swift_unknownObjectRetain();
  double v12 = self;
  sub_34A474(v8, v9, 0);

  swift_unknownObjectRelease();
}

@end