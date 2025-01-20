@interface ML3AccountCacheEntry
- (ML3AccountCacheEntry)initWithAppleID:(id)a3 altDSID:(id)a4;
- (NSString)altDSID;
- (NSString)appleID;
- (void)setAltDSID:(id)a3;
- (void)setAppleID:(id)a3;
@end

@implementation ML3AccountCacheEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_appleID, 0);
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAppleID:(id)a3
{
}

- (NSString)appleID
{
  return self->_appleID;
}

- (ML3AccountCacheEntry)initWithAppleID:(id)a3 altDSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3AccountCacheEntry;
  v9 = [(ML3AccountCacheEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleID, a3);
    objc_storeStrong((id *)&v10->_altDSID, a4);
  }

  return v10;
}

@end