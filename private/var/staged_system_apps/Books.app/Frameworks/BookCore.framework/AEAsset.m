@interface AEAsset
- (AEAsset)initWithAssetType:(id)a3 assetID:(id)a4 url:(id)a5;
- (AEAsset)initWithAssetType:(id)a3 assetID:(id)a4 url:(id)a5 displayTitle:(id)a6;
- (NSString)assetID;
- (NSString)assetType;
- (NSString)description;
- (NSString)displayTitle;
- (NSURL)url;
@end

@implementation AEAsset

- (AEAsset)initWithAssetType:(id)a3 assetID:(id)a4 url:(id)a5
{
  return [(AEAsset *)self initWithAssetType:a3 assetID:a4 url:a5 displayTitle:0];
}

- (AEAsset)initWithAssetType:(id)a3 assetID:(id)a4 url:(id)a5 displayTitle:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AEAsset;
  v15 = [(AEAsset *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_assetType, a3);
    objc_storeStrong((id *)&v16->_assetID, a4);
    objc_storeStrong((id *)&v16->_url, a5);
    v17 = (NSString *)[v14 copy];
    displayTitle = v16->_displayTitle;
    v16->_displayTitle = v17;
  }
  return v16;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)AEAsset;
  v3 = [(AEAsset *)&v10 description];
  v4 = [(AEAsset *)self assetType];
  v5 = [(AEAsset *)self assetID];
  v6 = [(AEAsset *)self url];
  v7 = [(AEAsset *)self displayTitle];
  v8 = +[NSString stringWithFormat:@"%@, assetType=%@, assetID=%@, url=%@ displayTitle=%@", v3, v4, v5, v6, v7];

  return (NSString *)v8;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_assetID, 0);

  objc_storeStrong((id *)&self->_assetType, 0);
}

@end