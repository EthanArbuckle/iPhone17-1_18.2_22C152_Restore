@interface WLKWatchListModificationResponse
- (WLKWatchListModificationResponse)init;
- (WLKWatchListModificationResponse)initWithDictionary:(id)a3;
- (int64_t)responseType;
@end

@implementation WLKWatchListModificationResponse

- (WLKWatchListModificationResponse)init
{
  return 0;
}

- (WLKWatchListModificationResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WLKWatchListModificationResponse;
  v5 = [(WLKWatchListModificationResponse *)&v9 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"data");
    if (objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"alreadyOnList", 0))
    {
      uint64_t v7 = 1;
    }
    else
    {
      if (!objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", @"notOnList", 0))
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v7 = 2;
    }
    v5->_responseType = v7;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (int64_t)responseType
{
  return self->_responseType;
}

@end