@interface SATraverse
+ (id)getFileSize:(id)a3;
- (BOOL)popDir:(id *)a3 at:(int64_t *)a4 ofParentPath:(id *)a5;
- (NSMutableSet)knownDstreamIDs;
- (NSMutableSet)knownInodeIDs;
- (SATraverse)init;
- (SATraverse)traverseWithPath:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (id)getFolderSizeAtPath:(id)a3 options:(unint64_t)a4;
- (id)getItemSizeAtPath:(id)a3;
- (void)debugLogStatistics;
- (void)pushDir:(id)a3 at:(int64_t)a4 withParentPath:(id)a5;
- (void)setKnownDstreamIDs:(id)a3;
- (void)setKnownInodeIDs:(id)a3;
@end

@implementation SATraverse

- (SATraverse)init
{
  v13.receiver = self;
  v13.super_class = (Class)SATraverse;
  v2 = [(SATraverse *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate date];
    startTime = v2->_startTime;
    v2->_startTime = (NSDate *)v3;

    uint64_t v5 = objc_opt_new();
    dir_content_cache = v2->_dir_content_cache;
    v2->_dir_content_cache = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    knownDstreamIDs = v2->_knownDstreamIDs;
    v2->_knownDstreamIDs = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    knownInodeIDs = v2->_knownInodeIDs;
    v2->_knownInodeIDs = (NSMutableSet *)v9;

    initialPath = v2->_initialPath;
    v2->_initialPath = 0;

    v2->_fs_num = 0;
  }
  return v2;
}

- (void)debugLogStatistics
{
  uint64_t v3 = SALog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100032F78();
  }

  v4 = SALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100032F0C();
  }

  uint64_t v5 = SALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100032EA0();
  }

  v6 = SALog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100032E34();
  }

  uint64_t v7 = SALog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100032DC8();
  }

  v8 = SALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100032D5C();
  }

  uint64_t v9 = SALog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100032CF0();
  }

  v10 = SALog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100032C84();
  }

  v11 = SALog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_100032C18();
  }

  v12 = SALog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100032B84((uint64_t)self, v12);
  }
}

- (void)pushDir:(id)a3 at:(int64_t)a4 withParentPath:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [[SADirContentCacheEntry alloc] initWithData:v9 idx:a4 andParentPath:v8];

  [(NSMutableArray *)self->_dir_content_cache addObject:v10];
  if ((unint64_t)[(NSMutableArray *)self->_dir_content_cache count] > self->_dir_content_max_count) {
    self->_dir_content_max_count = (unint64_t)[(NSMutableArray *)self->_dir_content_cache count];
  }
}

- (BOOL)popDir:(id *)a3 at:(int64_t *)a4 ofParentPath:(id *)a5
{
  id v9 = [(NSMutableArray *)self->_dir_content_cache count];
  if (v9)
  {
    v10 = [(NSMutableArray *)self->_dir_content_cache lastObject];
    objc_msgSend(v10, "dir_content");
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    *a4 = (int64_t)[v10 index];
    objc_msgSend(v10, "parent_path");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    [(NSMutableArray *)self->_dir_content_cache removeLastObject];
  }
  return v9 != 0;
}

