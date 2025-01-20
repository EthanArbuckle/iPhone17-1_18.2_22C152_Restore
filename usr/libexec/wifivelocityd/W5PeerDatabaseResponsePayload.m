@interface W5PeerDatabaseResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSArray)fetchedResults;
- (NSNumber)version;
- (W5PeerDatabaseResponsePayload)initWithRequest:(id)a3;
- (id)convertCSVArrayToKeyValueDictArray:(id)a3;
- (id)convertKeyValueDictArrayToCSVArray:(id)a3;
- (id)encode;
- (int64_t)status;
- (void)setFetchedResults:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerDatabaseResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerDatabaseResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v6 = sub_100099000();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseResponsePayload initWithRequest", (const char *)&unk_1000C730D, buf, 2u);
  }

  v77.receiver = self;
  v77.super_class = (Class)W5PeerDatabaseResponsePayload;
  v7 = [(W5PeerDatabaseResponsePayload *)&v77 init];
  if (!v7
    || (v8 = (NSNumber *)[v4 objectForKey:@"version"],
        (v7->_version = v8) == 0))
  {
    v27 = 0;
    goto LABEL_46;
  }
  v9 = [v4 objectForKey:@"status"];
  v10 = v9;
  if (v9) {
    v7->_status = (int64_t)[v9 integerValue];
  }
  context = v5;
  v74 = v4;
  v72 = v10;
  if (![(NSNumber *)v7->_version isEqualToNumber:&off_1000EBA40])
  {
    if (![(NSNumber *)v7->_version isEqualToNumber:&off_1000EBA58]) {
      goto LABEL_51;
    }
    v11 = [v4 objectForKey:@"peerDatabaseResultsUncompressed"];

    if (v11)
    {
      uint64_t v12 = [v4 objectForKey:@"peerDatabaseResultsUncompressed"];
      if (v12)
      {
        v13 = (void *)v12;
        v70 = v7;
        v14 = sub_10009756C();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = (char *)[v13 length];
          *(_DWORD *)buf = 136315394;
          v79 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
          __int16 v80 = 2048;
          v81 = v15;
          _os_log_send_and_compose_impl();
        }

        uint64_t v16 = objc_opt_class();
        uint64_t v17 = objc_opt_class();
        uint64_t v18 = objc_opt_class();
        v19 = v13;
        uint64_t v20 = objc_opt_class();
        uint64_t v21 = objc_opt_class();
        uint64_t v22 = objc_opt_class();
        uint64_t v23 = objc_opt_class();
        uint64_t v67 = v20;
        id v24 = v19;
        v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, v17, v18, v67, v21, v22, v23, objc_opt_class(), 0);
        id v75 = 0;
        v26 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v25 fromData:v19 error:&v75];
        v27 = (char *)v75;
        v7 = v70;
        goto LABEL_26;
      }
      goto LABEL_51;
    }
    v28 = [v4 objectForKey:@"peerDatabaseResults"];

    if (!v28) {
      goto LABEL_51;
    }
  }
  uint64_t v29 = [v4 objectForKey:@"peerDatabaseResults"];
  if (!v29)
  {
LABEL_51:
    v25 = sub_10009756C();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_44;
    }
    *(_DWORD *)buf = 136315138;
    v79 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
    goto LABEL_40;
  }
  v30 = (void *)v29;
  if (!compression_decode_scratch_buffer_size(COMPRESSION_LZFSE))
  {
    v25 = sub_10009756C();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
LABEL_44:
      v27 = 0;
      goto LABEL_45;
    }
    *(_DWORD *)buf = 136315138;
    v79 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
