@interface MBExtendedAttributes
+ (BOOL)hasAttributesForPath:(id)a3 error:(id *)a4;
+ (BOOL)removeAttributeForKey:(id)a3 forFD:(int)a4 error:(id *)a5;
+ (BOOL)removeAttributeForKey:(id)a3 forPathFSR:(const char *)a4 error:(id *)a5;
+ (BOOL)setAttributes:(id)a3 forFD:(int)a4 error:(id *)a5;
+ (BOOL)setAttributes:(id)a3 forPathFSR:(const char *)a4 error:(id *)a5;
+ (BOOL)setValue:(id)a3 forKey:(id)a4 forFD:(int)a5 error:(id *)a6;
+ (BOOL)setValue:(id)a3 forKey:(id)a4 forPathFSR:(const char *)a5 error:(id *)a6;
+ (id)attributesForFD:(int)a3 error:(id *)a4;
+ (id)attributesForPathFSR:(const char *)a3 error:(id *)a4;
+ (id)keysForFD:(int)a3 error:(id *)a4;
+ (id)keysForPathFSR:(const char *)a3 error:(id *)a4;
+ (id)valueForKey:(id)a3 forFD:(int)a4 error:(id *)a5;
+ (id)valueForKey:(id)a3 forPathFSR:(const char *)a4 error:(id *)a5;
+ (int)xattrOptionsForFD:(int)a3;
+ (int)xattrOptionsForPathFSR:(const char *)a3;
+ (unint64_t)sizeOfAttributes:(id)a3;
@end

@implementation MBExtendedAttributes

+ (int)xattrOptionsForPathFSR:(const char *)a3
{
  memset(&v10, 0, sizeof(v10));
  if (lstat(a3, &v10))
  {
    int v4 = *__error();
    v5 = MBGetDefaultLog();
    v6 = v5;
    if (v4 == 2)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v7 = *__error();
        *(_DWORD *)buf = 136315394;
        v12 = a3;
        __int16 v13 = 1024;
        int v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Failed to lstat %s: %{errno}d", buf, 0x12u);
        __error();
LABEL_10:
        _MBLog();
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = *__error();
      *(_DWORD *)buf = 136315394;
      v12 = a3;
      __int16 v13 = 1024;
      int v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to lstat %s: %{errno}d", buf, 0x12u);
      __error();
      goto LABEL_10;
    }
    return 1;
  }
  if ((v10.st_flags & 0x40000000) != 0) {
    return 33;
  }
  else {
    return 1;
  }
}

+ (int)xattrOptionsForFD:(int)a3
{
  memset(&v7, 0, sizeof(v7));
  if (!fstat(a3, &v7)) {
    return (v7.st_flags >> 25) & 0x20;
  }
  int v4 = MBGetDefaultLog();
  int result = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (result)
  {
    int v6 = *__error();
    *(_DWORD *)buf = 67109376;
    int v9 = a3;
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to stat fd %d: %{errno}d", buf, 0xEu);
    __error();
    _MBLog();
    return 0;
  }
  return result;
}

