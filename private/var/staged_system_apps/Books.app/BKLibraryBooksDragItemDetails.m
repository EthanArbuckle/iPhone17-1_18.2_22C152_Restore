@interface BKLibraryBooksDragItemDetails
- (BKLibraryBooksDragItemDetails)initWithCollectionID:(id)a3 assetID:(id)a4 bvcType:(int64_t)a5;
- (NSString)assetID;
- (NSString)sourceCollectionID;
- (int64_t)bvcType;
@end

@implementation BKLibraryBooksDragItemDetails

- (BKLibraryBooksDragItemDetails)initWithCollectionID:(id)a3 assetID:(id)a4 bvcType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BKLibraryBooksDragItemDetails;
  v10 = [(BKLibraryBooksDragItemDetails *)&v16 init];
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    sourceCollectionID = v10->_sourceCollectionID;
    v10->_sourceCollectionID = v11;

    v13 = (NSString *)[v9 copy];
    assetID = v10->_assetID;
    v10->_assetID = v13;

    v10->_bvcType = a5;
  }

  return v10;
}

- (NSString)sourceCollectionID
{
  return self->_sourceCollectionID;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (int64_t)bvcType
{
  return self->_bvcType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);

  objc_storeStrong((id *)&self->_sourceCollectionID, 0);
}

@end