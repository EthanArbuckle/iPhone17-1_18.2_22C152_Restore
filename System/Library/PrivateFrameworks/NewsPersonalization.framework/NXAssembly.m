@interface NXAssembly
- (NXAssembly)init;
@end

@implementation NXAssembly

- (NXAssembly)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___NXAssembly_assemblies;
  sub_1DE61FCCC();
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DE7B4FE0;
  uint64_t v6 = type metadata accessor for AnalyticsAssembly();
  uint64_t v7 = swift_allocObject();
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 64) = sub_1DE61FD7C(&qword_1EBEBA708, (void (*)(uint64_t))type metadata accessor for AnalyticsAssembly);
  *(void *)(v5 + 32) = v7;
  uint64_t v8 = type metadata accessor for ServiceAssembly();
  uint64_t v9 = swift_allocObject();
  *(void *)(v5 + 96) = v8;
  *(void *)(v5 + 104) = sub_1DE61FD7C((unint64_t *)&unk_1EBEBA6D0, (void (*)(uint64_t))type metadata accessor for ServiceAssembly);
  *(void *)(v5 + 72) = v9;
  uint64_t v10 = type metadata accessor for SessionTrackingAssembly();
  uint64_t v11 = swift_allocObject();
  *(void *)(v5 + 136) = v10;
  *(void *)(v5 + 144) = sub_1DE61FD7C(&qword_1EBEBA888, (void (*)(uint64_t))type metadata accessor for SessionTrackingAssembly);
  *(void *)(v5 + 112) = v11;
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v13.receiver = self;
  v13.super_class = ObjectType;
  return [(NXAssembly *)&v13 init];
}

- (void).cxx_destruct
{
}

@end