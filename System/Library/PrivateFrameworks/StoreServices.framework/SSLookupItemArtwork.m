@interface SSLookupItemArtwork
- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6 forColorKind:(id)a7;
- (NSDictionary)lookupDictionary;
- (NSURL)URL;
- (SSLookupItemArtwork)initWithLookupDictionary:(id)a3;
- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4;
- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4 cropStyle:(id)a5 format:(id)a6;
- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4 format:(id)a5;
- (int64_t)height;
- (int64_t)width;
- (void)dealloc;
@end

@implementation SSLookupItemArtwork

- (SSLookupItemArtwork)initWithLookupDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSLookupItemArtwork;
  v4 = [(SSLookupItemArtwork *)&v6 init];
  if (v4) {
    v4->_dictionary = (NSDictionary *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSLookupItemArtwork;
  [(SSLookupItemArtwork *)&v3 dealloc];
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6 forColorKind:(id)a7
{
  id v11 = [(NSDictionary *)self->_dictionary objectForKey:a7];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  if (isKindOfClass)
  {
    unint64_t v16 = strtoul((const char *)objc_msgSend(v11, "UTF8String", 0.0, 0.0, 0.0), 0, 16);
    double v13 = (double)BYTE2(v16) / 255.0;
    double v14 = (double)BYTE1(v16) / 255.0;
    double v15 = (double)v16 / 255.0;
  }
  if (a3) {
    *a3 = v13;
  }
  if (a4) {
    *a4 = v14;
  }
  if (a5) {
    *a5 = v15;
  }
  if (a6) {
    *a6 = 1.0;
  }
  return isKindOfClass & 1;
}

- (int64_t)height
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"height"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 integerValue];
}

- (NSURL)URL
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"url"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_super v3 = (void *)MEMORY[0x1E4F1CB10];
  return (NSURL *)[v3 URLWithString:v2];
}

- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4
{
  return [(SSLookupItemArtwork *)self URLWithHeight:a3 width:a4 format:@"jpg"];
}

- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4 format:(id)a5
{
  return [(SSLookupItemArtwork *)self URLWithHeight:a3 width:a4 cropStyle:@"bb" format:a5];
}

- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4 cropStyle:(id)a5 format:(id)a6
{
  v21[12] = *MEMORY[0x1E4F143B8];
  id v11 = [(NSDictionary *)self->_dictionary objectForKey:@"url"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v12 = 0;
  double v13 = 0;
  v21[0] = @"{h}";
  v21[1] = a3;
  v21[2] = 0;
  v21[3] = @"{w}";
  v21[4] = a4;
  v21[8] = a6;
  v21[9] = @"{c}";
  v21[10] = 0;
  v21[11] = a5;
  v21[5] = 0;
  v21[6] = @"{f}";
  v21[7] = 0;
  do
  {
    uint64_t v14 = [v11 rangeOfString:v21[v12] options:4];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_7;
    }
    uint64_t v16 = v14;
    uint64_t v17 = v15;
    id v18 = (id)v21[v12 + 2];
    if (v18)
    {
      if (!v13) {
        goto LABEL_10;
      }
    }
    else
    {
      id v18 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", v21[v12 + 1]);
      if (!v13)
      {
LABEL_10:
        double v13 = (void *)[v11 mutableCopy];
        id v11 = v13;
      }
    }
    objc_msgSend(v13, "replaceCharactersInRange:withString:", v16, v17, v18);

LABEL_7:
    v12 += 3;
  }
  while (v12 != 12);
  if (!v13 || (v19 = (NSURL *)[MEMORY[0x1E4F1CB10] URLWithString:v13]) == 0) {
    v19 = [(SSLookupItemArtwork *)self URL];
  }

  return v19;
}

- (int64_t)width
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"width"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 integerValue];
}

- (NSDictionary)lookupDictionary
{
  return self->_dictionary;
}

@end