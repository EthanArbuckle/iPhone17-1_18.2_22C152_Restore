@interface MRDPlaybackQueue
- (MRDPlaybackQueue)initWithPlaybackQueue:(id)a3;
- (MRDPlaybackQueueArtworkCache)artworkCache;
- (MRPlaybackQueue)playbackQueue;
- (id)createPlaybackQueueForRequest:(id)a3 cachingPolicy:(unsigned int)a4 playerPath:(id)a5 partiallyCachedItems:(id *)a6 capabilities:(unint64_t)a7;
- (id)debugDescription;
- (void)clearArtwork;
- (void)clearArtworkForContentItems:(id)a3;
- (void)setArtworkCache:(id)a3;
- (void)updatePlaybackQueueWithContentItems:(id)a3 fromRequest:(id)a4;
@end

@implementation MRDPlaybackQueue

- (MRDPlaybackQueue)initWithPlaybackQueue:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MRDPlaybackQueue;
  v6 = [(MRDPlaybackQueue *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_playbackQueue, a3);
    v8 = objc_alloc_init(MRDPlaybackQueueArtworkCache);
    artworkCache = v7->_artworkCache;
    v7->_artworkCache = v8;

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v10 = [(MRPlaybackQueue *)v7->_playbackQueue contentItems];
    id v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          [(MRDPlaybackQueueArtworkCache *)v7->_artworkCache addArtworkFromItem:*(void *)(*((void *)&v16 + 1) + 8 * (void)v14) fromRequest:0];
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v12);
    }
  }
  return v7;
}

- (id)debugDescription
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  v4 = [(MRPlaybackQueue *)self->_playbackQueue mr_formattedDebugDescription];
  [v3 appendFormat:@"  playbackQueue = %@\n", v4];

  id v5 = [(MRDPlaybackQueueArtworkCache *)self->_artworkCache mr_formattedDebugDescription];
  [v3 appendFormat:@"  artworkCache = %@\n", v5];

  [v3 appendFormat:@"}>"];

  return v3;
}

- (void)updatePlaybackQueueWithContentItems:(id)a3 fromRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        playbackQueue = self->_playbackQueue;
        v14 = [v12 identifier];
        v15 = [(MRPlaybackQueue *)playbackQueue contentItemForIdentifier:v14];

        if (v15) {
          [(MRDPlaybackQueueArtworkCache *)self->_artworkCache addArtworkFromItem:v12 fromRequest:v7];
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v9);
  }
  id v16 = objc_alloc((Class)MRPlaybackQueue);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10014ECE8;
  v31[3] = &unk_10041E870;
  id v17 = v7;
  id v32 = v17;
  long long v18 = objc_msgSend(v6, "msv_map:", v31);
  id v19 = [v16 initWithContentItems:v18];

  objc_super v20 = [v19 contentItems];
  v21 = [v20 firstObject];
  v22 = [v21 metadata];
  [v22 playbackRate];
  float v24 = v23;

  [(MRPlaybackQueue *)self->_playbackQueue mergeFrom:v19];
  v25 = [v19 contentItems];
  v26 = [v25 firstObject];
  v27 = [v26 metadata];
  [v27 playbackRate];
  float v29 = v28;

  if (v17)
  {
    v30 = +[MRUserSettings currentSettings];
    if (![v30 inconsistentPlaybackQueueCacheABC])
    {
LABEL_14:

      goto LABEL_15;
    }

    if ((float)(v24 - v29) > 0.00000011921)
    {
      v30 = dispatch_get_global_queue(-2, 0);
      dispatch_async(v30, &stru_10041E890);
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)clearArtworkForContentItems:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        playbackQueue = self->_playbackQueue;
        uint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v8) identifier];
        id v11 = [(MRPlaybackQueue *)playbackQueue contentItemForIdentifier:v10];

        if (v11)
        {
          id v12 = [v11 metadata];
          [v12 setArtworkURLTemplates:0];

          [v11 setArtwork:0];
          [v11 setArtworks:0];
          [v11 setRemoteArtworks:0];
          artworkCache = self->_artworkCache;
          id v19 = v11;
          v14 = +[NSArray arrayWithObjects:&v19 count:1];
          [(MRDPlaybackQueueArtworkCache *)artworkCache clearArtworkForItems:v14];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)clearArtwork
{
  id v3 = objc_alloc_init(MRDPlaybackQueueArtworkCache);
  artworkCache = self->_artworkCache;
  self->_artworkCache = v3;

  _objc_release_x1(v3, artworkCache);
}

