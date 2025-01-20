@interface _NMSyncDefaultsAssociatedObject
- (MPMediaPlaylist)assetSyncPlaylist;
- (_NMSyncDefaultsAssociatedObject)init;
- (void)_mediaLibraryDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)setAssetSyncPlaylist:(id)a3;
@end

@implementation _NMSyncDefaultsAssociatedObject

- (_NMSyncDefaultsAssociatedObject)init
{
  v7.receiver = self;
  v7.super_class = (Class)_NMSyncDefaultsAssociatedObject;
  v2 = [(_NMSyncDefaultsAssociatedObject *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__mediaLibraryDidChangeNotification_ name:*MEMORY[0x263F11418] object:0];

    v4 = [MEMORY[0x263F11E40] defaultMediaLibrary];
    [v4 beginGeneratingLibraryChangeNotifications];

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F11E40] defaultMediaLibrary];
  [v3 endGeneratingLibraryChangeNotifications];

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)_NMSyncDefaultsAssociatedObject;
  [(_NMSyncDefaultsAssociatedObject *)&v5 dealloc];
}

- (void)_mediaLibraryDidChangeNotification:(id)a3
{
  self->_assetSyncPlaylist = 0;
  MEMORY[0x270F9A758]();
}

- (MPMediaPlaylist)assetSyncPlaylist
{
  return self->_assetSyncPlaylist;
}

- (void)setAssetSyncPlaylist:(id)a3
{
}

- (void).cxx_destruct
{
}

@end