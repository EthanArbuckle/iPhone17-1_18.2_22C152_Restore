@interface SUCoreUUID
+ (id)UUIDForMobileAsset;
+ (id)UUIDForSoftwareUpdate;
+ (id)UUIDv5FromString:(id)a3;
+ (id)randomUUIDWithLastThreeCharactersOfUUID:(id)a3;
@end

@implementation SUCoreUUID

+ (id)UUIDForSoftwareUpdate
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__SUCoreUUID_UUIDForSoftwareUpdate__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (UUIDForSoftwareUpdate_onceToken != -1) {
    dispatch_once(&UUIDForSoftwareUpdate_onceToken, block);
  }
  v2 = (void *)UUIDForSoftwareUpdate_softwareUpdateUUID;
  return v2;
}

void __35__SUCoreUUID_UUIDForSoftwareUpdate__block_invoke(uint64_t a1)
{
  id v8 = (id)MGCopyAnswer();
  v2 = +[SUCoreDevice sharedDevice];
  v3 = [v2 restoreVersion];

  if (v8 && v3)
  {
    v4 = [v8 stringByAppendingString:v3];
    uint64_t v5 = [*(id *)(a1 + 32) UUIDv5FromString:v4];
    v6 = (void *)UUIDForSoftwareUpdate_softwareUpdateUUID;
    UUIDForSoftwareUpdate_softwareUpdateUUID = v5;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    v4 = (void *)UUIDForSoftwareUpdate_softwareUpdateUUID;
    UUIDForSoftwareUpdate_softwareUpdateUUID = v7;
  }
}

+ (id)UUIDForMobileAsset
{
  v3 = [a1 UUIDForSoftwareUpdate];
  v4 = [a1 randomUUIDWithLastThreeCharactersOfUUID:v3];

  return v4;
}

+ (id)UUIDv5FromString:(id)a3
{
  data[2] = *MEMORY[0x1E4F143B8];
  data[0] = 0;
  data[1] = 0;
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithUUIDString:@"60EF4694-4272-4276-B9A6-DA4F8FFF93F1"];
  [v5 getUUIDBytes:data];
  memset(&v11, 0, sizeof(v11));
  CC_SHA1_Init(&v11);
  CC_SHA1_Update(&v11, data, 0x10u);
  id v6 = v4;
  uint64_t v7 = (const void *)[v6 UTF8String];
  CC_LONG v8 = [v6 length];

  CC_SHA1_Update(&v11, v7, v8);
  memset(md, 0, sizeof(md));
  int v13 = 0;
  CC_SHA1_Final(md, &v11);
  long long v14 = *(_OWORD *)md;
  BYTE6(v14) = md[6] & 0xF | 0x50;
  BYTE8(v14) = md[8] & 0x3F | 0x80;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v14];

  return v9;
}

+ (id)randomUUIDWithLastThreeCharactersOfUUID:(id)a3
{
  v3 = [a3 UUIDString];
  id v4 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 3);
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v5 UUIDString];
  uint64_t v7 = (void *)[v6 mutableCopy];

  objc_msgSend(v7, "replaceCharactersInRange:withString:", objc_msgSend(v7, "length") - 3, 3, v4);
  CC_LONG v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];

  return v8;
}

@end