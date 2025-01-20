@interface CredentialStoreSessionProxy
- (_TtC7idcredd27CredentialStoreSessionProxy)init;
- (void)activeRegionsInPartitions:(NSArray *)a3 docType:(NSString *)a4 completion:(id)a5;
- (void)allElementsOfCredential:(NSString *)a3 authData:(NSData *)a4 completion:(id)a5;
- (void)associateExternalPresentmentKeyWithCredential:(NSString *)a3 publicKeyIdentifier:(NSData *)a4 completion:(id)a5;
- (void)authorizeDeviceKeySigningKeyOfCredential:(NSString *)a3 accountKeyIdentifier:(NSString *)a4 completion:(id)a5;
- (void)authorizeRemoteKeySigningKeyWithCredential:(NSString *)a3 remoteKey:(NSData *)a4 completion:(id)a5;
- (void)checkCompletenessOfCredential:(NSString *)a3 completion:(id)a4;
- (void)clearPresentmentKeyUsageForCredential:(NSString *)a3 completion:(id)a4;
- (void)configureWithPartitions:(id)a3 completion:(id)a4;
- (void)createAccountKeySigningKeyForAccountKeyIdentifier:(NSString *)a3 completion:(id)a4;
- (void)createCredentialInPartition:(NSString *)a3 options:(DCCredentialOptions *)a4 completion:(id)a5;
- (void)credentialIdentifierForPublicKeyIdentifier:(NSData *)a3 completion:(id)a4;
- (void)credentialIdentifiersInPartitions:(NSArray *)a3 completion:(id)a4;
- (void)credentialIdentifiersInPartitions:(NSArray *)a3 docType:(NSString *)a4 completion:(id)a5;
- (void)credentialIdentifiersInPartitions:(NSArray *)a3 docType:(NSString *)a4 region:(NSString *)a5 completion:(id)a6;
- (void)dealloc;
- (void)deleteAccountKeySigningKeyForAccountKeyIdentifier:(NSString *)a3 completion:(id)a4;
- (void)deleteCredential:(NSString *)a3 completion:(id)a4;
- (void)elementsOfCredential:(NSString *)a3 elementIdentifiers:(NSDictionary *)a4 authData:(NSData *)a5 completion:(id)a6;
- (void)eraseLegacySEKeySlot:(int64_t)a3 completion:(id)a4;
- (void)generateAccountKeyAuthorizationForCredential:(NSString *)a3 accountKeyIdentifier:(NSString *)a4 completion:(id)a5;
- (void)generateDeviceEncryptionKeyForCredential:(NSString *)a3 completion:(id)a4;
- (void)generateKeySigningKeyForCredential:(NSString *)a3 completion:(id)a4;
- (void)generatePresentmentKeyForCredential:(NSString *)a3 completion:(id)a4;
- (void)generatePresentmentKeysForCredential:(NSString *)a3 numKeys:(int64_t)a4 completion:(id)a5;
- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:(NSString *)a3 completion:(id)a4;
- (void)keyInfoForCredential:(NSString *)a3 completion:(id)a4;
- (void)occupiedLegacySEKeySlotsWithCompletion:(id)a3;
- (void)payloadAuthACLForCredential:(NSString *)a3 completion:(id)a4;
- (void)payloadsOfCredential:(NSString *)a3 completion:(id)a4;
- (void)propertiesOfCredential:(NSString *)a3 completion:(id)a4;
- (void)replacePayloadOfCredential:(NSString *)a3 withPayload:(NSData *)a4 format:(unint64_t)a5 completion:(id)a6;
- (void)retrieveAccountKeySigningKeyForAccountKeyIdentifier:(NSString *)a3 completion:(id)a4;
- (void)setStateOfCredential:(NSString *)a3 to:(unint64_t)a4 completion:(id)a5;
@end

@implementation CredentialStoreSessionProxy

- (void)dealloc
{
  v2 = self;
  sub_10010F54C();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)configureWithPartitions:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _Block_copy(v5);
  v7 = self;
  sub_100126DC8(v6, (uint64_t)v7, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (void)createCredentialInPartition:(NSString *)a3 options:(DCCredentialOptions *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1001C3E88;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C3E90;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C3E98, (uint64_t)v16);
  swift_release();
}

- (void)generateKeySigningKeyForCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001C3E68;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C3E70;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C3E78, (uint64_t)v14);
  swift_release();
}

- (void)isAccountKeySigningKeyAvailableForAccountKeyIdentifier:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001C3E48;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C3E50;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C3E58, (uint64_t)v14);
  swift_release();
}

- (void)createAccountKeySigningKeyForAccountKeyIdentifier:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001C3E28;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C3E30;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C3E38, (uint64_t)v14);
  swift_release();
}

- (void)retrieveAccountKeySigningKeyForAccountKeyIdentifier:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001C3E08;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C3E10;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C3E18, (uint64_t)v14);
  swift_release();
}

- (void)generateAccountKeyAuthorizationForCredential:(NSString *)a3 accountKeyIdentifier:(NSString *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1001C3DE8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C3DF0;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C3DF8, (uint64_t)v16);
  swift_release();
}

- (void)generateDeviceEncryptionKeyForCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001C3DC8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C3DD0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C3DD8, (uint64_t)v14);
  swift_release();
}

- (void)generatePresentmentKeyForCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001C3DA8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C3DB0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C3DB8, (uint64_t)v14);
  swift_release();
}

