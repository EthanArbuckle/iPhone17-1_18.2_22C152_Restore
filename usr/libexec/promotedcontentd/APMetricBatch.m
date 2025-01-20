@interface APMetricBatch
+ (BOOL)removeBatchByFileSystemToken:(id)a3;
- (APJourneyBatchSettings)journeyBatchSettings;
- (APMetricBatch)initWithDestination:(id)a3 purpose:(int64_t)a4;
- (APMetricBatch)initWithPath:(id)a3;
- (APStorageFile)secureFile;
- (BOOL)shouldRotate;
- (BOOL)writable;
- (NSArray)metrics;
- (NSMutableArray)storage;
- (NSString)destinationHash;
- (NSString)identifier;
- (NSString)path;
- (id)_closedFileDirectory;
- (id)_closedFilePath;
- (id)_destinationHashFromPath:(id)a3;
- (id)_openFileDirectory;
- (id)_openFilePath;
- (id)_purposeFromPath:(id)a3;
- (id)eCServerDictionaryRepresentationWithBlock:(id)a3;
- (id)fileSystemToken;
- (id)nextMetric;
- (id)serverDictionaryRepresentationWithBlock:(id)a3;
- (int64_t)purpose;
- (void)_appendMetricToFile:(id)a3;
- (void)_deleteByFilePath:(id)a3;
- (void)close;
- (void)delete;
- (void)receivedMetric:(id)a3;
- (void)setPath:(id)a3;
- (void)setSecureFile:(id)a3;
@end

@implementation APMetricBatch

- (id)_purposeFromPath:(id)a3
{
  id v3 = a3;
  v4 = [(objc_class *)+[MetricsModuleClasses storageClass] closedStoragePathPrefix];
  v5 = [(objc_class *)+[MetricsModuleClasses storageClass] openStoragePathPrefix];
  v6 = v4;
  if (([v3 hasPrefix:v4] & 1) != 0
    || (v6 = v5, ([v3 hasPrefix:v5] & 1) != 0)
    || (v6 = @"s", [v3 hasPrefix:@"s"]))
  {
    v7 = [v3 substringFromIndex:((char *)-[__CFString length](v6, "length") + 1)];
  }
  else
  {
    v7 = 0;
  }
  v8 = [v7 pathComponents];
  if ((unint64_t)[v8 count] < 2)
  {
    v10 = +[NSString stringWithFormat:@"The path (%@) resulted in zero path components somehow!", v3];
    v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138739971;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "The path (%{sensitive}@) resulted in zero path components somehow!", buf, 0xCu);
    }

    APSimulateCrash();
    v9 = 0;
  }
  else
  {
    v9 = [v8 objectAtIndexedSubscript:1];
  }

  return v9;
}

- (id)_destinationHashFromPath:(id)a3
{
  id v3 = a3;
  v4 = [(objc_class *)+[MetricsModuleClasses storageClass] closedStoragePathPrefix];
  v5 = [(objc_class *)+[MetricsModuleClasses storageClass] openStoragePathPrefix];
  v6 = v4;
  if (([v3 hasPrefix:v4] & 1) != 0
    || (v6 = v5, ([v3 hasPrefix:v5] & 1) != 0)
    || (v6 = @"s", [v3 hasPrefix:@"s"]))
  {
    v7 = [v3 substringFromIndex:((char *)-[__CFString length](v6, "length") + 1)];
  }
  else
  {
    v7 = 0;
  }
  v8 = [v7 pathComponents];
  if ([v8 count])
  {
    v9 = [v8 firstObject];
  }
  else
  {
    v10 = +[NSString stringWithFormat:@"The path (%@) resulted in zero path components somehow!", v3];
    v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138739971;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "The path (%{sensitive}@) resulted in zero path components somehow!", buf, 0xCu);
    }

    APSimulateCrash();
    v9 = 0;
  }

  return v9;
}

