@interface VUILibraryMediaItem_iOS
+ (void)initialize;
- (BOOL)_supportsBookmarks;
- (BOOL)bookmarkDisabled;
- (BOOL)hasTrait:(id)a3;
- (BOOL)isEqualToMediaItem:(id)a3;
- (ML3Track)ml3Track;
- (MPMediaItem)mpMediaItem;
- (MPMediaLibrary)mpMediaLibrary;
- (NSURL)mediaItemURLInternal;
- (TVImageLoader)imageLoader;
- (VUILibraryMediaItem_iOS)initWithMPMediaItem:(id)a3;
- (VUIPlaybackPositionInfo)playbackPositionInfo;
- (id)_localPlaybackFilePathURL;
- (id)mediaItemMetadataForProperty:(id)a3;
- (id)mediaItemURL;
- (int64_t)persistentID;
- (void)_schedulePlaybackPositionInfoPersistence;
- (void)cleanUpMediaItem;
- (void)prepareForLoadingWithCompletion:(id)a3;
- (void)setBookmarkDisabled:(BOOL)a3;
- (void)setMediaItemURLInternal:(id)a3;
- (void)setMl3Track:(id)a3;
- (void)setMpMediaItem:(id)a3;
- (void)setPersistentID:(int64_t)a3;
- (void)setPlaybackPositionInfo:(id)a3;
- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6;
- (void)updatePlayCountForElapsedTime:(double)a3 duration:(double)a4;
@end

@implementation VUILibraryMediaItem_iOS

+ (void)initialize
{
  if (initialize_onceToken_9 != -1) {
    dispatch_once(&initialize_onceToken_9, &__block_literal_global_107);
  }
}

- (VUILibraryMediaItem_iOS)initWithMPMediaItem:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUILibraryMediaItem_iOS;
  v6 = [(TVPBaseMediaItem *)&v13 init];
  if (v6)
  {
    if (v5)
    {
      v6->_persistentID = [v5 persistentID];
      objc_storeStrong((id *)&v6->_mpMediaItem, a3);
      v7 = [v5 mediaLibrary];
      if (objc_opt_respondsToSelector())
      {
        v8 = [v7 ml3Library];
      }
      else
      {
        v8 = 0;
      }
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F79B50]) initWithPersistentID:v6->_persistentID inLibrary:v8];
      ml3Track = v6->_ml3Track;
      v6->_ml3Track = (ML3Track *)v10;
    }
    else
    {
      v9 = (void *)sLogObject_17;
      if (os_log_type_enabled((os_log_t)sLogObject_17, OS_LOG_TYPE_ERROR)) {
        -[VUILibraryMediaItem_iOS initWithMPMediaItem:](v9);
      }
    }
  }

  return v6;
}

