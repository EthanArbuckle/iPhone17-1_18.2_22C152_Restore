@interface PDCFileBackedConsentStore
- (NSSet)consentedBundleIdentifiers;
- (NSURL)storeURL;
- (PDCFileBackedConsentStore)initWithConsentStoreURL:(id)a3;
- (id)changeObserver;
- (id)consentRecordURLForBundleIdentifier:(id)a3;
- (id)userConsentedRegulatoryDisclosureVersionForBundleIdentifier:(id)a3;
- (id)writeUserConsentedRegulatoryDisclosureVersion:(id)a3 forBundleIdentifier:(id)a4;
- (void)setChangeObserver:(id)a3;
@end

@implementation PDCFileBackedConsentStore

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeObserver, 0);

  objc_storeStrong((id *)&self->_storeURL, 0);
}

- (PDCFileBackedConsentStore)initWithConsentStoreURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PDCFileBackedConsentStore;
  v6 = [(PDCFileBackedConsentStore *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeURL, a3);
    v8 = v7;
  }

  return v7;
}

- (id)userConsentedRegulatoryDisclosureVersionForBundleIdentifier:(id)a3
{
  if (a3)
  {
    v3 = -[PDCFileBackedConsentStore consentRecordURLForBundleIdentifier:](self, "consentRecordURLForBundleIdentifier:");
    if (v3)
    {
      id v9 = 0;
      v4 = [NSString stringWithContentsOfURL:v3 encoding:4 error:&v9];
      id v5 = v9;
      if (v5)
      {
        v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[PDCFileBackedConsentStore userConsentedRegulatoryDisclosureVersionForBundleIdentifier:]((uint64_t)v3, v6);
        }
        id v7 = 0;
      }
      else
      {
        id v7 = v4;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)writeUserConsentedRegulatoryDisclosureVersion:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PDCFileBackedConsentStore *)self consentRecordURLForBundleIdentifier:v7];
  id v9 = v8;
  if (v6)
  {
    objc_super v10 = [MEMORY[0x263F08850] defaultManager];
    v11 = [v9 URLByDeletingLastPathComponent];
    id v19 = 0;
    [v10 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v19];
    id v12 = v19;

    if (v12) {
      goto LABEL_10;
    }
    uint64_t v18 = 0;
    [v6 writeToURL:v9 atomically:1 encoding:4 error:&v18];
  }
  else if (unlink((const char *)[v8 fileSystemRepresentation]))
  {
    uint64_t v13 = *__error();
    if (v13 != 2)
    {
      id v16 = objc_alloc(MEMORY[0x263F087E8]);
      id v12 = (id)[v16 initWithDomain:*MEMORY[0x263F08438] code:v13 userInfo:0];
      goto LABEL_10;
    }
  }
  uint64_t v14 = [(PDCFileBackedConsentStore *)self changeObserver];
  v15 = (void *)v14;
  if (v14) {
    (*(void (**)(uint64_t, PDCFileBackedConsentStore *, id, id))(v14 + 16))(v14, self, v7, v6);
  }

  id v12 = 0;
LABEL_10:

  return v12;
}

- (id)consentRecordURLForBundleIdentifier:(id)a3
{
  return [(NSURL *)self->_storeURL URLByAppendingPathComponent:a3];
}

- (NSSet)consentedBundleIdentifiers
{
  v2 = objc_msgSend(NSString, "stringWithUTF8String:", -[NSURL fileSystemRepresentation](self->_storeURL, "fileSystemRepresentation"));
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [v3 contentsOfDirectoryAtPath:v2 error:0];

  id v5 = [MEMORY[0x263EFFA08] setWithArray:v4];

  return (NSSet *)v5;
}

- (NSURL)storeURL
{
  return self->_storeURL;
}

- (id)changeObserver
{
  return self->_changeObserver;
}

- (void)setChangeObserver:(id)a3
{
}

- (void)userConsentedRegulatoryDisclosureVersionForBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25A653000, a2, OS_LOG_TYPE_ERROR, "Failed to read authorization record at %@", (uint8_t *)&v2, 0xCu);
}

@end