- (APMetricBatch)initWithPath:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    if (qword_100289B90 != -1) {
      dispatch_once(&qword_100289B90, &stru_1002365E0);
    }
    id v6 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
    id v36 = 0;
    v7 = [v6 fileForReadingAtKeyPath:v5 error:&v36];
    id v8 = v36;
    if (v8)
    {
      v9 = +[NSString stringWithFormat:@"Error unarchiving the contents of the file (%@)! %@", v5, v8];
      v10 = APLogForCategory();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_8:

        APSimulateCrash();
        id v14 = 0;
LABEL_34:

        goto LABEL_35;
      }
      *(_DWORD *)buf = 138740227;
      id v38 = v5;
      __int16 v39 = 2114;
      id v40 = v8;
      v11 = "Error unarchiving the contents of the file (%{sensitive}@)! %{public}@";
      v12 = v10;
      uint32_t v13 = 22;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
      goto LABEL_8;
    }
    if (!v7)
    {
      v9 = +[NSString stringWithFormat:@"We didn't get a file (%@) back from the secure file manager!", v5];
      v10 = APLogForCategory();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      *(_DWORD *)buf = 138739971;
      id v38 = v5;
      v11 = "We didn't get a file (%{sensitive}@) back from the secure file manager!";
      v12 = v10;
      uint32_t v13 = 12;
      goto LABEL_7;
    }
    v9 = [v7 nextObject];
    v15 = [v7 nextObject];
    v35.receiver = self;
    v35.super_class = (Class)APMetricBatch;
    v16 = [(APMetricBatch *)&v35 init];
    self = v16;
    if (v16)
    {
      v17 = [(APMetricBatch *)v16 _destinationHashFromPath:v5];
      destinationHash = self->_destinationHash;
      self->_destinationHash = v17;

      v19 = [(APMetricBatch *)self _purposeFromPath:v5];
      self->_purpose = (int)[v19 intValue];

      self->_writable = 0;
      v20 = objc_alloc_init(APJourneyBatchSettings);
      journeyBatchSettings = self->_journeyBatchSettings;
      self->_journeyBatchSettings = v20;

      objc_storeStrong((id *)&self->_secureFile, v7);
      objc_storeStrong((id *)&self->_path, a3);
    }
    if (v9) {
      BOOL v22 = v15 == 0;
    }
    else {
      BOOL v22 = 1;
    }
    if (v22)
    {
      v23 = APLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138739971;
        id v38 = v5;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "File did not contain at least 2 elements! %{sensitive}@", buf, 0xCu);
      }

      [(APMetricBatch *)self _deleteByFilePath:v5];
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        if (self)
        {
          v25 = [v15 UUIDString];
          v26 = +[NSString stringWithFormat:@"%@.%@", v9, v25];
          identifier = self->_identifier;
          self->_identifier = v26;
        }
        v28 = APLogForCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = [(APMetricBatch *)self identifier];
          *(_DWORD *)buf = 138543362;
          id v38 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "created closed batch %{public}@", buf, 0xCu);
        }
        id v14 = self;
        goto LABEL_33;
      }
      v30 = APLogForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = objc_opt_class();
        id v34 = v31;
        v32 = [v5 lastPathComponent];
        *(_DWORD *)buf = 138478083;
        id v38 = v31;
        __int16 v39 = 2114;
        id v40 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Expected UUID class type but decrypted type %{private}@ in batch %{public}@, please file a radar", buf, 0x16u);
      }
    }
    id v14 = 0;
LABEL_33:

    goto LABEL_34;
  }
  id v14 = 0;
LABEL_35:

  return v14;
}

- (APMetricBatch)initWithDestination:(id)a3 purpose:(int64_t)a4
{
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)APMetricBatch;
  v7 = [(APMetricBatch *)&v36 init];
  if (!v7) {
    goto LABEL_13;
  }
  id v32 = v6;
  id v8 = [v6 value];
  v9 = +[NSDate date];
  v10 = [v9 yearDayOfYearHourMinute];

  v11 = +[NSUUID UUID];
  v31 = v8;
  objc_storeStrong((id *)&v7->_destinationHash, v8);
  v7->_purpose = a4;
  v12 = [v11 UUIDString];
  uint64_t v13 = +[NSString stringWithFormat:@"%@.%@", v10, v12];
  identifier = v7->_identifier;
  v7->_identifier = (NSString *)v13;

  uint64_t v15 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v10, v11, 0);
  storage = v7->_storage;
  v7->_storage = (NSMutableArray *)v15;

  v7->_writable = 1;
  v17 = objc_alloc_init(APJourneyBatchSettings);
  journeyBatchSettings = v7->_journeyBatchSettings;
  v7->_journeyBatchSettings = v17;

  id v19 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
  v20 = [(APMetricBatch *)v7 _openFilePath];
  id v35 = 0;
  v21 = [v19 fileForWritingAtKeyPath:v20 error:&v35];
  id v22 = v35;
  v23 = sub_100118560();
  v24 = [v20 lastPathComponent];
  sub_100118640((uint64_t)v23, v24, a4);

  if (!v22)
  {
    id v34 = 0;
    [v21 addObject:v10 error:&v34];
    id v27 = v34;
    id v33 = v27;
    [v21 addObject:v11 error:&v33];
    id v22 = v33;

    v28 = APLogForCategory();
    v25 = v28;
    if (v22)
    {
      id v6 = v32;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138740227;
        id v38 = v20;
        __int16 v39 = 2114;
        id v40 = v22;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Could not write to file (%{sensitive}@)! Error: %{public}@", buf, 0x16u);
      }
      goto LABEL_6;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = [(APMetricBatch *)v7 identifier];
      *(_DWORD *)buf = 138543362;
      id v38 = v29;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "created open batch %{public}@", buf, 0xCu);
    }
    id v6 = v32;
