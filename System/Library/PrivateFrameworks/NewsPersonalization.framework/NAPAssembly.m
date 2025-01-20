@interface NAPAssembly
- (NAPAssembly)init;
@end

@implementation NAPAssembly

- (NAPAssembly)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___NAPAssembly_assemblies;
  sub_1DE61FCCC();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DE7B3550;
  uint64_t v6 = type metadata accessor for SuggestionsAssembly();
  uint64_t v7 = swift_allocObject();
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 64) = sub_1DE759E24(qword_1EBEB8F98, (void (*)(uint64_t))type metadata accessor for SuggestionsAssembly);
  *(void *)(v5 + 32) = v7;
  uint64_t v8 = type metadata accessor for TabiAssembly();
  uint64_t v9 = swift_allocObject();
  *(void *)(v5 + 96) = v8;
  *(void *)(v5 + 104) = sub_1DE759E24(&qword_1EBEB8EA8, (void (*)(uint64_t))type metadata accessor for TabiAssembly);
  *(void *)(v5 + 72) = v9;
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return [(NAPAssembly *)&v11 init];
}

- (void).cxx_destruct
{
}

@end