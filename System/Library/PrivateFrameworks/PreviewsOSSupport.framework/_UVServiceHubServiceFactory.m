@interface _UVServiceHubServiceFactory
+ (id)makeAgentPipeServiceAndReturnError:(id *)a3 messageHandler:(id)a4;
+ (id)makePreviewServiceAndReturnError:(id *)a3;
+ (id)makeShellPipeServiceAndReturnError:(id *)a3 messageHandler:(id)a4;
- (_TtC17PreviewsOSSupport27_UVServiceHubServiceFactory)init;
@end

@implementation _UVServiceHubServiceFactory

+ (id)makeAgentPipeServiceAndReturnError:(id *)a3 messageHandler:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26874FDE0));
  id v7 = sub_232E15480((uint64_t)sub_232E156A0, v5, &qword_26874FDE8, (uint64_t (*)(uint64_t, uint64_t))sub_232E145F0, &qword_26874FDF0);
  swift_release();

  return v7;
}

+ (id)makeShellPipeServiceAndReturnError:(id *)a3 messageHandler:(id)a4
{
  v4 = _Block_copy(a4);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_26874FE00));
  id v7 = sub_232E15480((uint64_t)sub_232E15630, v5, &qword_26874FE08, (uint64_t (*)(uint64_t, uint64_t))sub_232E14870, &qword_26874FE10);
  swift_release();

  return v7;
}

+ (id)makePreviewServiceAndReturnError:(id *)a3
{
  id v3 = sub_232E23BA0();

  return v3;
}

- (_TtC17PreviewsOSSupport27_UVServiceHubServiceFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(_UVServiceHubServiceFactory *)&v3 init];
}

@end