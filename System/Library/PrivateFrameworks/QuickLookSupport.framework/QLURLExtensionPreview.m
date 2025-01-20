@interface QLURLExtensionPreview
+ (BOOL)supportsSecureCoding;
- (NSArray)additionalURLsAccessed;
- (QLURLExtensionPreview)initWithCoder:(id)a3;
- (QLURLExtensionPreview)initWithURL:(id)a3 contentType:(id)a4;
- (QLURLExtensionPreview)initWithURLHandler:(id)a3 contentType:(id)a4;
- (QLURLHandler)urlHandler;
- (UTType)contentType;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalURLsAccessed:(id)a3;
- (void)setContentType:(id)a3;
- (void)setUrlHandler:(id)a3;
- (void)updateForExternalResourceAccessWithExtension:(id)a3 context:(id)a4;
@end

@implementation QLURLExtensionPreview

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (QLURLExtensionPreview)initWithURLHandler:(id)a3 contentType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)QLURLExtensionPreview;
  v8 = [(QLExtensionPreview *)&v11 initWithDescription:0];
  v9 = v8;
  if (v8)
  {
    [(QLURLExtensionPreview *)v8 setUrlHandler:v6];
    objc_storeStrong((id *)&v9->_contentType, a4);
  }

  return v9;
}

- (QLURLExtensionPreview)initWithURL:(id)a3 contentType:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F160E8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  v10 = (void *)[v9 initWithURL:v8 sandboxType:*MEMORY[0x263EF8000]];

  objc_super v11 = [(QLURLExtensionPreview *)self initWithURLHandler:v10 contentType:v7];
  return v11;
}

- (void)updateForExternalResourceAccessWithExtension:(id)a3 context:(id)a4
{
  v5 = objc_msgSend(a4, "_auxiliaryConnection", a3);
  id v6 = [v5 valueForEntitlement:@"com.apple.private.quickLook.externalResources"];
  uint64_t v7 = [v6 BOOLValue];

  id v8 = [(QLURLExtensionPreview *)self urlHandler];
  [v8 setNeedsAccessToExternalResources:v7];
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)QLURLExtensionPreview;
  id v4 = a3;
  [(QLExtensionPreview *)&v7 encodeWithCoder:v4];
  v5 = [(QLURLExtensionPreview *)self urlHandler];
  [v4 encodeObject:v5 forKey:@"urlHandler"];

  id v6 = [(QLURLExtensionPreview *)self contentType];
  [v4 encodeObject:v6 forKey:@"contentType"];
}

- (QLURLExtensionPreview)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlHandler"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];

  objc_super v7 = [(QLURLExtensionPreview *)self initWithURLHandler:v5 contentType:v6];
  return v7;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(QLURLExtensionPreview *)self urlHandler];
  id v6 = [v5 fileURL];
  objc_super v7 = [v3 stringWithFormat:@"<%@ %p %@>", v4, self, v6];

  return v7;
}

- (QLURLHandler)urlHandler
{
  return (QLURLHandler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrlHandler:(id)a3
{
}

- (UTType)contentType
{
  return (UTType *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContentType:(id)a3
{
}

- (NSArray)additionalURLsAccessed
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAdditionalURLsAccessed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalURLsAccessed, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_urlHandler, 0);
}

@end