@interface _PASLazyPlist
+ (BOOL)isLazyPlistLikelyContainedInData:(id)a3 format:(unint64_t *)a4;
+ (BOOL)isLazyPlistLikelyContainedInFileAtPath:(id)a3 format:(unint64_t *)a4;
+ (id)arrayWithData:(id)a3 error:(id *)a4;
+ (id)arrayWithPath:(id)a3 error:(id *)a4;
+ (id)dataWithPropertyList:(id)a3 error:(id *)a4;
+ (id)dataWithPropertyList:(id)a3 format:(unint64_t)a4 error:(id *)a5;
+ (id)deserializationStatsHandler;
+ (id)dictionaryWithData:(id)a3 error:(id *)a4;
+ (id)dictionaryWithPath:(id)a3 error:(id *)a4;
+ (id)fileBackedDataWithPropertyList:(id)a3 appendedToFd:(int)a4 format:(unint64_t)a5 startOfs:(int64_t *)a6 error:(id *)a7;
+ (id)fileBackedDataWithPropertyList:(id)a3 appendedToFd:(int)a4 startOfs:(int64_t *)a5 error:(id *)a6;
+ (id)fileBackedDataWithPropertyList:(id)a3 writtenToPath:(id)a4 error:(id *)a5;
+ (id)fileBackedDataWithPropertyList:(id)a3 writtenToPath:(id)a4 format:(unint64_t)a5 error:(id *)a6;
+ (id)lazyPlistWithPlist:(id)a3;
+ (id)propertyListWithData:(id)a3 error:(id *)a4;
+ (id)propertyListWithData:(uint64_t)a3 needsValidation:(void *)a4 error:;
+ (id)propertyListWithPath:(id)a3 error:(id *)a4;
+ (id)propertyListWithPath:(id)a3 fileRange:(_NSRange)a4 error:(id *)a5;
+ (id)serializationStatsHandler;
+ (void)setDeserializationStatsHandler:(id)a3;
+ (void)setSerializationStatsHandler:(id)a3;
@end

@implementation _PASLazyPlist

+ (id)dictionaryWithPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 propertyListWithPath:v6 error:a4];
  if (!v7) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_7;
  }
  if (a4)
  {
    id v9 = v6;
    v10 = objc_opt_new();
    [v10 setObject:@"The lazy plist archive root object has unexpected type." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v10 setObject:@"The lazy plist archive root object has unexpected type." forKeyedSubscript:*MEMORY[0x1E4F28588]];
    [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28328]];

    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    v12 = (void *)[v10 copy];
    v13 = (void *)[v11 initWithDomain:@"_PASLazyPlistErrorDomain" code:5 userInfo:v12];

    id v8 = 0;
    *a4 = v13;
  }
  else
  {
LABEL_6:
    id v8 = 0;
  }
LABEL_7:

  return v8;
}

+ (id)propertyListWithPath:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"_PASLazyPlist.m", 105, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  id v8 = (void *)MEMORY[0x1A62450A0]();
  id v34 = 0;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v7 options:1 error:&v34];
  id v10 = v34;
  id v11 = v10;
  if (!v9)
  {
    if (v10)
    {
      v15 = [v10 localizedDescription];
    }
    else
    {
      v15 = @"Unable to open the file.";
    }
    fileAccessError(v7, v15);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    if (v11) {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    }
      goto LABEL_27;
    *(_DWORD *)buf = 138412290;
    id v36 = v20;
    v21 = MEMORY[0x1E4F14500];
    goto LABEL_17;
  }
  uint64_t v33 = 0;
  if (([a1 isLazyPlistLikelyContainedInData:v9 format:&v33] & 1) == 0)
  {
    id v16 = v7;
    v17 = objc_opt_new();
    [v17 setObject:@"The file is not a lazy plist archive." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v17 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    [v17 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F28328]];

    id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
    v19 = (void *)[v17 copy];
    id v20 = (id)[v18 initWithDomain:@"_PASLazyPlistErrorDomain" code:2 userInfo:v19];

    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_27:
      v24 = 0;
      goto LABEL_28;
    }
    *(_DWORD *)buf = 138412290;
    id v36 = v20;
    v21 = MEMORY[0x1E4F14500];
