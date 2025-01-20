@interface SSItemMedia
- (BOOL)isEqual:(id)a3;
- (BOOL)isProtectedMedia;
- (NSString)mediaKind;
- (NSURL)URL;
- (SSItemMedia)init;
- (SSItemMedia)initWithStoreOfferDictionary:(id)a3;
- (id)description;
- (int64_t)durationInMilliseconds;
- (int64_t)fullDurationInMilliseconds;
- (int64_t)mediaFileSize;
- (unint64_t)hash;
- (void)dealloc;
- (void)setMediaKind:(id)a3;
@end

@implementation SSItemMedia

- (SSItemMedia)init
{
  v3.receiver = self;
  v3.super_class = (Class)SSItemMedia;
  result = [(SSItemMedia *)&v3 init];
  if (result) {
    result->_duration = -1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSItemMedia;
  [(SSItemMedia *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)SSItemMedia;
  return (id)[NSString stringWithFormat:@"%@: (%@) %@", -[SSItemMedia description](&v3, sel_description), self->_mediaKind, self->_url];
}

- (unint64_t)hash
{
  return [(NSURL *)self->_url hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  url = self->_url;
  uint64_t v6 = [a3 URL];
  return [(NSURL *)url isEqual:v6];
}

- (SSItemMedia)initWithStoreOfferDictionary:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SSItemMedia;
  v4 = [(SSItemMedia *)&v16 init];
  if (!v4) {
    return v4;
  }
  uint64_t v5 = [a3 objectForKey:@"preview-url"];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = (void *)[a3 objectForKey:@"preview-duration"];
    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = (int)[v7 intValue];
    }
    else {
      uint64_t v8 = -1;
    }
    v4->_duration = v8;
    v4->_protected = 1;
  }
  else
  {
    uint64_t v9 = [a3 objectForKey:@"asset-url"];
    if (!v9) {
      goto LABEL_14;
    }
    uint64_t v6 = v9;
    v10 = (void *)[a3 objectForKey:@"duration"];
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = (int)[v10 intValue];
    }
    else {
      uint64_t v11 = -1;
    }
    v4->_duration = v11;
  }
  v4->_url = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
LABEL_14:
  v12 = (void *)[a3 objectForKey:@"duration"];
  if (objc_opt_respondsToSelector()) {
    uint64_t v13 = (int)[v12 intValue];
  }
  else {
    uint64_t v13 = -1;
  }
  v4->_fullDuration = v13;
  v14 = (void *)[a3 objectForKey:@"size"];
  if (objc_opt_respondsToSelector()) {
    v4->_mediaFileSize = [v14 longLongValue];
  }
  return v4;
}

- (int64_t)durationInMilliseconds
{
  return self->_duration;
}

- (int64_t)fullDurationInMilliseconds
{
  return self->_fullDuration;
}

- (int64_t)mediaFileSize
{
  return self->_mediaFileSize;
}

- (NSString)mediaKind
{
  return self->_mediaKind;
}

- (void)setMediaKind:(id)a3
{
}

- (BOOL)isProtectedMedia
{
  return self->_protected;
}

- (NSURL)URL
{
  return self->_url;
}

@end