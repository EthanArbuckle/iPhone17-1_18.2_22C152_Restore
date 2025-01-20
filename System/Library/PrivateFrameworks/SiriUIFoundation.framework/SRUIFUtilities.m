@interface SRUIFUtilities
+ (BOOL)shouldRedactSpeakableTextForAceObject:(id)a3;
+ (BOOL)string:(id)a3 equalToString:(id)a4;
+ (BOOL)string:(id)a3 isSameAsUserUtterance:(id)a4;
+ (id)_normalizeTextString:(id)a3;
+ (id)descriptionForAceView:(id)a3;
+ (id)descriptionForAddDialogs:(id)a3;
+ (id)descriptionForAddViews:(id)a3;
+ (id)descriptionForDialog:(id)a3;
+ (id)descriptionForSayIt:(id)a3;
+ (id)parsedUtteranceFromText:(id)a3 context:(id)a4 spekableObjectProviding:(id)a5;
@end

@implementation SRUIFUtilities

+ (id)parsedUtteranceFromText:(id)a3 context:(id)a4 spekableObjectProviding:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_msgSend(MEMORY[0x263F28640], "sruif_speakableUtteranceParserForCurrentLanguage");
  id v11 = v7;
  if (v8 && objc_msgSend(v10, "sruif_hasExternalDomainsForStringWithFormat:shouldRedactLog:", v11, 0))
  {
    v12 = [v9 speakableProviderForObject:v8];
    if (v12) {
      [v10 registerProvider:v12 forNamespace:*MEMORY[0x263F28720]];
    }
  }
  id v17 = 0;
  v13 = [v10 parseStringWithFormat:v11 error:&v17];
  id v14 = v17;
  if (v14)
  {
    v15 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      +[SRUIFUtilities parsedUtteranceFromText:context:spekableObjectProviding:]((uint64_t)v14, v15);
    }
  }

  return v13;
}

