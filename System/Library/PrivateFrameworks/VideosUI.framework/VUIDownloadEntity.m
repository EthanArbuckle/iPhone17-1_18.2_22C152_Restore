@interface VUIDownloadEntity
- (BOOL)isEqual:(id)a3;
- (NSArray)mediaEntities;
- (NSMutableArray)assetControllers;
- (NSNumber)duration;
- (NSNumber)episodeNumber;
- (NSNumber)fractionalEpisodeNumber;
- (NSNumber)numberOfMediaItems;
- (NSNumber)numberOfMediaItemsDownloading;
- (NSNumber)releaseYear;
- (NSString)title;
- (VUIDownloadEntity)initWithMediaEntities:(id)a3 withDownloadType:(int64_t)a4;
- (VUIDownloadEntity)initWithMediaEntity:(id)a3 withDownloadType:(int64_t)a4;
- (VUIDownloadEntityDelegate)delegate;
- (VUIMediaEntityIdentifier)identifier;
- (VUIMediaEntityIdentifier)showIdentifier;
- (int64_t)downloadType;
- (unint64_t)hash;
- (void)_assetControllerStateDidChange:(id)a3;
- (void)_configureWithMediaEntities:(id)a3;
- (void)_removeDeletedMediaItemInShowPageIfNeeded;
- (void)setAssetControllers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadType:(int64_t)a3;
- (void)setDuration:(id)a3;
- (void)setEpisodeNumber:(id)a3;
- (void)setFractionalEpisodeNumber:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMediaEntities:(id)a3;
- (void)setNumberOfMediaItems:(id)a3;
- (void)setNumberOfMediaItemsDownloading:(id)a3;
- (void)setReleaseYear:(id)a3;
- (void)setShowIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VUIDownloadEntity

- (VUIDownloadEntity)initWithMediaEntity:(id)a3 withDownloadType:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  v8 = [v6 arrayWithObjects:&v11 count:1];

  v9 = -[VUIDownloadEntity initWithMediaEntities:withDownloadType:](self, "initWithMediaEntities:withDownloadType:", v8, a4, v11, v12);
  return v9;
}

- (VUIDownloadEntity)initWithMediaEntities:(id)a3 withDownloadType:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIDownloadEntity;
  id v7 = [(VUIDownloadEntity *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_downloadType = a4;
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    assetControllers = v8->_assetControllers;
    v8->_assetControllers = v9;

    [(VUIDownloadEntity *)v8 _configureWithMediaEntities:v6];
  }

  return v8;
}

- (NSNumber)numberOfMediaItemsDownloading
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = self->_mediaEntities;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v4)
  {
    uint64_t v6 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v3);
      }
      v9 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "assetController", (void)v17);
      v10 = [v9 state];
      if ([v10 status] == 2)
      {
      }
      else
      {
        id v11 = [v9 state];
        uint64_t v12 = [v11 status];

        if (v12 != 1) {
          goto LABEL_10;
        }
      }
      uint64_t v6 = (v6 + 1);
LABEL_10:
    }
    uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v5);
LABEL_14:

  v13 = [MEMORY[0x1E4F28ED0] numberWithInt:v6];
  numberOfMediaItemsDownloading = self->_numberOfMediaItemsDownloading;
  self->_numberOfMediaItemsDownloading = v13;

  v15 = self->_numberOfMediaItemsDownloading;
  return v15;
}

- (void)setMediaEntities:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VUIDownloadEntity *)self mediaEntities];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [v4 count];
  [(VUIDownloadEntity *)self _configureWithMediaEntities:v4];

  if (v6 != v7)
  {
    id v8 = [(VUIDownloadEntity *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 downloadEntity:self numberOfItemsDidChange:v7];
    }
  }
}

