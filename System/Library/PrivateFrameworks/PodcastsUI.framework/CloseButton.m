@interface CloseButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton)initWithCoder:(id)a3;
- (_TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton)initWithFrame:(CGRect)a3;
@end

@implementation CloseButton

- (_TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton)initWithCoder:(id)a3
{
  result = (_TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton *)sub_1E3E7DF80();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  [(CloseButton *)v8 bounds];
  v16.origin.CGFloat x = UIEdgeInsetsInsetRect(v9, v10, v11, v12, *(double *)((char *)&v8->super.super.super.super.super.isa+ OBJC_IVAR____TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton_touchInsets), *(double *)((char *)&v8->super.super.super.super._responderFlags+ OBJC_IVAR____TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton_touchInsets));
  v15.CGFloat x = x;
  v15.CGFloat y = y;
  BOOL v13 = CGRectContainsPoint(v16, v15);

  return v13;
}

- (_TtC10PodcastsUIP33_7356E91B5F9CFCB46676D7EB93CF2B4411CloseButton)initWithFrame:(CGRect)a3
{
}

@end