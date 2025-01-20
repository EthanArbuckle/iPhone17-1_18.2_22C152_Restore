@interface TVPBaseMediaItem
- (BOOL)hasTrait:(id)a3;
- (BOOL)isEqualToMediaItem:(id)a3;
- (NSString)description;
- (TVPBaseMediaItem)init;
- (id)mediaItemMetadataForProperty:(id)a3;
- (id)mediaItemURL;
- (id)reportingDelegate;
- (void)_postMetadataDidChangeNotificationWithMetadataProperties:(id)a3;
- (void)_postMetadataWillChangeNotificationWithMetadataProperties:(id)a3;
- (void)_setMetadata:(id)a3 forProperty:(id)a4 postNotification:(BOOL)a5;
- (void)performMediaItemMetadataTransactionWithBlock:(id)a3;
- (void)removeMediaItemMetadataForProperty:(id)a3;
- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4;
- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6;
@end

@implementation TVPBaseMediaItem

- (TVPBaseMediaItem)init
{
  v8.receiver = self;
  v8.super_class = (Class)TVPBaseMediaItem;
  v2 = [(TVPBaseMediaItem *)&v8 init];
  if (v2)
  {
    v3 = NSString;
    v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v4 bundleIdentifier];
    v6 = [v3 stringWithFormat:@"(%@)", v5];
    [(TVPBaseMediaItem *)v2 _setMetadata:v6 forProperty:@"TVPMediaItemMetadataServiceIdentifier" postNotification:0];
  }
  return v2;
}

- (id)mediaItemURL
{
  return 0;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  return self == a3;
}

- (BOOL)hasTrait:(id)a3
{
  return 0;
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_metadataDictionary objectForKey:a3];
}

- (void)performMediaItemMetadataTransactionWithBlock:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263EFF9A0];
  v5 = (void (**)(void))a3;
  v6 = (NSMutableDictionary *)objc_alloc_init(v4);
  transactionDictionary = self->_transactionDictionary;
  self->_transactionDictionary = v6;

  v5[2](v5);
  objc_super v8 = [(NSMutableDictionary *)self->_transactionDictionary allKeys];
  if ([v8 count])
  {
    [(TVPBaseMediaItem *)self _postMetadataWillChangeNotificationWithMetadataProperties:v8];
    v9 = self->_transactionDictionary;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__TVPBaseMediaItem_performMediaItemMetadataTransactionWithBlock___block_invoke;
    v11[3] = &unk_264CC6FD8;
    v11[4] = self;
    [(NSMutableDictionary *)v9 enumerateKeysAndObjectsUsingBlock:v11];
    [(TVPBaseMediaItem *)self _postMetadataDidChangeNotificationWithMetadataProperties:v8];
  }
  v10 = self->_transactionDictionary;
  self->_transactionDictionary = 0;
}

uint64_t __65__TVPBaseMediaItem_performMediaItemMetadataTransactionWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _setMetadata:a3 forProperty:a2 postNotification:0];
}

- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && v6)
  {
    transactionDictionary = self->_transactionDictionary;
    if (transactionDictionary) {
      [(NSMutableDictionary *)transactionDictionary setObject:v8 forKey:v6];
    }
    else {
      [(TVPBaseMediaItem *)self _setMetadata:v8 forProperty:v6 postNotification:1];
    }
  }
}

- (void)removeMediaItemMetadataForProperty:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    transactionDictionary = self->_transactionDictionary;
    id v6 = [MEMORY[0x263EFF9D0] null];
    if (transactionDictionary) {
      [(NSMutableDictionary *)transactionDictionary setObject:v6 forKey:v7];
    }
    else {
      [(TVPBaseMediaItem *)self _setMetadata:v6 forProperty:v7 postNotification:1];
    }

    id v4 = v7;
  }
}

- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6
{
  objc_msgSend(NSNumber, "numberWithDouble:", a6, a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(TVPBaseMediaItem *)self setMediaItemMetadata:v7 forProperty:@"TVPMediaItemMetadataBookmarkNetTime"];
}

- (id)reportingDelegate
{
  return 0;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TVPBaseMediaItem;
  id v4 = [(TVPBaseMediaItem *)&v8 description];
  v5 = [(TVPBaseMediaItem *)self mediaItemMetadataForProperty:@"TVPMediaItemMetadataTitle"];
  id v6 = [v3 stringWithFormat:@"%@ [%@]", v4, v5];

  return (NSString *)v6;
}

- (void)_setMetadata:(id)a3 forProperty:(id)a4 postNotification:(BOOL)a5
{
  BOOL v5 = a5;
  v17[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (!self->_metadataDictionary)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      metadataDictionary = self->_metadataDictionary;
      self->_metadataDictionary = v10;
    }
    if (v5)
    {
      v17[0] = v9;
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
      [(TVPBaseMediaItem *)self _postMetadataWillChangeNotificationWithMetadataProperties:v12];
    }
    if (v8)
    {
      id v13 = [MEMORY[0x263EFF9D0] null];

      v14 = self->_metadataDictionary;
      if (v13 != v8)
      {
        [(NSMutableDictionary *)v14 setObject:v8 forKey:v9];
        if (!v5) {
          goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
    else
    {
      v14 = self->_metadataDictionary;
    }
    [(NSMutableDictionary *)v14 removeObjectForKey:v9];
    if (v5)
    {
LABEL_12:
      id v16 = v9;
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
      [(TVPBaseMediaItem *)self _postMetadataDidChangeNotificationWithMetadataProperties:v15];
    }
  }
LABEL_13:
}

- (void)_postMetadataWillChangeNotificationWithMetadataProperties:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = @"TVPMediaItemMetadataChangesKey";
  v9[0] = a3;
  id v4 = NSDictionary;
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = [MEMORY[0x263F08A00] defaultCenter];

  [v7 postNotificationName:@"TVPMediaItemMetadataWillChangeNotification" object:self userInfo:v6];
}

- (void)_postMetadataDidChangeNotificationWithMetadataProperties:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v8 = @"TVPMediaItemMetadataChangesKey";
  v9[0] = a3;
  id v4 = NSDictionary;
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = [MEMORY[0x263F08A00] defaultCenter];

  [v7 postNotificationName:@"TVPMediaItemMetadataDidChangeNotification" object:self userInfo:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDictionary, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
}

@end