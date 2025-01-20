@interface BridgedContext
- (_TtC13TeaFoundation14BridgedContext)init;
- (void)useObject:(id)a3 forClass:(Class)a4;
- (void)useObject:(id)a3 forClass:(Class)a4 name:(id)a5;
- (void)useObject:(id)a3 forProtocol:(id)a4;
- (void)useObject:(id)a3 forProtocol:(id)a4 name:(id)a5;
@end

@implementation BridgedContext

- (void)useObject:(id)a3 forClass:(Class)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_191EE8FC0();
  swift_unknownObjectRelease();
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_191DD8CCC(v7, ObjCClassMetadata);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

- (void)useObject:(id)a3 forClass:(Class)a4 name:(id)a5
{
  swift_unknownObjectRetain();
  id v7 = a5;
  v8 = self;
  sub_191EE8FC0();
  swift_unknownObjectRelease();
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_191EE8110();

  sub_191DD8EF8(v10, ObjCClassMetadata);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

- (void)useObject:(id)a3 forProtocol:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  id v7 = self;
  sub_191EE8FC0();
  swift_unknownObjectRelease();
  sub_191DD906C(v8, v6);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)useObject:(id)a3 forProtocol:(id)a4 name:(id)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  id v9 = a5;
  v10 = self;
  sub_191EE8FC0();
  swift_unknownObjectRelease();
  sub_191EE8110();

  sub_191DD91A0(v11, v8);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

- (_TtC13TeaFoundation14BridgedContext)init
{
}

- (void).cxx_destruct
{
}

@end