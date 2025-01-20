@interface CSDecryptInfo
- (CSDecryptInfo)initWithPlistObject:(id *)a3 externalID:(id)a4;
- (NSData)decryptInfo;
- (NSString)externalID;
- (void)setDecryptInfo:(id)a3;
- (void)setExternalID:(id)a3;
@end

@implementation CSDecryptInfo

- (CSDecryptInfo)initWithPlistObject:(id *)a3 externalID:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSDecryptInfo;
  v7 = [(CSDecryptInfo *)&v12 init];
  if (v7
    && (uint64_t v8 = _MDPlistContainerCopyObject(),
        decryptInfo = v7->_decryptInfo,
        v7->_decryptInfo = (NSData *)v8,
        decryptInfo,
        objc_storeStrong((id *)&v7->_externalID, a4),
        v7->_decryptInfo)
    && v7->_externalID)
  {
    v10 = v7;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (void)setExternalID:(id)a3
{
}

- (NSData)decryptInfo
{
  return self->_decryptInfo;
}

- (void)setDecryptInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decryptInfo, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
}

@end