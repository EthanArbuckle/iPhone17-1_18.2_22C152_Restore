@interface FudPersonalizationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)enableMixMatch;
- (BOOL)globalSigning;
- (BOOL)isChipEpochSet;
- (BOOL)isProductionModeSet;
- (BOOL)isSecurityModeSet;
- (BOOL)productionMode;
- (BOOL)securityMode;
- (BOOL)useSSOCredentials;
- (FudPersonalizationRequest)initWithCoder:(id)a3;
- (FudPersonalizationRequest)initWithName:(id)a3;
- (NSArray)objectList;
- (NSData)extEcID;
- (NSData)nonceHash;
- (NSData)payload;
- (NSString)requestName;
- (NSString)requestPrefix;
- (int)responseFormat;
- (unint64_t)ecID;
- (unsigned)boardID;
- (unsigned)chipEpoch;
- (unsigned)chipID;
- (unsigned)responseAlignment;
- (unsigned)securityDomain;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBoardID:(unsigned int)a3;
- (void)setChipEpoch:(unsigned int)a3;
- (void)setChipID:(unsigned int)a3;
- (void)setEcID:(unint64_t)a3;
- (void)setEnableMixMatch:(BOOL)a3;
- (void)setExtEcID:(id)a3;
- (void)setGlobalSigning:(BOOL)a3;
- (void)setNonceHash:(id)a3;
- (void)setObjectList:(id)a3;
- (void)setPayload:(id)a3;
- (void)setProductionMode:(BOOL)a3;
- (void)setRequestPrefix:(id)a3;
- (void)setResponseAlignment:(unsigned __int16)a3;
- (void)setResponseFormat:(int)a3;
- (void)setSecurityDomain:(unsigned int)a3;
- (void)setSecurityMode:(BOOL)a3;
- (void)setUseSSOCredentials:(BOOL)a3;
@end

@implementation FudPersonalizationRequest

- (FudPersonalizationRequest)initWithName:(id)a3
{
  v8 = (char *)self;
  if (a3)
  {
    v18.receiver = self;
    v18.super_class = (Class)FudPersonalizationRequest;
    v8 = [(FudPersonalizationRequest *)&v18 init];
    if (v8)
    {
      id v16 = a3;
      v8[12] = 0;
      *((void *)v8 + 5) = v16;
      *((void *)v8 + 6) = 0;
      *((void *)v8 + 7) = 0;
      *((void *)v8 + 8) = 0;
      *(_OWORD *)(v8 + 20) = xmmword_227047AF0;
      *((_DWORD *)v8 + 9) = 0;
      *((_WORD *)v8 + 8) = 0;
      *((_DWORD *)v8 + 2) = 0;
      *((void *)v8 + 10) = 0;
      *((void *)v8 + 11) = 0;
      *((void *)v8 + 9) = 0;
    }
    else
    {
      FudLog(3, @"%s(): super init error\n", v10, v11, v12, v13, v14, v15, (uint64_t)"-[FudPersonalizationRequest initWithName:]");
    }
  }
  else
  {
    FudLog(3, @"%s(): requestName=nil\n", 0, v3, v4, v5, v6, v7, (uint64_t)"-[FudPersonalizationRequest initWithName:]");
  }
  return (FudPersonalizationRequest *)v8;
}

- (void)dealloc
{
  requestName = self->_requestName;
  if (requestName) {

  }
  requestPrefix = self->_requestPrefix;
  if (requestPrefix) {

  }
  nonceHash = self->_nonceHash;
  if (nonceHash) {

  }
  objectList = self->_objectList;
  if (objectList) {

  }
  payload = self->_payload;
  if (payload) {

  }
  extEcID = self->_extEcID;
  if (extEcID) {

  }
  v9.receiver = self;
  v9.super_class = (Class)FudPersonalizationRequest;
  [(FudPersonalizationRequest *)&v9 dealloc];
}

- (void)setProductionMode:(BOOL)a3
{
  self->_cproSet = 1;
  self->_productionMode = a3;
}

- (void)setSecurityMode:(BOOL)a3
{
  self->_csecSet = 1;
  self->_securityMode = a3;
}

- (void)setEnableMixMatch:(BOOL)a3
{
  self->_enableMixMatch = a3;
}

- (void)setChipEpoch:(unsigned int)a3
{
  self->_cepoSet = 1;
  self->_chipEpoch = a3;
}

- (void)setUseSSOCredentials:(BOOL)a3
{
  self->_useSSOCredentials = a3;
}

- (BOOL)useSSOCredentials
{
  return self->_useSSOCredentials;
}

- (BOOL)isSecurityModeSet
{
  return self->_csecSet;
}

- (BOOL)isProductionModeSet
{
  return self->_cproSet;
}

