@interface AFSpeakableUtteranceParser(SiriUIFoundationAdditions)
+ (id)_domainsForStringWithFormat:()SiriUIFoundationAdditions;
+ (id)sruif_speakableUtteranceParserForCurrentLanguage;
- (id)_builtInDomains;
- (uint64_t)sruif_hasExternalDomainsForStringWithFormat:()SiriUIFoundationAdditions shouldRedactLog:;
@end

@implementation AFSpeakableUtteranceParser(SiriUIFoundationAdditions)

+ (id)sruif_speakableUtteranceParserForCurrentLanguage
{
  id v0 = objc_alloc(MEMORY[0x263EFF960]);
  v1 = SRUIFGetLanguageCode();
  v2 = (void *)[v0 initWithLocaleIdentifier:v1];

  v3 = (void *)[objc_alloc(MEMORY[0x263F28640]) initWithLocale:v2];
  return v3;
}

- (uint64_t)sruif_hasExternalDomainsForStringWithFormat:()SiriUIFoundationAdditions shouldRedactLog:
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(id)objc_opt_class() _domainsForStringWithFormat:v6];
  if (v7)
  {
    v8 = [a1 _builtInDomains];
    uint64_t v9 = [v7 isSubsetOfSet:v8] ^ 1;
  }
  else
  {
    uint64_t v9 = 1;
  }
  v10 = *MEMORY[0x263F28348];
  BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO);
  if (a4)
  {
    if (v11)
    {
      int v14 = 136315651;
      v15 = "-[AFSpeakableUtteranceParser(SiriUIFoundationAdditions) sruif_hasExternalDomainsForStringWithFormat:shouldRedactLog:]";
      __int16 v16 = 2117;
      id v17 = v6;
      __int16 v18 = 1024;
      int v19 = v9;
      v12 = "%s Format string: %{sensitive}@ has external domains: %d";
LABEL_9:
      _os_log_impl(&dword_225FBA000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v14, 0x1Cu);
    }
  }
  else if (v11)
  {
    int v14 = 136315650;
    v15 = "-[AFSpeakableUtteranceParser(SiriUIFoundationAdditions) sruif_hasExternalDomainsForStringWithFormat:shouldRedactLog:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 1024;
    int v19 = v9;
    v12 = "%s Format string: %@ has external domains: %d";
    goto LABEL_9;
  }

  return v9;
}

- (id)_builtInDomains
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if ([a1 handleTTSCodes]) {
    [v2 addObject:@"tts"];
  }
  if ([a1 handlesFunctions]) {
    [v2 addObject:@"fn"];
  }
  return v2;
}

+ (id)_domainsForStringWithFormat:()SiriUIFoundationAdditions
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__2;
  v24[4] = __Block_byref_object_dispose__2;
  id v25 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v5 = [v3 length];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__AFSpeakableUtteranceParser_SiriUIFoundationAdditions___domainsForStringWithFormat___block_invoke;
  v11[3] = &unk_2647865C0;
  v13 = &v20;
  int v14 = &v16;
  v15 = v24;
  id v6 = v4;
  id v12 = v6;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 2, v11);
  if (*((unsigned char *)v21 + 24) || *((unsigned char *)v17 + 24))
  {

    v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      +[AFSpeakableUtteranceParser(SiriUIFoundationAdditions) _domainsForStringWithFormat:]((uint64_t)v3, v7);
    }
    id v6 = 0;
  }
  v8 = v12;
  id v9 = v6;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);

  return v9;
}

+ (void)_domainsForStringWithFormat:()SiriUIFoundationAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "+[AFSpeakableUtteranceParser(SiriUIFoundationAdditions) _domainsForStringWithFormat:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_225FBA000, a2, OS_LOG_TYPE_ERROR, "%s Malformed parse for format string: %@", (uint8_t *)&v2, 0x16u);
}

@end