LABEL_17:
    _os_log_error_impl(&dword_1A32C4000, v21, OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    goto LABEL_27;
  }
  if (v33 != 2)
  {
    if (v33 == 1)
    {
      v12 = [_PASLPReaderV1 alloc];
      v32 = v11;
      v13 = &v32;
      v14 = &v32;
      goto LABEL_20;
    }
LABEL_24:
    id v20 = v11;
LABEL_25:
    if (v20) {
      goto LABEL_27;
    }
    id v26 = [NSString alloc];
    v27 = objc_msgSend(v26, "initWithFormat:", @"Unsupported format version %tu", v33);
    wrongVersionError(v27);
    id v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    *(_DWORD *)buf = 138412290;
    id v36 = v20;
    v21 = MEMORY[0x1E4F14500];
    goto LABEL_17;
  }
  v22 = self;
  if (![v22 isSubclassOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  v12 = [_PASLPReaderBinaryPlist alloc];
  v31 = v11;
  v13 = &v31;
  v14 = &v31;
LABEL_20:
  v23 = [(_PASLPReaderV1 *)v12 initWithData:v9 sourcedFromPath:v7 needsValidation:1 error:v14];
  id v20 = *v13;

  if (!v23) {
    goto LABEL_25;
  }
  v30 = 0;
  v24 = [(_PASLPReaderV1 *)v23 rootObjectWithErrMsg:&v30];
  if (!v24)
  {
    uint64_t v25 = corruptionError(v7, v30);

    id v20 = (id)v25;
  }

LABEL_28:
  if (a4) {
    *a4 = v20;
  }

  return v24;
}

+ (BOOL)isLazyPlistLikelyContainedInData:(id)a3 format:(unint64_t *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"_PASLazyPlist.m", 427, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  id v8 = (void *)MEMORY[0x1A62450A0]();
  id v9 = self;
  if ([v9 isSubclassOfClass:objc_opt_class()]
    && (unint64_t)[v7 length] >= 6
    && ((uint64_t v10 = [v7 bytes], *(_DWORD *)v10 == 1768714338)
      ? (BOOL v11 = *(unsigned __int16 *)(v10 + 4) == 29811)
      : (BOOL v11 = 0),
        v11))
  {
    if (a4) {
      *a4 = 2;
    }
    BOOL v12 = 1;
  }
  else if ((unint64_t)[v7 length] >= 0x10)
  {
    long long v15 = *(_OWORD *)[v7 bytes];
    BOOL v12 = ((unsigned __int16)v15 ^ 0x4C50 | BYTE2(v15) ^ 0x50) == 0;
    if (a4 && !((unsigned __int16)v15 ^ 0x4C50 | BYTE2(v15) ^ 0x50)) {
      *a4 = BYTE3(v15);
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)deserializationStatsHandler
{
  pthread_mutex_lock(&_statsHandlerLock);
  v2 = (void *)MEMORY[0x1A6245320](_deserializationStatsHandler);
  pthread_mutex_unlock(&_statsHandlerLock);
  v3 = (void *)MEMORY[0x1A6245320](v2);

  return v3;
}

+ (void)setDeserializationStatsHandler:(id)a3
{
  id v3 = a3;
  pthread_mutex_lock(&_statsHandlerLock);
  uint64_t v4 = MEMORY[0x1A6245320](v3);

  v5 = (void *)_deserializationStatsHandler;
  _deserializationStatsHandler = v4;

  pthread_mutex_unlock(&_statsHandlerLock);
}

+ (void)setSerializationStatsHandler:(id)a3
{
  id v3 = a3;
  pthread_mutex_lock(&_statsHandlerLock);
  uint64_t v4 = MEMORY[0x1A6245320](v3);

  v5 = (void *)_serializationStatsHandler;
  _serializationStatsHandler = v4;

  pthread_mutex_unlock(&_statsHandlerLock);
}

+ (id)serializationStatsHandler
{
  pthread_mutex_lock(&_statsHandlerLock);
  v2 = (void *)MEMORY[0x1A6245320](_serializationStatsHandler);
  pthread_mutex_unlock(&_statsHandlerLock);
  id v3 = (void *)MEMORY[0x1A6245320](v2);

  return v3;
}

+ (id)lazyPlistWithPlist:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"_PASLazyPlist.m", 486, @"Invalid parameter not satisfying: %@", @"plist" object file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x1A62450A0]();
  id v7 = NSTemporaryDirectory();
  id v8 = [v7 stringByAppendingPathComponent:@"_PASLazyPlist-memoryopt.plplist-"];

  id v19 = 0;
  id v9 = +[_PASFileUtils mkstempWithPrefix:v8 error:&v19];
  id v10 = v19;
  if (v9)
  {
    id v11 = [v9 path];
    unlink((const char *)[v11 fileSystemRepresentation]);

    BOOL v12 = objc_msgSend(a1, "fileBackedDataWithPropertyList:appendedToFd:startOfs:error:", v5, objc_msgSend(v9, "fd"), 0, 0);
    close([v9 fd]);
    if (v12)
    {
      uint64_t v13 = +[_PASLazyPlist propertyListWithData:needsValidation:error:]((uint64_t)a1, v12, 0, 0);
      v14 = (void *)v13;
      if (v13) {
        long long v15 = (void *)v13;
      }
      else {
        long long v15 = v5;
      }
      id v16 = v15;
    }
    else
    {
      id v16 = v5;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v10;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASLazyPlist: Unable to create tempfile for temporary _PASLazyPlist backing storage: %@", buf, 0xCu);
    }
    id v16 = v5;
  }

  return v16;
}

+ (id)propertyListWithData:(uint64_t)a3 needsValidation:(void *)a4 error:
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = self;
  if (!v6)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:sel_propertyListWithData_needsValidation_error_, v7, @"_PASLazyPlist.m", 52, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  id v8 = (void *)MEMORY[0x1A62450A0]();
  id v9 = [NSString alloc];
  id v10 = v6;
  id v11 = objc_msgSend(v9, "initWithFormat:", @"<NSData buffer %p>", objc_msgSend(v10, "bytes"));
  uint64_t v33 = 0;
  if (([v7 isLazyPlistLikelyContainedInData:v10 format:&v33] & 1) == 0)
  {
    id v15 = v11;
    id v16 = objc_opt_new();
    [v16 setObject:@"The file is not a lazy plist archive." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v16 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    [v16 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F28328]];

    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v18 = (void *)[v16 copy];
    id v19 = (void *)[v17 initWithDomain:@"_PASLazyPlistErrorDomain" code:2 userInfo:v18];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v19;
      id v20 = MEMORY[0x1E4F14500];
      goto LABEL_24;
    }
    goto LABEL_17;
  }
  if (v33 != 2)
  {
    if (v33 == 1)
    {
      BOOL v12 = [_PASLPReaderV1 alloc];
      uint64_t v32 = 0;
      uint64_t v13 = (id *)&v32;
      v14 = &v32;
      goto LABEL_11;
    }
LABEL_16:
    id v26 = [NSString alloc];
    v27 = objc_msgSend(v26, "initWithFormat:", @"Unsupported format version %tu", v33);
    id v19 = wrongVersionError(v27);

    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138412290;
    v35 = v19;
    id v20 = MEMORY[0x1E4F14500];
LABEL_24:
    _os_log_error_impl(&dword_1A32C4000, v20, OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    goto LABEL_17;
  }
  id v21 = self;
  if (![v21 isSubclassOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  BOOL v12 = [_PASLPReaderBinaryPlist alloc];
  uint64_t v31 = 0;
  uint64_t v13 = (id *)&v31;
  v14 = &v31;
LABEL_11:
  uint64_t v22 = [(_PASLPReaderV1 *)v12 initWithData:v10 sourcedFromPath:v11 needsValidation:a3 error:v14];
  id v23 = *v13;
  id v19 = v23;
  if (!v22)
  {
    if (!v23) {
      goto LABEL_16;
    }
LABEL_17:
    v24 = 0;
    goto LABEL_18;
  }
  v30 = 0;
  v24 = [(_PASLPReaderV1 *)v22 rootObjectWithErrMsg:&v30];
  if (!v24)
  {
    uint64_t v25 = corruptionError(v11, v30);

    id v19 = (void *)v25;
  }

LABEL_18:
  if (a4) {
    *a4 = v19;
  }

  return v24;
}

+ (BOOL)isLazyPlistLikelyContainedInFileAtPath:(id)a3 format:(unint64_t *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"_PASLazyPlist.m", 458, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  id v8 = (void *)MEMORY[0x1A62450A0]();
  id v14 = 0;
  id v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7 options:1 error:&v14];
  id v10 = v14;
  if (v9)
  {
    char v11 = [a1 isLazyPlistLikelyContainedInData:v9 format:a4];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v10;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASLazyPlist: Unable to load file \"%@\": %@", buf, 0x16u);
    }
    char v11 = 0;
  }

  return v11;
}

