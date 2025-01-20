@interface ManagedKeychain
+ (NSString)assignedPersistentRef;
+ (NSString)assignedUserName;
+ (_TtC16RemoteManagement15ManagedKeychain)sharedInstance;
- (BOOL)deleteWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6;
- (BOOL)hasAssetForAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5;
- (BOOL)storeACMEIdentityWithDirectoryURL:(id)a3 clientIdentifier:(id)a4 keySize:(unint64_t)a5 keyType:(id)a6 hardwareBound:(BOOL)a7 subject:(id)a8 subjectAltName:(id)a9 usageFlags:(unint64_t)a10 extendedKeyUsage:(id)a11 attest:(BOOL)a12 isUserEnrollment:(BOOL)a13 assetKey:(id)a14 scope:(int64_t)a15 persona:(id)a16 error:(id *)a17;
- (BOOL)storeSCEPIdentityWithUrl:(id)a3 caInstanceName:(id)a4 caFingerprint:(id)a5 caCapabilities:(id)a6 challenge:(id)a7 subject:(id)a8 keySize:(unint64_t)a9 usageFlags:(unint64_t)a10 subjectAltName:(id)a11 retries:(unint64_t)a12 retryDelay:(unsigned int)a13 assetKey:(id)a14 scope:(int64_t)a15 persona:(id)a16 error:(id *)a17;
- (BOOL)storeWithDerData:(id)a3 assetKey:(id)a4 scope:(int64_t)a5 persona:(id)a6 error:(id *)a7;
- (BOOL)storeWithPassword:(id)a3 userName:(id)a4 assetKey:(id)a5 scope:(int64_t)a6 persona:(id)a7 error:(id *)a8;
- (BOOL)storeWithPemData:(id)a3 assetKey:(id)a4 scope:(int64_t)a5 persona:(id)a6 error:(id *)a7;
- (BOOL)storeWithPkcs12Data:(id)a3 password:(id)a4 assetKey:(id)a5 scope:(int64_t)a6 persona:(id)a7 error:(id *)a8;
- (BOOL)unassignAllAssetsFromConfigurationKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6;
- (_TtC16RemoteManagement15ManagedKeychain)init;
- (__SecCertificate)copyCertificateWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6;
- (id)assetKeysForCertificatesWithScope:(int64_t)a3 persona:(id)a4 error:(id *)a5;
- (id)assetKeysForIdentitiesWithScope:(int64_t)a3 persona:(id)a4 error:(id *)a5;
- (id)assetKeysForPasswordsWithScope:(int64_t)a3 persona:(id)a4 error:(id *)a5;
- (id)assignCertWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 toConfigurationKey:(id)a6 accessibility:(id)a7 accessGroup:(id)a8 error:(id *)a9;
- (id)assignIdentityWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 toConfigurationKey:(id)a6 accessibility:(id)a7 accessGroup:(id)a8 error:(id *)a9;
- (id)assignPasswordWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 toConfigurationKey:(id)a6 accessibility:(id)a7 accessGroup:(id)a8 returnUserName:(id *)a9 error:(id *)a10;
- (id)certificatePersistentRefWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6;
- (id)certificatePersistentRefsWithAssetKeys:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6;
- (id)debugStateWithScope:(int64_t)a3 persona:(id)a4;
@end

@implementation ManagedKeychain

