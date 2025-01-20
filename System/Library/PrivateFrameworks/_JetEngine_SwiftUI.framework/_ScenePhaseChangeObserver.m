@interface _ScenePhaseChangeObserver
- (_ScenePhaseChangeObserver)init;
- (void)dealloc;
- (void)didEnterBackground;
- (void)willEnterForegroundNotification;
@end

@implementation _ScenePhaseChangeObserver

- (_ScenePhaseChangeObserver)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____ScenePhaseChangeObserver_multicastDelegate;
  __swift_instantiateConcreteTypeFromMangledName(qword_26AD03CA8);
  swift_allocObject();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_219159EF8();

  v12.receiver = v5;
  v12.super_class = ObjectType;
  v6 = [(_ScenePhaseChangeObserver *)&v12 init];
  v7 = self;
  v8 = v6;
  id v9 = objc_msgSend(v7, sel_defaultCenter);
  objc_msgSend(v9, sel_addObserver_selector_name_object_, v8, sel_didEnterBackground, *MEMORY[0x263F83930], 0);

  id v10 = objc_msgSend(v7, sel_defaultCenter);
  objc_msgSend(v10, sel_addObserver_selector_name_object_, v8, sel_willEnterForegroundNotification, *MEMORY[0x263F83958], 0);

  return v8;
}

- (void)dealloc
{
  v2 = self;
  sub_219119DA0();
}

- (void).cxx_destruct
{
}

- (void)didEnterBackground
{
  v2 = self;
  sub_219159EE8();
}

- (void)willEnterForegroundNotification
{
  v2 = self;
  sub_219159EE8();
}

@end