- (TVImageLoader)imageLoader
{
  v2 = +[VUIMediaLibraryManager defaultManager];
  v3 = [v2 deviceMediaLibrary];

  return (TVImageLoader *)v3;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  v4 = (VUILibraryMediaItem_iOS *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  if (self == v4)
  {
LABEL_7:
    char v7 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:
    char v7 = 0;
    goto LABEL_14;
  }
  uint64_t v6 = [(VUILibraryMediaItem_iOS *)v5 persistentID];
  if ([(VUILibraryMediaItem_iOS *)self persistentID]
    && v6
    && [(VUILibraryMediaItem_iOS *)self persistentID] == v6)
  {
    goto LABEL_7;
  }
  uint64_t v8 = *MEMORY[0x1E4FAA0D8];
  v9 = [(VUILibraryMediaItem_iOS *)self mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  uint64_t v10 = [(VUILibraryMediaItem_iOS *)v5 mediaItemMetadataForProperty:v8];
  if ([v9 length] && objc_msgSend(v10, "length")) {
    char v7 = [v9 isEqualToString:v10];
  }
  else {
    char v7 = 0;
  }

LABEL_14:
  return v7;
}

- (id)mediaItemURL
{
  v3 = [(VUILibraryMediaItem_iOS *)self mediaItemURLInternal];

  if (!v3)
  {
    v4 = [(VUILibraryMediaItem_iOS *)self _localPlaybackFilePathURL];
    [(VUILibraryMediaItem_iOS *)self setMediaItemURLInternal:v4];
  }
  return [(VUILibraryMediaItem_iOS *)self mediaItemURLInternal];
}

- (BOOL)hasTrait:(id)a3
{
  id v4 = a3;
  if (![v4 isEqualToString:*MEMORY[0x1E4FAA1B8]])
  {
    if (([v4 isEqualToString:*MEMORY[0x1E4FAA1C0]] & 1) != 0
      || ([v4 isEqualToString:*MEMORY[0x1E4FAA1A8]] & 1) != 0)
    {
      char v6 = 1;
      goto LABEL_12;
    }
    if ([v4 isEqualToString:*MEMORY[0x1E4FAA178]])
    {
      char v7 = [(VUILibraryMediaItem_iOS *)self ml3Track];
      uint64_t v8 = v7;
      v9 = (void *)MEMORY[0x1E4F796E8];
    }
    else
    {
      if (![v4 isEqualToString:*MEMORY[0x1E4FAA168]])
      {
        if ([v4 isEqualToString:*MEMORY[0x1E4FAA188]])
        {
          v12 = [(VUILibraryMediaItem_iOS *)self _localPlaybackFilePathURL];
          char v6 = v12 != 0;

          goto LABEL_12;
        }
        v13.receiver = self;
        v13.super_class = (Class)VUILibraryMediaItem_iOS;
        unsigned __int8 v5 = [(TVPBaseMediaItem *)&v13 hasTrait:v4];
        goto LABEL_3;
      }
      char v7 = [(VUILibraryMediaItem_iOS *)self ml3Track];
      uint64_t v8 = v7;
      v9 = (void *)MEMORY[0x1E4F79678];
    }
    uint64_t v10 = [v7 valueForProperty:*v9];
    char v6 = [v10 BOOLValue];

    goto LABEL_12;
  }
  unsigned __int8 v5 = [(VUILibraryMediaItem_iOS *)self _supportsBookmarks];
LABEL_3:
  char v6 = v5;
LABEL_12:

  return v6;
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4FAA0E8];
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA0E8]])
  {
    char v6 = [(VUILibraryMediaItem_iOS *)self ml3Track];

    if (v6)
    {
      char v7 = [(VUILibraryMediaItem_iOS *)self ml3Track];
      id v8 = [v7 valueForProperty:*MEMORY[0x1E4F799F0]];
LABEL_47:
      v31 = v8;
LABEL_48:

      goto LABEL_49;
    }
    v68 = self;
    v69 = VUILibraryMediaItem_iOS;
    objc_super v13 = &v68;
    goto LABEL_23;
  }
  uint64_t v5 = *MEMORY[0x1E4FA9FB0];
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9FB0]])
  {
    v9 = [(VUILibraryMediaItem_iOS *)self ml3Track];

    if (!v9)
    {
      v65.receiver = self;
      v65.super_class = (Class)VUILibraryMediaItem_iOS;
      objc_super v13 = (VUILibraryMediaItem_iOS **)&v65;
      goto LABEL_23;
    }
    uint64_t v10 = [(VUILibraryMediaItem_iOS *)self ml3Track];
    v11 = [v10 valueForProperty:*MEMORY[0x1E4F797A8]];
    __int16 v12 = [v11 unsignedIntValue];

    if ((v12 & 0x200) != 0)
    {
      v24 = (id *)MEMORY[0x1E4FAA200];
    }
    else if ((v12 & 0x2000) != 0)
    {
      v24 = (id *)MEMORY[0x1E4FAA1E0];
    }
    else
    {
      if ((v12 & 0x800) == 0)
      {
        v66 = self;
        v67 = VUILibraryMediaItem_iOS;
        objc_super v13 = &v66;
LABEL_23:
        objc_msgSendSuper2((objc_super *)v13, sel_mediaItemMetadataForProperty_, v5, v56.receiver, v56.super_class, v57, v58, v59, v60, v61, v62, v63, v64, v65.receiver, v65.super_class, v66, v67, v68, v69);
LABEL_24:
        id v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_37:
        v31 = v23;
        goto LABEL_49;
      }
      v39 = [(VUILibraryMediaItem_iOS *)self ml3Track];
      v40 = [v39 valueForProperty:*MEMORY[0x1E4F79758]];
      int v41 = [v40 BOOLValue];

      if (v41) {
        v24 = (id *)MEMORY[0x1E4FAA1F8];
      }
      else {
        v24 = (id *)MEMORY[0x1E4FAA1E8];
      }
    }
LABEL_36:
    id v23 = *v24;
    goto LABEL_37;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA090]])
  {
    uint64_t v14 = [(VUILibraryMediaItem_iOS *)self mediaItemMetadataForProperty:v5];
    char v7 = (void *)v14;
    if (v14 == *MEMORY[0x1E4FAA1E8] || v14 == *MEMORY[0x1E4FAA1F8])
    {
      v16 = (void **)MEMORY[0x1E4F18A68];
    }
    else
    {
      if (v14 != *MEMORY[0x1E4FAA200])
      {
        if (v14 == *MEMORY[0x1E4FAA1E0]) {
          v25 = (void *)*MEMORY[0x1E4F18A60];
        }
        else {
          v25 = 0;
        }
        goto LABEL_46;
      }
      v16 = (void **)MEMORY[0x1E4F18A78];
    }
    v25 = *v16;
LABEL_46:
    id v8 = v25;
    goto LABEL_47;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9DF8]])
  {
    uint64_t v17 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
    if (v17)
    {
      v18 = (void *)v17;
      v19 = [(VUILibraryMediaItem_iOS *)self imageLoader];

      if (v19)
      {
        v20 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
        v21 = v20;
        uint64_t v22 = 0;
LABEL_34:
        v29 = objc_msgSend(v20, "vui_imageLoadParamsWithImageType:", v22);

        v30 = (objc_class *)MEMORY[0x1E4FA9CA0];
LABEL_43:
        id v36 = [v30 alloc];
        v37 = [(VUILibraryMediaItem_iOS *)self imageLoader];
        v31 = (void *)[v36 initWithObject:v29 imageLoader:v37 groupType:0];

        goto LABEL_49;
      }
    }
    goto LABEL_73;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9DF0]])
  {
    uint64_t v26 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
    if (v26)
    {
      v27 = (void *)v26;
      v28 = [(VUILibraryMediaItem_iOS *)self imageLoader];

      if (v28)
      {
        v20 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
        v21 = v20;
        uint64_t v22 = 1;
        goto LABEL_34;
      }
    }
    goto LABEL_73;
  }
  if (([v4 isEqualToString:@"VUIMediaItemMetadataArtworkEpisodePreviewVUIImageProxy"] & 1) != 0
    || [v4 isEqualToString:@"VUIMediaItemMetadataPostPlayVUIImageProxy"])
  {
    uint64_t v32 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
    if (v32)
    {
      v33 = (void *)v32;
      v34 = [(VUILibraryMediaItem_iOS *)self imageLoader];

      if (v34)
      {
        v35 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
        v29 = objc_msgSend(v35, "vui_imageLoadParamsWithImageType:", 1);

        v30 = (objc_class *)MEMORY[0x1E4FB3CD0];
        goto LABEL_43;
      }
    }
    goto LABEL_73;
  }
  uint64_t v5 = *MEMORY[0x1E4FA9EC0];
  if ([v4 isEqualToString:*MEMORY[0x1E4FA9EC0]])
  {
    v42 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];

    if (!v42)
    {
      v63 = self;
      v64 = VUILibraryMediaItem_iOS;
      objc_super v13 = &v63;
      goto LABEL_23;
    }
    v43 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
    v44 = v43;
    v45 = (void *)MEMORY[0x1E4F31358];
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4FAA060];
    if (![v4 isEqualToString:*MEMORY[0x1E4FAA060]])
    {
      uint64_t v5 = *MEMORY[0x1E4FA9E60];
      if ([v4 isEqualToString:*MEMORY[0x1E4FA9E60]])
      {
        v48 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];

        if (v48)
        {
          v49 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
          char v7 = [v49 valueForProperty:*MEMORY[0x1E4F31338]];

          v50 = objc_msgSend(v7, "vui_stringForKey:", @"ratingLevel");
          v51 = v50;
          if (v50)
          {
            v31 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v50, "integerValue"));
          }
          else
          {
            v31 = 0;
          }

          goto LABEL_48;
        }
        v59 = self;
        v60 = VUILibraryMediaItem_iOS;
        objc_super v13 = &v59;
        goto LABEL_23;
      }
      uint64_t v5 = *MEMORY[0x1E4FA9E48];
      if (![v4 isEqualToString:*MEMORY[0x1E4FA9E48]])
      {
        -[VUIBaseMediaItem mediaItemMetadataForProperty:](&v56, sel_mediaItemMetadataForProperty_, v4, self, VUILibraryMediaItem_iOS, v57, v58, v59, v60, v61, v62, v63, v64, v65.receiver, v65.super_class, v66, v67, v68, v69);
        goto LABEL_24;
      }
      v52 = [(VUILibraryMediaItem_iOS *)self ml3Track];

      if (!v52)
      {
        v57 = self;
        v58 = VUILibraryMediaItem_iOS;
        objc_super v13 = &v57;
        goto LABEL_23;
      }
      v53 = [(VUILibraryMediaItem_iOS *)self ml3Track];
      v54 = [v53 valueForProperty:*MEMORY[0x1E4F797A8]];
      __int16 v55 = [v54 unsignedIntValue];

      if ((v55 & 0x200) != 0)
      {
        v24 = (id *)MEMORY[0x1E4FA9E58];
        goto LABEL_36;
      }
      if ((v55 & 0x800) != 0)
      {
        v24 = (id *)MEMORY[0x1E4FA9E50];
        goto LABEL_36;
      }
