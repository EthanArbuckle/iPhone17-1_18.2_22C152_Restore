@interface PLSyncSaveJob
- (BOOL)cleanupSyncState;
- (BOOL)hasVideoComplement;
- (BOOL)isSyncComplete;
- (BOOL)isVideo;
- (CLLocation)location;
- (NSArray)facesInfo;
- (NSDate)cleanupBeforeDate;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSNumber)sortToken;
- (NSSet)albumURIs;
- (NSString)originalFileName;
- (NSString)uuid;
- (NSURL)originalAssetURL;
- (NSURL)videoComplementURL;
- (id)description;
- (id)finishedBlock;
- (id)initFromSerializedData:(id)a3;
- (id)serializedData;
- (void)processFacesWithBlock:(id)a3;
- (void)setAlbumURIs:(id)a3;
- (void)setCleanupBeforeDate:(id)a3;
- (void)setCleanupSyncState:(BOOL)a3;
- (void)setCreationDate:(id)a3;
- (void)setFacesInfo:(id)a3;
- (void)setFinishedBlock:(id)a3;
- (void)setHasVideoComplement:(BOOL)a3;
- (void)setIsSyncComplete:(BOOL)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setOriginalAssetURL:(id)a3;
- (void)setOriginalFileName:(id)a3;
- (void)setSortToken:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVideoComplementURL:(id)a3;
@end

@implementation PLSyncSaveJob

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishedBlock, 0);
  objc_storeStrong((id *)&self->_cleanupBeforeDate, 0);
  objc_storeStrong((id *)&self->originalFileName, 0);
  objc_storeStrong((id *)&self->sortToken, 0);
  objc_storeStrong((id *)&self->location, 0);
  objc_storeStrong((id *)&self->albumURIs, 0);
  objc_storeStrong((id *)&self->modificationDate, 0);
  objc_storeStrong((id *)&self->creationDate, 0);
  objc_storeStrong((id *)&self->uuid, 0);
  objc_storeStrong((id *)&self->videoComplementURL, 0);
  objc_storeStrong((id *)&self->originalAssetURL, 0);
  objc_storeStrong((id *)&self->facesInfo, 0);
}

- (void)setFinishedBlock:(id)a3
{
}

- (id)finishedBlock
{
  return self->_finishedBlock;
}

- (void)setCleanupBeforeDate:(id)a3
{
}

- (NSDate)cleanupBeforeDate
{
  return self->_cleanupBeforeDate;
}

- (void)setCleanupSyncState:(BOOL)a3
{
  self->_cleanupSyncState = a3;
}

- (BOOL)cleanupSyncState
{
  return self->_cleanupSyncState;
}

- (void)setIsSyncComplete:(BOOL)a3
{
  self->isSyncComplete = a3;
}

- (BOOL)isSyncComplete
{
  return self->isSyncComplete;
}

- (void)setOriginalFileName:(id)a3
{
}

- (NSString)originalFileName
{
  return self->originalFileName;
}

- (void)setSortToken:(id)a3
{
}

- (NSNumber)sortToken
{
  return self->sortToken;
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->location;
}

- (void)setAlbumURIs:(id)a3
{
}

- (NSSet)albumURIs
{
  return self->albumURIs;
}

- (void)setModificationDate:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->modificationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->creationDate;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->uuid;
}

- (void)setIsVideo:(BOOL)a3
{
  self->isVideo = a3;
}

- (BOOL)isVideo
{
  return self->isVideo;
}

- (void)setHasVideoComplement:(BOOL)a3
{
  self->hasVideoComplement = a3;
}

- (BOOL)hasVideoComplement
{
  return self->hasVideoComplement;
}

- (void)setVideoComplementURL:(id)a3
{
}

- (NSURL)videoComplementURL
{
  return self->videoComplementURL;
}

- (void)setOriginalAssetURL:(id)a3
{
}

- (NSURL)originalAssetURL
{
  return self->originalAssetURL;
}

- (void)setFacesInfo:(id)a3
{
}

- (NSArray)facesInfo
{
  return self->facesInfo;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)PLSyncSaveJob;
  v3 = [(PLSyncSaveJob *)&v10 description];
  if ([(PLSyncSaveJob *)self isSyncComplete])
  {
    v4 = [v3 stringByAppendingString:@" sync complete"];
  }
  else
  {
    if ([(PLSyncSaveJob *)self cleanupSyncState])
    {
      uint64_t v5 = [(PLSyncSaveJob *)self cleanupBeforeDate];
      v4 = [v3 stringByAppendingFormat:@" cleanup sync state (before: %@)", v5];
    }
    else
    {
      if ([(PLSyncSaveJob *)self isVideo]) {
        v6 = @"video";
      }
      else {
        v6 = @"photo";
      }
      uint64_t v5 = [(PLSyncSaveJob *)self uuid];
      v7 = [(PLSyncSaveJob *)self originalAssetURL];
      v8 = [v7 path];
      v4 = [v3 stringByAppendingFormat:@" sync %@ %@: %@", v6, v5, v8];
    }
    v3 = (void *)v5;
  }

  return v4;
}

