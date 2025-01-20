@interface UIDictationUtilities
+ (BOOL)_isAutomaticKeyboardDownDictationDisabled;
+ (BOOL)_isDictationAssetAvailableForLocale:(id)a3;
+ (BOOL)_isUsingLargeFormatDictationUI;
+ (BOOL)needsLeadingSpaceForPhrases:(id)a3 secureInput:(BOOL)a4;
+ (BOOL)needsLeadingSpaceForText:(id)a3 secureInput:(BOOL)a4;
+ (BOOL)needsLeadingSpaceForText:(id)a3 secureInput:(BOOL)a4 previousCharacter:(unsigned __int16)a5 selectionStartIsStartOfParagraph:(BOOL)a6;
+ (BOOL)needsTrailingSpaceForPhrases:(id)a3 secureInput:(BOOL)a4;
+ (BOOL)needsTrailingSpaceForText:(id)a3 secureInput:(BOOL)a4;
+ (BOOL)shouldAddDeleteMenuElement;
+ (BOOL)shouldInsertSpaceBetweenStringA:(id)a3 andStringB:(id)a4;
+ (BOOL)shouldLogCorrectionInfoForCurrentBundleId;
+ (BOOL)supportsDictationVoiceEditingUIForBundleIdentifier:(id)a3;
+ (id)_properNameForString:(id)a3;
+ (id)_unsupportedAppsForVoiceEditing;
+ (id)attributedStringForDictationResult:(id)a3 andCorrectionIdentifier:(id)a4 capturePrefixAndPostfixWordCount:(unint64_t)a5;
+ (id)bestInterpretationForDictationResult:(id)a3;
+ (id)bestInterpretationForPhrases:(id)a3;
+ (id)capitalizeFirstWord:(id)a3;
+ (id)dictationPhrasesFromPhraseArray:(id)a3;
+ (id)dictationPhrasesFromTokenMatrix:(id)a3;
+ (id)dictationVoiceCommandParametersFromAFVoiceCommandGrammarParseCandidate:(id)a3;
+ (id)interpretationFromAFInterpretation:(id)a3;
+ (id)interpretationFromAFTokens:(id)a3;
+ (id)metadataDictionaryForCorrectionIdentifier:(id)a3;
+ (id)phraseFromAFPhrase:(id)a3;
+ (id)tokenFromAFToken:(id)a3;
+ (id)trackingPunctuations;
+ (id)voiceCommandParameterFromAFVoiceCommandGrammarParamMatch:(id)a3;
+ (int64_t)updateCharacterModificationCount:(id)a3 delta:(int)a4;
+ (unint64_t)characterDeletionCount:(id)a3;
+ (unint64_t)characterInsertionCount:(id)a3;
+ (unint64_t)characterSubstitutionCount:(id)a3;
+ (unint64_t)maxLoggableLengthOfInsertionBySubstitution:(id)a3;
+ (unint64_t)maxLoggableLengthOfInsertionWithDeletion:(id)a3;
+ (unint64_t)maxLoggableLengthOfInsertionWithoutDeletion:(id)a3;
+ (unint64_t)updateCharacterDeletionCount:(id)a3 delta:(int)a4;
+ (unint64_t)updateCharacterInsertionCount:(id)a3 delta:(int)a4;
+ (unint64_t)updateCharacterSubstitutionCount:(id)a3 delta:(int)a4;
+ (void)attributedString:(id)a3 withIdentifiersBlock:(id)a4;
+ (void)logSpeechAlternativeReplacement:(id)a3 originalText:(id)a4 replacementText:(id)a5 index:(unint64_t)a6;
+ (void)selectionStartInfoWithBlock:(id)a3;
+ (void)trackDeletion:(id)a3 text:(id)a4 range:(_NSRange)a5;
+ (void)trackInsertion:(id)a3 text:(id)a4 range:(_NSRange)a5;
+ (void)trackSubstitution:(id)a3 originalText:(id)a4 originalTextRange:(_NSRange)a5 replacementText:(id)a6 replacementTextRange:(_NSRange)a7;
@end

@implementation UIDictationUtilities

+ (BOOL)_isUsingLargeFormatDictationUI
{
  return 0;
}

+ (id)tokenFromAFToken:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    double v4 = 0.0;
    if (objc_opt_respondsToSelector()) {
      double v4 = (double)[v3 confidenceScore];
    }
    v5 = [UIDictationScoredToken alloc];
    v6 = [v3 text];
    v7 = -[UIDictationScoredToken initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:](v5, "initWithText:removeSpaceBefore:removeSpaceAfter:confidenceScore:", v6, [v3 removeSpaceBefore], objc_msgSend(v3, "removeSpaceAfter"), v4 / 1000.0);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)interpretationFromAFInterpretation:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v5 = (void *)getAFSpeechInterpretationClass_softClass;
  uint64_t v14 = getAFSpeechInterpretationClass_softClass;
  if (!getAFSpeechInterpretationClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getAFSpeechInterpretationClass_block_invoke;
    v10[3] = &unk_1E52D9900;
    v10[4] = &v11;
    __getAFSpeechInterpretationClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v11, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v4 tokens];
    v8 = [a1 interpretationFromAFTokens:v7];

    objc_msgSend(v8, "setAverageConfidenceScore:", (double)objc_msgSend(v4, "averageConfidenceScore") / 1000.0);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)interpretationFromAFTokens:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    double v10 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = objc_msgSend(a1, "tokenFromAFToken:", *(void *)(*((void *)&v24 + 1) + 8 * i), (void)v24);
        if (!v12)
        {

          v15 = 0;
          goto LABEL_17;
        }
        uint64_t v13 = (void *)v12;
        [v5 addObject:v12];
        [v13 confidenceScore];
        double v10 = v10 + v14;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    double v10 = 0.0;
  }

  if ([v5 count])
  {
    double v16 = (double)(unint64_t)[v5 count];
    v17 = [v5 lastObject];
    v18 = [v17 text];
    int v19 = [v18 hasSuffix:@" "];

    if (v19)
    {
      v20 = [v17 text];
      v21 = [v17 text];
      v22 = objc_msgSend(v20, "substringToIndex:", objc_msgSend(v21, "length") - 1);
      [v17 setText:v22];
    }
    double v10 = v10 / v16;
  }
  v15 = [[UIDictationInterpretation alloc] initWithTokens:v5 score:v10];
