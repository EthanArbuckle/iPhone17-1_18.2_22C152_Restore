@interface MSDContentFilesUninstallOperation
- (BOOL)_clearDataContainer:(id)a3 ofType:(id)a4;
- (BOOL)_removeContentFiles;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDContentFilesUninstallOperation

- (id)methodSelectors
{
  v2 = +[NSValue valueWithPointer:"_removeContentFiles"];
  v3 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, 0);

  return v3;
}

- (int64_t)type
{
  return 4;
}

- (BOOL)_removeContentFiles
{
  v3 = [(MSDOperation *)self context];
  v4 = [v3 identifier];

  v5 = [(MSDOperation *)self context];
  v6 = [v5 containerType];

  v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    v11 = v4;
    __int16 v12 = 2114;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Deleting content files from container %{public}@ of type %{public}@", (uint8_t *)&v10, 0x16u);
  }

  BOOL v8 = [(MSDContentFilesUninstallOperation *)self _clearDataContainer:v4 ofType:v6];
  return v8;
}

- (BOOL)_clearDataContainer:(id)a3 ofType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v6 isEqualToString:@"AppData"] & 1) == 0
    && ([v6 isEqualToString:@"GroupData"] & 1) == 0
    && ([v6 isEqualToString:@"ExtensionData"] & 1) == 0)
  {
    v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000DE464((uint64_t)v6, v11);
    }

    goto LABEL_14;
  }
  v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v5;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Clearing data container: %{public}@ (%{public}@)", buf, 0x16u);
  }

  id v8 = v5;
  [v8 cStringUsingEncoding:4];
  if (!container_create_or_lookup_for_current_user())
  {
    __int16 v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v17 = v8;
      __int16 v18 = 2114;
      id v19 = v6;
      __int16 v20 = 2048;
      uint64_t v21 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Cannot create container object for %{public}@(%{public}@): %lld", buf, 0x20u);
    }

LABEL_14:
    BOOL v9 = 0;
    goto LABEL_10;
  }
  uint64_t v15 = container_delete_all_container_content();
  BOOL v9 = v15 == 1;
  if (v15 != 1)
  {
    v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v17 = v8;
      __int16 v18 = 2114;
      id v19 = v6;
      __int16 v20 = 2048;
      uint64_t v21 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Cannot remove data for container %{public}@(%{public}@), error code is %lld", buf, 0x20u);
    }
  }
  container_free_object();
LABEL_10:

  return v9;
}

@end