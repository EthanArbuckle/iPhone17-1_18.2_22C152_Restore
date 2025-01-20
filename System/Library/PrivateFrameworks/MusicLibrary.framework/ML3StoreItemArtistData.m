@interface ML3StoreItemArtistData
- (ML3StoreItemArtistData)initWithTrackImportItem:(id)a3;
- (NSDictionary)parsedStoreArtistItemImportProperties;
@end

@implementation ML3StoreItemArtistData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackItemImportProperties, 0);

  objc_storeStrong((id *)&self->_parsedStoreArtistImportProperties, 0);
}

- (NSDictionary)parsedStoreArtistItemImportProperties
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  parsedStoreArtistImportProperties = self->_parsedStoreArtistImportProperties;
  if (!parsedStoreArtistImportProperties)
  {
    if (self->_trackItemImportProperties)
    {
      v4 = [MEMORY[0x1E4F1CA60] dictionary];
      v5 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911368];
      if (objc_opt_respondsToSelector())
      {
        v6 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "longLongValue"));
        [v4 setObject:v6 forKeyedSubscript:&unk_1F0911368];
      }
      v7 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911380];
      if (objc_opt_respondsToSelector())
      {
        v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "longLongValue"));
        [v4 setObject:v8 forKeyedSubscript:&unk_1F0911380];
      }
      v9 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911398];
      if (objc_opt_respondsToSelector())
      {
        v10 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v9, "longLongValue"));
        [v4 setObject:v10 forKeyedSubscript:&unk_1F09113B0];
      }
      uint64_t v11 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F09113C8];
      if (_NSIsNSString()) {
        [v4 setObject:v11 forKeyedSubscript:&unk_1F09113E0];
      }
      v31 = (void *)v11;
      uint64_t v12 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F09113F8];
      if (_NSIsNSString()) {
        [v4 setObject:v12 forKeyedSubscript:&unk_1F0911410];
      }
      v30 = (void *)v12;
      v13 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911428];
      if (objc_opt_respondsToSelector())
      {
        v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "longLongValue"));
        [v4 setObject:v14 forKeyedSubscript:&unk_1F0911428];
      }
      v15 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911440];
      if (objc_opt_respondsToSelector())
      {
        v16 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v15, "longLongValue"));
        [v4 setObject:v16 forKeyedSubscript:&unk_1F0911440];
      }
      v34 = v5;
      v17 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911458];
      if (_NSIsNSString()) {
        [v4 setObject:v17 forKeyedSubscript:&unk_1F0911470];
      }
      v33 = v7;
      v18 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911488];
      if (_NSIsNSString()) {
        [v4 setObject:v18 forKeyedSubscript:&unk_1F09114A0];
      }
      v32 = v9;
      v19 = -[NSDictionary objectForKey:](self->_trackItemImportProperties, "objectForKey:", &unk_1F09114B8, v13);
      if (_NSIsNSString()) {
        [v4 setObject:v19 forKeyedSubscript:&unk_1F09114D0];
      }
      v20 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F09114E8];
      if (_NSIsNSString()) {
        [v4 setObject:v20 forKeyedSubscript:&unk_1F0911500];
      }
      v21 = [(NSDictionary *)self->_trackItemImportProperties objectForKey:&unk_1F0911518];
      if (objc_opt_respondsToSelector())
      {
        v22 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v21, "longLongValue"));
        [v4 setObject:v22 forKeyedSubscript:&unk_1F0911530];
      }
      v23 = (NSDictionary *)[v4 copy];
      v24 = self->_parsedStoreArtistImportProperties;
      self->_parsedStoreArtistImportProperties = v23;

      v25 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_parsedStoreArtistImportProperties;
        *(_DWORD *)buf = 138543362;
        v36 = v26;
        _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_DEFAULT, "parsedStoreArtistItemImportProperties=%{public}@", buf, 0xCu);
      }

      parsedStoreArtistImportProperties = self->_parsedStoreArtistImportProperties;
    }
    else
    {
      parsedStoreArtistImportProperties = 0;
    }
  }
  v27 = (void *)[(NSDictionary *)parsedStoreArtistImportProperties copy];

  return (NSDictionary *)v27;
}

- (ML3StoreItemArtistData)initWithTrackImportItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3StoreItemArtistData;
  v5 = [(ML3StoreItemArtistData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    trackItemImportProperties = v5->_trackItemImportProperties;
    v5->_trackItemImportProperties = (NSDictionary *)v6;
  }
  return v5;
}

@end