@interface ProgressBarControl
- (BOOL)isSelected;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC23ShelfKitCollectionViews18ProgressBarControl)init;
- (_TtC23ShelfKitCollectionViews18ProgressBarControl)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews18ProgressBarControl)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
- (void)updateProgressWithDisplayLink:(id)a3;
@end

@implementation ProgressBarControl

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProgressBarControl();
  return [(ProgressBarControl *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ProgressBarControl();
  v4 = (char *)v7.receiver;
  [(ProgressBarControl *)&v7 setSelected:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_videoControlButton];
  if (v5)
  {
    v6 = v5;
    [v6 setSelected:[v4 isSelected]];

    v4 = v6;
  }
}

- (_TtC23ShelfKitCollectionViews18ProgressBarControl)init
{
  return (_TtC23ShelfKitCollectionViews18ProgressBarControl *)sub_28CD40();
}

- (_TtC23ShelfKitCollectionViews18ProgressBarControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_28D74C();
}

- (void)didMoveToSuperview
{
  id v3 = self;
  id v2 = [(ProgressBarControl *)v3 superview];

  if (!v2) {
    [*(id *)((char *)&v3->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_displayLink) invalidate];
  }
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_28D0CC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_videoControlButton);
  if (v5)
  {
    double height = a3.height;
    objc_super v7 = self;
    [v5 sizeThatFits:width, height];
    double v9 = v8;
  }
  else
  {
    v10 = self;
    double v9 = 0.0;
  }
  if (qword_470600 != -1) {
    swift_once();
  }
  double v11 = *(double *)&qword_47E308;

  if (v11 > v9) {
    double v12 = v11;
  }
  else {
    double v12 = v9;
  }
  double v13 = width;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (void)updateProgressWithDisplayLink:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_28D428(v4);
}

- (_TtC23ShelfKitCollectionViews18ProgressBarControl)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC23ShelfKitCollectionViews18ProgressBarControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_videoControlButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_backgroundBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_progressBar));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews18ProgressBarControl_displayLink);
}

@end