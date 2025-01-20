@interface BKAudiobookNowPlayingMiniTouchView
- (BKAudiobookNowPlayingMiniTouchView)initWithCoder:(id)a3;
- (BKAudiobookNowPlayingMiniTouchView)initWithFrame:(CGRect)a3;
- (BOOL)transitionHasCustomArtwork;
- (CGRect)transitionCoverFrame;
- (NSArray)accessibilityElements;
- (NSString)accessibilityLabel;
- (double)coverCornerRadius;
- (double)transitionCoverImagePlayControlShadowOpacityValue;
- (double)transitionToolbarAlpha;
- (id)transitionBackgroundImageView;
- (id)transitionContentView;
- (id)transitionControlsViews;
- (id)transitionCoverImagePlayControl;
- (id)transitionCoverViews;
- (id)transitionCurrentCoverImage;
- (id)transitionToolbarViews;
- (int64_t)coverContentMode;
- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4;
- (void)setAccessibilityLabel:(id)a3;
- (void)skipBackwardEnd;
- (void)skipBackwardStart;
- (void)skipForwardEnd;
- (void)skipForwardStart;
- (void)togglePlaying;
- (void)willMoveToWindow:(id)a3;
@end

@implementation BKAudiobookNowPlayingMiniTouchView

- (void)willMoveToWindow:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AudiobookNowPlayingMiniTouchView();
  id v4 = v11.receiver;
  id v5 = a3;
  [(BKAudiobookNowPlayingMiniTouchView *)&v11 willMoveToWindow:v5];
  id v6 = sub_1005FFFD8();
  id v7 = [v6 layer];

  double v8 = 1.0;
  if (v5)
  {
    id v9 = [v5 screen];
    [v9 scale];
    double v8 = v10;
  }
  [v7 setBorderWidth:1.0 / v8];
}

- (void)_traitCollectionDidChangeWithSender:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  id v7 = self;
  sub_1007FEEC0();
  swift_unknownObjectRelease();
  [*(id *)((char *)&v7->super.super.super.isa + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_titleLabel) invalidateIntrinsicContentSize];
  [*(id *)((char *)&v7->super.super.super.isa + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_subtitleLabel) invalidateIntrinsicContentSize];
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  [Strong invalidateIntrinsicContentSize];

  sub_100603CFC();
  _s5Books15CurrentPageViewVwxx_0((uint64_t)&v9);
}

- (BKAudiobookNowPlayingMiniTouchView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100605924();
}

- (void)skipBackwardStart
{
}

- (void)skipBackwardEnd
{
}

- (void)togglePlaying
{
}

- (void)skipForwardStart
{
}

- (void)skipForwardEnd
{
}

- (NSString)accessibilityLabel
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudiobookNowPlayingMiniTouchView();
  id v2 = v7.receiver;
  id v3 = [(BKAudiobookNowPlayingMiniTouchView *)&v7 accessibilityLabel];
  if (v3)
  {
    id v4 = v3;
    sub_1007FDC70();
  }
  else
  {
    if (qword_100B23058 != -1) {
      swift_once();
    }
    swift_bridgeObjectRetain();
  }
  NSString v5 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  if (a3)
  {
    sub_1007FDC70();
    id v4 = self;
    NSString v5 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = self;
    NSString v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudiobookNowPlayingMiniTouchView();
  [(BKAudiobookNowPlayingMiniTouchView *)&v7 setAccessibilityLabel:v5];
}

- (NSArray)accessibilityElements
{
  id v2 = self;
  sub_100603A8C();
  uint64_t v4 = v3;

  if (v4)
  {
    v5.super.isa = sub_1007FDFE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v5.super.isa = 0;
  }

  return (NSArray *)v5.super.isa;
}

- (BKAudiobookNowPlayingMiniTouchView)initWithFrame:(CGRect)a3
{
  result = (BKAudiobookNowPlayingMiniTouchView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_state);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10023E454((uint64_t)self + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_delegate);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_artworkWrapperView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView____lazy_storage___artworkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_titleContainer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_subtitleContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipBackwardButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipBackwardVibrancyContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_togglePlayingButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_togglePlayingVibrancyContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipForwardButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipForwardVibrancyContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_buyButtonGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_contentLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_contentTrailingConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_controlHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_buyButtonHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_buyButtonTrailingConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipForwardLeadingConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_skipBackwardTrailingConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_cachedGroupedLabelsAXElement);
}

- (CGRect)transitionCoverFrame
{
  id v2 = self;
  id v3 = sub_1005FFFD8();
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  id v12 = sub_1005FFFD8();
  id v13 = [v12 superview];

  -[BKAudiobookNowPlayingMiniTouchView convertRect:fromView:](v2, "convertRect:fromView:", v13, v5, v7, v9, v11);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)transitionCurrentCoverImage
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___BKAudiobookNowPlayingMiniTouchView_state));
}

- (id)transitionBackgroundImageView
{
  return 0;
}

- (id)transitionToolbarViews
{
  v2.super.isa = sub_1007FDFE0().super.isa;

  return v2.super.isa;
}

- (id)transitionControlsViews
{
  sub_100604C7C();
  v2.super.isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (BOOL)transitionHasCustomArtwork
{
  return 0;
}

- (double)transitionToolbarAlpha
{
  return 1.0;
}

- (id)transitionCoverViews
{
  sub_100058D18(&qword_100B29550);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10085CCE0;
  double v4 = self;
  id v5 = sub_1005FFFD8();
  *(void *)(v3 + 56) = sub_10004A860(0, &qword_100B29570);
  *(void *)(v3 + 32) = v5;

  v6.super.isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (double)coverCornerRadius
{
  NSArray v2 = self;
  id v3 = sub_1005FFFD8();
  id v4 = [v3 layer];

  [v4 cornerRadius];
  double v6 = v5;

  return v6;
}

- (int64_t)coverContentMode
{
  NSArray v2 = self;
  id v3 = sub_1005FFFD8();
  id v4 = [v3 contentMode];

  return (int64_t)v4;
}

- (double)transitionCoverImagePlayControlShadowOpacityValue
{
  return 1.0;
}

- (id)transitionCoverImagePlayControl
{
  return 0;
}

- (id)transitionContentView
{
  return 0;
}

@end