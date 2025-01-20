@interface NDAnalyticsUploadFrameworkAssembly
- (NDAnalyticsUploadFrameworkAssembly)init;
@end

@implementation NDAnalyticsUploadFrameworkAssembly

- (NDAnalyticsUploadFrameworkAssembly)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___NDAnalyticsUploadFrameworkAssembly_assemblies;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26AB38E48);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_21FDF7410;
  uint64_t v6 = type metadata accessor for TelemetryAssembly();
  uint64_t v7 = swift_allocObject();
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 64) = sub_21FDE2B70();
  *(void *)(v5 + 32) = v7;
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(NDAnalyticsUploadFrameworkAssembly *)&v9 init];
}

- (void).cxx_destruct
{
}

@end