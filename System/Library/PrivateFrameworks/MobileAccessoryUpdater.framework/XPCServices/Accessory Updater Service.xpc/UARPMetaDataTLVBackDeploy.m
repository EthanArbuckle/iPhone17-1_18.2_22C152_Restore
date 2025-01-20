@interface UARPMetaDataTLVBackDeploy
+ (id)metaDataTable;
+ (id)metaDataTableEntry;
+ (id)tlvFromKey:(id)a3 value:(id)a4;
+ (id)tlvFromPropertyListValue:(id)a3;
+ (id)tlvFromType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5;
+ (id)tlvTypeName:(unsigned int)a3;
+ (id)tlvWithLength:(unint64_t)a3 value:(void *)a4;
- (UARPMetaDataTLVBackDeploy)init;
- (UARPMetaDataTLVBackDeploy)initWithType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5;
- (id)description;
- (id)generateTLV;
- (id)tlvValue;
- (unsigned)tlvLength;
- (unsigned)tlvType;
@end

@implementation UARPMetaDataTLVBackDeploy

- (UARPMetaDataTLVBackDeploy)init
{
  v3.receiver = self;
  v3.super_class = (Class)UARPMetaDataTLVBackDeploy;
  return [(UARPMetaDataTLVBackDeploy *)&v3 init];
}

- (UARPMetaDataTLVBackDeploy)initWithType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  v13.receiver = self;
  v13.super_class = (Class)UARPMetaDataTLVBackDeploy;
  v8 = [(UARPMetaDataTLVBackDeploy *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_tlvType = a3;
    v8->_tlvLength = a4;
    v10 = +[NSData dataWithBytes:a5 length:a4];
    tlvValue = v9->_tlvValue;
    v9->_tlvValue = v10;
  }
  return v9;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<Type = 0x%08x, Length = 0x%08x>", self->_tlvType, self->_tlvLength];
}