LABEL_13:
    v26 = v7;
    goto LABEL_14;
  }
  v25 = APLogForCategory();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138740227;
    id v38 = v20;
    __int16 v39 = 2114;
    id v40 = v22;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Could not open file (%{sensitive}@)! Error: %{public}@", buf, 0x16u);
  }
  id v6 = v32;
LABEL_6:

  v26 = 0;
LABEL_14:

  return v26;
}

- (NSArray)metrics
{
  v2 = [(APMetricBatch *)self storage];
  id v3 = v2;
  if (v2)
  {
    v4 = [v2 subarrayWithRange:2, (char *)[v2 count] - 2];
  }
  else
  {
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Accessing 'metrics' property for read only batch is not supported. Please file a radar against Promoted Content | (New Bugs)", v7, 2u);
    }

    v4 = &__NSArray0__struct;
  }

  return (NSArray *)v4;
}

- (id)nextMetric
{
  v2 = [(APMetricBatch *)self secureFile];
  id v3 = [v2 nextObject];

  return v3;
}

- (id)serverDictionaryRepresentationWithBlock:(id)a3
{
  return [(APMetricBatch *)self eCServerDictionaryRepresentationWithBlock:a3];
}

- (id)eCServerDictionaryRepresentationWithBlock:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if ([(APMetricBatch *)self writable])
  {
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Attempt to get a dictionary representation for an open batch!", buf, 2u);
    }

    APSimulateCrash();
    id v6 = 0;
  }
  else
  {
    id v7 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:4];
    uint64_t v9 = [(APMetricBatch *)self nextMetric];
    if (v9)
    {
      v10 = (void *)v9;
      objc_super v36 = self;
      uint64_t v11 = -9999;
      while (1)
      {
        if (v4) {
          v4[2](v4, v10);
        }
        id v12 = [v10 purpose];
        uint64_t v13 = (uint64_t)v12;
        if (v11 != -9999)
        {
          uint64_t v13 = v11;
          if ((id)v11 != v12) {
            break;
          }
        }
        uint64_t v11 = v13;
        id v14 = +[NSString stringWithFormat:@"%ld", v12];
        id v15 = [v7 objectForKey:v14];
        if (!v15)
        {
          id v15 = objc_alloc_init((Class)NSMutableArray);
          [v7 setObject:v15 forKey:v14];
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v16 = [v10 ecServerDictionaryRepresentation];
          if (v16)
          {
            v17 = (void *)v16;
            [v15 addObject:v16];
          }
        }

        v10 = [(APMetricBatch *)v36 nextMetric];
        if (!v10)
        {
          id v35 = v4;
          id v18 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:objc_msgSend(v7, "count")];
          id v19 = [v7 allKeys];
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v20 = [v19 countByEnumeratingWithState:&v37 objects:v44 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v38;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v38 != v22) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                v25 = [v7 objectForKey:v24];
                v26 = +[NSArray arrayWithArray:v25];
                [v18 setObject:v26 forKey:v24];
              }
              id v21 = [v19 countByEnumeratingWithState:&v37 objects:v44 count:16];
            }
            while (v21);
          }
          id v27 = +[NSDictionary dictionaryWithDictionary:v18];
          v42[0] = @"batch";
          v28 = [(APMetricBatch *)v36 identifier];
          v43[0] = v28;
          v42[1] = @"events";
          v29 = +[NSString stringWithFormat:@"%ld", [(APMetricBatch *)v36 purpose]];
          v30 = [v27 objectForKeyedSubscript:v29];
          v43[1] = v30;
          v42[2] = @"purpose";
          v31 = +[NSNumber numberWithInteger:[(APMetricBatch *)v36 purpose]];
          v43[2] = v31;
          id v6 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];

          v4 = v35;
          goto LABEL_32;
        }
      }
      id v33 = APLogForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Purposes don't match", buf, 2u);
      }
    }
    else
    {
      id v32 = APLogForCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Found an empty closed metric batch file!", buf, 2u);
      }
    }
    id v6 = 0;