+ (BOOL)hasAttributesForPath:(id)a3 error:(id *)a4
{
  ssize_t v6 = listxattr((const char *)[a3 fileSystemRepresentation], 0, 0, (int)[a1 xattrOptionsForPathFSR:[a3 fileSystemRepresentation]]);
  if (v6 < 0 && *__error() != 2)
  {
    if (a4)
    {
      id v8 = +[MBError posixErrorWithPath:a3 format:@"listxattr error"];
      BOOL result = 0;
      *a4 = v8;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    return v6 > 0;
  }
  return result;
}

+ (id)keysForPathFSR:(const char *)a3 error:(id *)a4
{
  int v6 = [a1 xattrOptionsForPathFSR:x0];
  ssize_t v7 = listxattr(a3, 0, 0, v6);
  size_t v8 = v7;
  if (v7 < 1)
  {
    if ((v7 & 0x8000000000000000) == 0) {
      return &__NSArray0__struct;
    }
  }
  else
  {
    int v9 = +[NSMutableArray arrayWithCapacity:0];
    __int16 v10 = +[NSMutableData dataWithLength:v8];
    ssize_t v11 = listxattr(a3, (char *)[(NSMutableData *)v10 mutableBytes], v8, v6);
    if ((v11 & 0x8000000000000000) == 0)
    {
      ssize_t v12 = v11;
      [(NSMutableData *)v10 setLength:v11];
      if (v12)
      {
        ssize_t v13 = 0;
        do
        {
          int v14 = (char *)[(NSMutableData *)v10 bytes] + v13;
          [(NSMutableArray *)v9 addObject:+[NSString stringWithUTF8String:v14]];
          v13 += strlen(v14) + 1;
        }
        while (v13 < v12);
      }
      return v9;
    }
  }
  int v9 = 0;
  if (a4) {
    *a4 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", +[NSString mb_stringWithFileSystemRepresentation:a3], @"listxattr error");
  }
  return v9;
}

+ (id)keysForFD:(int)a3 error:(id *)a4
{
  int v6 = [a1 xattrOptionsForFD:];
  ssize_t v7 = flistxattr(a3, 0, 0, v6);
  size_t v8 = v7;
  if (v7 < 1)
  {
    if ((v7 & 0x8000000000000000) == 0) {
      return &__NSArray0__struct;
    }
  }
  else
  {
    int v9 = +[NSMutableArray arrayWithCapacity:0];
    __int16 v10 = +[NSMutableData dataWithLength:v8];
    ssize_t v11 = flistxattr(a3, (char *)[(NSMutableData *)v10 mutableBytes], v8, v6);
    if ((v11 & 0x8000000000000000) == 0)
    {
      ssize_t v12 = v11;
      [(NSMutableData *)v10 setLength:v11];
      if (v12)
      {
        ssize_t v13 = 0;
        do
        {
          int v14 = (char *)[(NSMutableData *)v10 bytes] + v13;
          [(NSMutableArray *)v9 addObject:+[NSString stringWithUTF8String:v14]];
          v13 += strlen(v14) + 1;
        }
        while (v13 < v12);
      }
      return v9;
    }
  }
  int v9 = 0;
  if (a4) {
    *a4 = +[MBError posixErrorWithFormat:@"flistxattr error"];
  }
  return v9;
}

+ (id)valueForKey:(id)a3 forPathFSR:(const char *)a4 error:(id *)a5
{
  size_t v8 = (const char *)[a3 UTF8String];
  int v9 = [a1 xattrOptionsForPathFSR:a4];
  ssize_t v10 = getxattr(a4, v8, 0, 0, 0, v9);
  if (v10 < 0
    || (size_t v11 = v10,
        ssize_t v12 = +[NSMutableData dataWithLength:v10],
        ssize_t v13 = getxattr(a4, v8, [(NSMutableData *)v12 mutableBytes], v11, 0, v9),
        v13 < 0))
  {
    ssize_t v12 = 0;
    if (a5) {
      *a5 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", +[NSString mb_stringWithFileSystemRepresentation:a4], @"getxattr error");
    }
  }
  else
  {
    [(NSMutableData *)v12 setLength:v13];
  }
  return v12;
}

+ (id)valueForKey:(id)a3 forFD:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  size_t v8 = (const char *)[a3 UTF8String];
  int v9 = [a1 xattrOptionsForFD:v6];
  ssize_t v10 = fgetxattr(v6, v8, 0, 0, 0, v9);
  if (v10 < 0
    || (size_t v11 = v10,
        ssize_t v12 = +[NSMutableData dataWithLength:v10],
        ssize_t v13 = fgetxattr(v6, v8, [(NSMutableData *)v12 mutableBytes], v11, 0, v9),
        v13 < 0))
  {
    ssize_t v12 = 0;
    if (a5) {
      *a5 = +[MBError posixErrorWithFormat:@"fgetxattr error"];
    }
  }
  else
  {
    [(NSMutableData *)v12 setLength:v13];
  }
  return v12;
}

