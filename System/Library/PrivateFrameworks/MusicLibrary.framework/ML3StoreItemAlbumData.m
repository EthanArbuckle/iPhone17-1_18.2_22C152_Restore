@interface ML3StoreItemAlbumData
- (ML3StoreItemAlbumData)initWithTrackImportItem:(id)a3;
- (id)parsedStoreAlbumImportProperties;
@end

@implementation ML3StoreItemAlbumData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedStoreAlbumImportProperties, 0);

  objc_storeStrong((id *)&self->_trackItemImportProperties, 0);
}

- (id)parsedStoreAlbumImportProperties
{
  parsedStoreAlbumImportProperties = self->_parsedStoreAlbumImportProperties;
  if (!parsedStoreAlbumImportProperties)
  {
    if (self->_trackItemImportProperties)
    {
      v4 = [MEMORY[0x1E4F1CA60] dictionary];
      v5 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F09110C8];
      if (objc_opt_respondsToSelector())
      {
        v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
        [v4 setObject:v6 forKeyedSubscript:&unk_1F09110C8];
      }
      uint64_t v7 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F09110E0];
      if (_NSIsNSString()) {
        [v4 setObject:v7 forKeyedSubscript:&unk_1F09110F8];
      }
      uint64_t v8 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911110];
      if (_NSIsNSString()) {
        [v4 setObject:v8 forKeyedSubscript:&unk_1F0911128];
      }
      v31 = (void *)v7;
      v9 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911140];
      if (objc_opt_respondsToSelector())
      {
        v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "longLongValue"));
        [v4 setObject:v10 forKeyedSubscript:&unk_1F0911158];
      }
      uint64_t v11 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911170];
      if (_NSIsNSString()) {
        [v4 setObject:v11 forKeyedSubscript:&unk_1F0911188];
      }
      v29 = (void *)v11;
      v12 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F09111A0];
      if (objc_opt_respondsToSelector())
      {
        v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v12, "longLongValue"));
        [v4 setObject:v13 forKeyedSubscript:&unk_1F09111B8];
      }
      v32 = v5;
      v14 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F09111D0];
      if (objc_opt_respondsToSelector())
      {
        v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v14, "longLongValue"));
        [v4 setObject:v15 forKeyedSubscript:&unk_1F09111E8];
      }
      v28 = v14;
      v16 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911200];
      if (objc_opt_respondsToSelector())
      {
        v17 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v16, "longLongValue"));
        [v4 setObject:v17 forKeyedSubscript:&unk_1F0911218];
      }
      v30 = (void *)v8;
      v18 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911230];
      if (_NSIsNSString()) {
        [v4 setObject:v18 forKeyedSubscript:&unk_1F0911248];
      }
      v19 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911260];
      if (objc_opt_respondsToSelector())
      {
        v20 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v19, "longLongValue"));
        [v4 setObject:v20 forKeyedSubscript:&unk_1F0911278];
      }
      v21 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911290];
      if (_NSIsNSNumber()) {
        [v4 setObject:v21 forKeyedSubscript:&unk_1F0911290];
      }
      v22 = v9;
      v23 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F09112A8];
      if (_NSIsNSString()) {
        [v4 setObject:v23 forKeyedSubscript:&unk_1F09112A8];
      }
      v24 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F09112C0];
      if (_NSIsNSString()) {
        [v4 setObject:v24 forKeyedSubscript:&unk_1F09112C0];
      }
      v25 = (NSDictionary *)[v4 copy];
      v26 = self->_parsedStoreAlbumImportProperties;
      self->_parsedStoreAlbumImportProperties = v25;

      parsedStoreAlbumImportProperties = self->_parsedStoreAlbumImportProperties;
    }
    else
    {
      parsedStoreAlbumImportProperties = 0;
    }
  }

  return parsedStoreAlbumImportProperties;
}

- (ML3StoreItemAlbumData)initWithTrackImportItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemAlbumData;
  v5 = [(ML3StoreItemAlbumData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    trackItemImportProperties = v5->_trackItemImportProperties;
    v5->_trackItemImportProperties = (NSDictionary *)v6;
  }
  return v5;
}

@end