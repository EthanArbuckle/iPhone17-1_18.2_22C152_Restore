@interface ICQuotaExceededAlertController
- (BOOL)didShowForRecord;
- (BOOL)ignoresDebouncing;
- (BOOL)showIfNeededFromWindow:(id)a3;
- (CKRecordID)recordID;
- (ICCloudContext)cloudContext;
- (ICQuotaExceededAlertController)init;
- (ICQuotaExceededAlertController)initWithRecordID:(id)a3 accountID:(id)a4 date:(id)a5;
- (NSDate)date;
- (NSDate)lastShowDate;
- (NSManagedObjectContext)managedObjectContext;
- (NSString)accountID;
- (double)minimumLastShowDateInterval;
- (id)makeAlert;
- (void)setCloudContext:(id)a3;
- (void)setDidShowForRecord:(BOOL)a3;
- (void)setIgnoresDebouncing:(BOOL)a3;
- (void)setLastShowDate:(id)a3;
- (void)setManagedObjectContext:(id)a3;
- (void)setMinimumLastShowDateInterval:(double)a3;
@end

@implementation ICQuotaExceededAlertController

- (NSString)accountID
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSDate)date
{
  v2.super.isa = Date._bridgeToObjectiveC()().super.isa;

  return (NSDate *)v2.super.isa;
}

- (CKRecordID)recordID
{
  return (CKRecordID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR___ICQuotaExceededAlertController_recordID));
}

- (BOOL)didShowForRecord
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_didShowForRecord);
}

- (void)setDidShowForRecord:(BOOL)a3
{
  BOOL v3 = a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_didShowForRecord) = a3;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_recordID);
  v5 = self;
  id v6 = [v4 recordName];
  if (!v6)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  [self setDidShowExceededStorageQuotaAlert:v3 forNoteWithIdentifier:v6];
}

- (BOOL)ignoresDebouncing
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_ignoresDebouncing);
}

- (void)setIgnoresDebouncing:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_ignoresDebouncing) = a3;
}

- (NSDate)lastShowDate
{
  uint64_t v3 = sub_10002F214((uint64_t *)&unk_1006A3E20);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (char *)self + OBJC_IVAR___ICQuotaExceededAlertController_lastShowDate;
  swift_beginAccess();
  sub_10021E8BC((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSDate *)isa;
}

- (void)setLastShowDate:(id)a3
{
  uint64_t v5 = sub_10002F214((uint64_t *)&unk_1006A3E20);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_10021CE3C((uint64_t)v7);
}

- (ICCloudContext)cloudContext
{
  return (ICCloudContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___ICQuotaExceededAlertController_cloudContext));
}

- (void)setCloudContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_cloudContext);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_cloudContext) = (Class)a3;
  id v3 = a3;
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICQuotaExceededAlertController_managedObjectContext));
}

- (void)setManagedObjectContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_managedObjectContext);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_managedObjectContext) = (Class)a3;
  id v3 = a3;
}

- (double)minimumLastShowDateInterval
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_minimumLastShowDateInterval);
}

- (void)setMinimumLastShowDateInterval:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___ICQuotaExceededAlertController_minimumLastShowDateInterval) = a3;
}

- (ICQuotaExceededAlertController)initWithRecordID:(id)a3 accountID:(id)a4 date:(id)a5
{
  uint64_t v6 = type metadata accessor for Date();
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  v13 = (ICQuotaExceededAlertController *)sub_10021E40C(v12, v9, v11, (uint64_t)v8);

  return v13;
}

- (BOOL)showIfNeededFromWindow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  char v6 = sub_10021D0C0();
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    *(void *)(v7 + 24) = v4;
    v10[4] = sub_10021E8B4;
    v10[5] = v7;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 1107296256;
    v10[2] = sub_100262E2C;
    v10[3] = &unk_100630BC8;
    uint64_t v8 = _Block_copy(v10);
    id v4 = v4;
    uint64_t v5 = v5;
    swift_release();
    performBlockOnMainThread();
    _Block_release(v8);
  }

  return v6 & 1;
}

- (id)makeAlert
{
  NSDate v2 = self;
  id v3 = sub_10021D974();

  return v3;
}

- (ICQuotaExceededAlertController)init
{
  result = (ICQuotaExceededAlertController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR___ICQuotaExceededAlertController_date;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_10002B754((uint64_t)self + OBJC_IVAR___ICQuotaExceededAlertController_lastShowDate, (uint64_t *)&unk_1006A3E20);

  swift_bridgeObjectRelease();
}

@end