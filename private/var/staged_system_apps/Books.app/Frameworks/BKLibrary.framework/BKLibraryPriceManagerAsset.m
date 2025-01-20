@interface BKLibraryPriceManagerAsset
- (BKLibraryPriceManagerAsset)initWithType:(int64_t)a3 storeID:(id)a4;
- (NSString)storeID;
- (int64_t)type;
@end

@implementation BKLibraryPriceManagerAsset

- (BKLibraryPriceManagerAsset)initWithType:(int64_t)a3 storeID:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BKLibraryPriceManagerAsset;
  v8 = [(BKLibraryPriceManagerAsset *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_storeID, a4);
  }

  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void).cxx_destruct
{
}

@end