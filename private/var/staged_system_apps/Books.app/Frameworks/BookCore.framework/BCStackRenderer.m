@interface BCStackRenderer
- (BCImageFetching)imageRepository;
- (BCSeriesStackDecomposing)seriesDecomposer;
- (BCStackRenderer)init;
- (NSMutableArray)renderOperations;
- (id)_bookFilter:(id)a3;
- (id)_seriesFilter:(id)a3;
- (void)_applySeriesFilter:(id)a3 toImages:(id)a4 filters:(id)a5 size:(CGSize)a6 completion:(id)a7;
- (void)_renderStackFromSource:(id)a3 images:(id)a4 forRequest:(id)a5 onQueue:(id)a6 withCompletion:(id)a7;
- (void)renderStackFromSource:(id)a3 forRequest:(id)a4 onQueue:(id)a5 completion:(id)a6;
- (void)setImageRepository:(id)a3;
- (void)setRenderOperations:(id)a3;
- (void)setSeriesDecomposer:(id)a3;
@end

@implementation BCStackRenderer

- (BCStackRenderer)init
{
  v7.receiver = self;
  v7.super_class = (Class)BCStackRenderer;
  v2 = [(BCStackRenderer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSMutableArray array];
    renderOperations = v3->_renderOperations;
    v3->_renderOperations = (NSMutableArray *)v4;
  }
  return v3;
}

- (id)_bookFilter:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[BCCoverEffects sharedInstance];
  v5 = [v4 bookCoverEffectFilters];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 identifier:v14];
        unsigned int v12 = [v11 isEqualToString:v3];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)_seriesFilter:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[BCCoverEffects sharedInstance];
  v5 = [v4 seriesCoverEffectFilters];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 identifier:v14];
        unsigned int v12 = [v11 isEqualToString:v3];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)renderStackFromSource:(id)a3 forRequest:(id)a4 onQueue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = +[NSMutableArray array];
  long long v15 = [(BCStackRenderer *)self seriesDecomposer];
  long long v16 = [v10 identifier];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_14A648;
  v22[3] = &unk_2CA068;
  id v23 = v11;
  id v24 = v12;
  id v25 = v10;
  v26 = self;
  id v27 = v14;
  id v28 = v13;
  id v17 = v14;
  id v18 = v10;
  id v19 = v12;
  id v20 = v13;
  id v21 = v11;
  [v15 assetIDsAndOptionsForBooksInSeries:v16 completion:v22];
}

