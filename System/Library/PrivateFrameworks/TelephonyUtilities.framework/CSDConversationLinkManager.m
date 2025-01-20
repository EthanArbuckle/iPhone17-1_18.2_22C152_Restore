@interface CSDConversationLinkManager
- (CSDConversationLinkManager)init;
- (CSDConversationLinkManagerDelegate)delegate;
- (id)activateLinkForPseudonym:(id)a3 updateGroupUUID:(id)a4 updateInvitedHandles:(id)a5;
- (id)conversationLinkDescriptorsWithGroupUUIDs:(id)a3 error:(id *)a4;
- (id)decryptLetMeInResponse:(id)a3 pseudonym:(id)a4 requestorKeyAgreement:(id)a5;
- (id)encryptLetMeInResponse:(id)a3 pseudonym:(id)a4 responseKeyData:(id)a5;
- (id)fetchActivatedLinksWithError:(id *)a3;
- (id)fetchDeletedLinksWithError:(id *)a3;
- (id)getInactiveLinkForHandle:(id)a3;
- (void)activateLinkForPseudonym:(id)a3 completionHandler:(id)a4;
- (void)activeAccountsChangedForService:(id)a3;
- (void)addInvitedHandles:(id)a3 pseudonym:(id)a4 completionHandler:(id)a5;
- (void)checkLinkValidityWithPseudonym:(id)a3 completionHandler:(id)a4;
- (void)decryptLetMeInRequest:(id)a3 pseudonym:(id)a4 fromHandle:(id)a5 completionHandler:(id)a6;
- (void)encryptLetMeInRequest:(id)a3 link:(id)a4 completionHandler:(id)a5;
- (void)generateLinkWithGroupUUID:(id)a3 invitedHandles:(id)a4 originatorHandle:(id)a5 linkLifetimeScope:(int64_t)a6 completionHandler:(id)a7;
- (void)generateLinkWithInvitedHandles:(id)a3 originatorHandle:(id)a4 linkLifetimeScope:(int64_t)a5 completionHandler:(id)a6;
- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4;
- (void)getLinkDescriptorWithPseudonym:(id)a3 includeInactive:(BOOL)a4 completionHandler:(id)a5;
- (void)invalidateLinkWithPseudonym:(id)a3 deleteReason:(int64_t)a4 completionHandler:(id)a5;
- (void)linkSyncStateWithIncludeLinks:(BOOL)a3 completion:(id)a4;
- (void)recoverLinksForPseudonyms:(id)a3;
- (void)renewLinkWithPseudonym:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5;
- (void)renewPseudonymIfNeeded:(NSString *)a3 completionHandler:(id)a4;
- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3;
- (void)service:(id)a3 pseudonymRemoved:(id)a4;
- (void)service:(id)a3 pseudonymUpdated:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLinkName:(id)a3 forLink:(id)a4 completionHandler:(id)a5;
- (void)storeReceivedLink:(id)a3 fromHandle:(id)a4 isUpdate:(BOOL)a5 completionHandler:(id)a6;
- (void)validateAllLinks;
@end

@implementation CSDConversationLinkManager

- (CSDConversationLinkManager)init
{
  return (CSDConversationLinkManager *)sub_10029AF30();
}

- (CSDConversationLinkManagerDelegate)delegate
{
  v2 = (void *)sub_10029B064();

  return (CSDConversationLinkManagerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10029B0D4((uint64_t)a3);
}

- (id)fetchActivatedLinksWithError:(id *)a3
{
  return sub_10029B4C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_10029B0EC);
}

- (id)fetchDeletedLinksWithError:(id *)a3
{
  return sub_10029B4C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_10029B318);
}

- (void)generateLinkWithGroupUUID:(id)a3 invitedHandles:(id)a4 originatorHandle:(id)a5 linkLifetimeScope:(int64_t)a6 completionHandler:(id)a7
{
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a7);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    sub_1001F6204(0, (unint64_t *)&unk_100586E00);
    sub_100210D5C((unint64_t *)&qword_100585920, (unint64_t *)&unk_100586E00);
    static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  *(void *)(swift_allocObject() + 16) = v15;
  id v16 = a5;
  v17 = self;
  sub_10029BF28();
  swift_release();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)generateLinkWithInvitedHandles:(id)a3 originatorHandle:(id)a4 linkLifetimeScope:(int64_t)a5 completionHandler:(id)a6
{
  v9 = _Block_copy(a6);
  sub_1001F6204(0, (unint64_t *)&unk_100586E00);
  sub_100210D5C((unint64_t *)&qword_100585920, (unint64_t *)&unk_100586E00);
  uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v9);
  id v12 = a4;
  uint64_t v11 = self;
  sub_10029C9B4(v10, v12, a5, (char *)v11, v9);
  _Block_release(v9);
  swift_bridgeObjectRelease();
}

- (void)storeReceivedLink:(id)a3 fromHandle:(id)a4 isUpdate:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v15 = a3;
  id v12 = a4;
  uint64_t v13 = self;
  sub_10029CE7C(v15, v14, a5, (uint64_t)sub_1002B7F74, v11);
  swift_release();
}

- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v8 = self;
  sub_10029E59C(a3, (uint64_t)sub_1002B7A78, v7);

  swift_release();
}

- (void)activateLinkForPseudonym:(id)a3 completionHandler:(id)a4
{
  v5 = (uint64_t (*)())_Block_copy(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v5 = sub_1002B7F70;
  }
  v6 = self;
  sub_10029EABC();
  sub_100208490((uint64_t)v5);
  swift_bridgeObjectRelease();
}

