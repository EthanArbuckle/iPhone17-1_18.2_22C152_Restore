@interface MusicKit_SoftLinking_MPMediaLibraryAlbumAppData
- (MPMediaLibraryAlbumAppData)_underlyingAlbumAppData;
- (MusicKit_SoftLinking_MPMediaLibraryAlbumAppData)init;
- (void)setSongPopularity:(double)a3 forAdamID:(int64_t)a4;
@end

@implementation MusicKit_SoftLinking_MPMediaLibraryAlbumAppData

- (MusicKit_SoftLinking_MPMediaLibraryAlbumAppData)init
{
  v9.receiver = self;
  v9.super_class = (Class)MusicKit_SoftLinking_MPMediaLibraryAlbumAppData;
  v2 = [(MusicKit_SoftLinking_MPMediaLibraryAlbumAppData *)&v9 init];
  if (v2)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2050000000;
    v3 = (void *)getMPMediaLibraryAlbumAppDataClass_softClass;
    uint64_t v14 = getMPMediaLibraryAlbumAppDataClass_softClass;
    if (!getMPMediaLibraryAlbumAppDataClass_softClass)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __getMPMediaLibraryAlbumAppDataClass_block_invoke;
      v10[3] = &unk_1E6D453B0;
      v10[4] = &v11;
      __getMPMediaLibraryAlbumAppDataClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = v3;
    _Block_object_dispose(&v11, 8);
    v5 = (MPMediaLibraryAlbumAppData *)objc_alloc_init(v4);
    underlyingAlbumAppData = v2->_underlyingAlbumAppData;
    v2->_underlyingAlbumAppData = v5;

    id v7 = (id)[(MPMediaLibraryAlbumAppData *)v2->_underlyingAlbumAppData createAppDataDictionary];
  }
  return v2;
}

- (MPMediaLibraryAlbumAppData)_underlyingAlbumAppData
{
  return self->_underlyingAlbumAppData;
}

- (void)setSongPopularity:(double)a3 forAdamID:(int64_t)a4
{
  underlyingAlbumAppData = self->_underlyingAlbumAppData;
  id v6 = [NSNumber numberWithDouble:a3];
  [(MPMediaLibraryAlbumAppData *)underlyingAlbumAppData setSongPopularity:v6 forAdamID:a4];
}

- (void).cxx_destruct
{
}

@end