+ (id)attributesForPathFSR:(const char *)a3 error:(id *)a4
{
  id v6 = +[MBExtendedAttributes keysForPathFSR:error:](MBExtendedAttributes, "keysForPathFSR:error:");
  if (!v6) {
    return 0;
  }
  ssize_t v7 = v6;
  if (![v6 count]) {
    return &__NSDictionary0__struct;
  }
  size_t v8 = +[NSMutableDictionary dictionaryWithCapacity:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v22;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
      v20 = 0;
      id v14 = +[MBExtendedAttributes valueForKey:forPathFSR:error:](MBExtendedAttributes, "valueForKey:forPathFSR:error:", v13, a3, &v20, v18, v19);
      if (v14)
      {
        [(NSMutableDictionary *)v8 setObject:v14 forKeyedSubscript:v13];
      }
      else
      {
        if (!+[MBError isError:v20 withCode:8])
        {
          if (!+[MBError isError:v20 withCode:24])
          {
            if (a4) {
              *a4 = v20;
            }
            return 0;
          }
          v16 = MBGetDefaultLog();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          *(_DWORD *)buf = 138412546;
          uint64_t v26 = v13;
          __int16 v27 = 2080;
          v28 = a3;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Skipping -- unable to read extended attribute \"%@\" of \"%s\"", buf, 0x16u);
          uint64_t v18 = v13;
          v19 = a3;
          goto LABEL_16;
        }
        v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v26 = v13;
          __int16 v27 = 2080;
          v28 = a3;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Extended attribute \"%@\" removed while getting all attributes of \"%s\"", buf, 0x16u);
          uint64_t v18 = v13;
          v19 = a3;
LABEL_16:
          _MBLog();
        }
      }
LABEL_17:
      if (v10 == (id)++v12)
      {
        id v10 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10) {
          goto LABEL_5;
        }
        return v8;
      }
    }
  }
  return v8;
}

+ (id)attributesForFD:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = +[MBExtendedAttributes keysForFD:error:](MBExtendedAttributes, "keysForFD:error:");
  if (!v6) {
    return 0;
  }
  ssize_t v7 = v6;
  if (![v6 count]) {
    return &__NSDictionary0__struct;
  }
  size_t v8 = +[NSMutableDictionary dictionaryWithCapacity:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
      v19 = 0;
      id v14 = +[MBExtendedAttributes valueForKey:forFD:error:](MBExtendedAttributes, "valueForKey:forFD:error:", v13, v5, &v19, v18);
      if (v14)
      {
        [(NSMutableDictionary *)v8 setObject:v14 forKeyedSubscript:v13];
      }
      else
      {
        if (!+[MBError isError:v19 withCode:8])
        {
          if (!+[MBError isError:v19 withCode:24])
          {
            if (a4) {
              *a4 = v19;
            }
            return 0;
          }
          v16 = MBGetDefaultLog();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_17;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v13;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Skipping -- unable to read extended attribute \"%@\"", buf, 0xCu);
          uint64_t v18 = v13;
          goto LABEL_16;
        }
        v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Extended attribute \"%@\" removed while getting all attributes of file", buf, 0xCu);
          uint64_t v18 = v13;
LABEL_16:
          _MBLog();
        }
      }
LABEL_17:
      if (v10 == (id)++v12)
      {
        id v10 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
        if (v10) {
          goto LABEL_5;
        }
        return v8;
      }
    }
  }
  return v8;
}

+ (BOOL)setValue:(id)a3 forKey:(id)a4 forPathFSR:(const char *)a5 error:(id *)a6
{
  int v8 = setxattr(a5, (const char *)[a4 UTF8String], [a3 bytes], (size_t)[a3 length], 0, 1);
  int v9 = v8;
  if (a6 && v8) {
    *a6 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", +[NSString mb_stringWithFileSystemRepresentation:a5], @"setxattr error");
  }
  return v9 == 0;
}

+ (BOOL)setValue:(id)a3 forKey:(id)a4 forFD:(int)a5 error:(id *)a6
{
  int v7 = fsetxattr(a5, (const char *)[a4 UTF8String], [a3 bytes], (size_t)[a3 length], 0, 0);
  int v8 = v7;
  if (a6 && v7) {
    *a6 = +[MBError posixErrorWithFormat:@"fsetxattr error"];
  }
  return v8 == 0;
}

