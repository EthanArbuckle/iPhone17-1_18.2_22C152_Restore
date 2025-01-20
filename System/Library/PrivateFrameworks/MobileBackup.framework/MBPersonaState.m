@interface MBPersonaState
- (BOOL)closeRestorePlanWithPersona:(id)a3 snapshotUUID:(id)a4 error:(id *)a5;
- (BOOL)createRestorePlanWithPersona:(id)a3 snapshotUUID:(id)a4 error:(id *)a5;
- (BOOL)finishedAppRestores;
- (BOOL)isHoldingWorkAssertionForBackgroundRestore;
- (BOOL)restoreSessionOverridden;
- (MBBackgroundRestoreProgressMonitor)backgroundRestoreProgressMonitor;
- (MBCKDevice)deviceForRestore;
- (MBCKEncryptionManager)encryptionManager;
- (MBCKLockManager)lockManager;
- (MBRestoreOperationLogger)restoreLogger;
- (MBRestorePlanDB)restorePlan;
- (MBServiceRestoreSession)restoreSession;
- (MBStateInfo)backup;
- (MBStateInfo)initialMegaBackup;
- (MBStateInfo)restore;
- (NSArray)engines;
- (NSDictionary)restoreKeyBagsByID;
- (NSNumber)nextBackupSize;
- (OS_dispatch_group)serviceGroup;
- (OS_dispatch_source)delayedRestoreTimer;
- (OS_dispatch_source)restoreTTRTimer;
- (OS_os_transaction)restoreTransaction;
- (_TtC7backupd14MBPersonaState)init;
- (id)enginesByContext;
- (id)openOrUseExistingPlanWithPersona:(id)a3 snapshotUUID:(id)a4 error:(id *)a5;
- (id)restoreQosByContext;
- (id)unboostBackgroundRestoreHandler;
- (int)serviceState;
- (void)clearRestoreSession;
- (void)setBackgroundRestoreProgressMonitor:(id)a3;
- (void)setBackup:(id)a3;
- (void)setDelayedRestoreTimer:(id)a3;
- (void)setDeviceForRestore:(id)a3;
- (void)setEncryptionManager:(id)a3;
- (void)setEngines:(id)a3;
- (void)setEnginesByContext:(id)a3;
- (void)setFinishedAppRestores:(BOOL)a3;
- (void)setInitialMegaBackup:(id)a3;
- (void)setIsHoldingWorkAssertionForBackgroundRestore:(BOOL)a3;
- (void)setLockManager:(id)a3;
- (void)setNextBackupSize:(id)a3;
- (void)setRestore:(id)a3;
- (void)setRestoreKeyBagsByID:(id)a3;
- (void)setRestoreLogger:(id)a3;
- (void)setRestoreQosByContext:(id)a3;
- (void)setRestoreSession:(id)a3;
- (void)setRestoreSessionOverridden:(BOOL)a3;
- (void)setRestoreTTRTimer:(id)a3;
- (void)setRestoreTransaction:(id)a3;
- (void)setServiceGroup:(id)a3;
- (void)setServiceState:(int)a3;
- (void)setUnboostBackgroundRestoreHandler:(id)a3;
- (void)unboostBackgroundRestore;
@end

@implementation MBPersonaState

- (MBStateInfo)backup
{
  return (MBStateInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC7backupd14MBPersonaState_backup));
}

- (void)setBackup:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_backup);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_backup) = (Class)a3;
  id v3 = a3;
}

- (MBStateInfo)initialMegaBackup
{
  return (MBStateInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC7backupd14MBPersonaState_initialMegaBackup));
}

- (void)setInitialMegaBackup:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_initialMegaBackup);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_initialMegaBackup) = (Class)a3;
  id v3 = a3;
}

- (NSNumber)nextBackupSize
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC7backupd14MBPersonaState_nextBackupSize));
}

- (void)setNextBackupSize:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_nextBackupSize);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_nextBackupSize) = (Class)a3;
  id v3 = a3;
}

- (MBStateInfo)restore
{
  return (MBStateInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC7backupd14MBPersonaState_restore));
}

