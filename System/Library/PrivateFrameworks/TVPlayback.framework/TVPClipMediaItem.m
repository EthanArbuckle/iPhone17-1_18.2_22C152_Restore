@interface TVPClipMediaItem
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)hasTrait:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSMutableDictionary)localMetadata;
- (NSSet)localMetadataKeys;
- (TVPClipMediaItem)initWithMediaItem:(id)a3 clipTimeRange:(id)a4;
- (TVPMediaItem)mediaItem;
- (TVPTimeRange)clipTimeRange;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)mediaItemMetadataForProperty:(id)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_mediaItemMetadataWillOrDidChange:(id)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)setLocalMetadata:(id)a3;
- (void)setLocalMetadataKeys:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4;
@end

@implementation TVPClipMediaItem

- (TVPClipMediaItem)initWithMediaItem:(id)a3 clipTimeRange:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TVPClipMediaItem;
  v9 = [(TVPClipMediaItem *)&v27 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaItem, a3);
    objc_storeStrong((id *)&v10->_clipTimeRange, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    localMetadata = v10->_localMetadata;
    v10->_localMetadata = v11;

    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"TVPMediaItemMetadataStartTime", @"TVPMediaItemMetadataForwardPlaybackEndTime", @"TVPMediaItemMetadataReversePlaybackEndTime", @"TVPMediaItemMetadataTitle", @"TVPMediaItemMetadataLongDescription", @"TVPMediaItemMetadataArtworkURLString", @"TVPMediaItemMetadataTomatoFreshness", @"TVPMediaItemMetadataTomatoPercentage", @"TVPMediaItemMetadataMPNowPlayingContentItem", @"TVPMediaItemMetadataDuration", 0);
    localMetadataKeys = v10->_localMetadataKeys;
    v10->_localMetadataKeys = (NSSet *)v13;

    v15 = v10->_localMetadata;
    v16 = NSNumber;
    [v8 startTime];
    v17 = objc_msgSend(v16, "numberWithDouble:");
    [(NSMutableDictionary *)v15 setObject:v17 forKey:@"TVPMediaItemMetadataStartTime"];

    v18 = v10->_localMetadata;
    v19 = NSNumber;
    [v8 endTime];
    v20 = objc_msgSend(v19, "numberWithDouble:");
    [(NSMutableDictionary *)v18 setObject:v20 forKey:@"TVPMediaItemMetadataForwardPlaybackEndTime"];

    v21 = v10->_localMetadata;
    v22 = NSNumber;
    [v8 startTime];
    v23 = objc_msgSend(v22, "numberWithDouble:");
    [(NSMutableDictionary *)v21 setObject:v23 forKey:@"TVPMediaItemMetadataReversePlaybackEndTime"];

    v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v10 selector:sel__mediaItemMetadataWillOrDidChange_ name:@"TVPMediaItemMetadataWillChangeNotification" object:v10->_mediaItem];

    v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 addObserver:v10 selector:sel__mediaItemMetadataWillOrDidChange_ name:@"TVPMediaItemMetadataDidChangeNotification" object:v10->_mediaItem];
  }
  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TVPClipMediaItem;
  [(TVPClipMediaItem *)&v4 dealloc];
}

- (BOOL)hasTrait:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"TVPMediaItemTraitIsScene"]) {
    char v5 = 1;
  }
  else {
    char v5 = [(TVPMediaItem *)self->_mediaItem hasTrait:v4];
  }

  return v5;
}

- (void)setMediaItemMetadata:(id)a3 forProperty:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7 && [(NSSet *)self->_localMetadataKeys containsObject:v7])
  {
    id v8 = [MEMORY[0x263F08A00] defaultCenter];
    id v18 = v7;
    v19 = @"TVPMediaItemMetadataChangesKey";
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
    v20[0] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [v8 postNotificationName:@"TVPMediaItemMetadataWillChangeNotification" object:self userInfo:v10];

    localMetadata = self->_localMetadata;
    if (v6) {
      [(NSMutableDictionary *)localMetadata setObject:v6 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)localMetadata removeObjectForKey:v7];
    }
    v12 = [MEMORY[0x263F08A00] defaultCenter];
    id v15 = v7;
    v16 = @"TVPMediaItemMetadataChangesKey";
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
    v17 = v13;
    v14 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [v12 postNotificationName:@"TVPMediaItemMetadataDidChangeNotification" object:self userInfo:v14];
  }
  else
  {
    [(TVPMediaItem *)self->_mediaItem setMediaItemMetadata:v6 forProperty:v7];
  }
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4 = a3;
  if (v4 && [(NSSet *)self->_localMetadataKeys containsObject:v4])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_localMetadata objectForKey:v4];
  }
  else
  {
    uint64_t v5 = [(TVPMediaItem *)self->_mediaItem mediaItemMetadataForProperty:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

- (void)_mediaItemMetadataWillOrDidChange:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A00];
  id v5 = a3;
  id v8 = [v4 defaultCenter];
  id v6 = [v5 name];
  id v7 = [v5 userInfo];

  [v8 postNotificationName:v6 object:self userInfo:v7];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector())
  {
    id v5 = self->_mediaItem;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TVPClipMediaItem;
    id v5 = [(TVPClipMediaItem *)&v7 forwardingTargetForSelector:a3];
  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [v4 selector];
  if (objc_opt_respondsToSelector())
  {
    [v4 invokeWithTarget:self->_mediaItem];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TVPClipMediaItem;
    [(TVPClipMediaItem *)&v5 forwardInvocation:v4];
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)TVPClipMediaItem;
  return [(TVPClipMediaItem *)&v6 respondsToSelector:a3];
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  if ([(TVPMediaItem *)self->_mediaItem conformsToProtocol:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TVPClipMediaItem;
    BOOL v5 = [(TVPClipMediaItem *)&v7 conformsToProtocol:v4];
  }

  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  BOOL v5 = -[TVPMediaItem methodSignatureForSelector:](self->_mediaItem, "methodSignatureForSelector:");
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)TVPClipMediaItem;
    BOOL v5 = [(TVPClipMediaItem *)&v7 methodSignatureForSelector:a3];
  }
  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  if (objc_opt_isKindOfClass()) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)TVPClipMediaItem;
  return [(TVPClipMediaItem *)&v6 isKindOfClass:a3];
}

- (TVPTimeRange)clipTimeRange
{
  return self->_clipTimeRange;
}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (void)setMediaItem:(id)a3
{
}

- (NSSet)localMetadataKeys
{
  return self->_localMetadataKeys;
}

- (void)setLocalMetadataKeys:(id)a3
{
}

- (NSMutableDictionary)localMetadata
{
  return self->_localMetadata;
}

- (void)setLocalMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localMetadata, 0);
  objc_storeStrong((id *)&self->_localMetadataKeys, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_clipTimeRange, 0);
}

@end