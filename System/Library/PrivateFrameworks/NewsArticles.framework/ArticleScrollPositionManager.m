@interface ArticleScrollPositionManager
- (id)scrollPositionForHeadline:(id)a3;
- (void)setPosition:(id)a3 headline:(id)a4;
@end

@implementation ArticleScrollPositionManager

- (void)setPosition:(id)a3 headline:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  sub_1BF6EDF4C(v5, a4);

  swift_unknownObjectRelease();
  swift_release();
}

- (id)scrollPositionForHeadline:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  id v4 = sub_1BF6EE514(a3);
  swift_unknownObjectRelease();
  swift_release();
  return v4;
}

@end