LABEL_40:
    _os_log_send_and_compose_impl();
    goto LABEL_44;
  }
  v31 = +[W5BufferPool sharedW5BufferPool];
  v25 = [v31 getPairOfBuffersFromPool];

  if ((unint64_t)[v25 count] <= 1)
  {
    v62 = sub_10009756C();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v79 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      _os_log_send_and_compose_impl();
    }

    goto LABEL_44;
  }
  v32 = [v25 firstObject];
  v33 = [v25 lastObject];
  id v34 = v32;
  v35 = (uint8_t *)[v34 mutableBytes];
  id v36 = [v34 length];
  id v24 = v30;
  v37 = (const uint8_t *)[v24 bytes];
  id v38 = [v24 length];
  id v69 = v33;
  size_t v39 = compression_decode_buffer(v35, (size_t)v36, v37, (size_t)v38, [v69 mutableBytes], COMPRESSION_LZFSE);
  v40 = sub_10009756C();
  BOOL v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
  if (v39)
  {
    v71 = v7;
    if (v41)
    {
      id v42 = [v24 length];
      *(_DWORD *)buf = 136315650;
      v79 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      __int16 v80 = 2048;
      v81 = (char *)v39;
      __int16 v82 = 2048;
      id v83 = v42;
      _os_log_send_and_compose_impl();
    }

    [v34 setLength:v39];
    uint64_t v43 = objc_opt_class();
    uint64_t v44 = objc_opt_class();
    uint64_t v45 = objc_opt_class();
    id v46 = v24;
    uint64_t v47 = objc_opt_class();
    uint64_t v48 = objc_opt_class();
    uint64_t v49 = objc_opt_class();
    uint64_t v50 = objc_opt_class();
    uint64_t v68 = v47;
    id v24 = v46;
    v40 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v43, v44, v45, v68, v48, v49, v50, objc_opt_class(), 0);
    id v76 = 0;
    v26 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v40 fromData:v34 error:&v76];
    v27 = (char *)v76;
    v7 = v71;
  }
  else
  {
    if (v41)
    {
      id v51 = [v24 length];
      *(_DWORD *)buf = 136315650;
      v79 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      __int16 v80 = 2048;
      v81 = 0;
      __int16 v82 = 2048;
      id v83 = v51;
      _os_log_send_and_compose_impl();
    }
    v26 = 0;
    v27 = 0;
  }

  v52 = +[W5BufferPool sharedW5BufferPool];
  [v52 returnBufferToPool:v34];

  v53 = +[W5BufferPool sharedW5BufferPool];
  [v53 returnBufferToPool:v69];

LABEL_26:
  if (!v26)
  {
    v25 = sub_10009756C();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    goto LABEL_45;
  }
  uint64_t v54 = [(W5PeerDatabaseResponsePayload *)v7 convertCSVArrayToKeyValueDictArray:v26];
  fetchedResults = v7->_fetchedResults;
  v7->_fetchedResults = (NSArray *)v54;

  v56 = v7->_fetchedResults;
  v25 = sub_10009756C();
  BOOL v57 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (!v56)
  {
    if (v57)
    {
LABEL_37:
      *(_DWORD *)buf = 136315394;
      v79 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      __int16 v80 = 2112;
      v81 = v27;
      _os_log_send_and_compose_impl();
    }
LABEL_45:

LABEL_46:
    v63 = sub_10009756C();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v79 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
      __int16 v80 = 2112;
      v81 = v27;
      _os_log_send_and_compose_impl();
    }

    v64 = sub_100099000();
    if (os_signpost_enabled(v64))
    {
      *(_DWORD *)buf = 138412290;
      v79 = v27;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseResponsePayload initWithRequest", "Error=%@", buf, 0xCu);
    }

    v65 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: BOOL Expression FALSE", "-[W5PeerDatabaseResponsePayload initWithRequest:]");
    id v66 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v65 userInfo:0];

    objc_exception_throw(v66);
  }
  if (v57)
  {
    v58 = (char *)[v24 length];
    *(_DWORD *)buf = 136315394;
    v79 = "-[W5PeerDatabaseResponsePayload initWithRequest:]";
    __int16 v80 = 2048;
    v81 = v58;
    _os_log_send_and_compose_impl();
  }

  v59 = sub_100099000();
  if (os_signpost_enabled(v59))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseResponsePayload initWithRequest", "Success", buf, 2u);
  }

  v60 = v7;

  return v60;
}

