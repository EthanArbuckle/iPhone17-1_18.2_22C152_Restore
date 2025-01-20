@interface PUAlbumPickerSessionInfo
- (BOOL)isForAlbumPicker;
- (BOOL)isSelectingTargetAlbum;
- (PUAlbumPickerSessionInfo)initWithSourceAlbum:(id)a3 transferredAssets:(id)a4;
@end

@implementation PUAlbumPickerSessionInfo

- (BOOL)isForAlbumPicker
{
  return 1;
}

- (BOOL)isSelectingTargetAlbum
{
  return 1;
}

- (PUAlbumPickerSessionInfo)initWithSourceAlbum:(id)a3 transferredAssets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PUAlbumPickerSessionInfo;
  v8 = [(PUSessionInfo *)&v11 init];
  if (v8)
  {
    PLAssetCountsByType();
    v9 = PLLocalizedCountDescription();
    -[PUSessionInfo setSourceAlbum:](v8, "setSourceAlbum:", v6, 0, 0, 0, 0);
    [(PUSessionInfo *)v8 setTransferredAssets:v7];
    [(PUSessionInfo *)v8 setLocalizedPrompt:v9];
  }
  return v8;
}

@end