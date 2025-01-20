@interface _LTHybridEndpointerAssetInfo
- (BOOL)endpointerIsAvailableWithContext:(id)a3;
- (NSString)hybridepAssetFile;
- (NSString)spgAssetFile;
- (_LTHybridEndpointerAssetInfo)initWithAvailableAssets:(id)a3 context:(id)a4;
- (id)caesuraModelURL;
- (id)endpointerModelURL:(id)a3;
- (id)getPreferredAsset:(id)a3 orAsset:(id)a4 withLocale:(id)a5;
- (id)selectAsset:(id)a3 withLocale:(id)a4;
@end

@implementation _LTHybridEndpointerAssetInfo

- (_LTHybridEndpointerAssetInfo)initWithAvailableAssets:(id)a3 context:(id)a4
{
  *(void *)&v42[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)_LTHybridEndpointerAssetInfo;
  v8 = [(_LTHybridEndpointerAssetInfo *)&v40 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_21;
  }
  hybridepAssetFile = v8->_hybridepAssetFile;
  v8->_hybridepAssetFile = (NSString *)@"hybridendpointer.json";

  spgAssetFile = v9->_spgAssetFile;
  v9->_spgAssetFile = (NSString *)@"hybridendpointer.json";

  if (!v6)
  {
    v34 = _LTOSLogSpeech();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
LABEL_21:
      v33 = 0;
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v35 = "No available endpointer assets";
LABEL_18:
    _os_log_impl(&dword_2600DC000, v34, OS_LOG_TYPE_INFO, v35, buf, 2u);
    goto LABEL_21;
  }
  if (![(_LTHybridEndpointerAssetInfo *)v9 endpointerIsAvailableWithContext:v7])
  {
    v36 = _LTOSLogSpeech();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = v36;
      v38 = [v7 localePair];
      *(_DWORD *)buf = 138543362;
      *(void *)v42 = v38;
      _os_log_impl(&dword_2600DC000, v37, OS_LOG_TYPE_INFO, "HEP endpointing is not supported for the requested locale pair: %{public}@", buf, 0xCu);
    }
    goto LABEL_21;
  }
  objc_storeStrong((id *)&v9->_context, a4);
  spgAsset = v9->_spgAsset;
  v9->_spgAsset = 0;

  sourceLanguageAsset = v9->_sourceLanguageAsset;
  v9->_sourceLanguageAsset = 0;

  targetLanguageAsset = v9->_targetLanguageAsset;
  v9->_targetLanguageAsset = 0;

  v15 = _LTOSLogSpeech();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    uint64_t v17 = [v6 count];
    *(_DWORD *)buf = 134217984;
    *(void *)v42 = v17;
    _os_log_impl(&dword_2600DC000, v16, OS_LOG_TYPE_INFO, "Number of HEP assets %zu", buf, 0xCu);
  }
  v18 = [v7 localePair];
  v19 = [v18 sourceLocale];
  uint64_t v20 = [(_LTHybridEndpointerAssetInfo *)v9 selectAsset:v6 withLocale:v19];
  v21 = v9->_sourceLanguageAsset;
  v9->_sourceLanguageAsset = (_LTDAssetModel *)v20;

  v22 = v9->_sourceLanguageAsset;
  if (v22) {
    objc_storeStrong((id *)&v9->_spgAsset, v22);
  }
  if ([v7 autodetectLanguage])
  {
    v23 = [v7 localePair];
    v24 = [v23 targetLocale];
    uint64_t v25 = [(_LTHybridEndpointerAssetInfo *)v9 selectAsset:v6 withLocale:v24];
    v26 = v9->_targetLanguageAsset;
    v9->_targetLanguageAsset = (_LTDAssetModel *)v25;

    v27 = v9->_targetLanguageAsset;
    if (v27)
    {
      uint64_t v28 = [(_LTHybridEndpointerAssetInfo *)v9 getPreferredAsset:v9->_spgAsset orAsset:v27 withLocale:0];
      v29 = v9->_spgAsset;
      v9->_spgAsset = (_LTDAssetModel *)v28;
    }
  }
  if (!v9->_sourceLanguageAsset && !v9->_targetLanguageAsset)
  {
    v34 = _LTOSLogSpeech();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v35 = "Could not find suitable HEP asset for any language";
    goto LABEL_18;
  }
  v30 = _LTOSLogSpeech();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    BOOL v31 = v9->_sourceLanguageAsset != 0;
    BOOL v32 = v9->_targetLanguageAsset != 0;
    *(_DWORD *)buf = 67109376;
    v42[0] = v31;
    LOWORD(v42[1]) = 1024;
    *(_DWORD *)((char *)&v42[1] + 2) = v32;
    _os_log_impl(&dword_2600DC000, v30, OS_LOG_TYPE_INFO, "Found asset for source %{BOOL}i, for target %{BOOL}i", buf, 0xEu);
  }
  v33 = v9;
