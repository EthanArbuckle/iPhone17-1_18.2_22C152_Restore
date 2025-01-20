@interface EGAssembly
- (EGAssembly)init;
@end

@implementation EGAssembly

- (EGAssembly)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___EGAssembly_assemblies;
  sub_1BF91A834();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BF93E670;
  uint64_t v6 = type metadata accessor for EngagementAssembly();
  uint64_t v7 = swift_allocObject();
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 64) = sub_1BF91A8E4();
  *(void *)(v5 + 32) = v7;
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(EGAssembly *)&v9 init];
}

- (void).cxx_destruct
{
}

@end