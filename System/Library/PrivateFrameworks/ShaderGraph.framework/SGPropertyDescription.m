@interface SGPropertyDescription
+ (id)create:(id)a3 type:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)visible;
- (NSString)description;
- (NSString)name;
- (SGPropertyDescription)init;
- (SGTypeDescription)type;
@end

@implementation SGPropertyDescription

- (NSString)name
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SGPropertyDescription_name);
  uint64_t v3 = *(void *)&self->name[OBJC_IVAR___SGPropertyDescription_name];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x261183E60](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (SGTypeDescription)type
{
  return (SGTypeDescription *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___SGPropertyDescription_type));
}

- (BOOL)visible
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___SGPropertyDescription_visible);
}

+ (id)create:(id)a3 type:(id)a4
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  v9 = objc_allocWithZone(ObjCClassMetadata);
  v10 = (uint64_t *)&v9[OBJC_IVAR___SGPropertyDescription_name];
  uint64_t *v10 = v6;
  v10[1] = v8;
  *(void *)&v9[OBJC_IVAR___SGPropertyDescription_type] = a4;
  v9[OBJC_IVAR___SGPropertyDescription_visible] = 1;
  v14.receiver = v9;
  v14.super_class = ObjCClassMetadata;
  id v11 = a4;
  id v12 = objc_msgSendSuper2(&v14, sel_init);
  return v12;
}

- (NSString)description
{
  return (NSString *)@objc SGTypeDescription.description.getter(self, (uint64_t)a2, (void (*)(void *__return_ptr, void **, id))closure #1 in SGPropertyDescription.description.getter);
}

- (SGPropertyDescription)init
{
  result = (SGPropertyDescription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SGPropertyDescription_type);
}

- (BOOL)isEqual:(id)a3
{
  return @objc SGTypeDescription.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SGPropertyDescription.isEqual(_:));
}

@end