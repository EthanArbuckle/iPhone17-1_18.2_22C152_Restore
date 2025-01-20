@interface W5PeerDatabaseRequestPayload
+ (id)payloadFromDictionary:(id)a3;
- (NSFetchRequest)fetchRequest;
- (NSNumber)version;
- (NSString)description;
- (W5PeerDatabaseRequestPayload)initWithRequest:(id)a3;
- (id)encode;
- (void)setFetchRequest:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerDatabaseRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerDatabaseRequestPayload)initWithRequest:(id)a3
{
  id v4 = (char *)a3;
  v6 = sub_100099000();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseRequestPayload initWithRequest", (const char *)&unk_1000C730D, buf, 2u);
  }

  v57.receiver = self;
  v57.super_class = (Class)W5PeerDatabaseRequestPayload;
  v7 = [(W5PeerDatabaseRequestPayload *)&v57 init];
  if (!v7) {
    goto LABEL_41;
  }
  v8 = sub_10009756C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v59 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
    __int16 v60 = 2112;
    v61 = v4;
    LODWORD(v52) = 22;
    v51 = buf;
    _os_log_send_and_compose_impl();
  }

  v9 = (NSNumber *)[v4 objectForKey:@"version"];
  v7->_version = v9;
  if (!v9)
  {
LABEL_41:
    id v11 = 0;
    v30 = 0;
    goto LABEL_35;
  }
  if (![(NSNumber *)v9 isEqualToNumber:&off_1000EBA88])
  {
    if (![(NSNumber *)v7->_version isEqualToNumber:&off_1000EBAA0]) {
      goto LABEL_30;
    }
    v32 = [v4 objectForKey:@"fetchRequestNSDataUncompressed"];

    if (v32)
    {
      uint64_t v33 = [v4 objectForKey:@"fetchRequestNSDataUncompressed"];
      if (v33)
      {
        id v11 = (id)v33;
        v34 = sub_10009756C();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = (char *)[v11 length];
          *(_DWORD *)buf = 136315394;
          v59 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
          __int16 v60 = 2048;
          v61 = v35;
          _os_log_send_and_compose_impl();
        }

        uint64_t v36 = objc_opt_class();
        uint64_t v37 = objc_opt_class();
        v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v36, v37, objc_opt_class(), 0);
        id v55 = 0;
        uint64_t v38 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v14 fromData:v11 error:&v55];
        v30 = (char *)v55;
        fetchRequest = v7->_fetchRequest;
        v7->_fetchRequest = (NSFetchRequest *)v38;
        goto LABEL_24;
      }
      goto LABEL_30;
    }
    v46 = [v4 objectForKey:@"fetchRequestNSData"];

    if (!v46) {
      goto LABEL_30;
    }
  }
  uint64_t v10 = [v4 objectForKey:@"fetchRequestNSData" v51, v52];
  if (!v10)
  {
LABEL_30:
    v14 = sub_10009756C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v59 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
      _os_log_send_and_compose_impl();
    }
    id v11 = 0;
    goto LABEL_33;
  }
  id v11 = (id)v10;
  p_info = &OBJC_METACLASS___W5WiFiPerfLoggingManager.info;
  v13 = +[W5BufferPool sharedW5BufferPool];
  v14 = [v13 getPairOfBuffersFromPool];

  if ((unint64_t)[v14 count] > 1)
  {
    v53 = v4;
    v54 = v5;
    v15 = [v14 firstObject];
    v16 = [v14 lastObject];
    compression_encode_scratch_buffer_size(COMPRESSION_LZFSE);
    fetchRequest = v15;
    v18 = (uint8_t *)[(NSFetchRequest *)fetchRequest mutableBytes];
    id v19 = [(NSFetchRequest *)fetchRequest length];
    id v11 = v11;
    v20 = (const uint8_t *)[v11 bytes];
    id v21 = [v11 length];
    id v22 = v16;
    size_t v23 = compression_decode_buffer(v18, (size_t)v19, v20, (size_t)v21, [v22 mutableBytes], COMPRESSION_LZFSE);
    v24 = sub_10009756C();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v25)
      {
        id v26 = [v11 length];
        *(_DWORD *)buf = 136315650;
        v59 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
        __int16 v60 = 2048;
        v61 = (char *)v23;
        __int16 v62 = 2048;
        id v63 = v26;
        _os_log_send_and_compose_impl();
      }

      [(NSFetchRequest *)fetchRequest setLength:v23];
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = objc_opt_class();
      v24 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v27, v28, objc_opt_class(), 0);
      id v56 = 0;
      uint64_t v29 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v24 fromData:fetchRequest error:&v56];
      v30 = (char *)v56;
      v31 = v7->_fetchRequest;
      v7->_fetchRequest = (NSFetchRequest *)v29;

      id v4 = v53;
      p_info = (__objc2_class_ro **)(&OBJC_METACLASS___W5WiFiPerfLoggingManager + 32);
    }
    else
    {
      if (v25)
      {
        id v39 = [v11 length];
        *(_DWORD *)buf = 136315650;
        v59 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
        __int16 v60 = 2048;
        v61 = 0;
        __int16 v62 = 2048;
        id v63 = v39;
        _os_log_send_and_compose_impl();
      }
      v30 = 0;
      id v4 = v53;
    }

    v40 = [p_info + 11 sharedW5BufferPool];
    [v40 returnBufferToPool:fetchRequest];

    v41 = [p_info + 11 sharedW5BufferPool];
    [v41 returnBufferToPool:v22];

    v5 = v54;