- (void)_renderStackFromSource:(id)a3 images:(id)a4 forRequest:(id)a5 onQueue:(id)a6 withCompletion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v55 = objc_opt_new();
  v53 = objc_opt_new();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v16 = v12;
  v54 = v16;
  id v58 = [v16 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v58)
  {
    id v49 = v15;
    id v50 = v14;
    id v51 = v11;
    id v52 = v13;
    int v17 = 0;
    int v18 = 0;
    uint64_t v19 = *(void *)v66;
    id v20 = &stru_B8 + 24;
    do
    {
      for (i = 0; i != v58; i = (char *)i + 1)
      {
        if (*(void *)v66 != v19) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v23 = [v22 processingOptions:v49, v50, v51, v52] >> 7) & 1;
        unsigned int v24 = [v22 processingOptions];
        char v25 = v24;
        uint64_t v26 = (v24 >> 6) & 1;
        if (([v22 processingOptions] & 8) != 0) {
          uint64_t v27 = 2;
        }
        else {
          uint64_t v27 = 1;
        }
        id v28 = +[BCUCoverEffects effectIdentifierWithRTL:v23 style:v27 content:1 nightMode:v26];
        uint64_t v29 = [(BCStackRenderer *)self _bookFilter:v28];
        v30 = (void *)v29;
        if (v22) {
          BOOL v31 = v29 == 0;
        }
        else {
          BOOL v31 = 1;
        }
        if (!v31)
        {
          [v22 image];
          int v56 = v17;
          id v32 = v20;
          v34 = uint64_t v33 = v19;
          v35 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", [v34 CGImage]);
          [v55 addObject:v35];

          id v16 = v54;
          uint64_t v19 = v33;
          id v20 = v32;
          int v17 = v56;
          [v53 addObject:v30];
        }
        if ([v22 quality] < (unsigned __int16)v20) {
          id v20 = [v22 quality];
        }
        v18 |= [v22 isGeneric];
        v17 |= v25 & 0x40;
      }
      id v58 = [v16 countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v58);

    if (v18) {
      __int16 v36 = 2;
    }
    else {
      __int16 v36 = (__int16)v20;
    }
    id v11 = v51;
    id v13 = v52;
    id v15 = v49;
    id v14 = v50;
  }
  else
  {

    LOWORD(v17) = 0;
    __int16 v36 = 208;
  }
  double v37 = mainScreenScaleFactor();
  [v11 imageSize];
  double v39 = v38;
  double v41 = v40;
  id v42 = BCUCoverEffectsIdentifierSeriesStackDiagonal;
  if (([v13 processingOptions] & 0x1000) != 0)
  {
    unsigned __int8 v43 = [v13 processingOptions];
    v44 = (id *)&BCUCoverEffectsIdentifierSeriesStackHorizontalRTL;
    if ((v43 & 0x80) == 0) {
      v44 = (id *)&BCUCoverEffectsIdentifierSeriesStackHorizontal;
    }
    id v45 = *v44;

    id v42 = v45;
  }
  v59[1] = 3221225472;
  v59[0] = _NSConcreteStackBlock;
  v59[2] = sub_14B698;
  v59[3] = &unk_2CA0B8;
  id v60 = v14;
  id v61 = v11;
  __int16 v63 = v17;
  __int16 v64 = v36;
  id v62 = v15;
  id v46 = v15;
  id v47 = v11;
  id v48 = v14;
  -[BCStackRenderer _applySeriesFilter:toImages:filters:size:completion:](self, "_applySeriesFilter:toImages:filters:size:completion:", v42, v55, v53, v59, v39 / v37, v41 / v37);
}

- (void)_applySeriesFilter:(id)a3 toImages:(id)a4 filters:(id)a5 size:(CGSize)a6 completion:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = [(BCStackRenderer *)self _seriesFilter:a3];
  id v17 = [v13 count];
  id v18 = [v14 count];
  if (v16 && v17 && v18 == v17)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_14BB64;
    v30[3] = &unk_2CA0E0;
    id v31 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v13, "count"));
    id v19 = v31;
    [v13 enumerateObjectsUsingBlock:v30];
    double v20 = mainScreenScaleFactor();
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_14BBA8;
    v28[3] = &unk_2CA108;
    v28[4] = self;
    id v29 = v15;
    id v21 = [v16 newOperationWithImages:v19 filters:v14 size:1 contentsScale:v28 waitForCPUSynchronization:width height:v20];
    [v21 start];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_14BDC4;
    v26[3] = &unk_2C3AF8;
    p_accessLock = &self->_accessLock;
    v26[4] = self;
    id v27 = v21;
    id v23 = v21;
    os_unfair_lock_lock(p_accessLock);
    sub_14BDC4((uint64_t)v26);
    os_unfair_lock_unlock(p_accessLock);
  }
  else
  {
    id v24 = objc_retainBlock(v15);
    char v25 = v24;
    if (v24) {
      (*((void (**)(id, void, void))v24 + 2))(v24, 0, 0);
    }
  }
}

- (BCImageFetching)imageRepository
{
  return self->imageRepository;
}

- (void)setImageRepository:(id)a3
{
  self->imageRepository = (BCImageFetching *)a3;
}

- (BCSeriesStackDecomposing)seriesDecomposer
{
  return self->seriesDecomposer;
}

- (void)setSeriesDecomposer:(id)a3
{
  self->seriesDecomposer = (BCSeriesStackDecomposing *)a3;
}

- (NSMutableArray)renderOperations
{
  return self->_renderOperations;
}

- (void)setRenderOperations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end