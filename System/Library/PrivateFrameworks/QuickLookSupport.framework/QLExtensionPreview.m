@interface QLExtensionPreview
+ (BOOL)supportsSecureCoding;
- (NSString)previewDescription;
- (QLExtensionPreview)initWithCoder:(id)a3;
- (QLExtensionPreview)initWithDescription:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPreviewDescription:(id)a3;
@end

@implementation QLExtensionPreview

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLExtensionPreview)initWithDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)QLExtensionPreview;
  v6 = [(QLExtensionPreview *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_previewDescription, a3);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(QLExtensionPreview *)self previewDescription];
  [v4 encodeObject:v5 forKey:@"previewDescription"];
}

- (QLExtensionPreview)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previewDescription"];

  v6 = [(QLExtensionPreview *)self initWithDescription:v5];
  return v6;
}

- (NSString)previewDescription
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPreviewDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end