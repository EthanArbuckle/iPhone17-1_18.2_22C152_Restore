@interface APSponsorshipAdTransformer
- (BOOL)copyContentDataId:(id)a3 toNewContentDataId:(id)a4;
- (BOOL)createContentDataForContextId:(id)a3 contentId:(id)a4 withServerUnfilledReason:(int64_t)a5;
- (id)_createContentDataInternalFrom:(id)a3 newContentDataId:(id)a4;
- (id)_createManagedContextWithId:(id)a3;
@end

@implementation APSponsorshipAdTransformer

- (BOOL)copyContentDataId:(id)a3 toNewContentDataId:(id)a4
{
  id v6 = a4;
  v7 = +[APManagedContentData findById:a3];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 contentData];
    v10 = [v9 contextIdentifier];
    v11 = [v10 UUIDString];

    v12 = +[APManagedContext findManagedContextByFingerprint:v11];
    if (!v12)
    {
      v13 = APLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to find context in the cache", v20, 2u);
      }
      BOOL v15 = 0;
      goto LABEL_18;
    }
    v13 = [(APSponsorshipAdTransformer *)self _createContentDataInternalFrom:v8 newContentDataId:v6];
    if (v13)
    {
      v14 = [v12 addContentData:v13];
      BOOL v15 = v14 != 0;
      if (v14)
      {
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      v16 = APLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to attach new content data to the context", v18, 2u);
      }
    }
    else
    {
      v14 = APLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to copy content data", v19, 2u);
      }
    }
    BOOL v15 = 0;
    goto LABEL_17;
  }
  v11 = APLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to find content data in the cache", buf, 2u);
  }
  BOOL v15 = 0;
LABEL_19:

  return v15;
}

- (id)_createContentDataInternalFrom:(id)a3 newContentDataId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 lockObject];
  v7 = [v5 contentDataPrivate];
  v8 = [v7 impressionIdentifier];
  id v9 = [v8 length];

  if (v9)
  {
    v11 = [v5 contentData];
    uint64_t v12 = objc_opt_class();
    v13 = cloneSecureCodingObject((uint64_t)v11, v12);

    v14 = [v5 contentDataPrivate];
    uint64_t v15 = objc_opt_class();
    v16 = cloneSecureCodingObject((uint64_t)v14, v15);

    v17 = [v5 contentDataTransient];
    uint64_t v18 = objc_opt_class();
    v19 = cloneSecureCodingObject((uint64_t)v17, v18);

    [v5 unlockObject];
    if (v13)
    {
      v40 = v19;
      [v13 setIdentifier:v6];
      v20 = +[NSUUID UUID];
      v21 = [v20 UUIDString];
      [v13 setUniqueIdentifier:v21];

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v22 = [v13 representations];
      id v23 = [v22 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v42;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v42 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            v28 = [v13 identifier];
            [v27 setContentDataIdentifier:v28];
          }
          id v24 = [v22 countByEnumeratingWithState:&v41 objects:v46 count:16];
        }
        while (v24);
      }

      id v29 = [v16 impressionIdentifier];
      v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v29 bytes]);

      if (v30)
      {
        v31 = +[NSUUID UUID];
        v32 = [v31 UUIDString];
        v33 = [v30 stringByAppendingFormat:@"_%@", v32];

        v34 = [v33 dataUsingEncoding:4];
        id v35 = [v34 copy];
        [v16 setImpressionIdentifier:v35];

        v36 = v40;
        v37 = [[APContentDataInternal alloc] initWithContent:v13 privateContent:v16 andTransientContent:v40];
      }
      else
      {
        v33 = APLogForCategory();
        v36 = v40;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Can't parse impressionIdentifier.", buf, 2u);
        }
        v37 = 0;
      }
    }
    else
    {
      v38 = APLogForCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to clone content data.", buf, 2u);
      }

      v37 = 0;
      v13 = v16;
    }
  }
  else
  {
    [v5 unlockObject];
    v13 = APLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "impressionIdentifier is not set.", buf, 2u);
    }
    v37 = 0;
  }

  return v37;
}

- (BOOL)createContentDataForContextId:(id)a3 contentId:(id)a4 withServerUnfilledReason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[APManagedContext findManagedContextByFingerprint:v8];
  if (v10) {
    goto LABEL_6;
  }
  uint64_t v11 = [(APSponsorshipAdTransformer *)self _createManagedContextWithId:v8];
  if (v11)
  {
    v10 = v11;
    uint64_t v12 = APLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v20 = 138543362;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Created new context ctx:[%{public}@] for Legacy Interface Sponsorship Ad metric", (uint8_t *)&v20, 0xCu);
    }

    a5 = 1010;
LABEL_6:
    v13 = [APContentDataInternal alloc];
    id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v8];
    uint64_t v15 = -[APContentDataInternal initWithUnfilledReason:error:contentIdentifier:contextIdentifier:containerSize:placementType:journeyStartRelayValues:](v13, "initWithUnfilledReason:error:contentIdentifier:contextIdentifier:containerSize:placementType:journeyStartRelayValues:", a5, 0, v9, v14, 7, 0, 0.0, 0.0);

    if (v15)
    {
      v16 = [v10 addContentData:v15];
      BOOL v17 = v16 != 0;
      if (v16)
      {
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v18 = APLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to attach new content data to the context", (uint8_t *)&v20, 2u);
      }
    }
    else
    {
      v16 = APLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to create content data with server unfilled reason.", (uint8_t *)&v20, 2u);
      }
    }
    BOOL v17 = 0;
    goto LABEL_14;
  }
  v10 = APLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v20 = 138543362;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create new managed context ctx:[%{public}@] for Legacy Interface metric.", (uint8_t *)&v20, 0xCu);
  }
  BOOL v17 = 0;
LABEL_15:

  return v17;
}

- (id)_createManagedContextWithId:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)APContext);
  id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];

  id v6 = [v4 initWithIdentifier:v5 maxSize:0 requestedAdIdentifier:0 currentContent:0 adjacentContent:0 supplementalContext:0.0, 0.0];
  v7 = +[APIDAccountProvider privateUserAccount];
  id v8 = +[APManagedContext createManagedContextWithContext:v6 idAccount:v7];

  return v8;
}

@end