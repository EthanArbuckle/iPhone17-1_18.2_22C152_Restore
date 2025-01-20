@interface QLPreviewReplyAttachment
+ (BOOL)supportsSecureCoding;
- (NSData)data;
- (QLPreviewReplyAttachment)initWithCoder:(id)a3;
- (QLPreviewReplyAttachment)initWithData:(NSData *)data contentType:(UTType *)contentType;
- (UTType)contentType;
- (void)encodeWithCoder:(id)a3;
- (void)setContentType:(id)a3;
- (void)setData:(id)a3;
@end

@implementation QLPreviewReplyAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLPreviewReplyAttachment)initWithData:(NSData *)data contentType:(UTType *)contentType
{
  v7 = data;
  v8 = contentType;
  v12.receiver = self;
  v12.super_class = (Class)QLPreviewReplyAttachment;
  v9 = [(QLPreviewReplyAttachment *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, data);
    objc_storeStrong((id *)&v10->_contentType, contentType);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(QLPreviewReplyAttachment *)self data];
  [v4 encodeObject:v5 forKey:@"data"];

  id v6 = [(QLPreviewReplyAttachment *)self contentType];
  [v4 encodeObject:v6 forKey:@"contentType"];
}

- (QLPreviewReplyAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLPreviewReplyAttachment;
  v5 = [(QLPreviewReplyAttachment *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    [(QLPreviewReplyAttachment *)v5 setData:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];
    [(QLPreviewReplyAttachment *)v5 setContentType:v7];
  }
  return v5;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
}

- (UTType)contentType
{
  return (UTType *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContentType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end