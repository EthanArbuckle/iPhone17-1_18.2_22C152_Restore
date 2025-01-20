@interface PlaybackStatusView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityPlayedDateString;
- (NSString)accessibilityTimeRemainingString;
- (_TtC23ShelfKitCollectionViews18PlaybackStatusView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews18PlaybackStatusView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PlaybackStatusView

- (_TtC23ShelfKitCollectionViews18PlaybackStatusView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_30B7E0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_307AC0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_308F10(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_3093EC();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.double width = v6;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_309AF4(a3);
}

- (NSString)accessibilityTimeRemainingString
{
  return (NSString *)sub_309E10(self, (uint64_t)a2, (void (*)(void))sub_309CBC);
}

- (NSString)accessibilityPlayedDateString
{
  return (NSString *)sub_309E10(self, (uint64_t)a2, (void (*)(void))sub_309E90);
}

- (_TtC23ShelfKitCollectionViews18PlaybackStatusView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC23ShelfKitCollectionViews18PlaybackStatusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_playedDateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_timeLabel));
  long long v3 = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins
                                                    + 47];
  v10[4] = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins
                                                        + 31];
  v10[5] = v3;
  v11[0] = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins
                                                        + 63];
  *(_OWORD *)((char *)v11 + 10) = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins
                                                                               + 73];
  long long v4 = *(_OWORD *)&self->timeLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins];
  v10[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins);
  v10[1] = v4;
  long long v5 = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins
                                                    + 15];
  v10[2] = *(_OWORD *)&self->itemDuration[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_legacyPlayedCheckmarkMargins
                                        + 8];
  v10[3] = v5;
  sub_30BE10((uint64_t)v10, (void (*)(void, void, void, void, void, void, void, void, void, void, void, __int16))sub_1C1B0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_checkmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_progressView));
  long long v6 = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme
                                                    + 79];
  v12[6] = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme
                                                        + 63];
  v12[7] = v6;
  uint64_t v13 = *(void *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme
                                                     + 95];
  long long v7 = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme
                                                    + 15];
  v12[2] = *(_OWORD *)&self->itemDuration[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme + 8];
  v12[3] = v7;
  long long v8 = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme
                                                    + 47];
  v12[4] = *(_OWORD *)&self->legacyPlayedCheckmarkMargins[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme
                                                        + 31];
  v12[5] = v8;
  long long v9 = *(_OWORD *)&self->timeLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme];
  v12[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_theme);
  v12[1] = v9;
  sub_154740((uint64_t)v12);
  swift_release();
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_playStateChangeHandler));
  sub_30B75C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews18PlaybackStatusView_playState, type metadata accessor for PlayState);
}

@end