+ (id)tlvFromType:(unsigned int)a3 length:(unsigned int)a4 value:(void *)a5
{
  switch(a3)
  {
    case 0x88B29100:
      v5 = UARPTLVPersonalizationRequiredBackDeploy;
      goto LABEL_41;
    case 0x88B29101:
      v5 = UARPTLVPersonalizationPayloadTagBackDeploy;
      goto LABEL_41;
    case 0x88B29102:
      v5 = UARPTLVPersonalizationSuperBinaryAssetIDBackDeploy;
      goto LABEL_41;
    case 0x88B29103:
      v5 = UARPTLVPersonalizationManifestPrefixBackDeploy;
      goto LABEL_41;
    case 0x88B29104:
      v5 = UARPTLVPersonalizationBoardIDBackDeploy;
      goto LABEL_41;
    case 0x88B29105:
      v5 = UARPTLVPersonalizationChipIDBackDeploy;
      goto LABEL_41;
    case 0x88B29106:
      v5 = UARPTLVPersonalizationECIDBackDeploy;
      goto LABEL_41;
    case 0x88B29107:
      v5 = UARPTLVPersonalizationNonceBackDeploy;
      goto LABEL_41;
    case 0x88B29108:
      v5 = UARPTLVPersonalizationNonceHashBackDeploy;
      goto LABEL_41;
    case 0x88B29109:
      v5 = UARPTLVPersonalizationSecurityDomainBackDeploy;
      goto LABEL_41;
    case 0x88B2910A:
      v5 = UARPTLVPersonalizationSecurityModeBackDeploy;
      goto LABEL_41;
    case 0x88B2910B:
      v5 = UARPTLVPersonalizationProductionModeBackDeploy;
      goto LABEL_41;
    case 0x88B2910C:
      v5 = UARPTLVPersonalizationChipEpochBackDeploy;
      goto LABEL_41;
    case 0x88B2910D:
      v5 = UARPTLVPersonalizationEnableMixMatchBackDeploy;
      goto LABEL_41;
    case 0x88B2910E:
      v5 = UARPTLVPersonalizationSuperBinaryPayloadIndexBackDeploy;
      goto LABEL_41;
    case 0x88B2910F:
      v5 = UARPTLVPersonalizationChipRevisionBackDeploy;
      goto LABEL_41;
    case 0x88B29110:
      v5 = UARPTLVPersonalizationFTABPayloadBackDeploy;
      goto LABEL_41;
    case 0x88B29111:
      v5 = UARPTLVPersonalizationFTABSubfileTagBackDeploy;
      goto LABEL_41;
    case 0x88B29112:
      v5 = UARPTLVPersonalizationFTABSubfileLongnameBackDeploy;
      goto LABEL_41;
    case 0x88B29113:
      v5 = UARPTLVPersonalizationFTABSubfileDigestBackDeploy;
      goto LABEL_41;
    case 0x88B29114:
      v5 = UARPTLVPersonalizationFTABSubfileHashAlgorithmBackDeploy;
      goto LABEL_41;
    case 0x88B29115:
      v5 = UARPTLVPersonalizationFTABSubfileESECBackDeploy;
      goto LABEL_41;
    case 0x88B29116:
      v5 = UARPTLVPersonalizationFTABSubfileEPROBackDeploy;
      goto LABEL_41;
    case 0x88B29117:
      v5 = UARPTLVPersonalizationFTABSubfileTrustedBackDeploy;
      goto LABEL_41;
    case 0x88B29118:
      v5 = UARPTLVPersonalizationSoCLiveNonceBackDeploy;
      goto LABEL_41;
    case 0x88B29121:
      v5 = UARPTLVPersonalizationPrefixNeedsLogicalUnitNumberBackDeploy;
      goto LABEL_41;
    case 0x88B29122:
      v5 = UARPTLVPersonalizationSuffixNeedsLogicalUnitNumberBackDeploy;
      goto LABEL_41;
    case 0x88B29125:
      v5 = UARPTLVPersonalizationLogicalUnitNumberBackDeploy;
      goto LABEL_41;
    case 0x88B29126:
      v5 = UARPTLVPersonalizationTicketNeedsLogicalUnitNumberBackDeploy;
      goto LABEL_41;
    case 0x88B29128:
      v5 = UARPTLVHostPersonalizationRequiredBackDeploy;
      goto LABEL_41;
    case 0x88B29129:
      v5 = UARPTLVRequiredPersonalizationOptionBackDeploy;
      goto LABEL_41;
    case 0x88B29130:
      v5 = UARPTLVPersonalizedManifestBackDeploy;
      goto LABEL_41;
    case 0x88B29131:
      v5 = UARPTLVPersonalizationLifeBackDeploy;
      goto LABEL_41;
    case 0x88B29132:
      v5 = UARPTLVPersonalizationProvisioningBackDeploy;
      goto LABEL_41;
    case 0x88B29133:
      v5 = UARPTLVPersonalizationManifestEpochBackDeploy;
      goto LABEL_41;
    case 0x88B29134:
      v5 = UARPTLVPersonalizationManifestSuffixBackDeploy;
      goto LABEL_41;
    case 0x88B29135:
      v5 = UARPTLVPersonalizationECIDDataBackDeploy;
      goto LABEL_41;
    case 0x88B29136:
      v5 = UARPTLVPersonalizationFTABSubfileDigestFilenameBackDeploy;
LABEL_41:
      v6 = (UARPMetaDataTLVBackDeploy *)[(__objc2_class *)v5 tlvWithLength:a4 value:a5];
      break;
    default:
      v6 = [[UARPMetaDataTLVBackDeploy alloc] initWithType:*(void *)&a3 length:*(void *)&a4 value:a5];
      break;
  }
  return v6;
}

+ (id)tlvFromKey:(id)a3 value:(id)a4
{
  id v5 = a3;
  id v19 = a4;
  id v6 = +[UARPMetaDataTLVBackDeploy metaDataTable];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v13 = [v12 objectForKeyedSubscript:@"Name"];
        if (![v5 caseInsensitiveCompare:v13])
        {
          id v14 = [v12 objectForKeyedSubscript:@"Value"];
          unsigned int v15 = [v14 unsignedLongValue] + 2001563392;
          if (v15 <= 0x35 && ((0x3F036601FFFFFFuLL >> v15) & 1) != 0)
          {
            id v16 = [(__objc2_class *)*off_10009ED48[v15] tlvFromPropertyListValue:v19];
            v17 = v9;
            id v9 = v16;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
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
  if (qword_1000B95B8 != -1) {
    dispatch_once(&qword_1000B95B8, &stru_10009ED28);
  }
  v2 = (void *)qword_1000B95B0;
  return v2;
}

+ (id)tlvTypeName:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = +[UARPMetaDataTLVBackDeploy metaDataTable];
  id v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [v8 objectForKeyedSubscript:@"Value"];
        uint64_t v10 = +[NSNumber numberWithUnsignedInt:v3];
        unsigned __int8 v11 = [v9 isEqual:v10];

        if (v11)
        {
          id v12 = [v8 objectForKeyedSubscript:@"Name"];
          goto LABEL_11;
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
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
  id v3 = objc_alloc_init((Class)NSMutableData);
  int v7 = uarpHtonl(self->_tlvType);
  [v3 appendBytes:&v7 length:4];
  int v6 = uarpHtonl(self->_tlvLength);
  [v3 appendBytes:&v6 length:4];
  [v3 appendData:self->_tlvValue];
  id v4 = +[NSData dataWithData:v3];

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