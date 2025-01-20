@interface ExtendedUITabBarElement
- (BKRootBarItem)rootBarItem;
- (NSString)automationID;
- (NSString)shortTabBarTitle;
- (_TtC5Books23ExtendedUITabBarElement)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5;
- (void)setAutomationID:(id)a3;
- (void)setRootBarItem:(id)a3;
- (void)setShortTabBarTitle:(id)a3;
@end

@implementation ExtendedUITabBarElement

- (_TtC5Books23ExtendedUITabBarElement)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5
{
  sub_1007FDC70();
  sub_1007FDC70();
  *(void *)&self->_UITabElement_opaque[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_rootBarItem] = 0;
  v7 = &self->_UITabElement_opaque[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_shortTabBarTitle];
  *(void *)v7 = 0;
  *((void *)v7 + 1) = 0;
  v8 = &self->_UITabElement_opaque[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_automationID];
  *(void *)v8 = 0;
  *((void *)v8 + 1) = 0;
  id v9 = a5;
  NSString v10 = sub_1007FDC30();
  swift_bridgeObjectRelease();
  NSString v11 = sub_1007FDC30();
  swift_bridgeObjectRelease();
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for ExtendedUITabBarElement();
  v12 = [(ExtendedUITabBarElement *)&v14 initWithIdentifier:v10 title:v11 image:v9];

  return v12;
}

- (BKRootBarItem)rootBarItem
{
  return (BKRootBarItem *)*(id *)&self->_UITabElement_opaque[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_rootBarItem];
}

- (void)setRootBarItem:(id)a3
{
  id v4 = *(id *)&self->_UITabElement_opaque[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_rootBarItem];
  *(void *)&self->_UITabElement_opaque[OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_rootBarItem] = a3;
  id v3 = a3;
}

- (NSString)shortTabBarTitle
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_shortTabBarTitle);
}

- (void)setShortTabBarTitle:(id)a3
{
}

- (NSString)automationID
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Books23ExtendedUITabBarElement_automationID);
}

- (void)setAutomationID:(id)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end