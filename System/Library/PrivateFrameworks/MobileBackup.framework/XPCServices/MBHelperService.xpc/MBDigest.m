@interface MBDigest
+ (id)sha1;
+ (id)sha1ForData:(id)a3;
+ (id)sha1ForFileAtPath:(id)a3 error:(id *)a4;
+ (id)sha1ForString:(id)a3;
+ (id)sha1HmacForString:(id)a3 key:(id)a4;
+ (id)sha256;
+ (id)sha256ForData:(id)a3;
+ (id)sha256ForFileAtPath:(id)a3 error:(id *)a4;
+ (int64_t)simpleChecksumForString:(id)a3;
- (BOOL)updateWithFile:(id)a3 error:(id *)a4;
- (id)digestForData:(id)a3;
- (id)digestForFileAtPath:(id)a3 error:(id *)a4;
- (id)digestForString:(id)a3;
- (id)final;
- (void)finalWithBytes:(void *)a3 length:(unint64_t)a4;
- (void)updateWithBytes:(const void *)a3 length:(unint64_t)a4;
- (void)updateWithData:(id)a3;
- (void)updateWithDate:(id)a3;
- (void)updateWithInt32:(int)a3;
- (void)updateWithInt64:(int64_t)a3;
- (void)updateWithString:(id)a3;
@end

@implementation MBDigest

+ (id)sha1
{
  v2 = objc_alloc_init(MBDigestSHA1);
  return v2;
}

+ (id)sha256
{
  v2 = objc_alloc_init(MBDigestSHA256);
  return v2;
}

+ (id)sha256ForData:(id)a3
{
  id v4 = +[MBDigest sha256];
  return [v4 digestForData:a3];
}

+ (id)sha256ForFileAtPath:(id)a3 error:(id *)a4
{
  id v6 = +[MBDigest sha256];
  return [v6 digestForFileAtPath:a3 error:a4];
}

+ (id)sha1ForData:(id)a3
{
  id v4 = +[MBDigest sha1];
  return [v4 digestForData:a3];
}

+ (id)sha1ForFileAtPath:(id)a3 error:(id *)a4
{
  id v6 = +[MBDigest sha1];
  return [v6 digestForFileAtPath:a3 error:a4];
}

+ (id)sha1ForString:(id)a3
{
  id v4 = +[MBDigest sha1];
  return [v4 digestForString:a3];
}

+ (id)sha1HmacForString:(id)a3 key:(id)a4
{
  [a4 bytes];
  [a4 length];
  [a3 UTF8String];
  [a3 lengthOfBytesUsingEncoding:4];
  CCHmacOneShot();
  return +[NSData dataWithBytes:v7 length:20];
}

+ (int64_t)simpleChecksumForString:(id)a3
{
  return MBSimpleChecksumForString(a3);
}

- (id)digestForData:(id)a3
{
  [(MBDigest *)self updateWithData:a3];
  return [(MBDigest *)self final];
}

- (id)digestForFileAtPath:(id)a3 error:(id *)a4
{
  if (![(MBDigest *)self updateWithFile:a3 error:a4]) {
    return 0;
  }
  return [(MBDigest *)self final];
}

- (id)digestForString:(id)a3
{
  [(MBDigest *)self updateWithString:a3];
  return [(MBDigest *)self final];
}

- (void)updateWithInt32:(int)a3
{
  int v3 = a3;
  [(MBDigest *)self updateWithBytes:&v3 length:4];
}

- (void)updateWithInt64:(int64_t)a3
{
  int64_t v3 = a3;
  [(MBDigest *)self updateWithBytes:&v3 length:8];
}

- (void)updateWithBytes:(const void *)a3 length:(unint64_t)a4
{
}

- (void)updateWithData:(id)a3
{
  if (a3 && [a3 length])
  {
    id v5 = [a3 bytes];
    id v6 = [a3 length];
    [(MBDigest *)self updateWithBytes:v5 length:v6];
  }
}

- (void)updateWithDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  [(MBDigest *)self updateWithInt64:(uint64_t)v4];
}

- (BOOL)updateWithFile:(id)a3 error:(id *)a4
{
  if (!a3) {
    sub_100013F60();
  }
  int v7 = getpagesize();
  if (!v7) {
    sub_100013F8C();
  }
  int v8 = v7;
  int v9 = open((const char *)[a3 fileSystemRepresentation], 256);
  if (v9 != -1)
  {
    int v10 = v9;
    memset(&v26, 0, sizeof(v26));
    if (fstat(v9, &v26))
    {
      v11 = +[MBError posixErrorWithPath:a3 format:@"Failed to fstat src file"];
    }
    else if ((v26.st_mode & 0xF000) == 0x8000)
    {
      unint64_t v14 = v8;
      off_t st_size = v26.st_size;
      unint64_t v16 = v26.st_size % (unint64_t)v8;
      if (v16) {
        unint64_t v17 = v8 - v16;
      }
      else {
        unint64_t v17 = 0;
      }
      unint64_t v18 = v17 + v26.st_size;
      if (v18 >= (uint64_t)v8 << 15) {
        unint64_t v19 = (uint64_t)v8 << 15;
      }
      else {
        unint64_t v19 = v18;
      }
      if (v19 <= v8) {
        size_t v20 = v8;
      }
      else {
        size_t v20 = v19;
      }
      if (v26.st_size < 1)
      {
LABEL_27:
        v12 = 0;
        BOOL v13 = 1;
        goto LABEL_31;
      }
      off_t v21 = 0;
      while (1)
      {
        v22 = mmap(0, v20, 1, 2, v10, v21);
        if (v22 == (void *)-1) {
          break;
        }
        v23 = v22;
        if (v19 > v14) {
          madvise(v22, v20, 2);
        }
        if (st_size - v21 >= v20) {
          size_t v24 = v20;
        }
        else {
          size_t v24 = st_size - v21;
        }
        [(MBDigest *)self updateWithBytes:v23 length:v24];
        munmap(v23, v20);
        v21 += v24;
        if (v21 >= st_size) {
          goto LABEL_27;
        }
      }
      v11 = +[MBError posixErrorWithFormat:@"Failed to mmap the file at offset:%lld, mapSize:%ld", v21, v20];
    }
    else
    {
      v11 = +[MBError errorWithCode:1 path:a3 format:@"Not a regular file"];
    }
    v12 = v11;
    BOOL v13 = 0;
LABEL_31:
    close(v10);
    if (!a4) {
      return v13;
    }
    goto LABEL_32;
  }
  v12 = +[MBError posixErrorWithPath:a3 format:@"Failed to open src file"];
  BOOL v13 = 0;
  if (!a4) {
    return v13;
  }
LABEL_32:
  if (!v13) {
    *a4 = v12;
  }
  return v13;
}

- (void)updateWithString:(id)a3
{
  if (a3 && [a3 length])
  {
    id v5 = malloc_type_malloc((size_t)[a3 maximumLengthOfBytesUsingEncoding:4], 0x59560A4uLL);
    [(MBDigest *)self updateWithBytes:v5 length:0];
    free(v5);
  }
}

- (void)finalWithBytes:(void *)a3 length:(unint64_t)a4
{
}

- (id)final
{
  return 0;
}

@end