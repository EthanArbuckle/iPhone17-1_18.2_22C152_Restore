@interface MBErrorInjectorDrive
+ (id)keysFromDictionary:(id)a3 toIndex:(unint64_t)a4;
+ (id)subdictionary:(id)a3 toIndex:(unint64_t)a4;
+ (id)subdictionary:(id)a3 withKeys:(id)a4;
+ (unint64_t)subcountForOperation:(id)a3;
- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)done;
- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4;
- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6;
- (MBErrorInjectorDrive)initWithScript:(id)a3 delegate:(id)a4 index:(unint64_t)a5 subindex:(unint64_t)a6;
- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)count;
- (unint64_t)index;
- (unint64_t)nextIndex;
- (unint64_t)nextSubindex;
- (unint64_t)subcount;
- (unint64_t)subindex;
- (void)dealloc;
@end

@implementation MBErrorInjectorDrive

+ (unint64_t)subcountForOperation:(id)a3
{
  unsigned int v6 = [a3 type];
  if (v6 > 6)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"MBErrorInjectorDrive.m", 40, @"Unexpected operation type: %d", [a3 type]);
    return 0;
  }
  else
  {
    signed int v7 = 1;
    if (((1 << v6) & 0x43) == 0)
    {
      if (((1 << v6) & 0xC) != 0)
      {
        signed int v7 = 2 * [a3 count];
        if (v7 <= 1) {
          return 1;
        }
      }
      else
      {
        int v8 = [a3 count];
        if (v8 <= 1) {
          return 1;
        }
        else {
          return v8;
        }
      }
    }
  }
  return v7;
}

+ (id)keysFromDictionary:(id)a3 toIndex:(unint64_t)a4
{
  if ((unint64_t)[a3 count] <= a4) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:a1 file:@"MBErrorInjectorDrive.m" lineNumber:46 description:@"Index out of range"];
  }
  id v8 = [[objc_msgSend(a3, "allKeys") sortedArrayUsingSelector:@"compare:"];

  return [v8 subarrayWithRange:0, a4];
}

+ (id)subdictionary:(id)a3 withKeys:(id)a4
{
  unsigned int v6 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [a4 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(a4);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", [a3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * (void)v10)], *(void *)(*((void *)&v12 + 1) + 8 * (void)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  return v6;
}

+ (id)subdictionary:(id)a3 toIndex:(unint64_t)a4
{
  id v5 = +[MBErrorInjectorDrive keysFromDictionary:a3 toIndex:a4];

  return +[MBErrorInjectorDrive subdictionary:a3 withKeys:v5];
}

- (MBErrorInjectorDrive)initWithScript:(id)a3 delegate:(id)a4 index:(unint64_t)a5 subindex:(unint64_t)a6
{
  v13.receiver = self;
  v13.super_class = (Class)MBErrorInjectorDrive;
  v11 = [(MBErrorInjectorDrive *)&v13 init];
  if (v11)
  {
    v11->_script = (MBDriveScript *)a3;
    v11->_delegate = (MBDrive *)a4;
    v11->_index = a5;
    if ([(MBErrorInjectorDrive *)v11 count] <= a5) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v11 file:@"MBErrorInjectorDrive.m" lineNumber:71 description:@"Index out of range"];
    }
    v11->_subindex = a6;
    if ([(MBErrorInjectorDrive *)v11 subcount] <= a6) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v11 file:@"MBErrorInjectorDrive.m" lineNumber:74 description:@"Subindex out of range"];
    }
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBErrorInjectorDrive;
  [(MBErrorInjectorDrive *)&v3 dealloc];
}

- (BOOL)done
{
  objc_super v3 = [(MBErrorInjectorDrive *)self index];
  if (v3 != (char *)[(MBErrorInjectorDrive *)self count] - 1) {
    return 0;
  }
  v4 = [(MBErrorInjectorDrive *)self subindex];
  return v4 == (char *)[(MBErrorInjectorDrive *)self subcount] - 1;
}

