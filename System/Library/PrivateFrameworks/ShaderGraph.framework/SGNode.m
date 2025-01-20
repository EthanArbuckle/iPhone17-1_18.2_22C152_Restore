@interface SGNode
+ (SGNode)nodeWithConstantBoolean:(BOOL)a3 name:(id)a4 error:(id *)a5;
+ (SGNode)nodeWithConstantColor3:(CGColor *)a3 name:(id)a4 error:(id *)a5;
+ (SGNode)nodeWithConstantColor4:(CGColor *)a3 name:(id)a4 error:(id *)a5;
+ (SGNode)nodeWithConstantScalar:(id)a3 type:(unint64_t)a4 name:(id)a5 error:(id *)a6;
+ (SGNode)nodeWithConstantString:(id)a3 type:(unint64_t)a4 name:(id)a5 error:(id *)a6;
+ (SGNode)nodeWithConstantVector:(id)a3 type:(unint64_t)a4 name:(id)a5 error:(id *)a6;
+ (SGNode)nodeWithGraph:(id)a3 name:(id)a4 error:(id *)a5;
+ (SGNode)nodeWithNodeDefName:(id)a3 name:(id)a4 error:(id *)a5;
- (NSArray)inputs;
- (NSArray)outputs;
- (NSString)name;
- (SGNode)init;
@end

@implementation SGNode

- (NSString)name
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SGNode_name);
  uint64_t v3 = *(void *)&self->name[OBJC_IVAR___SGNode_name];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x261183E60](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (NSArray)inputs
{
  return (NSArray *)@objc SGNode.inputs.getter((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SGNode_inputs, (void (*)(void))type metadata accessor for SGInput);
}

- (NSArray)outputs
{
  return (NSArray *)@objc SGNode.inputs.getter((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___SGNode_outputs, (void (*)(void))type metadata accessor for SGOutput);
}

- (SGNode)init
{
  result = (SGNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of NodeData(*(void **)((char *)&self->super.isa + OBJC_IVAR___SGNode_data), *(void *)&self->name[OBJC_IVAR___SGNode_data], *(void **)&self->name[OBJC_IVAR___SGNode_data + 8], *(id *)&self->inputs[OBJC_IVAR___SGNode_data], *(void *)&self->outputs[OBJC_IVAR___SGNode_data], *(void *)&self->_anon_28[OBJC_IVAR___SGNode_data], *(void *)&self->data[OBJC_IVAR___SGNode_data], *(void *)&self->data[OBJC_IVAR___SGNode_data + 8], *(void *)&self->data[OBJC_IVAR___SGNode_data + 16], *(void *)&self->data[OBJC_IVAR___SGNode_data + 24], self->data[OBJC_IVAR___SGNode_data + 32]);
  swift_unknownObjectWeakDestroy();
}

+ (SGNode)nodeWithNodeDefName:(id)a3 name:(id)a4 error:(id *)a5
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    if (a4)
    {
LABEL_3:
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v11 = v10;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = 0;
    v8 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = 0;
  v11 = 0;
LABEL_6:
  v12 = specialized static SGNode.create(nodeDefName:name:)(v6, v8, v9, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (SGNode *)v12;
}

+ (SGNode)nodeWithGraph:(id)a3 name:(id)a4 error:(id *)a5
{
  if (a4)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    v8 = 0;
  }
  id v9 = a3;
  v10 = specialized static SGNode.create(graph:name:)(a3, v6, v8);

  swift_bridgeObjectRelease();
  return (SGNode *)v10;
}

+ (SGNode)nodeWithConstantScalar:(id)a3 type:(unint64_t)a4 name:(id)a5 error:(id *)a6
{
  return (SGNode *)@objc static SGNode.create(_:type:name:)((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(void *, uint64_t, uint64_t, uint64_t))specialized static SGNode.create(_:type:name:));
}

+ (SGNode)nodeWithConstantBoolean:(BOOL)a3 name:(id)a4 error:(id *)a5
{
  BOOL v5 = a3;
  if (a4)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    v8 = 0;
  }
  id v9 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithBool_, v5);
  v10 = specialized static SGNode.create(_:type:name:)(v9, 1, v6, v8);

  swift_bridgeObjectRelease();
  return (SGNode *)v10;
}

+ (SGNode)nodeWithConstantVector:(id)a3 type:(unint64_t)a4 name:(id)a5 error:(id *)a6
{
  return (SGNode *)@objc static SGNode.create(_:type:name:)((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(void *, uint64_t, uint64_t, uint64_t))specialized static SGNode.create(_:type:name:));
}

+ (SGNode)nodeWithConstantString:(id)a3 type:(unint64_t)a4 name:(id)a5 error:(id *)a6
{
  uint64_t v6 = (char *)a5;
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;
    if (v6)
    {
LABEL_3:
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v6 = v12;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    if (a5) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
LABEL_6:
  v13 = specialized static SGNode.create(value:type:name:)(v8, v10, a4, v11, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (SGNode *)v13;
}

+ (SGNode)nodeWithConstantColor3:(CGColor *)a3 name:(id)a4 error:(id *)a5
{
  return (SGNode *)@objc static SGNode.createColor3(color:name:)((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, a5, 3);
}

+ (SGNode)nodeWithConstantColor4:(CGColor *)a3 name:(id)a4 error:(id *)a5
{
  return (SGNode *)@objc static SGNode.createColor3(color:name:)((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, a5, 4);
}

@end