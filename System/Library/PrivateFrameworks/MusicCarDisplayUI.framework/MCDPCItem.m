@interface MCDPCItem
- (BOOL)currentlyPlaying;
- (BOOL)isCloudItem;
- (BOOL)isContainer;
- (BOOL)isExplicitItem;
- (BOOL)isPlayable;
- (MCDPCModel)model;
- (NSData)artworkData;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)artworkImage;
- (float)playbackProgress;
- (id)_initWithModel:(id)a3 MRContentItem:(void *)a4;
- (id)description;
- (void)setArtworkImage:(id)a3;
- (void)setCurrentlyPlaying:(BOOL)a3;
@end

@implementation MCDPCItem

- (id)_initWithModel:(id)a3 MRContentItem:(void *)a4
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MCDPCItem;
  v6 = [(MCDPCItem *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_model, v5);
    uint64_t v8 = MRContentItemGetIdentifier();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    uint64_t v10 = MRContentItemGetTitle();
    title = v7->_title;
    v7->_title = (NSString *)v10;

    uint64_t v12 = MRContentItemGetSubtitle();
    subtitle = v7->_subtitle;
    v7->_subtitle = (NSString *)v12;

    uint64_t v14 = MRContentItemGetArtworkData();
    artworkData = v7->_artworkData;
    v7->_artworkData = (NSData *)v14;

    MRContentItemGetPlaybackProgress();
    v7->_playbackProgress = v16;
    v7->_isContainer = MRContentItemGetIsContainer();
    v7->_isPlayable = MRContentItemGetIsPlayable();
    v7->_isCloudItem = MRContentItemGetIsStreamingContent();
    v7->_isExplicitItem = MRContentItemGetIsExplicitItem();
  }

  return v7;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  identifier = v2->_identifier;
  title = v2->_title;
  BOOL v8 = [(MCDPCItem *)v2 isContainer];
  BOOL v9 = [(MCDPCItem *)v2 isPlayable];
  uint64_t v10 = &stru_26F2DBB20;
  v11 = @"c";
  if (!v8) {
    v11 = &stru_26F2DBB20;
  }
  if (v9) {
    uint64_t v10 = @"p";
  }
  uint64_t v12 = [v3 stringWithFormat:@"<%@: %p - (%@) (%@) [%@%@]>", v5, v2, title, identifier, v11, v10];

  objc_sync_exit(v2);
  return v12;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSData)artworkData
{
  return self->_artworkData;
}

- (float)playbackProgress
{
  return self->_playbackProgress;
}

- (BOOL)isPlayable
{
  return self->_isPlayable;
}

- (BOOL)isContainer
{
  return self->_isContainer;
}

- (BOOL)isCloudItem
{
  return self->_isCloudItem;
}

- (BOOL)currentlyPlaying
{
  return self->_currentlyPlaying;
}

- (void)setCurrentlyPlaying:(BOOL)a3
{
  self->_currentlyPlaying = a3;
}

- (BOOL)isExplicitItem
{
  return self->_isExplicitItem;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (void)setArtworkImage:(id)a3
{
}

- (MCDPCModel)model
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_model);
  return (MCDPCModel *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_model);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_artworkData, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end