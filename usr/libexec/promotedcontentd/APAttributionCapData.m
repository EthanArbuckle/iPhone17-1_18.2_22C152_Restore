@interface APAttributionCapData
- (BOOL)_loadAllDataFromKeychainForKey:(id)a3 clickCountData:(id *)a4 downloadData:(id *)a5;
- (BOOL)capDataFromKeyChain:(id)a3 adamID:(id)a4;
- (NSString)adMetadata;
- (double)downloadClickTimestamp;
- (double)searchAdClickTimestamp;
- (id)restoreCapDataArrayFromPlist:(id)a3;
- (int64_t)attributionDownloadType;
- (int64_t)clickOrigin;
- (void)_clearCapDownloadDataProperties;
- (void)loadCapData:(id)a3;
- (void)setAdMetadata:(id)a3;
- (void)setAttributionDownloadType:(int64_t)a3;
- (void)setClickOrigin:(int64_t)a3;
- (void)setDownloadClickTimestamp:(double)a3;
- (void)setSearchAdClickTimestamp:(double)a3;
@end

@implementation APAttributionCapData

- (void)loadCapData:(id)a3
{
  id v4 = a3;
  v22[0] = @"ADCapDataKeychainKey";
  v22[1] = @"ADLandingCapDataKeychainKey";
  v22[2] = @"ADIris1CapDataKeychainKey";
  v22[3] = @"ADIris2CapDataKeychainKey";
  v22[4] = @"ADIris3CapDataKeychainKey";
  v22[5] = @"ADFloraCapDataKeychainKey";
  v22[6] = @"ADMetisCapDataKeychainKey";
  +[NSArray arrayWithObjects:v22 count:7];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (!v6)
  {

LABEL_11:
    v13 = APLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [v4 stringValue];
      *(_DWORD *)buf = 138543362;
      v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No Cap data found for adamID %{public}@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  id v7 = v6;
  int v8 = 0;
  uint64_t v9 = *(void *)v16;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
      v8 |= -[APAttributionCapData capDataFromKeyChain:adamID:](self, "capDataFromKeyChain:adamID:", v11, v4, (void)v15);
    }
    id v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  }
  while (v7);

  if ((v8 & 1) == 0) {
    goto LABEL_11;
  }
LABEL_14:
}

- (BOOL)_loadAllDataFromKeychainForKey:(id)a3 clickCountData:(id *)a4 downloadData:(id *)a5
{
  id v8 = a3;
  id v22 = 0;
  v10 = +[APKeychainServices objectForPropertyListKey:v8 error:&v22];
  id v11 = v22;
  if (v10 && [v10 length])
  {
    id v21 = 0;
    v12 = +[NSPropertyListSerialization propertyListWithData:v10 options:0 format:0 error:&v21];
    id v13 = v21;

    if (v13)
    {
      v14 = APLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error restoring cap data %{public}@", buf, 0xCu);
      }

      BOOL v15 = 0;
    }
    else
    {
      long long v18 = [v12 objectForKey:@"ADToroIDKey"];
      BOOL v15 = v18 != 0;
      if (v18)
      {
        if (a4)
        {
          v19 = [v12 objectForKey:@"ADToroClickTypeKey"];
          *a4 = [(APAttributionCapData *)self restoreCapDataArrayFromPlist:v19];
        }
        if (a5)
        {
          v20 = [v12 objectForKey:@"ADDownloadTypeKey"];
          *a5 = [(APAttributionCapData *)self restoreCapDataArrayFromPlist:v20];
        }
      }
      else
      {
        APSimulateCrashNoKillProcess();
      }
    }
  }
  else
  {
    long long v16 = APLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "No data to restore. Initializing an empty Cap Data object.", buf, 2u);
    }

    BOOL v15 = 0;
    v12 = v11;
  }

  return v15;
}