LABEL_17:

  return v15;
}

+ (id)phraseFromAFPhrase:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  getAFSpeechPhraseClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = objc_msgSend(v4, "interpretations", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [a1 interpretationFromAFInterpretation:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          if (!v11)
          {

            uint64_t v13 = 0;
            goto LABEL_13;
          }
          uint64_t v12 = (void *)v11;
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    uint64_t v13 = -[UIDictationInterpretationGroup initWithInterpretations:isLowConfidence:]([UIDictationInterpretationGroup alloc], "initWithInterpretations:isLowConfidence:", v5, [v4 isLowConfidence]);
LABEL_13:
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)dictationPhrasesFromTokenMatrix:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__128;
  uint64_t v12 = __Block_byref_object_dispose__128;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__UIDictationUtilities_dictationPhrasesFromTokenMatrix___block_invoke;
  v7[3] = &unk_1E52FB528;
  v7[4] = &v8;
  [v3 enumerateObjectsUsingBlock:v7];
  id v4 = [UIDictationSerializableResults alloc];
  id v5 = [(UIDictationSerializableResults *)v4 initWithPhrases:v9[5]];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __56__UIDictationUtilities_dictationPhrasesFromTokenMatrix___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = +[UIDictationUtilities interpretationFromAFTokens:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  if (v6)
  {
    uint64_t v9 = [UIDictationInterpretationGroup alloc];
    v12[0] = v6;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    uint64_t v11 = [(UIDictationInterpretationGroup *)v9 initWithInterpretations:v10];
    [v8 addObject:v11];
  }
  else
  {
    *(void *)(v7 + 40) = 0;

    *a4 = 1;
  }
}

+ (id)dictationPhrasesFromPhraseArray:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 lastObject];
    getAFSpeechPhraseClass();
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v11 = 0;
      uint64_t v12 = &v11;
      uint64_t v13 = 0x3032000000;
      double v14 = __Block_byref_object_copy__128;
      long long v15 = __Block_byref_object_dispose__128;
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __56__UIDictationUtilities_dictationPhrasesFromPhraseArray___block_invoke;
      v10[3] = &unk_1E52FB550;
      v10[4] = &v11;
      [v3 enumerateObjectsUsingBlock:v10];
      id v6 = [UIDictationSerializableResults alloc];
      uint64_t v7 = [(UIDictationSerializableResults *)v6 initWithPhrases:v12[5]];
      _Block_object_dispose(&v11, 8);

      goto LABEL_7;
    }
    uint64_t v8 = +[UIDictationUtilities dictationPhrasesFromTokenMatrix:v3];
  }
  else
  {
    uint64_t v8 = objc_alloc_init(UIDictationSerializableResults);
  }
  uint64_t v7 = v8;
LABEL_7:

  return v7;
}

void __56__UIDictationUtilities_dictationPhrasesFromPhraseArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = +[UIDictationUtilities phraseFromAFPhrase:a2];
  id v9 = (id)v6;
  if (v6)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }
  else
  {
    *a4 = 1;
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

+ (id)bestInterpretationForDictationResult:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      id v9 = &stru_1ED0E84C0;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (objc_msgSend(v11, "count", (void)v17))
        {
          uint64_t v12 = [v11 objectAtIndex:0];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v15 = v9;

            goto LABEL_20;
          }
          uint64_t v13 = [(__CFString *)v9 stringByAppendingString:v12];

          id v9 = (__CFString *)v13;
        }
        if (v7 == ++v10)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v7) {
            goto LABEL_5;
          }
          goto LABEL_18;
        }
      }
      double v14 = v9;
LABEL_20:

      goto LABEL_21;
    }
    id v9 = &stru_1ED0E84C0;
LABEL_18:

    id v9 = v9;
LABEL_21:
  }
  else
  {
    id v9 = &stru_1ED0E84C0;
  }

  return v9;
}

+ (id)bestInterpretationForPhrases:(id)a3
{
  id v3 = a3;
  id v4 = [v3 indexPathOfInterpretations];
  [v3 setIndexPathOfInterpretations:0];
  id v5 = [v3 text];
  [v3 setIndexPathOfInterpretations:v4];

  return v5;
}

