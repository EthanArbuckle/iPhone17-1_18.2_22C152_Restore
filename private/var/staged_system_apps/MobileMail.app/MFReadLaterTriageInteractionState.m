@interface MFReadLaterTriageInteractionState
+ (_TtC10MobileMail33MFReadLaterTriageInteractionState)stateWithDate:(id)a3;
+ (_TtC10MobileMail33MFReadLaterTriageInteractionState)stateWithMessageListItems:(id)a3;
+ (id)removeDateState;
- (BOOL)hasReadLater;
- (BOOL)isCancelled;
- (BOOL)isInitialState;
- (BOOL)isRemoveDate;
- (BOOL)shouldPresentCustomDatePicker;
- (NSDate)date;
- (_TtC10MobileMail33MFReadLaterTriageInteractionState)init;
- (void)didSelectCustomDate:(id)a3;
- (void)perform:(int64_t)a3;
- (void)removeDate;
@end

@implementation MFReadLaterTriageInteractionState

+ (_TtC10MobileMail33MFReadLaterTriageInteractionState)stateWithMessageListItems:(id)a3
{
  swift_getObjCClassMetadata();
  id v3 = a3;
  sub_10001C210(&qword_100692E00);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v7 = sub_10039DFFC(v5);
  swift_bridgeObjectRelease();

  return (_TtC10MobileMail33MFReadLaterTriageInteractionState *)v7;
}

+ (_TtC10MobileMail33MFReadLaterTriageInteractionState)stateWithDate:(id)a3
{
  id v10 = a1;
  id v18 = a3;
  swift_getObjCClassMetadata();
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = v11 - 8;
  unint64_t v14 = (*(void *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v11);
  v15 = (char *)&v7 - v14;
  unint64_t v16 = (*(void *)(*(void *)(sub_10001C210(&qword_100694150) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  id v3 = (void *)__chkstk_darwin(v18);
  uint64_t v17 = (uint64_t)&v7 - v16;
  id v4 = v3;
  if (v18)
  {
    id v9 = v18;
    id v8 = v18;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v17, v15, v11);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(v17, 0, 1, v11);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v17, 1, 1, v11);
  }
  swift_getObjCClassMetadata();
  id v7 = sub_10039E3A0(v17);
  sub_100287D94(v17);
  uint64_t v5 = v7;

  return (_TtC10MobileMail33MFReadLaterTriageInteractionState *)v5;
}

+ (id)removeDateState
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  id v2 = sub_10039BE40();

  return v2;
}

- (BOOL)shouldPresentCustomDatePicker
{
  id v2 = self;
  sub_10039EDEC();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (BOOL)isInitialState
{
  id v2 = self;
  sub_10039EF98();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (BOOL)isRemoveDate
{
  id v2 = self;
  sub_10039F118();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (BOOL)isCancelled
{
  id v2 = self;
  sub_10039F298();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (BOOL)hasReadLater
{
  id v2 = self;
  sub_10039F418();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (NSDate)date
{
  id v10 = self;
  uint64_t v3 = sub_10001C210(&qword_100694150);
  unint64_t v9 = (*(void *)(*(void *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin(v3);
  uint64_t v11 = (uint64_t)&isa - v9;
  id v4 = self;
  sub_10039F6AC(v11);

  uint64_t v12 = type metadata accessor for Date();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = v12 - 8;
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v13 + 48))(v11, 1) == 1)
  {
    Class v8 = 0;
  }
  else
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    Class v8 = isa;
  }
  Class v5 = v8;

  return (NSDate *)v5;
}

- (_TtC10MobileMail33MFReadLaterTriageInteractionState)init
{
  return (_TtC10MobileMail33MFReadLaterTriageInteractionState *)sub_10039F784();
}

- (void)perform:(int64_t)a3
{
  uint64_t v3 = self;
  sub_1003A05A0(a3);
}

- (void)didSelectCustomDate:(id)a3
{
  uint64_t v13 = self;
  id v12 = a3;
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v11 - 8);
  uint64_t v9 = v11 - 8;
  unint64_t v7 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v10 = (uint64_t)&v6 - v7;
  id v4 = (id)__chkstk_darwin(v12);
  Class v5 = self;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1003A13B4(v10);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v11);
}

- (void)removeDate
{
  id v2 = self;
  sub_1003A1E70();
}

- (void).cxx_destruct
{
}

@end