- (BOOL)capDataFromKeyChain:(id)a3 adamID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v84 = 0;
  id v85 = 0;
  unsigned int v9 = [(APAttributionCapData *)self _loadAllDataFromKeychainForKey:v6 clickCountData:&v85 downloadData:&v84];
  unint64_t v10 = (unint64_t)v85;
  id v75 = v84;
  if (!v9)
  {
    BOOL v25 = 0;
    unint64_t v24 = (unint64_t)v75;
    goto LABEL_61;
  }
  id v11 = APLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v7 stringValue];
    *(_DWORD *)buf = 138543362;
    v88 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to attach click information for Adam ID: %{public}@", buf, 0xCu);
  }
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v13 = [(id)v10 reverseObjectEnumerator];
  id v14 = [v13 countByEnumeratingWithState:&v80 objects:v93 count:16];
  unint64_t v72 = v10;
  if (v14)
  {
    id v15 = v14;
    v73 = self;
    id v16 = v6;
    uint64_t v17 = *(void *)v81;
LABEL_6:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v81 != v17) {
        objc_enumerationMutation(v13);
      }
      v19 = *(void **)(*((void *)&v80 + 1) + 8 * v18);
      v20 = [v19 identifier];
      id v21 = [v7 stringValue];
      unsigned int v22 = [v20 isEqualToString:v21];

      if (v22) {
        break;
      }
      if (v15 == (id)++v18)
      {
        id v15 = [v13 countByEnumeratingWithState:&v80 objects:v93 count:16];
        if (v15) {
          goto LABEL_6;
        }
        id v23 = 0;
        id v6 = v16;
        self = v73;
        unint64_t v24 = (unint64_t)v75;
        goto LABEL_30;
      }
    }
    v26 = APLogForCategory();
    id v6 = v16;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [v7 stringValue];
      v28 = [v19 dictionaryRepresentation];
      v29 = [v28 jsonString];
      *(_DWORD *)buf = 138543874;
      v88 = v16;
      __int16 v89 = 2114;
      v90 = v27;
      __int16 v91 = 2114;
      v92 = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Found a click cap object from %{public}@ for Adam ID %{public}@: %{public}@", buf, 0x20u);
    }
    id v23 = v19;

    self = v73;
    if (!v23)
    {
      unint64_t v24 = (unint64_t)v75;
      goto LABEL_31;
    }
    [v23 timestamp];
    double v31 = v30;
    [(APAttributionCapData *)v73 searchAdClickTimestamp];
    unint64_t v24 = (unint64_t)v75;
    if (v31 <= v32) {
      goto LABEL_31;
    }
    v33 = [v23 dictionaryRepresentation];
    v34 = [v33 jsonString];
    id v13 = +[NSString stringWithFormat:@" click cap data with data from %@:\n%@", v6, v34];

    [(APAttributionCapData *)v73 searchAdClickTimestamp];
    double v36 = v35;
    v37 = APLogForCategory();
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
    if (v36 == 0.0)
    {
      if (v38)
      {
        *(_DWORD *)buf = 138543362;
        v88 = v13;
        v39 = "Adding %{public}@";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, v39, buf, 0xCu);
      }
    }
    else if (v38)
    {
      *(_DWORD *)buf = 138543362;
      v88 = v13;
      v39 = "Replacing %{public}@";
      goto LABEL_25;
    }

    [v23 timestamp];
    -[APAttributionCapData setSearchAdClickTimestamp:](v73, "setSearchAdClickTimestamp:");
    v40 = [v23 adMetadata];
    [(APAttributionCapData *)v73 setAdMetadata:v40];

    [(APAttributionCapData *)v73 _clearCapDownloadDataProperties];
    if ([v6 isEqualToString:@"ADCapDataKeychainKey"]) {
      uint64_t v41 = 1;
    }
    else {
      uint64_t v41 = 2;
    }
    [(APAttributionCapData *)v73 setClickOrigin:v41];
    goto LABEL_30;
  }
  id v23 = 0;
  unint64_t v24 = (unint64_t)v75;
LABEL_30:

LABEL_31:
  v42 = APLogForCategory();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v43 = [v7 stringValue];
    *(_DWORD *)buf = 138543362;
    v88 = v43;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Attempting to attach download information for Adam ID: %{public}@", buf, 0xCu);
  }
  v74 = v23;

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v44 = [(id)v24 reverseObjectEnumerator];
  id v45 = [v44 countByEnumeratingWithState:&v76 objects:v86 count:16];
  if (!v45)
  {
    id v53 = 0;
    unint64_t v10 = v72;
    goto LABEL_59;
  }
  id v46 = v45;
  v71 = v6;
  uint64_t v47 = *(void *)v77;
  while (2)
  {
    for (i = 0; i != v46; i = (char *)i + 1)
    {
      if (*(void *)v77 != v47) {
        objc_enumerationMutation(v44);
      }
      v49 = *(void **)(*((void *)&v76 + 1) + 8 * i);
      v50 = [v49 identifier];
      v51 = [v7 stringValue];
      unsigned int v52 = [v50 isEqualToString:v51];

      if (v52)
      {
        v54 = APLogForCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          v55 = [v7 stringValue];
          v56 = [v49 dictionaryRepresentation];
          v57 = [v56 jsonString];
          *(_DWORD *)buf = 138543618;
          v88 = v55;
          __int16 v89 = 2114;
          v90 = v57;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Found a download object for Adam ID %{public}@: %{public}@", buf, 0x16u);
        }
        id v53 = v49;

        id v6 = v71;
        unint64_t v10 = v72;
        if (!v53
          || ([v53 timestamp],
              double v59 = v58,
              [(APAttributionCapData *)self downloadClickTimestamp],
              v59 <= v60))
        {
          unint64_t v24 = (unint64_t)v75;
          goto LABEL_60;
        }
        v61 = [v53 dictionaryRepresentation];
        v62 = [v61 jsonString];
        v44 = +[NSString stringWithFormat:@" download cap data with data from %@:\n%@", v71, v62];

        [(APAttributionCapData *)self downloadClickTimestamp];
        double v64 = v63;
        v65 = APLogForCategory();
        BOOL v66 = os_log_type_enabled(v65, OS_LOG_TYPE_INFO);
        if (v64 == 0.0)
        {
          if (v66)
          {
            *(_DWORD *)buf = 138543362;
            v88 = v44;
            v67 = "Adding %{public}@";
LABEL_53:
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, v67, buf, 0xCu);
          }
        }
        else if (v66)
        {
          *(_DWORD *)buf = 138543362;
          v88 = v44;
          v67 = "Replacing %{public}@";
          goto LABEL_53;
        }

        -[APAttributionCapData setAttributionDownloadType:](self, "setAttributionDownloadType:", [v53 downloadType]);
        [v53 timestamp];
        -[APAttributionCapData setDownloadClickTimestamp:](self, "setDownloadClickTimestamp:");
        v68 = [v53 adMetadata];
        [(APAttributionCapData *)self setAdMetadata:v68];

        if ([v71 isEqualToString:@"ADCapDataKeychainKey"]) {
          uint64_t v69 = 1;
        }
        else {
          uint64_t v69 = 2;
        }
        [(APAttributionCapData *)self setClickOrigin:v69];
        goto LABEL_58;
      }
    }
    id v46 = [v44 countByEnumeratingWithState:&v76 objects:v86 count:16];
    if (v46) {
      continue;
    }
    break;
  }
  id v53 = 0;
  id v6 = v71;
  unint64_t v10 = v72;
LABEL_58:
  unint64_t v24 = (unint64_t)v75;
LABEL_59:

LABEL_60:
  BOOL v25 = (v10 | v24) != 0;

LABEL_61:
  return v25;
}

- (void)_clearCapDownloadDataProperties
{
  [(APAttributionCapData *)self setDownloadClickTimestamp:0.0];

  [(APAttributionCapData *)self setAttributionDownloadType:0];
}

- (id)restoreCapDataArrayFromPlist:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [ADFrequencyCap alloc];
          v12 = -[ADFrequencyCap initWithDictionary:](v11, "initWithDictionary:", v10, (void)v14);
          [v4 addObject:v12];
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }

  return v4;
}

- (double)searchAdClickTimestamp
{
  return self->_searchAdClickTimestamp;
}

- (void)setSearchAdClickTimestamp:(double)a3
{
  self->_searchAdClickTimestamp = a3;
}

- (double)downloadClickTimestamp
{
  return self->_downloadClickTimestamp;
}

- (void)setDownloadClickTimestamp:(double)a3
{
  self->_downloadClickTimestamp = a3;
}

- (NSString)adMetadata
{
  return self->_adMetadata;
}

- (void)setAdMetadata:(id)a3
{
}

- (int64_t)attributionDownloadType
{
  return self->_attributionDownloadType;
}

- (void)setAttributionDownloadType:(int64_t)a3
{
  self->_attributionDownloadType = a3;
}

- (int64_t)clickOrigin
{
  return self->_clickOrigin;
}

- (void)setClickOrigin:(int64_t)a3
{
  self->_clickOrigin = a3;
}

- (void).cxx_destruct
{
}

@end