+ (id)attributedStringForDictationResult:(id)a3 andCorrectionIdentifier:(id)a4 capturePrefixAndPostfixWordCount:(unint64_t)a5
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v68 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v67 = [v6 dictationPhraseArray];
  uint64_t v8 = [v6 bestTextForMultilingualAlternatives];
  id v9 = (void *)v8;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v8) {
    uint64_t v10 = (void *)v8;
  }
  id v11 = v10;

  v66 = [v6 multilingualResultsByLanguageCode];
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v77 objects:v82 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v78;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v78 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = [*(id *)(*((void *)&v77 + 1) + 8 * i) objectForKey:@"text"];
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v77 objects:v82 count:16];
    }
    while (v15);
  }

  v72 = v13;
  v65 = v12;
  if ([v6 showMultilingualAlternatives])
  {
    uint64_t v19 = [v13 count];
    BOOL v20 = v19 != 0;
    if ([v6 lowConfidenceAboutLanguageDetection] && v19)
    {
      v21 = [v6 bestText];
      uint64_t v22 = [off_1E52D2EA8 attributedText:v21 withAlternativeTexts:v12 style:1];

      [v7 appendAttributedString:v22];
      v23 = [a1 metadataDictionaryForCorrectionIdentifier:v68];
      unint64_t v24 = a5;
LABEL_26:
      v36 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "lowConfidenceAboutLanguageDetection"));
      [v23 setObject:v36 forKey:@"multilingualIsLowConfidence"];

      [v23 setObject:v13 forKey:@"bestAlternatives"];
      v37 = [v6 bestText];
      [v23 setObject:v37 forKey:@"bestText"];

      [v23 setObject:v66 forKey:@"multilingualResultsForAlternateRecognitions"];
      goto LABEL_27;
    }
  }
  else
  {
    [v6 lowConfidenceAboutLanguageDetection];
    BOOL v20 = 0;
  }
  BOOL v62 = v20;
  long long v25 = v7;
  id v63 = v6;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v26 = v67;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v73 objects:v81 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v74 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        v32 = [v31 text];

        if (v32)
        {
          v33 = [v31 text];
          v34 = [v31 alternativeInterpretations];
          v35 = objc_msgSend(off_1E52D2EA8, "attributedText:withAlternativeTexts:style:", v33, v34, objc_msgSend(v31, "style"));
          [v25 appendAttributedString:v35];

          id v13 = v72;
        }
        else
        {
          v33 = [MEMORY[0x1E4F28B00] currentHandler];
          [v33 handleFailureInMethod:a2 object:a1 file:@"UIDictationUtilities.m" lineNumber:281 description:@"All dictation phrases should have at least one interpretation."];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v73 objects:v81 count:16];
    }
    while (v28);
  }

  v23 = [a1 metadataDictionaryForCorrectionIdentifier:v68];
  id v6 = v63;
  unint64_t v24 = a5;
  id v7 = v25;
  uint64_t v12 = v65;
  if (v62) {
    goto LABEL_26;
  }
LABEL_27:
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v39 = [v7 string];
  [v38 setObject:v39 forKey:@"recognizedText"];

  uint64_t v40 = [v7 length];
  if ([v6 addTrailingSpace])
  {
    v41 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v7 appendAttributedString:v41];
  }
  if (v24)
  {
    v42 = +[UIDictationController sharedInstance];
    v43 = v7;
    +[UIKeyboardImpl sharedInstance];
    v44 = uint64_t v71 = v40;
    v45 = [v44 inputDelegate];
    v46 = [v42 prefixTextForInputDelegate:v45 wordCount:v24];

    v47 = +[UIDictationController sharedInstance];
    v48 = +[UIKeyboardImpl sharedInstance];
    v49 = [v48 inputDelegate];
    v50 = [v47 postfixTextForInputDelegate:v49 wordCount:v24];

    v51 = NSString;
    v52 = [v43 string];
    v53 = [v51 stringWithFormat:@"%@%@%@", v46, v52, v50];

    [v38 setObject:v53 forKey:@"relevantTextAfterDictationResult"];
    v54 = (void *)MEMORY[0x1E4F29238];
    v55 = v46;
    uint64_t v56 = [v46 length];
    v57 = [v43 string];
    uint64_t v58 = [v57 length];
    uint64_t v59 = v56;
    uint64_t v40 = v71;
    v60 = objc_msgSend(v54, "valueWithRange:", v59, v58);

    [v38 setObject:v60 forKey:@"recognizedTextPosition"];
    id v7 = v43;
    uint64_t v12 = v65;
  }
  [v23 setObject:v38 forKey:@"recognizedTextInfo"];
  objc_msgSend(v7, "addAttribute:value:range:", @"_UITextInputDictationResultMetadata", v23, 0, v40);

  return v7;
}

+ (id)voiceCommandParameterFromAFVoiceCommandGrammarParamMatch:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(UIDictationVoiceCommandParameter);
  id v5 = [v3 text];

  [(UIDictationVoiceCommandParameter *)v4 setText:v5];
  return v4;
}

+ (id)dictationVoiceCommandParametersFromAFVoiceCommandGrammarParseCandidate:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  id v6 = [v4 paramMatches];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__UIDictationUtilities_dictationVoiceCommandParametersFromAFVoiceCommandGrammarParseCandidate___block_invoke;
  v10[3] = &unk_1E52FB578;
  id v7 = v5;
  id v11 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  if ([v7 count])
  {
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __95__UIDictationUtilities_dictationVoiceCommandParametersFromAFVoiceCommandGrammarParseCandidate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[UIDictationUtilities voiceCommandParameterFromAFVoiceCommandGrammarParamMatch:a3];
  [*(id *)(a1 + 32) setObject:v6 forKey:v5];
}

+ (id)_unsupportedAppsForVoiceEditing
{
  if (qword_1EB261A18 != -1) {
    dispatch_once(&qword_1EB261A18, &__block_literal_global_338);
  }
  v2 = (void *)qword_1EB261A20;
  return v2;
}

void __55__UIDictationUtilities__unsupportedAppsForVoiceEditing__block_invoke()
{
  v0 = +[_UIDictationSettingsDomain rootSettings];
  char v1 = [v0 voiceCommandsInIWorkEnabled];

  if ((v1 & 1) == 0)
  {
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.Numbers", @"com.apple.Keynote", @"com.apple.Pages", 0);
    id v3 = (void *)qword_1EB261A20;
    qword_1EB261A20 = v2;
  }
}

+ (BOOL)supportsDictationVoiceEditingUIForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _unsupportedAppsForVoiceEditing];
  char v6 = [v5 containsObject:v4];

  return v6 ^ 1;
}

+ (id)metadataDictionaryForCorrectionIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = v4;
  if (v3) {
    [v4 setObject:v3 forKey:@"correctionIdentifier"];
  }
  char v6 = [NSNumber numberWithInt:0];
  [v5 setObject:v6 forKey:@"alternativesSelectedCount"];

  id v7 = [NSNumber numberWithInt:0];
  [v5 setObject:v7 forKey:@"characterModificationCount"];

  uint64_t v8 = +[UIDictationController sharedInstance];
  id v9 = [v8 interactionIdentifier];

  if (v9) {
    [v5 setObject:v9 forKey:@"dictationUIInteractionIdentifier"];
  }
  uint64_t v10 = +[UIDictationController sharedInstance];
  id v11 = [v10 currentInstrumentationContext];

  if (v11) {
    [v5 setObject:v11 forKey:@"dictationInstrumentationContext"];
  }
  uint64_t v12 = +[UIDictationController sharedInstance];
  id v13 = [v12 initialDictationLanguage];

  if (v13) {
    [v5 setObject:v13 forKey:@"dictationLanguage"];
  }
  uint64_t v14 = +[UIDictationController sharedInstance];
  int v15 = [v14 localSpeechRecognitionForced];
  uint64_t v16 = UITextInputDictationResultSpeechRecognitionSourceLocal;
  if (!v15) {
    uint64_t v16 = UITextInputDictationResultSpeechRecognitionSourceServer;
  }
  [v5 setObject:*v16 forKey:@"speechRecognitionSource"];

  return v5;
}

+ (BOOL)needsLeadingSpaceForPhrases:(id)a3 secureInput:(BOOL)a4
{
  if (a4) {
    return 0;
  }
  char v6 = [a3 phrases];
  id v7 = [v6 firstObject];
  uint64_t v8 = [v7 bestInterpretation];

  id v9 = [v8 tokens];
  uint64_t v10 = [v9 objectAtIndex:0];

  id v11 = [v10 text];
  LOBYTE(a1) = [a1 needsLeadingSpaceForText:v11 secureInput:0];

  return (char)a1;
}

+ (BOOL)needsLeadingSpaceForText:(id)a3 secureInput:(BOOL)a4
{
  id v5 = a3;
  char v6 = v5;
  if (!a4)
  {
    if ([v5 length]) {
      uint64_t v8 = [v6 characterAtIndex:0];
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = +[UIKeyboardImpl sharedInstance];
    uint64_t v10 = [v9 inputDelegate];

    if ([v10 _usesAsynchronousProtocol])
    {
      id v11 = +[UIDictationController activeInstance];
      char v12 = [v11 selectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate];
      unsigned __int16 v13 = [v11 initialPreviousCharacterForAsyncDelegate];

      if (v12) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v14 = [v10 tokenizer];
      int v15 = [v10 selectedTextRange];
      uint64_t v16 = [v15 start];
      char v17 = [v14 isPosition:v16 atBoundary:3 inDirection:1];

      unsigned __int16 v18 = [v10 _characterInRelationToRangedSelection:0xFFFFFFFFLL];
      if (v17) {
        goto LABEL_12;
      }
      unsigned __int16 v13 = v18;
    }
    if (([MEMORY[0x1E4FB6E08] isCharacterSmartReplaceExempt:v13 isPreviousCharacter:1] & 1) == 0)
    {
      int v7 = [MEMORY[0x1E4FB6E08] isCharacterSmartReplaceExempt:v8 isPreviousCharacter:0] ^ 1;
      goto LABEL_14;
    }
LABEL_12:
    LOBYTE(v7) = 0;
LABEL_14:

    goto LABEL_15;
  }
  LOBYTE(v7) = 0;
LABEL_15:

  return v7;
}

+ (void)selectionStartInfoWithBlock:(id)a3
{
  id v3 = (void (**)(id, void, uint64_t))a3;
  id v4 = +[UIKeyboardImpl sharedInstance];
  id v11 = [v4 inputDelegate];

  if ([v11 _usesAsynchronousProtocol])
  {
    id v5 = +[UIDictationController activeInstance];
    uint64_t v6 = [v5 selectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate];
    unsigned __int16 v7 = [v5 initialPreviousCharacterForAsyncDelegate];
  }
  else
  {
    uint64_t v8 = [v11 tokenizer];
    id v9 = [v11 selectedTextRange];
    uint64_t v10 = [v9 start];
    uint64_t v6 = [v8 isPosition:v10 atBoundary:3 inDirection:1];

    unsigned __int16 v7 = [v11 _characterInRelationToRangedSelection:0xFFFFFFFFLL];
  }
  v3[2](v3, v7, v6);
}

+ (BOOL)needsLeadingSpaceForText:(id)a3 secureInput:(BOOL)a4 previousCharacter:(unsigned __int16)a5 selectionStartIsStartOfParagraph:(BOOL)a6
{
  uint64_t v7 = a5;
  id v9 = a3;
  uint64_t v10 = v9;
  if (a4) {
    goto LABEL_7;
  }
  if ([v9 length])
  {
    uint64_t v11 = [v10 characterAtIndex:0];
    if (a6) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (a6) {
      goto LABEL_7;
    }
  }
  if (([MEMORY[0x1E4FB6E08] isCharacterSmartReplaceExempt:v7 isPreviousCharacter:1] & 1) == 0)
  {
    int v12 = [MEMORY[0x1E4FB6E08] isCharacterSmartReplaceExempt:v11 isPreviousCharacter:0] ^ 1;
    goto LABEL_8;
  }
LABEL_7:
  LOBYTE(v12) = 0;
LABEL_8:

  return v12;
}

+ (BOOL)needsTrailingSpaceForPhrases:(id)a3 secureInput:(BOOL)a4
{
  if (a4) {
    return 0;
  }
  uint64_t v6 = [a3 phrases];
  uint64_t v7 = [v6 lastObject];
  uint64_t v8 = [v7 bestInterpretation];

  id v9 = [v8 tokens];
  uint64_t v10 = [v9 lastObject];

  uint64_t v11 = [v10 text];
  LOBYTE(a1) = [a1 needsTrailingSpaceForText:v11 secureInput:0];

  return (char)a1;
}

+ (BOOL)needsTrailingSpaceForText:(id)a3 secureInput:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a4)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    if ([v5 length]) {
      uint64_t v7 = objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v6, "length") - 1);
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = +[UIKeyboardImpl sharedInstance];
    id v9 = [v8 inputDelegate];

    if ([v9 _usesAsynchronousProtocol])
    {
      uint64_t v10 = +[UIDictationController activeInstance];
      char v11 = [v10 selectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate];
      unsigned __int16 v12 = [v10 initialCharacterAfterSelectionForAsyncDelegate];
    }
    else
    {
      unsigned __int16 v13 = [v9 tokenizer];
      uint64_t v14 = [v9 selectedTextRange];
      int v15 = [v14 end];
      char v11 = [v13 isPosition:v15 atBoundary:3 inDirection:0];

      unsigned __int16 v12 = [v9 _characterInRelationToRangedSelection:0];
    }
    char v16 = [MEMORY[0x1E4FB6E08] isCharacterSmartReplaceExempt:v7 isPreviousCharacter:1];
    LOBYTE(v7) = 0;
    if ((v11 & 1) == 0 && (v16 & 1) == 0) {
      LODWORD(v7) = [MEMORY[0x1E4FB6E08] isCharacterSmartReplaceExempt:v12 isPreviousCharacter:0] ^ 1;
    }
  }
  return v7;
}

