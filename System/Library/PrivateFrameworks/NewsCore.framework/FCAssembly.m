@interface FCAssembly
- (FCAssembly)init;
@end

@implementation FCAssembly

- (FCAssembly)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___FCAssembly_assemblies;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB5CF838);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1A4972120;
  uint64_t v6 = type metadata accessor for PrivateDataAssembly();
  v7 = self;
  uint64_t v8 = sub_1A470AF54();
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 64) = sub_1A46ED990();
  *(void *)(v5 + 32) = v8;
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;

  v10.receiver = v7;
  v10.super_class = ObjectType;
  return [(FCAssembly *)&v10 init];
}

- (void).cxx_destruct
{
}

@end