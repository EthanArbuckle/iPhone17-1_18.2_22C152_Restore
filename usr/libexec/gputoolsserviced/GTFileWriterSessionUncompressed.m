@interface GTFileWriterSessionUncompressed
+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)_closeCurrentFileDescriptor:(id *)a3;
- (BOOL)_writeUncompressedFileData:(const char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (BOOL)finish:(id *)a3;
- (GTFileWriterSessionUncompressed)initWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6;
- (int)_getCurrentFileDescriptor:(id *)a3;
- (int)_openNextFile:(id *)a3;
- (void)writeFileData:(id)a3 completionHandler:(id)a4;
@end

@implementation GTFileWriterSessionUncompressed

+ (id)sessionWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithFileEntries:v12 relativeToURL:v11 options:v10 error:a6];

  return v13;
}

- (GTFileWriterSessionUncompressed)initWithFileEntries:(id)a3 relativeToURL:(id)a4 options:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v62.receiver = self;
  v62.super_class = (Class)GTFileWriterSessionUncompressed;
  v14 = [(GTFileWriterSessionUncompressed *)&v62 init];
  v15 = v14;
  if (!v14) {
    goto LABEL_33;
  }
  v57 = a6;
  id v58 = v13;
  objc_storeStrong((id *)&v14->_fileEntries, a3);
  objc_storeStrong((id *)&v15->_baseURL, a4);
  v15->_currentFileIndex = 0;
  v15->_currentFileBytesWritten = 0;
  v15->_fd = -1;
  os_log_t v16 = os_log_create("com.apple.gputools.transport", "FileWriterSession");
  log = v15->_log;
  v15->_log = (OS_os_log *)v16;

  id v18 = v11;
  id v19 = v12;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v18;
  id v20 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
  v59 = v19;
  if (!v20)
  {
    id v22 = 0;
    int v35 = 1;
    goto LABEL_30;
  }
  id v21 = v20;
  v54 = v15;
  id v55 = v12;
  id v56 = v11;
  id v22 = 0;
  uint64_t v61 = *(void *)v65;
  do
  {
    v23 = 0;
    v24 = v22;
    do
    {
      if (*(void *)v65 != v61) {
        objc_enumerationMutation(obj);
      }
      v25 = *(void **)(*((void *)&v64 + 1) + 8 * (void)v23);
      id v63 = v24;
      id v27 = v25;
      id v28 = v19;
      id v29 = objc_alloc((Class)NSURL);
      v30 = [v27 path];
      id v31 = [v29 initFileURLWithPath:v30 isDirectory:0 relativeToURL:v28];

      v32 = +[NSFileManager defaultManager];
      v33 = [v31 URLByDeletingLastPathComponent];
      unsigned int v34 = [v32 createDirectoryAtURL:v33 withIntermediateDirectories:1 attributes:0 error:&v63];

      int v35 = 0;
      if (v34)
      {
        v36 = [v27 destination];

        if (v36)
        {
          v37 = +[NSFileManager defaultManager];
          v38 = [v31 path];
          v39 = [v27 destination];
          unsigned __int8 v40 = [v37 createSymbolicLinkAtPath:v38 withDestinationPath:v39 error:&v63];

          if (v40) {
            goto LABEL_10;
          }
LABEL_22:
          int v35 = 0;
LABEL_23:
          id v19 = v59;
          goto LABEL_24;
        }
        id v41 = objc_alloc_init((Class)NSData);
        unsigned int v42 = [v41 writeToURL:v31 options:0 error:&v63];

        if (!v42) {
          goto LABEL_19;
        }
        int v43 = open((const char *)[v31 fileSystemRepresentation], 1, 0);
        if (v43 < 0)
        {
          uint64_t v47 = *__error();
          NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
          CFStringRef v70 = @"Failed to open file for writing";
          v48 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
          id v63 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v47 userInfo:v48];

          id v19 = v59;
LABEL_19:
          int v35 = 0;
          goto LABEL_24;
        }
        int v44 = v43;
        if (ftruncate(v43, (off_t)[v27 fileSize]) < 0)
        {
          uint64_t v49 = *__error();
          NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
          CFStringRef v70 = @"Failed to resize file";
          v50 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
          id v63 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v49 userInfo:v50];

          id v19 = v59;
          close(v44);
          goto LABEL_19;
        }
        if (fsync(v44) < 0)
        {
          uint64_t v45 = *__error();
          NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
          CFStringRef v46 = @"Failed to flush file";
        }
        else
        {
          if ((close(v44) & 0x80000000) == 0)
          {
LABEL_10:
            int v35 = 1;
            goto LABEL_23;
          }
          uint64_t v45 = *__error();
          NSErrorUserInfoKey v69 = NSLocalizedDescriptionKey;
          CFStringRef v46 = @"Failed to close file";
        }
        CFStringRef v70 = v46;
        v51 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
        id v63 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v45 userInfo:v51];

        goto LABEL_22;
      }
LABEL_24:

      id v22 = v63;
      if (!v35) {
        goto LABEL_28;
      }
      v23 = (char *)v23 + 1;
      v24 = v22;
    }
    while (v21 != v23);
    id v21 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
  }
  while (v21);
  int v35 = 1;
LABEL_28:
  id v12 = v55;
  id v11 = v56;
  v15 = v54;
LABEL_30:

  id v13 = v58;
  if (v57) {
    id *v57 = v22;
  }

  if (v35) {
LABEL_33:
  }
    v52 = v15;
  else {
    v52 = 0;
  }

  return v52;
}

