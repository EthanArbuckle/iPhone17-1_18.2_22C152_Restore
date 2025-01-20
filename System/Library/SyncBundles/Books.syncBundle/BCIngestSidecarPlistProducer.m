@interface BCIngestSidecarPlistProducer
- (BCIngestSidecarPlistProducer)initWithPath:(id)a3 sidecarPath:(id)a4;
- (BOOL)shouldRetry;
- (NSArray)filterMatches;
- (id)produceData;
- (void)dealloc;
@end

@implementation BCIngestSidecarPlistProducer

- (BCIngestSidecarPlistProducer)initWithPath:(id)a3 sidecarPath:(id)a4
{
  v5 = [(BCPlistProducer *)self initWithPath:a3];
  if (v5)
  {
    id v6 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:a4];
    uint64_t v7 = objc_opt_class();
    v5->_sidecarDeletes = (NSArray *)(id)BCDynamicCast(v7, (uint64_t)[v6 objectForKey:@"Deletes"]);
    v5->_filterMatches = 0;
  }
  return v5;
}

- (void)dealloc
{
  self->_sidecarDeletes = 0;
  self->_filterMatches = 0;
  v3.receiver = self;
  v3.super_class = (Class)BCIngestSidecarPlistProducer;
  [(BCPlistProducer *)&v3 dealloc];
}

- (BOOL)shouldRetry
{
  NSUInteger v3 = [(NSArray *)self->_sidecarDeletes count];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)BCIngestSidecarPlistProducer;
    LOBYTE(v3) = [(BCPlistProducer *)&v5 shouldRetry];
  }
  return v3;
}

- (id)produceData
{
  v4 = +[NSMutableDictionary dictionaryWithContentsOfFile:self->super._path];
  uint64_t v5 = objc_opt_class();
  id v6 = (void *)BCDynamicCast(v5, (uint64_t)[(NSMutableDictionary *)v4 objectForKey:@"Books"]);

  v33 = self;
  self->_filterMatches = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  if (-[NSArray count](self->_sidecarDeletes, "count") && [v6 count])
  {
    v32 = v4;
    SEL v30 = a2;
    v31 = v6;
    id v7 = [v6 arrayOfDictionariesSortedByKey:@"Path"];
    v8 = [(NSArray *)self->_sidecarDeletes sortedArrayUsingSelector:"compare:"];
    NSUInteger v9 = [(NSArray *)v8 count];
    id v10 = [(NSArray *)v8 objectAtIndex:0];
    id obj = v7;
    id v36 = +[NSMutableArray array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v11 = [v7 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = 0;
      uint64_t v34 = 0;
      uint64_t v14 = *(void *)v38;
      do
      {
        v15 = 0;
        do
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v15);
          uint64_t v17 = objc_opt_class();
          v18 = (void *)BCDynamicCast(v17, v16);
          uint64_t v19 = objc_opt_class();
          v20 = (void *)BCDynamicCast(v19, (uint64_t)[v18 objectForKey:@"Path"]);
          if ([v20 length]) {
            BOOL v21 = v10 == 0;
          }
          else {
            BOOL v21 = 1;
          }
          if (v21)
          {
LABEL_20:
            [v36 addObject:v18];
          }
          else
          {
            while (1)
            {
              v22 = (char *)[v10 compare:v20];
              if (v22 != (char *)-1) {
                break;
              }
              if (++v13 >= v9)
              {
                id v10 = 0;
                goto LABEL_20;
              }
              id v10 = [(NSArray *)v8 objectAtIndex:v13];
            }
            if (v22 == (unsigned char *)&dword_0 + 1) {
              goto LABEL_20;
            }
            if (!v22)
            {
              [(NSMutableArray *)v33->_filterMatches addObject:v20];
              ++v34;
              if (++v13 >= v9) {
                id v10 = 0;
              }
              else {
                id v10 = [(NSArray *)v8 objectAtIndex:v13];
              }
            }
          }
          v15 = (char *)v15 + 1;
        }
        while (v15 != v12);
        id v23 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
        id v12 = v23;
      }
      while (v23);
    }
    else
    {
      uint64_t v34 = 0;
    }
    v24 = BCDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [v31 count];
      NSUInteger v26 = [(NSArray *)v33->_sidecarDeletes count];
      id v27 = [v36 count];
      *(_DWORD *)buf = 134218752;
      id v42 = v25;
      __int16 v43 = 2048;
      NSUInteger v44 = v26;
      __int16 v45 = 2048;
      id v46 = v27;
      __int16 v47 = 2048;
      uint64_t v48 = v34;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Unfiltered: %lu; Filter: %lu; Filtered: %lu; Filter Hit: %lu",
        buf,
        0x2Au);
    }
    v28 = (char *)[v36 count] + v34;
    if (v28 == [v31 count])
    {
      if (v34)
      {
LABEL_32:
        v4 = v32;
        [(NSMutableDictionary *)v32 setObject:v36 forKey:@"Books"];
        return v4;
      }
    }
    else
    {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v30, v33, @"BCIngestSidecarPlistProducer.m", 143, @"Unexpected Counts: Unfiltered: %lu; Filter: %lu; Filtered: %lu; Filter Hit: %lu",
        [v31 count],
        [(NSArray *)v33->_sidecarDeletes count],
        [v36 count],
        v34);
      if (v34) {
        goto LABEL_32;
      }
    }
    v33->super._dataUnchanged = 1;
    return v32;
  }
  self->super._dataUnchanged = 1;
  return v4;
}

- (NSArray)filterMatches
{
  return &self->_filterMatches->super;
}

@end