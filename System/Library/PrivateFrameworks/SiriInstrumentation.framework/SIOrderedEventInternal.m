@interface SIOrderedEventInternal
+ (id)deserializeFrom:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSUUID)messageUUID;
- (NSUUID)testFingerprint;
- (SIComponentIdentifier)clusterId;
- (SILogicalTimestampInternal)logicalTimestamp;
- (SIOrderedEventInternal)init;
- (SIOrderedEventInternal)initWithCoder:(id)a3;
- (SIOrderedEventInternal)initWithData:(id)a3;
- (SIOrderedEventInternal)initWithLogicalTimestamp:(id)a3 messageUUID:(id)a4 tluEvent:(id)a5;
- (SIOrderedEventInternal)initWithLogicalTimestamp:(id)a3 tluEvent:(id)a4;
- (SISchemaTopLevelUnionType)tluEvent;
- (id)copyWithZone:(void *)a3;
- (void)setClusterId:(id)a3;
- (void)setLogicalTimestamp:(id)a3;
- (void)setMessageUUID:(id)a3;
- (void)setTestFingerprint:(id)a3;
- (void)setTluEvent:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIOrderedEventInternal

- (SILogicalTimestampInternal)logicalTimestamp
{
  v2 = sub_1ADA79E24();
  return (SILogicalTimestampInternal *)v2;
}

- (void)setLogicalTimestamp:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1ADA79EC8((uint64_t)a3);
}

- (SISchemaTopLevelUnionType)tluEvent
{
  v2 = sub_1ADA79F38();
  return (SISchemaTopLevelUnionType *)v2;
}

- (void)setTluEvent:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1ADA79FDC((uint64_t)a3);
}

- (NSUUID)messageUUID
{
  return (NSUUID *)sub_1ADA7A214((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1ADA7A030);
}

- (void)setMessageUUID:(id)a3
{
}

- (SIComponentIdentifier)clusterId
{
  v2 = sub_1ADA7A094();
  return (SIComponentIdentifier *)v2;
}

- (void)setClusterId:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1ADA7A138((uint64_t)a3);
}

- (NSUUID)testFingerprint
{
  return (NSUUID *)sub_1ADA7A214((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1ADA7A30C);
}

- (void)setTestFingerprint:(id)a3
{
}

- (SIOrderedEventInternal)initWithData:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    sub_1AE338198();
  }
  return (SIOrderedEventInternal *)OrderedEvent.init(data:)();
}

- (SIOrderedEventInternal)initWithLogicalTimestamp:(id)a3 messageUUID:(id)a4 tluEvent:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB576BE0);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1AE3381F8();
    uint64_t v11 = sub_1AE338228();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = sub_1AE338228();
    uint64_t v12 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v10, v12, 1, v11);
  return (SIOrderedEventInternal *)OrderedEvent.init(logicalTimestamp:messageUUID:tluEvent:)(a3, (uint64_t)v10, a5);
}

- (SIOrderedEventInternal)initWithLogicalTimestamp:(id)a3 tluEvent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (SIOrderedEventInternal *)OrderedEvent.init(logicalTimestamp:tluEvent:)();
}

- (SIOrderedEventInternal)initWithCoder:(id)a3
{
  return (SIOrderedEventInternal *)sub_1ADA7B464(a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1ADA7C24C(v4);
}

- (BOOL)readFrom:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  id v6 = self;
  LOBYTE(v3) = sub_1ADA7C850((BOOL)v3);

  return v3 & 1;
}

+ (id)deserializeFrom:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1AE338198();
  unint64_t v6 = v5;

  swift_getObjCClassMetadata();
  v7 = (void *)static OrderedEvent.deserialize(from:)();
  sub_1ADA753D8(v4, v6);
  return v7;
}

- (SIOrderedEventInternal)init
{
}

- (void).cxx_destruct
{
  sub_1ADA75190((uint64_t)self + OBJC_IVAR___SIOrderedEventInternal_messageUUID);
  id v3 = (char *)self + OBJC_IVAR___SIOrderedEventInternal_testFingerprint;
  sub_1ADA75190((uint64_t)v3);
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  OrderedEvent.copy(with:)(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  uint64_t v4 = (void *)sub_1AE338888();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

@end