- (SATraverse)traverseWithPath:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v55 = a3;
  id v9 = (uint64_t (**)(id, id, uint64_t, id))a5;
  v10 = objc_opt_new();
  objc_storeStrong((id *)&self->_initialPath, a3);
  self->_unint64_t options = a4;
  id v11 = [(NSString *)self->_initialPath copy];
  initialPath = self->_initialPath;
  id v65 = 0;
  v14 = [v10 attributesOfItemAtPath:initialPath error:&v65];
  id v15 = v65;
  id v56 = [v14 fileSystemNumber];
  if (self->_fs_num != v56)
  {
    [(NSMutableSet *)self->_knownDstreamIDs removeAllObjects];
    [(NSMutableSet *)self->_knownInodeIDs removeAllObjects];
    self->_fs_num = (unint64_t)v56;
  }

  v16 = 0;
  v64 = 0;
  *(void *)&long long v17 = 138412546;
  long long v54 = v17;
  v58 = v10;
  while (1)
  {
    if (v64) {
      break;
    }
    id v63 = v15;
    v20 = [v10 contentsOfDirectoryAtPath:v11 error:&v63];
    id v19 = v63;

    if (v19)
    {
      ++self->_cantEnumerateDir;

      v20 = 0;
    }
    if ((self->_options & 2) != 0)
    {
      char v21 = v9[2](v9, v11, 2, v19);
      if (v21)
      {
        ++self->_callback_stop;
        v45 = SALog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          sub_100033050();
        }
        goto LABEL_54;
      }
      if ((v21 & 2) != 0)
      {

        v16 = 0;
        goto LABEL_35;
      }
    }
    v16 = v20;
    if (v20) {
      goto LABEL_13;
    }
LABEL_35:
    if ((self->_options & 4) != 0)
    {
      char v36 = v9[2](v9, v11, 4, v19);

      if (v36)
      {
        ++self->_callback_stop;
        v45 = SALog();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          sub_100032FE4((uint64_t)v11, v45, v46, v47, v48, v49, v50, v51);
        }
        id v19 = 0;
        v20 = v16;
LABEL_54:
        v44 = v55;

        id v15 = v19;
        v16 = v20;
        goto LABEL_55;
      }
      id v19 = 0;
    }
    id v59 = v11;
    id v60 = v16;
    unsigned __int8 v37 = -[SATraverse popDir:at:ofParentPath:](self, "popDir:at:ofParentPath:", &v60, &v64, &v59, v54);
    id v38 = v60;

    id v35 = v59;
    ++v64;
    if ((v37 & 1) == 0)
    {
      v42 = +[NSDate date];
      endTime = self->_endTime;
      self->_endTime = v42;

      id v15 = v19;
      v16 = v38;
      id v11 = v35;
      v44 = v55;
      goto LABEL_55;
    }
    id v15 = v19;
    v16 = v38;
LABEL_40:
    id v11 = v35;
  }
  id v19 = v15;
  if (!v16) {
    goto LABEL_35;
  }
LABEL_13:
  unint64_t v22 = (unint64_t)v64;
  if (v22 >= (unint64_t)objc_msgSend(v16, "count", v54)) {
    goto LABEL_32;
  }
  [v16 objectAtIndexedSubscript:v64];
  v24 = v23 = v10;
  v25 = [v11 stringByAppendingPathComponent:v24];
  char v62 = 0;
  if (![v23 fileExistsAtPath:v25 isDirectory:&v62])
  {
    ++self->_noPathOutOfReach;
    id v15 = v19;
LABEL_30:
    ++v64;

    id v19 = v15;
    if (v16)
    {
      v10 = v58;
LABEL_32:
      v34 = v64;
      if (v34 != [v16 count])
      {
        id v15 = v19;
        id v35 = v11;
        goto LABEL_40;
      }
      goto LABEL_35;
    }
    v10 = v58;
    goto LABEL_35;
  }
  id v61 = v19;
  v26 = [v23 attributesOfItemAtPath:v25 error:&v61];
  id v15 = v61;

  if (v62)
  {
    v57 = v26;
    id v27 = [v26 fileSystemNumber];
    if (v56 == v27)
    {
      id v28 = v25;
      id v29 = [v28 UTF8String];
      if ((self->_options & 0x10) != 0
        && +[SASupport isFilePurgeable:v29])
      {
        ++v64;
        ++self->_purgeableFolder;
      }
      else
      {
        ++self->_folderCnt;
        [(SATraverse *)self pushDir:v16 at:v64 withParentPath:v11];
        id v41 = v28;

        v64 = 0;
        id v11 = v41;
      }
    }
    else
    {
      id v39 = v27;
      v40 = SALog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v54;
        v67 = v25;
        __int16 v68 = 2048;
        id v69 = v39;
        _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "fs_num at path %@ is %ld", buf, 0x16u);
      }

      ++v64;
      ++self->_onDifferentVolume;
    }
    v31 = v57;
    goto LABEL_46;
  }
  ++self->_filesDetected;
  unint64_t options = self->_options;
  if ((options & 8) != 0)
  {
    v31 = v26;
    NSFileAttributeType v32 = [v26 fileType];

    if (v32 == NSFileTypeSymbolicLink)
    {
      ++v64;
      ++self->_skipSymbolicLink;
LABEL_46:

      id v35 = v11;
      v10 = v58;
      goto LABEL_40;
    }
    unint64_t options = self->_options;
    v26 = v31;
  }
  if ((options & 1) == 0)
  {
LABEL_29:

    goto LABEL_30;
  }
  char v33 = v9[2](v9, v25, 1, v15);
  if ((v33 & 1) == 0)
  {
    if ((v33 & 2) != 0)
    {

      v16 = 0;
    }
    goto LABEL_29;
  }
  ++self->_callback_stop;
  v53 = SALog();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v25;
    _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "stop at path %@ (on file)", buf, 0xCu);
  }

  v44 = v55;
  v10 = v58;