- (id)activateLinkForPseudonym:(id)a3 updateGroupUUID:(id)a4 updateInvitedHandles:(id)a5
{
  uint64_t v8 = sub_1001F081C((uint64_t *)&unk_100585580);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for UUID();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = type metadata accessor for UUID();
    uint64_t v12 = 1;
  }
  sub_1001F0530((uint64_t)v10, v12, 1, v11);
  if (a5)
  {
    sub_1001F6204(0, (unint64_t *)&unk_100586E00);
    sub_100210D5C((unint64_t *)&qword_100585920, (unint64_t *)&unk_100586E00);
    static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v13 = self;
  sub_10029F23C();
  id v15 = v14;
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_100235804((uint64_t)v10, (uint64_t *)&unk_100585580);

  return v15;
}

- (id)getInactiveLinkForHandle:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002A1528();
  uint64_t v7 = v6;

  return v7;
}

- (void)getLinkDescriptorWithPseudonym:(id)a3 includeInactive:(BOOL)a4 completionHandler:(id)a5
{
  v6 = _Block_copy(a5);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v6;
  uint64_t v7 = self;
  sub_1002A185C();

  swift_bridgeObjectRelease();

  swift_release();
}

- (id)conversationLinkDescriptorsWithGroupUUIDs:(id)a3 error:(id *)a4
{
  type metadata accessor for UUID();
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = self;
  sub_1002A1B50(v5);
  swift_bridgeObjectRelease();

  sub_1001F6204(0, (unint64_t *)&unk_100584DC0);
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v7.super.isa;
}

- (void)validateAllLinks
{
  v2 = self;
  sub_1002A1EDC();
}

- (void)invalidateLinkWithPseudonym:(id)a3 deleteReason:(int64_t)a4 completionHandler:(id)a5
{
  v6 = (uint64_t (*)())_Block_copy(a5);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = sub_1002B7F70;
  }
  NSArray v7 = self;
  sub_1002A3938();
  sub_100208490((uint64_t)v6);
  swift_bridgeObjectRelease();
}

- (void)renewLinkWithPseudonym:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a5);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  if (v11)
  {
    *(void *)(swift_allocObject() + 16) = v11;
    uint64_t v11 = sub_1002B7A70;
  }
  uint64_t v12 = self;
  sub_1002A47D0();
  sub_100208490((uint64_t)v11);
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)checkLinkValidityWithPseudonym:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    uint64_t v5 = sub_1002B7A68;
  }
  v6 = self;
  sub_1002A4CE8();
  sub_100208490((uint64_t)v5);
  swift_bridgeObjectRelease();
}

- (void)setLinkName:(id)a3 forLink:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (v7)
  {
    *(void *)(swift_allocObject() + 16) = v7;
    uint64_t v7 = sub_1002B7A4C;
  }
  id v9 = a4;
  uint64_t v8 = self;
  sub_1002A6248();
  sub_100208490((uint64_t)v7);
  swift_bridgeObjectRelease();
}

- (void)encryptLetMeInRequest:(id)a3 link:(id)a4 completionHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  sub_1002A6D94(v9, v10, (uint64_t)v11, v8);
  _Block_release(v8);
}

- (id)encryptLetMeInResponse:(id)a3 pseudonym:(id)a4 responseKeyData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;

  sub_1002A7724();
  id v16 = v15;
  sub_1001F7498(v12, v14);

  return v16;
}

- (void)decryptLetMeInRequest:(id)a3 pseudonym:(id)a4 fromHandle:(id)a5 completionHandler:(id)a6
{
  id v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v14 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = self;
  sub_1002A81F8(v14, v11, v12, v13, (void (**)(void, void, void, void))v10);
  _Block_release(v10);
}

- (id)decryptLetMeInResponse:(id)a3 pseudonym:(id)a4 requestorKeyAgreement:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  id v12 = (void *)sub_1002A90F0(v8);

  return v12;
}

- (void)addInvitedHandles:(id)a3 pseudonym:(id)a4 completionHandler:(id)a5
{
  v6 = _Block_copy(a5);
  sub_1001F6204(0, (unint64_t *)&unk_100586E00);
  sub_100210D5C((unint64_t *)&qword_100585920, (unint64_t *)&unk_100586E00);
  unint64_t v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  _Block_copy(v6);
  id v11 = self;
  sub_1002A9430(v7, v8, v10, (uint64_t)v11, (void (**)(void, void, void))v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3
{
  id v4 = self;
  sub_1002A9AD4(a3);
}

- (void)recoverLinksForPseudonyms:(id)a3
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = self;
  sub_1002A9B6C();

  swift_bridgeObjectRelease();
}

- (void)linkSyncStateWithIncludeLinks:(BOOL)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  unint64_t v7 = self;
  sub_1002A9BFC(a3, (uint64_t)v7, (void (**)(void, void))v6);
  _Block_release(v6);
}

- (void)renewPseudonymIfNeeded:(NSString *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  unint64_t v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  uint64_t v8 = a3;
  uint64_t v9 = self;

  sub_10034CFE0((uint64_t)&unk_100587A88, (uint64_t)v7);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (void)service:(id)a3 pseudonymRemoved:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1002B28B8();
}

- (void)service:(id)a3 pseudonymUpdated:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1002B3230();
}

- (void)activeAccountsChangedForService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1002B3D30();
}

@end