LABEL_73:
      v31 = 0;
      goto LABEL_49;
    }
    v46 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];

    if (!v46)
    {
      v61 = self;
      v62 = VUILibraryMediaItem_iOS;
      objc_super v13 = &v61;
      goto LABEL_23;
    }
    v43 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
    v44 = v43;
    v45 = (void *)MEMORY[0x1E4F314A0];
  }
  v31 = [v43 valueForProperty:*v45];

  if (v31) {
    id v47 = v31;
  }

LABEL_49:
  return v31;
}

- (void)prepareForLoadingWithCompletion:(id)a3
{
  uint64_t v17 = (void (**)(id, uint64_t, void))a3;
  id v4 = [(VUILibraryMediaItem_iOS *)self ml3Track];
  uint64_t v5 = [v4 valueForProperty:*MEMORY[0x1E4F79490]];

  if (objc_opt_respondsToSelector())
  {
    [v5 doubleValue];
    double v7 = v6 / 1000.0;
    if (v6 / 1000.0 > 0.0)
    {
      id v8 = [(VUILibraryMediaItem_iOS *)self ml3Track];
      v9 = [v8 valueForProperty:*MEMORY[0x1E4F798F8]];

      if (v9 && ([v9 doubleValue], v10 > 0.0))
      {
        v11 = (void *)MEMORY[0x1E4F1C9C8];
        [v9 doubleValue];
        __int16 v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
      }
      else
      {
        __int16 v12 = 0;
      }
      objc_super v13 = [VUIMediaStartTimeInfo alloc];
      uint64_t v14 = [MEMORY[0x1E4F28ED0] numberWithDouble:v7];
      v15 = [(VUIMediaStartTimeInfo *)v13 initWithStartTime:v14 timestamp:v12 type:0 source:@"Media Library"];

      v16 = [(VUIBaseMediaItem *)self startTimeCollection];
      [v16 addStartTimeInfo:v15];
    }
  }
  if (v17) {
    v17[2](v17, 1, 0);
  }
}