LABEL_22:

  return v33;
}

- (id)selectAsset:(id)a3 withLocale:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      v13 = v10;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v6);
        }
        v10 = [(_LTHybridEndpointerAssetInfo *)self getPreferredAsset:v13 orAsset:*(void *)(*((void *)&v15 + 1) + 8 * v12) withLocale:v7];

        ++v12;
        v13 = v10;
      }
      while (v9 != v12);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)getPreferredAsset:(id)a3 orAsset:(id)a4 withLocale:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  uint64_t v11 = v8;
  if (v7)
  {
    if (!v9
      || (char v12 = [v7 supportsLocale:v9], v13 = objc_msgSend(v8, "supportsLocale:", v10), (v12 & 1) != 0)
      || (uint64_t v11 = v8, !v13))
    {
      uint64_t v14 = [v7 contentVersion];
      uint64_t v15 = [v8 contentVersion];
      uint64_t v11 = v8;
      if (v14 >= v15)
      {
        if (v14 != v15
          || (v16 = [v7 isPremiumTextLID], int v17 = objc_msgSend(v8, "isPremiumTextLID"), v11 = v8, v16)
          && (!v17 || (v18 = [v7 state], uint64_t v11 = v8, v18 != 4)))
        {
          uint64_t v11 = v7;
        }
      }
    }
  }
  id v19 = v11;

  return v19;
}

- (id)caesuraModelURL
{
  v3 = [(_LTDAssetModel *)self->_spgAsset getLocalFileUrl];
  v4 = [v3 URLByAppendingPathComponent:self->_spgAssetFile];

  return v4;
}

- (id)endpointerModelURL:(id)a3
{
  id v4 = a3;
  p_sourceLanguageAsset = &self->_sourceLanguageAsset;
  if (self->_sourceLanguageAsset)
  {
    id v6 = [(_LTTranslationContext *)self->_context localePair];
    id v7 = [v6 sourceLocale];

    if (v7 == v4) {
      goto LABEL_6;
    }
  }
  p_sourceLanguageAsset = &self->_targetLanguageAsset;
  if (self->_targetLanguageAsset
    && ([(_LTTranslationContext *)self->_context localePair],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v8 targetLocale],
        id v9 = (id)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9 == v4))
  {
LABEL_6:
    uint64_t v11 = [(_LTDAssetModel *)*p_sourceLanguageAsset getLocalFileUrl];
    v10 = [v11 URLByAppendingPathComponent:self->_hybridepAssetFile];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)endpointerIsAvailableWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 localePair];
  v5 = [v4 sourceLocale];
  if ([v3 autodetectLanguage])
  {
    id v6 = [v3 localePair];
    id v7 = [v6 targetLocale];
    char v8 = _LTPreferencesHybridEndpointerEnabledForLocales(v5, v7);
  }
  else
  {
    char v8 = _LTPreferencesHybridEndpointerEnabledForLocales(v5, 0);
  }

  return v8;
}

- (NSString)hybridepAssetFile
{
  return self->_hybridepAssetFile;
}

- (NSString)spgAssetFile
{
  return self->_spgAssetFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spgAssetFile, 0);
  objc_storeStrong((id *)&self->_hybridepAssetFile, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_targetLanguageAsset, 0);
  objc_storeStrong((id *)&self->_sourceLanguageAsset, 0);
  objc_storeStrong((id *)&self->_spgAsset, 0);
}

@end