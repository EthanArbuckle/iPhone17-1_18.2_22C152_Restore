@interface SGInput
+ (id)inputWithName:(id)a3 type:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)name;
- (SGInput)init;
- (unint64_t)type;
- (void)setType:(unint64_t)a3;
@end

@implementation SGInput

- (unint64_t)type
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___SGInput_type);
  swift_beginAccess();
  return *v2;
}

- (void)setType:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self + OBJC_IVAR___SGInput_type);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (NSString)name
{
  return (NSString *)@objc SGInput.name.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SGInput_name);
}

+ (id)inputWithName:(id)a3 type:(unint64_t)a4
{
  return @objc static SGInput.create(name:type:)((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))specialized static SGInput.create(name:type:));
}

- (NSString)description
{
  return (NSString *)@objc SGEdge.debugDescription.getter(self, (uint64_t)a2, SGInput.description.getter);
}

- (BOOL)isEqual:(id)a3
{
  return @objc SGInput.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SGInput.isEqual(_:));
}

- (SGInput)init
{
  result = (SGInput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

@end