- (void)updateBookmarkWithSuggestedTime:(double)a3 forElapsedTime:(double)a4 duration:(double)a5 playbackOfMediaItemIsEnding:(BOOL)a6
{
  v11 = [(VUILibraryMediaItem_iOS *)self playbackPositionInfo];
  if (!v11)
  {
    v11 = objc_alloc_init(VUIPlaybackPositionInfo);
    [(VUILibraryMediaItem_iOS *)self _schedulePlaybackPositionInfoPersistence];
  }
  id v8 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [(VUIPlaybackPositionInfo *)v11 setBookmarkTime:v8];

  [(VUILibraryMediaItem_iOS *)self setPlaybackPositionInfo:v11];
  v9 = [(VUILibraryMediaItem_iOS *)self mpMediaItem];
  double v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [v9 setValue:v10 forProperty:*MEMORY[0x1E4F31318] withCompletionBlock:0];
}

- (void)updatePlayCountForElapsedTime:(double)a3 duration:(double)a4
{
  __int16 v12 = [(VUILibraryMediaItem_iOS *)self playbackPositionInfo];
  if (!v12)
  {
    __int16 v12 = objc_alloc_init(VUIPlaybackPositionInfo);
    [(VUILibraryMediaItem_iOS *)self _schedulePlaybackPositionInfoPersistence];
  }
  double v7 = [(VUILibraryMediaItem_iOS *)self ml3Track];
  id v8 = [v7 valueForProperty:*MEMORY[0x1E4F797C8]];
  uint64_t v9 = [v8 unsignedIntegerValue];

  [MEMORY[0x1E4FA9D90] playedThresholdTimeForDuration:a4];
  if (v10 < a3)
  {
    v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v9 + 1];
    [(VUIPlaybackPositionInfo *)v12 setPlayCount:v11];
  }
  if (a3 > 5.0) {
    [(VUIPlaybackPositionInfo *)v12 setHasBeenPlayed:MEMORY[0x1E4F1CC38]];
  }
  [(VUILibraryMediaItem_iOS *)self setPlaybackPositionInfo:v12];
}

