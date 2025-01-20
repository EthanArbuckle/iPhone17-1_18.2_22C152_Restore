@interface ICStorePlatformOfferAsset
- (ICStorePlatformOfferAsset)initWithResponseDictionary:(id)a3;
- (NSURL)previewURL;
- (double)duration;
- (double)previewDuration;
- (int64_t)size;
@end

@implementation ICStorePlatformOfferAsset

- (void).cxx_destruct
{
}

- (int64_t)size
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"size"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 longLongValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (NSURL)previewURL
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"preview"];
  if (!_NSIsNSDictionary()) {
    goto LABEL_5;
  }
  int64_t v3 = [v2 objectForKey:@"url"];
  if (!_NSIsNSString())
  {
    v4 = 0;
    goto LABEL_7;
  }
  if (!v3)
  {
LABEL_5:
    v4 = 0;
    goto LABEL_8;
  }
  v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
LABEL_7:

LABEL_8:

  return (NSURL *)v4;
}

- (double)previewDuration
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"preview"];
  if (_NSIsNSDictionary())
  {
    int64_t v3 = [v2 objectForKey:@"duration"];
  }
  else
  {
    int64_t v3 = 0;
  }
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

- (double)duration
{
  v2 = [(NSDictionary *)self->_responseDictionary objectForKey:@"duration"];
  double v3 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v2 doubleValue];
    double v3 = v4;
  }

  return v3;
}

- (ICStorePlatformOfferAsset)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStorePlatformOfferAsset;
  double v5 = [(ICStorePlatformOfferAsset *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;
  }
  return v5;
}

@end