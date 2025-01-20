@interface NSMultiPartInputStream
+ (id)pathMimeType:(const void *)a3;
- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5;
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (NSMultiPartInputStream)init;
- (id).cxx_construct;
- (id)boundary;
- (id)createHeaderName:(id)a3 filename:(id)a4 mimeType:(id)a5;
- (id)streamError;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)length;
- (unint64_t)streamStatus;
- (void)addLength:(unint64_t)a3;
- (void)addMultiPart:(const void *)a3 withHeader:(const void *)a4;
- (void)addPart:(id)a3 withData:(const void *)a4 andFilename:(id)a5;
- (void)addPart:(id)a3 withPath:(const void *)a4;
- (void)addPart:(id)a3 withPath:(const void *)a4 andFilename:(id)a5;
- (void)close;
- (void)open;
@end

@implementation NSMultiPartInputStream

+ (id)pathMimeType:(const void *)a3
{
  v3 = +[NSString ps_stringWithSTL:a3];
  v4 = [v3 pathExtension];
  CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, v4, 0);
  v6 = (__CFString *)PreferredIdentifierForTag;
  if (PreferredIdentifierForTag)
  {
    v7 = (__CFString *)UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, kUTTagClassMIMEType);
    if (v7) {
      goto LABEL_6;
    }
    NSLog(@"Couldn't determine mime-type of %@.  Using default.", v3);
  }
  else
  {
    NSLog(@"Couldn't determine UTI of %@.  Using default.", v3);
  }
  v7 = @"application/octet-stream";
LABEL_6:

  return v7;
}

- (NSMultiPartInputStream)init
{
  v13.receiver = self;
  v13.super_class = (Class)NSMultiPartInputStream;
  v2 = [(NSMultiPartInputStream *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->fCurrentPart = 0;
    v4 = +[NSProcessInfo processInfo];
    uint64_t v5 = [v4 globallyUniqueString];
    fMultiPartBoundary = v3->fMultiPartBoundary;
    v3->fMultiPartBoundary = (NSString *)v5;

    v3->fNumBytesRead = 0;
    v3->fLength = 0;
    v7 = +[NSString stringWithFormat:@"\r\n--%@--\r\n", v3->fMultiPartBoundary];
    +[NSInputStream ps_inputStreamWithString:v7];
    v8 = v11;
    v11 = 0;
    first = v3->fEpilogueBoundary.first;
    v3->fEpilogueBoundary.first = v8;

    v3->fEpilogueBoundary.second = v12;
  }
  return v3;
}

- (void)addPart:(id)a3 withPath:(const void *)a4
{
  id v6 = a3;
  sub_10009BB3C(a4, __p);
  v7 = +[NSString ps_stringWithSTL:__p];
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  [(NSMultiPartInputStream *)self addPart:v6 withPath:a4 andFilename:v7];
}

- (void)addPart:(id)a3 withPath:(const void *)a4 andFilename:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[NSMultiPartInputStream pathMimeType:a4];
  v11 = [(NSMultiPartInputStream *)self createHeaderName:v8 filename:v9 mimeType:v10];
  +[NSInputStream ps_inputStreamWithFileAtPath:a4];
  unint64_t v12 = operator new(0x10uLL);
  __p = v12;
  v22 = v12 + 2;
  id v13 = v23[0];
  id v15 = v23[0];
  id v14 = v23[1];
  *unint64_t v12 = v13;
  v12[1] = v14;
  v21 = (char *)(v12 + 2);

  +[NSInputStream ps_inputStreamWithString:v11];
  [(NSMultiPartInputStream *)self addMultiPart:&__p withHeader:v23];

  v16 = (char *)__p;
  if (__p)
  {
    v17 = v21;
    v18 = __p;
    if (v21 != __p)
    {
      do
      {
        v19 = (void *)*((void *)v17 - 2);
        v17 -= 16;
      }
      while (v17 != v16);
      v18 = __p;
    }
    v21 = v16;
    operator delete(v18);
  }
}

- (id)createHeaderName:(id)a3 filename:(id)a4 mimeType:(id)a5
{
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n",
    a3,
    a4,
  uint64_t v5 = a5);

  return v5;
}

- (void)addPart:(id)a3 withData:(const void *)a4 andFilename:(id)a5
{
  v7 = [(NSMultiPartInputStream *)self createHeaderName:a3 filename:a5 mimeType:@"application/octet-stream"];
  +[NSInputStream ps_inputStreamWithString:v7];
  [(NSMultiPartInputStream *)self addMultiPart:a4 withHeader:v8];
}

