@interface MobileAssetExclaveServicesManager
- (BOOL)checkManifestForFSTag:(unsigned int)a3 staged:(BOOL)a4 manifest:(id)a5 infoPlist:(id)a6 catalog:(id)a7 isValid:(BOOL *)a8 error:(id *)a9;
- (BOOL)commitStagedManifestForFSTags:(id)a3 error:(id *)a4;
- (BOOL)invalidateManifestForFSTag:(unsigned int)a3 error:(id *)a4;
- (BOOL)stageManifest:(id)a3 infoPlist:(id)a4 catalog:(id)a5 error:(id *)a6;
- (BOOL)storeManifest:(id)a3 infoPlist:(id)a4 catalog:(id)a5 error:(id *)a6;
- (_TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager)init;
- (_TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager)initWithConclave:(BOOL)a3;
- (id)proposeNonce:(id *)a3;
@end

@implementation MobileAssetExclaveServicesManager

- (_TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager)initWithConclave:(BOOL)a3
{
  return (_TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager *)sub_25657FFA4();
}

- (id)proposeNonce:(id *)a3
{
  v3 = self;
  sub_25657B91C();

  v4 = (void *)sub_256584750();
  swift_bridgeObjectRelease();
  return v4;
}

- (BOOL)checkManifestForFSTag:(unsigned int)a3 staged:(BOOL)a4 manifest:(id)a5 infoPlist:(id)a6 catalog:(id)a7 isValid:(BOOL *)a8 error:(id *)a9
{
  BOOL v11 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = self;
  uint64_t v18 = sub_256584540();
  v20 = v19;

  v21 = sub_256584540();
  v23 = v22;

  uint64_t v24 = sub_256584540();
  unint64_t v26 = v25;

  sub_25657C6DC(a3, v11, v18, v20, v21, v23, v24, v26, a8);
  sub_256580BD8(v24, v26);
  sub_256580BD8((uint64_t)v21, (unint64_t)v23);
  sub_256580BD8(v18, (unint64_t)v20);
  return 1;
}

- (BOOL)storeManifest:(id)a3 infoPlist:(id)a4 catalog:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  uint64_t v13 = sub_256584540();
  unint64_t v15 = v14;

  uint64_t v16 = sub_256584540();
  unint64_t v18 = v17;

  uint64_t v19 = sub_256584540();
  unint64_t v21 = v20;

  sub_25657DB7C(v13, v15, v16, v18, v19, v21);
  sub_256580BD8(v19, v21);
  sub_256580BD8(v16, v18);
  sub_256580BD8(v13, v15);
  return 1;
}

- (BOOL)stageManifest:(id)a3 infoPlist:(id)a4 catalog:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  uint64_t v13 = sub_256584540();
  unint64_t v15 = v14;

  uint64_t v16 = sub_256584540();
  unint64_t v18 = v17;

  uint64_t v19 = sub_256584540();
  unint64_t v21 = v20;

  sub_25657DB7C(v13, v15, v16, v18, v19, v21);
  sub_256580BD8(v19, v21);
  sub_256580BD8(v16, v18);
  sub_256580BD8(v13, v15);
  return 1;
}

- (BOOL)commitStagedManifestForFSTags:(id)a3 error:(id *)a4
{
  sub_256580D78();
  unint64_t v5 = sub_2565847B0();
  v6 = self;
  sub_25657E400(v5);
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)invalidateManifestForFSTag:(unsigned int)a3 error:(id *)a4
{
  unint64_t v5 = self;
  sub_25657EB14(a3);

  return 1;
}

- (_TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager)init
{
  result = (_TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_log;
  uint64_t v4 = sub_256584580();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock));
  swift_release();
}

@end