- (void)setRestore:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restore);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restore) = (Class)a3;
  id v3 = a3;
}

- (MBServiceRestoreSession)restoreSession
{
  return (MBServiceRestoreSession *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreSession));
}

- (void)setRestoreSession:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreSession);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreSession) = (Class)a3;
  id v3 = a3;
}

- (BOOL)restoreSessionOverridden
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreSessionOverridden);
}

- (void)setRestoreSessionOverridden:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreSessionOverridden) = a3;
}

- (MBRestorePlanDB)restorePlan
{
  return (MBRestorePlanDB *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC7backupd14MBPersonaState__restorePlan));
}

- (BOOL)isHoldingWorkAssertionForBackgroundRestore
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC7backupd14MBPersonaState_isHoldingWorkAssertionForBackgroundRestore);
}

- (void)setIsHoldingWorkAssertionForBackgroundRestore:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_isHoldingWorkAssertionForBackgroundRestore) = a3;
}

- (id)unboostBackgroundRestoreHandler
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_unboostBackgroundRestoreHandler))
  {
    uint64_t v2 = *(void *)&self->backup[OBJC_IVAR____TtC7backupd14MBPersonaState_unboostBackgroundRestoreHandler];
    v5[4] = *(Class *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7backupd14MBPersonaState_unboostBackgroundRestoreHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100034878;
    v5[3] = &unk_100410700;
    id v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)setUnboostBackgroundRestoreHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_100036FBC;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC7backupd14MBPersonaState_unboostBackgroundRestoreHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_unboostBackgroundRestoreHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_100036EFC(v8);
}

- (MBCKDevice)deviceForRestore
{
  return (MBCKDevice *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC7backupd14MBPersonaState_deviceForRestore));
}

- (void)setDeviceForRestore:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_deviceForRestore);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_deviceForRestore) = (Class)a3;
  id v3 = a3;
}

- (MBCKLockManager)lockManager
{
  return (MBCKLockManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR____TtC7backupd14MBPersonaState_lockManager));
}

- (void)setLockManager:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_lockManager);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_lockManager) = (Class)a3;
  id v3 = a3;
}

- (MBCKEncryptionManager)encryptionManager
{
  uint64_t v2 = self;
  id v3 = sub_100034A60();

  return (MBCKEncryptionManager *)v3;
}

- (void)setEncryptionManager:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState____lazy_storage___encryptionManager);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState____lazy_storage___encryptionManager) = (Class)a3;
  id v3 = a3;
}

- (MBBackgroundRestoreProgressMonitor)backgroundRestoreProgressMonitor
{
  return (MBBackgroundRestoreProgressMonitor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR____TtC7backupd14MBPersonaState_backgroundRestoreProgressMonitor));
}

- (void)setBackgroundRestoreProgressMonitor:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_backgroundRestoreProgressMonitor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_backgroundRestoreProgressMonitor) = (Class)a3;
  id v3 = a3;
}

- (MBRestoreOperationLogger)restoreLogger
{
  return (MBRestoreOperationLogger *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                             + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreLogger));
}

- (void)setRestoreLogger:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreLogger);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreLogger) = (Class)a3;
  id v3 = a3;
}

- (OS_os_transaction)restoreTransaction
{
  uint64_t v2 = (void *)swift_unknownObjectRetain();
  return (OS_os_transaction *)v2;
}

- (void)setRestoreTransaction:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreTransaction) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (id)restoreQosByContext
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreQosByContext));
}

- (void)setRestoreQosByContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreQosByContext);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreQosByContext) = (Class)a3;
  id v3 = a3;
}

- (NSDictionary)restoreKeyBagsByID
{
  sub_10001C0F4(0, &qword_10047DAB0);
  sub_10001C0F4(0, &qword_10047DD30);
  sub_100036F1C();
  swift_bridgeObjectRetain();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2.super.isa;
}

- (void)setRestoreKeyBagsByID:(id)a3
{
  sub_10001C0F4(0, &qword_10047DAB0);
  sub_10001C0F4(0, &qword_10047DD30);
  sub_100036F1C();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreKeyBagsByID) = (Class)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
}

