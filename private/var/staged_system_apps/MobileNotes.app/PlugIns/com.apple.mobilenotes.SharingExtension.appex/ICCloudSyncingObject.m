@interface ICCloudSyncingObject
+ (void)undoablyPersistActivityEventsForMoveAction:(id)a3 oldObject:(id)a4 newObject:(id)a5;
- (void)persistJoinActivityEvent;
- (void)persistLeaveActivityEvent;
- (void)persistParticipantActivityEventsWithOldShare:(id)a3 newShare:(id)a4;
@end

@implementation ICCloudSyncingObject

+ (void)undoablyPersistActivityEventsForMoveAction:(id)a3 oldObject:(id)a4 newObject:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  _sSo20ICCloudSyncingObjectC38com_apple_mobilenotes_SharingExtensionE29undoablyPersistActivityEvents3for03oldC003newC0yAbCE10MoveActionC_ABSgAJtFZ_0((uint64_t)v7, a4, a5);
}

- (void)persistParticipantActivityEventsWithOldShare:(id)a3 newShare:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.value.super.super.Class isa = self;
  Class isa = v12.value.super.super.isa;
  v11.value.super.super.Class isa = (Class)a3;
  v11.is_nil = (char)a4;
  ICCloudSyncingObject.persistParticipantActivityEvents(oldShare:newShare:)(v11, v12);
}

- (void)persistJoinActivityEvent
{
  v2 = self;
  ICCloudSyncingObject.persistJoinActivityEvent()();
}

- (void)persistLeaveActivityEvent
{
  v2 = self;
  ICCloudSyncingObject.persistLeaveActivityEvent()();
}

@end