- (VUIMediaEntityIdentifier)identifier
{
  identifier = self->_identifier;
  if (!identifier)
  {
    if ([(VUIDownloadEntity *)self downloadType])
    {
      id v4 = [(VUIDownloadEntity *)self showIdentifier];
      uint64_t v5 = self->_identifier;
      self->_identifier = v4;
    }
    else
    {
      uint64_t v6 = [(VUIDownloadEntity *)self mediaEntities];
      uint64_t v5 = [v6 firstObject];

      uint64_t v7 = [v5 identifier];
      id v8 = self->_identifier;
      self->_identifier = v7;
    }
    identifier = self->_identifier;
  }
  v9 = identifier;
  return v9;
}

- (VUIMediaEntityIdentifier)showIdentifier
{
  showIdentifier = self->_showIdentifier;
  if (showIdentifier) {
    goto LABEL_5;
  }
  if ([(VUIDownloadEntity *)self downloadType] == 1
    || [(VUIDownloadEntity *)self downloadType] == 2)
  {
    id v4 = [(VUIDownloadEntity *)self mediaEntities];
    uint64_t v5 = [v4 firstObject];

    uint64_t v6 = [v5 showIdentifier];
    uint64_t v7 = self->_showIdentifier;
    self->_showIdentifier = v6;

    showIdentifier = self->_showIdentifier;
LABEL_5:
    id v8 = showIdentifier;
    goto LABEL_6;
  }
  id v8 = 0;
LABEL_6:
  return v8;
}

- (void)_configureWithMediaEntities:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:@"VUIMediaEntityAssetControllerStateDidChangeNotification" object:0];

  if ([(NSMutableArray *)self->_assetControllers count]) {
    [(NSMutableArray *)self->_assetControllers removeAllObjects];
  }
  objc_storeStrong((id *)&self->_mediaEntities, a3);
  uint64_t v7 = [v5 firstObject];
  id v8 = v7;
  switch(self->_downloadType)
  {
    case 0:
      v9 = [v7 title];
      [(VUIDownloadEntity *)self setTitle:v9];

      [(VUIDownloadEntity *)self setDownloadType:0];
      v10 = [v8 releaseYear];
      [(VUIDownloadEntity *)self setReleaseYear:v10];

      id v11 = [v8 duration];
      [(VUIDownloadEntity *)self setDuration:v11];

      goto LABEL_9;
    case 1:
      uint64_t v12 = [v7 showTitle];
      [(VUIDownloadEntity *)self setTitle:v12];

      [(VUIDownloadEntity *)self setDownloadType:1];
      goto LABEL_9;
    case 2:
      uint64_t v13 = [v7 showTitle];
      goto LABEL_8;
    case 3:
      uint64_t v13 = [v7 title];
LABEL_8:
      v14 = (void *)v13;
      [(VUIDownloadEntity *)self setTitle:v13];

      id v15 = v8;
      v16 = [v15 episodeNumber];
      [(VUIDownloadEntity *)self setEpisodeNumber:v16];

      long long v17 = [v15 fractionalEpisodeNumber];
      [(VUIDownloadEntity *)self setFractionalEpisodeNumber:v17];

      long long v18 = [v15 duration];

      [(VUIDownloadEntity *)self setDuration:v18];
LABEL_9:
      long long v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      [(VUIDownloadEntity *)self setNumberOfMediaItems:v19];

      break;
    default:
      break;
  }
  if ([(VUIDownloadEntity *)self downloadType] == 2
    || [(VUIDownloadEntity *)self downloadType] == 1)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v20 = [(VUIDownloadEntity *)self mediaEntities];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v29 + 1) + 8 * v24) assetController];
          if (v25)
          {
            [(NSMutableArray *)self->_assetControllers addObject:v25];
            v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
            [v26 addObserver:self selector:sel__assetControllerStateDidChange_ name:@"VUIMediaEntityAssetControllerStateDidChangeNotification" object:v25];
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v22);
    }

    id v8 = v27;
    id v5 = v28;
  }
}

