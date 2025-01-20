@interface GQUFileOutputBundle
- (BOOL)setData:(__CFData *)a3 mimeType:(__CFString *)a4 forNamedResource:(__CFString *)a5;
- (BOOL)setDataForMainHtmlResource:(__CFData *)a3;
- (GQUFileOutputBundle)initWithOutputPath:(__CFString *)a3;
- (__CFString)createUriForResource:(__CFString *)a3;
- (void)dealloc;
@end

@implementation GQUFileOutputBundle

- (GQUFileOutputBundle)initWithOutputPath:(__CFString *)a3
{
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)GQUFileOutputBundle;
    v4 = [(GQUFileOutputBundle *)&v8 init];
    if (v4)
    {
      v4->mOutputUrl = CFURLCreateWithFileSystemPath(0, a3, kCFURLPOSIXPathStyle, 1u);
      int MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(a3);
      v6 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation + 1, 0x25515670uLL);
      CFStringGetFileSystemRepresentation(a3, v6, MaximumSizeOfFileSystemRepresentation);
      mkdir(v6, 0x1E4u);
      free(v6);
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  mOutputUrl = self->mOutputUrl;
  if (mOutputUrl) {
    CFRelease(mOutputUrl);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQUFileOutputBundle;
  [(GQUFileOutputBundle *)&v4 dealloc];
}

- (__CFString)createUriForResource:(__CFString *)a3
{
  return (__CFString *)CFRetain(a3);
}

- (BOOL)setDataForMainHtmlResource:(__CFData *)a3
{
  return [(GQUFileOutputBundle *)self setData:a3 mimeType:0 forNamedResource:@"index.html"];
}

- (BOOL)setData:(__CFData *)a3 mimeType:(__CFString *)a4 forNamedResource:(__CFString *)a5
{
  CFURLRef v6 = CFURLCreateCopyAppendingPathComponent(0, self->mOutputUrl, a5, 0);
  CFStringRef v7 = CFURLCopyFileSystemPath(v6, kCFURLPOSIXPathStyle);
  int MaximumSizeOfFileSystemRepresentation = CFStringGetMaximumSizeOfFileSystemRepresentation(v7);
  v9 = (char *)malloc_type_malloc(MaximumSizeOfFileSystemRepresentation + 1, 0x96855CD5uLL);
  CFStringGetFileSystemRepresentation(v7, v9, MaximumSizeOfFileSystemRepresentation);
  CFRelease(v7);
  size_t Length = CFDataGetLength(a3);
  if (!Length)
  {
    BytePtr = 0;
    if (v9) {
      goto LABEL_3;
    }
LABEL_11:
    int v12 = 22;
    goto LABEL_12;
  }
  BytePtr = CFDataGetBytePtr(a3);
  if (!v9) {
    goto LABEL_11;
  }
LABEL_3:
  if (!stat(v9, &v15) || (int v12 = *__error(), v12 == 2))
  {
    int v13 = open(v9, 1537, 438);
    if ((v13 & 0x80000000) == 0) {
      goto LABEL_7;
    }
    int v12 = *__error();
    if (v12 != 13) {
      goto LABEL_12;
    }
    if ((~v15.st_mode & 0x180) == 0)
    {
      int v12 = 13;
      goto LABEL_12;
    }
    if (!chmod(v9, v15.st_mode | 0x180))
    {
      int v13 = open(v9, 1537, 438);
      if ((v13 & 0x80000000) == 0)
      {
LABEL_7:
        if (Length && write(v13, BytePtr, Length) != Length)
        {
          int v12 = *__error();
          close(v13);
          goto LABEL_12;
        }
        fsync(v13);
        if (!close(v13))
        {
          int v12 = 0;
          goto LABEL_12;
        }
      }
    }
    int v12 = *__error();
  }
LABEL_12:
  free(v9);
  CFRelease(v6);
  return v12 == 0;
}

@end