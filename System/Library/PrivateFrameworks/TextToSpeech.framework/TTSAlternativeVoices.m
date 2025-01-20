@interface TTSAlternativeVoices
+ (BOOL)isCombinedVocalizerVoiceIdentifier:(id)a3;
+ (BOOL)isCompactVocalizerVoiceIdentifier:(id)a3;
+ (BOOL)isNeuralAXSiriVoiceIdentifier:(id)a3;
+ (BOOL)isNeuralSiriVoiceIdentifier:(id)a3;
+ (BOOL)isOldSiriVoiceIdentifier:(id)a3;
+ (BOOL)isPersonalVoiceIdentifier:(id)a3;
+ (BOOL)isSiriVoiceIdentifier:(id)a3;
+ (BOOL)isVocalizerVoiceIdentifier:(id)a3;
+ (id)nameForVoiceIdentifier:(id)a3;
@end

@implementation TTSAlternativeVoices

+ (BOOL)isVocalizerVoiceIdentifier:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_hasPrefix_(v4, v5, @"com.apple.ttsbundle", v6, v7)
    && (objc_msgSend_isOldSiriVoiceIdentifier_(a1, v8, (uint64_t)v4, v9, v10) & 1) == 0)
  {
    int v14 = objc_msgSend_isSiriVoiceIdentifier_(a1, v11, (uint64_t)v4, v12, v13) ^ 1;
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

+ (BOOL)isOldSiriVoiceIdentifier:(id)a3
{
  return objc_msgSend_hasPrefix_(a3, a2, @"com.apple.ttsbundle.siri", v3, v4);
}

+ (BOOL)isSiriVoiceIdentifier:(id)a3
{
  return objc_msgSend_hasPrefix_(a3, a2, @"com.apple.ttsbundle.gryphon", v3, v4);
}

+ (BOOL)isNeuralSiriVoiceIdentifier:(id)a3
{
  return objc_msgSend_hasPrefix_(a3, a2, @"com.apple.ttsbundle.gryphon-neural", v3, v4);
}

+ (BOOL)isPersonalVoiceIdentifier:(id)a3
{
  return objc_msgSend_hasPrefix_(a3, a2, @"com.apple.speech.personalvoice", v3, v4);
}

+ (BOOL)isNeuralAXSiriVoiceIdentifier:(id)a3
{
  return objc_msgSend_hasPrefix_(a3, a2, @"com.apple.ttsbundle.gryphon-neuralAX", v3, v4);
}

+ (BOOL)isCompactVocalizerVoiceIdentifier:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isVocalizerVoiceIdentifier_(a1, v5, (uint64_t)v4, v6, v7))
  {
    id v18 = 0;
    id v19 = 0;
    int v10 = TTSGetComponentsInNashvilleVoiceIdentifier(v4, (char *)&v19, &v18, v8, v9);
    id v11 = v19;
    id v12 = v18;
    v16 = v12;
    if (v10) {
      LOBYTE(v10) = objc_msgSend_isEqualToString_(v12, v13, @"compact", v14, v15);
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (BOOL)isCombinedVocalizerVoiceIdentifier:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isVocalizerVoiceIdentifier_(a1, v5, (uint64_t)v4, v6, v7))
  {
    uint64_t v14 = 0;
    id v15 = 0;
    BOOL v10 = TTSGetComponentsInNashvilleVoiceIdentifier(v4, (char *)&v15, &v14, v8, v9);
    id v11 = v15;
    if (v14) {
      char v12 = !v10;
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (id)nameForVoiceIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_sharedInstance(TTSAXResourceManager, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_resourceWithVoiceId_(v9, v10, (uint64_t)v4, v11, v12);

  LODWORD(a1) = objc_msgSend_isSiriVoiceIdentifier_(a1, v14, (uint64_t)v4, v15, v16);
  if (a1)
  {
    v21 = objc_msgSend_localizedName(v13, v17, v18, v19, v20);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end