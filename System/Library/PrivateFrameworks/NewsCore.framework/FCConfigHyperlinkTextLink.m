@interface FCConfigHyperlinkTextLink
- (FCConfigHyperlinkTextLink)initWithConfigDictionary:(id)a3;
- (FCConfigHyperlinkTextLink)initWithURL:(id)a3 rangeStart:(int64_t)a4 rangeLength:(int64_t)a5;
- (NSString)url;
- (int64_t)rangeLength;
- (int64_t)rangeStart;
@end

@implementation FCConfigHyperlinkTextLink

- (FCConfigHyperlinkTextLink)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCConfigHyperlinkTextLink;
  v5 = [(FCConfigHyperlinkTextLink *)&v9 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationStringValue(v4, @"url", 0);
    url = v5->_url;
    v5->_url = (NSString *)v6;

    v5->_rangeStart = FCAppConfigurationIntegerValue(v4, @"rangeStart", -1);
    v5->_rangeLength = FCAppConfigurationIntegerValue(v4, @"rangeLength", -1);
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (FCConfigHyperlinkTextLink)initWithURL:(id)a3 rangeStart:(int64_t)a4 rangeLength:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FCConfigHyperlinkTextLink;
  v10 = [(FCConfigHyperlinkTextLink *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_url, a3);
    v11->_rangeStart = a4;
    v11->_rangeLength = a5;
  }

  return v11;
}

- (NSString)url
{
  return self->_url;
}

- (int64_t)rangeStart
{
  return self->_rangeStart;
}

- (int64_t)rangeLength
{
  return self->_rangeLength;
}

@end