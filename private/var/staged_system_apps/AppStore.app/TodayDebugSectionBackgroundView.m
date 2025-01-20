@interface TodayDebugSectionBackgroundView
- (_TtC8AppStore31TodayDebugSectionBackgroundView)initWithCoder:(id)a3;
- (_TtC8AppStore31TodayDebugSectionBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TodayDebugSectionBackgroundView

- (_TtC8AppStore31TodayDebugSectionBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31TodayDebugSectionBackgroundView *)sub_100582F84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31TodayDebugSectionBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore31TodayDebugSectionBackgroundView_sectionTypeIndicator;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC8AppStore31TodayDebugSectionBackgroundView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TodayDebugSectionBackgroundView();
  v2 = (char *)v7.receiver;
  [(TodayDebugSectionBackgroundView *)&v7 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore31TodayDebugSectionBackgroundView_sectionTypeIndicator];
  LayoutMarginsAware<>.layoutFrame.getter();
  double MinX = CGRectGetMinX(v8);
  LayoutMarginsAware<>.layoutFrame.getter();
  double MinY = CGRectGetMinY(v9);
  if (qword_10097FF40 != -1) {
    swift_once();
  }
  double v6 = *(double *)&qword_10099E500;
  LayoutMarginsAware<>.layoutFrame.getter();
  [v3 setFrame:MinX, MinY, v6, CGRectGetHeight(v10), v7.receiver, v7.super_class];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TodayDebugSectionBackgroundView();
  v2 = (char *)v5.receiver;
  [(TodayDebugSectionBackgroundView *)&v5 prepareForReuse];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore31TodayDebugSectionBackgroundView_sectionTypeIndicator];
  id v4 = [self clearColor];
  [v3 setBackgroundColor:v4];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31TodayDebugSectionBackgroundView_sectionTypeIndicator));
}

@end