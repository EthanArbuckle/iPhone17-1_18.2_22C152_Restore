@interface TVPlaylist
- (NSArray)mediaItems;
- (NSDictionary)userInfo;
- (int64_t)endAction;
- (int64_t)repeatMode;
- (void)addObject:(id)a3;
- (void)insertObjects:(id)a3 atIndexes:(id)a4;
- (void)removeObjectsAtIndexes:(id)a3;
- (void)setEndAction:(int64_t)a3;
- (void)setRepeatMode:(int64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation TVPlaylist

- (void)addObject:(id)a3
{
  id v4 = a3;
  v5 = [(TVPlaylist *)self mediaItems];
  v6 = (void *)[v5 mutableCopy];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF980] array];
  }
  id v11 = v8;

  [v11 addObject:v4];
  [(TVPlaylist *)self willChangeValueForKey:@"mediaItems"];
  v9 = (NSArray *)[v11 copy];
  mediaItems = self->_mediaItems;
  self->_mediaItems = v9;

  [(TVPlaylist *)self didChangeValueForKey:@"mediaItems"];
}

- (void)removeObjectsAtIndexes:(id)a3
{
  id v4 = a3;
  v5 = [(TVPlaylist *)self mediaItems];
  id v8 = (id)[v5 mutableCopy];

  [v8 removeObjectsAtIndexes:v4];
  [(TVPlaylist *)self willChangeValueForKey:@"mediaItems"];
  v6 = (NSArray *)[v8 copy];
  mediaItems = self->_mediaItems;
  self->_mediaItems = v6;

  [(TVPlaylist *)self didChangeValueForKey:@"mediaItems"];
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [(TVPlaylist *)self mediaItems];
  id v8 = (void *)[v7 mutableCopy];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v11 = v10;

  [v11 insertObjects:v14 atIndexes:v6];
  [(TVPlaylist *)self willChangeValueForKey:@"mediaItems"];
  v12 = (NSArray *)[v11 copy];
  mediaItems = self->_mediaItems;
  self->_mediaItems = v12;

  [(TVPlaylist *)self didChangeValueForKey:@"mediaItems"];
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (int64_t)endAction
{
  return self->_endAction;
}

- (void)setEndAction:(int64_t)a3
{
  self->_endAction = a3;
}

- (int64_t)repeatMode
{
  return self->_repeatMode;
}

- (void)setRepeatMode:(int64_t)a3
{
  self->_repeatMode = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
}

@end