@interface PMUIApplicationDelegate
- (_TtC17PasswordManagerUI23PMUIApplicationDelegate)init;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation PMUIApplicationDelegate

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  id v12 = objc_msgSend(v9, sel_role);
  id v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F82B48]), sel_initWithName_sessionRole_, 0, v12);

  type metadata accessor for PMSceneDelegate();
  objc_msgSend(v13, sel_setDelegateClass_, swift_getObjCClassFromMetadata());

  return v13;
}

- (_TtC17PasswordManagerUI23PMUIApplicationDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PMUIApplicationDelegate();
  return [(PMUIApplicationDelegate *)&v3 init];
}

@end