+ (id)fileBackedDataWithPropertyList:(id)a3 appendedToFd:(int)a4 startOfs:(int64_t *)a5 error:(id *)a6
{
  return (id)[a1 fileBackedDataWithPropertyList:a3 appendedToFd:*(void *)&a4 format:1 startOfs:a5 error:a6];
}

+ (id)fileBackedDataWithPropertyList:(id)a3 appendedToFd:(int)a4 format:(unint64_t)a5 startOfs:(int64_t *)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  if (a5 == 1)
  {
    a7 = +[_PASLPWriterV1 fileBackedDataWithPropertyList:v11 appendedToFd:v10 startOfs:a6 error:a7];
  }
  else if (a7)
  {
    BOOL v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"version code %tu is unsupported", a5);
    wrongVersionError(v12);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    a7 = 0;
  }

  return a7;
}

+ (id)fileBackedDataWithPropertyList:(id)a3 writtenToPath:(id)a4 error:(id *)a5
{
  return (id)[a1 fileBackedDataWithPropertyList:a3 writtenToPath:a4 format:1 error:a5];
}

+ (id)fileBackedDataWithPropertyList:(id)a3 writtenToPath:(id)a4 format:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  if (a5 == 1)
  {
    a6 = +[_PASLPWriterV1 fileBackedDataWithPropertyList:v9 writtenToPath:v10 error:a6];
  }
  else if (a6)
  {
    id v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"version code %tu is unsupported", a5);
    wrongVersionError(v11);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }

  return a6;
}

