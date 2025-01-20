@interface CollaborationButtonWrapper
- (_TtC12MobileSafariP33_6611532487E34DDB3B5E2A21F893A3EC26CollaborationButtonWrapper)initWithCoder:(id)a3;
- (_TtC12MobileSafariP33_6611532487E34DDB3B5E2A21F893A3EC26CollaborationButtonWrapper)initWithFrame:(CGRect)a3;
@end

@implementation CollaborationButtonWrapper

- (_TtC12MobileSafariP33_6611532487E34DDB3B5E2A21F893A3EC26CollaborationButtonWrapper)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC12MobileSafariP33_6611532487E34DDB3B5E2A21F893A3EC26CollaborationButtonWrapper_contentView) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CollaborationButtonWrapper();
  return -[BlurrableButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12MobileSafariP33_6611532487E34DDB3B5E2A21F893A3EC26CollaborationButtonWrapper)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC12MobileSafariP33_6611532487E34DDB3B5E2A21F893A3EC26CollaborationButtonWrapper_contentView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CollaborationButtonWrapper();
  return [(BlurrableButton *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafariP33_6611532487E34DDB3B5E2A21F893A3EC26CollaborationButtonWrapper_contentView));
}

@end