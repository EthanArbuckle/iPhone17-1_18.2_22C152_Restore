@interface ICCallNoteCoordinator
+ (void)callRecordingEndedWithNoteID:(id)a3 recordingID:(id)a4 context:(id)a5;
+ (void)createNewCallNoteWithNoteID:(id)a3 recordingID:(id)a4 context:(id)a5;
+ (void)eventReporterLostSession:(id)a3;
+ (void)importAndDeleteCallRecordingFilesIfNeededFromDirectory:(id)a3 managedObjectContext:(id)a4;
- (ICCallNoteCoordinator)init;
@end

@implementation ICCallNoteCoordinator

+ (void)createNewCallNoteWithNoteID:(id)a3 recordingID:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  sub_1001B90E4(v7, v8, v9);
}

+ (void)callRecordingEndedWithNoteID:(id)a3 recordingID:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  sub_1001BA14C(v7, v8, v9);
}

+ (void)eventReporterLostSession:(id)a3
{
  id v4 = a3;
  sub_1001BABC8(a3);
}

- (ICCallNoteCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CallNoteCoordinator();
  return [(ICCallNoteCoordinator *)&v3 init];
}

+ (void)importAndDeleteCallRecordingFilesIfNeededFromDirectory:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v6 = sub_10002F214(&qword_10069B310);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  id v11 = a4;
  _s11MobileNotes19CallNoteCoordinatorC015importAndDeleteC22RecordingFilesIfNeeded9directory20managedObjectContexty10Foundation3URLVSg_So09NSManagedoP0CtFZ_0((uint64_t)v8, v11);

  sub_10002B754((uint64_t)v8, &qword_10069B310);
}

@end