@interface BiometricStoreSessionProxy
- (_TtC7idcredd26BiometricStoreSessionProxy)init;
- (void)bioBindingUnboundACL:(id)a3;
- (void)boundAppletPresentmentACL:(id)a3;
- (void)clearProgenitorKeyDesignationsWithCompletion:(id)a3;
- (void)credentialAuthenticationTokenStatus:(id)a3;
- (void)dealloc;
- (void)deleteGlobalAuthACLWithCompletion:(id)a3;
- (void)establishPrearmTrustV2:(DCCredentialTrust *)a3 completion:(id)a4;
- (void)generatePhoneTokenWithNonce:(DCCredentialNonce *)a3 keyBlob:(NSData *)a4 pairingID:(NSString *)a5 completion:(id)a6;
- (void)generatePrearmTrustCertificateWithNonce:(NSData *)a3 pairingID:(NSString *)a4 completion:(id)a5;
- (void)getCASDCertificate:(id)a3;
- (void)getGlobalProgenitorKeyAttestation:(id)a3;
- (void)getGlobalThirdPartyProgenitorKeyAttestation:(id)a3;
- (void)globalAuthACLTemplateUUIDsWithCompletion:(id)a3;
- (void)globalAuthACLWithCompletion:(id)a3;
- (void)migratePrearmTrustBlob:(NSData *)a3 completion:(id)a4;
- (void)nonceForAuthorizationTokenWithCompletion:(id)a3;
- (void)passcodeBindingUnboundACL:(id)a3;
- (void)prearmCredentialWithAuthorizationToken:(DCCredentialAuthorizationToken *)a3 completion:(id)a4;
- (void)refreshProgenitorKeyDesignationsWithSessionHandoffToken:(NSData *)a3 onlyIfNeeded:(BOOL)a4 completion:(id)a5;
- (void)revokeCredentialAuthorizationToken:(id)a3;
- (void)setGlobalAuthACL:(NSData *)a3 ofType:(unint64_t)a4 completion:(id)a5;
- (void)setModifiedGlobalAuthACL:(NSData *)a3 externalizedLAContext:(NSData *)a4 completion:(id)a5;
@end

@implementation BiometricStoreSessionProxy

- (void)dealloc
{
  v2 = self;
  sub_10001BFE0();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();

  swift_release();
}

- (void)bioBindingUnboundACL:(id)a3
{
  uint64_t v5 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001C10C0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001C10C8;
  v12[5] = v11;
  v13 = self;
  sub_100124C44((uint64_t)v7, (uint64_t)&unk_1001C10D0, (uint64_t)v12);
  swift_release();
}

- (void)passcodeBindingUnboundACL:(id)a3
{
  uint64_t v5 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001C10A0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001C10A8;
  v12[5] = v11;
  v13 = self;
  sub_100124C44((uint64_t)v7, (uint64_t)&unk_1001C10B0, (uint64_t)v12);
  swift_release();
}

- (void)setGlobalAuthACL:(NSData *)a3 ofType:(unint64_t)a4 completion:(id)a5
{
  uint64_t v9 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
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
  v15[4] = &unk_1001C1080;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C1088;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C1090, (uint64_t)v16);
  swift_release();
}

- (void)setModifiedGlobalAuthACL:(NSData *)a3 externalizedLAContext:(NSData *)a4 completion:(id)a5
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
  v15[4] = &unk_1001C1060;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C1068;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C1070, (uint64_t)v16);
  swift_release();
}

- (void)globalAuthACLWithCompletion:(id)a3
{
  uint64_t v5 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001C1040;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001C1048;
  v12[5] = v11;
  v13 = self;
  sub_100124C44((uint64_t)v7, (uint64_t)&unk_1001C1050, (uint64_t)v12);
  swift_release();
}

- (void)deleteGlobalAuthACLWithCompletion:(id)a3
{
  uint64_t v5 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001C1020;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001C1028;
  v12[5] = v11;
  v13 = self;
  sub_100124C44((uint64_t)v7, (uint64_t)&unk_1001C1030, (uint64_t)v12);
  swift_release();
}

- (void)globalAuthACLTemplateUUIDsWithCompletion:(id)a3
{
  uint64_t v5 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1001C1000;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001C1008;
  v12[5] = v11;
  v13 = self;
  sub_100124C44((uint64_t)v7, (uint64_t)&unk_1001C1010, (uint64_t)v12);
  swift_release();
}

