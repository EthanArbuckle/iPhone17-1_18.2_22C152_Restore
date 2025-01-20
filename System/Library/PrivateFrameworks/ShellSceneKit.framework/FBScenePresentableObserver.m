@interface FBScenePresentableObserver
- (_TtC13ShellSceneKit26FBScenePresentableObserver)init;
- (void)scene:(id)a3 didUpdateClientSettings:(id)a4;
@end

@implementation FBScenePresentableObserver

- (_TtC13ShellSceneKit26FBScenePresentableObserver)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_displayConfigRequestHandler);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_preferredSceneLevelHandler);
  void *v5 = 0;
  v5[1] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(FBScenePresentableObserver *)&v7 init];
}

- (void).cxx_destruct
{
  sub_25C4646CC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_displayConfigRequestHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC13ShellSceneKit26FBScenePresentableObserver_preferredSceneLevelHandler);
  sub_25C4646CC(v3);
}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25C478860(v7);
}

@end