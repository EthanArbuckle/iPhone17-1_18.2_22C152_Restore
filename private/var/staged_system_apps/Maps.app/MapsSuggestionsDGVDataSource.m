@interface MapsSuggestionsDGVDataSource
- (BOOL)_buildAnnotationsWithDictFromDeserializedJson:(id)a3;
- (BOOL)_buildLinksWithDictFromDeserializedJson:(id)a3;
- (MapsSuggestionsDGVDataSource)initWithJSONString:(id)a3;
- (id)_annotationWithLatitude:(double)a3 longitude:(double)a4;
- (id)_dictFromJSONString:(id)a3;
- (id)_findAnnotationEquivalentToUnserializedJSON:(id)a3;
- (id)annotations;
- (id)linkOverlays;
@end

@implementation MapsSuggestionsDGVDataSource

- (MapsSuggestionsDGVDataSource)initWithJSONString:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MapsSuggestionsDGVDataSource;
  v5 = [(MapsSuggestionsDGVDataSource *)&v17 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    annotations = v5->_annotations;
    v5->_annotations = v6;

    v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    linkOverlays = v5->_linkOverlays;
    v5->_linkOverlays = v8;

    v10 = [(MapsSuggestionsDGVDataSource *)v5 _dictFromJSONString:v4];
    if (!v10)
    {
LABEL_13:
      v13 = 0;
      goto LABEL_14;
    }
    unsigned __int8 v11 = [(MapsSuggestionsDGVDataSource *)v5 _buildAnnotationsWithDictFromDeserializedJson:v10];
    unsigned __int8 v12 = [(MapsSuggestionsDGVDataSource *)v5 _buildLinksWithDictFromDeserializedJson:v10];
    if (v11)
    {
      if (v12)
      {
        v13 = v5;
LABEL_14:

        goto LABEL_15;
      }
      v14 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
      __int16 v20 = 1024;
      int v21 = 42;
      __int16 v22 = 2082;
      v23 = "-[MapsSuggestionsDGVDataSource initWithJSONString:]";
      __int16 v24 = 2082;
      v25 = "linkBuildSuccess == NO";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Destination Graph must build links correctly";
    }
    else
    {
      v14 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
LABEL_12:

        goto LABEL_13;
      }
      *(_DWORD *)buf = 136446978;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
      __int16 v20 = 1024;
      int v21 = 41;
      __int16 v22 = 2082;
      v23 = "-[MapsSuggestionsDGVDataSource initWithJSONString:]";
      __int16 v24 = 2082;
      v25 = "annotationBuildSuccess == NO";
      v15 = "At %{public}s:%d, %{public}s forbids: %{public}s. Destination Graph must build annotations correctly";
    }
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, v15, buf, 0x26u);
    goto LABEL_12;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

- (id)_dictFromJSONString:(id)a3
{
  v3 = [a3 dataUsingEncoding:4];
  uint64_t v8 = 0;
  id v4 = +[NSJSONSerialization JSONObjectWithData:v3 options:1 error:&v8];
  v5 = v4;
  id v6 = 0;
  if (!v8) {
    id v6 = v4;
  }

  return v6;
}

- (BOOL)_buildAnnotationsWithDictFromDeserializedJson:(id)a3
{
  if (!a3)
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      __int16 v22 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
      __int16 v23 = 1024;
      int v24 = 68;
      __int16 v25 = 2082;
      v26 = "-[MapsSuggestionsDGVDataSource _buildAnnotationsWithDictFromDeserializedJson:]";
      __int16 v27 = 2082;
      v28 = "nil == (dict)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Dictionary deserialzied from JSON cannot be nil", buf, 0x26u);
    }
    goto LABEL_17;
  }
  id v4 = [a3 objectForKey:@"destinations"];
  if (!v4)
  {
    v5 = 0;
LABEL_17:
    BOOL v14 = 0;
    goto LABEL_18;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        unsigned __int8 v11 = [MapsSuggestionsDGVAnnotation alloc];
        unsigned __int8 v12 = -[MapsSuggestionsDGVAnnotation initWithDictFromJSONDeserialization:](v11, "initWithDictFromJSONDeserialization:", v10, (void)v16);
        v13 = v12;
        if (!v10)
        {

          BOOL v14 = 0;
          goto LABEL_15;
        }
        [(NSMutableArray *)self->_annotations addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_15:

LABEL_18:
  return v14;
}

- (BOOL)_buildLinksWithDictFromDeserializedJson:(id)a3
{
  if (!a3)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
      __int16 v34 = 1024;
      int v35 = 88;
      __int16 v36 = 2082;
      v37 = "-[MapsSuggestionsDGVDataSource _buildLinksWithDictFromDeserializedJson:]";
      __int16 v38 = 2082;
      v39 = "nil == (dict)";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Dictionary deserialzied from JSON cannot be nil", buf, 0x26u);
    }
    BOOL v21 = 0;
    goto LABEL_34;
  }
  [a3 objectForKey:@"links"];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v5)
  {
    BOOL v21 = 1;
    goto LABEL_33;
  }
  id v7 = v5;
  uint64_t v8 = 0;
  uint64_t v26 = *(void *)v28;
  *(void *)&long long v6 = 136446978;
  long long v24 = v6;
  obj = v4;
  while (2)
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v28 != v26) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      unsigned __int8 v11 = [v10 objectForKey:@"from"];
      uint64_t v12 = [v10 objectForKey:@"to"];
      v13 = v12;
      if (!v11)
      {
        __int16 v22 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v24;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
          __int16 v34 = 1024;
          int v35 = 97;
          __int16 v36 = 2082;
          v37 = "-[MapsSuggestionsDGVDataSource _buildLinksWithDictFromDeserializedJson:]";
          __int16 v38 = 2082;
          v39 = "nil == (unserializedFromDest)";
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Unserialized dictionary must have \"from\" field", buf, 0x26u);
        }

        goto LABEL_31;
      }
      if (!v12)
      {
        v13 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v24;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
          __int16 v34 = 1024;
          int v35 = 98;
          __int16 v36 = 2082;
          v37 = "-[MapsSuggestionsDGVDataSource _buildLinksWithDictFromDeserializedJson:]";
          __int16 v38 = 2082;
          v39 = "nil == (unserializedToDest)";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Unserialized dictionary must have \"to\" field", buf, 0x26u);
        }