+ (id)dataWithPropertyList:(id)a3 error:(id *)a4
{
  return (id)[a1 dataWithPropertyList:a3 format:1 error:a4];
}

+ (id)dataWithPropertyList:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      id v9 = +[_PASLPWriterV1 dataWithPropertyList:v8 error:a5];
      goto LABEL_24;
    }
    goto LABEL_11;
  }
  id v10 = self;
  if (![v10 isSubclassOfClass:objc_opt_class()])
  {
LABEL_11:
    if (a5)
    {
      id v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"version code %tu is unsupported", a4);
      wrongVersionError(v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v9 = 0;
    goto LABEL_24;
  }
  id v23 = 0;
  id v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v8 format:200 options:0 error:&v23];
  id v12 = v23;
  id v13 = v12;
  if (v11 && !v12)
  {
    id v22 = 0;
    id v14 = +[_PASLazyPlist propertyListWithData:needsValidation:error:]((uint64_t)a1, v11, 1, &v22);
    id v13 = v22;
  }
  if (!v13) {
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t DeepCopy = objc_msgSend(v8, "_pas_unlazyArray");
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t DeepCopy = objc_msgSend(v8, "_pas_unlazyDictionary");
    }
    else
    {
      uint64_t DeepCopy = (uint64_t)CFPropertyListCreateDeepCopy(0, v8, 0);
    }
  }
  __int16 v17 = (void *)DeepCopy;
  if (!DeepCopy) {
    goto LABEL_19;
  }
  id v21 = 0;
  uint64_t v18 = [MEMORY[0x1E4F28F98] dataWithPropertyList:DeepCopy format:200 options:0 error:&v21];
  id v19 = v21;

  id v11 = (id)v18;
  id v13 = v19;
  if (v19)
  {
LABEL_19:
    if (a5)
    {
      id v13 = v13;
      id v9 = 0;
      *a5 = v13;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
LABEL_21:
    id v11 = v11;
    id v13 = 0;
    id v9 = v11;
  }

LABEL_24:

  return v9;
}

+ (id)arrayWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [a1 propertyListWithData:v6 error:a4];
  if (!v7) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a4 = v7;
    goto LABEL_7;
  }
  if (a4)
  {
    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"<NSData buffer %p>", objc_msgSend(v6, "bytes"));
    id v9 = objc_opt_new();
    [v9 setObject:@"The lazy plist archive root object has unexpected type." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v9 setObject:@"The lazy plist archive root object has unexpected type." forKeyedSubscript:*MEMORY[0x1E4F28588]];
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28328]];

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v11 = (void *)[v9 copy];
    id v12 = (void *)[v10 initWithDomain:@"_PASLazyPlistErrorDomain" code:5 userInfo:v11];

    *a4 = v12;
LABEL_6:
    a4 = 0;
  }
LABEL_7:

  return a4;
}

+ (id)arrayWithPath:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [a1 propertyListWithPath:v6 error:a4];
  if (!v7) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_7;
  }
  if (a4)
  {
    id v9 = v6;
    id v10 = objc_opt_new();
    [v10 setObject:@"The lazy plist archive root object has unexpected type." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v10 setObject:@"The lazy plist archive root object has unexpected type." forKeyedSubscript:*MEMORY[0x1E4F28588]];
    [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28328]];

    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v12 = (void *)[v10 copy];
    id v13 = (void *)[v11 initWithDomain:@"_PASLazyPlistErrorDomain" code:5 userInfo:v12];

    id v8 = 0;
    *a4 = v13;
  }
  else
  {
LABEL_6:
    id v8 = 0;
  }
