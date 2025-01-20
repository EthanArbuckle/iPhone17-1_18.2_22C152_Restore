@interface WLKChannelResponse
- (NSDate)expirationDate;
- (NSString)channelLink;
- (NSString)channelTitle;
- (WLKChannelResponse)initWithDictionary:(id)a3 expirationDate:(id)a4 environmentHash:(unint64_t)a5;
- (unint64_t)environmentHash;
- (void)setChannelLink:(id)a3;
- (void)setChannelTitle:(id)a3;
- (void)setEnvironmentHash:(unint64_t)a3;
- (void)setExpirationDate:(id)a3;
@end

@implementation WLKChannelResponse

- (WLKChannelResponse)initWithDictionary:(id)a3 expirationDate:(id)a4 environmentHash:(unint64_t)a5
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WLKChannelResponse;
  v7 = [(WLKChannelResponse *)&v13 init];
  if (v7)
  {
    v8 = objc_msgSend(v6, "wlk_dictionaryForKey:", @"channel");
    v9 = [v8 allValues];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72__WLKChannelResponse_initWithDictionary_expirationDate_environmentHash___block_invoke;
    v11[3] = &unk_1E620B378;
    v12 = v7;
    [v9 enumerateObjectsUsingBlock:v11];
  }
  return v7;
}

void __72__WLKChannelResponse_initWithDictionary_expirationDate_environmentHash___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  v8 = objc_msgSend(v7, "wlk_stringForKey:", @"title");
  v9 = (void *)[v8 copy];
  [v6 setChannelTitle:v9];

  v10 = *(void **)(a1 + 32);
  v11 = objc_msgSend(v7, "wlk_stringForKey:", @"url");

  v12 = (void *)[v11 copy];
  [v10 setChannelLink:v12];

  *a4 = 1;
}

- (NSString)channelTitle
{
  return self->_channelTitle;
}

- (void)setChannelTitle:(id)a3
{
}

- (NSString)channelLink
{
  return self->_channelLink;
}

- (void)setChannelLink:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (unint64_t)environmentHash
{
  return self->_environmentHash;
}

- (void)setEnvironmentHash:(unint64_t)a3
{
  self->_environmentHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_channelLink, 0);

  objc_storeStrong((id *)&self->_channelTitle, 0);
}

@end