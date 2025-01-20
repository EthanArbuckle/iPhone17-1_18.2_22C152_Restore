@interface AEAggregationhelper
- (AEAggregationhelper)initWithPlugins:(id)a3 forUrl:(id)a4 withOptions:(id)a5;
- (BOOL)acknowledgeAnnotationProvider:(id)a3 willMergeAnnotationsWithAssertVersionMismatch:(id)a4 assetID:(id)a5 assetURL:(id)a6;
- (BOOL)helperValidateBookAuthorizationWithError:(id *)a3 needsCoordination:(BOOL)a4;
- (id)annotationProviderWithCoordination:(BOOL)a3 forAssetID:(id)a4;
- (id)helperCoverImage;
- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4;
- (id)helperMinifiedController;
- (void)dealloc;
- (void)helperDeletePersistentCache;
- (void)helperUpdateCachedURLTo:(id)a3;
- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4;
- (void)setMetadata:(id)a3 forKey:(id)a4;
- (void)viewControllerFromPluginIndex:(int)a3 withCompletion:(id)a4;
@end

@implementation AEAggregationhelper

- (AEAggregationhelper)initWithPlugins:(id)a3 forUrl:(id)a4 withOptions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(AEAggregationhelper *)self init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_plugins, a3);
    objc_storeStrong((id *)&v13->_url, a4);
    objc_storeStrong((id *)&v13->_options, a5);
  }

  return v13;
}

- (void)dealloc
{
  url = self->_url;
  self->_url = 0;

  plugins = self->_plugins;
  self->_plugins = 0;

  options = self->_options;
  self->_options = 0;

  v6.receiver = self;
  v6.super_class = (Class)AEAggregationhelper;
  [(AEAggregationhelper *)&v6 dealloc];
}

- (id)helperCoverImage
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_plugins;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) helperForURL:self->_url withOptions:self->_options v12];
      id v10 = [v9 helperCoverImage];

      if (v10) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v10 = 0;
  }

  return v10;
}

- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_plugins;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v8);
      }
      long long v13 = [*(id *)(*((void *)&v16 + 1) + 8 * v12) helperForURL:self->_url withOptions:self->_options v16];
      long long v14 = [v13 helperMetadataForKey:v6 needsCoordination:v4];

      if (v14) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    long long v14 = 0;
  }

  return v14;
}

- (void)setMetadata:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_plugins;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v12) helperForURL:self->_url withOptions:self->_options v14];
        if (objc_opt_respondsToSelector()) {
          [v13 setMetadata:v6 forKey:v7];
        }

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)helperDeletePersistentCache
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = self->_plugins;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) helperForURL:self->_url withOptions:self->_options v10];
        [v9 helperDeletePersistentCache];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)helperUpdateCachedURLTo:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_plugins;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) helperForURL:self->_url withOptions:self->_options];
        [v11 helperUpdateCachedURLTo:v4];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)annotationProviderWithCoordination:(BOOL)a3 forAssetID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = self->_plugins;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    long long v17 = v7;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) helperForURL:self->_url withOptions:self->_options];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v14 = [v13 annotationProviderWithCoordination:v4 forAssetID:v6];
          if (v14)
          {
            long long v15 = (void *)v14;

            goto LABEL_12;
          }
        }
      }
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    long long v15 = 0;
LABEL_12:
    id v7 = v17;
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

- (BOOL)acknowledgeAnnotationProvider:(id)a3 willMergeAnnotationsWithAssertVersionMismatch:(id)a4 assetID:(id)a5 assetURL:(id)a6
{
  id v23 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v14 = self->_plugins;
  id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    v22 = v13;
    uint64_t v17 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = [(*(id *)(*((void *)&v24 + 1) + 8 * i)) helperForURL:self->_url withOptions:self->_options v22];
        if ((objc_opt_respondsToSelector() & 1) != 0
          && ([v19 acknowledgeAnnotationProvider:v23 willMergeAnnotationsWithAssertVersionMismatch:v10 assetID:v11 assetURL:v12] & 1) == 0)
        {

          BOOL v20 = 0;
          goto LABEL_12;
        }
      }
      id v16 = [(NSArray *)v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v16) {
        continue;
      }
      break;
    }
    BOOL v20 = 1;
LABEL_12:
    long long v13 = v22;
  }
  else
  {
    BOOL v20 = 1;
  }

  return v20;
}

- (BOOL)helperValidateBookAuthorizationWithError:(id *)a3 needsCoordination:(BOOL)a4
{
  BOOL v21 = a4;
  if (!a3) {
    return 0;
  }
  BOOL v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = self->_plugins;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    long long v19 = v6;
    BOOL v20 = v4;
    id v10 = 0;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = [*(id *)(*((void *)&v23 + 1) + 8 * i) helperForURL:self->_url withOptions:self->_options v19, v20];
        if (objc_opt_respondsToSelector())
        {
          id v22 = v10;
          unsigned int v14 = [v13 helperValidateBookAuthorizationWithError:&v22 needsCoordination:v21];
          id v15 = v22;

          if (v14)
          {

            BOOL v16 = 1;
            goto LABEL_15;
          }
          id v10 = v15;
        }
      }
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    BOOL v16 = 0;
    id v15 = v10;
LABEL_15:
    id v6 = v19;
    BOOL v4 = v20;
  }
  else
  {
    id v15 = 0;
    BOOL v16 = 0;
  }

  id v17 = v15;
  id *v4 = v17;

  return v16;
}

- (void)viewControllerFromPluginIndex:(int)a3 withCompletion:(id)a4
{
  id v6 = a4;
  int v7 = [(NSArray *)self->_plugins count];
  if (v7 > a3)
  {
    id v8 = [(NSArray *)self->_plugins objectAtIndex:a3];
    id v9 = [v8 helperForURL:self->_url withOptions:self->_options];
    options = self->_options;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_C5F94;
    v13[3] = &unk_2C88F8;
    int v15 = a3;
    int v16 = v7;
    v13[4] = self;
    id v14 = v6;
    [v9 helperViewControllerWithOptions:options completion:v13];

LABEL_5:
    goto LABEL_6;
  }
  if (v6)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_C60F4;
    v11[3] = &unk_2C4280;
    id v12 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    id v8 = v12;
    goto LABEL_5;
  }
LABEL_6:
}

- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4
{
}

- (id)helperMinifiedController
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = self->_plugins;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) helperForURL:self->_url withOptions:self->_options v12];
      id v10 = [v9 helperMinifiedController];

      if (v10) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_plugins, 0);
}

@end