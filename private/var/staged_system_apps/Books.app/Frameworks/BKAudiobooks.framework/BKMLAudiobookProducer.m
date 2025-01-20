@interface BKMLAudiobookProducer
- (BKMLAudiobookProducer)initWithStoreDemoMode:(BOOL)a3;
- (BOOL)isStoreDemoMode;
- (void)audiobookForIdentifier:(id)a3 completion:(id)a4;
@end

@implementation BKMLAudiobookProducer

- (BKMLAudiobookProducer)initWithStoreDemoMode:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKMLAudiobookProducer;
  result = [(BKMLAudiobookProducer *)&v5 init];
  if (result) {
    result->_storeDemoMode = a3;
  }
  return result;
}

- (void)audiobookForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(BKMLAudiobookProducer *)self isStoreDemoMode];
  objc_opt_class();
  v9 = BUDynamicCast();
  if ([v9 isValid])
  {
    v10 = [v9 audiobookQuery];
    v11 = v10;
    if (v10)
    {
      v12 = [v10 collections];
      if ([v12 count])
      {
        v49 = v12;
        v13 = [v12 objectAtIndexedSubscript:0];
        v14 = [v13 items];

        v15 = v14;
        if ([v14 count])
        {
          unsigned int v44 = v8;
          v45 = v11;
          id v47 = v7;
          id v48 = v6;
          v16 = objc_alloc_init(BKMLAudiobook);
          v46 = v9;
          v17 = [v9 supplementalAssetIdentifiers];
          v18 = (char *)[v17 count];
          v19 = +[NSMutableArray arrayWithCapacity:v18];
          if (v18)
          {
            for (i = 0; i != v18; ++i)
            {
              v21 = [v17 objectAtIndexedSubscript:i];
              v22 = [[BKAudiobookSupplementalContent alloc] initWithTitle:&stru_3D468 assetIdentifier:v21];
              [v19 addObject:v22];
            }
          }
          [(BKMLAudiobook *)v16 setSupplementalContents:v19];
          v23 = objc_opt_new();
          v24 = (char *)[v15 count];
          if (v24)
          {
            v25 = v24;
            v26 = 0;
            uint64_t v27 = 0;
            double v28 = 0.0;
            do
            {
              v29 = [BKMLAudiobookTrack alloc];
              v30 = [v15 objectAtIndexedSubscript:v26];
              v31 = [(BKMLAudiobookTrack *)v29 initWithAudiobook:v16 mediaItem:v30 startTime:v27 startChapterNumber:v26 trackNumber:v25 trackCount:v44 storeDemoMode:v28];

              [v23 addObject:v31];
              [(BKMLAudiobookTrack *)v31 duration];
              double v28 = v28 + v32;
              v33 = [(BKMLAudiobookTrack *)v31 chapters];
              v27 += (uint64_t)[v33 count];

              ++v26;
            }
            while (v25 != v26);
          }
          [(BKMLAudiobook *)v16 addTracks:v23];

          v34 = 0;
          id v7 = v47;
          id v6 = v48;
          v11 = v45;
          v9 = v46;
        }
        else
        {
          v40 = +[NSString stringWithFormat:@"No media items found for %@", v9];
          NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
          v59 = v40;
          v41 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          v34 = +[NSError errorWithDomain:@"BKAudiobooksError" code:0 userInfo:v41];

          v16 = 0;
        }
        v12 = v49;
      }
      else
      {
        v37 = [v9 persistentID];
        v15 = +[NSString stringWithFormat:@"No albums found for %@", v37];

        NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
        v57 = v15;
        +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        v39 = id v38 = v6;
        v34 = +[NSError errorWithDomain:@"BKAudiobooksError" code:0 userInfo:v39];

        id v6 = v38;
        v16 = 0;
      }
    }
    else
    {
      NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
      CFStringRef v55 = @"Query creation failed";
      v12 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      v34 = +[NSError errorWithDomain:@"BKAudiobooksError" code:0 userInfo:v12];
      v16 = 0;
    }
  }
  else
  {
    if (v9)
    {
      NSErrorUserInfoKey v52 = NSLocalizedDescriptionKey;
      CFStringRef v53 = @"Audiobook identifier has no persistentID nor assetID";
      v35 = &v53;
      v36 = &v52;
    }
    else
    {
      NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
      CFStringRef v51 = @"Audiobook identifier is not instance of BKMLAudiobookIdentifier";
      v35 = &v51;
      v36 = &v50;
    }
    v11 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v36 count:1];
    v34 = +[NSError errorWithDomain:@"BKAudiobooksError" code:0 userInfo:v11];
    v16 = 0;
  }

  id v42 = objc_retainBlock(v7);
  v43 = v42;
  if (v42) {
    (*((void (**)(id, BKMLAudiobook *, void *))v42 + 2))(v42, v16, v34);
  }
}

- (BOOL)isStoreDemoMode
{
  return self->_storeDemoMode;
}

@end