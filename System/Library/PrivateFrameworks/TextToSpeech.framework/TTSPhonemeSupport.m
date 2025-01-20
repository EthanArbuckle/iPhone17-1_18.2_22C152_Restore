@interface TTSPhonemeSupport
+ (id)_getPhonemeMapForSynth:(id)a3 language:(id)a4;
+ (id)_ipaVectorFromString:(id)a3;
+ (id)_phonemesFromIPA:(id)a3 language:(id)a4 synth:(id)a5;
+ (id)applebetPhonemesFromIPA:(id)a3;
+ (id)applebetPhonemesFromLH:(id)a3;
+ (id)eloquencePhonemesFromIPA:(id)a3 language:(id)a4;
+ (id)lhPhonemesFromIPA:(id)a3 language:(id)a4;
+ (id)supportedIPAPhonemeLanguages;
@end

@implementation TTSPhonemeSupport

+ (id)applebetPhonemesFromIPA:(id)a3
{
  v4 = objc_msgSend_lhPhonemesFromIPA_language_(a1, a2, (uint64_t)a3, @"en-US", v3);
  v8 = objc_msgSend_convertLHToApplebet_(TTSLHPhonemeToApplebetPhonemeMapper, v5, (uint64_t)v4, v6, v7);

  return v8;
}

+ (id)applebetPhonemesFromLH:(id)a3
{
  return (id)objc_msgSend_convertLHToApplebet_(TTSLHPhonemeToApplebetPhonemeMapper, a2, (uint64_t)a3, v3, v4);
}

+ (id)_getPhonemeMapForSynth:(id)a3 language:(id)a4
{
  v5 = (char *)a3;
  id v10 = a4;
  if (qword_1E96C47F0 != -1) {
    dispatch_once(&qword_1E96C47F0, &unk_1EFB803A0);
  }
  objc_msgSend_lock((void *)qword_1E96C47E8, v6, v7, v8, v9);
  v14 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1E96C47E0, v11, (uint64_t)v5, v12, v13);
  v18 = objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)v10, v16, v17);

  if (!v18)
  {
    v18 = _TTSLoadIPAToNativePhonemeMapForLanguage((uint64_t)v10, v5, v20, v21, v22);
    if (v18)
    {
      v23 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1E96C47E0, v19, (uint64_t)v5, v21, v22);

      if (!v23)
      {
        v28 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v24, v25, v26, v27);
        objc_msgSend_setObject_forKeyedSubscript_((void *)qword_1E96C47E0, v29, (uint64_t)v28, (uint64_t)v5, v30);
      }
      v31 = objc_msgSend_objectForKeyedSubscript_((void *)qword_1E96C47E0, v24, (uint64_t)v5, v26, v27);
      objc_msgSend_setObject_forKeyedSubscript_(v31, v32, (uint64_t)v18, (uint64_t)v10, v33);
    }
  }
  objc_msgSend_unlock((void *)qword_1E96C47E8, v19, v20, v21, v22);

  return v18;
}

+ (id)_ipaVectorFromString:(id)a3
{
  uint64_t v4 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, @"ˌ", (uint64_t)&stru_1EFB83720, v3);
  uint64_t v9 = objc_msgSend_length(v4, v5, v6, v7, v8);
  uint64_t v17 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12, v13);
  if (v9 >= 1)
  {
    uint64_t v18 = 0;
    do
    {
      uint64_t v19 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v4, v14, v18, v15, v16);
      uint64_t v21 = v20;
      v23 = objc_msgSend_substringWithRange_(v4, v20, v19, (uint64_t)v20, v22);
      uint64_t v27 = v23;
      if (v21 == (const char *)2
        && objc_msgSend_characterAtIndex_(v23, v24, 1, v25, v26) == 865
        && v9 >= v18 + 2)
      {
        uint64_t v28 = objc_msgSend_substringWithRange_(v4, v24, v19, 3, v26);

        ++v18;
        uint64_t v27 = (void *)v28;
      }
      objc_msgSend_addObject_(v17, v24, (uint64_t)v27, v25, v26);
      v18 += (uint64_t)v21;
    }
    while (v18 < v9);
  }

  return v17;
}

