@interface CRLPropertyMap
- (BOOL)containsProperty:(unint64_t)a3;
- (BOOL)isEmpty;
- (_TtC8Freeform14CRLPropertyMap)init;
- (id)getProperty:(unint64_t)a3;
- (id)objectForKeyedSubscript:(unint64_t)a3;
- (int64_t)count;
- (void)enumeratePropertiesUsingBlock:(id)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(unint64_t)a4;
- (void)setProperty:(unint64_t)a3 value:(id)a4;
@end

@implementation CRLPropertyMap

- (id)getProperty:(unint64_t)a3
{
  return sub_100A54DC8((uint64_t)self, (uint64_t)a2, a3, (void (*)(void *__return_ptr, uint64_t))sub_100A54B5C);
}

- (void)setProperty:(unint64_t)a3 value:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v7 = self;
  }
  sub_100557A70((uint64_t)v9, (uint64_t)v8);
  swift_beginAccess();
  sub_10057D61C((uint64_t)v8, a3);
  swift_endAccess();

  sub_100522F00((uint64_t)v9, &qword_101672BF0);
}

- (BOOL)containsProperty:(unint64_t)a3
{
  v3 = self;
  char v4 = sub_100A54C38();

  return v4 & 1;
}

- (BOOL)isEmpty
{
  v2 = (char *)self + OBJC_IVAR____TtC8Freeform14CRLPropertyMap_data;
  swift_beginAccess();
  return *(void *)(*(void *)v2 + 16) == 0;
}

- (int64_t)count
{
  v2 = (char *)self + OBJC_IVAR____TtC8Freeform14CRLPropertyMap_data;
  swift_beginAccess();
  return *(void *)(*(void *)v2 + 16);
}

- (id)objectForKeyedSubscript:(unint64_t)a3
{
  return sub_100A54DC8((uint64_t)self, (uint64_t)a2, a3, (void (*)(void *__return_ptr, uint64_t))sub_100A54B5C);
}

- (void)setObject:(id)a3 forKeyedSubscript:(unint64_t)a4
{
  if (a3)
  {
    v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v7 = self;
  }
  sub_100557A70((uint64_t)v9, (uint64_t)v8);
  swift_beginAccess();
  sub_10057D61C((uint64_t)v8, a4);
  swift_endAccess();
  sub_100522F00((uint64_t)v9, &qword_101672BF0);
}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
  char v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_100A5544C((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC8Freeform14CRLPropertyMap)init
{
  result = (_TtC8Freeform14CRLPropertyMap *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end