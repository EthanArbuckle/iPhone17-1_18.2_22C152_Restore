@interface SSVMutableMediaContentTasteItem
- (id)copyWithZone:(_NSZone *)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setPlaylistGlobalID:(id)a3;
- (void)setStoreAdamID:(int64_t)a3;
- (void)setTasteType:(unint64_t)a3;
@end

@implementation SSVMutableMediaContentTasteItem

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SSVMediaContentTasteItem *)self _copyWithMediaContentTasteItemClass:v4];
}

- (void)setContentType:(unint64_t)a3
{
  self->super._contentType = a3;
}

- (void)setPlaylistGlobalID:(id)a3
{
  if (self->super._playlistGlobalID != a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    playlistGlobalID = self->super._playlistGlobalID;
    self->super._playlistGlobalID = v4;
  }
}

- (void)setStoreAdamID:(int64_t)a3
{
  self->super._storeAdamID = a3;
}

- (void)setTasteType:(unint64_t)a3
{
  self->super._tasteType = a3;
}

@end