- (void)processFacesWithBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v17 = (char *)a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = [(PLSyncSaveJob *)self facesInfo];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    v16 = v17 + 16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_super v10 = objc_msgSend(v9, "objectForKey:", @"faceAlbumUUID", v16);
        v11 = [v9 objectForKey:@"faceIndex"];
        CFDictionaryRef v12 = [v9 objectForKey:@"faceRectangle"];
        CFDictionaryRef v13 = v12;
        if (v11) {
          BOOL v14 = v12 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          memset(&rect, 0, sizeof(rect));
          if (CGRectMakeWithDictionaryRepresentation(v12, &rect))
          {
            __int16 v15 = [v11 intValue];
            (*((void (**)(char *, void, void *, CGFloat, CGFloat, CGFloat, CGFloat))v17 + 2))(v17, v15, v10, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
}

- (id)serializedData
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(PLSyncSaveJob *)self originalAssetURL];

  if (v4)
  {
    uint64_t v5 = [(PLSyncSaveJob *)self originalAssetURL];
    uint64_t v6 = [v5 path];
    [v3 setObject:v6 forKey:@"path"];
  }
  uint64_t v7 = [(PLSyncSaveJob *)self videoComplementURL];

  if (v7)
  {
    v8 = [(PLSyncSaveJob *)self videoComplementURL];
    v9 = [v8 path];
    [v3 setObject:v9 forKey:@"videoComplementPath"];
  }
  BOOL v10 = [(PLSyncSaveJob *)self hasVideoComplement];
  v11 = (void *)MEMORY[0x1E4F1CFD0];
  if (v10) {
    [v3 setObject:*MEMORY[0x1E4F1CFD0] forKey:@"hasVideoComplement"];
  }
  if ([(PLSyncSaveJob *)self isVideo]) {
    [v3 setObject:*v11 forKey:@"isVideo"];
  }
  CFDictionaryRef v12 = [(PLSyncSaveJob *)self uuid];

  if (v12)
  {
    CFDictionaryRef v13 = [(PLSyncSaveJob *)self uuid];
    [v3 setObject:v13 forKey:@"UUID"];
  }
  BOOL v14 = [(PLSyncSaveJob *)self creationDate];

  if (v14)
  {
    __int16 v15 = [(PLSyncSaveJob *)self creationDate];
    [v3 setObject:v15 forKey:@"date"];
  }
  v16 = [(PLSyncSaveJob *)self modificationDate];

  if (v16)
  {
    v17 = [(PLSyncSaveJob *)self modificationDate];
    [v3 setObject:v17 forKey:@"moddate"];
  }
  v18 = [(PLSyncSaveJob *)self location];
  long long v19 = v18;
  if (v18)
  {
    [v18 coordinate];
    if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:"))
    {
      [v19 coordinate];
      double v21 = v20;
      long long v22 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v3 setObject:v22 forKey:@"latitude"];

      v23 = [NSNumber numberWithDouble:v21];
      [v3 setObject:v23 forKey:@"longitude"];
    }
  }
  uint64_t v24 = [(PLSyncSaveJob *)self albumURIs];

  if (v24)
  {
    v25 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v26 = [(PLSyncSaveJob *)self albumURIs];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [*(id *)(*((void *)&v42 + 1) + 8 * i) description];
          [v25 addObject:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v28);
    }

    [v3 setObject:v25 forKey:@"albums"];
  }
  v32 = [(PLSyncSaveJob *)self facesInfo];

  if (v32)
  {
    v33 = [(PLSyncSaveJob *)self facesInfo];
    [v3 setObject:v33 forKey:@"facesInfo"];
  }
  v34 = [(PLSyncSaveJob *)self sortToken];

  if (v34)
  {
    v35 = [(PLSyncSaveJob *)self sortToken];
    [v3 setObject:v35 forKey:@"sortToken"];
  }
  v36 = [(PLSyncSaveJob *)self originalFileName];

  if (v36)
  {
    v37 = [(PLSyncSaveJob *)self originalFileName];
    [v3 setObject:v37 forKey:@"originalFileName"];
  }
  if ([(PLSyncSaveJob *)self isSyncComplete]) {
    [v3 setObject:*v11 forKey:@"isSyncComplete"];
  }
  if ([(PLSyncSaveJob *)self cleanupSyncState]) {
    [v3 setObject:*v11 forKey:@"cleanupSyncState"];
  }
  v38 = [(PLSyncSaveJob *)self cleanupBeforeDate];

  if (v38)
  {
    v39 = [(PLSyncSaveJob *)self cleanupBeforeDate];
    [v3 setObject:v39 forKey:@"cleanupBeforeDate"];
  }
  v40 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:200 options:0 error:0];

  return v40;
}

