@interface SMAssetBundle
- (NSString)downloadingDeviceIdentifier;
- (NSString)identifier;
- (NSString)workoutIdentifier;
- (SMAssetBundle)init;
- (int64_t)loadStatus;
- (int64_t)reason;
@end

@implementation SMAssetBundle

- (NSString)identifier
{
  return (NSString *)sub_261B2FACC(self, (uint64_t)a2, MEMORY[0x263F69078]);
}

- (NSString)workoutIdentifier
{
  return (NSString *)sub_261B2FACC(self, (uint64_t)a2, MEMORY[0x263F69088]);
}

- (NSString)downloadingDeviceIdentifier
{
  return (NSString *)sub_261B2FACC(self, (uint64_t)a2, MEMORY[0x263F69090]);
}

- (int64_t)loadStatus
{
  v2 = self;
  char v3 = sub_261B8B128();
  char v5 = v4;

  if (v5) {
    return qword_261B9AF90[v3];
  }
  else {
    return 6;
  }
}

- (int64_t)reason
{
  v2 = self;
  unint64_t v3 = sub_261B2FC54();

  return v3;
}

- (SMAssetBundle)init
{
  result = (SMAssetBundle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___SMAssetBundle_assetBundle;
  uint64_t v3 = sub_261B8B188();
  char v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end