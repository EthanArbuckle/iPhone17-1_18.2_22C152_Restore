@interface SymbolButton.BadgeView
- (BOOL)isHidden;
- (_TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView)initWithCoder:(id)a3;
- (_TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView)initWithFrame:(CGRect)a3;
- (double)alpha;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setAlpha:(double)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation SymbolButton.BadgeView

- (_TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100516CA8();
}

- (double)alpha
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SymbolButton.BadgeView();
  [(SymbolButton.BadgeView *)&v3 alpha];
  return result;
}

- (void)setAlpha:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SymbolButton.BadgeView();
  v4 = (char *)v6.receiver;
  [(SymbolButton.BadgeView *)&v6 setAlpha:a3];
  v5 = *(void **)&v4[OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView_punchOutView];
  [v4 alpha];
  [v5 setAlpha:];
}

- (BOOL)isHidden
{
  return sub_1005083A0(self, (uint64_t)a2, (uint64_t (*)(void))type metadata accessor for SymbolButton.BadgeView, (SEL *)&selRef_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SymbolButton.BadgeView();
  v4 = (char *)v5.receiver;
  [(SymbolButton.BadgeView *)&v5 setHidden:v3];
  [*(id *)&v4[OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView_punchOutView] setHidden:[v4 isHidden]];
}

- (void)didMoveToSuperview
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SymbolButton.BadgeView();
  v2 = (char *)v5.receiver;
  [(SymbolButton.BadgeView *)&v5 didMoveToSuperview];
  id v3 = [v2 superview];
  if (v3)
  {
    v4 = v3;
    [v3 insertSubview:*(void *)&v2[OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView_punchOutView] belowSubview:v2];
  }
  else
  {
    [*(id *)&v2[OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView_punchOutView] removeFromSuperview];
  }
}

- (void)layoutSubviews
{
  sub_10000BB04(&qword_100678A80);
  __chkstk_darwin();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v5 = (objc_class *)type metadata accessor for SymbolButton.BadgeView();
  v8.receiver = self;
  v8.super_class = v5;
  objc_super v6 = self;
  [(SymbolButton.BadgeView *)&v8 layoutSubviews];
  sub_100535CD0();
  uint64_t v7 = sub_100535CE0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 0, 1, v7);
  sub_100535CF0();
  sub_10050CD7C();
}

- (_TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView_configuration
                                         + 8]);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC11MusicCoreUI12SymbolButtonP33_0D6450BB937596549C350B7D294A2A939BadgeView_punchOutView);
}

@end