+ (id)descriptionForAddViews:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v5 = objc_opt_class();
  v6 = [v3 aceId];
  id v7 = [v3 refId];
  id v8 = (void *)[v4 initWithFormat:@"<%@: %@ refId:%@>\n", v5, v6, v7];

  id v9 = [v3 responseMode];

  if (v9)
  {
    v10 = [v3 responseMode];
    [v8 appendFormat:@"responseMode=%@\n", v10];
  }
  id v11 = [v3 patternId];

  if (v11)
  {
    v12 = [v3 patternId];
    [v8 appendFormat:@"patternId=%@\n", v12];
  }
  v13 = [v3 patternType];

  if (v13)
  {
    id v14 = [v3 patternType];
    [v8 appendFormat:@"patternType=%@\n", v14];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v15 = [v3 views];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = +[SRUIFUtilities descriptionForAceView:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        [v8 appendFormat:@"%@\n", v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }

  return v8;
}

+ (id)descriptionForAddDialogs:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v5 = objc_opt_class();
  v6 = [v3 aceId];
  id v7 = (void *)[v4 initWithFormat:@"<%@: %@>\n", v5, v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [v3 dialogs];
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
        v13 = +[SRUIFUtilities descriptionForDialog:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v7 appendFormat:@"%@\n", v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)descriptionForDialog:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v5 = objc_opt_class();
  v6 = [v3 aceId];
  id v7 = (void *)[v4 initWithFormat:@"<%@: %@\n", v5, v6];

  id v8 = [v3 caption];

  if (v8)
  {
    uint64_t v9 = [v3 caption];
    uint64_t v10 = [v9 text];

    if (v10)
    {
      uint64_t v11 = [v3 caption];
      v12 = [v11 text];
      [v7 appendFormat:@"caption.text=\"%@\"\n", v12];
    }
    v13 = [v3 caption];
    id v14 = [v13 speakableTextOverride];

    if (v14)
    {
      long long v15 = [v3 caption];
      long long v16 = [v15 speakableTextOverride];
      [v7 appendFormat:@"caption.speakableTextOverride=\"%@\"\n", v16];
    }
  }
  long long v17 = [v3 content];

  if (v17)
  {
    long long v18 = [v3 content];
    v19 = [v18 text];

    if (v19)
    {
      if ([v3 canUseServerTTS])
      {
        uint64_t v20 = [v3 content];
        v21 = [v20 text];
        [v7 appendFormat:@"content.text=\"%@\"\n", v21];
      }
      else
      {
        [v7 appendFormat:@"content.text=\"%@\"\n", @"<private>"];
      }
    }
    long long v22 = [v3 content];
    long long v23 = [v22 speakableTextOverride];

    if (v23)
    {
      if ([v3 canUseServerTTS])
      {
        long long v24 = [v3 content];
        long long v25 = [v24 speakableTextOverride];
        [v7 appendFormat:@"content.speakableTextOverride=\"%@\"\n", v25];
      }
      else
      {
        [v7 appendFormat:@"content.speakableTextOverride=\"%@\"\n", @"<private>"];
      }
    }
  }
  if ([v3 canUseServerTTS]) {
    objc_msgSend(v7, "appendFormat:", @"canUseServerTTS=%i\n", objc_msgSend(v3, "canUseServerTTS"));
  }
  v26 = [v3 dialogIdentifier];

  if (v26)
  {
    uint64_t v27 = [v3 dialogIdentifier];
    [v7 appendFormat:@"dialogIdentifier=%@\n", v27];
  }
  v28 = [v3 refId];

  if (v28)
  {
    v29 = [v3 refId];
    [v7 appendFormat:@"refId=%@\n", v29];
  }
  v30 = [v3 configuration];

  if (v30)
  {
    v31 = [v3 configuration];
    v32 = [v31 languageCode];

    if (v32)
    {
      v33 = [v31 languageCode];
      [v7 appendFormat:@"languageCode=%@\n", v33];
    }
    v34 = [v31 gender];

    if (v34)
    {
      v35 = [v31 gender];
      [v7 appendFormat:@"gender=%@\n", v35];
    }
    v36 = [v31 context];

    if (v36)
    {
      v37 = [v31 context];
      [v7 appendFormat:@"context=%@\n", v37];
    }
  }
  [v7 appendFormat:@">"];

  return v7;
}

+ (id)descriptionForAceView:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v5 = objc_opt_class();
  v6 = [v3 aceId];
  id v7 = (void *)[v4 initWithFormat:@"<%@: %@\n", v5, v6];

  id v8 = [v3 speakableText];

  if (v8)
  {
    if ([v3 canUseServerTTS])
    {
      uint64_t v9 = [v3 speakableText];
      [v7 appendFormat:@"speakableText=\"%@\"\n", v9];
    }
    else
    {
      [v7 appendFormat:@"speakableText=\"%@\"\n", @"<private>"];
    }
  }
  if ([v3 canUseServerTTS]) {
    objc_msgSend(v7, "appendFormat:", @"canUseServerTTS=%i\n", objc_msgSend(v3, "canUseServerTTS"));
  }
  uint64_t v10 = [v3 listenAfterSpeaking];

  if (v10)
  {
    uint64_t v11 = [v3 listenAfterSpeaking];
    [v7 appendFormat:@"listenAfterSpeaking=%@\n", v11];
  }
  v12 = [v3 refId];

  if (v12)
  {
    v13 = [v3 refId];
    [v7 appendFormat:@"refId=%@\n", v13];
  }
  id v14 = [v3 dialog];

  if (v14)
  {
    long long v15 = [v3 dialog];
    long long v16 = +[SRUIFUtilities descriptionForDialog:v15];
    [v7 appendFormat:@"dialog=%@\n", v16];
  }
  long long v17 = [v3 itemType];

  if (v17)
  {
    long long v18 = [v3 itemType];
    [v7 appendFormat:@"itemType = %@\n", v18];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v3;
    uint64_t v20 = [v19 text];

    if (v20)
    {
      if ([v19 canUseServerTTS])
      {
        v21 = [v19 text];
        [v7 appendFormat:@"text=\"%@\"\n", v21];
      }
      else
      {
        [v7 appendFormat:@"text=\"%@\"\n", @"<private>"];
      }
    }
    long long v22 = [v19 dialogIdentifier];

    if (v22)
    {
      long long v23 = [v19 dialogIdentifier];
      [v7 appendFormat:@"dialogIdentifier=%@\n", v23];
    }
  }
  [v7 appendFormat:@">"];

  return v7;
}

