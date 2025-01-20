@interface ImpressionSent
- (_TtC17PromotedContentUI14ImpressionSent)initWithCoder:(id)a3;
- (_TtC17PromotedContentUI14ImpressionSent)initWithFrame:(CGRect)a3;
@end

@implementation ImpressionSent

- (_TtC17PromotedContentUI14ImpressionSent)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC17PromotedContentUI14ImpressionSent_alreadySent) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC17PromotedContentUI14ImpressionSent_alreadyRecorded) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ImpressionSent();
  return -[ImpressionSent initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC17PromotedContentUI14ImpressionSent)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC17PromotedContentUI14ImpressionSent_alreadySent) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC17PromotedContentUI14ImpressionSent_alreadyRecorded) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ImpressionSent();
  return [(ImpressionSent *)&v5 initWithCoder:a3];
}

@end