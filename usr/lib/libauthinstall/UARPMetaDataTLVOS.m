@interface UARPMetaDataTLVOS
+ (id)metaDataTable;
+ (id)metaDataTableEntry;
+ (id)tlvFromKey:(id)a3 value:(id)a4;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvFromType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5;
+ (id)tlvTypeName:(unsigned int)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
- (UARPMetaDataTLVOS)init;
- (UARPMetaDataTLVOS)initWithType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)tlvLength;
- (unsigned)tlvType;
@end

@implementation UARPMetaDataTLVOS

- (UARPMetaDataTLVOS)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLVOS;
  return [(UARPMetaDataTLVOS *)&v3 init];
}

- (UARPMetaDataTLVOS)initWithType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  v13.receiver = self;
  v13.super_class = (Class)UARPMetaDataTLVOS;
  v8 = [(UARPMetaDataTLVOS *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_tlvType = a3;
    v8->_tlvLength = a4;
    v10 = (NSData *)(id)[MEMORY[0x263EFF8F8] dataWithBytes:a5 length:a4];
    tlvValue = v9->_tlvValue;
    v9->_tlvValue = v10;
  }
  return v9;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<Type = 0x%08x, Length = 0x%08x>", self->_tlvType, self->_tlvLength];
}

+ (id)tlvFromType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  switch(a3)
  {
    case 0x88B29100:
      v5 = UARPTLVPersonalizationRequiredOS;
      goto LABEL_41;
    case 0x88B29101:
      v5 = UARPTLVPersonalizationPayloadTagOS;
      goto LABEL_41;
    case 0x88B29102:
      v5 = UARPTLVPersonalizationSuperBinaryAssetIDOS;
      goto LABEL_41;
    case 0x88B29103:
      v5 = UARPTLVPersonalizationManifestPrefixOS;
      goto LABEL_41;
    case 0x88B29104:
      v5 = UARPTLVPersonalizationBoardIDOS;
      goto LABEL_41;
    case 0x88B29105:
      v5 = UARPTLVPersonalizationChipIDOS;
      goto LABEL_41;
    case 0x88B29106:
      v5 = UARPTLVPersonalizationECIDOS;
      goto LABEL_41;
    case 0x88B29107:
      v5 = UARPTLVPersonalizationNonceOS;
      goto LABEL_41;
    case 0x88B29108:
      v5 = UARPTLVPersonalizationNonceHashOS;
      goto LABEL_41;
    case 0x88B29109:
      v5 = UARPTLVPersonalizationSecurityDomainOS;
      goto LABEL_41;
    case 0x88B2910A:
      v5 = UARPTLVPersonalizationSecurityModeOS;
      goto LABEL_41;
    case 0x88B2910B:
      v5 = UARPTLVPersonalizationProductionModeOS;
      goto LABEL_41;
    case 0x88B2910C:
      v5 = UARPTLVPersonalizationChipEpochOS;
      goto LABEL_41;
    case 0x88B2910D:
      v5 = UARPTLVPersonalizationEnableMixMatchOS;
      goto LABEL_41;
    case 0x88B2910E:
      v5 = UARPTLVPersonalizationSuperBinaryPayloadIndexOS;
      goto LABEL_41;
    case 0x88B2910F:
      v5 = UARPTLVPersonalizationChipRevisionOS;
      goto LABEL_41;
    case 0x88B29110:
      v5 = UARPTLVPersonalizationFTABPayloadOS;
      goto LABEL_41;
    case 0x88B29111:
      v5 = UARPTLVPersonalizationFTABSubfileTagOS;
      goto LABEL_41;
    case 0x88B29112:
      v5 = UARPTLVPersonalizationFTABSubfileLongnameOS;
      goto LABEL_41;
    case 0x88B29113:
      v5 = UARPTLVPersonalizationFTABSubfileDigestOS;
      goto LABEL_41;
    case 0x88B29114:
      v5 = UARPTLVPersonalizationFTABSubfileHashAlgorithmOS;
      goto LABEL_41;
    case 0x88B29115:
      v5 = UARPTLVPersonalizationFTABSubfileESECOS;
      goto LABEL_41;
    case 0x88B29116:
      v5 = UARPTLVPersonalizationFTABSubfileEPROOS;
      goto LABEL_41;
    case 0x88B29117:
      v5 = UARPTLVPersonalizationFTABSubfileTrustedOS;
      goto LABEL_41;
    case 0x88B29118:
      v5 = UARPTLVPersonalizationSoCLiveNonceOS;
      goto LABEL_41;
    case 0x88B29121:
      v5 = UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS;
      goto LABEL_41;
    case 0x88B29122:
      v5 = UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberOS;
      goto LABEL_41;
    case 0x88B29125:
      v5 = UARPTLVPersonalizationLogicalUnitNumberOS;
      goto LABEL_41;
    case 0x88B29126:
      v5 = UARPTLVPersonalizationTicketNeedsLogicalUnitNumberOS;
      goto LABEL_41;
    case 0x88B29128:
      v5 = UARPTLVHostPersonalizationRequiredOS;
      goto LABEL_41;
    case 0x88B29129:
      v5 = UARPTLVRequiredPersonalizationOptionOS;
      goto LABEL_41;
    case 0x88B29130:
      v5 = UARPTLVPersonalizedManifestOS;
      goto LABEL_41;
    case 0x88B29131:
      v5 = UARPTLVPersonalizationLifeOS;
      goto LABEL_41;
    case 0x88B29132:
      v5 = UARPTLVPersonalizationProvisioningOS;
      goto LABEL_41;
    case 0x88B29133:
      v5 = UARPTLVPersonalizationManifestEpochOS;
      goto LABEL_41;
    case 0x88B29134:
      v5 = UARPTLVPersonalizationManifestSuffixOS;
      goto LABEL_41;
    case 0x88B29135:
      v5 = UARPTLVPersonalizationECIDDataOS;
      goto LABEL_41;
    case 0x88B29136:
      v5 = UARPTLVPersonalizationFTABSubfileDigestFilenameOS;
LABEL_41:
      v6 = (UARPMetaDataTLVOS *)(id)[(__objc2_class *)v5 tlvWithLength:a4 value:a5];
      break;
    default:
      v6 = [[UARPMetaDataTLVOS alloc] initWithType:*(void *)&a3 length:*(void *)&a4 value:a5];
      break;
  }

  return v6;
}