LABEL_55:

  return result;
}

- (id)getItemSizeAtPath:(id)a3
{
  id v4 = a3;
  char v18 = 0;
  uint64_t v5 = objc_opt_new();
  v6 = +[NSFileManager defaultManager];
  unsigned __int8 v7 = [v6 fileExistsAtPath:v4 isDirectory:&v18];

  if (v7)
  {
    id v8 = +[NSFileManager defaultManager];
    id v17 = 0;
    id v9 = [v8 attributesOfItemAtPath:v4 error:&v17];
    id v10 = v17;

    id v11 = [0 objectForKeyedSubscript:NSFileTypeSymbolicLink];

    if (v11)
    {
      id v12 = v5;
    }
    else if (v18)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100024D30;
      v15[3] = &unk_10004D2C8;
      v15[4] = self;
      id v14 = v5;
      id v16 = v14;
      [(SATraverse *)self traverseWithPath:v4 options:25 completionHandler:v15];
      id v12 = v14;
    }
    else
    {
      id v12 = +[SATraverse getFileSize:v4];
      if ([v12 isFileCloned]
        && +[SACloneTreeWalker isNodeID:oldestForDStreamID:forVolPath:](SACloneTreeWalker, "isNodeID:oldestForDStreamID:forVolPath:", +[SASupport getInodeIDForPath:](SASupport, "getInodeIDForPath:", v4), +[SASupport getCloneDstreamIDForPath:v4], v4))
      {
        objc_msgSend(v12, "setDataSize:", objc_msgSend(v12, "cloneSize"));
      }
    }
  }
  else
  {
    id v12 = v5;
    id v10 = 0;
  }

  return v12;
}

+ (id)getFileSize:(id)a3
{
  id v3 = a3;
  id v4 = +[NSURL fileURLWithPath:v3];
  uint64_t v5 = objc_opt_new();
  id v23 = 0;
  id v22 = 0;
  [v4 getResourceValue:&v23 forKey:NSURLFileAllocatedSizeKey error:&v22];
  id v6 = v23;
  id v7 = v22;
  char v21 = v7;
  if (v7 || !v6)
  {
    char v18 = SALog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      if (v7)
      {
        v20 = +[NSString stringWithFormat:@" with error %@", v7, v7];
      }
      else
      {
        v20 = &stru_10004D5B8;
      }
      *(_DWORD *)buf = 138412546;
      id v25 = v3;
      __int16 v26 = 2112;
      id v27 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to get physical size for file (%@)%@", buf, 0x16u);
      if (v7) {
    }
      }
    id v8 = v4;

    id v9 = 0;
    id v15 = 0;
    id v16 = 0;
    BOOL v11 = 0;
    BOOL v13 = 0;
    id v17 = 0;
  }
  else
  {
    id v8 = v4;
    id v9 = (char *)[v6 unsignedLongLongValue];
    id v10 = [v3 fileSystemRepresentation];
    BOOL v11 = +[SASupport isFileCloned:v10];
    BOOL v12 = +[SASupport isFilePurgeable:v10];
    BOOL v13 = v12;
    if (v11) {
      id v14 = v9;
    }
    else {
      id v14 = 0;
    }
    if (v12) {
      id v15 = 0;
    }
    else {
      id v15 = v14;
    }
    if (v12) {
      id v16 = v9;
    }
    else {
      id v16 = 0;
    }
    if (v12) {
      id v17 = 0;
    }
    else {
      id v17 = (char *)(v9 - v14);
    }
  }
  [v5 setPhysicalSize:v9];
  [v5 setDataSize:v17];
  [v5 setCloneSize:v15];
  [v5 setPurgeableSize:v16];
  [v5 setIsFileCloned:v11];
  [v5 setIsFilePurgeable:v13];

  return v5;
}

