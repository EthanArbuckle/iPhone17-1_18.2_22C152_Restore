@interface TTSSSEUtils
+ (_NSRange)nonSSMLSubstringRangeForRange:(_NSRange)a3 fromSSML:(id)a4;
+ (id)combinedProsodyMarkupForString:(id)a3 rate:(id)a4 pitch:(id)a5 volume:(id)a6;
+ (id)enclosedStringWithPhonemes:(id)a3 originalString:(id)a4;
+ (id)escapeSSML:(id)a3;
+ (id)genericMarkerMarkupWithName:(id)a3;
+ (id)performEscapeOrDeEscapeFor:(id)a3 escape:(BOOL)a4;
+ (id)speechMarkupStringForType:(int64_t)a3 string:(id)a4;
+ (id)ttsMarkerForSSEMarker:(id)a3 forRequest:(id)a4;
+ (id)unescapeDelimeterBoundedSSMLInString:(id)a3;
@end

@implementation TTSSSEUtils

+ (id)unescapeDelimeterBoundedSSMLInString:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v91 = a3;
  if (qword_1E96C4948 != -1) {
    dispatch_once(&qword_1E96C4948, &unk_1EFB804E0);
  }
  if (qword_1E96C4950) {
    BOOL v7 = qword_1E96C4958 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = objc_msgSend_copy(v91, v3, v4, v5, v6);
    v10 = (void *)qword_1E96C4958;
    uint64_t v15 = objc_msgSend_length(v91, v11, v12, v13, v14);
    objc_msgSend_matchesInString_options_range_(v10, v16, (uint64_t)v91, 0, 0, v15);
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v96, (uint64_t)v101, 16);
    uint64_t v22 = v18;
    if (v18)
    {
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)v97;
      do
      {
        uint64_t v25 = 0;
        uint64_t v26 = v23;
        do
        {
          if (*(void *)v97 != v24) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v96 + 1) + 8 * v25);
          uint64_t v28 = objc_msgSend_rangeWithName_(v27, v19, @"delimiter", v20, v21);
          v31 = objc_msgSend_substringWithRange_(v91, v29, v28, (uint64_t)v29, v30);
          int isEqualToString = objc_msgSend_isEqualToString_(v31, v32, @"[[SSMLESCAPED]]", v33, v34);
          if (isEqualToString) {
            uint64_t v23 = v26 + 1;
          }
          else {
            uint64_t v23 = v26 - 1;
          }
          if (v26 > (isEqualToString ^ 1u))
          {
            uint64_t v40 = objc_msgSend_range(v27, v36, v37, v38, v39);
            uint64_t v42 = (uint64_t)v41;
            objc_msgSend_range(v27, v41, v43, v44, v45);
            v47 = objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(&stru_1EFB83720, v46, (uint64_t)v46, @" ", 0);
            uint64_t v49 = objc_msgSend_stringByReplacingCharactersInRange_withString_(v9, v48, v40, v42, (uint64_t)v47);

            v9 = (void *)v49;
          }

          ++v25;
          uint64_t v26 = v23;
        }
        while (v22 != v25);
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v96, (uint64_t)v101, 16);
      }
      while (v22);
    }

    v50 = [TTSSpeechString alloc];
    v8 = objc_msgSend_initWithOriginalString_(v50, v51, (uint64_t)v9, v52, v53);
    v54 = (void *)qword_1E96C4950;
    uint64_t v59 = objc_msgSend_length(v9, v55, v56, v57, v58);
    v88 = objc_msgSend_matchesInString_options_range_(v54, v60, (uint64_t)v9, 0, 0, v59);

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    v65 = objc_msgSend_reverseObjectEnumerator(v88, v61, v62, v63, v64);
    uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v66, (uint64_t)&v92, (uint64_t)v100, 16);
    if (v70)
    {
      uint64_t v71 = *(void *)v93;
      do
      {
        for (uint64_t i = 0; i != v70; ++i)
        {
          if (*(void *)v93 != v71) {
            objc_enumerationMutation(v65);
          }
          v73 = *(void **)(*((void *)&v92 + 1) + 8 * i);
          uint64_t v74 = objc_msgSend_rangeWithName_(v73, v67, @"enclosedssml", v68, v69, v88);
          v77 = objc_msgSend_substringWithRange_(v9, v75, v74, (uint64_t)v75, v76);
          v80 = objc_msgSend_performEscapeOrDeEscapeFor_escape_(a1, v78, (uint64_t)v77, 0, v79);

          uint64_t v85 = objc_msgSend_range(v73, v81, v82, v83, v84);
          objc_msgSend_transformRange_to_(v8, v86, v85, (uint64_t)v86, (uint64_t)v80);
        }
        uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v65, v67, (uint64_t)&v92, (uint64_t)v100, 16);
      }
      while (v70);
    }
  }

  return v8;
}