- (int)_openNextFile:(id *)a3
{
  unint64_t currentFileIndex = self->_currentFileIndex;
  if (currentFileIndex >= [(NSArray *)self->_fileEntries count])
  {
    if (!a3) {
      return -1;
    }
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    CFStringRef v19 = @"No more files to write to";
    id v10 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    *a3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:v10];
    goto LABEL_8;
  }
  id v6 = objc_alloc((Class)NSURL);
  v7 = [(NSArray *)self->_fileEntries objectAtIndexedSubscript:self->_currentFileIndex];
  v8 = [v7 path];
  id v9 = [v6 initFileURLWithPath:v8 isDirectory:0 relativeToURL:self->_baseURL];

  id v10 = v9;
  int v11 = open((const char *)[v10 fileSystemRepresentation], 1, 0);
  if (v11 < 0)
  {
    if (a3)
    {
      uint64_t v13 = *__error();
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      CFStringRef v17 = @"Failed to open file for writing";
      v14 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      *a3 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v13 userInfo:v14];
    }
LABEL_8:
    int v12 = -1;
    goto LABEL_9;
  }
  int v12 = v11;
LABEL_9:

  return v12;
}

- (void)writeFileData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = v6;
  id v9 = [v8 bytes];
  id v10 = [v8 length];

  id v12 = 0;
  [(GTFileWriterSessionUncompressed *)self _writeUncompressedFileData:v9 length:v10 error:&v12];
  id v11 = v12;
  v7[2](v7, v11);
}

- (BOOL)_writeUncompressedFileData:(const char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  if (a4)
  {
    unint64_t v9 = 0;
    while (1)
    {
      unsigned int v10 = [(GTFileWriterSessionUncompressed *)self _getCurrentFileDescriptor:a5];
      if ((v10 & 0x80000000) != 0) {
        break;
      }
      int v11 = v10;
      unint64_t v12 = a4 - v9;
      uint64_t v13 = [(NSArray *)self->_fileEntries objectAtIndexedSubscript:self->_currentFileIndex];
      v14 = (char *)[v13 fileSize] - self->_currentFileBytesWritten;

      uint64_t v15 = 0;
      if (a4 - v9 >= (unint64_t)v14) {
        unint64_t v12 = (unint64_t)v14;
      }
      do
      {
        ssize_t v16 = write(v11, &a3[v9 + v15], v12 - v15);
        if (v16 < 0) {
          goto LABEL_14;
        }
        v15 += v16;
      }
      while (v15 != v12);
      if ((v12 & 0x8000000000000000) != 0)
      {
LABEL_14:
        if (a5)
        {
          uint64_t v22 = *__error();
          NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
          CFStringRef v26 = @"Failed to write to file";
          v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a5 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v22 userInfo:v23];
        }
        break;
      }
      unint64_t currentFileIndex = self->_currentFileIndex;
      unint64_t v18 = self->_currentFileBytesWritten + v12;
      self->_currentFileBytesWritten = v18;
      CFStringRef v19 = [(NSArray *)self->_fileEntries objectAtIndexedSubscript:currentFileIndex];
      id v20 = [v19 fileSize];

      if ((id)v18 == v20)
      {
        BOOL v21 = [(GTFileWriterSessionUncompressed *)self _closeCurrentFileDescriptor:a5];
        if (!v21) {
          return v21;
        }
        ++self->_currentFileIndex;
        self->_currentFileBytesWritten = 0;
      }
      v9 += v12;
      if (v9 >= a4) {
        goto LABEL_13;
      }
    }
    LOBYTE(v21) = 0;
  }
  else
  {
LABEL_13:
    LOBYTE(v21) = 1;
  }
  return v21;
}

- (int)_getCurrentFileDescriptor:(id *)a3
{
  int result = self->_fd;
  if (result < 0)
  {
    int result = [(GTFileWriterSessionUncompressed *)self _openNextFile:a3];
    self->_fd = result;
  }
  return result;
}

- (BOOL)finish:(id *)a3
{
  baseURL = self->_baseURL;
  self->_baseURL = 0;

  fileEntries = self->_fileEntries;
  self->_fileEntries = 0;

  self->_unint64_t currentFileIndex = 0;
  self->_currentFileBytesWritten = 0;

  return [(GTFileWriterSessionUncompressed *)self _closeCurrentFileDescriptor:a3];
}

- (BOOL)_closeCurrentFileDescriptor:(id *)a3
{
  int fd = self->_fd;
  if (fd < 0) {
    return 1;
  }
  self->_int fd = -1;
  if (fsync(fd) < 0)
  {
    if (a3)
    {
      NSErrorDomain v6 = NSPOSIXErrorDomain;
      uint64_t v7 = *__error();
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      CFStringRef v14 = @"Failed to flush file";
      id v8 = &v14;
      unint64_t v9 = &v13;
LABEL_9:
      unsigned int v10 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v9 count:1];
      *a3 = +[NSError errorWithDomain:v6 code:v7 userInfo:v10];
    }
  }
  else
  {
    if ((close(fd) & 0x80000000) == 0) {
      return 1;
    }
    if (a3)
    {
      NSErrorDomain v6 = NSPOSIXErrorDomain;
      uint64_t v7 = *__error();
      NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
      CFStringRef v12 = @"Failed to close file";
      id v8 = &v12;
      unint64_t v9 = &v11;
      goto LABEL_9;
    }
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);

  objc_storeStrong((id *)&self->_fileEntries, 0);
}

@end