- (id)getFolderSizeAtPath:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v36 = 0;
  unsigned __int8 v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  char v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  id v7 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  bzero(&v41, 0x878uLL);
  id v8 = v6;
  if (statfs((const char *)[v8 fileSystemRepresentation], &v41) < 0)
  {
    id v9 = SALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = __error();
      BOOL v11 = strerror(*v10);
      sub_100033130((uint64_t)v11, buf, (uint64_t)v8, v9);
    }
  }
  else
  {
    id v9 = +[NSString stringWithUTF8String:v41.f_mntonname];
    [v7 setVolumePath:v9];
  }

  if ((a4 & 2) == 0) {
    goto LABEL_8;
  }
  unsigned int v13 = +[SASupport getDirStatInfoForPath:v8 withOptions:(a4 >> 4) & 1 info:&v22];
  if (!v13)
  {
    int v15 = 1;
    goto LABEL_18;
  }
  if (v13 != 2)
  {
LABEL_8:
    if ((a4 & 4) == 0)
    {
LABEL_9:
      if ((a4 & 8) != 0)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000255CC;
        v21[3] = &unk_10004D2F0;
        v21[4] = &v24;
        v21[5] = &v36;
        v21[6] = &v28;
        v21[7] = &v32;
        [(SATraverse *)self traverseWithPath:v8 options:9 completionHandler:v21];
      }
      goto LABEL_17;
    }
    unsigned int v14 = +[SASupport enableDirStatInfoForPath:v8 withOptions:(a4 >> 4) & 1 andGetInfo:&v22];
    if (v14 != 45 && v14 != 2)
    {
      if (!v14)
      {
        int v15 = 1;
        [v7 setEnabledDirStat:1];
        goto LABEL_18;
      }
      [v7 setFailedDirStat:1];
      goto LABEL_9;
    }
    [v7 setSkippedDirStat:1];
  }
LABEL_17:
  int v15 = 0;
LABEL_18:
  if (v15)
  {
    id v16 = v29;
    uint64_t v17 = v22;
    v29[3] = *((void *)&v22 + 1);
    char v18 = v37;
    v37[3] = v23;
    v33[3] = v17;
    uint64_t v19 = *((void *)&v23 + 1);
    v25[3] = v17 - (v16[3] + v18[3]);
    [v7 setUsedDirStat:1];
  }
  else
  {
    uint64_t v19 = 0;
  }
  [v7 setDataSize:v25[3]];
  [v7 setCloneSize:v37[3]];
  [v7 setPhysicalSize:v33[3]];
  [v7 setPurgeableSize:v29[3]];
  [v7 setDirstatsID:v19];
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v7;
}

- (NSMutableSet)knownDstreamIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 128, 1);
}

- (void)setKnownDstreamIDs:(id)a3
{
}

- (NSMutableSet)knownInodeIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)setKnownInodeIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownInodeIDs, 0);
  objc_storeStrong((id *)&self->_knownDstreamIDs, 0);
  objc_storeStrong((id *)&self->_dir_content_cache, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_initialPath, 0);
}

@end