LABEL_32:
  }

  return v6;
}

- (BOOL)shouldRotate
{
  id v3 = [(APMetricBatch *)self journeyBatchSettings];
  v4 = (char *)[v3 batchSizeUInteger];
  if (v4)
  {
    id v5 = v4;
    id v6 = [(APMetricBatch *)self storage];
    BOOL v7 = [v6 count] >= v5 + 2;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)receivedMetric:(id)a3
{
  id v4 = a3;
  id v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(APMetricBatch *)self identifier];
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "received metric on batch %{public}@", (uint8_t *)&v11, 0xCu);
  }
  if ([(APMetricBatch *)self writable])
  {
    BOOL v7 = [(APMetricBatch *)self storage];
    [v7 addObject:v4];
    [(APMetricBatch *)self _appendMetricToFile:v4];
  }
  else
  {
    uint64_t v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [(APMetricBatch *)self identifier];
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Attempt to write to a closed batch for %{public}@", (uint8_t *)&v11, 0xCu);
    }
    APSimulateCrash();
  }
}

- (id)_closedFileDirectory
{
  id v3 = [(objc_class *)+[MetricsModuleClasses storageClass] closedStoragePathPrefix];
  id v4 = [(APMetricBatch *)self destinationHash];
  id v5 = +[NSNumber numberWithInteger:[(APMetricBatch *)self purpose]];
  id v6 = [v5 stringValue];

  BOOL v7 = [v3 stringByAppendingPathComponent:v4];
  id v8 = [v7 stringByAppendingPathComponent:v6];

  return v8;
}

- (id)_closedFilePath
{
  id v3 = [(APMetricBatch *)self _closedFileDirectory];
  id v4 = [(APMetricBatch *)self identifier];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (id)_openFileDirectory
{
  id v3 = [(objc_class *)+[MetricsModuleClasses storageClass] openStoragePathPrefix];
  id v4 = [(APMetricBatch *)self destinationHash];
  id v5 = +[NSNumber numberWithInteger:[(APMetricBatch *)self purpose]];
  id v6 = [v5 stringValue];

  BOOL v7 = [v3 stringByAppendingPathComponent:v4];
  id v8 = [v7 stringByAppendingPathComponent:v6];

  return v8;
}

- (id)_openFilePath
{
  id v3 = [(APMetricBatch *)self _openFileDirectory];
  id v4 = [(APMetricBatch *)self identifier];
  id v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

- (void)_appendMetricToFile:(id)a3
{
  id v4 = a3;
  id v5 = [(APMetricBatch *)self storage];
  id v6 = [(APMetricBatch *)self _openFilePath];
  id v24 = 0;
  BOOL v7 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v24];
  id v8 = v24;
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    int v11 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
    if (([v11 fileExistsAtPath:v6 error:0] & 1) == 0)
    {
      uint64_t v13 = APLogForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = [(APMetricBatch *)self identifier];
        *(_DWORD *)buf = 138543362;
        id v26 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Trying to append metric to nonexistent file %{public}@", buf, 0xCu);
      }
    }
    id v23 = 0;
    id v15 = [v11 fileForAppendingAtKeyPath:v6 error:&v23];
    id v16 = v23;
    if (v16)
    {
      id v10 = v16;
      v17 = APLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138739971;
        id v26 = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Could not open file (%{sensitive}@)!", buf, 0xCu);
      }
    }
    else
    {
      id v22 = 0;
      [v15 addObject:v4 error:&v22];
      id v10 = v22;
      v17 = +[NSDate date];
      if (v10)
      {
        id v18 = APLogForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543619;
          id v26 = v4;
          __int16 v27 = 2117;
          v28 = v6;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Could not add metric (%{public}@) to file (%{sensitive}@)!", buf, 0x16u);
        }
      }
      else
      {
        id v19 = [v4 timestamp];
        [v17 timeIntervalSinceDate:v19];
        double v21 = v20;

        id v18 = sub_100118560();
        sub_100118BF0(v18, (uint64_t)[v4 purpose], v21);
      }
    }
  }
  else
  {
    id v10 = v8;
    int v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v5 count];
      *(_DWORD *)buf = 134218243;
      id v26 = v12;
      __int16 v27 = 2117;
      v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not archive metrics (%lu) to path (%{sensitive}@)!", buf, 0x16u);
    }
  }
}