- (id)createPlaybackQueueForRequest:(id)a3 cachingPolicy:(unsigned int)a4 playerPath:(id)a5 partiallyCachedItems:(id *)a6 capabilities:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = [v11 requestByRemovingArtwork];
  v45 = self;
  v14 = MRPlaybackQueueCreateFromCache();
  if (v14)
  {
    if ([v11 includeArtwork])
    {
      v41 = a6;
      v38 = v13;
      id v39 = v12;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id obj = [(MRPlaybackQueue *)v45->_playbackQueue contentItems];
      id v15 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
      if (v15)
      {
        id v16 = v15;
        unsigned int v40 = a4;
        id v42 = 0;
        uint64_t v44 = *(void *)v47;
        uint64_t v17 = MRContentItemArtworkFormatStandard;
LABEL_5:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v47 != v44) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
          objc_super v20 = [v19 identifier];
          v21 = [v14 contentItemForIdentifier:v20];

          v22 = [v19 metadata];
          if ([v22 hasArtworkAvailable]) {
            break;
          }
          float v23 = [v19 availableArtworkFormats];
          id v24 = [v23 count];

          if (v24) {
            goto LABEL_11;
          }
LABEL_24:

          if (v16 == (id)++v18)
          {
            id v16 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
            if (v16) {
              goto LABEL_5;
            }
            goto LABEL_30;
          }
        }

LABEL_11:
        v25 = [v11 requestedArtworkFormats];
        id v26 = [v25 count];

        if (v26)
        {
          v27 = [v11 requestedArtworkFormats];
          uint64_t v52 = v17;
          float v28 = +[NSArray arrayWithObjects:&v52 count:1];
          unsigned int v29 = [v27 isEqualToArray:v28];

          if (!v29) {
            goto LABEL_34;
          }
          v30 = [(MRDPlaybackQueueArtworkCache *)v45->_artworkCache fittedArtworkDataForContentItem:v19 withRequest:v11];
          id v31 = [objc_alloc((Class)MRDataArtwork) initWithImageData:v30];
          if (!v31)
          {

LABEL_34:
            id v36 = 0;
            goto LABEL_35;
          }
          id v32 = v31;
          uint64_t v50 = v17;
          id v51 = v31;
          long long v33 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          [v21 setArtworks:v33];
        }
        else
        {
          v30 = [(MRDPlaybackQueueArtworkCache *)v45->_artworkCache fittedArtworkDataForContentItem:v19 withRequest:v11];
          if (v30)
          {
            id v34 = [objc_alloc((Class)MRArtwork) initWithImageData:v30 height:0 width:0];
            [v21 setArtwork:v34];
          }
          else
          {
            if (v40 != 2) {
              goto LABEL_34;
            }
            if (v41)
            {
              id v35 = v42;
              if (!v42) {
                id v35 = objc_alloc_init((Class)NSMutableArray);
              }
            }
            else
            {
              id v35 = v42;
            }
            id v42 = v35;
            [v35 addObject:v19];
          }
        }

        goto LABEL_24;
      }
      id v42 = 0;
LABEL_30:

      if (v41) {
        id *v41 = v42;
      }
      id v36 = v14;
LABEL_35:
      uint64_t v13 = v38;
      id v12 = v39;
    }
    else
    {
      id v36 = v14;
    }
  }
  else
  {
    id v36 = 0;
  }

  return v36;
}

- (MRPlaybackQueue)playbackQueue
{
  return self->_playbackQueue;
}

- (MRDPlaybackQueueArtworkCache)artworkCache
{
  return self->_artworkCache;
}

- (void)setArtworkCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCache, 0);

  objc_storeStrong((id *)&self->_playbackQueue, 0);
}

@end