LABEL_24:

    v42 = v7->_fetchRequest;
    v14 = sub_10009756C();
    BOOL v43 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v42)
    {
      if (v43)
      {
        v44 = (char *)[v11 length];
        *(_DWORD *)buf = 136315394;
        v59 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
        __int16 v60 = 2048;
        v61 = v44;
        _os_log_send_and_compose_impl();
      }

      v45 = sub_100099000();
      if (os_signpost_enabled(v45))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseRequestPayload initWithRequest", "Success", buf, 2u);
      }
      goto LABEL_40;
    }
    if (v43)
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
      __int16 v60 = 2112;
      v61 = v30;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_34;
  }
  v50 = sub_10009756C();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v59 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
    _os_log_send_and_compose_impl();
  }

LABEL_33:
  v30 = 0;
LABEL_34:

LABEL_35:
  v47 = sub_10009756C();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v59 = "-[W5PeerDatabaseRequestPayload initWithRequest:]";
    __int16 v60 = 2112;
    v61 = v30;
    _os_log_send_and_compose_impl();
  }

  v45 = sub_100099000();
  if (os_signpost_enabled(v45))
  {
    *(_DWORD *)buf = 138412290;
    v59 = v30;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseRequestPayload initWithRequest", "Error=%@", buf, 0xCu);
  }
  v7 = 0;
LABEL_40:

  v48 = v7;

  return v48;
}