+ (id)_properNameForString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (qword_1EB261A30 == -1)
  {
    if (!v3) {
      goto LABEL_14;
    }
  }
  else
  {
    dispatch_once(&qword_1EB261A30, &__block_literal_global_102_0);
    if (!v4) {
      goto LABEL_14;
    }
  }
  id v5 = [(id)qword_1EB261A28 firstObject];
  if ([v5 caseInsensitiveCompare:v4] == -1)
  {
    uint64_t v6 = [(id)qword_1EB261A28 lastObject];
    uint64_t v7 = [v6 caseInsensitiveCompare:v4];

    if (v7 == 1)
    {
      unint64_t v8 = 0;
      unint64_t v9 = [(id)qword_1EB261A28 count] - 1;
      do
      {
        unint64_t v10 = (v9 + v8) >> 1;
        char v11 = [(id)qword_1EB261A28 objectAtIndex:v10];
        uint64_t v12 = [v11 caseInsensitiveCompare:v4];
        switch(v12)
        {
          case -1:
            unint64_t v8 = v10 + 1;
            break;
          case 1:
            unint64_t v9 = v10 - 1;
            break;
          case 0:
            goto LABEL_15;
        }
      }
      while (v8 <= v9);
    }
  }
  else
  {
  }
LABEL_14:
  char v11 = 0;
LABEL_15:

  return v11;
}

void __45__UIDictationUtilities__properNameForString___block_invoke()
{
  uint64_t v0 = [&unk_1ED3F0640 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  char v1 = (void *)qword_1EB261A28;
  qword_1EB261A28 = v0;
}

+ (unint64_t)characterInsertionCount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForKey:@"characterInsertionCount"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v3 valueForKey:@"characterInsertionCount"];
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (unint64_t)characterDeletionCount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForKey:@"characterDeletionCount"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v3 valueForKey:@"characterDeletionCount"];
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (unint64_t)characterSubstitutionCount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForKey:@"characterSubstitutionCount"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v3 valueForKey:@"characterSubstitutionCount"];
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

+ (unint64_t)updateCharacterDeletionCount:(id)a3 delta:(int)a4
{
  LODWORD(v5) = a4;
  id v4 = a3;
  unint64_t v5 = (int)v5;
  uint64_t v6 = [v4 valueForKey:@"characterDeletionCount"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unint64_t v8 = [v4 valueForKey:@"characterDeletionCount"];
    unint64_t v5 = [v8 unsignedIntegerValue] + (int)v5;
  }
  unint64_t v9 = [NSNumber numberWithUnsignedInteger:v5];
  [v4 setObject:v9 forKey:@"characterDeletionCount"];

  return v5;
}

+ (unint64_t)updateCharacterSubstitutionCount:(id)a3 delta:(int)a4
{
  LODWORD(v5) = a4;
  id v4 = a3;
  unint64_t v5 = (int)v5;
  uint64_t v6 = [v4 valueForKey:@"characterSubstitutionCount"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unint64_t v8 = [v4 valueForKey:@"characterSubstitutionCount"];
    unint64_t v5 = [v8 unsignedIntegerValue] + (int)v5;
  }
  unint64_t v9 = [NSNumber numberWithUnsignedInteger:v5];
  [v4 setObject:v9 forKey:@"characterSubstitutionCount"];

  return v5;
}

+ (unint64_t)updateCharacterInsertionCount:(id)a3 delta:(int)a4
{
  LODWORD(v5) = a4;
  id v4 = a3;
  unint64_t v5 = (int)v5;
  uint64_t v6 = [v4 valueForKey:@"characterInsertionCount"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unint64_t v8 = [v4 valueForKey:@"characterInsertionCount"];
    unint64_t v5 = [v8 unsignedIntegerValue] + (int)v5;
  }
  unint64_t v9 = [NSNumber numberWithUnsignedInteger:v5];
  [v4 setObject:v9 forKey:@"characterInsertionCount"];

  return v5;
}

+ (int64_t)updateCharacterModificationCount:(id)a3 delta:(int)a4
{
  LODWORD(v5) = a4;
  id v4 = a3;
  int64_t v5 = (int)v5;
  uint64_t v6 = [v4 valueForKey:@"characterModificationCount"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unint64_t v8 = [v4 valueForKey:@"characterModificationCount"];
    int64_t v5 = [v8 integerValue] + (int)v5;
  }
  unint64_t v9 = [NSNumber numberWithInteger:v5];
  [v4 setObject:v9 forKey:@"characterModificationCount"];

  return v5;
}

