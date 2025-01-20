@interface MobileAsset
- (BOOL)assetDownloaded;
- (MAAsset)asset;
- (MAAssetQuery)query;
- (MobileAsset)assetWithMaxVersion:(id)a3;
- (MobileAsset)initWithDelegate:(id)a3;
- (NSString)assetType;
- (NSString)fwBundleFileName;
- (NSString)fwVersion;
- (id)downloadAsset:(id)a3;
- (id)findAsset:(BOOL)a3 completion:(id)a4;
- (id)validateAssetAttributes:(id)a3;
- (void)downloadComplete:(int64_t)a3 completion:(id)a4;
- (void)queryComplete:(id)a3 remote:(BOOL)a4 status:(int64_t)a5 completion:(id)a6;
- (void)setAsset:(id)a3;
- (void)setAssetType:(id)a3;
- (void)setFwBundleFileName:(id)a3;
- (void)setFwVersion:(id)a3;
- (void)setQuery:(id)a3;
@end

@implementation MobileAsset

- (MobileAsset)initWithDelegate:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)MobileAsset;
    v6 = [(MobileAsset *)&v8 init];
    self = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_delegate, a3);
    }
  }

  return self;
}

- (void)setAssetType:(id)a3
{
}

- (id)findAsset:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (+[ASAsset nonUserInitiatedDownloadsAllowed]&& self->_assetType)
  {
    query = self->_query;
    if (query)
    {
      self->_query = 0;
    }
    objc_super v8 = (MAAssetQuery *)[objc_alloc((Class)MAAssetQuery) initWithType:self->_assetType];
    v9 = self->_query;
    self->_query = v8;

    v10 = self->_query;
    if (v10)
    {
      if (v4)
      {
        id v11 = objc_alloc_init((Class)MADownloadOptions);
        [v11 setDiscretionary:0];
        v12 = [(MobileAsset *)self assetType];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10000CB2C;
        v19[3] = &unk_1000244F0;
        v19[4] = self;
        BOOL v21 = v4;
        id v20 = v6;
        +[MAAsset startCatalogDownload:v12 options:v11 then:v19];

        v13 = 0;
        goto LABEL_11;
      }
      [(MAAssetQuery *)v10 returnTypes:0];
      v14 = self->_query;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000CCBC;
      v16[3] = &unk_1000244F0;
      v16[4] = self;
      char v18 = 0;
      id v17 = v6;
      [(MAAssetQuery *)v14 queryMetaData:v16];
    }
    v13 = 0;
  }
  else
  {
    v13 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:1536 userInfo:0];
    [(MobileAsset *)self queryComplete:0 remote:v4 status:5 completion:v6];
  }
  id v11 = 0;
LABEL_11:

  return v13;
}

- (id)downloadAsset:(id)a3
{
  id v4 = a3;
  switch((unint64_t)[(MAAsset *)self->_asset state])
  {
    case 1uLL:
    case 4uLL:
      id v5 = objc_alloc_init((Class)MADownloadOptions);
      [v5 setDiscretionary:0];
      [v5 setAllowsCellularAccess:0];
      [v5 setTimeoutIntervalForResource:120];
      id v6 = [(MobileAsset *)self asset];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000CE84;
      v10[3] = &unk_100024518;
      v10[4] = self;
      id v11 = v4;
      [v6 startDownload:v5 then:v10];

      break;
    case 2uLL:
      v7 = self;
      uint64_t v8 = 0;
      goto LABEL_5;
    default:
      v7 = self;
      uint64_t v8 = 3;
LABEL_5:
      [(MobileAsset *)v7 downloadComplete:v8 completion:v4];
      break;
  }

  return 0;
}

- (void)queryComplete:(id)a3 remote:(BOOL)a4 status:(int64_t)a5 completion:(id)a6
{
  id v19 = a3;
  v10 = (void (**)(id, void *))a6;
  if (a5)
  {
    v15 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:1536 userInfo:0];
    if (!v10) {
      goto LABEL_20;
    }
LABEL_19:
    v10[2](v10, v15);
    goto LABEL_20;
  }
  if (v19 && [v19 count])
  {
    if (self->_delegate
      && (objc_opt_respondsToSelector() & 1) != 0
      && ([(MobileAssetDelegate *)self->_delegate queryPredicate],
          (uint64_t v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = (void *)v11;
      v13 = [v19 filteredArrayUsingPredicate:v11];
      v14 = [(MobileAsset *)self assetWithMaxVersion:v13];
    }
    else
    {
      v14 = [(MobileAsset *)self assetWithMaxVersion:v19];
    }
    if (!v14)
    {
      v15 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:1536 userInfo:0];
      id v17 = 0;
      goto LABEL_18;
    }
    uint64_t v16 = [v14 attributes];
    id v17 = (void *)v16;
    if (v16)
    {
      NSLog(@"foundAsset attributes=%@", v16);
      uint64_t v18 = [(MobileAsset *)self validateAssetAttributes:v17];
      if (!v18)
      {
        if (a4 || [v14 state] == (id)2)
        {
          objc_storeStrong((id *)&self->_asset, v14);
          v15 = 0;
          self->_assetDownloaded = [v14 state] == (id)2;
        }
        else
        {
          v15 = 0;
        }
LABEL_18:

        if (!v10) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v18 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:1536 userInfo:0];
    }
    v15 = (void *)v18;
    goto LABEL_18;
  }
  v15 = 0;
  if (v10) {
    goto LABEL_19;
  }
LABEL_20:
}