+ (id)performEscapeOrDeEscapeFor:(id)a3 escape:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = sub_1A673C498;
  uint64_t v26 = sub_1A673C4A8;
  id v5 = a3;
  id v27 = v5;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EFB954E0, v6, (uint64_t)&v18, (uint64_t)v28, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(&unk_1EFB954E0);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = sub_1A673C4B0;
        v16[3] = &unk_1E5C6ABF8;
        BOOL v17 = a4;
        v16[4] = &v22;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v13, v7, (uint64_t)v16, v8, v9);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1EFB954E0, v7, (uint64_t)&v18, (uint64_t)v28, 16);
    }
    while (v10);
  }
  id v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

+ (id)escapeSSML:(id)a3
{
  uint64_t v4 = objc_msgSend_performEscapeOrDeEscapeFor_escape_(a1, a2, (uint64_t)a3, 1, v3);

  return v4;
}

+ (_NSRange)nonSSMLSubstringRangeForRange:(_NSRange)a3 fromSSML:(id)a4
{
  NSUInteger length = a3.length;
  uint64_t location = a3.location;
  id v6 = a4;
  uint64_t v11 = objc_msgSend_shared(SSMLServices, v7, v8, v9, v10);
  uint64_t v13 = objc_msgSend_convertRange_forSSML_(v11, v12, location, length, (uint64_t)v6);

  long long v18 = objc_msgSend_error(v13, v14, v15, v16, v17);

  if (!v18)
  {
    uint64_t location = objc_msgSend_convertedRange(v13, v19, v20, v21, v22);
    NSUInteger length = v23;
  }

  NSUInteger v24 = location;
  NSUInteger v25 = length;
  result.NSUInteger length = v25;
  result.uint64_t location = v24;
  return result;
}

+ (id)ttsMarkerForSSEMarker:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = objc_msgSend_mark(v6, v8, v9, v10, v11);
  if (v12)
  {
    if (v12 == 1)
    {
      v50 = objc_msgSend_unescapedSpeechString(v7, v13, v14, v15, v16);
      uint64_t v55 = objc_msgSend_textRange(v6, v51, v52, v53, v54);
      uint64_t v58 = objc_msgSend_translateRangeInTransformedString_(v50, v56, v55, (uint64_t)v56, v57);
      uint64_t v60 = v59;

      v65 = objc_msgSend_speechString(v7, v61, v62, v63, v64);
      uint64_t v70 = objc_msgSend_type(v65, v66, v67, v68, v69);

      if (!v70)
      {
        v75 = objc_msgSend_unescapedSpeechString(v7, v71, v72, v73, v74);
        v80 = objc_msgSend_originalString(v75, v76, v77, v78, v79);
        uint64_t v58 = objc_msgSend_nonSSMLSubstringRangeForRange_fromSSML_(a1, v81, v58, v60, (uint64_t)v80);
        uint64_t v60 = v82;
      }
      uint64_t v83 = objc_msgSend_speechString(v7, v71, v72, v73, v74);
      uint64_t v86 = objc_msgSend_translateRangeInTransformedString_(v83, v84, v58, v60, v85);
      uint64_t v88 = v87;

      uint64_t v17 = objc_alloc_init(TTSWordMarker);
      objc_msgSend_setWordRange_(v17, v89, v86, v88, v90);
      uint64_t v95 = objc_msgSend_byteSampleOffset(v6, v91, v92, v93, v94);
      objc_msgSend_setByteOffset_(v17, v96, v95, v97, v98);
    }
    else if (v12 == 4)
    {
      uint64_t v17 = objc_alloc_init(TTSGenericMarker);
      uint64_t v22 = objc_msgSend_bookmarkName(v6, v18, v19, v20, v21);
      objc_msgSend_setName_(v17, v23, (uint64_t)v22, v24, v25);

      uint64_t v30 = objc_msgSend_byteSampleOffset(v6, v26, v27, v28, v29);
      objc_msgSend_setByteOffset_(v17, v31, v30, v32, v33);
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = objc_alloc_init(TTSPhonemeMarker);
    uint64_t v38 = objc_msgSend_phoneme(v6, v34, v35, v36, v37);
    objc_msgSend_setPhoneme_(v17, v39, (uint64_t)v38, v40, v41);

    uint64_t v46 = objc_msgSend_byteSampleOffset(v6, v42, v43, v44, v45);
    objc_msgSend_setByteOffset_(v17, v47, v46, v48, v49);
  }

  return v17;
}

