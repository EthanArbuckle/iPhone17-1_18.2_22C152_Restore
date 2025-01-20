@interface WBSTemplateIconCacheRecord
- (BOOL)canSaveToDisk;
- (NSString)host;
- (NSURL)templateIconURL;
- (UIColor)themeColor;
- (WBSTemplateIconCacheRecord)initWithHost:(id)a3 templateIconURL:(id)a4 themeColor:(id)a5 canSaveToDisk:(BOOL)a6;
@end

@implementation WBSTemplateIconCacheRecord

- (WBSTemplateIconCacheRecord)initWithHost:(id)a3 templateIconURL:(id)a4 themeColor:(id)a5 canSaveToDisk:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSTemplateIconCacheRecord;
  v13 = [(WBSTemplateIconCacheRecord *)&v20 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    host = v13->_host;
    v13->_host = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    templateIconURL = v13->_templateIconURL;
    v13->_templateIconURL = (NSURL *)v16;

    objc_storeStrong((id *)&v13->_themeColor, a5);
    v13->_canSaveToDisk = a6;
    v18 = v13;
  }

  return v13;
}

- (NSString)host
{
  return self->_host;
}

- (NSURL)templateIconURL
{
  return self->_templateIconURL;
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (BOOL)canSaveToDisk
{
  return self->_canSaveToDisk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_storeStrong((id *)&self->_templateIconURL, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end