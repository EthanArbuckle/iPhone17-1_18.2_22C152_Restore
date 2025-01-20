@interface BKLibraryManagerAccountIdentifiers
- (BKLibraryManagerAccountIdentifiers)initWithAsset:(id)a3;
- (BKLibraryManagerAccountIdentifiers)initWithPurchasedDSID:(id)a3 downloadedDSID:(id)a4 familyID:(id)a5;
- (NSString)downloadedDSID;
- (NSString)familyID;
- (NSString)purchasedDSID;
@end

@implementation BKLibraryManagerAccountIdentifiers

- (BKLibraryManagerAccountIdentifiers)initWithPurchasedDSID:(id)a3 downloadedDSID:(id)a4 familyID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BKLibraryManagerAccountIdentifiers;
  v11 = [(BKLibraryManagerAccountIdentifiers *)&v19 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    purchasedDSID = v11->_purchasedDSID;
    v11->_purchasedDSID = v12;

    v14 = (NSString *)[v9 copy];
    downloadedDSID = v11->_downloadedDSID;
    v11->_downloadedDSID = v14;

    v16 = (NSString *)[v10 copy];
    familyID = v11->_familyID;
    v11->_familyID = v16;
  }
  return v11;
}

- (BKLibraryManagerAccountIdentifiers)initWithAsset:(id)a3
{
  id v4 = a3;
  v5 = [v4 purchasedDSID];
  v6 = [v4 downloadedDSID];
  v7 = [v4 familyID];

  id v8 = [(BKLibraryManagerAccountIdentifiers *)self initWithPurchasedDSID:v5 downloadedDSID:v6 familyID:v7];
  return v8;
}

- (NSString)purchasedDSID
{
  return self->_purchasedDSID;
}

- (NSString)downloadedDSID
{
  return self->_downloadedDSID;
}

- (NSString)familyID
{
  return self->_familyID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_downloadedDSID, 0);

  objc_storeStrong((id *)&self->_purchasedDSID, 0);
}

@end