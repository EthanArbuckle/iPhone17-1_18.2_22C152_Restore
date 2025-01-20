@interface ICCloudContentTasteUpdateResponse
+ (id)eTagValueFromContentTasteResponse:(id)a3;
- (BOOL)isCachedResponse;
- (ICCloudContentTasteUpdateResponse)initWithContentTasteResponse:(id)a3;
- (NSArray)contentTasteItems;
- (NSDate)expirationDate;
- (unint64_t)responseRevisionID;
- (void)setCachedResponse:(BOOL)a3;
- (void)setContentTasteItems:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setResponseRevisionID:(unint64_t)a3;
@end

@implementation ICCloudContentTasteUpdateResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);

  objc_storeStrong((id *)&self->_contentTasteItems, 0);
}

- (void)setCachedResponse:(BOOL)a3
{
  self->_cachedResponse = a3;
}

- (BOOL)isCachedResponse
{
  return self->_cachedResponse;
}

- (void)setResponseRevisionID:(unint64_t)a3
{
  self->_responseRevisionID = a3;
}

- (unint64_t)responseRevisionID
{
  return self->_responseRevisionID;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setContentTasteItems:(id)a3
{
}

- (NSArray)contentTasteItems
{
  return self->_contentTasteItems;
}

- (ICCloudContentTasteUpdateResponse)initWithContentTasteResponse:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICCloudContentTasteUpdateResponse;
  v5 = [(ICCloudContentTasteUpdateResponse *)&v8 init];
  if (v5)
  {
    v6 = +[ICCloudContentTasteUpdateResponse eTagValueFromContentTasteResponse:v4];
    v5->_responseRevisionID = (unint64_t)[v6 longLongValue];
  }
  return v5;
}

+ (id)eTagValueFromContentTasteResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 allHeaderFields];
    v5 = [v4 objectForKey:@"ETag"];
    if (!v5)
    {
      v6 = [@"ETag" lowercaseString];
      v5 = [v4 objectForKey:v6];
    }
  }
  else
  {
    v5 = 0;
  }
  if ([(__CFString *)v5 length]) {
    v7 = v5;
  }
  else {
    v7 = @"0";
  }
  objc_super v8 = v7;

  return v8;
}

@end