- (void)generatePresentmentKeysForCredential:(NSString *)a3 numKeys:(int64_t)a4 completion:(id)a5
{
  uint64_t v9 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1001C3D80;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C3D88;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C3D90, (uint64_t)v16);
  swift_release();
}

- (void)authorizeDeviceKeySigningKeyOfCredential:(NSString *)a3 accountKeyIdentifier:(NSString *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1001C3D60;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C3D68;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C3D70, (uint64_t)v16);
  swift_release();
}

- (void)authorizeRemoteKeySigningKeyWithCredential:(NSString *)a3 remoteKey:(NSData *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1001C3D40;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C3D48;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C3D50, (uint64_t)v16);
  swift_release();
}

- (void)associateExternalPresentmentKeyWithCredential:(NSString *)a3 publicKeyIdentifier:(NSData *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1001C3D20;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C3D28;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C3D30, (uint64_t)v16);
  swift_release();
}

- (void)credentialIdentifierForPublicKeyIdentifier:(NSData *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1001C3D10;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C10C8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C10D0, (uint64_t)v14);
  swift_release();
}

- (void)replacePayloadOfCredential:(NSString *)a3 withPayload:(NSData *)a4 format:(unint64_t)a5 completion:(id)a6
{
  uint64_t v11 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1001C3D00;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1001C10A8;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  v21 = self;
  sub_100124C44((uint64_t)v13, (uint64_t)&unk_1001C10B0, (uint64_t)v18);
  swift_release();
}

- (void)credentialIdentifiersInPartitions:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
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
  v13[4] = &unk_1001C3CF0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C1088;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C1090, (uint64_t)v14);
  swift_release();
}

- (void)credentialIdentifiersInPartitions:(NSArray *)a3 docType:(NSString *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1001C3CE0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C1068;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C1070, (uint64_t)v16);
  swift_release();
}

- (void)credentialIdentifiersInPartitions:(NSArray *)a3 docType:(NSString *)a4 region:(NSString *)a5 completion:(id)a6
{
  uint64_t v11 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1001C3CD0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1001C1048;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  v21 = a5;
  uint64_t v22 = self;
  sub_100124C44((uint64_t)v13, (uint64_t)&unk_1001C1050, (uint64_t)v18);
  swift_release();
}

- (void)activeRegionsInPartitions:(NSArray *)a3 docType:(NSString *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1001C3CC0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C1028;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C1030, (uint64_t)v16);
  swift_release();
}

- (void)deleteCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
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
  v13[4] = &unk_1001C3CB0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C1008;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C1010, (uint64_t)v14);
  swift_release();
}

- (void)propertiesOfCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
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
  v13[4] = &unk_1001C3CA0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C0FE8;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C0FF0, (uint64_t)v14);
  swift_release();
}

- (void)setStateOfCredential:(NSString *)a3 to:(unint64_t)a4 completion:(id)a5
{
  uint64_t v9 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1001C3C90;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C0FC8;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C0FD0, (uint64_t)v16);
  swift_release();
}

- (void)payloadAuthACLForCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
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
  v13[4] = &unk_1001C3C80;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C0FA8;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C0FB0, (uint64_t)v14);
  swift_release();
}

- (void)elementsOfCredential:(NSString *)a3 elementIdentifiers:(NSDictionary *)a4 authData:(NSData *)a5 completion:(id)a6
{
  uint64_t v11 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1001C3C58;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1001C3C60;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  v21 = a5;
  uint64_t v22 = self;
  sub_100124C44((uint64_t)v13, (uint64_t)&unk_1001C0F90, (uint64_t)v18);
  swift_release();
}

- (void)checkCompletenessOfCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
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
  v13[4] = &unk_1001C3C38;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C3C40;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C0F70, (uint64_t)v14);
  swift_release();
}

- (void)payloadsOfCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
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
  v13[4] = &unk_1001C3C20;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C0F48;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C0F50, (uint64_t)v14);
  swift_release();
}

- (void)deleteAccountKeySigningKeyForAccountKeyIdentifier:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
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
  v13[4] = &unk_1001C3C10;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C0F28;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C0F30, (uint64_t)v14);
  swift_release();
}

- (void)allElementsOfCredential:(NSString *)a3 authData:(NSData *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1001C3BE8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C3BF0;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C0F10, (uint64_t)v16);
  swift_release();
}

- (void)occupiedLegacySEKeySlotsWithCompletion:(id)a3
{
  uint64_t v5 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v5 - 8);
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
  v11[4] = &unk_1001C3BD0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001C0EE8;
  v12[5] = v11;
  v13 = self;
  sub_100124C44((uint64_t)v7, (uint64_t)&unk_1001C0EF0, (uint64_t)v12);
  swift_release();
}

- (void)eraseLegacySEKeySlot:(int64_t)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v13[4] = &unk_1001C3BC0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C0EC8;
  v14[5] = v13;
  v15 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C0ED0, (uint64_t)v14);
  swift_release();
}

- (void)clearPresentmentKeyUsageForCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
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
  v13[4] = &unk_1001C3BB0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C0EA8;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C0EB0, (uint64_t)v14);
  swift_release();
}

- (void)keyInfoForCredential:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v7 - 8);
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
  v13[4] = &unk_1001C3B68;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C1920;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C0E50, (uint64_t)v14);
  swift_release();
}

- (_TtC7idcredd27CredentialStoreSessionProxy)init
{
  result = (_TtC7idcredd27CredentialStoreSessionProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end