+ (_TtC16RemoteManagement15ManagedKeychain)sharedInstance
{
  if (qword_26808F810 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26808F818;

  return (_TtC16RemoteManagement15ManagedKeychain *)v2;
}

+ (NSString)assignedPersistentRef
{
  return (NSString *)sub_22479A938((uint64_t)a1, (uint64_t)a2, &qword_26808F820);
}

+ (NSString)assignedUserName
{
  return (NSString *)sub_22479A938((uint64_t)a1, (uint64_t)a2, &qword_26808F838);
}

- (BOOL)storeWithPkcs12Data:(id)a3 password:(id)a4 assetKey:(id)a5 scope:(int64_t)a6 persona:(id)a7 error:(id *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  id v16 = a7;
  uint64_t v17 = sub_2247D07F0();
  unint64_t v19 = v18;

  uint64_t v20 = sub_2247D0920();
  uint64_t v22 = v21;

  uint64_t v23 = sub_2247D0920();
  if (v16)
  {
    uint64_t v24 = sub_2247D0920();
    unint64_t v26 = v25;
  }
  else
  {
    uint64_t v24 = 0;
    unint64_t v26 = 0;
  }
  sub_2247A51C8(v17, v19, v20, v22);
  v28 = v27;
  type metadata accessor for MKRepo();
  sub_2247A9D58(a6, v24, v26, *(uint64_t *)((char *)&v15->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(void *)&v15->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup]);
  uint64_t v29 = sub_2247A1BA0(v23);
  sub_2247B98D8((uint64_t)v28, v29, v30);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2247A1D2C(v17, v19);
  return 1;
}

- (BOOL)storeWithDerData:(id)a3 assetKey:(id)a4 scope:(int64_t)a5 persona:(id)a6 error:(id *)a7
{
  return sub_22479AF4C(self, (uint64_t)a2, a3, a4, a5, a6, (uint64_t)a7, (uint64_t (*)(uint64_t, unint64_t))sub_2247A5AA4);
}

- (BOOL)storeWithPemData:(id)a3 assetKey:(id)a4 scope:(int64_t)a5 persona:(id)a6 error:(id *)a7
{
  return sub_22479AF4C(self, (uint64_t)a2, a3, a4, a5, a6, (uint64_t)a7, (uint64_t (*)(uint64_t, unint64_t))sub_2247A5BF4);
}

- (BOOL)storeWithPassword:(id)a3 userName:(id)a4 assetKey:(id)a5 scope:(int64_t)a6 persona:(id)a7 error:(id *)a8
{
  uint64_t v10 = sub_2247D0920();
  uint64_t v12 = v11;
  uint64_t v13 = sub_2247D0920();
  v15 = v14;
  uint64_t v16 = sub_2247D0920();
  uint64_t v26 = v13;
  uint64_t v27 = v10;
  if (a7)
  {
    uint64_t v17 = sub_2247D0920();
    a7 = v18;
  }
  else
  {
    uint64_t v17 = 0;
  }
  type metadata accessor for MKRepo();
  uint64_t v19 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  uint64_t v20 = *(void *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  uint64_t v21 = self;
  sub_2247A9D58(a6, v17, (unint64_t)a7, v19, v20);
  uint64_t v22 = sub_2247A1BA0(v16);
  sub_2247BA15C(v27, v12, v26, v15, v22, v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)storeSCEPIdentityWithUrl:(id)a3 caInstanceName:(id)a4 caFingerprint:(id)a5 caCapabilities:(id)a6 challenge:(id)a7 subject:(id)a8 keySize:(unint64_t)a9 usageFlags:(unint64_t)a10 subjectAltName:(id)a11 retries:(unint64_t)a12 retryDelay:(unsigned int)a13 assetKey:(id)a14 scope:(int64_t)a15 persona:(id)a16 error:(id *)a17
{
  uint64_t v23 = sub_2247D0920();
  uint64_t v60 = v24;
  uint64_t v59 = v23;
  if (a4)
  {
    uint64_t v25 = sub_2247D0920();
    uint64_t v62 = v26;
  }
  else
  {
    uint64_t v25 = 0;
    uint64_t v62 = 0;
  }
  uint64_t v58 = v25;
  if (a5)
  {
    id v27 = a5;
    id v28 = a6;
    id v29 = a7;
    id v30 = a8;
    id v31 = a11;
    id v32 = a14;
    id v33 = a16;
    v34 = self;
    uint64_t v35 = sub_2247D07F0();
    v56 = v36;
    uint64_t v57 = v35;

    if (a6) {
      goto LABEL_6;
    }
  }
  else
  {
    id v38 = a6;
    id v39 = a7;
    id v40 = a8;
    id v41 = a11;
    id v42 = a14;
    id v43 = a16;
    v44 = self;
    v56 = (void *)0xF000000000000000;
    uint64_t v57 = 0;
    if (a6)
    {
LABEL_6:
      v53 = (void *)sub_2247D0A50();

      if (a7) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v52 = 0;
      uint64_t v55 = 0;
      if (a8) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  v53 = 0;
  if (!a7) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v52 = sub_2247D0920();
  uint64_t v55 = v37;

  if (a8)
  {
LABEL_8:
    __swift_instantiateConcreteTypeFromMangledName(&qword_26808F8F8);
    v54 = (void *)sub_2247D0A50();

    goto LABEL_13;
  }
LABEL_12:
  v54 = 0;
LABEL_13:
  if (a11)
  {
    uint64_t v61 = sub_2247D08F0();
  }
  else
  {
    uint64_t v61 = 0;
  }
  uint64_t v45 = sub_2247D0920();
  uint64_t v47 = v46;

  if (a16)
  {
    uint64_t v48 = sub_2247D0920();
    unint64_t v50 = v49;
  }
  else
  {
    uint64_t v48 = 0;
    unint64_t v50 = 0;
  }
  sub_22479B3B4(v59, v60, v58, v62, v57, v56, v53, v52, v55, v54, a9, a10, v61, a12, a13, v45, v47, a15, v48, v50);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2247A1D18(v57, (unint64_t)v56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)storeACMEIdentityWithDirectoryURL:(id)a3 clientIdentifier:(id)a4 keySize:(unint64_t)a5 keyType:(id)a6 hardwareBound:(BOOL)a7 subject:(id)a8 subjectAltName:(id)a9 usageFlags:(unint64_t)a10 extendedKeyUsage:(id)a11 attest:(BOOL)a12 isUserEnrollment:(BOOL)a13 assetKey:(id)a14 scope:(int64_t)a15 persona:(id)a16 error:(id *)a17
{
  BOOL v37 = a7;
  id v18 = a16;
  uint64_t v35 = sub_2247D0920();
  unint64_t v40 = v19;
  uint64_t v34 = sub_2247D0920();
  uint64_t v41 = v20;
  uint64_t v21 = sub_2247D0920();
  unint64_t v23 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_26808F8F8);
  uint64_t v39 = sub_2247D0A50();
  if (a9) {
    uint64_t v24 = sub_2247D08F0();
  }
  else {
    uint64_t v24 = 0;
  }
  id v38 = (void **)sub_2247D0A50();
  uint64_t v33 = sub_2247D0920();
  if (a16)
  {
    uint64_t v25 = sub_2247D0920();
    id v18 = v26;
  }
  else
  {
    uint64_t v25 = 0;
  }
  id v27 = self;
  sub_2247A4BEC(v35, v40, v34, v41, a5, v21, v23, v37, v39, v24, (id *)a10, v38, a12, a13, v25, (unint64_t)v18);
  id v29 = v28;
  type metadata accessor for MKRepo();
  sub_2247A9D58(a15, v25, (unint64_t)v18, *(uint64_t *)((char *)&v27->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup), *(void *)&v27->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup]);
  uint64_t v30 = sub_2247A1BA0(v33);
  sub_2247B98D8((uint64_t)v29, v30, v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)deleteWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6
{
  return sub_22479C6D4((char *)self, (uint64_t)a2, (uint64_t)a3, a4, (unint64_t)a5, (uint64_t)a6, (void (*)(uint64_t))sub_2247BA4A0);
}

- (BOOL)hasAssetForAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5
{
  uint64_t v8 = sub_2247D0920();
  if (a5)
  {
    uint64_t v9 = sub_2247D0920();
    a5 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  type metadata accessor for MKRepo();
  uint64_t v11 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  uint64_t v12 = *(void *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  uint64_t v13 = self;
  sub_2247A9D58(a4, v9, (unint64_t)a5, v11, v12);
  uint64_t v14 = sub_2247A1BA0(v8);
  char v16 = sub_2247BA7D8(v14, v15);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16 & 1;
}

- (id)assignCertWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 toConfigurationKey:(id)a6 accessibility:(id)a7 accessGroup:(id)a8 error:(id *)a9
{
  return sub_22479C08C((char *)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2247B0658);
}

- (id)assignIdentityWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 toConfigurationKey:(id)a6 accessibility:(id)a7 accessGroup:(id)a8 error:(id *)a9
{
  return sub_22479C08C((char *)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_2247B08E0);
}

- (id)assignPasswordWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 toConfigurationKey:(id)a6 accessibility:(id)a7 accessGroup:(id)a8 returnUserName:(id *)a9 error:(id *)a10
{
  uint64_t v14 = sub_2247D0920();
  uint64_t v16 = v15;
  uint64_t v31 = v14;
  if (a5)
  {
    uint64_t v17 = sub_2247D0920();
    a5 = v18;
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v19 = sub_2247D0920();
  uint64_t v21 = v20;
  uint64_t v22 = sub_2247D0920();
  uint64_t v24 = v23;
  swift_unknownObjectRetain();
  uint64_t v25 = self;
  uint64_t v26 = sub_22479C2AC(v31, v16, a4, v17, (unint64_t)a5, v19, v21, (uint64_t)a7, v22, v24, a9);
  unint64_t v28 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  id v29 = (void *)sub_2247D07D0();
  sub_2247A1D2C(v26, v28);

  return v29;
}

- (BOOL)unassignAllAssetsFromConfigurationKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6
{
  return sub_22479C6D4((char *)self, (uint64_t)a2, (uint64_t)a3, a4, (unint64_t)a5, (uint64_t)a6, (void (*)(uint64_t))sub_2247B1988);
}

- (id)assetKeysForCertificatesWithScope:(int64_t)a3 persona:(id)a4 error:(id *)a5
{
  if (a4)
  {
    uint64_t v7 = sub_2247D0920();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0;
  }
  type metadata accessor for MKRepo();
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  uint64_t v11 = *(void *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  uint64_t v12 = self;
  sub_2247A9D58(a3, v7, v9, v10, v11);
  swift_beginAccess();
  uint64_t v13 = swift_bridgeObjectRetain();
  sub_2247A18B8(v13);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_2247D0A30();
  swift_release();

  return v14;
}

- (id)assetKeysForIdentitiesWithScope:(int64_t)a3 persona:(id)a4 error:(id *)a5
{
  if (a4)
  {
    uint64_t v7 = sub_2247D0920();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0;
  }
  type metadata accessor for MKRepo();
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  uint64_t v11 = *(void *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  uint64_t v12 = self;
  sub_2247A9D58(a3, v7, v9, v10, v11);
  swift_beginAccess();
  uint64_t v13 = swift_bridgeObjectRetain();
  sub_2247A18B8(v13);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_2247D0A30();
  swift_release();

  return v14;
}

- (id)assetKeysForPasswordsWithScope:(int64_t)a3 persona:(id)a4 error:(id *)a5
{
  if (a4)
  {
    uint64_t v7 = sub_2247D0920();
    unint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v9 = 0;
  }
  type metadata accessor for MKRepo();
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  uint64_t v11 = *(void *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  uint64_t v12 = self;
  sub_2247A9D58(a3, v7, v9, v10, v11);
  swift_beginAccess();
  uint64_t v13 = swift_bridgeObjectRetain();
  sub_2247A18B8(v13);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_2247D0A30();
  swift_release();

  return v14;
}

- (id)certificatePersistentRefWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6
{
  uint64_t v9 = sub_2247D0920();
  if (a5)
  {
    uint64_t v10 = sub_2247D0920();
    a5 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  type metadata accessor for MKRepo();
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  uint64_t v13 = *(void *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  uint64_t v14 = self;
  sub_2247A9D58(a4, v10, (unint64_t)a5, v12, v13);
  uint64_t v15 = sub_2247A1BA0(v9);
  uint64_t v17 = sub_2247BB468(v15, v16);
  unint64_t v19 = v18;
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v20 = (void *)sub_2247D07D0();
  sub_2247A1D2C(v17, v19);

  return v20;
}

- (id)certificatePersistentRefsWithAssetKeys:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6
{
  uint64_t v9 = sub_2247D0A50();
  if (a5)
  {
    uint64_t v10 = sub_2247D0920();
    a5 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v12 = self;
  sub_22479CFE8(v9, a4, v10, (unint64_t)a5);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v13 = (void *)sub_2247D08E0();
  swift_bridgeObjectRelease();

  return v13;
}

- (__SecCertificate)copyCertificateWithAssetKey:(id)a3 scope:(int64_t)a4 persona:(id)a5 error:(id *)a6
{
  uint64_t v9 = sub_2247D0920();
  if (a5)
  {
    uint64_t v10 = sub_2247D0920();
    a5 = v11;
  }
  else
  {
    uint64_t v10 = 0;
  }
  type metadata accessor for MKRepo();
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  uint64_t v13 = *(void *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  uint64_t v14 = self;
  sub_2247A9D58(a4, v10, (unint64_t)a5, v12, v13);
  uint64_t v15 = sub_2247A1BA0(v9);
  uint64_t v17 = (__SecCertificate *)sub_2247BB628(v15, v16);
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v17;
}

- (id)debugStateWithScope:(int64_t)a3 persona:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_2247D0920();
    unint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v8 = 0;
  }
  type metadata accessor for MKRepo();
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup);
  uint64_t v10 = *(void *)&self->accessGroup[OBJC_IVAR____TtC16RemoteManagement15ManagedKeychain_accessGroup];
  uint64_t v11 = self;
  sub_2247A9D58(a3, v6, v8, v9, v10);
  sub_2247AB304();

  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v12 = (void *)sub_2247D08E0();
  swift_bridgeObjectRelease();

  return v12;
}

- (_TtC16RemoteManagement15ManagedKeychain)init
{
  result = (_TtC16RemoteManagement15ManagedKeychain *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end