- (id)initFromSerializedData:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)PLSyncSaveJob;
  uint64_t v5 = [(PLSyncSaveJob *)&v52 init];
  if (v5)
  {
    id v51 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v51];
    id v7 = v51;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v6;
        uint64_t v9 = [v8 objectForKey:@"path"];
        if (v9)
        {
          BOOL v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
          [(PLSyncSaveJob *)v5 setOriginalAssetURL:v10];
        }
        long long v45 = (void *)v9;
        v46 = v7;
        uint64_t v11 = [v8 objectForKey:@"videoComplementPath"];
        if (v11)
        {
          CFDictionaryRef v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11 isDirectory:0];
          [(PLSyncSaveJob *)v5 setVideoComplementURL:v12];
        }
        long long v44 = (void *)v11;
        CFDictionaryRef v13 = [v8 objectForKey:@"hasVideoComplement"];
        -[PLSyncSaveJob setHasVideoComplement:](v5, "setHasVideoComplement:", [v13 BOOLValue]);

        BOOL v14 = [MEMORY[0x1E4F1CA80] set];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        __int16 v15 = [v8 objectForKey:@"albums"];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v53 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v48 != v18) {
                objc_enumerationMutation(v15);
              }
              double v20 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v47 + 1) + 8 * i)];
              if (v20) {
                [v14 addObject:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v53 count:16];
          }
          while (v17);
        }

        [(PLSyncSaveJob *)v5 setAlbumURIs:v14];
        double v21 = [v8 objectForKey:@"UUID"];
        [(PLSyncSaveJob *)v5 setUuid:v21];

        long long v22 = [v8 objectForKey:@"isVideo"];
        -[PLSyncSaveJob setIsVideo:](v5, "setIsVideo:", [v22 BOOLValue]);

        v23 = [v8 objectForKey:@"date"];
        [(PLSyncSaveJob *)v5 setCreationDate:v23];

        uint64_t v24 = [v8 objectForKey:@"moddate"];
        [(PLSyncSaveJob *)v5 setModificationDate:v24];

        uint64_t v25 = [v8 objectForKey:@"latitude"];
        if (v25)
        {
          v26 = (void *)v25;
          uint64_t v27 = [v8 objectForKey:@"longitude"];

          if (v27)
          {
            id v28 = objc_alloc(MEMORY[0x1E4F1E5F0]);
            uint64_t v29 = [v8 objectForKey:@"latitude"];
            [v29 doubleValue];
            double v31 = v30;
            v32 = [v8 objectForKey:@"longitude"];
            [v32 doubleValue];
            v34 = (void *)[v28 initWithLatitude:v31 longitude:v33];

            [v34 coordinate];
            if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:")) {
              [(PLSyncSaveJob *)v5 setLocation:v34];
            }
          }
        }
        v35 = [v8 objectForKey:@"facesInfo"];
        [(PLSyncSaveJob *)v5 setFacesInfo:v35];

        v36 = [v8 objectForKey:@"sortToken"];
        [(PLSyncSaveJob *)v5 setSortToken:v36];

        v37 = [v8 objectForKey:@"originalFileName"];
        [(PLSyncSaveJob *)v5 setOriginalFileName:v37];

        v38 = [v8 objectForKey:@"isSyncComplete"];
        -[PLSyncSaveJob setIsSyncComplete:](v5, "setIsSyncComplete:", [v38 BOOLValue]);

        v39 = [v8 objectForKey:@"cleanupSyncState"];
        -[PLSyncSaveJob setCleanupSyncState:](v5, "setCleanupSyncState:", [v39 BOOLValue]);

        v40 = [v8 objectForKey:@"cleanupBeforeDate"];
        [(PLSyncSaveJob *)v5 setCleanupBeforeDate:v40];

        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v42 = objc_opt_class();
      NSLog(&cfstr_UnableToCreate_47.isa, v42, v7);
    }

    v41 = 0;
    goto LABEL_26;
  }
LABEL_23:
  v41 = v5;
LABEL_26:

  return v41;
}

@end