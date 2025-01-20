@interface AccessoryViewContainer
- (CGSize)intrinsicContentSize;
- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer)initWithCoder:(id)a3;
- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer)initWithFrame:(CGRect)a3;
- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer)initWithFrame:(CGRect)a3 inputViewStyle:(int64_t)a4;
@end

@implementation AccessoryViewContainer

- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_identifier);
  void *v7 = 0;
  v7[1] = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_accessoryView);
  void *v8 = 0;
  v8[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_heightConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_height) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AccessoryViewContainer();
  v9 = -[UIInputView initWithFrame:inputViewStyle:](&v11, sel_initWithFrame_inputViewStyle_, 0, x, y, width, height);
  [(AccessoryViewContainer *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v9;
}

- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_identifier);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_accessoryView);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_heightConstraint) = 0;
  id v6 = a3;

  result = (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer *)sub_1C152040C();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  [(AccessoryViewContainer *)v2 bounds];
  double Width = CGRectGetWidth(v9);
  sub_1C0C7EDA0(Width);
  double v4 = *MEMORY[0x1E4FB30D8];
  double v5 = *(double *)((char *)&v2->super.super.super.super.isa
                 + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_height);

  double v6 = v4;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer)initWithFrame:(CGRect)a3 inputViewStyle:(int64_t)a4
{
  CGSize result = (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_accessoryView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B22AccessoryViewContainer_heightConstraint);
}

@end