- (id)convertCSVArrayToKeyValueDictArray:(id)a3
{
  id v3 = a3;
  id v21 = +[NSMutableArray array];
  id v26 = [v3 firstObject];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v3;
  uint64_t v23 = (char *)[obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v23)
  {
    id v4 = 0;
    uint64_t v22 = *(void *)v32;
    do
    {
      v5 = 0;
      v19 = v4;
      uint64_t v6 = (uint64_t)v4;
      do
      {
        if (*(void *)v32 != v22) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v5);
        if (v6)
        {
          uint64_t v24 = v6;
          v25 = v5;
          v8 = +[NSMutableDictionary dictionary];
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v26 = v26;
          id v9 = [v26 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = 0;
            uint64_t v12 = *(void *)v28;
            do
            {
              for (i = 0; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v28 != v12) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v14 = *(void *)(*((void *)&v27 + 1) + 8 * i);
                v15 = [v7 objectAtIndexedSubscript:i + v11];
                uint64_t v16 = +[NSNull null];

                if (v15 != v16) {
                  [v8 setObject:v15 forKeyedSubscript:v14];
                }
              }
              id v10 = [v26 countByEnumeratingWithState:&v27 objects:v35 count:16];
              v11 += (uint64_t)i;
            }
            while (v10);
          }

          [v21 addObject:v8];
          v5 = v25;
          uint64_t v6 = v24 + 1;
        }
        else
        {
          v8 = v26;
          uint64_t v6 = 1;
          id v26 = v7;
        }

        ++v5;
      }
      while (v5 != v23);
      uint64_t v17 = (char *)[obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      id v4 = &v19[(void)v23];
      uint64_t v23 = v17;
    }
    while (v17);
  }

  return v21;
}

- (id)convertKeyValueDictArrayToCSVArray:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableSet set];
  id v34 = +[NSMutableArray array];
  v5 = +[NSMutableArray array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v49;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v48 + 1) + 8 * i) allKeys];
        uint64_t v12 = +[NSSet setWithArray:v11];
        [v4 unionSet:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v8);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v13 = v4;
  id v14 = [v13 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v45;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(v13);
        }
        [v5 addObject:*(void *)(*((void *)&v44 + 1) + 8 * (void)j)];
      }
      id v15 = [v13 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v15);
  }
  long long v30 = v13;

  [v34 addObject:v5];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v6;
  id v35 = [obj countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v35)
  {
    uint64_t v32 = *(void *)v41;
    long long v33 = v5;
    do
    {
      for (k = 0; k != v35; k = (char *)k + 1)
      {
        if (*(void *)v41 != v32) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v40 + 1) + 8 * (void)k);
        uint64_t v20 = +[NSMutableArray array];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v21 = v5;
        id v22 = [v21 countByEnumeratingWithState:&v36 objects:v52 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v37;
          do
          {
            for (m = 0; m != v23; m = (char *)m + 1)
            {
              if (*(void *)v37 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v36 + 1) + 8 * (void)m);
              long long v27 = [v19 objectForKeyedSubscript:v26];

              if (v27) {
                [v19 objectForKeyedSubscript:v26];
              }
              else {
              long long v28 = +[NSNull null];
              }
              [v20 addObject:v28];
            }
            id v23 = [v21 countByEnumeratingWithState:&v36 objects:v52 count:16];
          }
          while (v23);
        }

        [v34 addObject:v20];
        v5 = v33;
      }
      id v35 = [obj countByEnumeratingWithState:&v40 objects:v53 count:16];
    }
    while (v35);
  }

  return v34;
}

- (id)encode
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = sub_100099000();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseResponsePayload encode", (const char *)&unk_1000C730D, buf, 2u);
  }

  id v6 = sub_10009756C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(W5PeerDatabaseResponsePayload *)self version];
    int64_t v8 = [(W5PeerDatabaseResponsePayload *)self status];
    uint64_t v9 = [(W5PeerDatabaseResponsePayload *)self fetchedResults];
    *(_DWORD *)buf = 136315906;
    id v66 = "-[W5PeerDatabaseResponsePayload encode]";
    __int16 v67 = 2112;
    size_t v68 = (size_t)v7;
    __int16 v69 = 2048;
    int64_t v70 = v8;
    __int16 v71 = 2112;
    id v72 = v9;
    LODWORD(v60) = 42;
    BOOL v57 = buf;
    _os_log_send_and_compose_impl();
  }
  id v10 = [(W5PeerDatabaseResponsePayload *)self version];

  if (!v10)
  {
    long long v27 = sub_10009756C();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_56;
    }
    *(_DWORD *)buf = 136315138;
    id v66 = "-[W5PeerDatabaseResponsePayload encode]";
    LODWORD(v60) = 12;