- (unint64_t)nextIndex
{
  unint64_t v3 = [(MBErrorInjectorDrive *)self subindex];
  v4 = (char *)[(MBErrorInjectorDrive *)self subcount] - 1;
  unint64_t result = [(MBErrorInjectorDrive *)self index];
  if ((char *)v3 == v4) {
    ++result;
  }
  return result;
}

- (unint64_t)count
{
  return [(MBDriveScript *)self->_script operationCount];
}

- (unint64_t)nextSubindex
{
  unint64_t v3 = [(MBErrorInjectorDrive *)self subindex];
  if (v3 == (char *)[(MBErrorInjectorDrive *)self subcount] - 1) {
    return 0;
  }
  else {
    return [(MBErrorInjectorDrive *)self subindex] + 1;
  }
}

- (unint64_t)subcount
{
  id v2 = [(MBDriveScript *)self->_script operationAtIndex:self->_index];

  return +[MBErrorInjectorDrive subcountForOperation:v2];
}

- (BOOL)createDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  if ([(MBDriveScript *)self->_script index] == self->_index)
  {
    if (a5) {
      *a5 = +[MBError errorWithCode:100 format:@"Simulated I/O error"];
    }
    return 0;
  }
  else
  {
    delegate = self->_delegate;
    return [(MBDrive *)delegate createDirectoryAtPath:a3 options:a4 error:a5];
  }
}

- (id)contentsOfDirectoryAtPath:(id)a3 options:(id)a4 error:(id *)a5
{
  if ([(MBDriveScript *)self->_script index] == self->_index)
  {
    if (a5) {
      *a5 = +[MBError errorWithCode:100 format:@"Simulated I/O error"];
    }
    return 0;
  }
  else
  {
    delegate = self->_delegate;
    return [(MBDrive *)delegate contentsOfDirectoryAtPath:a3 options:a4 error:a5];
  }
}

- (BOOL)copyItemAtPath:(id)a3 toPath:(id)a4 options:(id)a5 error:(id *)a6
{
  if ([(MBDriveScript *)self->_script index] == self->_index)
  {
    if (a6) {
      *a6 = +[MBError errorWithCode:100 format:@"Simulated I/O error"];
    }
    return 0;
  }
  else
  {
    delegate = self->_delegate;
    return [(MBDrive *)delegate copyItemAtPath:a3 toPath:a4 options:a5 error:a6];
  }
}

- (BOOL)uploadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  if ([(MBDriveScript *)self->_script index] == self->_index)
  {
    unint64_t subindex = self->_subindex;
    if (subindex >= 2 * (uint64_t)[a3 count]) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBErrorInjectorDrive.m" lineNumber:134 description:@"Subindex out of range"];
    }
    id v13 = [[objc_msgSend(a3, "allKeys") sortedArrayUsingSelector:@"compare:"];
    id v14 = [MBErrorInjectorDrive subdictionary:a3 withKeys:[v13 subarrayWithRange:0, self->_subindex >> 1]];
    unint64_t v15 = self->_subindex;
    if (v15)
    {
      id v16 = [v13 objectAtIndexedSubscript:v15 >> 1];
      id v17 = [a3 objectForKeyedSubscript:v16];
      [v14 setObject:[v17 stringByAppendingPathExtension:kMBUploadFileExtension] forKeyedSubscript:v16];
    }
    unsigned int v18 = [(MBDrive *)self->_delegate uploadFilesAtPaths:v14 options:a4 results:a5 error:a6];
    if (a6)
    {
      if (v18) {
        *a6 = +[MBError errorWithCode:100 format:@"Simulated I/O error"];
      }
    }
    return 0;
  }
  else
  {
    delegate = self->_delegate;
    return [(MBDrive *)delegate uploadFilesAtPaths:a3 options:a4 results:a5 error:a6];
  }
}