- (MobileAsset)assetWithMaxVersion:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3
    || (long long v27 = 0u,
        long long v28 = 0u,
        long long v25 = 0u,
        long long v26 = 0u,
        (id v23 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16]) == 0))
  {
    id v6 = 0;
    goto LABEL_27;
  }
  unsigned int v24 = 0;
  unsigned int v5 = 0;
  id v6 = 0;
  id obj = v4;
  uint64_t v22 = *(void *)v26;
  do
  {
    v7 = 0;
    do
    {
      if (*(void *)v26 != v22) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v7);
      v9 = objc_msgSend(v8, "attributes", obj);
      v10 = v9;
      if (!v9)
      {
        v13 = 0;
        uint64_t v11 = 0;
LABEL_22:
        v12 = 0;
        goto LABEL_18;
      }
      uint64_t v11 = [v9 objectForKey:@"FirmwareVersionMajor"];
      if (!v11)
      {
        v13 = 0;
        goto LABEL_22;
      }
      v12 = [v10 objectForKey:@"FirmwareVersionMinor"];
      if (v12)
      {
        v13 = [v10 objectForKey:@"FirmwareVersionRelease"];
        if (v13)
        {
          unsigned int v14 = [v12 unsignedIntValue];
          unsigned int v15 = [v13 unsignedIntValue];
          unsigned int v16 = v15;
          if (v14 > v5 || (v14 == v5 ? (BOOL v17 = v15 > v24) : (BOOL v17 = 0), v17))
          {
            id v18 = v8;

            unsigned int v24 = v16;
            unsigned int v5 = v14;
            id v6 = v18;
          }
        }
      }
      else
      {
        v13 = 0;
      }
LABEL_18:

      v7 = (char *)v7 + 1;
    }
    while (v23 != v7);
    id v4 = obj;
    id v19 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    id v23 = v19;
  }
  while (v19);
LABEL_27:

  return (MobileAsset *)v6;
}

- (id)validateAssetAttributes:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:@"FirmwareBundle"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = [v5 objectForKeyedSubscript:@"FirmwareBundle"];
    fwBundleFileName = self->_fwBundleFileName;
    self->_fwBundleFileName = v7;

    v9 = [v5 objectForKeyedSubscript:@"FirmwareVersionMajor"];
    id v10 = [v9 unsignedIntValue];
    uint64_t v11 = [v5 objectForKeyedSubscript:@"FirmwareVersionMinor"];
    id v12 = [v11 unsignedIntValue];
    v13 = [v5 objectForKeyedSubscript:@"FirmwareVersionRelease"];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d.%d.%d", v10, v12, [v13 unsignedIntValue]);
    unsigned int v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    fwVersion = self->_fwVersion;
    self->_fwVersion = v14;

    unsigned int v16 = 0;
  }
  else
  {
    unsigned int v16 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:2816 userInfo:0];
  }

  return v16;
}

- (void)downloadComplete:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, int64_t))a4;
  v7 = v6;
  if (!a3)
  {
    self->_assetDownloaded = 1;
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  a3 = +[NSError errorWithDomain:@"USBCAccessoryFirmwareUpdater Domain" code:a3 << 8 userInfo:0];
  if (v7) {
LABEL_3:
  }
    v7[2](v7, a3);
LABEL_4:
}

- (MAAsset)asset
{
  return (MAAsset *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAsset:(id)a3
{
}

- (MAAssetQuery)query
{
  return (MAAssetQuery *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQuery:(id)a3
{
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)fwBundleFileName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFwBundleFileName:(id)a3
{
}

- (BOOL)assetDownloaded
{
  return self->_assetDownloaded;
}

- (NSString)fwVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFwVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_fwVersion, 0);
  objc_storeStrong((id *)&self->_fwBundleFileName, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end