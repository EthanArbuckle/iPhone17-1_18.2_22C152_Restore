@interface WBSFaviconProviderRecordCache
- (WBSFaviconProviderRecordCache)init;
- (id)dateAddedForFaviconURLString:(id)a3 iconUUID:(id *)a4 size:(CGSize *)a5;
- (id)iconInfoForURLString:(id)a3;
- (void)removeAllRecords;
- (void)removeRecordForIconUUIDs:(id)a3;
- (void)setDateAdded:(id)a3 forFaviconURLString:(id)a4 iconUUID:(id)a5 iconSize:(CGSize)a6 hasGeneratedResolutions:(BOOL)a7;
@end

@implementation WBSFaviconProviderRecordCache

- (WBSFaviconProviderRecordCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSFaviconProviderRecordCache;
  v2 = [(WBSFaviconProviderRecordCache *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    iconURLStringToInfoDictionary = v2->_iconURLStringToInfoDictionary;
    v2->_iconURLStringToInfoDictionary = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    iconUUIDToURLStringDictionary = v2->_iconUUIDToURLStringDictionary;
    v2->_iconUUIDToURLStringDictionary = (NSMutableDictionary *)v5;

    v7 = v2;
  }

  return v2;
}

- (id)iconInfoForURLString:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_iconURLStringToInfoDictionary objectForKeyedSubscript:a3];
}

- (void)setDateAdded:(id)a3 forFaviconURLString:(id)a4 iconUUID:(id)a5 iconSize:(CGSize)a6 hasGeneratedResolutions:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.height;
  double width = a6.width;
  iconUUIDToURLStringDictionary = self->_iconUUIDToURLStringDictionary;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v18 = [(NSMutableDictionary *)iconUUIDToURLStringDictionary objectForKey:v14];
  if (v18) {
    [(NSMutableDictionary *)self->_iconURLStringToInfoDictionary removeObjectForKey:v18];
  }
  [(NSMutableDictionary *)self->_iconUUIDToURLStringDictionary removeObjectForKey:v14];
  v17 = -[WBSFaviconProviderIconInfo initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:]([WBSFaviconProviderIconInfo alloc], "initWithPageURLString:iconURLString:UUIDString:dateAdded:size:hasGeneratedResolutions:isRejectedResource:", 0, v15, v14, v16, v7, 0, width, height);

  [(NSMutableDictionary *)self->_iconURLStringToInfoDictionary setObject:v17 forKeyedSubscript:v15];
  [(NSMutableDictionary *)self->_iconUUIDToURLStringDictionary setObject:v15 forKeyedSubscript:v14];
}

- (id)dateAddedForFaviconURLString:(id)a3 iconUUID:(id *)a4 size:(CGSize *)a5
{
  BOOL v7 = [(NSMutableDictionary *)self->_iconURLStringToInfoDictionary objectForKeyedSubscript:a3];
  v8 = v7;
  if (a5 && v7)
  {
    [v7 size];
    a5->double width = v9;
    a5->double height = v10;
  }
  if (a4 && v8)
  {
    *a4 = [v8 UUIDString];
  }
  v11 = [v8 dateAdded];

  return v11;
}

- (void)removeAllRecords
{
  [(NSMutableDictionary *)self->_iconURLStringToInfoDictionary removeAllObjects];
  iconUUIDToURLStringDictionary = self->_iconUUIDToURLStringDictionary;
  [(NSMutableDictionary *)iconUUIDToURLStringDictionary removeAllObjects];
}

- (void)removeRecordForIconUUIDs:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        CGFloat v10 = [(NSMutableDictionary *)self->_iconUUIDToURLStringDictionary objectForKeyedSubscript:v9];
        if (v10) {
          [(NSMutableDictionary *)self->_iconURLStringToInfoDictionary removeObjectForKey:v10];
        }
        [(NSMutableDictionary *)self->_iconUUIDToURLStringDictionary removeObjectForKey:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconUUIDToURLStringDictionary, 0);
  objc_storeStrong((id *)&self->_iconURLStringToInfoDictionary, 0);
}

@end