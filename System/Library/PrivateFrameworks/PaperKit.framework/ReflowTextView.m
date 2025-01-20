@interface ReflowTextView
- (CGRect)frame;
- (_TtC8PaperKit14ReflowTextView)initWithCoder:(id)a3;
- (_TtC8PaperKit14ReflowTextView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
@end

@implementation ReflowTextView

- (_TtC8PaperKit14ReflowTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized ReflowTextView.init(coder:)();
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ReflowTextView();
  v2 = (char *)v8.receiver;
  [(ReflowTextView *)&v8 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC8PaperKit14ReflowTextView_layoutManager];
  objc_msgSend(v2, sel_frame, v8.receiver, v8.super_class);
  v3[2] = v4;
  v3[3] = v5;
  v3[4] = v6;
  v3[5] = v7;
  ReflowLayoutManager.scaleTextToFit()();
  if (one-time initialization token for showDebugUI != -1) {
    swift_once();
  }
  if (static ReflowTextView.showDebugUI == 1) {
    ReflowTextView.lineDebug()();
  }
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ReflowTextView();
  [(ReflowTextView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(CGRect *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit14ReflowTextView_layoutManager)
            + 16) = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ReflowTextView();
  -[ReflowTextView setFrame:](&v7, sel_setFrame_, x, y, width, height);
}

- (_TtC8PaperKit14ReflowTextView)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC8PaperKit14ReflowTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit14ReflowTextView____lazy_storage___displayLink));
  swift_bridgeObjectRelease();
}

@end