@interface AccessRecordObject#1inPAAccessReader._accessRecordsForReport(from:to:)
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)accessCount;
- (NSString)accessorBundleID;
- (NSString)category;
- (NSString)identifier;
- (_TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject)init;
- (int64_t)timing;
@end

@implementation AccessRecordObject#1inPAAccessReader._accessRecordsForReport(from:to:)

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A8FC75B8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)accessorBundleID
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A8FC75B8();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)category
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)&self->record[OBJC_IVAR____TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject_record
                                                                          + 24]);
}

- (int64_t)timing
{
  uint64_t v3 = type metadata accessor for AccessRecord.Timing(0);
  MEMORY[0x1F4188790](v3, v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self
     + OBJC_IVAR____TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject_record;
  uint64_t v8 = type metadata accessor for AccessRecord(0);
  sub_1A8FC6670((uint64_t)&v7[*(int *)(v8 + 28)], (uint64_t)v6, type metadata accessor for AccessRecord.Timing);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_1A8FC64EC((uint64_t)v6, type metadata accessor for AccessRecord.Timing);
      return 2;
    }
    else
    {
      v11 = &v6[*(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E97AED20) + 48)];
      uint64_t v12 = sub_1A8FC7548();
      v13 = *(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8);
      v14 = self;
      v13(v11, v12);
      v13(v6, v12);

      return 3;
    }
  }
  else
  {
    sub_1A8FC64EC((uint64_t)v6, type metadata accessor for AccessRecord.Timing);
    return 1;
  }
}

- (NSDate)startDate
{
  return (NSDate *)sub_1A8FBF1A4(self, (uint64_t)a2, (void (*)(void))sub_1A8FBEF88);
}

- (NSDate)endDate
{
  return (NSDate *)sub_1A8FBF1A4(self, (uint64_t)a2, (void (*)(void))sub_1A8FBF2D0);
}

- (NSNumber)accessCount
{
  v2 = (char *)self
     + OBJC_IVAR____TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject_record;
  uint64_t v3 = type metadata accessor for AccessRecord(0);
  id v4 = 0;
  uint64_t v5 = &v2[*(int *)(v3 + 32)];
  if ((v5[8] & 1) == 0) {
    id v4 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, *(void *)v5);
  }

  return (NSNumber *)v4;
}

- (_TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject)init
{
  result = (_TtCFE17PrivacyAccountingCSo14PAAccessReader23_accessRecordsForReportFzT4fromV10Foundation4Date2toS2__CSo12NSEnumeratorL_18AccessRecordObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end