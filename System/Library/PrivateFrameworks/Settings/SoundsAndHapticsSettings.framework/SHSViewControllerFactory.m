@interface SHSViewControllerFactory
+ (id)createHapticsOptionsViewController:(int64_t)a3 delegate:(id)a4;
- (_TtC24SoundsAndHapticsSettings24SHSViewControllerFactory)init;
@end

@implementation SHSViewControllerFactory

+ (id)createHapticsOptionsViewController:(int64_t)a3 delegate:(id)a4
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for SHSHapticsOptionsViewController());
  swift_unknownObjectRetain();
  v6 = (char *)objc_msgSend(v5, sel_init);
  *(void *)&v6[OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController_selectedOption] = a3;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v6;
}

- (_TtC24SoundsAndHapticsSettings24SHSViewControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SHSViewControllerFactory();
  return [(SHSViewControllerFactory *)&v3 init];
}

@end