- (BOOL)downloadFilesAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  if ([(MBDriveScript *)self->_script index] == self->_index)
  {
    unint64_t subindex = self->_subindex;
    if (subindex >= (unint64_t)[a3 count]) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBErrorInjectorDrive.m" lineNumber:162 description:@"Subindex out of range"];
    }
    unsigned int v13 = [(MBDrive *)self->_delegate uploadFilesAtPaths:+[MBErrorInjectorDrive subdictionary:a3 toIndex:self->_subindex] options:a4 results:a5 error:a6];
    if (a6)
    {
      if (v13) {
        *a6 = +[MBError errorWithCode:100 format:@"Simulated I/O error"];
      }
    }
    return 0;
  }
  else
  {
    delegate = self->_delegate;
    return [(MBDrive *)delegate uploadFilesAtPaths:a3 options:a4 results:a5 error:a6];
  }
}

- (BOOL)moveItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  if ([(MBDriveScript *)self->_script index] == self->_index)
  {
    unint64_t subindex = self->_subindex;
    if (subindex >= (unint64_t)[a3 count]) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBErrorInjectorDrive.m" lineNumber:181 description:@"Subindex out of range"];
    }
    unsigned int v13 = [(MBDrive *)self->_delegate moveItemsAtPaths:+[MBErrorInjectorDrive subdictionary:a3 toIndex:self->_subindex] options:a4 results:a5 error:a6];
    if (a6)
    {
      if (v13) {
        *a6 = +[MBError errorWithCode:100 format:@"Simulated I/O error"];
      }
    }
    return 0;
  }
  else
  {
    delegate = self->_delegate;
    return [(MBDrive *)delegate moveItemsAtPaths:a3 options:a4 results:a5 error:a6];
  }
}

- (BOOL)removeItemsAtPaths:(id)a3 options:(id)a4 results:(id *)a5 error:(id *)a6
{
  long long v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    unint64_t v13 = [(MBDriveScript *)self->_script index];
    unint64_t index = self->_index;
    unint64_t subindex = self->_subindex;
    *(_DWORD *)buf = 138413058;
    id v26 = a3;
    __int16 v27 = 2048;
    unint64_t v28 = v13;
    __int16 v29 = 2048;
    unint64_t v30 = index;
    __int16 v31 = 2048;
    unint64_t v32 = subindex;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "-[MBErrorInjectorDrive remoteItemsAtPath:%@ ...]: %lu %lu %lu", buf, 0x2Au);
    unint64_t v16 = [(MBDriveScript *)self->_script index];
    unint64_t v23 = self->_index;
    unint64_t v24 = self->_subindex;
    id v21 = a3;
    unint64_t v22 = v16;
    _MBLog();
  }
  if ([(MBDriveScript *)self->_script index] != self->_index) {
    return [(MBDrive *)self->_delegate removeItemsAtPaths:a3 options:a4 results:a5 error:a6];
  }
  if (![a3 count]) {
    return 1;
  }
  unint64_t v17 = self->_subindex;
  if (v17 >= (unint64_t)[a3 count]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBErrorInjectorDrive.m" lineNumber:202 description:@"Subindex out of range"];
  }
  unsigned int v18 = [[self->_delegate removeItemsAtPaths:objc_msgSend(a3, "subarrayWithRange:", 0, self->_subindex) options:a4 results:a5 error:a6];
  BOOL result = 0;
  if (a6)
  {
    if (v18)
    {
      v20 = +[MBError errorWithCode:100 format:@"Simulated I/O error"];
      BOOL result = 0;
      *a6 = v20;
    }
  }
  return result;
}

- (BOOL)freeSpace:(unint64_t *)a3 error:(id *)a4
{
  return [(MBDrive *)self->_delegate freeSpace:a3 error:a4];
}

- (unint64_t)index
{
  return self->_index;
}

- (unint64_t)subindex
{
  return self->_subindex;
}

@end