- (BOOL)isChipEpochSet
{
  return self->_cepoSet;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_requestName forKey:@"requestName"];
  [a3 encodeObject:self->_requestPrefix forKey:@"requestPrefix"];
  [a3 encodeInt32:self->_responseFormat forKey:@"requestRspFormat"];
  [a3 encodeInt32:self->_boardID forKey:@"requestBoardID"];
  [a3 encodeInt32:self->_chipID forKey:@"requestChipID"];
  [a3 encodeInt64:self->_ecID forKey:@"requestECID"];
  [a3 encodeObject:self->_extEcID forKey:@"requestExtECID"];
  [a3 encodeBool:self->_globalSigning forKey:@"requestGlobalSign"];
  [a3 encodeInt32:self->_securityDomain forKey:@"requestSecDomain"];
  [a3 encodeBool:self->_cproSet forKey:@"requestProdModeSet"];
  [a3 encodeBool:self->_productionMode forKey:@"requestProdMode"];
  [a3 encodeBool:self->_csecSet forKey:@"requestSecModeSet"];
  [a3 encodeBool:self->_securityMode forKey:@"requestSecMode"];
  [a3 encodeObject:self->_nonceHash forKey:@"requestNonceHash"];
  [a3 encodeBool:self->_cepoSet forKey:@"requestChipEpochSet"];
  [a3 encodeInt32:self->_chipEpoch forKey:@"requestChipEpoch"];
  [a3 encodeBool:self->_enableMixMatch forKey:@"requestEnableMixMatch"];
  [a3 encodeObject:self->_objectList forKey:@"requestObjects"];
  [a3 encodeObject:self->_payload forKey:@"requestPayload"];
  uint64_t responseAlignment = self->_responseAlignment;
  [a3 encodeInt32:responseAlignment forKey:@"requestRspAlign"];
}

- (FudPersonalizationRequest)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)FudPersonalizationRequest;
  uint64_t v4 = [(FudPersonalizationRequest *)&v10 init];
  if (v4)
  {
    v4->_requestName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"requestName"];
    v4->_requestPrefix = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"requestPrefix"];
    v4->_responseFormat = [a3 decodeInt32ForKey:@"requestRspFormat"];
    v4->_boardID = [a3 decodeInt32ForKey:@"requestBoardID"];
    v4->_chipID = [a3 decodeInt32ForKey:@"requestChipID"];
    v4->_ecID = [a3 decodeInt64ForKey:@"requestECID"];
    v4->_extEcID = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"requestExtECID"];
    v4->_globalSigning = [a3 decodeBoolForKey:@"requestGlobalSign"];
    v4->_securityDomain = [a3 decodeInt32ForKey:@"requestSecDomain"];
    v4->_cproSet = [a3 decodeBoolForKey:@"requestProdModeSet"];
    v4->_productionMode = [a3 decodeBoolForKey:@"requestProdMode"];
    v4->_csecSet = [a3 decodeBoolForKey:@"requestSecModeSet"];
    v4->_securityMode = [a3 decodeBoolForKey:@"requestSecMode"];
    v4->_nonceHash = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"requestNonceHash"];
    v4->_cepoSet = [a3 decodeBoolForKey:@"requestChipEpochSet"];
    v4->_chipEpoch = [a3 decodeInt32ForKey:@"requestChipEpoch"];
    v4->_enableMixMatch = [a3 decodeBoolForKey:@"requestEnableMixMatch"];
    uint64_t v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v4->_objectList = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0), @"requestObjects");
    v4->_payload = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"requestPayload"];
    v4->_uint64_t responseAlignment = [a3 decodeInt32ForKey:@"requestRspAlign"];
  }
  return v4;
}

- (NSString)requestName
{
  return self->_requestName;
}

- (NSString)requestPrefix
{
  return self->_requestPrefix;
}

- (void)setRequestPrefix:(id)a3
{
}

- (int)responseFormat
{
  return self->_responseFormat;
}

- (void)setResponseFormat:(int)a3
{
  self->_responseFormat = a3;
}

- (unsigned)boardID
{
  return self->_boardID;
}

- (void)setBoardID:(unsigned int)a3
{
  self->_boardID = a3;
}

- (unsigned)chipID
{
  return self->_chipID;
}

- (void)setChipID:(unsigned int)a3
{
  self->_chipID = a3;
}

- (unint64_t)ecID
{
  return self->_ecID;
}

- (void)setEcID:(unint64_t)a3
{
  self->_ecID = a3;
}

- (NSData)extEcID
{
  return self->_extEcID;
}

- (void)setExtEcID:(id)a3
{
}

- (BOOL)globalSigning
{
  return self->_globalSigning;
}

- (void)setGlobalSigning:(BOOL)a3
{
  self->_globalSigning = a3;
}

- (unsigned)securityDomain
{
  return self->_securityDomain;
}

- (void)setSecurityDomain:(unsigned int)a3
{
  self->_securityDomain = a3;
}

- (BOOL)productionMode
{
  return self->_productionMode;
}

- (BOOL)securityMode
{
  return self->_securityMode;
}

- (NSData)nonceHash
{
  return self->_nonceHash;
}

- (void)setNonceHash:(id)a3
{
}

- (unsigned)chipEpoch
{
  return self->_chipEpoch;
}

- (BOOL)enableMixMatch
{
  return self->_enableMixMatch;
}

- (NSArray)objectList
{
  return self->_objectList;
}

- (void)setObjectList:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (unsigned)responseAlignment
{
  return self->_responseAlignment;
}

- (void)setResponseAlignment:(unsigned __int16)a3
{
  self->_uint64_t responseAlignment = a3;
}

@end