@interface PosterRackOffsetMenuButton
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (_TtC11PosterBoard26PosterRackOffsetMenuButton)initWithCoder:(id)a3;
- (_TtC11PosterBoard26PosterRackOffsetMenuButton)initWithFrame:(CGRect)a3;
@end

@implementation PosterRackOffsetMenuButton

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PosterRackOffsetMenuButton();
  [(PosterRackOffsetMenuButton *)&v7 menuAttachmentPointForConfiguration:a3];
  double v6 = v5 + -8.0;
  result.y = v6;
  result.x = v4;
  return result;
}

- (_TtC11PosterBoard26PosterRackOffsetMenuButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PosterRackOffsetMenuButton();
  return -[PosterRackOffsetMenuButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11PosterBoard26PosterRackOffsetMenuButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PosterRackOffsetMenuButton();
  return [(PosterRackOffsetMenuButton *)&v5 initWithCoder:a3];
}

@end