@interface BCAppIntentsAssetViewControllerInfo
- (BCAppIntentsAssetViewControllerInfo)init;
- (BCAppIntentsAssetViewControllerInfo)initWithAssetID:(id)a3 title:(id)a4 author:(id)a5 supportsTheming:(BOOL)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsTheming;
- (NSString)assetID;
- (NSString)author;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAssetID:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setSupportsTheming:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation BCAppIntentsAssetViewControllerInfo

- (BCAppIntentsAssetViewControllerInfo)init
{
  return [(BCAppIntentsAssetViewControllerInfo *)self initWithAssetID:0 title:0 author:0 supportsTheming:0];
}

- (BCAppIntentsAssetViewControllerInfo)initWithAssetID:(id)a3 title:(id)a4 author:(id)a5 supportsTheming:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)BCAppIntentsAssetViewControllerInfo;
  v13 = [(BCAppIntentsAssetViewControllerInfo *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_supportsTheming = a6;
    v15 = (NSString *)[v10 copy];
    assetID = v14->_assetID;
    v14->_assetID = v15;

    v17 = (NSString *)[v11 copy];
    title = v14->_title;
    v14->_title = v17;

    v19 = (NSString *)[v12 copy];
    author = v14->_author;
    v14->_author = v19;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  v7 = BUDynamicCast();

  if (v7)
  {
    unsigned int v8 = [(BCAppIntentsAssetViewControllerInfo *)self supportsTheming];
    if (v8 == [v7 supportsTheming])
    {
      id v10 = [(BCAppIntentsAssetViewControllerInfo *)self assetID];
      id v11 = [v7 assetID];
      if (v10 != v11)
      {
        v3 = [(BCAppIntentsAssetViewControllerInfo *)self assetID];
        v4 = [v7 assetID];
        if (![v3 isEqualToString:v4])
        {
          unsigned __int8 v9 = 0;
          goto LABEL_17;
        }
      }
      id v12 = [(BCAppIntentsAssetViewControllerInfo *)self title];
      v13 = [v7 title];
      if (v12 != v13)
      {
        v14 = [(BCAppIntentsAssetViewControllerInfo *)self title];
        v15 = [v7 title];
        if (![v14 isEqualToString:v15])
        {
          unsigned __int8 v9 = 0;
          goto LABEL_15;
        }
        v27 = v15;
        v28 = v14;
      }
      v16 = [(BCAppIntentsAssetViewControllerInfo *)self author];
      uint64_t v17 = [v7 author];
      if (v16 == (void *)v17)
      {

        unsigned __int8 v9 = 1;
      }
      else
      {
        v18 = (void *)v17;
        [(BCAppIntentsAssetViewControllerInfo *)self author];
        v19 = v26 = v3;
        [v7 author];
        v25 = v12;
        v20 = v11;
        v21 = v10;
        v23 = objc_super v22 = v4;
        unsigned __int8 v9 = [v19 isEqualToString:v23];

        v4 = v22;
        id v10 = v21;
        id v11 = v20;
        id v12 = v25;

        v3 = v26;
      }
      v15 = v27;
      v14 = v28;
      if (v12 == v13)
      {
LABEL_16:

        if (v10 == v11)
        {
LABEL_18:

          goto LABEL_19;
        }
LABEL_17:

        goto LABEL_18;
      }
LABEL_15:

      goto LABEL_16;
    }
  }
  unsigned __int8 v9 = 0;
LABEL_19:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  if (v5)
  {
    *((unsigned char *)v5 + 8) = self->_supportsTheming;
    id v7 = [(NSString *)self->_assetID copyWithZone:a3];
    unsigned int v8 = (void *)v6[2];
    v6[2] = v7;

    id v9 = [(NSString *)self->_title copyWithZone:a3];
    id v10 = (void *)v6[3];
    v6[3] = v9;

    id v11 = [(NSString *)self->_author copyWithZone:a3];
    id v12 = (void *)v6[4];
    v6[4] = v11;
  }
  return v6;
}

- (BOOL)supportsTheming
{
  return self->_supportsTheming;
}

- (void)setSupportsTheming:(BOOL)a3
{
  self->_supportsTheming = a3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_assetID, 0);
}

@end