- (void)generatePrearmTrustCertificateWithNonce:(NSData *)a3 pairingID:(NSString *)a4 completion:(id)a5
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
  v15[4] = &unk_1001C0FE0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C0FE8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C0FF0, (uint64_t)v16);
  swift_release();
}

- (void)migratePrearmTrustBlob:(NSData *)a3 completion:(id)a4
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
  v13[4] = &unk_1001C0FC0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C0FC8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C0FD0, (uint64_t)v14);
  swift_release();
}

- (void)generatePhoneTokenWithNonce:(DCCredentialNonce *)a3 keyBlob:(NSData *)a4 pairingID:(NSString *)a5 completion:(id)a6
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
  v17[4] = &unk_1001C0FA0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1001C0FA8;
  v18[5] = v17;
  uint64_t v19 = a3;
  uint64_t v20 = a4;
  v21 = a5;
  v22 = self;
  sub_100124C44((uint64_t)v13, (uint64_t)&unk_1001C0FB0, (uint64_t)v18);
  swift_release();
}

- (void)establishPrearmTrustV2:(DCCredentialTrust *)a3 completion:(id)a4
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
  v13[4] = &unk_1001C0F80;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1001C3C60;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_100124C44((uint64_t)v9, (uint64_t)&unk_1001C0F90, (uint64_t)v14);
  swift_release();
}

- (void)nonceForAuthorizationTokenWithCompletion:(id)a3
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
  v11[4] = &unk_1001C0F60;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001C3C40;
  v12[5] = v11;
  v13 = self;
  sub_100124C44((uint64_t)v7, (uint64_t)&unk_1001C0F70, (uint64_t)v12);
  swift_release();
}

- (void)revokeCredentialAuthorizationToken:(id)a3
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
  v11[4] = &unk_1001C0F40;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001C0F48;
  v12[5] = v11;
  v13 = self;
  sub_100124C44((uint64_t)v7, (uint64_t)&unk_1001C0F50, (uint64_t)v12);
  swift_release();
}

- (void)prearmCredentialWithAuthorizationToken:(DCCredentialAuthorizationToken *)a3 completion:(id)a4
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
  v13[4] = &unk_1001C0F20;
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

- (void)credentialAuthenticationTokenStatus:(id)a3
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
  v11[4] = &unk_1001C0F00;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001C3BF0;
  v12[5] = v11;
  v13 = self;
  sub_100124C44((uint64_t)v7, (uint64_t)&unk_1001C0F10, (uint64_t)v12);
  swift_release();
}

- (void)getCASDCertificate:(id)a3
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
  v11[4] = &unk_1001C0EE0;
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

- (void)getGlobalProgenitorKeyAttestation:(id)a3
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
  v11[4] = &unk_1001C0EC0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001C0EC8;
  v12[5] = v11;
  v13 = self;
  sub_100124C44((uint64_t)v7, (uint64_t)&unk_1001C0ED0, (uint64_t)v12);
  swift_release();
}

- (void)getGlobalThirdPartyProgenitorKeyAttestation:(id)a3
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
  v11[4] = &unk_1001C0EA0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001C0EA8;
  v12[5] = v11;
  v13 = self;
  sub_100124C44((uint64_t)v7, (uint64_t)&unk_1001C0EB0, (uint64_t)v12);
  swift_release();
}

- (void)boundAppletPresentmentACL:(id)a3
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
  v11[4] = &unk_1001C0E80;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001C0E88;
  v12[5] = v11;
  v13 = self;
  sub_100124C44((uint64_t)v7, (uint64_t)&unk_1001C0E90, (uint64_t)v12);
  swift_release();
}

- (void)refreshProgenitorKeyDesignationsWithSessionHandoffToken:(NSData *)a3 onlyIfNeeded:(BOOL)a4 completion:(id)a5
{
  uint64_t v9 = sub_100006CC8(&qword_1001C0E30);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1001C0E60;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1001C0E68;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = self;
  sub_100124C44((uint64_t)v11, (uint64_t)&unk_1001C0E70, (uint64_t)v16);
  swift_release();
}

- (void)clearProgenitorKeyDesignationsWithCompletion:(id)a3
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
  v11[4] = &unk_1001C0E40;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1001C1920;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_100124C44((uint64_t)v7, (uint64_t)&unk_1001C0E50, (uint64_t)v12);
  swift_release();
}

- (_TtC7idcredd26BiometricStoreSessionProxy)init
{
  result = (_TtC7idcredd26BiometricStoreSessionProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end