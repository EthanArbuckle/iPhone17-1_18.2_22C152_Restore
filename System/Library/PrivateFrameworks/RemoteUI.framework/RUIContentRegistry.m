@interface RUIContentRegistry
+ (_TtC8RemoteUI18RUIContentRegistry)sharedRegistry;
- (BOOL)supportsViewNamed:(id)a3;
- (_TtC8RemoteUI18RUIContentRegistry)init;
@end

@implementation RUIContentRegistry

+ (_TtC8RemoteUI18RUIContentRegistry)sharedRegistry
{
  if (qword_267811AA8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_267811AB0;
  return (_TtC8RemoteUI18RUIContentRegistry *)v2;
}

- (BOOL)supportsViewNamed:(id)a3
{
  uint64_t v4 = sub_214602EA8();
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_21457906C(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (_TtC8RemoteUI18RUIContentRegistry)init
{
  result = (_TtC8RemoteUI18RUIContentRegistry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end