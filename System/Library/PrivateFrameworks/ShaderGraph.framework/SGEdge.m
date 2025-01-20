@interface SGEdge
- (NSString)debugDescription;
- (SGEdge)init;
- (id)initFrom:(id)a3 to:(id)a4;
@end

@implementation SGEdge

- (id)initFrom:(id)a3 to:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SGEdge_from) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SGEdge_to) = (Class)a4;
  v11.receiver = self;
  v11.super_class = ObjectType;
  id v8 = a3;
  id v9 = a4;
  return [(SGEdge *)&v11 init];
}

- (NSString)debugDescription
{
  return (NSString *)@objc SGEdge.debugDescription.getter(self, (uint64_t)a2, SGEdge.debugDescription.getter);
}

- (SGEdge)init
{
  result = (SGEdge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SGEdge_to);
}

@end