LABEL_55:
    _os_log_send_and_compose_impl();
    goto LABEL_56;
  }
  uint64_t v11 = [(W5PeerDatabaseResponsePayload *)self version];
  [v4 setObject:v11 forKey:@"version"];

  if (![(W5PeerDatabaseResponsePayload *)self status])
  {
    long long v27 = sub_10009756C();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_56;
    }
    *(_DWORD *)buf = 136315138;
    id v66 = "-[W5PeerDatabaseResponsePayload encode]";
    LODWORD(v60) = 12;
    goto LABEL_55;
  }
  uint64_t v12 = +[NSNumber numberWithInteger:[(W5PeerDatabaseResponsePayload *)self status]];
  [v4 setObject:v12 forKey:@"status"];

  id v13 = [(W5PeerDatabaseResponsePayload *)self fetchedResults];

  if (!v13)
  {
    id v14 = sub_10009756C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v66 = "-[W5PeerDatabaseResponsePayload encode]";
      LODWORD(v60) = 12;
      BOOL v57 = buf;
      _os_log_send_and_compose_impl();
    }
  }
  id v15 = [(W5PeerDatabaseResponsePayload *)self fetchedResults];

  if (!v15)
  {
    long long v27 = sub_10009756C();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_56;
    }
    *(_DWORD *)buf = 136315138;
    id v66 = "-[W5PeerDatabaseResponsePayload encode]";
    LODWORD(v60) = 12;
    goto LABEL_55;
  }
  uint64_t v16 = [(W5PeerDatabaseResponsePayload *)self fetchedResults];
  uint64_t v17 = [(W5PeerDatabaseResponsePayload *)self convertKeyValueDictArrayToCSVArray:v16];

  uint64_t v18 = [(W5PeerDatabaseResponsePayload *)self fetchedResults];
  if (v18)
  {
    v19 = v18;
    if (v17)
    {
      id v20 = [v17 count];

      if (v20) {
        goto LABEL_21;
      }
    }
    else
    {
    }
    id v21 = sub_10009756C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      fetchedResults = self->_fetchedResults;
      *(_DWORD *)buf = 136315650;
      id v66 = "-[W5PeerDatabaseResponsePayload encode]";
      __int16 v67 = 2112;
      size_t v68 = (size_t)v17;
      __int16 v69 = 2112;
      int64_t v70 = (int64_t)fetchedResults;
      LODWORD(v60) = 32;
      v58 = buf;
      _os_log_send_and_compose_impl();
    }
  }
  if (!v17)
  {
    long long v27 = sub_10009756C();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_56;
    }
    *(_DWORD *)buf = 136315138;
    id v66 = "-[W5PeerDatabaseResponsePayload encode]";
    LODWORD(v60) = 12;
    goto LABEL_55;
  }
LABEL_21:
  id v64 = 0;
  uint64_t v23 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v64, v58, v60);
  unint64_t v24 = (unint64_t)v64;
  if (!(v23 | v24))
  {
    long long v27 = sub_10009756C();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v66 = "-[W5PeerDatabaseResponsePayload encode]";
      __int16 v67 = 2112;
      size_t v68 = 0;
      LODWORD(v60) = 22;
      goto LABEL_55;
    }