+ (BOOL)setAttributes:(id)a3 forPathFSR:(const char *)a4 error:(id *)a5
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v8)
  {
    id v9 = v8;
    __int16 v27 = a5;
    uint64_t v10 = *(void *)v29;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(char **)(*((void *)&v28 + 1) + 8 * i);
        id v13 = [a3 objectForKeyedSubscript:v12, v20, v22, v24, v26];
        id v14 = MBGetDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = [v13 length];
          *(_DWORD *)buf = 138412802;
          v33 = v12;
          __int16 v34 = 2080;
          v35 = a4;
          __int16 v36 = 2048;
          id v37 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Setting \"%@\" xattr at %s (%ld)", buf, 0x20u);
          long long v23 = a4;
          id v25 = [v13 length];
          long long v21 = v12;
          _MBLog();
        }
        if (setxattr(a4, (const char *)objc_msgSend(v12, "UTF8String", v21, v23, v25), objc_msgSend(v13, "bytes"), (size_t)objc_msgSend(v13, "length"), 0, 1))
        {
          if (*__error() != 1 || ![v12 isEqualToString:@"com.apple.FinderInfo"])
          {
            if (!v27) {
              return 0;
            }
            id v19 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", +[NSString mb_stringWithFileSystemRepresentation:a4], @"setxattr error");
            BOOL result = 0;
            *__int16 v27 = v19;
            return result;
          }
          v16 = MBGetDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v17 = *__error();
            *(_DWORD *)buf = 136315906;
            v33 = a4;
            __int16 v34 = 2112;
            v35 = v12;
            __int16 v36 = 2112;
            id v37 = v13;
            __int16 v38 = 1024;
            int v39 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "setxattr(\"%s\", \"%@\", %@) error: %{errno}d", buf, 0x26u);
            id v24 = v13;
            uint64_t v26 = *__error();
            long long v20 = a4;
            long long v22 = v12;
            _MBLog();
          }
        }
      }
      id v9 = [a3 countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  return 1;
}

+ (BOOL)setAttributes:(id)a3 forFD:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    long long v22 = a5;
    uint64_t v10 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v13 = [a3 objectForKeyedSubscript:v12, v18, v19, v20, v21];
        if (fsetxattr(v6, (const char *)[v12 UTF8String], objc_msgSend(v13, "bytes"), (size_t)objc_msgSend(v13, "length"), 0, 0))
        {
          if (*__error() != 1 || ![v12 isEqualToString:@"com.apple.FinderInfo"])
          {
            if (!v22) {
              return 0;
            }
            id v17 = +[MBError posixErrorWithFormat:@"fsetxattr error"];
            BOOL result = 0;
            *long long v22 = v17;
            return result;
          }
          id v14 = MBGetDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = *__error();
            *(_DWORD *)buf = 67109890;
            int v28 = v6;
            __int16 v29 = 2112;
            long long v30 = v12;
            __int16 v31 = 2112;
            id v32 = v13;
            __int16 v33 = 1024;
            int v34 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "fsetxattr(%d, \"%@\", %@) error: %{errno}d", buf, 0x22u);
            id v20 = v13;
            uint64_t v21 = *__error();
            uint64_t v18 = v6;
            id v19 = v12;
            _MBLog();
          }
        }
      }
      id v9 = [a3 countByEnumeratingWithState:&v23 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  return 1;
}

+ (BOOL)removeAttributeForKey:(id)a3 forPathFSR:(const char *)a4 error:(id *)a5
{
  int v7 = removexattr(a4, (const char *)[a3 UTF8String], 1);
  int v8 = v7;
  if (a5 && v7) {
    *a5 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", +[NSString mb_stringWithFileSystemRepresentation:a4], @"removexattr error");
  }
  return v8 == 0;
}

+ (BOOL)removeAttributeForKey:(id)a3 forFD:(int)a4 error:(id *)a5
{
  int v6 = fremovexattr(a4, (const char *)[a3 UTF8String], 0);
  int v7 = v6;
  if (a5 && v6) {
    *a5 = +[MBError posixErrorWithFormat:@"fremovexattr error"];
  }
  return v7 == 0;
}

+ (unint64_t)sizeOfAttributes:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  int v6 = 0;
  uint64_t v7 = *(void *)v13;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(a3);
      }
      id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
      uint64_t v10 = &v6[(void)[v9 lengthOfBytesUsingEncoding:4]];
      int v6 = [(char *)[a3 objectForKeyedSubscript:v9] length] + v10;
    }
    id v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v5);
  return (unint64_t)v6;
}

@end