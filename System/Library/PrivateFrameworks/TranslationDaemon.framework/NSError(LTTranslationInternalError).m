@interface NSError(LTTranslationInternalError)
+ (id)lt_bundle;
+ (id)lt_incompatibleForcedRoutes;
+ (id)lt_internalErrorWithCode:()LTTranslationInternalError description:userInfo:;
+ (id)lt_internalTTSCreationError;
+ (id)lt_lidModelLoadError;
+ (id)lt_offlineTTSErrorWithError:()LTTranslationInternalError;
+ (id)lt_translationNotWorking;
+ (id)lt_unsupporedLocalePairError:()LTTranslationInternalError;
@end

@implementation NSError(LTTranslationInternalError)

+ (id)lt_bundle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__NSError_LTTranslationInternalError__lt_bundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lt_bundle_onceToken != -1) {
    dispatch_once(&lt_bundle_onceToken, block);
  }
  v1 = (void *)lt_bundle_bundle;
  return v1;
}

+ (id)lt_internalErrorWithCode:()LTTranslationInternalError description:userInfo:
{
  id v7 = a4;
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)[v8 mutableCopy];
  }
  else
  {
    v10 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v11 = v10;
  if (v7) {
    [v10 setObject:v7 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  v12 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationInternalErrorDomain" code:a3 userInfo:v11];

  return v12;
}

+ (id)lt_incompatibleForcedRoutes
{
  v2 = objc_msgSend(a1, "lt_bundle");
  v3 = [v2 localizedStringForKey:@"INVALID_ONLINE_OFFLINE_REQUEST_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
  v4 = objc_msgSend(a1, "lt_internalErrorWithCode:description:userInfo:", 0, v3, 0);

  return v4;
}

+ (id)lt_lidModelLoadError
{
  v2 = objc_msgSend(a1, "lt_bundle");
  v3 = [v2 localizedStringForKey:@"LID_MODEL_LOAD_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
  v4 = objc_msgSend(a1, "lt_internalErrorWithCode:description:userInfo:", 4, v3, 0);

  return v4;
}

+ (id)lt_offlineTTSErrorWithError:()LTTranslationInternalError
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(a1, "lt_bundle");
  v6 = [v5 localizedStringForKey:@"OFFLINE_TTS_FAILURE_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
  uint64_t v10 = *MEMORY[0x263F08608];
  v11[0] = v4;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];

  id v8 = objc_msgSend(a1, "lt_internalErrorWithCode:description:userInfo:", 7, v6, v7);

  return v8;
}

+ (id)lt_internalTTSCreationError
{
  v2 = objc_msgSend(a1, "lt_bundle");
  v3 = [v2 localizedStringForKey:@"TTS_PLAYER_FAILURE_ERROR_DESCRIPTION" value:&stru_270C008E8 table:0];
  id v4 = objc_msgSend(a1, "lt_internalErrorWithCode:description:userInfo:", 9, v3, 0);

  return v4;
}

+ (id)lt_unsupporedLocalePairError:()LTTranslationInternalError
{
  id v4 = a3;
  v5 = [v4 sourceLocale];
  v6 = [v5 _ltLocaleIdentifier];

  id v7 = [v4 targetLocale];

  id v8 = [v7 _ltLocaleIdentifier];

  v9 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v10 = [v9 localizedStringForLocaleIdentifier:v6];

  v11 = [MEMORY[0x263EFF960] currentLocale];
  v12 = [v11 localizedStringForLocaleIdentifier:v8];

  v13 = NSString;
  v14 = [MEMORY[0x263F086E0] mainBundle];
  v15 = [v14 localizedStringForKey:@"UNSUPPORTED_LOCALE_PAIR_ERROR_DESCRIPTION_FORMATTED_STRING" value:&stru_270C008E8 table:0];
  v16 = objc_msgSend(v13, "stringWithFormat:", v15, v10, v12);

  v17 = objc_msgSend(a1, "lt_errorWithCode:description:userInfo:", 11, v16, 0);

  return v17;
}

+ (id)lt_translationNotWorking
{
  v2 = objc_msgSend(a1, "lt_bundle");
  v3 = [v2 localizedStringForKey:@"TRANSLATION_NOT_WORKING" value:&stru_270C008E8 table:0];
  id v4 = objc_msgSend(a1, "lt_internalErrorWithCode:description:userInfo:", 11, v3, 0);

  return v4;
}

@end