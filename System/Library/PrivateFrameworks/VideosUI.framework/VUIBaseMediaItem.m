@interface VUIBaseMediaItem
+ (void)initialize;
- (VUIMediaStartTimeCollection)startTimeCollection;
- (id)mediaItemMetadataForProperty:(id)a3;
- (void)setStartTimeCollection:(id)a3;
@end

@implementation VUIBaseMediaItem

+ (void)initialize
{
  if (initialize_onceToken_8 != -1) {
    dispatch_once(&initialize_onceToken_8, &__block_literal_global_103);
  }
}

void __30__VUIBaseMediaItem_initialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.AppleTV.playback", "VUIBaseMediaItem");
  v1 = (void *)sLogObject_15;
  sLogObject_15 = (uint64_t)v0;
}

- (VUIMediaStartTimeCollection)startTimeCollection
{
  startTimeCollection = self->_startTimeCollection;
  if (!startTimeCollection)
  {
    v4 = objc_alloc_init(VUIMediaStartTimeCollection);
    v5 = self->_startTimeCollection;
    self->_startTimeCollection = v4;

    startTimeCollection = self->_startTimeCollection;
  }
  return startTimeCollection;
}

- (id)mediaItemMetadataForProperty:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VUIBaseMediaItem;
  id v5 = [(TVPBaseMediaItem *)&v21 mediaItemMetadataForProperty:v4];
  uint64_t v6 = *MEMORY[0x1E4FAA0C0];
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA0C0]])
  {
    if (v5)
    {
      v7 = sLogObject_15;
      if (os_log_type_enabled((os_log_t)sLogObject_15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v5;
        _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Returning manually set start time of %@", buf, 0xCu);
      }
      goto LABEL_18;
    }
    v10 = [(VUIBaseMediaItem *)self startTimeCollection];
    v11 = [v10 preferredStartTimeInfo];

    v12 = (void *)sLogObject_15;
    if (os_log_type_enabled((os_log_t)sLogObject_15, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = [(VUIBaseMediaItem *)self startTimeCollection];
      v15 = [v14 allStartTimeInfos];
      *(_DWORD *)buf = 138412290;
      id v23 = v15;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "All start time infos: %@", buf, 0xCu);
    }
    v16 = sLogObject_15;
    if (os_log_type_enabled((os_log_t)sLogObject_15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v11;
      _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Preferred start time info: %@", buf, 0xCu);
    }
    if (v11)
    {
      id v5 = [v11 startTime];
    }
    else
    {
      id v5 = 0;
    }
    goto LABEL_17;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FAA0C8]])
  {
    v20.receiver = self;
    v20.super_class = (Class)VUIBaseMediaItem;
    v8 = [(TVPBaseMediaItem *)&v20 mediaItemMetadataForProperty:v6];

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E4F1CC28];
      goto LABEL_19;
    }
    v17 = [(VUIBaseMediaItem *)self startTimeCollection];
    v11 = [v17 preferredStartTimeInfo];

    if (v11)
    {
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v11, "type") == 1);

      id v5 = (id)v18;
    }
LABEL_17:
  }
LABEL_18:
  id v5 = v5;
  v9 = v5;
LABEL_19:

  return v9;
}

- (void)setStartTimeCollection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end