+ (void)trackInsertion:(id)a3 text:(id)a4 range:(_NSRange)a5
{
  NSUInteger location = a5.location;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = [v7 valueForKey:@"insertion"];

  if (v9)
  {
    unint64_t v10 = [v7 objectForKey:@"insertion"];
    char v11 = [v10 objectForKey:@"end"];
    uint64_t v12 = [v11 unsignedIntegerValue] + 1;

    if (location == v12)
    {
      unsigned __int16 v13 = [NSNumber numberWithUnsignedInteger:location];
      [v10 setObject:v13 forKey:@"end"];

      uint64_t v14 = NSString;
      int v15 = [v10 objectForKey:@"text"];
      char v16 = [v14 stringWithFormat:@"%@%@", v15, v8];

      [v10 setObject:v16 forKey:@"text"];
    }
    else
    {
      BOOL v20 = [v7 objectForKey:@"insertions"];

      if (v20)
      {
        v21 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v22 = [v7 objectForKey:@"insertions"];
        v23 = [v21 arrayWithArray:v22];

        [v23 addObject:v10];
        unint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithArray:v23];
      }
      else
      {
        v29[0] = v10;
        unint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      }
      [v7 setObject:v24 forKey:@"insertions"];
      uint64_t v28 = (void *)MEMORY[0x1E4F1CA60];
      long long v25 = [NSNumber numberWithUnsignedInteger:location];
      id v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", location + objc_msgSend(v8, "length") - 1);
      uint64_t v27 = objc_msgSend(v28, "dictionaryWithObjectsAndKeys:", v8, @"text", v25, @"start", v26, @"end", 0);

      unint64_t v10 = (void *)v27;
    }
  }
  else
  {
    char v17 = (void *)MEMORY[0x1E4F1CA60];
    unsigned __int16 v18 = [NSNumber numberWithUnsignedInteger:location];
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", location + objc_msgSend(v8, "length") - 1);
    unint64_t v10 = objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v8, @"text", v18, @"start", v19, @"end", 0);
  }
  [v7 setObject:v10 forKey:@"insertion"];
}

+ (void)trackDeletion:(id)a3 text:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t v9 = (__CFString *)a4;
  unint64_t v10 = [v8 valueForKey:@"deletion"];

  if (v10)
  {
    char v11 = [v8 objectForKey:@"deletion"];
    uint64_t v12 = [v11 objectForKey:@"start"];
    uint64_t v13 = [v12 unsignedIntegerValue] - 1;

    if (location == v13)
    {
      uint64_t v14 = [NSNumber numberWithUnsignedInteger:location];
      [v11 setObject:v14 forKey:@"start"];

      int v15 = NSString;
      if (v9) {
        char v16 = v9;
      }
      else {
        char v16 = &stru_1ED0E84C0;
      }
      char v17 = [v11 objectForKey:@"text"];
      unsigned __int16 v18 = [v15 stringWithFormat:@"%@%@", v16, v17];

      [v11 setObject:v18 forKey:@"text"];
    }
    else
    {
      v23 = [v8 objectForKey:@"deletions"];

      v34 = v9;
      if (v23)
      {
        unint64_t v24 = (void *)MEMORY[0x1E4F1CA48];
        long long v25 = [v8 objectForKey:@"deletions"];
        id v26 = [v24 arrayWithArray:v25];

        [v26 addObject:v11];
        uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithArray:v26];
      }
      else
      {
        v35[0] = v11;
        uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
      }
      v33 = (void *)v27;
      [v8 setObject:v27 forKey:@"deletions"];
      uint64_t v28 = (void *)MEMORY[0x1E4F1CA60];
      uint64_t v29 = [NSNumber numberWithUnsignedInteger:location];
      if (length <= 1) {
        uint64_t v30 = 1;
      }
      else {
        uint64_t v30 = length;
      }
      v31 = [NSNumber numberWithUnsignedInteger:location + v30 - 1];
      unint64_t v9 = v34;
      uint64_t v32 = objc_msgSend(v28, "dictionaryWithObjectsAndKeys:", v34, @"text", v29, @"start", v31, @"end", 0);

      char v11 = (void *)v32;
    }
  }
  else
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CA60];
    BOOL v20 = [NSNumber numberWithUnsignedInteger:location];
    if (length <= 1) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = length;
    }
    uint64_t v22 = [NSNumber numberWithUnsignedInteger:location + v21 - 1];
    char v11 = objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v9, @"text", v20, @"start", v22, @"end", 0);
  }
  [v8 setObject:v11 forKey:@"deletion"];
}

+ (void)trackSubstitution:(id)a3 originalText:(id)a4 originalTextRange:(_NSRange)a5 replacementText:(id)a6 replacementTextRange:(_NSRange)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v35[3] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  char v11 = (__CFString *)a4;
  uint64_t v12 = (__CFString *)a6;
  uint64_t v13 = &stru_1ED0E84C0;
  if (v11) {
    uint64_t v13 = v11;
  }
  v35[0] = v13;
  v34[0] = @"text";
  v34[1] = @"start";
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", location, v27);
  v35[1] = v14;
  v34[2] = @"end";
  int v15 = [NSNumber numberWithUnsignedInteger:length + location - 1];
  void v35[2] = v15;
  char v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];

  char v17 = &stru_1ED0E84C0;
  if (v12) {
    char v17 = v12;
  }
  v33[0] = v17;
  v32[0] = @"text";
  v32[1] = @"start";
  unsigned __int16 v18 = [NSNumber numberWithUnsignedInteger:a7.location];
  v33[1] = v18;
  v32[2] = @"end";
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:a7.length + a7.location - 1];
  v33[2] = v19;
  BOOL v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];

  v30[0] = @"original";
  v30[1] = @"replacement";
  v31[0] = v16;
  v31[1] = v20;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  uint64_t v22 = [v28 objectForKey:@"substitutions"];

  if (v22)
  {
    v23 = (void *)MEMORY[0x1E4F1CA48];
    unint64_t v24 = [v28 objectForKey:@"substitutions"];
    long long v25 = [v23 arrayWithArray:v24];

    [v25 addObject:v21];
    id v26 = [MEMORY[0x1E4F1C978] arrayWithArray:v25];
  }
  else
  {
    uint64_t v29 = v21;
    id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  }
  [v28 setObject:v26 forKey:@"substitutions"];
}

