@interface TUGeoLocationMetadataCacheDataProvider
- (PNRPhoneNumberResolver)phoneNumberResolver;
- (TUGeoLocationMetadataCacheDataProvider)init;
- (id)locationForMetadataIdentifier:(id)a3;
- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4;
@end

@implementation TUGeoLocationMetadataCacheDataProvider

- (TUGeoLocationMetadataCacheDataProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUGeoLocationMetadataCacheDataProvider;
  v2 = [(TUMetadataCacheDataProvider *)&v8 init];
  if (v2 && PhoneNumberResolverLibraryCore())
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getPNRPhoneNumberResolverClass_softClass;
    uint64_t v13 = getPNRPhoneNumberResolverClass_softClass;
    if (!getPNRPhoneNumberResolverClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getPNRPhoneNumberResolverClass_block_invoke;
      v9[3] = &unk_1E58E5F90;
      v9[4] = &v10;
      __getPNRPhoneNumberResolverClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (PNRPhoneNumberResolver *)objc_alloc_init(v4);
    phoneNumberResolver = v2->_phoneNumberResolver;
    v2->_phoneNumberResolver = v5;
  }
  return v2;
}

- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = a4;
  dispatch_group_enter(v7);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v14 = -[TUGeoLocationMetadataCacheDataProvider locationForMetadataIdentifier:](self, "locationForMetadataIdentifier:", v13, (void)v15);
        if (v14) {
          [(TUMetadataCacheDataProvider *)self setObject:v14 forDestinationID:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  dispatch_group_leave(v7);
}

- (id)locationForMetadataIdentifier:(id)a3
{
  v4 = [a3 handle];
  v5 = [v4 normalizedValue];

  if (objc_msgSend(v5, "pn_hasInternationalDirectDialingPrefix"))
  {
    id v6 = [MEMORY[0x1E4F1CA20] currentLocale];
    v7 = [v6 countryCode];
    id v8 = [v7 lowercaseString];

    uint64_t v9 = [(TUGeoLocationMetadataCacheDataProvider *)self phoneNumberResolver];
    id v14 = 0;
    uint64_t v10 = [v9 resolvePhoneNumber:v5 countryCode:v8 error:&v14];
    id v11 = v14;

    if (v11)
    {
      uint64_t v12 = TUDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(TUGeoLocationMetadataCacheDataProvider *)(uint64_t)v5 locationForMetadataIdentifier:v12];
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (PNRPhoneNumberResolver)phoneNumberResolver
{
  return self->_phoneNumberResolver;
}

- (void).cxx_destruct
{
}

- (void)locationForMetadataIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_19C496000, log, OS_LOG_TYPE_ERROR, "Resolving %@ to a geographic location failed with error %@", (uint8_t *)&v3, 0x16u);
}

@end