LABEL_7:

  return v8;
}

+ (id)dictionaryWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [a1 propertyListWithData:v6 error:a4];
  if (!v7) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a4 = v7;
    goto LABEL_7;
  }
  if (a4)
  {
    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"<NSData buffer %p>", objc_msgSend(v6, "bytes"));
    id v9 = objc_opt_new();
    [v9 setObject:@"The lazy plist archive root object has unexpected type." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v9 setObject:@"The lazy plist archive root object has unexpected type." forKeyedSubscript:*MEMORY[0x1E4F28588]];
    [v9 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F28328]];

    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v11 = (void *)[v9 copy];
    id v12 = (void *)[v10 initWithDomain:@"_PASLazyPlistErrorDomain" code:5 userInfo:v11];

    *a4 = v12;
LABEL_6:
    a4 = 0;
  }
LABEL_7:

  return a4;
}

+ (id)propertyListWithPath:(id)a3 fileRange:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (!v10)
  {
    uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, a1, @"_PASLazyPlist.m", 166, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  id v11 = (void *)MEMORY[0x1A62450A0]();
  id v38 = 0;
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v10 options:1 error:&v38];
  id v13 = v38;
  id v14 = v13;
  if (!v12)
  {
    if (v13)
    {
      id v16 = [v13 localizedDescription];
    }
    else
    {
      id v16 = @"Unable to open the file.";
    }
    id v15 = fileAccessError(v10, v16);

    if (v14) {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    }
    {
      *(_DWORD *)buf = 138412290;
      v40 = v15;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    }
    goto LABEL_22;
  }
  if (location + length > [v12 length])
  {
    id v15 = fileAccessError(v10, @"Specified file range exceeds actual file length.");

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v15;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    }

LABEL_22:
    uint64_t v25 = 0;
    goto LABEL_23;
  }
  __int16 v17 = objc_msgSend(v12, "subdataWithRange:", location, length);

  uint64_t v37 = 0;
  if (([a1 isLazyPlistLikelyContainedInData:v17 format:&v37] & 1) == 0)
  {
    id v21 = v10;
    id v22 = objc_opt_new();
    [v22 setObject:@"The file is not a lazy plist archive." forKeyedSubscript:*MEMORY[0x1E4F28568]];
    [v22 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F28588]];
    [v22 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F28328]];

    id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
    v24 = (void *)[v22 copy];
    id v15 = (void *)[v23 initWithDomain:@"_PASLazyPlistErrorDomain" code:2 userInfo:v24];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v15;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
    }

    goto LABEL_22;
  }
  if (v37 == 2)
  {
    v27 = self;
    if (![v27 isSubclassOfClass:objc_opt_class()]) {
      goto LABEL_35;
    }
    uint64_t v18 = [_PASLPReaderBinaryPlist alloc];
    v35 = v14;
    id v19 = &v35;
    id v20 = &v35;
  }
  else
  {
    if (v37 != 1) {
      goto LABEL_35;
    }
    uint64_t v18 = [_PASLPReaderV1 alloc];
    uint64_t v36 = v14;
    id v19 = &v36;
    id v20 = &v36;
  }
  v28 = [(_PASLPReaderBinaryPlist *)v18 initWithData:v17 sourcedFromPath:v10 needsValidation:1 error:v20];
  id v29 = *v19;

  if (!v28)
  {
    id v14 = v29;
LABEL_35:
    if (!v14)
    {
      id v31 = [NSString alloc];
      uint64_t v32 = objc_msgSend(v31, "initWithFormat:", @"Unsupported format version %tu", v37);
      id v14 = wrongVersionError(v32);

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v14;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_PASLazyPlist: %@", buf, 0xCu);
      }
    }
    uint64_t v25 = 0;
    goto LABEL_39;
  }
  id v34 = 0;
  uint64_t v25 = [(_PASLPReaderBinaryPlist *)v28 rootObjectWithErrMsg:&v34];
  if (!v25)
  {
    uint64_t v30 = corruptionError(v10, v34);

    id v29 = (id)v30;
  }

  id v14 = v29;
LABEL_39:

  id v15 = v14;
LABEL_23:
  if (a5) {
    *a5 = v15;
  }

  return v25;
}

+ (id)propertyListWithData:(id)a3 error:(id *)a4
{
  return +[_PASLazyPlist propertyListWithData:needsValidation:error:]((uint64_t)a1, a3, 1, a4);
}

@end