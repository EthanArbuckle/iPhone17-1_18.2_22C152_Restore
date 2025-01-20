@interface NSCache
- (BOOL)rd_writeObject:(id)a3 forKey:(id)a4 toURL:(id)a5 error:(id *)a6;
- (id)rd_objectsForSensor:(id)a3 fallbackURL:(id)a4;
@end

@implementation NSCache

- (id)rd_objectsForSensor:(id)a3 fallbackURL:(id)a4
{
  v7 = -[NSCache objectForKey:](self, "objectForKey:");
  if (!v7)
  {
    v10 = +[NSData dataWithContentsOfURL:a4];
    if (v10)
    {
      v19 = 0;
      id v11 = +[NSPropertyListSerialization propertyListWithData:v10 options:0 format:0 error:&v19];
      if (v11) {
        BOOL v12 = v19 == 0;
      }
      else {
        BOOL v12 = 0;
      }
      if (v12)
      {
        id v13 = v11;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = qword_10006EAA8;
          if (os_log_type_enabled((os_log_t)qword_10006EAA8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            id v21 = v13;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Found plist data: %{public}@", buf, 0xCu);
          }
          v15 = +[NSSet setWithArray:v13];
          goto LABEL_19;
        }
      }
      v16 = qword_10006EAA8;
      if (os_log_type_enabled((os_log_t)qword_10006EAA8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v21 = a3;
        __int16 v22 = 2114;
        v23 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to load client interest for sensor %{public}@, error %{public}@", buf, 0x16u);
      }
    }
    else
    {
      v17 = qword_10006EAA8;
      if (os_log_type_enabled((os_log_t)qword_10006EAA8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = a4;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No data found from URL %{public}@", buf, 0xCu);
      }
    }
    v15 = +[NSSet set];
LABEL_19:
    v8 = v15;
    [(NSCache *)self setObject:v15 forKey:a3];
    return v8;
  }
  v8 = v7;
  v9 = qword_10006EAA8;
  if (os_log_type_enabled((os_log_t)qword_10006EAA8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = a3;
    __int16 v22 = 2114;
    v23 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Found objects in cache for sensor: %{public}@, %{public}@", buf, 0x16u);
  }
  return v8;
}

- (BOOL)rd_writeObject:(id)a3 forKey:(id)a4 toURL:(id)a5 error:(id *)a6
{
  v16 = 0;
  v8 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", [a3 allObjects], 200, 0, &v16);
  v9 = v16;
  if (v8) {
    BOOL v10 = v16 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    unsigned __int8 v12 = [(NSData *)v8 writeToURL:a5 options:1 error:&v16];
    if ((v12 & 1) == 0
      && (v14 = qword_10006EAA8, os_log_type_enabled((os_log_t)qword_10006EAA8, OS_LOG_TYPE_FAULT)))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = a5;
      __int16 v19 = 2114;
      v20 = v16;
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Failed to write %{public}@ because %{public}@", buf, 0x16u);
      if (!a6) {
        return v12;
      }
    }
    else if (!a6)
    {
      return v12;
    }
    id v13 = v16;
    if (v16) {
      goto LABEL_12;
    }
  }
  else
  {
    id v11 = qword_10006EAA8;
    if (os_log_type_enabled((os_log_t)qword_10006EAA8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = a5;
      __int16 v19 = 2114;
      v20 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to serialize %{public}@ because %{public}@", buf, 0x16u);
      unsigned __int8 v12 = 0;
      if (!a6) {
        return v12;
      }
      goto LABEL_7;
    }
    unsigned __int8 v12 = 0;
    if (a6)
    {
LABEL_7:
      id v13 = v16;
LABEL_12:
      *a6 = v13;
    }
  }
  return v12;
}

@end