- (void)close
{
  self->_writable = 0;
  id v3 = [(APMetricBatch *)self storage];
  id v4 = [v3 count];

  id v5 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
  id v6 = [(APMetricBatch *)self _openFilePath];
  BOOL v7 = [(APMetricBatch *)self _closedFilePath];
  id v8 = sub_100119A0C((uint64_t)APMetricsObservability, v6, v5);
  BOOL v9 = APLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [(APMetricBatch *)self identifier];
    *(_DWORD *)buf = 138543362;
    id v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "close batch %{public}@", buf, 0xCu);
  }
  id v21 = 0;
  unsigned int v11 = [v5 moveItemAtPath:v6 toPath:v7 error:&v21];
  id v12 = v21;
  uint64_t v13 = v12;
  if (v11) {
    BOOL v14 = v12 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    uint64_t v17 = (uint64_t)v4 - 2;
    id v15 = sub_100118560();
    id v18 = [v6 lastPathComponent];
    uint64_t v19 = [(APMetricBatch *)self purpose];
    double v20 = [(objc_class *)+[MetricsModuleClasses storageClass] closedStoragePathPrefix];
    sub_100119440(v15, v8, v18, v19, v17, v5, v20);
  }
  else
  {
    id v15 = +[NSString stringWithFormat:@"Error closing batch! Could not move file from (%@) to (%@)! %@", v6, v7, v12];
    id v16 = APLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740483;
      id v23 = v6;
      __int16 v24 = 2117;
      v25 = v7;
      __int16 v26 = 2114;
      __int16 v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error closing batch! Could not move file from (%{sensitive}@) to (%{sensitive}@)! %{public}@", buf, 0x20u);
    }

    APSimulateCrash();
  }
}

- (void)_deleteByFilePath:(id)a3
{
  id v4 = a3;
  if ([(APMetricBatch *)self writable])
  {
    id v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Attempt to delete an open batch!", v6, 2u);
    }

    APSimulateCrash();
  }
  else
  {
    [(id)objc_opt_class() removeBatchByFileSystemToken:v4];
  }
}

- (void)delete
{
  id v3 = [(APMetricBatch *)self secureFile];
  [v3 close];

  id v4 = [(APMetricBatch *)self _closedFilePath];
  [(APMetricBatch *)self _deleteByFilePath:v4];
}

- (id)fileSystemToken
{
  if ([(APMetricBatch *)self writable])
  {
    id v3 = APLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "fileSystemToken is available for closed batches only!", v8, 2u);
    }

    APSimulateCrash();
    id v4 = &stru_1002392C0;
  }
  else
  {
    id v5 = [(APMetricBatch *)self path];
    id v6 = [v5 length];

    if (v6) {
      [(APMetricBatch *)self path];
    }
    else {
    id v4 = [(APMetricBatch *)self _closedFilePath];
    }
  }

  return v4;
}

+ (BOOL)removeBatchByFileSystemToken:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
    id v5 = sub_100119AC0((uint64_t)APMetricsObservability, v3, v4);
    id v13 = 0;
    unsigned __int8 v6 = [v4 removeObjectAtPath:v3 error:&v13];
    id v7 = v13;
    if (v7) {
      unsigned __int8 v6 = 0;
    }
    if (v6)
    {
      id v8 = sub_100118560();
      BOOL v9 = [v3 lastPathComponent];
      uint64_t v10 = +[APMetricStorage_private batchPathToPurpose:v3];
      unsigned int v11 = [(objc_class *)+[MetricsModuleClasses storageClass] closedStoragePathPrefix];
      sub_10011967C(v8, v5, v9, v10, v4, v11);
    }
    else
    {
      id v8 = APLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error removing file at path! %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (NSString)destinationHash
{
  return self->_destinationHash;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (NSMutableArray)storage
{
  return self->_storage;
}

- (BOOL)writable
{
  return self->_writable;
}

- (APJourneyBatchSettings)journeyBatchSettings
{
  return self->_journeyBatchSettings;
}

- (APStorageFile)secureFile
{
  return self->_secureFile;
}

- (void)setSecureFile:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_secureFile, 0);
  objc_storeStrong((id *)&self->_journeyBatchSettings, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_destinationHash, 0);
}

@end