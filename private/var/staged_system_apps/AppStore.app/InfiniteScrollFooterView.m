@interface InfiniteScrollFooterView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore24InfiniteScrollFooterView)initWithCoder:(id)a3;
- (_TtC8AppStore24InfiniteScrollFooterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation InfiniteScrollFooterView

- (_TtC8AppStore24InfiniteScrollFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24InfiniteScrollFooterView *)sub_1000A1D90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore24InfiniteScrollFooterView)initWithCoder:(id)a3
{
  result = (_TtC8AppStore24InfiniteScrollFooterView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = self;
  id v5 = [(InfiniteScrollFooterView *)v4 traitCollection];
  if (qword_10097FC30 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for StaticDimension();
  sub_100087728(v6, (uint64_t)qword_1009E5D90);
  type metadata accessor for TraitEnvironmentPlaceholder();
  sub_100082C28(&qword_100982B50);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1007BEA80;
  *(void *)(v7 + 32) = v5;
  id v8 = v5;
  v9 = (void *)TraitEnvironmentPlaceholder.__allocating_init(_:)();
  dispatch thunk of AnyDimension.rawValue(in:)();
  double v11 = v10;

  double v12 = width;
  double v13 = v11;
  result.height = v13;
  result.CGFloat width = v12;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  id v3 = [(InfiniteScrollFooterView *)v2 traitCollection];
  if (qword_10097FC30 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for StaticDimension();
  sub_100087728(v4, (uint64_t)qword_1009E5D90);
  type metadata accessor for TraitEnvironmentPlaceholder();
  sub_100082C28(&qword_100982B50);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1007BEA80;
  *(void *)(v5 + 32) = v3;
  id v6 = v3;
  uint64_t v7 = (void *)TraitEnvironmentPlaceholder.__allocating_init(_:)();
  dispatch thunk of AnyDimension.rawValue(in:)();
  double v9 = v8;

  double v10 = UIViewNoIntrinsicMetric;
  double v11 = v9;
  result.height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)swift_getObjectType();
  v2 = (char *)v17.receiver;
  [(InfiniteScrollFooterView *)&v17 layoutSubviews];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = *(void **)&v2[OBJC_IVAR____TtC8AppStore24InfiniteScrollFooterView_activityIndicator];
  [v11 sizeThatFits:v7, v9];
  double v13 = v12;
  double v15 = v14;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.CGFloat width = v8;
  v18.size.height = v10;
  CGFloat v16 = CGRectGetMidX(v18) - v13 * 0.5;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.CGFloat width = v8;
  v19.size.height = v10;
  [v11 setFrame:v16, CGRectGetMidY(v19) - v15 * 0.5, v13, v15];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(InfiniteScrollFooterView *)&v3 prepareForReuse];
  [v2[OBJC_IVAR____TtC8AppStore24InfiniteScrollFooterView_activityIndicator] stopAnimating];
}

- (void)willMoveToWindow:(id)a3
{
}

- (void)willMoveToSuperview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24InfiniteScrollFooterView_activityIndicator));
}

@end