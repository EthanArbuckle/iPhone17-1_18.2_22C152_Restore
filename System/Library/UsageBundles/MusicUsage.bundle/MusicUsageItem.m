@interface MusicUsageItem
+ (MusicUsageItem)usageItemWithItemCollection:(id)a3 displayNameBlock:(id)a4;
- (BOOL)artworkWantsCircleTreatment;
- (BOOL)isEqual:(id)a3;
- (MPMediaItemCollection)itemCollection;
- (MusicUsageGroup)childUsageGroup;
- (MusicUsageGroup)usageGroup;
- (NSString)specifierIdentifier;
- (id)artworkCatalog;
- (id)artworkCatalogBlock;
- (id)subtitles;
- (id)subtitlesBlock;
- (id)title;
- (id)titleBlock;
- (unint64_t)hash;
- (void)setArtworkCatalogBlock:(id)a3;
- (void)setArtworkWantsCircleTreatment:(BOOL)a3;
- (void)setChildUsageGroup:(id)a3;
- (void)setItemCollection:(id)a3;
- (void)setSpecifierIdentifier:(id)a3;
- (void)setSubtitlesBlock:(id)a3;
- (void)setTitleBlock:(id)a3;
- (void)setUsageGroup:(id)a3;
@end

@implementation MusicUsageItem

+ (MusicUsageItem)usageItemWithItemCollection:(id)a3 displayNameBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(MusicUsageItem);
  [(MusicUsageItem *)v7 setItemCollection:v6];

  [(MusicUsageItem *)v7 setTitleBlock:v5];

  return v7;
}

- (id)title
{
  v3 = [(MusicUsageItem *)self titleBlock];

  if (v3)
  {
    v4 = [(MusicUsageItem *)self titleBlock];
    id v5 = [(MusicUsageItem *)self itemCollection];
    ((void (**)(void, void *))v4)[2](v4, v5);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = @"FORGOT_DISPLAY_NAME_BLOCK!";
  }

  return v6;
}

- (id)subtitles
{
  v3 = [(MusicUsageItem *)self subtitlesBlock];

  if (v3)
  {
    v4 = [(MusicUsageItem *)self subtitlesBlock];
    id v5 = [(MusicUsageItem *)self itemCollection];
    id v6 = ((void (**)(void, void *))v4)[2](v4, v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)artworkCatalog
{
  v3 = [(MusicUsageItem *)self artworkCatalogBlock];

  if (v3)
  {
    v4 = [(MusicUsageItem *)self artworkCatalogBlock];
    id v5 = [(MusicUsageItem *)self itemCollection];
    id v6 = ((void (**)(void, void *))v4)[2](v4, v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(MusicUsageItem *)self itemCollection];
    v7 = [v5 itemCollection];

    unsigned __int8 v8 = [v6 isEqual:v7];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(MusicUsageItem *)self itemCollection];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSString)specifierIdentifier
{
  return self->_specifierIdentifier;
}

- (void)setSpecifierIdentifier:(id)a3
{
}

- (MPMediaItemCollection)itemCollection
{
  return self->_itemCollection;
}

- (void)setItemCollection:(id)a3
{
}

- (id)titleBlock
{
  return self->_titleBlock;
}

- (void)setTitleBlock:(id)a3
{
}

- (id)subtitlesBlock
{
  return self->_subtitlesBlock;
}

- (void)setSubtitlesBlock:(id)a3
{
}

- (id)artworkCatalogBlock
{
  return self->_artworkCatalogBlock;
}

- (void)setArtworkCatalogBlock:(id)a3
{
}

- (BOOL)artworkWantsCircleTreatment
{
  return self->_artworkWantsCircleTreatment;
}

- (void)setArtworkWantsCircleTreatment:(BOOL)a3
{
  self->_artworkWantsCircleTreatment = a3;
}

- (MusicUsageGroup)childUsageGroup
{
  return self->_childUsageGroup;
}

- (void)setChildUsageGroup:(id)a3
{
}

- (MusicUsageGroup)usageGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_usageGroup);

  return (MusicUsageGroup *)WeakRetained;
}

- (void)setUsageGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_usageGroup);
  objc_storeStrong((id *)&self->_childUsageGroup, 0);
  objc_storeStrong(&self->_artworkCatalogBlock, 0);
  objc_storeStrong(&self->_subtitlesBlock, 0);
  objc_storeStrong(&self->_titleBlock, 0);
  objc_storeStrong((id *)&self->_itemCollection, 0);

  objc_storeStrong((id *)&self->_specifierIdentifier, 0);
}

@end