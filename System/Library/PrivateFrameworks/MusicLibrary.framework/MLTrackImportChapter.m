@interface MLTrackImportChapter
- (BOOL)isEqualIgnoringTimesAndTitle:(id)a3;
- (NSData)imageData;
- (NSString)URLTitle;
- (NSString)imageCacheKey;
- (NSString)title;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)startTimeInMilliseconds;
- (void)normalizeProperties;
- (void)setImageCacheKey:(id)a3;
- (void)setImageData:(id)a3;
- (void)setStartTimeInMilliseconds:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setURL:(id)a3;
- (void)setURLTitle:(id)a3;
@end

@implementation MLTrackImportChapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageCacheKey, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

- (void)setImageCacheKey:(id)a3
{
}

- (NSString)imageCacheKey
{
  return self->_imageCacheKey;
}

- (void)setURLTitle:(id)a3
{
}

- (NSString)URLTitle
{
  return self->_urlTitle;
}

- (void)setURL:(id)a3
{
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setStartTimeInMilliseconds:(unint64_t)a3
{
  self->_startTimeInMilliseconds = a3;
}

- (unint64_t)startTimeInMilliseconds
{
  return self->_startTimeInMilliseconds;
}

- (void)setImageData:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (BOOL)isEqualIgnoringTimesAndTitle:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 URL];
    v6 = [v4 URLTitle];
    v7 = [v4 imageCacheKey];
    url = self->_url;
    if ((url == v5 || [(NSURL *)url isEqual:v5])
      && (self->_urlTitle == v6 || [(NSURL *)self->_url isEqual:v6]))
    {
      imageCacheKey = self->_imageCacheKey;
      if (imageCacheKey == v7) {
        char v10 = 1;
      }
      else {
        char v10 = [(NSString *)imageCacheKey isEqual:v7];
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MLTrackImportChapter *)self startTimeInMilliseconds];
  unint64_t v6 = [v4 startTimeInMilliseconds];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSString *)self->_title copy];
  unint64_t v6 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v5;

  *((void *)v4 + 3) = self->_startTimeInMilliseconds;
  objc_storeStrong((id *)v4 + 5, self->_url);
  uint64_t v7 = [(NSString *)self->_urlTitle copy];
  v8 = (void *)*((void *)v4 + 6);
  *((void *)v4 + 6) = v7;

  objc_storeStrong((id *)v4 + 1, self->_imageData);
  uint64_t v9 = [(NSString *)self->_imageCacheKey copy];
  char v10 = (void *)*((void *)v4 + 2);
  *((void *)v4 + 2) = v9;

  return v4;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1B3E93C70](self, a2);
  id v4 = [MEMORY[0x1E4F28E78] stringWithString:&stru_1F08D4D70];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  unint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"startMS=%7lu", -[MLTrackImportChapter startTimeInMilliseconds](self, "startTimeInMilliseconds"));
  uint64_t v7 = objc_msgSend(v5, "arrayWithObjects:", v6, 0);

  v8 = [(MLTrackImportChapter *)self title];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    [v4 appendString:@"t|"];
    char v10 = NSString;
    v11 = [(MLTrackImportChapter *)self title];
    v12 = [v10 stringWithFormat:@"title='%@'", v11];
    [v7 addObject:v12];
  }
  else
  {
    [v4 appendString:@" |"];
  }
  v13 = [(MLTrackImportChapter *)self imageData];

  if (v13)
  {
    [v4 appendString:@"i|"];
    v14 = NSString;
    v15 = [(MLTrackImportChapter *)self imageData];
    v16 = objc_msgSend(v14, "stringWithFormat:", @"image=%p", v15);
    [v7 addObject:v16];
  }
  else
  {
    [v4 appendString:@" |"];
  }
  v17 = [(MLTrackImportChapter *)self imageCacheKey];

  if (v17)
  {
    [v4 appendString:@"ik|"];
    v18 = NSString;
    v19 = [(MLTrackImportChapter *)self imageCacheKey];
    v20 = [v18 stringWithFormat:@"imageKey=%@", v19];
    [v7 addObject:v20];
  }
  else
  {
    [v4 appendString:@"  |"];
  }
  v21 = [(MLTrackImportChapter *)self URL];

  if (v21)
  {
    [v4 appendString:@"u|"];
    v22 = NSString;
    v23 = [(MLTrackImportChapter *)self URL];
    v24 = [v22 stringWithFormat:@"url=%@", v23];
    [v7 addObject:v24];
  }
  else
  {
    [v4 appendString:@" |"];
  }
  v25 = [(MLTrackImportChapter *)self URLTitle];
  uint64_t v26 = [v25 length];

  if (v26)
  {
    [v4 appendString:@"ut"];
    v27 = NSString;
    v28 = [(MLTrackImportChapter *)self URLTitle];
    v29 = [v27 stringWithFormat:@"urlTitle='%@'", v28];
    [v7 addObject:v29];
  }
  else
  {
    [v4 appendString:@"  "];
  }
  v30 = NSString;
  v31 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v31);
  v33 = [v7 componentsJoinedByString:@", "];
  v34 = [v30 stringWithFormat:@"<%@: %p - [%@] %@>", v32, self, v4, v33];

  return v34;
}

- (void)normalizeProperties
{
  title = self->_title;
  id v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v5 = [(NSString *)title stringByTrimmingCharactersInSet:v4];
  unint64_t v6 = self->_title;
  self->_title = v5;

  urlTitle = self->_urlTitle;
  id v10 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v8 = [(NSString *)urlTitle stringByTrimmingCharactersInSet:v10];
  uint64_t v9 = self->_urlTitle;
  self->_urlTitle = v8;
}

@end