+ (id)enclosedStringWithPhonemes:(id)a3 originalString:(id)a4
{
  id v5 = a3;
  id v6 = NSString;
  uint64_t v11 = objc_msgSend_xmlEscaped(a4, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_stringWithFormat_(v6, v12, @"<phoneme alphabet=\"ipa\" ph=\"%@\">%@</phoneme>", v13, v14, v5, v11);

  uint64_t v19 = objc_msgSend_escapeSSML_(TTSSSEUtils, v16, (uint64_t)v15, v17, v18);

  NSUInteger v23 = objc_msgSend_stringWithFormat_(NSString, v20, @"%@%@%@", v21, v22, @"[[SSMLESCAPED]]", v19, @"[[[SSMLESCAPED]]]");

  return v23;
}

+ (id)genericMarkerMarkupWithName:(id)a3
{
  id v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"<mark name=\"%@\" />", v3, v4, a3);
  uint64_t v9 = objc_msgSend_escapeSSML_(TTSSSEUtils, v6, (uint64_t)v5, v7, v8);

  uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v10, @"%@%@%@", v11, v12, @"[[SSMLESCAPED]]", v9, @"[[[SSMLESCAPED]]]");
  uint64_t v17 = objc_msgSend_escapeSSML_(TTSSSEUtils, v14, (uint64_t)v13, v15, v16);

  return v17;
}

+ (id)speechMarkupStringForType:(int64_t)a3 string:(id)a4
{
  id v5 = a4;
  uint64_t v10 = v5;
  if ((unint64_t)(a3 - 1) < 2)
  {
LABEL_6:
    uint64_t v13 = objc_msgSend_escapeSSML_(TTSSSEUtils, v6, @"%@<say-as interpret-as=\"characters\">%@</say-as>%@", v8, v9);
    uint64_t v17 = objc_msgSend_stringWithFormat_(NSString, v14, (uint64_t)v13, v15, v16, @"[[SSMLESCAPED]]", v10, @"[[[SSMLESCAPED]]]");
LABEL_8:
    uint64_t v21 = (__CFString *)v17;

    goto LABEL_10;
  }
  if (!a3)
  {
    uint64_t v13 = objc_msgSend_escapeSSML_(TTSSSEUtils, v6, @"%@<break time=\"%%dms\" />%@", v8, v9);
    uint64_t v17 = objc_msgSend_stringWithFormat_(NSString, v18, (uint64_t)v13, v19, v20, @"[[SSMLESCAPED]]", @"[[[SSMLESCAPED]]]");
    goto LABEL_8;
  }
  if (a3 == 3)
  {
    if (objc_msgSend_length(v5, v6, v7, v8, v9) == 1)
    {
      uint64_t v12 = objc_msgSend_lowercaseString(v10, v6, v11, v8, v9);

      uint64_t v10 = (void *)v12;
    }
    goto LABEL_6;
  }
  uint64_t v21 = &stru_1EFB83720;
LABEL_10:

  return v21;
}

+ (id)combinedProsodyMarkupForString:(id)a3 rate:(id)a4 pitch:(id)a5 volume:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc(MEMORY[0x1E4F15498]);
  uint64_t v21 = objc_msgSend_initWithString_(v13, v14, (uint64_t)v9, v15, v16);
  if (v10)
  {
    objc_msgSend_floatValue(v10, v17, v18, v19, v20);
    objc_msgSend_setRate_(v21, v22, v23, v24, v25);
  }
  if (v12)
  {
    objc_msgSend_floatValue(v12, v17, v18, v19, v20);
    objc_msgSend_setVolume_(v21, v26, v27, v28, v29);
    if (!v11) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v11)
  {
LABEL_7:
    objc_msgSend_floatValue(v11, v17, v18, v19, v20);
    objc_msgSend_setPitchMultiplier_(v21, v30, v31, v32, v33);
LABEL_8:
    uint64_t v34 = objc_msgSend_shared(SSMLServices, v17, v18, v19, v20);
    uint64_t v38 = objc_msgSend_generateSSMLFromAVSpeechUtterance_(v34, v35, (uint64_t)v21, v36, v37);

    uint64_t v43 = objc_msgSend_error(v38, v39, v40, v41, v42);

    if (v43)
    {
      id v48 = v9;
    }
    else
    {
      uint64_t v49 = objc_msgSend_ssmlResult(v38, v44, v45, v46, v47);
      uint64_t v52 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v49, v50, @"<speak>", (uint64_t)&stru_1EFB83720, v51);
      uint64_t v55 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v52, v53, @"</speak>", (uint64_t)&stru_1EFB83720, v54);

      uint64_t v59 = objc_msgSend_escapeSSML_(TTSSSEUtils, v56, (uint64_t)v55, v57, v58);

      objc_msgSend_stringWithFormat_(NSString, v60, @"%@%@%@", v61, v62, @"[[SSMLESCAPED]]", v59, @"[[[SSMLESCAPED]]]");
      id v48 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_12;
  }
  if (v10) {
    goto LABEL_8;
  }
  id v48 = v9;
LABEL_12:

  return v48;
}

@end