- (void)addMultiPart:(const void *)a3 withHeader:(const void *)a4
{
  v7 = +[NSString stringWithFormat:@"--%@\r\n", self->fMultiPartBoundary];
  +[NSInputStream ps_inputStreamWithString:v7];
  var0 = (id *)self->fParts.var0;
  if (var0 >= self->fParts.var1.__value_)
  {
    id v9 = (__end_cap_ **)sub_10036AA94(&self->fParts.__begin_, v14);
    self->fParts.var0 = v9;
    if ((id *)v9 < self->fParts.var1.__value_)
    {
LABEL_3:
      *id v9 = (__end_cap_ *)*(id *)a4;
      v10 = v9 + 1;
      self->fParts.var0 = v10;
      uint64_t v12 = *(void *)a3;
      uint64_t v11 = *((void *)a3 + 1);
      if (v12 != v11) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v13 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    id *var0 = v14[0];
    id v9 = (__end_cap_ **)(var0 + 1);
    self->fParts.var0 = v9;
    if ((id *)v9 < self->fParts.var1.__value_) {
      goto LABEL_3;
    }
  }
  v10 = (__end_cap_ **)sub_10036AA94(&self->fParts.__begin_, (id *)a4);
  self->fParts.var0 = v10;
  uint64_t v12 = *(void *)a3;
  uint64_t v11 = *((void *)a3 + 1);
  if (v12 == v11) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v13 = 0;
  do
  {
    if ((id *)v10 < self->fParts.var1.__value_) {
      *v10++ = (__end_cap_ *)*(id *)v12;
    }
    else {
      v10 = (__end_cap_ **)sub_10036AA94(&self->fParts.__begin_, (id *)v12);
    }
    self->fParts.var0 = v10;
    v13 += *(void *)(v12 + 8);
    v12 += 16;
  }
  while (v12 != v11);
LABEL_12:
  [(NSMultiPartInputStream *)self addLength:(char *)v14[1] + v13 + *((void *)a4 + 1)];
}

- (void)addLength:(unint64_t)a3
{
  self->fLength += a3;
}

- (id)boundary
{
  return self->fMultiPartBoundary;
}

- (unint64_t)length
{
  return self->fEpilogueBoundary.second + self->fLength;
}

- (void)open
{
  p_fParts = &self->fParts;
  p_fEpilogueBoundary = &self->fEpilogueBoundary;
  var0 = (id *)self->fParts.var0;
  if (var0 >= self->fParts.var1.__value_)
  {
    id v6 = (__end_cap_ **)sub_10036AA94(&self->fParts.__begin_, (id *)&p_fEpilogueBoundary->first);
  }
  else
  {
    id *var0 = p_fEpilogueBoundary->first;
    id v6 = (__end_cap_ **)(var0 + 1);
  }
  p_fParts->var0 = v6;
  [(NSMultiPartInputStream *)self addLength:p_fEpilogueBoundary->second];
  first = p_fEpilogueBoundary->first;
  p_fEpilogueBoundary->first = 0;

  p_fEpilogueBoundary->second = 0;
  unint64_t fCurrentPart = self->fCurrentPart;
  if (fCurrentPart >= p_fParts->var0 - p_fParts->__begin_) {
    sub_1001F352C();
  }
  id v9 = p_fParts->__begin_[fCurrentPart];

  [(__end_ *)v9 open];
}

- (void)close
{
  begin = self->fParts.__begin_;
  for (i = self->fParts.var0; begin != i; ++begin)
  {
    v4 = *begin;
    [(__end_ *)v4 close];
  }
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  p_fParts = &self->fParts;
  begin = self->fParts.__begin_;
  var0 = self->fParts.var0;
  unint64_t v10 = [(NSMultiPartInputStream *)self length];
  p_fNumBytesRead = &self->fNumBytesRead;
  if (self->fNumBytesRead >= v10 || a4 == 0) {
    return 0;
  }
  unint64_t v13 = v10;
  unint64_t v14 = 0;
  unint64_t v15 = var0 - begin;
  p_unint64_t fCurrentPart = &self->fCurrentPart;
  do
  {
    unint64_t v17 = *p_fCurrentPart;
    if (*p_fCurrentPart >= v15) {
      break;
    }
    if (v17 >= p_fParts->var0 - p_fParts->__begin_) {
      sub_1001F352C();
    }
    v18 = p_fParts->__begin_[v17];
    if (![(__end_ *)v18 streamStatus]) {
      [(__end_ *)v18 open];
    }
    int64_t v19 = (int64_t)[(__end_ *)v18 read:&a3[v14] maxLength:a4 - v14];
    int64_t v20 = v19;
    if (v19 < 0)
    {
      NSLog(@"Failed to read part %zu", *p_fCurrentPart);

      return v20;
    }
    if (v19)
    {
      v14 += v19;
      v21 = p_fNumBytesRead;
    }
    else
    {
      [(__end_ *)v18 close];
      v21 = p_fCurrentPart;
      int64_t v20 = 1;
    }
    *v21 += v20;
  }
  while (*p_fNumBytesRead < v13 && v14 < a4);
  return v14;
}

- (BOOL)hasBytesAvailable
{
  return self->fCurrentPart < self->fParts.var0 - self->fParts.__begin_;
}

- (id)streamError
{
  unint64_t fCurrentPart = self->fCurrentPart;
  begin = self->fParts.__begin_;
  var0 = self->fParts.var0;
  uint64_t v5 = (char *)var0 - (char *)begin;
  id v6 = (id *)(var0 - 1);
  v7 = (id *)&begin[fCurrentPart];
  if (fCurrentPart >= v5 >> 3) {
    id v8 = v6;
  }
  else {
    id v8 = v7;
  }
  id v9 = [*v8 streamError];

  return v9;
}

- (unint64_t)streamStatus
{
  unint64_t fCurrentPart = self->fCurrentPart;
  begin = self->fParts.__begin_;
  var0 = self->fParts.var0;
  uint64_t v5 = (char *)var0 - (char *)begin;
  id v6 = (id *)(var0 - 1);
  v7 = (id *)&begin[fCurrentPart];
  if (fCurrentPart >= v5 >> 3) {
    id v8 = v6;
  }
  else {
    id v8 = v7;
  }
  return (unint64_t)[*v8 streamStatus];
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fMultiPartBoundary, 0);
  p_fParts = &self->fParts;
  begin = p_fParts->__begin_;
  if (p_fParts->__begin_)
  {
    var0 = p_fParts->var0;
    id v6 = p_fParts->__begin_;
    if (var0 != begin)
    {
      do
      {
        v7 = *--var0;
      }
      while (var0 != begin);
      id v6 = p_fParts->__begin_;
    }
    p_fParts->var0 = begin;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 1) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end