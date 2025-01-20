@interface STTelephonyMobileEquipmentInfo
- (BOOL)isOnBootstrap;
- (NSString)CSN;
- (NSString)ICCID;
- (NSString)IMEI;
- (NSString)MEID;
- (NSString)bootstrapICCID;
- (NSString)description;
- (STTelephonyMobileEquipmentInfo)init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)initWithMobileEquipmentInfo:(void *)a1;
@end

@implementation STTelephonyMobileEquipmentInfo

- (STTelephonyMobileEquipmentInfo)init
{
  return (STTelephonyMobileEquipmentInfo *)-[STTelephonyMobileEquipmentInfo initWithMobileEquipmentInfo:](self, 0);
}

- (void)initWithMobileEquipmentInfo:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v20.receiver = a1;
    v20.super_class = (Class)STTelephonyMobileEquipmentInfo;
    a1 = objc_msgSendSuper2(&v20, sel_init);
    if (a1)
    {
      v4 = [v3 MEID];
      uint64_t v5 = [v4 copy];
      v6 = (void *)a1[1];
      a1[1] = v5;

      v7 = [v3 IMEI];
      uint64_t v8 = [v7 copy];
      v9 = (void *)a1[2];
      a1[2] = v8;

      v10 = [v3 ICCID];
      uint64_t v11 = [v10 copy];
      v12 = (void *)a1[3];
      a1[3] = v11;

      v13 = [v3 CSN];
      uint64_t v14 = [v13 copy];
      v15 = (void *)a1[4];
      a1[4] = v14;

      v16 = [v3 bootstrapICCID];
      uint64_t v17 = [v16 copy];
      v18 = (void *)a1[5];
      a1[5] = v17;
    }
  }

  return a1;
}

- (BOOL)isOnBootstrap
{
  id v3 = [(STTelephonyMobileEquipmentInfo *)self ICCID];
  v4 = [(STTelephonyMobileEquipmentInfo *)self bootstrapICCID];
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[STMutableTelephonyMobileEquipmentInfo allocWithZone:a3];
  return -[STTelephonyMobileEquipmentInfo initWithMobileEquipmentInfo:](v4, self);
}

- (NSString)description
{
  return (NSString *)[(STTelephonyMobileEquipmentInfo *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STTelephonyMobileEquipmentInfo *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STTelephonyMobileEquipmentInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  char v5 = [(STTelephonyMobileEquipmentInfo *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__STTelephonyMobileEquipmentInfo_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AD1EE0;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __72__STTelephonyMobileEquipmentInfo_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) MEID];
  [v2 appendString:v3 withName:@"MEID"];

  id v4 = *(void **)(a1 + 32);
  char v5 = [*(id *)(a1 + 40) IMEI];
  [v4 appendString:v5 withName:@"IMEI"];

  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) ICCID];
  [v6 appendString:v7 withName:@"ICCID"];

  uint64_t v8 = *(void **)(a1 + 32);
  v9 = [*(id *)(a1 + 40) CSN];
  [v8 appendString:v9 withName:@"CSN"];

  id v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) bootstrapICCID];
  [v10 appendString:v11 withName:@"bootstrapICCID"];
}

- (NSString)MEID
{
  return self->_MEID;
}

- (NSString)IMEI
{
  return self->_IMEI;
}

- (NSString)ICCID
{
  return self->_ICCID;
}

- (NSString)CSN
{
  return self->_CSN;
}

- (NSString)bootstrapICCID
{
  return self->_bootstrapICCID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bootstrapICCID, 0);
  objc_storeStrong((id *)&self->_CSN, 0);
  objc_storeStrong((id *)&self->_ICCID, 0);
  objc_storeStrong((id *)&self->_IMEI, 0);
  objc_storeStrong((id *)&self->_MEID, 0);
}

@end