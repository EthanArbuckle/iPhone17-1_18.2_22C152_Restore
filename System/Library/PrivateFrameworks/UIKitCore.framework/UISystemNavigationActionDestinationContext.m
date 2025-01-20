@interface UISystemNavigationActionDestinationContext
+ (id)systemNavigationActionContextWithTitle:(id)a3 andURL:(id)a4;
+ (id)systemNavigationActionContextWithTitle:(id)a3 bundleId:(id)a4;
+ (id)systemNavigationActionContextWithTitle:(id)a3 sceneIdentifier:(id)a4;
+ (id)systemNavigationActionContextWithURL:(id)a3;
- (NSString)bundleId;
- (NSString)debugDescription;
- (NSString)sceneIdentifier;
- (NSString)title;
- (NSURL)URL;
- (UISystemNavigationActionDestinationContext)initWithXPCDictionary:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation UISystemNavigationActionDestinationContext

+ (id)systemNavigationActionContextWithTitle:(id)a3 andURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6)
  {
    uint64_t v9 = [a1 systemNavigationActionContextWithTitle:v6 bundleId:0];
LABEL_5:
    v10 = (void *)v9;
    goto LABEL_6;
  }
  if (v7)
  {
    uint64_t v9 = [a1 systemNavigationActionContextWithURL:v7];
    goto LABEL_5;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

+ (id)systemNavigationActionContextWithTitle:(id)a3 bundleId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setTitle:v7];

  [v8 setBundleId:v6];
  return v8;
}

+ (id)systemNavigationActionContextWithTitle:(id)a3 sceneIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setTitle:v7];

  [v8 setSceneIdentifier:v6];
  return v8;
}

+ (id)systemNavigationActionContextWithURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setURL:v4];

  return v5;
}

- (UISystemNavigationActionDestinationContext)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UISystemNavigationActionDestinationContext;
  id v5 = [(UISystemNavigationActionDestinationContext *)&v20 init];
  if (v5)
  {
    id v6 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
    uint64_t v7 = [v6 copy];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    uint64_t v9 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
    uint64_t v10 = [v9 copy];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v10;

    v12 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
    if ([v12 length])
    {
      v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12 encodingInvalidCharacters:0];
    }
    else
    {
      v13 = 0;
    }
    uint64_t v14 = [v13 copy];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v14;

    v16 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
    uint64_t v17 = [v16 copy];
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v17;
  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v7 = a3;
  if ([(NSString *)self->_title length]) {
    BSSerializeStringToXPCDictionaryWithKey();
  }
  if ([(NSString *)self->_bundleId length]) {
    BSSerializeStringToXPCDictionaryWithKey();
  }
  URL = self->_URL;
  if (URL)
  {
    id v5 = [(NSURL *)URL absoluteString];
    BSSerializeStringToXPCDictionaryWithKey();
  }
  id v6 = v7;
  if (self->_sceneIdentifier)
  {
    BSSerializeStringToXPCDictionaryWithKey();
    id v6 = v7;
  }
}

- (NSString)debugDescription
{
  title = self->_title;
  if (title)
  {
    sceneIdentifier = self->_sceneIdentifier;
    if (sceneIdentifier) {
      [NSString stringWithFormat:@"<%@: title: %@, sceneIdentifier: %@>", self, title, sceneIdentifier];
    }
    else {
    uint64_t v9 = [NSString stringWithFormat:@"<%@: title: %@, bundleId: %@>", self, title, self->_bundleId];
    }
  }
  else
  {
    URL = self->_URL;
    if (URL)
    {
      id v6 = NSString;
      id v7 = [(NSURL *)URL absoluteString];
      id v8 = [v6 stringWithFormat:@"<%@: URL: %@>", self, v7];

      goto LABEL_9;
    }
    v11.receiver = self;
    v11.super_class = (Class)UISystemNavigationActionDestinationContext;
    uint64_t v9 = [(UISystemNavigationActionDestinationContext *)&v11 debugDescription];
  }
  id v8 = (void *)v9;
LABEL_9:
  return (NSString *)v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end