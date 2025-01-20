@interface SUUIMediaPlayerItemStatus
- (BOOL)hideDuration;
- (NSString)itemIdentifier;
- (NSString)storeAlbumID;
- (NSString)storeID;
- (SUUIMediaPlayerItemStatus)init;
- (double)currentTime;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)itemType;
- (int64_t)playState;
- (void)setCurrentTime:(double)a3;
- (void)setDuration:(double)a3;
- (void)setHideDuration:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setItemType:(int64_t)a3;
- (void)setPlayState:(int64_t)a3;
- (void)setStoreAlbumID:(id)a3;
- (void)setStoreID:(id)a3;
@end

@implementation SUUIMediaPlayerItemStatus

- (SUUIMediaPlayerItemStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUUIMediaPlayerItemStatus;
  return [(SUUIMediaPlayerItemStatus *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 40) = self->_currentTime;
  *(double *)(v5 + 40) = self->_duration;
  uint64_t v6 = [(NSString *)self->_itemIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(void *)(v5 + 56) = self->_itemType;
  *(void *)(v5 + 64) = self->_playState;
  uint64_t v8 = [(NSString *)self->_storeID copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_storeAlbumID copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  return (id)v5;
}

- (id)description
{
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SUUIMediaPlayerItemStatus;
  v4 = [(SUUIMediaPlayerItemStatus *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@: [duration: %f  currentTime: %f state:%li storeId:%@ storeAlbumId:%@ itemIdentifier:%@]", v4, *(void *)&self->_duration, *(void *)&self->_currentTime, self->_playState, self->_storeID, self->_storeAlbumID, self->_itemIdentifier];

  return v5;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (NSString)storeAlbumID
{
  return self->_storeAlbumID;
}

- (void)setStoreAlbumID:(id)a3
{
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (BOOL)hideDuration
{
  return self->_hideDuration;
}

- (void)setHideDuration:(BOOL)a3
{
  self->_hideDuration = a3;
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(int64_t)a3
{
  self->_itemType = a3;
}

- (int64_t)playState
{
  return self->_playState;
}

- (void)setPlayState:(int64_t)a3
{
  self->_playState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeAlbumID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end