+ (id)_phonemesFromIPA:(id)a3 language:(id)a4 synth:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v11 = a5;
  if (!v8) {
    id v8 = TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences();
  }
  uint64_t v15 = objc_msgSend__getPhonemeMapForSynth_language_(TTSPhonemeSupport, v9, (uint64_t)v11, (uint64_t)v8, v10);
  if (v15)
  {
    id v55 = v11;
    id v56 = v7;
    uint64_t v16 = objc_msgSend__ipaVectorFromString_(TTSPhonemeSupport, v12, (uint64_t)v7, v13, v14);
    id v17 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if (objc_msgSend_count(v16, v18, v19, v20, v21))
    {
      unint64_t v25 = 0;
      do
      {
        uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(v16, v22, v25, v23, v24);
        uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v15, v27, (uint64_t)v26, v28, v29);
        unint64_t v31 = v25 + 1;
        if (v25 + 1 < objc_msgSend_count(v16, v32, v33, v34, v35))
        {
          v39 = objc_msgSend_objectAtIndexedSubscript_(v16, v36, v25 + 1, v37, v38);
          v43 = objc_msgSend_stringByAppendingString_(v26, v40, (uint64_t)v39, v41, v42);

          v47 = objc_msgSend_objectForKeyedSubscript_(v15, v44, (uint64_t)v43, v45, v46);
          v48 = v47;
          if (v47)
          {
            id v49 = v47;

            uint64_t v30 = v49;
            unint64_t v25 = v31;
          }
        }
        if (v30) {
          objc_msgSend_appendString_(v17, v36, (uint64_t)v30, v37, v38);
        }
        else {
          objc_msgSend_appendString_(v17, v36, (uint64_t)v26, v37, v38);
        }

        ++v25;
      }
      while (v25 < objc_msgSend_count(v16, v50, v51, v52, v53));
    }

    id v11 = v55;
    id v7 = v56;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)lhPhonemesFromIPA:(id)a3 language:(id)a4
{
  return (id)objc_msgSend__phonemesFromIPA_language_synth_(a1, a2, (uint64_t)a3, (uint64_t)a4, @"Vocalizer");
}

+ (id)eloquencePhonemesFromIPA:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((objc_msgSend_containsString_(v6, v8, @"ˈ", v9, v10) & 1) != 0
    || objc_msgSend_containsString_(v6, v11, @"'", v12, v13))
  {
    uint64_t v14 = objc_msgSend__phonemesFromIPA_language_synth_(a1, v11, (uint64_t)v6, (uint64_t)v7, @"Kona");
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (id)supportedIPAPhonemeLanguages
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = objc_opt_class();
  id v7 = objc_msgSend_bundleForClass_(v2, v4, v3, v5, v6);
  uint64_t v10 = objc_msgSend_pathsForResourcesOfType_inDirectory_(v7, v8, @"json", @"PhonemeMaps", v9);

  objc_msgSend_set(MEMORY[0x1E4F1CA80], v11, v12, v13, v14);
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v15 = v10;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v45, (uint64_t)v49, 16);
  if (v17)
  {
    uint64_t v21 = v17;
    uint64_t v22 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v46 != v22) {
          objc_enumerationMutation(v15);
        }
        uint64_t v24 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (objc_msgSend_rangeOfString_(v24, v18, @"Vocalizer", v19, v20) != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v25 = objc_msgSend_componentsSeparatedByString_(v24, v18, @"Vocalizer-", v19, v20);
          uint64_t v30 = objc_msgSend_lastObject(v25, v26, v27, v28, v29);

          uint64_t v34 = objc_msgSend_componentsSeparatedByString_(v30, v31, @".", v32, v33);
          v39 = objc_msgSend_firstObject(v34, v35, v36, v37, v38);

          if (v39) {
            objc_msgSend_addObject_(v44, v40, (uint64_t)v39, v41, v42);
          }
        }
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v45, (uint64_t)v49, 16);
    }
    while (v21);
  }

  return v44;
}

@end