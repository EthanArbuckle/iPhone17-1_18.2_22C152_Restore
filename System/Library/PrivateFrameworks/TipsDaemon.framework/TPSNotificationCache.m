@interface TPSNotificationCache
+ (BOOL)supportsSecureCoding;
+ (id)notificationCacheWithCollectionIdentifier:(id)a3 document:(id)a4 type:(unint64_t)a5;
- (BOOL)hasLocaleChanged;
- (NSDictionary)extensionPayload;
- (NSString)collectionIdentifier;
- (NSString)locale;
- (NSURL)attachmentURL;
- (TPSDocument)document;
- (TPSNotificationCache)initWithCoder:(id)a3;
- (TPSNotificationCache)initWithCollectionIdentifier:(id)a3 document:(id)a4 type:(unint64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachmentURL:(id)a3;
- (void)setCollectionIdentifier:(id)a3;
- (void)setDocument:(id)a3;
- (void)setExtensionPayload:(id)a3;
- (void)setLocale:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TPSNotificationCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)notificationCacheWithCollectionIdentifier:(id)a3 document:(id)a4 type:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCollectionIdentifier:v8 document:v7 type:a5];

  return v9;
}

- (TPSNotificationCache)initWithCollectionIdentifier:(id)a3 document:(id)a4 type:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = [(TPSNotificationCache *)self init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a5;
    objc_storeStrong((id *)&v11->_collectionIdentifier, a3);
    objc_storeStrong((id *)&v12->_document, a4);
    v13 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    uint64_t v14 = [v13 firstObject];
    locale = v12->_locale;
    v12->_locale = (NSString *)v14;
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(TPSNotificationCache *)self locale];
  [v4 setLocale:v5];

  objc_msgSend(v4, "setType:", -[TPSNotificationCache type](self, "type"));
  v6 = [(TPSNotificationCache *)self extensionPayload];
  [v4 setExtensionPayload:v6];

  id v7 = [(TPSNotificationCache *)self document];
  [v4 setDocument:v7];

  id v8 = [(TPSNotificationCache *)self attachmentURL];
  [v4 setAttachmentURL:v8];

  id v9 = [(TPSNotificationCache *)self collectionIdentifier];
  [v4 setCollectionIdentifier:v9];

  return v4;
}

- (TPSNotificationCache)initWithCoder:(id)a3
{
  v25[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TPSNotificationCache;
  v5 = [(TPSNotificationCache *)&v23 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    locale = v5->_locale;
    v5->_locale = (NSString *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    v25[4] = objc_opt_class();
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:5];
    id v10 = [v8 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"extensionPayload"];
    extensionPayload = v5->_extensionPayload;
    v5->_extensionPayload = (NSDictionary *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    v15 = [v13 setWithArray:v14];

    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"document"];
    document = v5->_document;
    v5->_document = (TPSDocument *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collectionIdentifier"];
    collectionIdentifier = v5->_collectionIdentifier;
    v5->_collectionIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attachmentURL"];
    attachmentURL = v5->_attachmentURL;
    v5->_attachmentURL = (NSURL *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSNotificationCache type](self, "type"), @"type");
  v5 = [(TPSNotificationCache *)self locale];
  [v4 encodeObject:v5 forKey:@"locale"];

  uint64_t v6 = [(TPSNotificationCache *)self extensionPayload];
  [v4 encodeObject:v6 forKey:@"extensionPayload"];

  id v7 = [(TPSNotificationCache *)self document];
  [v4 encodeObject:v7 forKey:@"document"];

  id v8 = [(TPSNotificationCache *)self collectionIdentifier];
  [v4 encodeObject:v8 forKey:@"collectionIdentifier"];

  id v9 = [(TPSNotificationCache *)self attachmentURL];
  [v4 encodeObject:v9 forKey:@"attachmentURL"];
}

- (BOOL)hasLocaleChanged
{
  v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v4 = [v3 firstObject];

  v5 = [(TPSNotificationCache *)self locale];
  LOBYTE(v3) = [v4 isEqualToString:v5] ^ 1;

  return (char)v3;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v14.receiver = self;
  v14.super_class = (Class)TPSNotificationCache;
  id v4 = [(TPSNotificationCache *)&v14 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  [v5 appendFormat:@"\n%@ = %lu\n", @"type", -[TPSNotificationCache type](self, "type")];
  uint64_t v6 = [(TPSNotificationCache *)self document];
  id v7 = [v6 debugDescription];
  [v5 appendFormat:@"%@ = %@\n", @"document", v7];

  id v8 = [(TPSNotificationCache *)self collectionIdentifier];
  [v5 appendFormat:@"%@ = %@\n", @"collectionIdentifier", v8];

  id v9 = [(TPSNotificationCache *)self locale];
  [v5 appendFormat:@"%@ = %@\n", @"locale", v9];

  id v10 = [(TPSNotificationCache *)self attachmentURL];
  [v5 appendFormat:@"%@ = %@\n", @"attachmentURL", v10];

  uint64_t v11 = [(TPSNotificationCache *)self extensionPayload];

  if (v11)
  {
    v12 = [(TPSNotificationCache *)self extensionPayload];
    [v5 appendFormat:@"%@ = %@\n", @"extensionPayload", v12];
  }

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (void)setCollectionIdentifier:(id)a3
{
}

- (NSDictionary)extensionPayload
{
  return self->_extensionPayload;
}

- (void)setExtensionPayload:(id)a3
{
}

- (NSURL)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setAttachmentURL:(id)a3
{
}

- (TPSDocument)document
{
  return self->_document;
}

- (void)setDocument:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);
  objc_storeStrong((id *)&self->_extensionPayload, 0);

  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
}

@end