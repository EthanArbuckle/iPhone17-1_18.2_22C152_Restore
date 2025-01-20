@interface AEAccountIdentifiers
+ (id)accountIdentifiersFromPurchasedDSID:(id)a3 downloadedDSID:(id)a4 familyID:(id)a5;
- (AEAccountIdentifiers)initWithPurchasedDSID:(id)a3 downloadedDSID:(id)a4 familyID:(id)a5;
- (NSString)downloadedDSID;
- (NSString)familyID;
- (NSString)purchasedDSID;
@end

@implementation AEAccountIdentifiers

+ (id)accountIdentifiersFromPurchasedDSID:(id)a3 downloadedDSID:(id)a4 familyID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPurchasedDSID:v10 downloadedDSID:v9 familyID:v8];

  return v11;
}

- (AEAccountIdentifiers)initWithPurchasedDSID:(id)a3 downloadedDSID:(id)a4 familyID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AEAccountIdentifiers;
  id v11 = [(AEAccountIdentifiers *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_purchasedDSID, v8);
    objc_storeWeak((id *)&v12->_downloadedDSID, v9);
    objc_storeWeak((id *)&v12->_familyID, v10);
  }

  return v12;
}

- (NSString)purchasedDSID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_purchasedDSID);

  return (NSString *)WeakRetained;
}

- (NSString)downloadedDSID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadedDSID);

  return (NSString *)WeakRetained;
}

- (NSString)familyID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_familyID);

  return (NSString *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_familyID);
  objc_destroyWeak((id *)&self->_downloadedDSID);

  objc_destroyWeak((id *)&self->_purchasedDSID);
}

@end