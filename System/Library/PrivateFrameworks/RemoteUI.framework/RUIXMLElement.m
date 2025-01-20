@interface RUIXMLElement
- (NSArray)children;
- (NSDictionary)attributtes;
- (NSString)name;
- (NSString)stringValue;
- (NSString)xmlString;
- (RUIXMLElement)init;
- (RUIXMLElement)initWithName:(id)a3;
- (RUIXMLElement)initWithName:(id)a3 attributes:(id)a4;
- (RUIXMLElement)parent;
- (void)appendChild:(id)a3;
- (void)appendChildren:(id)a3;
- (void)setAttributtes:(id)a3;
- (void)setStringValue:(id)a3;
- (void)traverseWithDelegate:(id)a3;
@end

@implementation RUIXMLElement

- (void)traverseWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  RUIXMLElement.traverse(withDelegate:)(a3);
  swift_unknownObjectRelease();
}

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_214602E78();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDictionary)attributtes
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_214602DF8();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (void)setAttributtes:(id)a3
{
  uint64_t v4 = sub_214602E08();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___RUIXMLElement_attributtes);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (RUIXMLElement)parent
{
  v2 = (void *)MEMORY[0x2166A5300]((char *)self + OBJC_IVAR___RUIXMLElement_mutableParent, a2);
  return (RUIXMLElement *)v2;
}

- (NSString)stringValue
{
  v2 = (char *)self + OBJC_IVAR___RUIXMLElement_stringValue;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_214602E78();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setStringValue:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_214602EA8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___RUIXMLElement_stringValue);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSArray)children
{
  uint64_t v2 = swift_beginAccess();
  type metadata accessor for RUIXMLElement(v2);
  swift_bridgeObjectRetain();
  v3 = (void *)sub_214603048();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (RUIXMLElement)initWithName:(id)a3
{
  sub_214602EA8();
  uint64_t v4 = (void *)sub_214602E78();
  swift_bridgeObjectRelease();
  sub_2145CEECC(MEMORY[0x263F8EE78]);
  uint64_t v5 = (void *)sub_214602DF8();
  swift_bridgeObjectRelease();
  uint64_t v6 = [(RUIXMLElement *)self initWithName:v4 attributes:v5];

  return v6;
}

- (RUIXMLElement)initWithName:(id)a3 attributes:(id)a4
{
  uint64_t v5 = sub_214602EA8();
  uint64_t v7 = v6;
  v8 = (objc_class *)sub_214602E08();
  v9 = (Class *)((char *)&self->super.isa + OBJC_IVAR___RUIXMLElement_stringValue);
  void *v9 = 0;
  v9[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___RUIXMLElement_mutableChildren) = (Class)MEMORY[0x263F8EE78];
  swift_unknownObjectWeakInit();
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___RUIXMLElement_name);
  uint64_t *v10 = v5;
  v10[1] = v7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___RUIXMLElement_attributtes) = v8;
  v12.receiver = self;
  v12.super_class = (Class)RUIXMLElement;
  return [(RUIXMLElement *)&v12 init];
}

- (void)appendChildren:(id)a3
{
  type metadata accessor for RUIXMLElement((uint64_t)self);
  uint64_t v4 = sub_214603058();
  uint64_t v5 = self;
  RUIXMLElement.appendChildren(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)appendChild:(id)a3
{
  uint64_t v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR___RUIXMLElement_mutableChildren);
  swift_beginAccess();
  id v6 = a3;
  uint64_t v7 = self;
  MEMORY[0x2166A36A0]();
  if (*(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_214603088();
  }
  sub_2146030B8();
  sub_214603068();
  swift_endAccess();
  swift_unknownObjectWeakAssign();
}

- (RUIXMLElement)init
{
  result = (RUIXMLElement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

- (NSString)xmlString
{
  uint64_t v2 = self;
  sub_2145E6788(v2);

  v3 = (void *)sub_214602E78();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end