LABEL_31:
        id v4 = obj;

        BOOL v21 = 0;
        goto LABEL_33;
      }
      BOOL v14 = [(MapsSuggestionsDGVDataSource *)self _findAnnotationEquivalentToUnserializedJSON:v11];
      uint64_t v15 = [(MapsSuggestionsDGVDataSource *)self _findAnnotationEquivalentToUnserializedJSON:v13];
      long long v16 = (void *)v15;
      if (v14)
      {
        if (v15)
        {
          long long v17 = [[MapsSuggestionsDGVLinkOverlay alloc] initWithFromAnnotation:v14 toAnnotation:v15 index:v8];
          [(NSMutableArray *)self->_linkOverlays addObject:v17];
          ++v8;
          int v18 = 1;
          goto LABEL_18;
        }
        GEOFindOrCreateLog();
        long long v17 = (MapsSuggestionsDGVLinkOverlay *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v17->super.super.super.super, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v24;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
          __int16 v34 = 1024;
          int v35 = 104;
          __int16 v36 = 2082;
          v37 = "-[MapsSuggestionsDGVDataSource _buildLinksWithDictFromDeserializedJson:]";
          __int16 v38 = 2082;
          v39 = "nil == (toDest)";
          p_super = &v17->super.super.super.super;
          __int16 v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. The \"to\" annotation object must be created";
          goto LABEL_16;
        }
      }
      else
      {
        GEOFindOrCreateLog();
        long long v17 = (MapsSuggestionsDGVLinkOverlay *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v17->super.super.super.super, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v24;
          v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
          __int16 v34 = 1024;
          int v35 = 103;
          __int16 v36 = 2082;
          v37 = "-[MapsSuggestionsDGVDataSource _buildLinksWithDictFromDeserializedJson:]";
          __int16 v38 = 2082;
          v39 = "nil == (fromDest)";
          p_super = &v17->super.super.super.super;
          __int16 v20 = "At %{public}s:%d, %{public}s forbids: %{public}s. The \"from\" annotation object must be created";
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_FAULT, v20, buf, 0x26u);
        }
      }
      int v18 = 0;
LABEL_18:

      if (!v18)
      {
        BOOL v21 = 0;
        id v4 = obj;
        goto LABEL_33;
      }
    }
    id v4 = obj;
    id v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    BOOL v21 = 1;
    if (v7) {
      continue;
    }
    break;
  }
LABEL_33:

LABEL_34:
  return v21;
}

- (id)_findAnnotationEquivalentToUnserializedJSON:(id)a3
{
  id v4 = [a3 objectForKey:@"likelyLocation"];
  id v5 = v4;
  if (v4)
  {
    if ([v4 count] == (id)2)
    {
      long long v6 = [v5 objectAtIndex:0];
      [v6 doubleValue];
      double v8 = v7;

      v9 = [v5 objectAtIndex:1];
      [v9 doubleValue];
      double v11 = v10;

      uint64_t v12 = [(MapsSuggestionsDGVDataSource *)self _annotationWithLatitude:v8 longitude:v11];
      goto LABEL_10;
    }
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136446978;
      long long v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
      __int16 v18 = 1024;
      int v19 = 121;
      __int16 v20 = 2082;
      BOOL v21 = "-[MapsSuggestionsDGVDataSource _findAnnotationEquivalentToUnserializedJSON:]";
      __int16 v22 = 2082;
      __int16 v23 = "[likelyLocationCoords count] != 2u";
      BOOL v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Coordinate array must have exactly two items";
      goto LABEL_8;
    }
  }
  else
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v16 = 136446978;
      long long v17 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/Debug/MapsSuggestionsDGVDataSource.m";
      __int16 v18 = 1024;
      int v19 = 120;
      __int16 v20 = 2082;
      BOOL v21 = "-[MapsSuggestionsDGVDataSource _findAnnotationEquivalentToUnserializedJSON:]";
      __int16 v22 = 2082;
      __int16 v23 = "nil == (likelyLocationCoords)";
      BOOL v14 = "At %{public}s:%d, %{public}s forbids: %{public}s. Destination JSON must have likelyLocation coordinates";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v16, 0x26u);
    }
  }

  uint64_t v12 = 0;
LABEL_10:

  return v12;
}

- (id)_annotationWithLatitude:(double)a3 longitude:(double)a4
{
  annotations = self->_annotations;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100507034;
  v9[3] = &unk_1012ED7D0;
  *(double *)&v9[4] = a3;
  *(double *)&v9[5] = a4;
  id v5 = +[NSPredicate predicateWithBlock:v9];
  long long v6 = [(NSMutableArray *)annotations filteredArrayUsingPredicate:v5];

  if ([v6 count] == (id)1)
  {
    double v7 = [v6 firstObject];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)annotations
{
  return self->_annotations;
}

- (id)linkOverlays
{
  return self->_linkOverlays;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkOverlays, 0);

  objc_storeStrong((id *)&self->_annotations, 0);
}

@end