+ (id)descriptionForSayIt:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v5 = objc_opt_class();
  v6 = [v3 aceId];
  id v7 = (void *)[v4 initWithFormat:@"<%@: %@\n", v5, v6];

  id v8 = [v3 message];

  if (v8)
  {
    if ([v3 canUseServerTTS])
    {
      uint64_t v9 = [v3 message];
      [v7 appendFormat:@"message=\"%@\"\n", v9];
    }
    else
    {
      [v7 appendFormat:@"message=\"%@\"\n", @"<private>"];
    }
  }
  uint64_t v10 = [v3 audioData];

  if (v10)
  {
    uint64_t v11 = [v3 audioData];
    v12 = [v11 audioBuffer];
    objc_msgSend(v7, "appendFormat:", @"audioData=%tu Bytes\n", objc_msgSend(v12, "length"));
  }
  v13 = [v3 audioDataUrl];

  if (v13)
  {
    id v14 = [v3 audioDataUrl];
    [v7 appendFormat:@"audioDataUrl=%@n", v14];
  }
  long long v15 = [v3 listenAfterSpeaking];

  if (v15)
  {
    long long v16 = [v3 listenAfterSpeaking];
    [v7 appendFormat:@"listenAfterSpeaking=%@\n", v16];
  }
  if ([v3 canUseServerTTS]) {
    objc_msgSend(v7, "appendFormat:", @"canUseServerTTS=%i\n", objc_msgSend(v3, "canUseServerTTS"));
  }
  long long v17 = [v3 dialogIdentifier];

  if (v17)
  {
    long long v18 = [v3 dialogIdentifier];
    [v7 appendFormat:@"dialogIdentifier=%@\n", v18];
  }
  id v19 = [v3 gender];

  if (v19)
  {
    uint64_t v20 = [v3 gender];
    [v7 appendFormat:@"gender=%@\n", v20];
  }
  v21 = [v3 languageCode];

  if (v21)
  {
    long long v22 = [v3 languageCode];
    [v7 appendFormat:@"languageCode=%@\n", v22];
  }
  if ([v3 repeatable]) {
    objc_msgSend(v7, "appendFormat:", @"repeatable=%i\n", objc_msgSend(v3, "repeatable"));
  }
  long long v23 = [v3 refId];

  if (v23)
  {
    long long v24 = [v3 refId];
    [v7 appendFormat:@"refId=%@\n", v24];
  }
  long long v25 = [v3 listenAfterSpeakingBehavior];

  if (v25)
  {
    v26 = [v3 listenAfterSpeakingBehavior];
    uint64_t v27 = [v26 startAlertSoundID];
    [v7 appendFormat:@"listenAfterSpeakingBehavior=%@\n", v27];
  }
  [v7 appendFormat:@">"];

  return v7;
}

+ (BOOL)string:(id)a3 equalToString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 == v6)
  {
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
    if (v5 && v6) {
      char v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

+ (BOOL)string:(id)a3 isSameAsUserUtterance:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _normalizeTextString:a3];
  char v8 = [v6 bestTextInterpretation];

  uint64_t v9 = [a1 _normalizeTextString:v8];
  LOBYTE(v6) = [v7 localizedStandardCompare:v9] == 0;

  return (char)v6;
}

+ (BOOL)shouldRedactSpeakableTextForAceObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    LODWORD(v4) = [v3 canUseServerTTS] ^ 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v4 = objc_msgSend(v3, "views", 0);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v4);
            }
            if (![*(id *)(*((void *)&v10 + 1) + 8 * i) canUseServerTTS])
            {

              LOBYTE(v4) = 1;
              goto LABEL_5;
            }
          }
          uint64_t v7 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
    }
    LOBYTE(v4) = 0;
  }
LABEL_5:

  return (char)v4;
}

+ (id)_normalizeTextString:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  id v5 = [v3 whitespaceCharacterSet];
  uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];

  uint64_t v7 = [v6 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];
  uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"“" withString:@"\""];

  return v8;
}

+ (void)parsedUtteranceFromText:(uint64_t)a1 context:(NSObject *)a2 spekableObjectProviding:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "+[SRUIFUtilities parsedUtteranceFromText:context:spekableObjectProviding:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_225FBA000, a2, OS_LOG_TYPE_ERROR, "%s utterance parsing failed with error %@", (uint8_t *)&v2, 0x16u);
}

@end