- (BOOL)finishedAppRestores
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_finishedAppRestores);
}

- (void)setFinishedAppRestores:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_finishedAppRestores) = a3;
}

- (int)serviceState
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_serviceState);
}

- (void)setServiceState:(int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_serviceState) = a3;
}

- (OS_dispatch_group)serviceGroup
{
  return (OS_dispatch_group *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC7backupd14MBPersonaState_serviceGroup));
}

- (void)setServiceGroup:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_serviceGroup);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_serviceGroup) = (Class)a3;
  id v3 = a3;
}

- (NSArray)engines
{
  sub_10001C0F4(0, (unint64_t *)&unk_10047DD20);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)v2.super.isa;
}

- (void)setEngines:(id)a3
{
  sub_10001C0F4(0, (unint64_t *)&unk_10047DD20);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_engines) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
}

- (id)enginesByContext
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC7backupd14MBPersonaState_enginesByContext));
}

- (void)setEnginesByContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_enginesByContext);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_enginesByContext) = (Class)a3;
  id v3 = a3;
}

- (OS_dispatch_source)delayedRestoreTimer
{
  return (OS_dispatch_source *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC7backupd14MBPersonaState_delayedRestoreTimer));
}

- (void)setDelayedRestoreTimer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_delayedRestoreTimer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_delayedRestoreTimer) = (Class)a3;
  id v3 = a3;
}

- (OS_dispatch_source)restoreTTRTimer
{
  return (OS_dispatch_source *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreTTRTimer));
}

- (void)setRestoreTTRTimer:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreTTRTimer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreTTRTimer) = (Class)a3;
  id v3 = a3;
}

- (void)unboostBackgroundRestore
{
  NSArray v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_unboostBackgroundRestoreHandler);
  id v3 = *(void (**)(void))((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7backupd14MBPersonaState_unboostBackgroundRestoreHandler);
  if (v3)
  {
    *NSArray v2 = 0;
    v2[1] = 0;
    id v4 = self;
    sub_100036F0C((uint64_t)v3);
    sub_100036EFC((uint64_t)v3);
    v3(0);
    sub_100036EFC((uint64_t)v3);
  }
}

- (void)clearRestoreSession
{
  NSArray v2 = self;
  sub_100035104();
}

- (_TtC7backupd14MBPersonaState)init
{
  return (_TtC7backupd14MBPersonaState *)sub_100035404();
}

- (void).cxx_destruct
{
  sub_100036EFC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC7backupd14MBPersonaState_unboostBackgroundRestoreHandler));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7backupd14MBPersonaState____lazy_storage___encryptionManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7backupd14MBPersonaState_backgroundRestoreProgressMonitor));

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7backupd14MBPersonaState_restoreTTRTimer);
}

- (BOOL)createRestorePlanWithPersona:(id)a3 snapshotUUID:(id)a4 error:(id *)a5
{
  return sub_100036BA0(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (void (*)(id, uint64_t, uint64_t))sub_100035E44);
}

- (id)openOrUseExistingPlanWithPersona:(id)a3 snapshotUUID:(id)a4 error:(id *)a5
{
  if (a4)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  id v11 = a3;
  v12 = self;
  v13 = sub_1000361D0(v11, v8, v10);
  v16 = v13;
  if (v13)
  {

LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (v10)
  {
    sub_10003651C(v11, v8, v10);
    v16 = v18;

    goto LABEL_9;
  }
  sub_1000467F0(1, 0xD000000000000025, 0x8000000100306CB0, 0xD000000000000010, 0x8000000100306C00);
  swift_willThrow();

  swift_bridgeObjectRelease();
  if (a5)
  {
    v14 = (void *)_convertErrorToNSError(_:)();
    swift_errorRelease();
    id v15 = v14;
    v16 = 0;
    *a5 = v14;
  }
  else
  {
    swift_errorRelease();
    v16 = 0;
  }
LABEL_11:
  return v16;
}

- (BOOL)closeRestorePlanWithPersona:(id)a3 snapshotUUID:(id)a4 error:(id *)a5
{
  return sub_100036BA0(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, sub_1000369BC);
}

@end