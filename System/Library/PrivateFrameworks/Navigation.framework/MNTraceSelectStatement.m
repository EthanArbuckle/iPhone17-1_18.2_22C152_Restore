@interface MNTraceSelectStatement
- (double)doubleValue:(id)a3;
- (id)dataValue:(id)a3;
- (id)initForTrace:(id)a3 statement:(id)a4 outError:(id *)a5;
- (id)objectValue:(id)a3 ofClass:(Class)a4;
- (id)objectsValue:(id)a3 ofClasses:(id)a4;
- (id)stringValue:(id)a3;
- (int64_t)intValue:(id)a3;
@end

@implementation MNTraceSelectStatement

- (id)initForTrace:(id)a3 statement:(id)a4 outError:(id *)a5
{
  id v5 = a3;
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (int64_t)intValue:(id)a3
{
  uint64_t v4 = sub_1B5531EE0();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  Swift::Int v9 = MNTraceSelectStatement.intValue(_:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (double)doubleValue:(id)a3
{
  uint64_t v4 = sub_1B5531EE0();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  double v9 = MNTraceSelectStatement.doubleValue(_:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (id)stringValue:(id)a3
{
  uint64_t v4 = sub_1B5531EE0();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = MNTraceSelectStatement.stringValue(_:)(v8).value._object;

  swift_bridgeObjectRelease();
  if (object)
  {
    v10 = (void *)sub_1B5531ED0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)dataValue:(id)a3
{
  uint64_t v4 = sub_1B5531EE0();
  unint64_t v6 = v5;
  v7 = self;
  Swift::String v8 = MNTraceSelectStatement.dataValue(_:)(v4, v6);
  unint64_t v10 = v9;

  swift_bridgeObjectRelease();
  if (v10 >> 60 == 15)
  {
    v11 = 0;
  }
  else
  {
    v11 = (void *)sub_1B5531E60();
    sub_1B543914C((uint64_t)v8, v10);
  }
  return v11;
}

- (id)objectValue:(id)a3 ofClass:(Class)a4
{
  sub_1B5531EE0();
  swift_getObjCClassMetadata();
  unint64_t v5 = self;
  unint64_t v6 = (void *)MNTraceSelectStatement.objectValue<A>(_:of:)();

  swift_bridgeObjectRelease();
  return v6;
}

- (id)objectsValue:(id)a3 ofClasses:(id)a4
{
  uint64_t v5 = sub_1B5531EE0();
  v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9D54E30);
  uint64_t v8 = sub_1B5531F60();
  unint64_t v9 = self;
  v10._countAndFlagsBits = v5;
  v10._object = v7;
  unint64_t v11 = (unint64_t)MNTraceSelectStatement.objectsValue(_:of:)(v10, (Swift::OpaquePointer)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v11)
  {
    sub_1B5438B88(0, &qword_1E9D54DD8);
    sub_1B54390E4();
    v12 = (void *)sub_1B5531EB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

@end