@interface _WBParticipantPresenceCoordinator
- (_WBParticipantPresenceCoordinator)init;
- (_WBParticipantPresenceCoordinatorDelegate)delegate;
- (void)beginCollaborationForShare:(id)a3;
- (void)beginDeviceCoordination;
- (void)endCollaborationForShare:(id)a3;
- (void)endDeviceCoordination;
- (void)getActiveParticipantsInTabGroupWithIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)getActiveParticipantsInTabWithIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)getCurrentConnectionStateWithCompletionHandler:(id)a3;
- (void)getCurrentLocationIdentifiersForParticipantIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)getTabGroupIdentifierForParticipantIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)getTabIdentifierForParticipantIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (void)moveCurrentParticipantToTabIdentifier:(id)a3 inTabGroupIdentifier:(id)a4 withDeviceIdentifier:(id)a5;
- (void)removeTabGroupWithIdentifier:(id)a3;
- (void)removeTabWithIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)shareDidUpdate:(id)a3;
@end

@implementation _WBParticipantPresenceCoordinator

- (_WBParticipantPresenceCoordinator)init
{
  return (_WBParticipantPresenceCoordinator *)ParticipantPresenceCoordinator.init()();
}

- (void)setDelegate:(id)a3
{
}

- (void)getActiveParticipantsInTabWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &async function pointer to partial apply for @objc closure #1 in ParticipantPresenceCoordinator.activeParticipantsInTab(_:);
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &_sIeghH_IeAgH_TRTATu;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v8, (uint64_t)&_sIeAgH_ytIeAgHr_TRTATu, (uint64_t)v13);
  swift_release();
}

- (void)moveCurrentParticipantToTabIdentifier:(id)a3 inTabGroupIdentifier:(id)a4 withDeviceIdentifier:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388]();
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    uint64_t v10 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v12 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a3 = v11;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a4 = v13;
LABEL_6:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  uint64_t v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v9, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v10;
  v18[5] = a3;
  v18[6] = v12;
  v18[7] = a4;
  v18[8] = self;
  v18[9] = v14;
  v18[10] = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19 = self;
  swift_bridgeObjectRetain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in ParticipantPresenceCoordinator.moveCurrentParticipant(toTab:inTabGroup:withDeviceIdentifier:)partial apply, (uint64_t)v18);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_WBParticipantPresenceCoordinatorDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR____WBParticipantPresenceCoordinator_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x263E3FF60](v2);
  return (_WBParticipantPresenceCoordinatorDelegate *)v3;
}

- (void)getCurrentConnectionStateWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &async function pointer to partial apply for @objc closure #1 in ParticipantPresenceCoordinator.currentConnectionState();
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &_sIeghH_IeAgH_TRTA_174Tu;
  v12[5] = v11;
  v13 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v7, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_179Tu, (uint64_t)v12);
  swift_release();
}

- (void)beginDeviceCoordination
{
  v2 = self;
  ParticipantPresenceCoordinator.beginDeviceCoordination()();
}

- (void)endDeviceCoordination
{
  v2 = self;
  ParticipantPresenceCoordinator.endDeviceCoordination()();
}

- (void)beginCollaborationForShare:(id)a3
{
}

- (void)shareDidUpdate:(id)a3
{
  id v5 = a3;
  v4 = self;
  ParticipantPresenceCoordinator.shareDidUpdate(_:)((CKShare)v5);
}

- (void)endCollaborationForShare:(id)a3
{
}

- (void)removeTabGroupWithIdentifier:(id)a3
{
}

- (void)removeTabWithIdentifier:(id)a3
{
}

- (void)getTabGroupIdentifierForParticipantIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in ParticipantPresenceCoordinator.tabGroupIdentifierForParticipant(_:);
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_134Tu;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_139Tu, (uint64_t)v14);
  swift_release();
}

- (void)getTabIdentifierForParticipantIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in ParticipantPresenceCoordinator.tabIdentifierForParticipant(_:);
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_119Tu;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_124Tu, (uint64_t)v14);
  swift_release();
}

- (void)getCurrentLocationIdentifiersForParticipantIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in ParticipantPresenceCoordinator.currentLocationIdentifiersForParticipant(_:);
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_105Tu;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_110Tu, (uint64_t)v14);
  swift_release();
}

- (void)getActiveParticipantsInTabGroupWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &async function pointer to partial apply for @objc closure #1 in ParticipantPresenceCoordinator.activeParticipantsInTabGroup(_:);
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &_sIeghH_IeAgH_TRTA_91Tu;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v9, (uint64_t)&_sIeAgH_ytIeAgHr_TRTA_96Tu, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  outlined destroy of weak ParticipantPresenceCoordinatorDelegate?((uint64_t)self + OBJC_IVAR____WBParticipantPresenceCoordinator_delegate);
  swift_release();
  swift_release();
}

@end