+ (void)logSpeechAlternativeReplacement:(id)a3 originalText:(id)a4 replacementText:(id)a5 index:(unint64_t)a6
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27[0] = @"index";
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:a6 + 1];
  v28[0] = v12;
  v28[1] = v10;
  v27[1] = @"originalText";
  v27[2] = @"replacementText";
  v28[2] = v11;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

  uint64_t v14 = [v9 objectForKey:@"alternativesSelected"];

  if (v14)
  {
    int v15 = (void *)MEMORY[0x1E4F1CA48];
    char v16 = [v9 objectForKey:@"alternativesSelected"];
    char v17 = [v15 arrayWithArray:v16];

    [v17 addObject:v13];
    unsigned __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithArray:v17];
    [v9 setObject:v18 forKey:@"alternativesSelected"];
  }
  else
  {
    id v26 = v13;
    char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    [v9 setObject:v17 forKey:@"alternativesSelected"];
  }

  uint64_t v19 = [v9 objectForKey:@"correctionIdentifier"];
  BOOL v20 = [v9 objectForKey:@"dictationUIInteractionIdentifier"];
  uint64_t v21 = +[UIDictationController activeInstance];
  [v21 logAlternativeSelected:v13 correctionIdentifier:v19 interactionIdentifier:v20];

  uint64_t v22 = [v9 objectForKey:@"alternativesAvailableCount"];
  uint64_t v23 = [v22 integerValue];

  unint64_t v24 = [v9 objectForKey:@"dictationLanguage"];
  long long v25 = [v9 objectForKey:@"dictationInstrumentationContext"];
  +[UIDictationController instrumentationDictationAlternativeSelectedWithInstrumentationContext:v25 originalText:v10 replacementText:v11 replacementIndex:a6 alternativesAvailableCount:v23 dictationLanguage:v24];
}

+ (void)attributedString:(id)a3 withIdentifiersBlock:(id)a4
{
  id v10 = (void (**)(id, void *, void *, void *, void *))a4;
  int64_t v5 = [a3 attribute:@"_UITextInputDictationResultMetadata" atIndex:0 effectiveRange:0];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:@"correctionIdentifier"];
    id v7 = [v5 objectForKeyedSubscript:@"dictationUIInteractionIdentifier"];
    id v8 = [v5 objectForKeyedSubscript:@"dictationInstrumentationContext"];
    id v9 = [v5 objectForKeyedSubscript:@"dictationLanguage"];
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
    id v9 = 0;
    uint64_t v6 = 0;
  }
  v10[2](v10, v6, v7, v8, v9);
}

+ (unint64_t)maxLoggableLengthOfInsertionWithoutDeletion:(id)a3
{
  id v3 = [a3 objectForKey:@"speechRecognitionSource"];
  if ([v3 isEqualToString:@"local"]) {
    unint64_t v4 = -1;
  }
  else {
    unint64_t v4 = 5;
  }

  return v4;
}

+ (unint64_t)maxLoggableLengthOfInsertionWithDeletion:(id)a3
{
  id v3 = [a3 objectForKey:@"speechRecognitionSource"];
  if ([v3 isEqualToString:@"local"]) {
    unint64_t v4 = -1;
  }
  else {
    unint64_t v4 = 12;
  }

  return v4;
}

+ (unint64_t)maxLoggableLengthOfInsertionBySubstitution:(id)a3
{
  id v3 = [a3 objectForKey:@"speechRecognitionSource"];
  if ([v3 isEqualToString:@"local"]) {
    unint64_t v4 = -1;
  }
  else {
    unint64_t v4 = 12;
  }

  return v4;
}

+ (id)trackingPunctuations
{
  if (qword_1EB261A40 != -1) {
    dispatch_once(&qword_1EB261A40, &__block_literal_global_202_0);
  }
  uint64_t v2 = (void *)qword_1EB261A38;
  return v2;
}

void __44__UIDictationUtilities_trackingPunctuations__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @",", @".", @"!", @"?", @"，", @"。", @"！", @"？", 0);
  char v1 = (void *)qword_1EB261A38;
  qword_1EB261A38 = v0;
}

+ (BOOL)shouldLogCorrectionInfoForCurrentBundleId
{
  if (qword_1EB261A48 != -1) {
    dispatch_once(&qword_1EB261A48, &__block_literal_global_228_1);
  }
  return _MergedGlobals_1129;
}

void __65__UIDictationUtilities_shouldLogCorrectionInfoForCurrentBundleId__block_invoke()
{
  char v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.tencent.xin", @"net.whatsapp.WhatsApp", @"jp.naver.line", @"com.facebook.Messenger", @"com.burbn.instagram", @"com.tencent.mqq", @"com.zhiliaoapp.musically", @"com.ss.iphone.ugc.Aweme", @"com.facebook.Facebook", @"ph.telegra.Telegraph", @"org.whispersystems.signal", @"com.toyopagroup.picaboo", @"com.roblox.robloxmobile", 0);
  uint64_t v0 = _UIMainBundleIdentifier();
  _MergedGlobals_1129 = [v1 containsObject:v0];
}