- (id)encode
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = sub_100099000();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseRequestPayload encode", (const char *)&unk_1000C730D, buf, 2u);
  }

  if (!self->_version)
  {
    id v11 = sub_10009756C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v46 = "-[W5PeerDatabaseRequestPayload encode]";
      _os_log_send_and_compose_impl();
    }
    v8 = 0;
    id v9 = 0;
    goto LABEL_28;
  }
  v6 = [(W5PeerDatabaseRequestPayload *)self version];
  [v4 setObject:v6 forKey:@"version"];

  v7 = [(W5PeerDatabaseRequestPayload *)self fetchRequest];
  id v44 = 0;
  v8 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v44];
  id v9 = v44;

  if (!v8)
  {
    id v11 = sub_10009756C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[W5PeerDatabaseRequestPayload encode]";
      __int16 v47 = 2112;
      size_t v48 = (size_t)v9;
      _os_log_send_and_compose_impl();
    }
    v8 = 0;
    goto LABEL_28;
  }
  if ([(NSNumber *)self->_version isEqualToNumber:&off_1000EBA88]) {
    goto LABEL_8;
  }
  if ([(NSNumber *)self->_version isEqualToNumber:&off_1000EBAA0])
  {
    if ((unint64_t)[v8 length] >= 0x2801)
    {
LABEL_8:
      uint64_t v10 = +[W5BufferPool sharedW5BufferPool];
      id v11 = [v10 getPairOfBuffersFromPool];

      if ((unint64_t)[v11 count] <= 1)
      {
        uint64_t v37 = sub_10009756C();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v46 = "-[W5PeerDatabaseRequestPayload encode]";
          _os_log_send_and_compose_impl();
        }

        goto LABEL_28;
      }
      id v42 = v9;
      BOOL v43 = v3;
      v12 = [v11 firstObject];
      v13 = [v11 lastObject];
      compression_encode_scratch_buffer_size(COMPRESSION_LZFSE);
      id v14 = v12;
      v15 = (uint8_t *)[v14 mutableBytes];
      id v16 = [v14 length];
      id v17 = v8;
      v18 = (const uint8_t *)[v17 bytes];
      id v19 = [v17 length];
      id v20 = v13;
      size_t v21 = compression_encode_buffer(v15, (size_t)v16, v18, (size_t)v19, [v20 mutableBytes], COMPRESSION_LZFSE);
      id v22 = sub_10009756C();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v23)
        {
          id v24 = [v17 length];
          *(_DWORD *)buf = 136315650;
          v46 = "-[W5PeerDatabaseRequestPayload encode]";
          __int16 v47 = 2048;
          size_t v48 = v21;
          __int16 v49 = 2048;
          id v50 = v24;
          LODWORD(v41) = 32;
          v40 = buf;
          _os_log_send_and_compose_impl();
        }

        id v22 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v14 mutableBytes], v21);
        [v4 setObject:v22 forKey:@"fetchRequestNSData"];
      }
      else if (v23)
      {
        id v25 = [v17 length];
        id v26 = [v14 length];
        id v27 = [v20 length];
        *(_DWORD *)buf = 136315906;
        v46 = "-[W5PeerDatabaseRequestPayload encode]";
        __int16 v47 = 2048;
        size_t v48 = (size_t)v25;
        __int16 v49 = 2048;
        id v50 = v26;
        __int16 v51 = 2048;
        id v52 = v27;
        LODWORD(v41) = 42;
        v40 = buf;
        _os_log_send_and_compose_impl();
      }
      id v9 = v42;
      id v3 = v43;

      uint64_t v28 = +[W5BufferPool sharedW5BufferPool];
      [v28 returnBufferToPool:v14];

      uint64_t v29 = +[W5BufferPool sharedW5BufferPool];
      [v29 returnBufferToPool:v20];

      goto LABEL_16;
    }
    v35 = sub_10009756C();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = [v8 length];
      *(_DWORD *)buf = 136315394;
      v46 = "-[W5PeerDatabaseRequestPayload encode]";
      __int16 v47 = 2048;
      size_t v48 = (size_t)v36;
      LODWORD(v41) = 22;
      v40 = buf;
      _os_log_send_and_compose_impl();
    }

    [v4 setObject:v8 forKey:@"fetchRequestNSDataUncompressed"];
  }
LABEL_16:
  v30 = [v4 objectForKeyedSubscript:@"fetchRequestNSData" withObjects:v40, v41];
  if (v30)
  {

LABEL_19:
    v32 = sub_100099000();
    if (!os_signpost_enabled(v32)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    uint64_t v33 = "Success";
    goto LABEL_21;
  }
  v31 = [v4 objectForKeyedSubscript:@"fetchRequestNSDataUncompressed"];

  if (v31) {
    goto LABEL_19;
  }
  id v11 = sub_10009756C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[W5PeerDatabaseRequestPayload encode]";
    _os_log_send_and_compose_impl();
  }
LABEL_28:

  v32 = sub_100099000();
  if (os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    uint64_t v33 = "Error";
LABEL_21:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerDatabaseRequestPayload encode", v33, buf, 2u);
  }
LABEL_22:

  if (![v4 count])
  {
    uint64_t v38 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s: empty payload", "-[W5PeerDatabaseRequestPayload encode]");
    id v39 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v38 userInfo:0];

    objc_exception_throw(v39);
  }

  return v4;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"W5PeerDatabaseRequestPayload NSFetchRequest %@", self->_fetchRequest];
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end