+ (id)tlvFromKey:(id)a3 value:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v19 = a4;
  id v6 = +[UARPMetaDataTLVOS metaDataTable];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v13 = (id)[v12 objectForKeyedSubscript:@"Name"];
        if (![v5 caseInsensitiveCompare:v13])
        {
          id v14 = (id)[v12 objectForKeyedSubscript:@"Value"];
          unsigned int v15 = [v14 unsignedLongValue] + 2001563392;
          if (v15 <= 0x35 && ((0x3F036601FFFFFFuLL >> v15) & 1) != 0)
          {
            id v16 = (id)[(__objc2_class *)*off_2642BB618[v15] tlvFromPropertyListValue:v19];
            v17 = v9;
            id v9 = v16;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)metaDataTable
{
  if (metaDataTable_once != -1) {
    dispatch_once(&metaDataTable_once, &__block_literal_global_1);
  }
  v2 = (void *)metaDataTable_table;

  return v2;
}

void __34__UARPMetaDataTLVOS_metaDataTable__block_invoke()
{
  v0 = objc_opt_new();
  id v1 = +[UARPTLVPersonalizationRequiredOS metaDataTableEntry];
  [v0 addObject:v1];

  id v2 = +[UARPTLVPersonalizationPayloadTagOS metaDataTableEntry];
  [v0 addObject:v2];

  id v3 = +[UARPTLVPersonalizationSuperBinaryAssetIDOS metaDataTableEntry];
  [v0 addObject:v3];

  id v4 = +[UARPTLVPersonalizationManifestPrefixOS metaDataTableEntry];
  [v0 addObject:v4];

  id v5 = +[UARPTLVPersonalizationBoardIDOS metaDataTableEntry];
  [v0 addObject:v5];

  id v6 = +[UARPTLVPersonalizationChipIDOS metaDataTableEntry];
  [v0 addObject:v6];

  id v7 = +[UARPTLVPersonalizationECIDOS metaDataTableEntry];
  [v0 addObject:v7];

  id v8 = +[UARPTLVPersonalizationECIDDataOS metaDataTableEntry];
  [v0 addObject:v8];

  id v9 = +[UARPTLVPersonalizationNonceOS metaDataTableEntry];
  [v0 addObject:v9];

  id v10 = +[UARPTLVPersonalizationNonceHashOS metaDataTableEntry];
  [v0 addObject:v10];

  id v11 = +[UARPTLVPersonalizationSecurityDomainOS metaDataTableEntry];
  [v0 addObject:v11];

  id v12 = +[UARPTLVPersonalizationSecurityModeOS metaDataTableEntry];
  [v0 addObject:v12];

  id v13 = +[UARPTLVPersonalizationProductionModeOS metaDataTableEntry];
  [v0 addObject:v13];

  id v14 = +[UARPTLVPersonalizationChipEpochOS metaDataTableEntry];
  [v0 addObject:v14];

  id v15 = +[UARPTLVPersonalizationEnableMixMatchOS metaDataTableEntry];
  [v0 addObject:v15];

  id v16 = +[UARPTLVPersonalizationSuperBinaryPayloadIndexOS metaDataTableEntry];
  [v0 addObject:v16];

  id v17 = +[UARPTLVPersonalizationChipRevisionOS metaDataTableEntry];
  [v0 addObject:v17];

  id v18 = +[UARPTLVPersonalizationFTABSubfileTagOS metaDataTableEntry];
  [v0 addObject:v18];

  id v19 = +[UARPTLVPersonalizationFTABSubfileLongnameOS metaDataTableEntry];
  [v0 addObject:v19];

  id v20 = +[UARPTLVPersonalizationFTABSubfileDigestOS metaDataTableEntry];
  [v0 addObject:v20];

  id v21 = +[UARPTLVPersonalizationFTABSubfileHashAlgorithmOS metaDataTableEntry];
  [v0 addObject:v21];

  id v22 = +[UARPTLVPersonalizationFTABSubfileESECOS metaDataTableEntry];
  [v0 addObject:v22];

  id v23 = +[UARPTLVPersonalizationFTABSubfileEPROOS metaDataTableEntry];
  [v0 addObject:v23];

  id v24 = +[UARPTLVPersonalizationFTABSubfileTrustedOS metaDataTableEntry];
  [v0 addObject:v24];

  id v25 = +[UARPTLVPersonalizationSoCLiveNonceOS metaDataTableEntry];
  [v0 addObject:v25];

  id v26 = +[UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberOS metaDataTableEntry];
  [v0 addObject:v26];

  id v27 = +[UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberOS metaDataTableEntry];
  [v0 addObject:v27];

  id v28 = +[UARPTLVPersonalizationLogicalUnitNumberOS metaDataTableEntry];
  [v0 addObject:v28];

  id v29 = +[UARPTLVPersonalizationTicketNeedsLogicalUnitNumberOS metaDataTableEntry];
  [v0 addObject:v29];

  id v30 = +[UARPTLVHostPersonalizationRequiredOS metaDataTableEntry];
  [v0 addObject:v30];

  id v31 = +[UARPTLVRequiredPersonalizationOptionOS metaDataTableEntry];
  [v0 addObject:v31];

  id v32 = +[UARPTLVPersonalizationFTABPayloadOS metaDataTableEntry];
  [v0 addObject:v32];

  id v33 = +[UARPTLVPersonalizedManifestOS metaDataTableEntry];
  [v0 addObject:v33];

  id v34 = +[UARPTLVPersonalizationLifeOS metaDataTableEntry];
  [v0 addObject:v34];

  id v35 = +[UARPTLVPersonalizationProvisioningOS metaDataTableEntry];
  [v0 addObject:v35];

  id v36 = +[UARPTLVPersonalizationManifestEpochOS metaDataTableEntry];
  [v0 addObject:v36];

  id v37 = +[UARPTLVPersonalizationManifestSuffixOS metaDataTableEntry];
  [v0 addObject:v37];

  id v38 = (id)[MEMORY[0x263EFF8C0] arrayWithArray:v0];
  v39 = (void *)metaDataTable_table;
  metaDataTable_table = (uint64_t)v38;
}

+ (id)tlvTypeName:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = +[UARPMetaDataTLVOS metaDataTable];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = (id)[v8 objectForKeyedSubscript:@"Value"];
        id v10 = (id)[NSNumber numberWithUnsignedInt:v3];
        char v11 = [v9 isEqual:v10];

        if (v11)
        {
          id v12 = (id)[v8 objectForKeyedSubscript:@"Name"];
          goto LABEL_11;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (id)generateTLV
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF990]);
  int v7 = uarpHtonl(self->_tlvType);
  [v3 appendBytes:&v7 length:4];
  int v6 = uarpHtonl(self->_tlvLength);
  [v3 appendBytes:&v6 length:4];
  [v3 appendData:self->_tlvValue];
  id v4 = (id)[MEMORY[0x263EFF8F8] dataWithData:v3];

  return v4;
}

- (id)tlvValue
{
  return self->_tlvValue;
}

+ (id)metaDataTableEntry
{
  return 0;
}

+ (id)tlvFromPropertyListValue:(id)a3
{
  return 0;
}

+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4
{
  return 0;
}

- (unsigned)tlvType
{
  return self->_tlvType;
}

- (unsigned)tlvLength
{
  return self->_tlvLength;
}

- (void).cxx_destruct
{
}

@end