+ (BOOL)shouldAddDeleteMenuElement
{
  return 0;
}

+ (BOOL)shouldInsertSpaceBetweenStringA:(id)a3 andStringB:(id)a4
{
  int64_t v5 = (void *)MEMORY[0x1E4F28B88];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 punctuationCharacterSet];
  id v9 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
  uint64_t v10 = [v6 characterAtIndex:0];

  uint64_t v11 = objc_msgSend(v7, "characterAtIndex:", objc_msgSend(v7, "length") - 1);
  LOBYTE(v7) = [v8 characterIsMember:v10];
  LOBYTE(v11) = (v7 | [v9 characterIsMember:v11]) ^ 1;

  return v11;
}

+ (BOOL)_isAutomaticKeyboardDownDictationDisabled
{
  if (_isAutomaticKeyboardDownDictationDisabled_onceToken != -1) {
    dispatch_once(&_isAutomaticKeyboardDownDictationDisabled_onceToken, &__block_literal_global_270);
  }
  return 1;
}

void __65__UIDictationUtilities__isAutomaticKeyboardDownDictationDisabled__block_invoke()
{
  _UIKitUserDefaults();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  if (([v1 BOOLForKey:@"UIAutomaticKeyboardDownDictationDisabled"] & 1) == 0)
  {
    uint64_t v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v0 BOOLForKey:@"UIAutomaticKeyboardDownDictationDisabled"];
  }
}

+ (BOOL)_isDictationAssetAvailableForLocale:(id)a3
{
  id v3 = (__CFString *)a3;
  if (qword_1EB261A60 != -1) {
    dispatch_once(&qword_1EB261A60, &__block_literal_global_277);
  }
  unint64_t v4 = SpeechLibrary();
  BOOL v5 = 0;
  if (v3 && v4)
  {
    if (([(__CFString *)v3 isEqualToString:@"en-JP"] & 1) != 0
      || [(__CFString *)v3 isEqualToString:@"en_JP"])
    {

      id v3 = @"en-US";
    }
    id v6 = [getSFSpeechAssetManagerClass() languageCode:v3];
    if ([(id)qword_1EB261A58 containsObject:v6])
    {
      BOOL v5 = 1;
LABEL_16:

      goto LABEL_17;
    }
    if (([(id)qword_1EB261A50 containsObject:v6] & 1) == 0)
    {
      id v7 = (void *)qword_1EB261A58;
      BOOL v5 = 1;
      id v8 = [getSFSpeechAssetManagerClass() installedLanguagesForTaskHint:1];
      [v7 unionSet:v8];

      if ([(id)qword_1EB261A58 containsObject:v6]) {
        goto LABEL_16;
      }
      uint64_t v20 = 0;
      uint64_t v21 = &v20;
      uint64_t v22 = 0x2050000000;
      id v9 = (void *)qword_1EB261A68;
      uint64_t v23 = qword_1EB261A68;
      if (!qword_1EB261A68)
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __getSFEntitledAssetConfigClass_block_invoke;
        v19[3] = &unk_1E52D9900;
        v19[4] = &v20;
        __getSFEntitledAssetConfigClass_block_invoke((uint64_t)v19);
        id v9 = (void *)v21[3];
      }
      uint64_t v10 = v9;
      _Block_object_dispose(&v20, 8);
      uint64_t v11 = (void *)[[v10 alloc] initWithLanguage:v6 taskHint:1];
      id SFSpeechAssetManagerClass = getSFSpeechAssetManagerClass();
      uint64_t v13 = [getSFSpeechAssetManagerClass() systemClientId];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __60__UIDictationUtilities__isDictationAssetAvailableForLocale___block_invoke_2;
      v17[3] = &unk_1E52EBCD8;
      id v18 = v6;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __60__UIDictationUtilities__isDictationAssetAvailableForLocale___block_invoke_3;
      v15[3] = &unk_1E52FB5A0;
      id v16 = v18;
      [SFSpeechAssetManagerClass fetchAssetWithConfig:v11 clientIdentifier:v13 progress:v17 completion:v15];
    }
    BOOL v5 = 0;
    goto LABEL_16;
  }
LABEL_17:

  return v5;
}

void __60__UIDictationUtilities__isDictationAssetAvailableForLocale___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  id v1 = (void *)qword_1EB261A50;
  qword_1EB261A50 = v0;

  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  id v3 = (void *)qword_1EB261A58;
  qword_1EB261A58 = v2;
}

uint64_t __60__UIDictationUtilities__isDictationAssetAvailableForLocale___block_invoke_2(uint64_t a1)
{
  return [(id)qword_1EB261A50 addObject:*(void *)(a1 + 32)];
}

void __60__UIDictationUtilities__isDictationAssetAvailableForLocale___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6) {
    [(id)qword_1EB261A58 addObject:*(void *)(a1 + 32)];
  }
  if ([(id)qword_1EB261A50 containsObject:*(void *)(a1 + 32)]) {
    [(id)qword_1EB261A50 removeObject:*(void *)(a1 + 32)];
  }
}

+ (id)capitalizeFirstWord:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__128;
  uint64_t v12 = __Block_byref_object_dispose__128;
  id v13 = (id)[v3 mutableCopy];
  uint64_t v4 = [v3 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__UIDictationUtilities_capitalizeFirstWord___block_invoke;
  v7[3] = &unk_1E52E3F28;
  v7[4] = &v8;
  objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 3, v7);
  id v5 = (void *)[(id)v9[5] copy];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __44__UIDictationUtilities_capitalizeFirstWord___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v14 = a2;
  uint64_t v11 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
  uint64_t v12 = [v14 rangeOfCharacterFromSet:v11];

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v13 = [v14 capitalizedString];
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "replaceCharactersInRange:withString:", a3, a4, v13);
  }
  *a7 = 1;
}

@end