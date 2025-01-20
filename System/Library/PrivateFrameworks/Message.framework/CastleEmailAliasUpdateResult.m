@interface CastleEmailAliasUpdateResult
- (BOOL)accountNeedsToUpdateProperties;
- (BOOL)isSuccess;
- (BOOL)notModified;
- (CastleEmailAliasUpdateResult)init;
- (CastleEmailAliasUpdateResult)initWithReceiveEmailAliasAddresses:(id)a3 emailAddresses:(id)a4 defaultEmailAddress:(id)a5 entityTag:(id)a6 isSuccess:(BOOL)a7 notModified:(BOOL)a8 accountNeedsToUpdateProperties:(BOOL)a9;
- (NSDictionary)emailAddresses;
- (NSDictionary)receiveEmailAliasAddresses;
- (NSString)defaultEmailAddress;
- (NSString)entityTag;
@end

@implementation CastleEmailAliasUpdateResult

- (CastleEmailAliasUpdateResult)init
{
  LOBYTE(v3) = 0;
  return [(CastleEmailAliasUpdateResult *)self initWithReceiveEmailAliasAddresses:0 emailAddresses:0 defaultEmailAddress:0 entityTag:0 isSuccess:0 notModified:0 accountNeedsToUpdateProperties:v3];
}

- (CastleEmailAliasUpdateResult)initWithReceiveEmailAliasAddresses:(id)a3 emailAddresses:(id)a4 defaultEmailAddress:(id)a5 entityTag:(id)a6 isSuccess:(BOOL)a7 notModified:(BOOL)a8 accountNeedsToUpdateProperties:(BOOL)a9
{
  id v16 = a3;
  id v17 = a4;
  id v22 = a5;
  id v18 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CastleEmailAliasUpdateResult;
  v19 = [(CastleEmailAliasUpdateResult *)&v23 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_receiveEmailAliasAddresses, a3);
    objc_storeStrong((id *)&v20->_emailAddresses, a4);
    objc_storeStrong((id *)&v20->_defaultEmailAddress, a5);
    objc_storeStrong((id *)&v20->_entityTag, a6);
    v20->_isSuccess = a7;
    v20->_notModified = a8;
    v20->_accountNeedsToUpdateProperties = a9;
  }

  return v20;
}

- (NSDictionary)receiveEmailAliasAddresses
{
  return self->_receiveEmailAliasAddresses;
}

- (NSDictionary)emailAddresses
{
  return self->_emailAddresses;
}

- (NSString)defaultEmailAddress
{
  return self->_defaultEmailAddress;
}

- (BOOL)accountNeedsToUpdateProperties
{
  return self->_accountNeedsToUpdateProperties;
}

- (NSString)entityTag
{
  return self->_entityTag;
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (BOOL)notModified
{
  return self->_notModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityTag, 0);
  objc_storeStrong((id *)&self->_defaultEmailAddress, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_receiveEmailAliasAddresses, 0);
}

@end