- (void)cleanUpMediaItem
{
}

- (id)_localPlaybackFilePathURL
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v3 = [(VUILibraryMediaItem_iOS *)self ml3Track];
  id v4 = [v3 valueForProperty:*MEMORY[0x1E4F795B8]];

  uint64_t v5 = [(VUILibraryMediaItem_iOS *)self ml3Track];
  double v6 = [v5 valueForProperty:*MEMORY[0x1E4F79708]];
  int v7 = [v6 BOOLValue];

  id v8 = [(VUILibraryMediaItem_iOS *)self ml3Track];
  uint64_t v9 = [v8 valueForProperty:*MEMORY[0x1E4F79770]];
  char v10 = [v9 BOOLValue];

  v11 = 0;
  if (v7 && (v10 & 1) == 0)
  {
    if ((unint64_t)[v4 length] < 2)
    {
      v11 = 0;
    }
    else
    {
      uint64_t v12 = CPSharedResourcesDirectory();
      objc_super v13 = (void *)v12;
      if (v12)
      {
        uint64_t v14 = NSString;
        v18[0] = v12;
        v18[1] = @"Media";
        v18[2] = v4;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
        v16 = [v14 pathWithComponents:v15];

        if (v16)
        {
          v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16 isDirectory:0];
        }
        else
        {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
      }
    }
  }

  return v11;
}

- (void)_schedulePlaybackPositionInfoPersistence
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VUILibraryMediaItem_iOS__schedulePlaybackPositionInfoPersistence__block_invoke;
  block[3] = &unk_1E6DF3D58;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (BOOL)_supportsBookmarks
{
  return ![(VUILibraryMediaItem_iOS *)self bookmarkDisabled];
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(int64_t)a3
{
  self->_persistentID = a3;
}

- (MPMediaItem)mpMediaItem
{
  return self->_mpMediaItem;
}

- (void)setMpMediaItem:(id)a3
{
}

- (MPMediaLibrary)mpMediaLibrary
{
  return self->_mpMediaLibrary;
}

- (BOOL)bookmarkDisabled
{
  return self->_bookmarkDisabled;
}

- (void)setBookmarkDisabled:(BOOL)a3
{
  self->_bookmarkDisabled = a3;
}

- (ML3Track)ml3Track
{
  return self->_ml3Track;
}

- (void)setMl3Track:(id)a3
{
}

- (VUIPlaybackPositionInfo)playbackPositionInfo
{
  return self->_playbackPositionInfo;
}

- (void)setPlaybackPositionInfo:(id)a3
{
}

- (NSURL)mediaItemURLInternal
{
  return self->_mediaItemURLInternal;
}

- (void)setMediaItemURLInternal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItemURLInternal, 0);
  objc_storeStrong((id *)&self->_playbackPositionInfo, 0);
  objc_storeStrong((id *)&self->_ml3Track, 0);
  objc_storeStrong((id *)&self->_mpMediaLibrary, 0);
  objc_storeStrong((id *)&self->_mpMediaItem, 0);
}

- (void)initWithMPMediaItem:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1E2BD7000, v1, OS_LOG_TYPE_ERROR, "%@ created with nil MPMediaItem", (uint8_t *)&v4, 0xCu);
}

@end