- (void)_removeDeletedMediaItemInShowPageIfNeeded
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(VUIDownloadEntity *)self downloadType] == 1
    || [(VUIDownloadEntity *)self downloadType] == 2)
  {
    v3 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v15 = self;
    id v4 = self->_mediaEntities;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (!v5) {
      goto LABEL_16;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v10 = [v9 assetController];
        id v11 = [v10 state];
        uint64_t v12 = [v11 status];

        if (v12)
        {
LABEL_9:
          [v3 addObject:v9];
          goto LABEL_14;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v9;
          if ([v13 markedAsDeleted])
          {
          }
          else
          {
            v14 = [v13 downloadExpirationDate];

            if (v14) {
              goto LABEL_9;
            }
          }
        }
LABEL_14:
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (!v6)
      {
LABEL_16:

        [(VUIDownloadEntity *)v15 setMediaEntities:v3];
        return;
      }
    }
  }
}

- (void)_assetControllerStateDidChange:(id)a3
{
  id v8 = [a3 object];
  id v4 = [v8 state];
  uint64_t v5 = [v4 status];

  if (!v5) {
    [(VUIDownloadEntity *)self _removeDeletedMediaItemInShowPageIfNeeded];
  }
  uint64_t v6 = [(VUIDownloadEntity *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [(VUIDownloadEntity *)self numberOfMediaItemsDownloading];
    if (![v7 intValue]) {
      [(VUIDownloadEntity *)self setDownloadType:1];
    }
    [v6 downloadEntity:self numberOfItemsDownloadingDidChange:v7];
  }
}

- (unint64_t)hash
{
  int64_t v3 = [(VUIDownloadEntity *)self downloadType];
  id v4 = [(VUIDownloadEntity *)self identifier];
  uint64_t v5 = v3 ^ (2 * [v4 hash]);

  uint64_t v6 = [(VUIDownloadEntity *)self mediaEntities];
  unint64_t v7 = v5 ^ (8 * [v6 count]);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIDownloadEntity *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    int64_t v7 = [(VUIDownloadEntity *)self downloadType];
    if (v7 == [(VUIDownloadEntity *)v6 downloadType]
      && ([(VUIDownloadEntity *)self identifier],
          id v8 = objc_claimAutoreleasedReturnValue(),
          [(VUIDownloadEntity *)v6 identifier],
          v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v8 isEqual:v9],
          v9,
          v8,
          v10))
    {
      id v11 = [(VUIDownloadEntity *)self mediaEntities];
      uint64_t v12 = [v11 count];
      id v13 = [(VUIDownloadEntity *)v6 mediaEntities];
      BOOL v14 = v12 == [v13 count];
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (VUIDownloadEntityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIDownloadEntityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)downloadType
{
  return self->_downloadType;
}

- (void)setDownloadType:(int64_t)a3
{
  self->_downloadType = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setShowIdentifier:(id)a3
{
}

- (NSArray)mediaEntities
{
  return self->_mediaEntities;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSNumber)releaseYear
{
  return self->_releaseYear;
}

- (void)setReleaseYear:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (void)setEpisodeNumber:(id)a3
{
}

- (NSNumber)fractionalEpisodeNumber
{
  return self->_fractionalEpisodeNumber;
}

- (void)setFractionalEpisodeNumber:(id)a3
{
}

- (NSNumber)numberOfMediaItems
{
  return self->_numberOfMediaItems;
}

- (void)setNumberOfMediaItems:(id)a3
{
}

- (void)setNumberOfMediaItemsDownloading:(id)a3
{
}

- (NSMutableArray)assetControllers
{
  return self->_assetControllers;
}

- (void)setAssetControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetControllers, 0);
  objc_storeStrong((id *)&self->_numberOfMediaItemsDownloading, 0);
  objc_storeStrong((id *)&self->_numberOfMediaItems, 0);
  objc_storeStrong((id *)&self->_fractionalEpisodeNumber, 0);
  objc_storeStrong((id *)&self->_episodeNumber, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_releaseYear, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mediaEntities, 0);
  objc_storeStrong((id *)&self->_showIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end