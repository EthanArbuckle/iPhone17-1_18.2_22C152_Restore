@interface JSAOSFeatureFlags
+ (BOOL)isEnabled:(id)a3 :(id)a4;
- (_TtC5JSApp17JSAOSFeatureFlags)init;
@end

@implementation JSAOSFeatureFlags

+ (BOOL)isEnabled:(id)a3 :(id)a4
{
  int v5 = sub_86860();
  int v7 = v6;
  id v8 = a4;
  LOBYTE(v5) = sub_5E2A0(v5, v7, v8);

  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (_TtC5JSApp17JSAOSFeatureFlags)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(JSAOSFeatureFlags *)&v3 init];
}

@end