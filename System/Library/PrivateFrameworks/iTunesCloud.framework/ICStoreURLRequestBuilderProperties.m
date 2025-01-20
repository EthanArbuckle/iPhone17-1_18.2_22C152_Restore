@interface ICStoreURLRequestBuilderProperties
- (ICDelegateToken)delegateToken;
- (ICURLBag)URLBag;
- (ICURLBag)delegatedURLBag;
- (NSNumber)DSID;
- (NSNumber)delegatedDSID;
- (NSString)delegatedStorefrontIdentifier;
- (NSString)iCloudPersonID;
- (NSString)storefrontIdentifier;
- (void)setDSID:(id)a3;
- (void)setDelegateToken:(id)a3;
- (void)setDelegatedDSID:(id)a3;
- (void)setDelegatedStorefrontIdentifier:(id)a3;
- (void)setDelegatedURLBag:(id)a3;
- (void)setICloudPersonID:(id)a3;
- (void)setStorefrontIdentifier:(id)a3;
- (void)setURLBag:(id)a3;
@end

@implementation ICStoreURLRequestBuilderProperties

- (void)setStorefrontIdentifier:(id)a3
{
}

- (void)setICloudPersonID:(id)a3
{
}

- (void)setDSID:(id)a3
{
}

- (void)setURLBag:(id)a3
{
}

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

- (NSString)iCloudPersonID
{
  return self->_iCloudPersonID;
}

- (NSString)delegatedStorefrontIdentifier
{
  return self->_delegatedStorefrontIdentifier;
}

- (NSNumber)delegatedDSID
{
  return self->_delegatedDSID;
}

- (ICDelegateToken)delegateToken
{
  return self->_delegateToken;
}

- (ICURLBag)URLBag
{
  return self->_URLBag;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatedURLBag, 0);
  objc_storeStrong((id *)&self->_delegateToken, 0);
  objc_storeStrong((id *)&self->_delegatedStorefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_delegatedDSID, 0);
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_DSID, 0);
  objc_storeStrong((id *)&self->_URLBag, 0);

  objc_storeStrong((id *)&self->_iCloudPersonID, 0);
}

- (void)setDelegatedURLBag:(id)a3
{
}

- (ICURLBag)delegatedURLBag
{
  return self->_delegatedURLBag;
}

- (void)setDelegateToken:(id)a3
{
}

- (void)setDelegatedStorefrontIdentifier:(id)a3
{
}

- (void)setDelegatedDSID:(id)a3
{
}

@end