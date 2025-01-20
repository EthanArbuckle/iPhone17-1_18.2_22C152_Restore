@interface UserInfo
- (void)database:(id)a3 didChangeZone:(id)a4 from:(id)a5 to:(id)a6;
@end

@implementation UserInfo

- (void)database:(id)a3 didChangeZone:(id)a4 from:(id)a5 to:(id)a6
{
  id v8 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  sub_1AFFC8E48();
  sub_1AFDEB054(v8, a5, a6);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
}

@end