LABEL_56:

    v52 = sub_100099000();
    if (os_signpost_enabled(v52))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseResponsePayload encode", "Error", buf, 2u);
    }

    NSExceptionName v53 = NSInternalInconsistencyException;
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: BOOL Expression FALSE", "-[W5PeerDatabaseResponsePayload encode]", v60);
    uint64_t v54 = LABEL_59:;
    id v55 = +[NSException exceptionWithName:v53 reason:v54 userInfo:0];

    objc_exception_throw(v55);
  }
  v25 = (void *)v24;
  if ([(NSNumber *)self->_version isEqualToNumber:&off_1000EBA40]) {
    goto LABEL_23;
  }
  if (![(NSNumber *)self->_version isEqualToNumber:&off_1000EBA58]) {
    goto LABEL_36;
  }
  if ((unint64_t)[(id)v23 length] >= 0x2801)
  {
LABEL_23:
    uint64_t v26 = +[W5BufferPool sharedW5BufferPool];
    long long v27 = [v26 getPairOfBuffersFromPool];

    if ((unint64_t)[v27 count] <= 1)
    {
      v56 = sub_10009756C();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v66 = "-[W5PeerDatabaseResponsePayload encode]";
        LODWORD(v60) = 12;
        _os_log_send_and_compose_impl();
      }

      goto LABEL_56;
    }
    v61 = v25;
    v63 = v3;
    long long v28 = [v27 firstObject];
    v62 = v27;
    long long v29 = [v27 lastObject];
    compression_encode_scratch_buffer_size(COMPRESSION_LZFSE);
    id v30 = v28;
    long long v31 = (uint8_t *)[v30 mutableBytes];
    id v32 = [v30 length];
    id v33 = (id) v23;
    id v34 = (const uint8_t *)[v33 bytes];
    id v35 = [v33 length];
    id v36 = v29;
    size_t v37 = compression_encode_buffer(v31, (size_t)v32, v34, (size_t)v35, [v36 mutableBytes], COMPRESSION_LZFSE);
    long long v38 = sub_10009756C();
    BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
    if (v37)
    {
      if (v39)
      {
        id v40 = [v33 length];
        *(_DWORD *)buf = 136315650;
        id v66 = "-[W5PeerDatabaseResponsePayload encode]";
        __int16 v67 = 2048;
        size_t v68 = v37;
        __int16 v69 = 2048;
        int64_t v70 = (int64_t)v40;
        LODWORD(v60) = 32;
        v59 = buf;
        _os_log_send_and_compose_impl();
      }

      long long v38 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v30 mutableBytes], v37);
      [v4 setObject:v38 forKey:@"peerDatabaseResults"];
    }
    else if (v39)
    {
      id v43 = [v33 length];
      id v44 = [v30 length];
      id v45 = [v36 length];
      *(_DWORD *)buf = 136315906;
      id v66 = "-[W5PeerDatabaseResponsePayload encode]";
      __int16 v67 = 2048;
      size_t v68 = (size_t)v43;
      __int16 v69 = 2048;
      int64_t v70 = (int64_t)v44;
      __int16 v71 = 2048;
      id v72 = v45;
      LODWORD(v60) = 42;
      v59 = buf;
      _os_log_send_and_compose_impl();
    }
    v25 = v61;

    long long v46 = +[W5BufferPool sharedW5BufferPool];
    [v46 returnBufferToPool:v30];

    long long v47 = +[W5BufferPool sharedW5BufferPool];
    [v47 returnBufferToPool:v36];

    id v3 = v63;
  }
  else
  {
    long long v41 = sub_10009756C();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      id v42 = [(id)v23 length];
      *(_DWORD *)buf = 136315394;
      id v66 = "-[W5PeerDatabaseResponsePayload encode]";
      __int16 v67 = 2048;
      size_t v68 = (size_t)v42;
      LODWORD(v60) = 22;
      v59 = buf;
      _os_log_send_and_compose_impl();
    }

    [v4 setObject:v23 forKey:@"peerDatabaseResultsUncompressed"];
  }
LABEL_36:
  long long v48 = [v4 objectForKeyedSubscript:@"peerDatabaseResults" v59, v60];
  if (v48)
  {

    goto LABEL_39;
  }
  long long v49 = [v4 objectForKeyedSubscript:@"peerDatabaseResultsUncompressed"];

  if (!v49)
  {
    long long v27 = sub_10009756C();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_56;
    }
    *(_DWORD *)buf = 136315138;
    id v66 = "-[W5PeerDatabaseResponsePayload encode]";
    LODWORD(v60) = 12;
    goto LABEL_55;
  }
LABEL_39:
  long long v50 = sub_100099000();
  if (os_signpost_enabled(v50))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseResponsePayload encode", "Success", buf, 2u);
  }

  if (![v4 count])
  {
    NSExceptionName v53 = NSInternalInconsistencyException;
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: empty payload", "-[W5PeerDatabaseResponsePayload encode]", v60);
    goto LABEL_59;
  }

  return v4;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSArray)fetchedResults
{
  return self->_fetchedResults;
}

- (void)setFetchedResults:(id)a3
{
}

- (void).cxx_destruct
{
}

@end