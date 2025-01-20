@interface WBSTouchIconResponse
+ (id)responseWithURL:(id)a3 touchIcon:(id)a4 generated:(BOOL)a5 extractedBackgroundColor:(id)a6;
- (BOOL)isGenerated;
- (NSDate)nextIconDownloadRetryDate;
- (NSString)description;
- (UIColor)extractedBackgroundColor;
- (UIImage)touchIcon;
- (WBSTouchIconResponse)initWithURL:(id)a3;
- (WBSTouchIconResponse)initWithURL:(id)a3 touchIcon:(id)a4 generated:(BOOL)a5 extractedBackgroundColor:(id)a6;
- (void)setNextIconDownloadRetryDate:(id)a3;
@end

@implementation WBSTouchIconResponse

- (void)setNextIconDownloadRetryDate:(id)a3
{
}

+ (id)responseWithURL:(id)a3 touchIcon:(id)a4 generated:(BOOL)a5 extractedBackgroundColor:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithURL:v12 touchIcon:v11 generated:v6 extractedBackgroundColor:v10];

  return v13;
}

- (WBSTouchIconResponse)initWithURL:(id)a3 touchIcon:(id)a4 generated:(BOOL)a5 extractedBackgroundColor:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WBSTouchIconResponse;
  v13 = [(WBSSiteMetadataResponse *)&v17 initWithURL:a3];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_touchIcon, a4);
    objc_storeStrong((id *)&v14->_extractedBackgroundColor, a6);
    v14->_generated = a5;
    v15 = v14;
  }

  return v14;
}

- (UIImage)touchIcon
{
  return self->_touchIcon;
}

- (UIColor)extractedBackgroundColor
{
  return self->_extractedBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextIconDownloadRetryDate, 0);
  objc_storeStrong((id *)&self->_extractedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_touchIcon, 0);
}

- (WBSTouchIconResponse)initWithURL:(id)a3
{
  return 0;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_generated) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; Touch Icon = %@; Extracted background color = %@; Generated = %@>",
                       v4,
                       self,
                       self->_touchIcon,
                       self->_extractedBackgroundColor,
                       v5);
}

- (NSDate)nextIconDownloadRetryDate
{
  return self->_nextIconDownloadRetryDate;
}

- (BOOL)isGenerated
{
  return self->_generated;
}

@end