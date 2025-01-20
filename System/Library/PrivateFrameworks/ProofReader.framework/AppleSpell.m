@interface AppleSpell
+ (id)availableLanguages;
+ (id)sharedInstance;
+ (void)resetSharedInstance;
- (AppleSpell)init;
- (BOOL)_acceptErrorWithRuleType:(unint64_t)a3 ruleNumber:(unint64_t)a4 grammarRange:(_NSRange)a5 sentenceRange:(_NSRange)a6 inString:(id)a7 corrections:(id)a8 issueType:(unint64_t *)a9;
- (BOOL)_acceptWithoutAccentForString:(id)a3 range:(_NSRange)a4 inString:(id)a5 languageObject:(id)a6;
- (BOOL)_addLanguageModelCompletionsForPartialWordRange:(_NSRange)a3 languageObject:(id)a4 connection:(_PR_DB_IO *)a5 sender:(id)a6 tagger:(id)a7 appIdentifier:(id)a8 waitForLanguageModel:(BOOL)a9 allowTransformer:(BOOL)a10 candidates:(id)a11 scoreDictionary:(id)a12 tryTransliteration:(BOOL *)a13;
- (BOOL)_checkEnglishGrammarInString:(id)a3 range:(_NSRange)a4 indexIntoBuffer:(unint64_t)a5 bufferLength:(unint64_t)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8 sender:(id)a9 bufIO:(_PR_BUF_IO *)a10 retval:(int *)a11 errorRange:(_NSRange *)a12 details:(id *)a13;
- (BOOL)_checkGrammarInString:(id)a3 range:(_NSRange)a4 language:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 bufIO:(_PR_BUF_IO *)a8 errorRange:(_NSRange *)a9 details:(id *)a10;
- (BOOL)_findMatchingRangesForRange:(_NSRange)a3 inString:(id)a4 keyEventArray:(id)a5 endingAtIndex:(unint64_t)a6 matchingStringRange:(_NSRange *)a7 correctableStringRange:(_NSRange *)a8 matchingKeyEventRange:(_NSRange *)a9 firstMisspelledKeyEventIndex:(unint64_t *)a10 lastMisspelledKeyEventIndex:(unint64_t *)a11 previousBackspaceCount:(unint64_t *)a12;
- (BOOL)_getUnigramProbabilityForString:(id)a3 languageModel:(id)a4 probability:(double *)a5;
- (BOOL)_permitCorrection:(id)a3 languageObject:(id)a4 flags:(unint64_t)a5 isCapitalized:(BOOL)a6 typologyCorrection:(id)a7;
- (BOOL)_prohibitCorrectionBasedOnCountsForString:(id)a3 lowercaseString:(id)a4 appIdentifier:(id)a5 languageObject:(id)a6 typologyCorrection:(id)a7;
- (BOOL)_prohibitCorrectionForLanguageObject:(id)a3 lastKeyboardLanguageObject:(id)a4;
- (BOOL)_spellServer:(id)a3 canChangeCaseOfFirstLetterInString:(id)a4 toUpperCase:(BOOL)a5 languageObject:(id)a6;
- (BOOL)_useAlternateLanguageForRange:(_NSRange)a3 ofString:(id)a4 languageObject:(id)a5 tagger:(id)a6 alternateLanguageObject:(id)a7 alternateTagger:(id)a8 appIdentifier:(id)a9;
- (BOOL)checkNameWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 globalOnly:(BOOL)a6;
- (BOOL)checkNegativeWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5;
- (BOOL)checkNegativeWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 alreadyCapitalized:(BOOL)a6;
- (BOOL)checkNoCapAbbreviationWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5;
- (BOOL)checkSpecialPrefixesForWordBuffer:(char *)a3 length:(unint64_t)a4;
- (BOOL)checkWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 index:(unint64_t)a6;
- (BOOL)findMatchingRangesForRange:(_NSRange)a3 inString:(id)a4 keyEventArray:(id)a5 selectedRangeValue:(id)a6 matchingStringRange:(_NSRange *)a7 correctableStringRange:(_NSRange *)a8 matchingKeyEventRange:(_NSRange *)a9 firstMisspelledKeyEventIndex:(unint64_t *)a10 lastMisspelledKeyEventIndex:(unint64_t *)a11 previousBackspaceCount:(unint64_t *)a12;
- (BOOL)getCharacterModelConditionalProbabilityForString:(id)a3 context:(id)a4 language:(id)a5 probability:(double *)a6;
- (BOOL)getConditionalProbabilityForWord:(id)a3 context:(id)a4 language:(id)a5 probability:(double *)a6;
- (BOOL)getMetaFlagsForWord:(id)a3 inLexiconForLanguage:(id)a4 metaFlags:(unsigned int *)a5 otherMetaFlags:(unsigned int *)a6;
- (BOOL)getMetaFlagsForWord:(id)a3 inLexiconForLanguageObject:(id)a4 metaFlags:(unsigned int *)a5 otherMetaFlags:(unsigned int *)a6;
- (BOOL)getTransformerModelConditionalProbabilityForString:(id)a3 context:(id)a4 language:(id)a5 probability:(double *)a6;
- (BOOL)inputStringIsFullOrAbbreviatedPinyin:(id)a3;
- (BOOL)inputStringIsPinyin:(id)a3 allowPartialLastSyllable:(BOOL)a4;
- (BOOL)noSuggestForCompletion:(id)a3 languageObject:(id)a4 appIdentifier:(id)a5 alreadyCapitalized:(BOOL)a6;
- (BOOL)shouldBlockWord:(id)a3 languageObject:(id)a4;
- (BOOL)spellServer:(id)a3 canChangeCaseOfFirstLetterInString:(id)a4 toUpperCase:(BOOL)a5 language:(id)a6;
- (BOOL)spellServer:(id)a3 shouldBlockWord:(id)a4 language:(id)a5 offensiveOnly:(BOOL)a6;
- (BOOL)supportSentenceCorrectionForLanguageObject:(id)a3 appIdentifier:(id)a4;
- (BOOL)testTurkishSuffixationPattern:(id)a3;
- (BOOL)useCharacterLanguageModelForLanguageObject:(id)a3 tagger:(id)a4 appIdentifier:(id)a5;
- (BOOL)useSentencePieceLanguageModelForLanguageObject:(id)a3 tagger:(id)a4 appIdentifier:(id)a5;
- (BOOL)useTransformerLanguageModelForLanguageObject:(id)a3 tagger:(id)a4 appIdentifier:(id)a5;
- (BOOL)useUnigramProbabilityForLanguageObject:(id)a3;
- (BOOL)useWordLanguageModelForLanguageObject:(id)a3 tagger:(id)a4 appIdentifier:(id)a5;
- (BOOL)validateAbbreviationOrNumberWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7;
- (BOOL)validateAdditionalWord:(id)a3 inLexiconForLanguage:(id)a4;
- (BOOL)validateAdditionalWord:(id)a3 inLexiconForLanguageObject:(id)a4;
- (BOOL)validateNoCapAbbreviation:(id)a3 inLexiconForLanguage:(id)a4;
- (BOOL)validateNoCapAbbreviation:(id)a3 inLexiconForLanguageObject:(id)a4;
- (BOOL)validateUntilLearnedWord:(id)a3 inLexiconForLanguage:(id)a4;
- (BOOL)validateUntilLearnedWord:(id)a3 inLexiconForLanguageObject:(id)a4;
- (BOOL)validateVariantWord:(id)a3 inLexiconForLanguage:(id)a4;
- (BOOL)validateVariantWord:(id)a3 inLexiconForLanguageObject:(id)a4;
- (BOOL)validateWord:(id)a3 inLexicon:(id)a4;
- (BOOL)validateWord:(id)a3 inLexiconForLanguage:(id)a4;
- (BOOL)validateWord:(id)a3 inLexiconForLanguageObject:(id)a4;
- (BOOL)validateWord:(id)a3 inLexicons:(id)a4 forLanguage:(id)a5 requiredMetaFlags:(unsigned int)a6 alternativeRequiredMetaFlags:(unsigned int)a7 prohibitedMetaFlags:(unsigned int)a8 caseInsensitive:(BOOL)a9;
- (BOOL)validateWord:(id)a3 inLexiconsForLanguageObject:(id)a4 requiredMetaFlags:(unsigned int)a5 alternativeRequiredMetaFlags:(unsigned int)a6 prohibitedMetaFlags:(unsigned int)a7 caseInsensitive:(BOOL)a8;
- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 connection:(_PR_DB_IO *)a5;
- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkBase:(BOOL)a8 checkDict:(BOOL)a9 checkNames:(BOOL)a10 checkHyphens:(BOOL)a11 checkIntercaps:(BOOL)a12 checkOptions:(BOOL)a13 depth:(unint64_t)a14;
- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkBase:(BOOL)a8 checkDict:(BOOL)a9 checkTemp:(BOOL)a10 checkNames:(BOOL)a11 checkHyphens:(BOOL)a12 checkIntercaps:(BOOL)a13 checkOptions:(BOOL)a14 depth:(unint64_t)a15;
- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkBase:(BOOL)a8 checkDict:(BOOL)a9 checkTemp:(BOOL)a10 checkUser:(BOOL)a11 checkNames:(BOOL)a12 checkHyphens:(BOOL)a13 checkIntercaps:(BOOL)a14 checkOptions:(BOOL)a15 depth:(unint64_t)a16;
- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkBase:(BOOL)a8 checkDict:(BOOL)a9 checkTemp:(BOOL)a10 checkUser:(BOOL)a11 checkNames:(BOOL)a12 checkHyphens:(BOOL)a13 checkIntercaps:(BOOL)a14 checkOptions:(BOOL)a15 forCorrection:(BOOL)a16 depth:(unint64_t)a17;
- (BOOL)validateWordPrefixBuffer:(char *)a3 length:(unint64_t)a4 connection:(_PR_DB_IO *)a5;
- (BOOL)wordIsAlreadyAccented:(id)a3;
- (_NSRange)_modifiedGrammarRangeForDoubledWordRange:(_NSRange)a3 sentenceRange:(_NSRange)a4 inString:(id)a5 corrections:(id)a6;
- (_NSRange)spellServer:(id)a3 checkGrammarInString:(id)a4 language:(id)a5 details:(id *)a6;
- (_NSRange)spellServer:(id)a3 checkGrammarInString:(id)a4 range:(_NSRange)a5 language:(id)a6 orthography:(id)a7 mutableResults:(id)a8 offset:(unint64_t)a9 details:(id *)a10;
- (_NSRange)spellServer:(id)a3 findMisspelledWordInString:(id)a4 language:(id)a5 wordCount:(int64_t *)a6 countOnly:(BOOL)a7;
- (_NSRange)spellServer:(id)a3 findMisspelledWordInString:(id)a4 language:(id)a5 wordCount:(int64_t *)a6 countOnly:(BOOL)a7 correction:(id *)a8;
- (_NSRange)spellServer:(id)a3 findMisspelledWordInString:(id)a4 languages:(id)a5 wordCount:(int64_t *)a6 countOnly:(BOOL)a7 correction:(id *)a8;
- (_NSRange)spellServer:(id)a3 findMisspelledWordInString:(id)a4 range:(_NSRange)a5 languages:(id)a6 topLanguages:(id)a7 orthography:(id)a8 checkOrthography:(BOOL)a9 mutableResults:(id)a10 offset:(unint64_t)a11 autocorrect:(BOOL)a12 onlyAtInsertionPoint:(BOOL)a13 initialCapitalize:(BOOL)a14 autocapitalize:(BOOL)a15 keyEventArray:(id)a16 appIdentifier:(id)a17 selectedRangeValue:(id)a18 parameterBundles:(id)a19 wordCount:(int64_t *)a20 countOnly:(BOOL)a21 appendCorrectionLanguage:(BOOL)a22 correction:(id *)a23;
- (char)_validatedGuessWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkUser:(BOOL)a8 additionalBuffer:(char *)a9;
- (const)englishPhraseRoot;
- (float)dynamicScoreForWord:(id)a3 languageModel:(id)a4 languageObject:(id)a5;
- (float)dynamicScoreForWord:(id)a3 languageObject:(id)a4 appIdentifier:(id)a5;
- (id)_NLPLanguageModelWithType:(int64_t)a3 forLanguageObject:(id)a4 waitForResult:(BOOL)a5;
- (id)_accentCorrectionResultForString:(id)a3 range:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 languageObject:(id)a7 onlyAtInsertionPoint:(BOOL)a8 capitalize:(BOOL)a9 keyEventArray:(id)a10 selectedRangeValue:(id)a11;
- (id)_capitalizationResultForString:(id)a3 range:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 languageObject:(id)a7 onlyAtInsertionPoint:(BOOL)a8 keyEventArray:(id)a9 selectedRangeValue:(id)a10;
- (id)_checkSentence:(id)a3 languageObject:(id)a4;
- (id)_connectionCorrectionForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 connection:(_PR_DB_IO *)a7 flags:(unint64_t)a8 isCapitalized:(BOOL)a9 accentCorrectionOnly:(BOOL)a10 isAbbreviation:(BOOL *)a11 trySpaceInsertion:(BOOL *)a12 hasAccentCorrections:(BOOL *)a13 candidateList:(id)a14 typologyCorrection:(id)a15;
- (id)_correctionResultForKoreanString:(id)a3 range:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 tagger:(id)a7 appIdentifier:(id)a8 dictionary:(id)a9 keyEventArray:(id)a10;
- (id)_correctionResultForString:(id)a3 range:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 tagger:(id)a7 appIdentifier:(id)a8 dictionary:(id)a9 languages:(id)a10 connection:(_PR_DB_IO *)a11 flags:(unint64_t)a12 keyEventArray:(id)a13 selectedRangeValue:(id)a14 parameterBundles:(id)a15 previousLetter:(unsigned __int16)a16 nextLetter:(unsigned __int16)a17 extraMisspellingCount:(unint64_t)a18 extraCorrectionCount:(unint64_t *)a19;
- (id)_correctionResultForWord:(id)a3 replacementRange:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 languageObject:(id)a7 capitalize:(BOOL)a8 isCapitalized:(BOOL)a9 isSecondCapitalized:(BOOL)a10 hasCurlyApostrophe:(BOOL)a11 appendCorrectionLanguage:(BOOL)a12 capitalizationLocale:(id)a13 proposedCorrection:(id)a14;
- (id)_detailWithRange:(_NSRange)a3 description:(id)a4 corrections:(id)a5;
- (id)_detailWithRange:(_NSRange)a3 description:(id)a4 corrections:(id)a5 issueType:(unint64_t)a6;
- (id)_initialCorrectionForString:(id)a3 lowercaseString:(id)a4 isFirstSecondCapitalized:(BOOL)a5 dictionary:(id)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8;
- (id)_languageModelStateScoresForCandidateList:(id)a3 languageModel:(id)a4 state:(id)a5 language:(id)a6 tagger:(id)a7;
- (id)_lexiconPathForLanguageObject:(id)a3 type:(id)a4;
- (id)_lexiconPathForLocalization:(id)a3 type:(id)a4;
- (id)_lexiconsForLanguage:(id)a3;
- (id)_lexiconsForLanguage:(id)a3 loadType:(int64_t)a4;
- (id)_lexiconsForLanguageObject:(id)a3;
- (id)_loadLexiconsForLanguage:(id)a3 localization:(id)a4 cachedOnly:(BOOL)a5 onQueue:(id)a6;
- (id)_loadNERTaggerOnQueue:(id)a3;
- (id)_loadNLPLanguageModelWithType:(int64_t)a3 forLanguageObject:(id)a4 onQueue:(id)a5;
- (id)_loadPhraseLexiconsForLanguage:(id)a3 localization:(id)a4 onQueue:(id)a5;
- (id)_loadWordLanguageModelForLanguage:(id)a3 localization:(id)a4 appIdentifier:(id)a5 onQueue:(id)a6;
- (id)_modifiedGrammarDescriptionForDescription:(id)a3;
- (id)_orthographyByModifyingOrthography:(id)a3 withLatinLanguage:(id)a4;
- (id)_phraseCapitalizationResultForString:(id)a3 range:(_NSRange)a4 currentWordRange:(_NSRange)a5 inString:(id)a6 offset:(unint64_t)a7 languageObject:(id)a8 onlyAtInsertionPoint:(BOOL)a9 keyEventArray:(id)a10 selectedRangeValue:(id)a11;
- (id)_phraseLexiconPathForLanguage:(id)a3;
- (id)_phraseLexiconsForLanguage:(id)a3;
- (id)_phraseLexiconsForLanguage:(id)a3 waitForResult:(BOOL)a4;
- (id)_pinyinStringByCombiningPinyinString:(id)a3 withPinyinString:(id)a4;
- (id)_primitiveRetainedAlternativesForPinyinInputString:(id)a3;
- (id)_rankedCandidatesForCandidateList:(id)a3 languageObject:(id)a4 tagger:(id)a5 appIdentifier:(id)a6 parameterBundles:(id)a7;
- (id)_rankedCandidatesForRange:(_NSRange)a3 candidates:(id)a4 languageObject:(id)a5 tagger:(id)a6 appIdentifier:(id)a7 allowTransformer:(BOOL)a8 scoreDictionary:(id)a9;
- (id)_recursiveRetainedAlternativesForPinyinInputString:(id)a3 depth:(unint64_t)a4;
- (id)_retainedAlternativesByCombiningAlternatives:(id)a3 withAlternatives:(id)a4 andAddingAlternatives:(id)a5;
- (id)_spaceInsertionCorrectionForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 connection:(_PR_DB_IO *)a7 flags:(unint64_t)a8 isCapitalized:(BOOL)a9 typologyCorrection:(id)a10;
- (id)_spellServer:(id)a3 suggestGuessesForWordRange:(_NSRange)a4 inString:(id)a5 languageObject:(id)a6 options:(id)a7;
- (id)_spellServer:(id)a3 suggestGuessesForWordRange:(_NSRange)a4 inString:(id)a5 languageObject:(id)a6 options:(id)a7 tagger:(id)a8 errorModel:(id)a9 guessesDictionaries:(id)a10;
- (id)_standardizedLanguageModelStringForString:(id)a3;
- (id)_stringForCompletion:(id)a3 languageModel:(id)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 prefix:(id)a8 capitalized:(BOOL)a9;
- (id)_stringForTokenIDs:(const unsigned int *)a3 tokenCount:(unint64_t)a4 entryString:(id)a5 languageModel:(id)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8 sender:(id)a9 prefix:(id)a10 capitalized:(BOOL)a11;
- (id)_taggerForOrthoIndex:(unint64_t)a3;
- (id)_umlautCorrectionForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 connection:(_PR_DB_IO *)a7 typologyCorrection:(id)a8;
- (id)assetDataBundleURLsForLanguageObject:(id)a3;
- (id)autocorrectionDictionaryForLanguageObject:(id)a3;
- (id)backgroundLoadingQueue;
- (id)backgroundMaintenanceQueue;
- (id)capitalizationDictionaryArrayForLanguageObject:(id)a3;
- (id)characterLanguageModelForLanguageObject:(id)a3 waitForResult:(BOOL)a4;
- (id)contextAlternativeAnnotatedStringsForJyutpingInputString:(id)a3;
- (id)contextAlternativeAnnotatedStringsForPinyinInputString:(id)a3;
- (id)contextAlternativeAnnotatedStringsForZhuyinInputString:(id)a3;
- (id)dataBundle;
- (id)dataBundlesForLanguageObject:(id)a3;
- (id)databasePathForLanguageObject:(id)a3;
- (id)dictionaryForLanguageObject:(id)a3 index:(unint64_t)a4;
- (id)englishStringFromWordBuffer:(char *)a3 length:(unint64_t)a4 connection:(_PR_DB_IO *)a5;
- (id)englishStringsFromWordBuffer:(char *)a3 length:(unint64_t)a4 connection:(_PR_DB_IO *)a5;
- (id)externalStringForKoreanInternalString:(id)a3;
- (id)globalDictionaryArray;
- (id)guessesDictionaryForLanguageObject:(id)a3;
- (id)internalStringForKoreanExternalString:(id)a3;
- (id)languageModelCompletionsForPartialWord:(id)a3 languageObject:(id)a4 sender:(id)a5 appIdentifier:(id)a6;
- (id)languageModelLocalizationForLanguage:(id)a3;
- (id)lexiconForLanguage:(id)a3;
- (id)lexiconForLanguageObject:(id)a3;
- (id)localDictionaryArrayForLanguageObject:(id)a3;
- (id)modelCreationQueue;
- (id)nerTaggerWaitForResult:(BOOL)a3;
- (id)normalizedStringInString:(id)a3 range:(_NSRange)a4;
- (id)parameterBundleForLanguageObject:(id)a3;
- (id)phraseCorrectionsDictionaryForLanguageObject:(id)a3;
- (id)phraseMatching:(id)a3 inLexiconForLanguage:(id)a4;
- (id)phraseMatching:(id)a3 inLexiconForLanguageObject:(id)a4;
- (id)potentialSentenceCorrectionsForWord:(id)a3 languageObject:(id)a4;
- (id)regionalCorrectionsDictionaryForLanguageObject:(id)a3;
- (id)sentenceCorrectionsDictionaryForLanguageObject:(id)a3;
- (id)sentencePieceLanguageModelForLanguageObject:(id)a3 waitForResult:(BOOL)a4;
- (id)sentenceTerminatorCharacterSet;
- (id)spellServer:(id)a3 _retainedAlternativesForPinyinInputString:(id)a4 extended:(BOOL)a5;
- (id)spellServer:(id)a3 _retainedCorrectionsForPinyinInputString:(id)a4;
- (id)spellServer:(id)a3 _retainedFinalModificationsForPinyinInputString:(id)a4 geometryModelData:(id)a5;
- (id)spellServer:(id)a3 _retainedModificationsForPinyinInputString:(id)a4 geometryModelData:(id)a5;
- (id)spellServer:(id)a3 _retainedPrefixesForPinyinInputString:(id)a4;
- (id)spellServer:(id)a3 alternativesForPinyinInputString:(id)a4;
- (id)spellServer:(id)a3 candidatesForSelectedRange:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 types:(unint64_t)a7 options:(id)a8 orthography:(id)a9;
- (id)spellServer:(id)a3 checkGrammarInString:(id)a4 range:(_NSRange)a5 language:(id)a6 offset:(unint64_t)a7 options:(id)a8;
- (id)spellServer:(id)a3 checkString:(id)a4 offset:(unint64_t)a5 types:(unint64_t)a6 options:(id)a7 orthography:(id)a8 wordCount:(int64_t *)a9;
- (id)spellServer:(id)a3 correctionsForPinyinInputString:(id)a4;
- (id)spellServer:(id)a3 extendedAlternativesForPinyinInputString:(id)a4;
- (id)spellServer:(id)a3 finalModificationsForPinyinInputString:(id)a4;
- (id)spellServer:(id)a3 generateCandidatesForSelectedRange:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 types:(unint64_t)a7 options:(id)a8 orthography:(id)a9;
- (id)spellServer:(id)a3 modificationsForPinyinInputString:(id)a4;
- (id)spellServer:(id)a3 modificationsForPinyinInputString:(id)a4 geometryModelData:(id)a5;
- (id)spellServer:(id)a3 prefixesForPinyinInputString:(id)a4;
- (id)spellServer:(id)a3 regionalCorrectionForWord:(id)a4 language:(id)a5;
- (id)spellServer:(id)a3 stringForInputString:(id)a4 language:(id)a5;
- (id)spellServer:(id)a3 suggestCompletionDictionariesForPartialWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)lastLanguage options:(id)a7;
- (id)spellServer:(id)a3 suggestCompletionDictionariesForPartialWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6;
- (id)spellServer:(id)a3 suggestCompletionsForPartialWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)lastLanguage options:(id)a7;
- (id)spellServer:(id)a3 suggestCompletionsForPartialWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6;
- (id)spellServer:(id)a3 suggestContextualGuessDictionariesForWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)a6 options:(id)a7;
- (id)spellServer:(id)a3 suggestGuessDictionariesForWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)a6 options:(id)a7 errorModel:(id)a8;
- (id)spellServer:(id)a3 suggestGuessDictionariesForWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6 options:(id)a7 errorModel:(id)a8;
- (id)spellServer:(id)a3 suggestGuessesForKoreanWordRange:(_NSRange)a4 inString:(id)a5 options:(id)a6;
- (id)spellServer:(id)a3 suggestGuessesForWord:(id)a4 inLanguage:(id)a5;
- (id)spellServer:(id)a3 suggestGuessesForWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)a6 options:(id)a7;
- (id)spellServer:(id)a3 suggestGuessesForWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6;
- (id)spellServer:(id)a3 suggestNextLetterDictionariesForPartialWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)a6 options:(id)a7;
- (id)spellServer:(id)a3 suggestNextLetterDictionariesForPartialWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6;
- (id)spellServer:(id)a3 suggestWordWithLengthInRange:(_NSRange)a4 language:(id)a5;
- (id)spellServer:(id)a3 suggestWordWithMinimumLength:(unint64_t)a4 maximumLength:(unint64_t)a5 language:(id)lastLanguage;
- (id)stringByReducingArabicAlefVariantsInString:(id)a3;
- (id)stringByRemovingArabicDiacriticsFromString:(id)a3;
- (id)stringByRemovingHebrewDiacriticsFromString:(id)a3;
- (id)taggerForLanguageObject:(id)a3 string:(id)a4 range:(_NSRange)a5;
- (id)transformerLanguageModelForLanguageObject:(id)a3 waitForResult:(BOOL)a4;
- (id)transformerOrSiriLanguageModelForLanguageObject:(id)a3 appIdentifier:(id)a4 waitForResult:(BOOL)a5;
- (id)transformerParameterBundleForLanguageObject:(id)a3;
- (id)vietnameseModificationForWord:(id)a3;
- (id)wordLanguageModelForLanguage:(id)a3 appIdentifier:(id)a4 waitForResult:(BOOL)a5;
- (id)wordLanguageModelForLanguageObject:(id)a3 appIdentifier:(id)a4 waitForResult:(BOOL)a5;
- (unint64_t)_contextLengthForRange:(_NSRange)a3 languageObject:(id)a4 tagger:(id)a5 languageModel:(id)a6 maxContextLength:(unint64_t)a7 context:(unsigned int *)a8 cleanOffset:(unint64_t *)a9 cleanContextRange:(_NSRange *)a10 lastTokenRange:(_NSRange *)a11 lastTokenID:(unsigned int *)a12;
- (unint64_t)_getSplitIndexes:(unint64_t *)a3 maxCount:(unint64_t)a4 forPinyinInputString:(id)a5;
- (unint64_t)_resetLanguageModels;
- (unint64_t)acceptabilityOfWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 forPrediction:(BOOL)a6 alreadyCapitalized:(BOOL)a7;
- (unint64_t)acceptabilityOfWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 forPrediction:(BOOL)a6 alreadyCapitalized:(BOOL)a7 depth:(unint64_t)a8;
- (unint64_t)loadedLexiconsCountForLanguageObject:(id)a3;
- (unint64_t)numberOfTurkishSuffixPointsInBuffer:(char *)a3 length:(unint64_t)a4 maxSuffixPoints:(unint64_t)a5 suffixPoints:(id *)a6;
- (unsigned)_tokenIDForString:(id)a3 languageModel:(id)a4 languageObject:(id)a5 createIfAbsent:(BOOL)a6 terminatorTokenID:(unsigned int)a7;
- (unsigned)_tokenIDForString:(id)a3 languageModel:(id)a4 languageObject:(id)a5 terminatorTokenID:(unsigned int)a6;
- (void)_addAdditionalGuessesForWord:(id)a3 sender:(id)a4 buffer:(char *)a5 length:(unint64_t)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8 accents:(const char *)a9 isCapitalized:(BOOL)a10 isAllCaps:(BOOL)a11 isAllAlpha:(BOOL)a12 hasLigature:(BOOL)a13 suggestPossessive:(BOOL)a14 checkUser:(BOOL)a15 checkHyphens:(BOOL)a16 candidateList:(id)a17;
- (void)_addConnectionGuessesForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 connection:(_PR_DB_IO *)a7 candidateList:(id)a8;
- (void)_addContextAlternativesForPinyinInputString:(id)a3 modifications:(id)a4 afterIndex:(unint64_t)a5 delta:(int64_t)a6 toArray:(id)a7;
- (void)_addContextAlternativesForZhuyinInputString:(id)a3 modifications:(id)a4 afterIndex:(unint64_t)a5 delta:(int64_t)a6 toArray:(id)a7;
- (void)_addGuessesForWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 minAutocorrectionLength:(unint64_t)a8 previousLetter:(unsigned __int16)a9 nextLetter:(unsigned __int16)a10 basicOnly:(BOOL)a11 toGuesses:(id)a12;
- (void)_addLanguageModelCompletionsForPrefix:(id)a3 languageModel:(id)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 capitalized:(BOOL)a8 candidates:(id)a9;
- (void)_addSpaceInsertionGuessesForWord:(id)a3 sender:(id)a4 buffer:(char *)a5 length:(unint64_t)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8 isCapitalized:(BOOL)a9 checkUser:(BOOL)a10 oneLetterWords:(const char *)a11 twoLetterWords:(const char *)a12 candidateList:(id)a13;
- (void)_addTwoLetterWordGuessesForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 isCapitalized:(BOOL)a7 isAllCaps:(BOOL)a8 twoLetterWords:(const char *)a9 candidateList:(id)a10;
- (void)_checkEnglishArticlesInSentence:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 mutableCorrections:(id)a6;
- (void)_checkEnglishPhrasesInSentence:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 mutableCorrections:(id)a6;
- (void)_checkSentence:(id)a3 languageObject:(id)a4 mutableCorrections:(id)a5;
- (void)_readLanguageModelParametersFromDefaults;
- (void)_readLanguageModelParametersFromDictionary:(id)a3;
- (void)_releaseLanguageModels;
- (void)addGuessesForKoreanWord:(id)a3 includeAdditionalGuesses:(BOOL)a4 toGuesses:(id)a5;
- (void)addLexiconGuessesForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 minCorrectionLength:(unint64_t)a7 minExtendedCorrectionLength:(unint64_t)a8 isCapitalized:(BOOL)a9 stopAfterFreeInsertions:(BOOL)a10 toGuesses:(id)a11;
- (void)addModifiedPartialPinyinToArray:(id)a3 connection:(_PR_DB_IO *)a4 fromIndex:(unint64_t)a5 prevIndex:(unint64_t)a6 prevPrevIndex:(unint64_t)a7 prePrevPrevIndex:(unint64_t)a8 startingModificationsAt:(unint64_t)a9 inBuffer:(char *)a10 length:(unint64_t)a11 initialSyllableCount:(unint64_t)a12 initialScore:(unint64_t)a13 prevScore:(unint64_t)a14 prevPrevScore:(unint64_t)a15 lastSyllableScore:(unint64_t)a16;
- (void)addModifiedPinyinToArray:(id)a3 connection:(_PR_DB_IO *)a4 fromIndex:(unint64_t)a5 prevIndex:(unint64_t)a6 prevPrevIndex:(unint64_t)a7 startingModificationsAt:(unint64_t)a8 inBuffer:(char *)a9 length:(unint64_t)a10 initialSyllableCount:(unint64_t)a11 initialScore:(unint64_t)a12 prevScore:(unint64_t)a13 prevPrevScore:(unint64_t)a14 lastSyllableScore:(unint64_t)a15 couldBeAbbreviatedPinyin:(BOOL)a16;
- (void)addSpecialModifiedPinyinToArray:(id)a3 inBuffer:(char *)a4 length:(unint64_t)a5 atEnd:(BOOL)a6;
- (void)clearCaches;
- (void)databaseConnectionForLanguageObject:(id)a3;
- (void)enumerateAssetDataItemsForLocale:(id)a3 withBlock:(id)a4;
- (void)enumerateCorrectionEntriesForWord:(id)a3 maxCorrections:(unint64_t)a4 inLexiconForLanguage:(id)a5 withBlock:(id)a6;
- (void)enumerateCorrectionEntriesForWord:(id)a3 maxCorrections:(unint64_t)a4 inLexiconForLanguageObject:(id)a5 withBlock:(id)a6;
- (void)enumerateEntriesForWord:(id)a3 inLexiconForLanguage:(id)a4 withBlock:(id)a5;
- (void)enumerateEntriesForWord:(id)a3 inLexiconForLanguageObject:(id)a4 withBlock:(id)a5;
- (void)enumerateLexiconEntriesForWord:(id)a3 language:(id)a4 usingBlock:(id)a5;
- (void)getParameterValue:(double *)a3 forName:(id)a4 languageObject:(id)a5 tagger:(id)a6 appIdentifier:(id)a7 parameterBundles:(id)a8 defaultValue:(double)a9;
- (void)invalidateTagger:(id)a3;
- (void)loadLexiconsAndLanguageModelsForLanguage:(id)a3;
- (void)loadWordLanguageModelForLanguageObject:(id)a3;
- (void)personalizeEmojiArray:(id)a3;
- (void)releaseDatabaseConnections;
- (void)releaseLanguageModels;
- (void)resetDataBundlesForAllLanguages;
- (void)resetDataBundlesForLanguageObject:(id)a3;
- (void)resetLanguageModels;
- (void)spellServer:(id)a3 checkSentenceCorrectionInString:(id)a4 range:(_NSRange)a5 languageObject:(id)a6 offset:(unint64_t)a7 keyEventArray:(id)a8 selectedRangeValue:(id)a9 autocorrect:(BOOL)a10 checkGrammar:(BOOL)a11 ignoreTermination:(BOOL)a12 mutableResults:(id)a13;
- (void)spellServer:(id)a3 checkSentenceCorrectionInString:(id)a4 rangeInParagraph:(_NSRange)a5 languageObject:(id)a6 locale:(id)a7 tagger:(id)a8 offset:(unint64_t)a9 keyEventArray:(id)a10 selectedRangeValue:(id)a11 autocorrect:(BOOL)a12 checkGrammar:(BOOL)a13 ignoreTermination:(BOOL)a14 mutableResults:(id)a15;
- (void)updateAllLexicons;
- (void)updateLexiconsForLanguage:(id)a3;
- (void)updateLexiconsForLanguageIfNecessary:(id)a3;
- (void)updateLexiconsForLanguageObject:(id)a3;
- (void)updateLexiconsForLanguageObjectIfNecessary:(id)a3;
@end

@implementation AppleSpell

+ (id)availableLanguages
{
  return +[PRLanguage supportedKeyboardLanguages];
}

+ (id)sharedInstance
{
  id result = (id)sharedInstance;
  if (!sharedInstance)
  {
    id result = objc_alloc_init(AppleSpell);
    sharedInstance = (uint64_t)result;
  }
  return result;
}

+ (void)resetSharedInstance
{
  if (sharedInstance)
  {

    sharedInstance = 0;
  }
}

- (AppleSpell)init
{
  v6.receiver = self;
  v6.super_class = (Class)AppleSpell;
  v2 = [(AppleSpell *)&v6 init];
  v2->_languageModelSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ProofReader.languageModelSerialQueue", 0);
  v2->_lexiconSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ProofReader.lexiconSerialQueue", 0);
  v2->_taggerSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ProofReader.taggerSerialQueue", 0);
  v2->_nerTaggerSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ProofReader.nerTaggerSerialQueue", 0);
  v3 = malloc_type_malloc(0x18uLL, 0x1000040FAD7398DuLL);
  v2->_proofReaderConnection = v3;
  v3[1] = 0;
  v3[2] = 0;
  void *v3 = 0;
  if (PRapp((unsigned __int8 *)v2->_proofReaderConnection, 1, 0))
  {
    free(v2->_proofReaderConnection);
    v2->_proofReaderConnection = 0;
  }
  v4 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFB78];
  v2->_databaseConnections = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFB78], 0);
  v2->_databaseConnectionsByPathAndCode = CFDictionaryCreateMutable(0, 0, v4, 0);
  v2->_languageModelDicts = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2->_characterLanguageModelDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2->_transformerLanguageModelDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2->_sentencePieceLanguageModelDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2->_siriLanguageModelDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2->_lexiconDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2->_phraseLexiconDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2->_nerTaggerDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2->_cachedTaggers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v2->_emojiPredictorDict = CFDictionaryCreateMutable(0, 0, v4, MEMORY[0x263EFFF90]);
  v2->_localDictionaryArrays = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2->_userAdaptationDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2->_assetDataBundleSerialQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ProofReader.assetDataBundleSerialQueue", 0);
  v2->_assetDataBundleURLDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  v2->_updatedDataBundleLanguages = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  v2->_guessRequestTimestamps = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v2->_recipientNames = 0;
  v2->_previousSingleCompletion = 0;
  v2->_foundNamesProhibited = 0;
  v2->_hasUpdatedDataBundleLanguages = 0;
  v2->_lastLanguage = 0;
  v2->_lastCandidateLanguage = 0;
  [(AppleSpell *)v2 resetTimer];
  return v2;
}

- (id)dataBundle
{
  return +[PRLanguage dataBundle];
}

- (id)dataBundlesForLanguageObject:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (a3) {
    uint64_t v5 = [a3 identifier];
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3052000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  uint64_t v35 = 0;
  if (v5)
  {
    assetDataBundleSerialQueue = self->_assetDataBundleSerialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__AppleSpell_dataBundlesForLanguageObject___block_invoke;
    block[3] = &unk_2640EF438;
    block[5] = v5;
    block[6] = &v30;
    block[4] = self;
    dispatch_sync(assetDataBundleSerialQueue, block);
  }
  v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObject:", -[AppleSpell dataBundle](self, "dataBundle"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  altBundleURLs = self->_altBundleURLs;
  uint64_t v9 = [(NSMutableArray *)altBundleURLs countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(altBundleURLs);
        }
        uint64_t v12 = [MEMORY[0x263F086E0] bundleWithURL:*(void *)(*((void *)&v25 + 1) + 8 * i)];
        if (v12) {
          [v7 addObject:v12];
        }
      }
      uint64_t v9 = [(NSMutableArray *)altBundleURLs countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v9);
  }
  v13 = (void *)v31[5];
  if (v13)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = [MEMORY[0x263F086E0] bundleWithURL:*(void *)(*((void *)&v21 + 1) + 8 * j)];
          if (v17) {
            [v7 addObject:v17];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v36 count:16];
      }
      while (v14);
    }
  }
  else if (v5)
  {
    global_queue = dispatch_get_global_queue(25, 0);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __43__AppleSpell_dataBundlesForLanguageObject___block_invoke_2;
    v20[3] = &unk_2640EF460;
    v20[4] = self;
    v20[5] = a3;
    v20[6] = v5;
    dispatch_async(global_queue, v20);
  }
  _Block_object_dispose(&v30, 8);
  return v7;
}

id __43__AppleSpell_dataBundlesForLanguageObject___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 400) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v3 = *(void **)(a1[4] + 400);
    uint64_t v4 = [MEMORY[0x263EFF8C0] array];
    uint64_t v5 = a1[5];
    return (id)[v3 setObject:v4 forKey:v5];
  }
  return result;
}

void __43__AppleSpell_dataBundlesForLanguageObject___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x210556730]();
  v3 = (void *)[*(id *)(a1 + 32) assetDataBundleURLsForLanguageObject:*(void *)(a1 + 40)];
  if ([v3 count])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 392);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__AppleSpell_dataBundlesForLanguageObject___block_invoke_3;
    block[3] = &unk_2640EF460;
    block[4] = v4;
    block[5] = v3;
    block[6] = *(void *)(a1 + 48);
    dispatch_sync(v5, block);
  }
}

uint64_t __43__AppleSpell_dataBundlesForLanguageObject___block_invoke_3(void *a1)
{
  [*(id *)(a1[4] + 400) setObject:a1[5] forKey:a1[6]];
  uint64_t result = [*(id *)(a1[4] + 408) addObject:a1[6]];
  *(unsigned char *)(a1[4] + 578) = 1;
  return result;
}

- (void)resetDataBundlesForLanguageObject:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 identifier];
    if (v4)
    {
      assetDataBundleSerialQueue = self->_assetDataBundleSerialQueue;
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __48__AppleSpell_resetDataBundlesForLanguageObject___block_invoke;
      v6[3] = &unk_2640EF488;
      v6[4] = self;
      v6[5] = v4;
      dispatch_sync(assetDataBundleSerialQueue, v6);
    }
  }
}

uint64_t __48__AppleSpell_resetDataBundlesForLanguageObject___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 400) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)resetDataBundlesForAllLanguages
{
  assetDataBundleSerialQueue = self->_assetDataBundleSerialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__AppleSpell_resetDataBundlesForAllLanguages__block_invoke;
  block[3] = &unk_2640EF4B0;
  block[4] = self;
  dispatch_sync(assetDataBundleSerialQueue, block);
}

uint64_t __45__AppleSpell_resetDataBundlesForAllLanguages__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 400) removeAllObjects];
}

- (id)databasePathForLanguageObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(AppleSpell *)self dataBundlesForLanguageObject:0];
  id result = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
      id result = (id)objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", @"Dictionary.dat", 0, 0, objc_msgSend(a3, "localization"));
      if (result) {
        break;
      }
      id result = (id)objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", @"Dictionary.dat", 0, 0, objc_msgSend(a3, "fallbackLocalization"));
      if (result) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        id result = 0;
        if (v6) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (void)databaseConnectionForLanguageObject:(id)a3
{
  if (a3) {
    uint64_t v5 = (void *)[a3 identifier];
  }
  else {
    uint64_t v5 = 0;
  }
  Value = (char *)CFDictionaryGetValue(self->_databaseConnections, v5);
  if (!Value)
  {
    if (!self->_proofReaderConnection) {
      return 0;
    }
    id v7 = [(AppleSpell *)self databasePathForLanguageObject:a3];
    if (!v7) {
      return 0;
    }
    uint64_t v8 = v7;
    Value = (char *)malloc_type_malloc(0x68uLL, 0x10300404E556F13uLL);
    *(_OWORD *)Value = 0u;
    *((_OWORD *)Value + 1) = 0u;
    *((_OWORD *)Value + 2) = 0u;
    *((_OWORD *)Value + 3) = 0u;
    *((_OWORD *)Value + 4) = 0u;
    *((_OWORD *)Value + 5) = 0u;
    *((void *)Value + 12) = 0;
    char *Value = *(unsigned char *)self->_proofReaderConnection;
    uint64_t v9 = 16;
    Value[24] = 16;
    *(_DWORD *)(Value + 26) = 8388736;
    *((_WORD *)Value + 17) = 0x8000;
    Value[7] = 2;
    *((_WORD *)Value + 4) = 80;
    if (([v5 isEqualToString:@"English"] & 1) != 0
      || ([v5 isEqualToString:@"en"] & 1) != 0
      || ([v5 isEqualToString:@"American English"] & 1) != 0
      || ([v5 isEqualToString:@"AmericanEnglish"] & 1) != 0
      || ([v5 hasPrefix:@"en_US"] & 1) != 0
      || [v5 hasPrefix:@"en-US"])
    {
      goto LABEL_13;
    }
    if (([v5 isEqualToString:@"Indian English"] & 1) != 0
      || ([v5 isEqualToString:@"IndianEnglish"] & 1) != 0
      || [v5 hasPrefix:@"en_IN"]
      || ([v5 isEqualToString:@"Singapore English"] & 1) != 0
      || ([v5 isEqualToString:@"SingaporeEnglish"] & 1) != 0
      || [v5 hasPrefix:@"en_SG"])
    {
LABEL_35:
      uint64_t v9 = 16;
LABEL_36:
      Value[24] = v9;
      __int16 v24 = 64;
LABEL_37:
      *((_WORD *)Value + 13) = v24;
      goto LABEL_14;
    }
    if (([v5 isEqualToString:@"Japanese English"] & 1) != 0
      || ([v5 isEqualToString:@"JapaneseEnglish"] & 1) != 0
      || [v5 hasPrefix:@"en_JP"]
      || ([v5 isEqualToString:@"Chinese English"] & 1) != 0
      || ([v5 isEqualToString:@"ChineseEnglish"] & 1) != 0
      || [v5 hasPrefix:@"en_CN"])
    {
      goto LABEL_44;
    }
    if (([v5 isEqualToString:@"Australian English"] & 1) != 0
      || ([v5 isEqualToString:@"AustralianEnglish"] & 1) != 0
      || ([v5 hasPrefix:@"en_AU"] & 1) != 0
      || [v5 hasPrefix:@"en-AU"])
    {
      goto LABEL_35;
    }
    if (([v5 isEqualToString:@"Canadian English"] & 1) != 0
      || ([v5 isEqualToString:@"CanadianEnglish"] & 1) != 0
      || ([v5 hasPrefix:@"en_CA"] & 1) != 0
      || [v5 hasPrefix:@"en-CA"])
    {
      uint64_t v9 = 16;
      Value[24] = 16;
      __int16 v24 = 32;
      goto LABEL_37;
    }
    if (([v5 isEqualToString:@"New Zealand English"] & 1) != 0
      || ([v5 isEqualToString:@"NewZealandEnglish"] & 1) != 0
      || [v5 hasPrefix:@"en_NZ"]
      || ([v5 isEqualToString:@"South African English"] & 1) != 0
      || ([v5 isEqualToString:@"SouthAfricanEnglish"] & 1) != 0
      || [v5 hasPrefix:@"en_ZA"]
      || ([v5 isEqualToString:@"British English"] & 1) != 0
      || ([v5 isEqualToString:@"BritishEnglish"] & 1) != 0
      || [v5 hasPrefix:@"en"])
    {
      goto LABEL_35;
    }
    if ([v5 hasPrefix:@"en"])
    {
LABEL_44:
      uint64_t v9 = 16;
LABEL_13:
      Value[24] = v9;
      goto LABEL_14;
    }
    if (([v5 isEqualToString:@"Swiss German"] & 1) != 0
      || ([v5 isEqualToString:@"SwissGerman"] & 1) != 0
      || [v5 hasPrefix:@"de_CH"])
    {
      uint64_t v9 = 6;
      goto LABEL_36;
    }
    if (([v5 isEqualToString:@"German"] & 1) != 0
      || [v5 hasPrefix:@"de"])
    {
      uint64_t v9 = 6;
LABEL_71:
      Value[24] = v9;
      __int16 v24 = 128;
      goto LABEL_37;
    }
    if (([v5 isEqualToString:@"Brazilian Portuguese"] & 1) != 0
      || ([v5 isEqualToString:@"BrazilianPortuguese"] & 1) != 0
      || ([v5 hasPrefix:@"pt_BR"] & 1) != 0
      || [v5 hasPrefix:@"pt-BR"])
    {
      uint64_t v9 = 12;
      goto LABEL_36;
    }
    if (([v5 isEqualToString:@"European Portuguese"] & 1) != 0
      || ([v5 isEqualToString:@"EuropeanPortuguese"] & 1) != 0
      || ([v5 hasPrefix:@"pt_PT"] & 1) != 0
      || [v5 hasPrefix:@"pt-PT"]
      || ([v5 isEqualToString:@"Portuguese"] & 1) != 0
      || [v5 hasPrefix:@"pt"])
    {
      uint64_t v9 = 12;
      goto LABEL_71;
    }
    if (([v5 isEqualToString:@"Arabic"] & 1) != 0
      || [v5 hasPrefix:@"ar"])
    {
      uint64_t v9 = 20;
      goto LABEL_13;
    }
    if (([v5 isEqualToString:@"Bulgarian"] & 1) != 0
      || [v5 hasPrefix:@"bg"])
    {
      uint64_t v9 = 25;
      goto LABEL_13;
    }
    if (([v5 isEqualToString:@"Catalan"] & 1) != 0
      || [v5 hasPrefix:@"ca"])
    {
      uint64_t v9 = 3;
    }
    else
    {
      if (([v5 isEqualToString:@"Czech"] & 1) != 0
        || [v5 hasPrefix:@"cs"])
      {
        uint64_t v9 = 1;
        goto LABEL_13;
      }
      if (([v5 isEqualToString:@"Danish"] & 1) != 0
        || [v5 hasPrefix:@"da"])
      {
        uint64_t v9 = 10;
        goto LABEL_13;
      }
      if (([v5 isEqualToString:@"Dutch"] & 1) != 0
        || [v5 hasPrefix:@"nl"])
      {
        uint64_t v9 = 11;
        goto LABEL_13;
      }
      if (([v5 isEqualToString:@"Finnish"] & 1) != 0
        || [v5 hasPrefix:@"fi"])
      {
        uint64_t v9 = 14;
        goto LABEL_13;
      }
      if (([v5 isEqualToString:@"French"] & 1) != 0
        || [v5 hasPrefix:@"fr"])
      {
        uint64_t v9 = 5;
        Value[24] = 5;
        __int16 v25 = 96;
        goto LABEL_94;
      }
      if (([v5 isEqualToString:@"Greek"] & 1) != 0
        || [v5 hasPrefix:@"el"])
      {
        uint64_t v9 = 15;
        goto LABEL_13;
      }
      if (([v5 isEqualToString:@"Hebrew"] & 1) != 0
        || [v5 hasPrefix:@"he"])
      {
        uint64_t v9 = 22;
        goto LABEL_13;
      }
      if (([v5 isEqualToString:@"Hungarian"] & 1) != 0
        || [v5 hasPrefix:@"hu"])
      {
        uint64_t v9 = 4;
        goto LABEL_13;
      }
      if (([v5 isEqualToString:@"Italian"] & 1) != 0
        || [v5 hasPrefix:@"it"])
      {
        uint64_t v9 = 9;
        goto LABEL_13;
      }
      if (([v5 isEqualToString:@"Korean"] & 1) != 0
        || [v5 hasPrefix:@"ko"])
      {
        uint64_t v9 = 29;
        goto LABEL_13;
      }
      if (([v5 isEqualToString:@"Norwegian"] & 1) != 0
        || [v5 hasPrefix:@"nb"])
      {
        uint64_t v9 = 13;
        goto LABEL_13;
      }
      if (([v5 isEqualToString:@"Polish"] & 1) != 0
        || [v5 hasPrefix:@"pl"])
      {
        uint64_t v9 = 18;
        goto LABEL_13;
      }
      if (([v5 isEqualToString:@"Russian"] & 1) == 0
        && ![v5 hasPrefix:@"ru"])
      {
        if (([v5 isEqualToString:@"Spanish"] & 1) == 0
          && ![v5 hasPrefix:@"es"])
        {
          if (([v5 isEqualToString:@"Swedish"] & 1) != 0
            || [v5 hasPrefix:@"sv"])
          {
            uint64_t v9 = 7;
            goto LABEL_13;
          }
          if (([v5 isEqualToString:@"Thai"] & 1) != 0
            || [v5 hasPrefix:@"th"])
          {
            uint64_t v9 = 35;
            goto LABEL_13;
          }
          if (([v5 isEqualToString:@"Turkish"] & 1) != 0
            || [v5 hasPrefix:@"tr"])
          {
            uint64_t v9 = 28;
            goto LABEL_13;
          }
          if (([v5 isEqualToString:@"Vietnamese"] & 1) != 0
            || ([v5 hasPrefix:@"vi"] & 1) != 0)
          {
            uint64_t v9 = 36;
            goto LABEL_13;
          }
          uint64_t v9 = Value[24];
LABEL_14:
          long long v10 = (const void *)[NSString stringWithFormat:@"%u:%u:%u:%@", v9, *((__int16 *)Value + 13), *((__int16 *)Value + 14), v8];
          long long v11 = CFDictionaryGetValue(self->_databaseConnectionsByPathAndCode, v10);
          if (v11)
          {
            long long v12 = v11;
            free(Value);
            CFDictionaryAddValue(self->_databaseConnections, v5, v12);
            return (void *)v12;
          }
          long long v13 = (const char *)objc_msgSend((id)objc_msgSend(v8, "lastPathComponent"), "fileSystemRepresentation");
          uint64_t v14 = (const char *)objc_msgSend((id)objc_msgSend(v8, "stringByDeletingLastPathComponent"), "fileSystemRepresentation");
          size_t v15 = strlen(v13);
          size_t v16 = strlen(v14);
          uint64_t v17 = (char *)malloc_type_malloc(v15 + 1, 0xCC94F0B4uLL);
          strncpy(v17, v13, v15 + 1);
          if (Value[24] != 16) {
            Value[7] = 1;
          }
          v18 = malloc_type_malloc(0x208uLL, 0x1010040F1668D93uLL);
          *((void *)Value + 5) = v18;
          void *v18 = v17;
          strncpy((char *)(*((void *)Value + 5) + 8), v14, v16 + 1);
          *(_WORD *)(*((void *)Value + 5) + 8 + strlen((const char *)(*((void *)Value + 5) + 8))) = 47;
          int v19 = Value[24];
          if (v19 == 18)
          {
            if (v15 < 5) {
              goto LABEL_24;
            }
          }
          else if (v15 < 5 || v19 != 4)
          {
            goto LABEL_24;
          }
          v20 = (char *)malloc_type_malloc(v15 + 1, 0xD8971693uLL);
          long long v21 = &strncpy(v20, v13, v15 + 1)[v15];
          *(_WORD *)(v21 - 3) = 25964;
          *(v21 - 1) = 120;
          long long v22 = malloc_type_malloc(0x208uLL, 0x1010040F1668D93uLL);
          *((void *)Value + 9) = v22;
          *long long v22 = v20;
          __strncpy_chk();
          *(_WORD *)(*((void *)Value + 9) + 8 + strlen((const char *)(*((void *)Value + 9) + 8))) = 47;
LABEL_24:
          if (!PRdb((unsigned __int8 *)Value, 1, 0))
          {
            CFDictionaryAddValue(self->_databaseConnections, v5, Value);
            CFDictionaryAddValue(self->_databaseConnectionsByPathAndCode, v10, Value);
            return Value;
          }
          _freeDatabaseConnection(Value);
          return 0;
        }
        uint64_t v9 = 8;
        Value[24] = 8;
        __int16 v25 = 64;
LABEL_94:
        *((_WORD *)Value + 14) = v25;
        goto LABEL_14;
      }
      uint64_t v9 = 2;
    }
    Value[24] = v9;
    __int16 v25 = 128;
    goto LABEL_94;
  }
  return Value;
}

- (void)releaseDatabaseConnections
{
  CFDictionaryApplyFunction(self->_databaseConnectionsByPathAndCode, (CFDictionaryApplierFunction)_releaseDatabaseConnection, 0);
  CFDictionaryRemoveAllValues(self->_databaseConnections);
  databaseConnectionsByPathAndCode = self->_databaseConnectionsByPathAndCode;
  CFDictionaryRemoveAllValues(databaseConnectionsByPathAndCode);
}

- (void)loadLexiconsAndLanguageModelsForLanguage:(id)a3
{
  id v4 = +[PRLanguage languageObjectWithIdentifier:a3];
  [(AppleSpell *)self lexiconForLanguageObject:v4];
  [(AppleSpell *)self loadWordLanguageModelForLanguageObject:v4];
}

- (BOOL)spellServer:(id)a3 shouldBlockWord:(id)a4 language:(id)a5 offensiveOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = +[PRLanguage languageObjectWithIdentifier:a5];
  BOOL v10 = [(AppleSpell *)self shouldBlockWord:a4 languageObject:v9];
  if (v10 && v6)
  {
    int v13 = 0;
    LOBYTE(v10) = [(AppleSpell *)self getMetaFlagsForWord:a4 inLexiconForLanguageObject:v9 metaFlags:&v13 otherMetaFlags:0]&& (v13 & 0x1000000) != 0;
  }
  return v10;
}

- (id)spellServer:(id)a3 regionalCorrectionForWord:(id)a4 language:(id)a5
{
  id v7 = +[PRLanguage languageObjectWithIdentifier:a5];
  id result = [(AppleSpell *)self regionalCorrectionsDictionaryForLanguageObject:v7];
  if (result)
  {
    id v9 = result;
    id result = (id)[result objectForKey:a4];
    if (!result)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x263EFF960], "localeWithLocaleIdentifier:", objc_msgSend(v7, "localization"));
      long long v11 = (void *)[a4 lowercaseString];
      if (objc_msgSend(a4, "isEqualToString:", initialCapitalizedString(v11, v10)))
      {
        id result = (id)[v9 objectForKey:v11];
        if (result)
        {
          return (id)initialCapitalizedString(result, v10);
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (void)enumerateLexiconEntriesForWord:(id)a3 language:(id)a4 usingBlock:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = [(AppleSpell *)self lexiconsForLanguageObject:+[PRLanguage languageObjectWithIdentifier:a4]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __65__AppleSpell_enumerateLexiconEntriesForWord_language_usingBlock___block_invoke;
        v13[3] = &unk_2640EF4D8;
        v13[4] = a5;
        [v12 enumerateEntriesForString:a3 usingBlock:v13];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

uint64_t __65__AppleSpell_enumerateLexiconEntriesForWord_language_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_checkGrammarInString:(id)a3 range:(_NSRange)a4 language:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 bufIO:(_PR_BUF_IO *)a8 errorRange:(_NSRange *)a9 details:(id *)a10
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  int v45 = 200;
  id v16 = +[PRLanguage languageObjectWithIdentifier:a5];
  CFStringEncoding v17 = [v16 encoding];
  if (a6->var6 == 16 && length >= 5)
  {
    CFStringEncoding v19 = v17;
    var0 = a8->var0;
    objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", objc_msgSend(MEMORY[0x263F08708], "alphanumericCharacterSet"), 0, location, length);
    if (v21)
    {
      CFStringEncoding encoding = v19;
      id v41 = v16;
      v42 = self;
      CFIndex Bytes = 0;
      unint64_t v23 = 0;
      unint64_t v24 = 0;
      NSUInteger v43 = location + length;
      a8->unint64_t var5 = 0;
      while (1)
      {
        unint64_t var5 = a8->var5;
        if (v45 == 200 || v24 <= var5)
        {
          CFIndex usedBufLen = 0;
          if (var5) {
            BOOL v27 = v24 > var5;
          }
          else {
            BOOL v27 = 0;
          }
          if (v27)
          {
            unint64_t v23 = v24 - var5;
            memmove(var0, &var0[var5], v24 - var5);
            unint64_t v28 = 1024 - v23;
          }
          else
          {
            unint64_t v23 = 0;
            unint64_t v28 = 1024;
          }
          location += Bytes;
          if (v43 <= location) {
            return 0;
          }
          if (v43 - location >= v28) {
            v29.NSUInteger length = v28;
          }
          else {
            v29.NSUInteger length = v43 - location;
          }
          v29.NSUInteger location = location;
          CFIndex Bytes = CFStringGetBytes((CFStringRef)a3, v29, encoding, 0x5Fu, 0, (UInt8 *)&var0[v23], v28, &usedBufLen);
          CFIndex v30 = usedBufLen;
          if (Bytes + location >= v43 || usedBufLen < v28) {
            a8->var3 = 32;
          }
          unint64_t v24 = v30 + v23;
          if (!(v30 + v23)) {
            return 0;
          }
          if (v23 < v24)
          {
            unint64_t v32 = v23;
            while (1)
            {
              unsigned int v33 = var0[v32];
              if (v33 < 9 || v33 - 14 < 0x12) {
                break;
              }
              int v35 = 32;
              if (var0[v32] > 0x9Fu)
              {
                if (var0[v32] > 0xB3u)
                {
                  if (v33 == 187) {
                    goto LABEL_51;
                  }
                  if (v33 == 180)
                  {
LABEL_39:
                    int v35 = 39;
                    goto LABEL_52;
                  }
                }
                else
                {
                  if (v33 == 160) {
                    goto LABEL_52;
                  }
                  if (v33 == 171)
                  {
LABEL_51:
                    int v35 = 34;
                    goto LABEL_52;
                  }
                }
              }
              else
              {
                if (var0[v32] > 0x81u)
                {
                  switch(var0[v32])
                  {
                    case -126:
                    case -124:
                    case -117:
                    case -111:
                    case -110:
                    case -101:
                      goto LABEL_39;
                    case -123:
                    case -105:
                      goto LABEL_52;
                    case -109:
                    case -108:
                      goto LABEL_51;
                    case -106:
                      int v35 = 45;
                      goto LABEL_52;
                    default:
                      goto LABEL_53;
                  }
                  goto LABEL_53;
                }
                if (v33 == 92 || v33 == 95) {
                  goto LABEL_52;
                }
                if (v33 == 96) {
                  goto LABEL_39;
                }
              }
LABEL_53:
              if (v32 + 2 < v24 && v33 == 46)
              {
                v36 = &var0[v32];
                if (var0[v32 + 1] == 46 && v36[2] == 46)
                {
                  v36[2] = 32;
                  v36[1] = 32;
                  var0[v32] = 32;
                }
              }
              ++v32;
              if (!--v30) {
                goto LABEL_61;
              }
            }
            int v35 = 32;
LABEL_52:
            var0[v32] = v35;
            unsigned int v33 = v35;
            goto LABEL_53;
          }
LABEL_61:
          LODWORD(var5) = 0;
          var0[v24] = 0;
          a8->unint64_t var5 = 0;
          a8->var4 = v24;
        }
        if (var0[var5] <= 0x20u)
        {
          do
          {
            LODWORD(var5) = var5 + 1;
            a8->unint64_t var5 = var5;
          }
          while (var0[(unsigned __int16)var5] < 0x21u);
        }
        int var6 = a6->var6;
        BOOL v38 = var6 == 16;
        if (var6 != 16
          || -[AppleSpell _checkEnglishGrammarInString:range:indexIntoBuffer:bufferLength:languageObject:connection:sender:bufIO:retval:errorRange:details:](v42, "_checkEnglishGrammarInString:range:indexIntoBuffer:bufferLength:languageObject:connection:sender:bufIO:retval:errorRange:details:", a3, location, Bytes, v23, v24, v41, a6, a7, a8, &v45, a9, a10))
        {
          return v38;
        }
      }
    }
  }
  return 0;
}

- (_NSRange)spellServer:(id)a3 checkGrammarInString:(id)a4 range:(_NSRange)a5 language:(id)a6 orthography:(id)a7 mutableResults:(id)a8 offset:(unint64_t)a9 details:(id *)a10
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  memset(v45, 0, sizeof(v45));
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  int v44 = 0;
  __int16 v41 = 0;
  int v40 = 0;
  NSUInteger location = a5.location;
  NSUInteger v39 = 0;
  unint64_t v37 = 0;
  long long v46 = xmmword_20CC61990;
  if (!a6
    || (length = a5.length, v13 = a5.location, id v15 = a3, ([a6 isEqualToString:@"und"] & 1) != 0)
    || ([a6 isEqualToString:@"Multilingual"] & 1) != 0)
  {
    BOOL v16 = 1;
    if (!a10) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  CFStringEncoding v19 = [(AppleSpell *)self databaseConnectionForLanguageObject:+[PRLanguage languageObjectWithIdentifier:a6]];
  if (v19 && v19[24] == 16)
  {
    uint64_t v20 = 0;
    v34 = v19;
    memset((char *)&v45[1] + 8, 0, 56);
    *(_OWORD *)((char *)v45 + 8) = 0u;
    int v44 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    int v40 = 0;
    __int16 v41 = 0;
    *(void *)&v45[0] = &v47;
    WORD4(v45[0]) = *(_WORD *)v19;
    HIWORD(v42) = 256;
    NSUInteger v21 = v13 + length;
    *((void *)&v45[1] + 1) = &v42;
    *(void *)&v45[2] = &v40;
    BYTE13(v45[3]) = 0;
    while (location < v21)
    {
      objc_msgSend(a4, "getParagraphStart:end:contentsEnd:forRange:", &v39, &location, &v37);
      if (v39 < v21 && v37 > v39 && v37 > v13)
      {
        int v35 = self;
        uint64_t v24 = v20;
        v36 = 0;
        NSUInteger v25 = v37 - v39;
        if (v39 >= v13)
        {
          NSUInteger v26 = v39;
        }
        else
        {
          NSUInteger v25 = v37 - v13;
          NSUInteger v26 = v13;
        }
        if (v37 <= v21) {
          NSUInteger v27 = v25;
        }
        else {
          NSUInteger v27 = v21 - v26;
        }
        if (v27)
        {
          do
          {
            long long v46 = xmmword_20CC61990;
            uint64_t v28 = -[AppleSpell _checkGrammarInString:range:language:connection:sender:bufIO:errorRange:details:](v35, "_checkGrammarInString:range:language:connection:sender:bufIO:errorRange:details:", a4, v26, v27, a6, v34, v15, v45, &v46, &v36);
            uint64_t v24 = v28;
            if (!v28) {
              break;
            }
            if ((void)v46 == 0x7FFFFFFFFFFFFFFFLL || *((void *)&v46 + 1) == 0) {
              break;
            }
            if (!a8)
            {
              if (a10) {
                *a10 = v36;
              }
              LOBYTE(v20) = v28;
              self = v35;
              goto LABEL_39;
            }
            id v30 = objc_alloc(MEMORY[0x263F08880]);
            id v31 = v15;
            unint64_t v32 = objc_msgSend(v30, "initWithRange:details:", (void)v46 + a9, *((void *)&v46 + 1), v36);
            [a8 addObject:v32];

            id v15 = v31;
            NSUInteger v33 = v26 + v27;
            NSUInteger v26 = *((void *)&v46 + 1) + v46;
            NSUInteger v27 = v33 - (*((void *)&v46 + 1) + v46);
          }
          while (v33 > *((void *)&v46 + 1) + (void)v46);
        }
        uint64_t v20 = v24;
        self = v35;
      }
    }
LABEL_39:
    PRbuf((uint64_t)v45, 0x11u, 0);
  }
  else
  {
    LOBYTE(v20) = 0;
  }
  BOOL v16 = (v20 & 1) == 0;
  if (a10)
  {
LABEL_5:
    if (v16) {
      *a10 = 0;
    }
  }
LABEL_7:
  [(AppleSpell *)self resetTimer];
  NSUInteger v18 = *((void *)&v46 + 1);
  NSUInteger v17 = v46;
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

- (_NSRange)spellServer:(id)a3 checkGrammarInString:(id)a4 language:(id)a5 details:(id *)a6
{
  NSUInteger v6 = -[AppleSpell spellServer:checkGrammarInString:range:language:orthography:mutableResults:offset:details:](self, "spellServer:checkGrammarInString:range:language:orthography:mutableResults:offset:details:", a3, a4, 0, [a4 length], a5, 0, 0, 0, a6);
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (id)spellServer:(id)a3 checkGrammarInString:(id)a4 range:(_NSRange)a5 language:(id)a6 offset:(unint64_t)a7 options:(id)a8
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v15 = +[PRLanguage languageObjectWithIdentifier:a6];
  BOOL v16 = (void *)[MEMORY[0x263EFF980] array];
  NSUInteger v17 = (void *)[a8 objectForKey:@"IgnoreTermination"];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      LOBYTE(v17) = [v17 BOOLValue];
    }
    else {
      LOBYTE(v17) = 0;
    }
  }
  -[AppleSpell spellServer:checkGrammarInString:range:language:orthography:mutableResults:offset:details:](self, "spellServer:checkGrammarInString:range:language:orthography:mutableResults:offset:details:", a3, a4, location, length, a6, 0, v16, a7, 0);
  if ([(AppleSpell *)self supportSentenceCorrectionForLanguageObject:v15 appIdentifier:0])
  {
    BYTE2(v19) = (_BYTE)v17;
    LOWORD(v19) = 257;
    -[AppleSpell spellServer:checkSentenceCorrectionInString:range:languageObject:offset:keyEventArray:selectedRangeValue:autocorrect:checkGrammar:ignoreTermination:mutableResults:](self, "spellServer:checkSentenceCorrectionInString:range:languageObject:offset:keyEventArray:selectedRangeValue:autocorrect:checkGrammar:ignoreTermination:mutableResults:", a3, a4, location, length, v15, a7, 0, 0, v19, v16);
  }
  return v16;
}

- (_NSRange)spellServer:(id)a3 findMisspelledWordInString:(id)a4 language:(id)a5 wordCount:(int64_t *)a6 countOnly:(BOOL)a7
{
  if (a5
    && ([a5 isEqualToString:@"und"] & 1) == 0
    && ![a5 isEqualToString:@"Multilingual"])
  {
    long long v14 = (void *)MEMORY[0x263EFF8C0];
    BOOL v16 = (__CFString *)a5;
    goto LABEL_8;
  }
  NSUInteger v13 = [(NSArray *)self->_userPreferredLatinLanguages count];
  long long v14 = (void *)MEMORY[0x263EFF8C0];
  if (!v13)
  {
    BOOL v16 = @"en";
LABEL_8:
    uint64_t v15 = [v14 arrayWithObject:v16];
    goto LABEL_9;
  }
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithArray:self->_userPreferredLatinLanguages];
LABEL_9:
  LOWORD(v21) = a7;
  LODWORD(v20) = 0;
  LOBYTE(v19) = 0;
  NSUInteger v17 = -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](self, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, [a4 length], v15, 0, 0, v19, 0, 0, v20, 0, 0, 0, 0,
          a6,
          v21,
          0);
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

- (_NSRange)spellServer:(id)a3 findMisspelledWordInString:(id)a4 language:(id)a5 wordCount:(int64_t *)a6 countOnly:(BOOL)a7 correction:(id *)a8
{
  if (a5
    && ([a5 isEqualToString:@"und"] & 1) == 0
    && ![a5 isEqualToString:@"Multilingual"])
  {
    BOOL v16 = (void *)MEMORY[0x263EFF8C0];
    NSUInteger v18 = (__CFString *)a5;
    goto LABEL_8;
  }
  NSUInteger v15 = [(NSArray *)self->_userPreferredLatinLanguages count];
  BOOL v16 = (void *)MEMORY[0x263EFF8C0];
  if (!v15)
  {
    NSUInteger v18 = @"en";
LABEL_8:
    uint64_t v17 = [v16 arrayWithObject:v18];
    goto LABEL_9;
  }
  uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithArray:self->_userPreferredLatinLanguages];
LABEL_9:
  LOWORD(v23) = a7;
  BYTE3(v22) = 0;
  BYTE2(v22) = 0;
  LOWORD(v22) = a8 != 0;
  LOBYTE(v21) = 0;
  NSUInteger v19 = -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](self, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, [a4 length], v17, 0, 0, v21, 0, 0, v22, 0, 0, 0, 0,
          a6,
          v23,
          a8);
  result.NSUInteger length = v20;
  result.NSUInteger location = v19;
  return result;
}

- (_NSRange)spellServer:(id)a3 findMisspelledWordInString:(id)a4 languages:(id)a5 wordCount:(int64_t *)a6 countOnly:(BOOL)a7 correction:(id *)a8
{
  id v11 = a5;
  NSUInteger v15 = (void *)[a5 firstObject];
  if (!v15
    || (BOOL v16 = v15, ([v15 isEqualToString:@"und"] & 1) != 0)
    || [v16 isEqualToString:@"Multilingual"])
  {
    if ([(NSArray *)self->_userPreferredLatinLanguages count]) {
      uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithArray:self->_userPreferredLatinLanguages];
    }
    else {
      uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObject:@"en"];
    }
    id v11 = (id)v17;
  }
  LOWORD(v22) = a7;
  BYTE3(v21) = 0;
  BYTE2(v21) = 0;
  LOWORD(v21) = a8 != 0;
  LOBYTE(v20) = 0;
  NSUInteger v18 = -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](self, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, [a4 length], v11, 0, 0, v20, 0, 0, v21, 0, 0, 0, 0,
          a6,
          v22,
          a8);
  result.NSUInteger length = v19;
  result.NSUInteger location = v18;
  return result;
}

- (id)spellServer:(id)a3 checkString:(id)a4 offset:(unint64_t)a5 types:(unint64_t)a6 options:(id)a7 orthography:(id)a8 wordCount:(int64_t *)a9
{
  obuint64_t j = a6;
  uint64_t v196 = *MEMORY[0x263EF8340];
  v134 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v138 = [a4 length];
  uint64_t v185 = -1;
  long long v12 = (void *)[a7 objectForKey:@"KeyEventArray"];
  uint64_t v130 = _appIdentifierFromOptions(a7);
  v135 = (void *)[a7 objectForKey:@"RecheckOrthography"];
  NSUInteger v13 = (void *)[a7 objectForKey:@"InsertionPoint"];
  long long v14 = (void *)[a7 objectForKey:@"SelectedRangeLocation"];
  NSUInteger v15 = (void *)[a7 objectForKey:@"SelectedRangeLength"];
  BOOL v16 = (void *)[a7 objectForKey:@"OnlyAtInsertionPoint"];
  uint64_t v17 = (void *)[a7 objectForKey:@"AppendCorrectionLanguage"];
  uint64_t v18 = [a7 objectForKey:@"SelectedRange"];
  id v141 = a8;
  uint64_t v19 = [a8 dominantScript];
  v137 = v12;
  v125 = (void *)[v12 lastObject];
  uint64_t v129 = [a7 objectForKey:@"ParameterBundles"];
  uint64_t v131 = v18;
  if (!v18)
  {
    if (v14 && v15)
    {
      uint64_t v20 = (void *)MEMORY[0x263F08D40];
      uint64_t v21 = [v14 unsignedIntegerValue];
      uint64_t v22 = [v15 unsignedIntegerValue];
    }
    else
    {
      if (!v13)
      {
        uint64_t v131 = 0;
        if (v16) {
          goto LABEL_9;
        }
        goto LABEL_11;
      }
      uint64_t v20 = (void *)MEMORY[0x263F08D40];
      uint64_t v21 = [v13 unsignedIntegerValue];
      uint64_t v22 = 0;
    }
    uint64_t v131 = objc_msgSend(v20, "valueWithRange:", v21, v22);
  }
  if (v16)
  {
LABEL_9:
    char v128 = [v16 BOOLValue];
    goto LABEL_12;
  }
LABEL_11:
  char v128 = 0;
LABEL_12:
  uint64_t v23 = (uint64_t)v141;
  uint64_t v24 = v12;
  if (v17) {
    char v127 = [v17 BOOLValue];
  }
  else {
    char v127 = 0;
  }
  v140 = self;
  if ([@"Cyrl" isEqualToString:v19])
  {
    NSUInteger v25 = (__CFString *)[v141 dominantLanguage];
    BOOL v26 = !self->_userPrefersUncheckedCyrillicLanguage;
    int v27 = *(_DWORD *)&v26 & (obj >> 2);
    int v28 = *(_DWORD *)&v26 & (obj >> 1);
    if (!v25) {
      goto LABEL_24;
    }
  }
  else
  {
    int v27 = (obj >> 2) & 1;
    int v28 = (obj >> 1) & 1;
    if ([@"Kore" isEqualToString:v19]
      || (uint64_t v29 = [v141 dominantLanguageForScript:@"Latn"]) == 0)
    {
      NSUInteger v25 = (__CFString *)[v141 dominantLanguage];
      if (!v25) {
        goto LABEL_24;
      }
    }
    else
    {
      NSUInteger v25 = (__CFString *)v29;
    }
  }
  if (([(__CFString *)v25 isEqualToString:@"und"] & 1) != 0
    || [(__CFString *)v25 isEqualToString:@"Multilingual"])
  {
LABEL_24:
    if ([@"Cyrl" isEqualToString:v19])
    {
      id v30 = (void *)[MEMORY[0x263EFF9B0] orderedSetWithObject:@"ru"];
      [v30 addObjectsFromArray:self->_userPreferredLanguages];
      id v31 = (void *)[v30 array];
      int v126 = 0;
      userTopLanguages = 0;
      BOOL userPrefersUncheckedCyrillicLanguage = self->_userPrefersUncheckedCyrillicLanguage;
LABEL_26:
      if (userPrefersUncheckedCyrillicLanguage)
      {
        int v27 = 0;
        int v28 = 0;
      }
      goto LABEL_65;
    }
    if ([@"Kore" isEqualToString:v19])
    {
      v34 = (void *)MEMORY[0x263EFF9B0];
      int v35 = @"ko";
    }
    else if ([@"Arab" isEqualToString:v19])
    {
      v34 = (void *)MEMORY[0x263EFF9B0];
      int v35 = @"ar";
    }
    else if ([@"Grek" isEqualToString:v19])
    {
      v34 = (void *)MEMORY[0x263EFF9B0];
      int v35 = @"el";
    }
    else if ([@"Deva" isEqualToString:v19])
    {
      v34 = (void *)MEMORY[0x263EFF9B0];
      int v35 = @"hi";
    }
    else if ([@"Telu" isEqualToString:v19])
    {
      v34 = (void *)MEMORY[0x263EFF9B0];
      int v35 = @"te";
    }
    else
    {
      if (![@"Guru" isEqualToString:v19])
      {
        if ([(NSArray *)self->_userPreferredLatinLanguages count]) {
          v107 = (void *)[MEMORY[0x263EFF8C0] arrayWithArray:self->_userPreferredLatinLanguages];
        }
        else {
          v107 = (void *)[MEMORY[0x263EFF8C0] arrayWithObject:@"en"];
        }
        id v31 = v107;
        if (v125)
        {
          if ([v107 containsObject:@"tr"])
          {
            objc_msgSend((id)objc_msgSend(v125, "keyboardLayoutIdentifier"), "rangeOfString:", @"Turkish");
            if (v109)
            {
              id v31 = (void *)[MEMORY[0x263EFF980] arrayWithArray:v31];
              [v31 removeObject:@"tr"];
              [v31 insertObject:@"tr" atIndex:0];
            }
          }
          if ([v31 containsObject:@"vi"]
            && (objc_msgSend((id)objc_msgSend(v125, "primaryLanguage"), "isEqualToString:", @"vi") & 1) == 0)
          {
            id v31 = (void *)[MEMORY[0x263EFF980] arrayWithArray:v31];
            [v31 removeObject:@"vi"];
            [v31 addObject:@"vi"];
          }
        }
        int v126 = 0;
        userTopLanguages = 0;
        BOOL userPrefersUncheckedCyrillicLanguage = self->_userPrefersUncheckedLatinLanguage;
        goto LABEL_26;
      }
      v34 = (void *)MEMORY[0x263EFF9B0];
      int v35 = @"pa";
    }
    int v45 = (void *)[v34 orderedSetWithObject:v35];
    [v45 addObjectsFromArray:self->_userPreferredLanguages];
    id v31 = (void *)[v45 array];
    int v126 = 0;
    userTopLanguages = 0;
LABEL_65:
    char v44 = 1;
    NSUInteger v25 = @"Multilingual";
    goto LABEL_66;
  }
  if (([(__CFString *)v25 isEqualToString:@"en"] & 1) != 0
    || [(__CFString *)v25 isEqualToString:@"pt"])
  {
    int v36 = v28;
    int v37 = v27;
    id v31 = (void *)[MEMORY[0x263EFF980] array];
    long long v181 = 0u;
    long long v182 = 0u;
    long long v183 = 0u;
    long long v184 = 0u;
    userPreferredLanguages = self->_userPreferredLanguages;
    uint64_t v39 = [(NSArray *)userPreferredLanguages countByEnumeratingWithState:&v181 objects:v195 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v182;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v182 != v41) {
            objc_enumerationMutation(userPreferredLanguages);
          }
          uint64_t v43 = *(void **)(*((void *)&v181 + 1) + 8 * i);
          if ([v43 hasPrefix:v25]) {
            [v31 addObject:v43];
          }
        }
        uint64_t v40 = [(NSArray *)userPreferredLanguages countByEnumeratingWithState:&v181 objects:v195 count:16];
      }
      while (v40);
    }
    int v27 = v37;
    if (![v31 count]) {
      [v31 addObject:v25];
    }
    uint64_t v23 = (uint64_t)v141;
    uint64_t v24 = v137;
    int v28 = v36;
  }
  else
  {
    if (([@"Kore" isEqualToString:v19] & 1) != 0
      || ([@"Grek" isEqualToString:v19] & 1) != 0
      || ([@"Telu" isEqualToString:v19] & 1) != 0
      || [@"Guru" isEqualToString:v19])
    {
      id v31 = (void *)[MEMORY[0x263EFF8C0] arrayWithObject:v25];
LABEL_59:
      int v126 = 0;
      char v44 = 0;
      userTopLanguages = 0;
      goto LABEL_66;
    }
    id v31 = (void *)[MEMORY[0x263EFF8C0] arrayWithObject:v25];
  }
  if (!v135 || ![v135 BOOLValue]) {
    goto LABEL_59;
  }
  char v44 = 0;
  userTopLanguages = v140->_userTopLanguages;
  int v126 = 1;
LABEL_66:
  int v136 = v27;
  if ([@"Arab" isEqualToString:v19])
  {
    if (([v31 containsObject:@"ur"] & 1) == 0)
    {
      long long v179 = 0u;
      long long v180 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      uint64_t v46 = [v24 countByEnumeratingWithState:&v177 objects:v194 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        char v121 = v44;
        uint64_t v48 = userTopLanguages;
        int v49 = v28;
        uint64_t v50 = *(void *)v178;
        while (2)
        {
          for (uint64_t j = 0; j != v47; ++j)
          {
            if (*(void *)v178 != v50) {
              objc_enumerationMutation(v24);
            }
            if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v177 + 1) + 8 * j), "primaryLanguage"), "isEqualToString:", @"ur"))
            {
              id v31 = (void *)[v31 arrayByAddingObject:@"ur"];
              goto LABEL_78;
            }
          }
          uint64_t v47 = [v24 countByEnumeratingWithState:&v177 objects:v194 count:16];
          if (v47) {
            continue;
          }
          break;
        }
LABEL_78:
        uint64_t v23 = (uint64_t)v141;
        int v27 = v136;
        int v28 = v49;
        userTopLanguages = v48;
        char v44 = v121;
      }
    }
  }
  if ([@"Cyrl" isEqualToString:v19]
    && ([v31 containsObject:@"bg"] & 1) == 0)
  {
    long long v175 = 0u;
    long long v176 = 0u;
    long long v173 = 0u;
    long long v174 = 0u;
    uint64_t v52 = [v24 countByEnumeratingWithState:&v173 objects:v193 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      char v122 = v44;
      v54 = userTopLanguages;
      int v55 = v28;
      uint64_t v56 = *(void *)v174;
      while (2)
      {
        for (uint64_t k = 0; k != v53; ++k)
        {
          if (*(void *)v174 != v56) {
            objc_enumerationMutation(v24);
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v173 + 1) + 8 * k), "primaryLanguage"), "isEqualToString:", @"bg"))
          {
            id v31 = (void *)[v31 arrayByAddingObject:@"bg"];
            goto LABEL_91;
          }
        }
        uint64_t v53 = [v24 countByEnumeratingWithState:&v173 objects:v193 count:16];
        if (v53) {
          continue;
        }
        break;
      }
LABEL_91:
      uint64_t v23 = (uint64_t)v141;
      int v27 = v136;
      int v28 = v55;
      userTopLanguages = v54;
      char v44 = v122;
    }
    else
    {
      int v27 = v136;
    }
  }
  if ([@"Cyrl" isEqualToString:v19]
    && ([v31 containsObject:@"uk"] & 1) == 0)
  {
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    uint64_t v58 = [v24 countByEnumeratingWithState:&v169 objects:v192 count:16];
    if (v58)
    {
      uint64_t v59 = v58;
      char v123 = v44;
      v60 = userTopLanguages;
      int v61 = v28;
      uint64_t v62 = *(void *)v170;
      while (2)
      {
        for (uint64_t m = 0; m != v59; ++m)
        {
          if (*(void *)v170 != v62) {
            objc_enumerationMutation(v24);
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v169 + 1) + 8 * m), "primaryLanguage"), "isEqualToString:", @"uk"))
          {
            id v31 = (void *)[v31 arrayByAddingObject:@"uk"];
            goto LABEL_105;
          }
        }
        uint64_t v59 = [v24 countByEnumeratingWithState:&v169 objects:v192 count:16];
        if (v59) {
          continue;
        }
        break;
      }
LABEL_105:
      uint64_t v23 = (uint64_t)v141;
      int v27 = v136;
      int v28 = v61;
      userTopLanguages = v60;
      char v44 = v123;
    }
    else
    {
      int v27 = v136;
    }
  }
  if ([@"Deva" isEqualToString:v19]
    && ([v31 containsObject:@"mr"] & 1) == 0)
  {
    long long v167 = 0u;
    long long v168 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    uint64_t v64 = [v24 countByEnumeratingWithState:&v165 objects:v191 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v166;
      while (2)
      {
        for (uint64_t n = 0; n != v65; ++n)
        {
          if (*(void *)v166 != v66) {
            objc_enumerationMutation(v24);
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v165 + 1) + 8 * n), "primaryLanguage"), "isEqualToString:", @"mr"))
          {
            id v31 = (void *)[v31 arrayByAddingObject:@"mr"];
            goto LABEL_119;
          }
        }
        uint64_t v65 = [v24 countByEnumeratingWithState:&v165 objects:v191 count:16];
        if (v65) {
          continue;
        }
        break;
      }
LABEL_119:
      uint64_t v23 = (uint64_t)v141;
      int v27 = v136;
    }
    else
    {
      uint64_t v23 = (uint64_t)v141;
    }
  }
  v68 = a9;
  if ([(__CFString *)v25 isEqualToString:@"Multilingual"])
  {
    id v69 = 0;
    if (!v28)
    {
LABEL_123:
      if (a9)
      {
        LOWORD(v115) = 1;
        LODWORD(v112) = 0;
        LOBYTE(v110) = 0;
        id v70 = a4;
        -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](v140, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, v138, v31, 0, v23, v110, 0, 0, v112, 0, 0, 0, 0,
          &v185,
          v115,
          0);
      }
      else
      {
        id v70 = a4;
      }
      v71 = v134;
      goto LABEL_216;
    }
  }
  else
  {
    id v69 = +[PRLanguage languageObjectWithIdentifier:v25];
    if (!v28) {
      goto LABEL_123;
    }
  }
  uint64_t v119 = obj & 0x80000202;
  uint64_t v120 = obj & 0x40000202;
  uint64_t v124 = obj & 0x202;
  BYTE1(v115) = v127;
  LOBYTE(v115) = 0;
  v114 = v24;
  BYTE1(v112) = v128;
  id v70 = a4;
  v71 = v134;
  LOBYTE(v110) = v44;
  BYTE3(v112) = v119 == 2147484162;
  BYTE2(v112) = v120 == 1073742338;
  LOBYTE(v112) = v124 == 514;
  -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](v140, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, v138, v31, userTopLanguages, v23, v110, v134, a5, v112, v114, v130, v131, v129,
    &v185,
    v115,
    0);
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  uint64_t v72 = [v134 countByEnumeratingWithState:&v161 objects:v190 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = 0;
    uint64_t v75 = *(void *)v162;
    do
    {
      for (iuint64_t i = 0; ii != v73; ++ii)
      {
        if (*(void *)v162 != v75) {
          objc_enumerationMutation(v134);
        }
        if ([*(id *)(*((void *)&v161 + 1) + 8 * ii) resultType] == 2) {
          ++v74;
        }
      }
      uint64_t v73 = [v134 countByEnumeratingWithState:&v161 objects:v190 count:16];
    }
    while (v73);
  }
  else
  {
    uint64_t v74 = 0;
  }
  int v77 = v126;
  if (v185 <= 0) {
    int v77 = 0;
  }
  if (v77 != 1) {
    goto LABEL_216;
  }
  if ((unint64_t)v185 >= 6)
  {
    BOOL v78 = v185 >= 2 * v74 || v69 == 0;
    if (!v78
      && ([v69 isGreek] & 1) == 0
      && ([v69 isKorean] & 1) == 0
      && ([v69 isPunjabi] & 1) == 0
      && ([v69 isTelugu] & 1) == 0)
    {
      if ([(NSArray *)v140->_userPreferredLatinLanguages count]) {
        uint64_t v108 = [MEMORY[0x263EFF8C0] arrayWithArray:v140->_userPreferredLatinLanguages];
      }
      else {
        uint64_t v108 = [MEMORY[0x263EFF8C0] arrayWithObject:@"en"];
      }
      id objb = (id)v108;
      uint64_t v23 = objc_msgSend(MEMORY[0x263F08A58], "orthographyWithDominantScript:languageMap:", @"Latn", objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", @"und"), @"Latn"));
      [v134 removeAllObjects];
      BYTE1(v116) = v127;
      LOBYTE(v116) = 0;
      BYTE3(v113) = v119 == 2147484162;
      BYTE2(v113) = v120 == 1073742338;
      BYTE1(v113) = v128;
      LOBYTE(v113) = v124 == 514;
      LOBYTE(v111) = 1;
      -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](v140, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, v138, objb, 0, v23, v111, v134, a5, v113, v137, v130, v131, v129,
        &v185,
        v116,
        0);
      int v27 = v136;
      goto LABEL_216;
    }
  }
  uint64_t v79 = v185;
  if (v185 <= 5 && v74 >= 1 && v69 != 0)
  {
    if (([v69 isItalian] & 1) != 0
      || ([v69 isSpanish] & 1) != 0
      || ([v69 isPortuguese] & 1) != 0)
    {
      id v117 = v69;
      v118 = a9;
      v81 = (void *)[MEMORY[0x263EFF980] array];
      id obja = (id)[MEMORY[0x263EFF980] array];
      long long v157 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      long long v160 = 0u;
      userPreferredLatinLanguages = v140->_userPreferredLatinLanguages;
      uint64_t v83 = [(NSArray *)userPreferredLatinLanguages countByEnumeratingWithState:&v157 objects:v189 count:16];
      if (v83)
      {
        uint64_t v84 = v83;
        uint64_t v85 = *(void *)v158;
        do
        {
          for (juint64_t j = 0; jj != v84; ++jj)
          {
            if (*(void *)v158 != v85) {
              objc_enumerationMutation(userPreferredLatinLanguages);
            }
            v87 = *(void **)(*((void *)&v157 + 1) + 8 * jj);
            if (([v87 hasPrefix:@"it"] & 1) != 0
              || ([v87 hasPrefix:@"es"] & 1) != 0
              || [v87 hasPrefix:@"pt"])
            {
              [v81 addObject:v87];
            }
          }
          uint64_t v84 = [(NSArray *)userPreferredLatinLanguages countByEnumeratingWithState:&v157 objects:v189 count:16];
        }
        while (v84);
      }
      id v70 = a4;
      v71 = v134;
      uint64_t v23 = (uint64_t)v141;
      int v27 = v136;
      id v69 = v117;
      v68 = a9;
      if ([v81 count])
      {
        uint64_t v23 = objc_msgSend(MEMORY[0x263F08A58], "orthographyWithDominantScript:languageMap:", @"Latn", objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", @"und"), @"Latn"));
        BYTE1(v116) = v127;
        LOBYTE(v116) = 0;
        BYTE3(v113) = v119 == 2147484162;
        BYTE2(v113) = v120 == 1073742338;
        BYTE1(v113) = v128;
        LOBYTE(v113) = v124 == 514;
        LOBYTE(v111) = 1;
        -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](v140, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, v138, v81, 0, v23, v111, obja, a5, v113, v137, v130, v131, v129,
          &v185,
          v116,
          0);
        long long v153 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        uint64_t v88 = [obja countByEnumeratingWithState:&v153 objects:v188 count:16];
        if (v88)
        {
          uint64_t v89 = v88;
          uint64_t v90 = 0;
          uint64_t v91 = *(void *)v154;
          int v27 = v136;
          id v69 = v117;
          do
          {
            for (kuint64_t k = 0; kk != v89; ++kk)
            {
              if (*(void *)v154 != v91) {
                objc_enumerationMutation(obja);
              }
              if ([*(id *)(*((void *)&v153 + 1) + 8 * kk) resultType] == 2) {
                ++v90;
              }
            }
            uint64_t v89 = [obja countByEnumeratingWithState:&v153 objects:v188 count:16];
          }
          while (v89);
          goto LABEL_213;
        }
LABEL_212:
        uint64_t v90 = 0;
        int v27 = v136;
        id v69 = v117;
LABEL_213:
        if (v90 < v74) {
          v71 = obja;
        }
        v68 = v118;
        goto LABEL_216;
      }
      goto LABEL_216;
    }
    uint64_t v79 = v185;
  }
  if (v79 <= 20)
  {
    BOOL v93 = v74 < 1 || v69 == 0;
    if (!v93
      && (([v69 isDanish] & 1) != 0
       || ([v69 isNorwegian] & 1) != 0
       || [v69 isSwedish]))
    {
      id v117 = v69;
      v118 = a9;
      v94 = (void *)[MEMORY[0x263EFF980] array];
      id obja = (id)[MEMORY[0x263EFF980] array];
      long long v149 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      v95 = v140->_userPreferredLatinLanguages;
      uint64_t v96 = [(NSArray *)v95 countByEnumeratingWithState:&v149 objects:v187 count:16];
      if (v96)
      {
        uint64_t v97 = v96;
        uint64_t v98 = *(void *)v150;
        do
        {
          for (muint64_t m = 0; mm != v97; ++mm)
          {
            if (*(void *)v150 != v98) {
              objc_enumerationMutation(v95);
            }
            v100 = *(void **)(*((void *)&v149 + 1) + 8 * mm);
            if (([v100 hasPrefix:@"da"] & 1) != 0
              || ([v100 hasPrefix:@"nb"] & 1) != 0
              || [v100 hasPrefix:@"sv"])
            {
              [v94 addObject:v100];
            }
          }
          uint64_t v97 = [(NSArray *)v95 countByEnumeratingWithState:&v149 objects:v187 count:16];
        }
        while (v97);
      }
      id v70 = a4;
      v71 = v134;
      uint64_t v23 = (uint64_t)v141;
      int v27 = v136;
      id v69 = v117;
      v68 = a9;
      if ([v94 count])
      {
        uint64_t v23 = objc_msgSend(MEMORY[0x263F08A58], "orthographyWithDominantScript:languageMap:", @"Latn", objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", @"und"), @"Latn"));
        BYTE1(v116) = v127;
        LOBYTE(v116) = 0;
        BYTE3(v113) = v119 == 2147484162;
        BYTE2(v113) = v120 == 1073742338;
        BYTE1(v113) = v128;
        LOBYTE(v113) = v124 == 514;
        LOBYTE(v111) = 1;
        -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](v140, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, v138, v94, 0, v23, v111, obja, a5, v113, v137, v130, v131, v129,
          &v185,
          v116,
          0);
        long long v145 = 0u;
        long long v146 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        uint64_t v101 = [obja countByEnumeratingWithState:&v145 objects:v186 count:16];
        if (v101)
        {
          uint64_t v102 = v101;
          uint64_t v90 = 0;
          uint64_t v103 = *(void *)v146;
          int v27 = v136;
          id v69 = v117;
          do
          {
            for (nuint64_t n = 0; nn != v102; ++nn)
            {
              if (*(void *)v146 != v103) {
                objc_enumerationMutation(obja);
              }
              if ([*(id *)(*((void *)&v145 + 1) + 8 * nn) resultType] == 2) {
                ++v90;
              }
            }
            uint64_t v102 = [obja countByEnumeratingWithState:&v145 objects:v186 count:16];
          }
          while (v102);
          goto LABEL_213;
        }
        goto LABEL_212;
      }
    }
  }
LABEL_216:
  if (v69) {
    int v105 = v27;
  }
  else {
    int v105 = 0;
  }
  if (v105 == 1) {
    -[AppleSpell spellServer:checkGrammarInString:range:language:orthography:mutableResults:offset:details:](v140, "spellServer:checkGrammarInString:range:language:orthography:mutableResults:offset:details:", a3, v70, 0, v138, [v69 identifier], v23, v71, a5, 0);
  }
  if (v68) {
    int64_t *v68 = v185;
  }
  return v71;
}

- (id)spellServer:(id)a3 generateCandidatesForSelectedRange:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 types:(unint64_t)a7 options:(id)a8 orthography:(id)a9
{
  return -[AppleSpell spellServer:candidatesForSelectedRange:inString:offset:types:options:orthography:](self, "spellServer:candidatesForSelectedRange:inString:offset:types:options:orthography:", a3, a4.location, a4.length, a5, a6, a7);
}

- (id)spellServer:(id)a3 suggestGuessesForWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6
{
  return -[AppleSpell spellServer:suggestGuessesForWordRange:inString:inLanguage:options:](self, "spellServer:suggestGuessesForWordRange:inString:inLanguage:options:", a3, a4.location, a4.length, a5, a6, 0);
}

- (id)spellServer:(id)a3 suggestGuessesForWord:(id)a4 inLanguage:(id)a5
{
  uint64_t v9 = [a4 length];
  return -[AppleSpell spellServer:suggestGuessesForWordRange:inString:inLanguage:options:](self, "spellServer:suggestGuessesForWordRange:inString:inLanguage:options:", a3, 0, v9, a4, a5, 0);
}

- (id)spellServer:(id)a3 suggestGuessDictionariesForWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6 options:(id)a7 errorModel:(id)a8
{
  return [(AppleSpell *)self spellServer:a3 suggestGuessDictionariesForWordRange:a4.location inString:a4.length inLanguage:a5 options:a6 errorModel:a7];
}

- (id)spellServer:(id)a3 suggestCompletionsForPartialWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6
{
  return -[AppleSpell spellServer:suggestCompletionsForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestCompletionsForPartialWordRange:inString:inLanguage:options:", a3, a4.location, a4.length, a5, a6, 0);
}

- (id)spellServer:(id)a3 suggestCompletionDictionariesForPartialWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6
{
  return -[AppleSpell spellServer:suggestCompletionDictionariesForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestCompletionDictionariesForPartialWordRange:inString:inLanguage:options:", a3, a4.location, a4.length, a5, a6, 0);
}

- (id)spellServer:(id)a3 suggestNextLetterDictionariesForPartialWordRange:(_NSRange)a4 inString:(id)a5 language:(id)a6
{
  return -[AppleSpell spellServer:suggestNextLetterDictionariesForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestNextLetterDictionariesForPartialWordRange:inString:inLanguage:options:", a3, a4.location, a4.length, a5, a6, 0);
}

- (id)spellServer:(id)a3 suggestWordWithLengthInRange:(_NSRange)a4 language:(id)a5
{
  return -[AppleSpell spellServer:suggestWordWithMinimumLength:maximumLength:language:](self, "spellServer:suggestWordWithMinimumLength:maximumLength:language:", a3);
}

- (id)spellServer:(id)a3 stringForInputString:(id)a4 language:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (!a5
    || ([a5 isEqualToString:@"und"] & 1) != 0
    || [a5 isEqualToString:@"Multilingual"])
  {
    NSUInteger v9 = [(NSArray *)self->_userPreferredLatinLanguages count];
    uint64_t v10 = (void *)MEMORY[0x263EFF8C0];
    if (v9)
    {
      uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithArray:self->_userPreferredLatinLanguages];
      goto LABEL_9;
    }
    long long v12 = @"en";
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263EFF8C0];
    long long v12 = (__CFString *)a5;
  }
  uint64_t v11 = [v10 arrayWithObject:v12];
LABEL_9:
  uint64_t v13 = v11;
  CFStringEncoding v14 = objc_msgSend(+[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", a5), "encoding");
  unint64_t v15 = [a4 length];
  CFStringRef theString = 0;
  LOWORD(v26) = 0;
  LODWORD(v25) = 1;
  LOBYTE(v24) = 0;
  -[AppleSpell spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:](self, "spellServer:findMisspelledWordInString:range:languages:topLanguages:orthography:checkOrthography:mutableResults:offset:autocorrect:onlyAtInsertionPoint:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:parameterBundles:wordCount:countOnly:appendCorrectionLanguage:correction:", a3, a4, 0, v15, v13, 0, 0, v24, 0, 0, v25, 0, 0, 0, 0,
    0,
    v26,
    &theString);
  if (v16)
  {
    CFIndex v27 = 0;
    CFIndex usedBufLen = 0;
    uint64_t v17 = [(__CFString *)(id)theString length];
    CFStringRef v18 = 0;
    if (v15 >= 5)
    {
      if (theString)
      {
        CFIndex v19 = v17;
        v33.NSUInteger location = 0;
        v33.NSUInteger length = v15;
        CFIndex Bytes = CFStringGetBytes((CFStringRef)a4, v33, v14, 0x5Fu, 0, buffer, 24, &usedBufLen);
        CFStringRef v18 = 0;
        if (v15 == Bytes)
        {
          v34.NSUInteger location = 0;
          v34.NSUInteger length = v19;
          CFIndex v21 = CFStringGetBytes(theString, v34, v14, 0x5Fu, 0, v30, 24, &v27);
          CFStringRef v18 = 0;
          if (v19 == v21)
          {
            uint64_t v22 = effectiveEditDistance((uint64_t)buffer, usedBufLen, (uint64_t)v30, v27);
            CFStringRef v18 = theString;
            if (v22 != 1) {
              return 0;
            }
          }
        }
      }
    }
    return (id)v18;
  }
  return a4;
}

- (BOOL)spellServer:(id)a3 canChangeCaseOfFirstLetterInString:(id)a4 toUpperCase:(BOOL)a5 language:(id)a6
{
  BOOL v6 = a5;
  id v10 = +[PRLanguage languageObjectWithIdentifier:a6];
  return [(AppleSpell *)self _spellServer:a3 canChangeCaseOfFirstLetterInString:a4 toUpperCase:v6 languageObject:v10];
}

- (id)sentenceTerminatorCharacterSet
{
  if (sentenceTerminatorCharacterSet_onceToken != -1) {
    dispatch_once(&sentenceTerminatorCharacterSet_onceToken, &__block_literal_global);
  }
  return (id)sentenceTerminatorCharacterSet_terminatorCharacterSet;
}

id __62__AppleSpell_LanguageModeling__sentenceTerminatorCharacterSet__block_invoke()
{
  id result = (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@".!?։۔।።᙮‼‽⁇⁈⁉。！．？｡"];
  sentenceTerminatorCharacterSet_terminatorCharacterSet = (uint64_t)result;
  return result;
}

- (id)_standardizedLanguageModelStringForString:(id)a3
{
  if ((_standardizedLanguageModelStringForString__initedStrings & 1) == 0)
  {
    __int16 v14 = 8216;
    __int16 v13 = 8217;
    __int16 v12 = 8220;
    __int16 v11 = 8221;
    __int16 v10 = 0;
    _standardizedLanguageModelStringForString__curlyOpenSingleQuote = [[NSString alloc] initWithCharacters:&v14 length:1];
    _standardizedLanguageModelStringForString__curlyCloseSingleQuote = [[NSString alloc] initWithCharacters:&v13 length:1];
    _standardizedLanguageModelStringForString__curlyOpenDoubleQuote = [[NSString alloc] initWithCharacters:&v12 length:1];
    _standardizedLanguageModelStringForString__curlyCloseDoubleQuote = [[NSString alloc] initWithCharacters:&v11 length:1];
    _standardizedLanguageModelStringForString__embeddedNull = [[NSString alloc] initWithCharacters:&v10 length:1];
    _standardizedLanguageModelStringForString__initedStrings = 1;
  }
  [a3 rangeOfString:_standardizedLanguageModelStringForString__curlyOpenSingleQuote];
  if (v4) {
    a3 = (id)[a3 stringByReplacingOccurrencesOfString:_standardizedLanguageModelStringForString__curlyOpenSingleQuote withString:@"'"];
  }
  [a3 rangeOfString:_standardizedLanguageModelStringForString__curlyCloseSingleQuote];
  if (v5) {
    a3 = (id)[a3 stringByReplacingOccurrencesOfString:_standardizedLanguageModelStringForString__curlyCloseSingleQuote withString:@"'"];
  }
  [a3 rangeOfString:_standardizedLanguageModelStringForString__curlyOpenDoubleQuote];
  if (v6) {
    a3 = (id)[a3 stringByReplacingOccurrencesOfString:_standardizedLanguageModelStringForString__curlyOpenDoubleQuote withString:@"\""];
  }
  [a3 rangeOfString:_standardizedLanguageModelStringForString__curlyCloseDoubleQuote];
  if (v7) {
    a3 = (id)[a3 stringByReplacingOccurrencesOfString:_standardizedLanguageModelStringForString__curlyCloseDoubleQuote withString:@"\""];
  }
  [a3 rangeOfString:_standardizedLanguageModelStringForString__embeddedNull];
  if (v8) {
    return (id)[a3 stringByReplacingOccurrencesOfString:_standardizedLanguageModelStringForString__embeddedNull withString:@"_"];
  }
  return a3;
}

- (unsigned)_tokenIDForString:(id)a3 languageModel:(id)a4 languageObject:(id)a5 createIfAbsent:(BOOL)a6 terminatorTokenID:(unsigned int)a7
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __112__AppleSpell_LanguageModeling___tokenIDForString_languageModel_languageObject_createIfAbsent_terminatorTokenID___block_invoke;
  block[3] = &unk_2640EF4B0;
  block[4] = self;
  if (_tokenIDForString_languageModel_languageObject_createIfAbsent_terminatorTokenID__onceToken != -1)
  {
    dispatch_once(&_tokenIDForString_languageModel_languageObject_createIfAbsent_terminatorTokenID__onceToken, block);
    if (a4) {
      goto LABEL_3;
    }
    return 0;
  }
  if (!a4) {
    return 0;
  }
LABEL_3:
  if (![a3 length]
    || ([a3 rangeOfCharacterFromSet:_tokenIDForString_languageModel_languageObject_createIfAbsent_terminatorTokenID__nonTerminatorSet], v12)|| (objc_msgSend(a3, "isEqualToString:", @"..") & 1) != 0|| objc_msgSend(a3, "isEqualToString:", @"..."))
  {
    int v13 = [a5 isKorean];
    id v14 = [(AppleSpell *)self _standardizedLanguageModelStringForString:a3];
    if (v13)
    {
      id v15 = [(AppleSpell *)self internalStringForKoreanExternalString:v14];
      return [a4 tokenIDForString:v15];
    }
    a7 = [a4 tokenIDForString:v14];
    if (!a7)
    {
      id v15 = (id)[v14 lowercaseString];
      return [a4 tokenIDForString:v15];
    }
  }
  return a7;
}

id __112__AppleSpell_LanguageModeling___tokenIDForString_languageModel_languageObject_createIfAbsent_terminatorTokenID___block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sentenceTerminatorCharacterSet"), "invertedSet");
  _tokenIDForString_languageModel_languageObject_createIfAbsent_terminatorTokenID__nonTerminatorSet = (uint64_t)result;
  return result;
}

- (unsigned)_tokenIDForString:(id)a3 languageModel:(id)a4 languageObject:(id)a5 terminatorTokenID:(unsigned int)a6
{
  return [(AppleSpell *)self _tokenIDForString:a3 languageModel:a4 languageObject:a5 createIfAbsent:0 terminatorTokenID:*(void *)&a6];
}

- (id)_stringForTokenIDs:(const unsigned int *)a3 tokenCount:(unint64_t)a4 entryString:(id)a5 languageModel:(id)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8 sender:(id)a9 prefix:(id)a10 capitalized:(BOOL)a11
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v16 = (void *)[MEMORY[0x263EFF980] array];
  CFStringEncoding encoding = [a7 encoding];
  if (!a6) {
    return 0;
  }
  if (a4)
  {
    uint64_t v17 = 0;
    uint64_t v28 = 0;
    do
    {
      if (a3[v17] < 0x1F4) {
        CFStringRef v18 = 0;
      }
      else {
        CFStringRef v18 = (__CFString *)objc_msgSend(a6, "stringForTokenID:");
      }
      int v19 = [a7 isArabic];
      if (!a5 || v17)
      {
        if (!v18) {
          goto LABEL_42;
        }
      }
      else if (v18)
      {
        if (v19 && ![(__CFString *)v18 isEqualToString:a5]) {
          CFStringRef v18 = (__CFString *)a5;
        }
      }
      else
      {
        CFStringRef v18 = (__CFString *)a5;
        if (*a3) {
          goto LABEL_42;
        }
      }
      if (([(__CFString *)v18 isEqualToString:@"NUMBER"] & 1) != 0
        || ([(__CFString *)v18 isEqualToString:@"LINK"] & 1) != 0)
      {
        goto LABEL_42;
      }
      if (!a10 || v17)
      {
        -[__CFString rangeOfCharacterFromSet:](v18, "rangeOfCharacterFromSet:", [MEMORY[0x263F08708] alphanumericCharacterSet]);
        if (!v20) {
          goto LABEL_42;
        }
      }
      else if ((acceptAsCompletion(v18, (uint64_t)a10, a7) & 1) == 0)
      {
        goto LABEL_42;
      }
      CFIndex v21 = [(__CFString *)v18 length];
      CFIndex v32 = 0;
      if (v21)
      {
        v35.NSUInteger location = 0;
        v35.NSUInteger length = v21;
        if (v21 == CFStringGetBytes(v18, v35, encoding, 0x5Fu, 0, buffer, 254, &v32))
        {
          BYTE6(usedBufLen) = 1;
          WORD2(usedBufLen) = 257;
          LODWORD(usedBufLen) = 16842753;
          if (!-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, v32, a7, a8, a9, 1, usedBufLen, 0)|| -[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", buffer, v32, a7, 1)|| -[AppleSpell acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:](
                 self,
                 "acceptabilityOfWordBuffer:length:languageObject:forPrediction:alreadyCapitalized:",
                 buffer,
                 v32,
                 a7,
                 1,
                 a11) < 2)
          {
LABEL_42:
            [v16 removeAllObjects];
            break;
          }
        }
      }
      int v22 = [a7 isKorean];
      int v23 = [a7 isTurkish];
      if (v22)
      {
        uint64_t v24 = [(AppleSpell *)self externalStringForKoreanInternalString:v18];
      }
      else
      {
        if (v17) {
          goto LABEL_32;
        }
        if (!a11) {
          goto LABEL_32;
        }
        int v25 = v23;
        if (![(__CFString *)v18 isEqualToString:[(__CFString *)v18 lowercaseString]])goto LABEL_32; {
        if (v25)
        }
        {
          uint64_t v28 = _stringForTokenIDs_tokenCount_entryString_languageModel_languageObject_connection_sender_prefix_capitalized__turkishLocale;
          if (!_stringForTokenIDs_tokenCount_entryString_languageModel_languageObject_connection_sender_prefix_capitalized__turkishLocale)
          {
            uint64_t v28 = [objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"tr"];
            _stringForTokenIDs_tokenCount_entryString_languageModel_languageObject_connection_sender_prefix_capitalized__turkishLocale = v28;
          }
        }
        uint64_t v24 = (__CFString *)initialCapitalizedString(v18, v28);
      }
      CFStringRef v18 = v24;
LABEL_32:
      [v16 addObject:v18];
      ++v17;
    }
    while (a4 != v17);
  }
  id result = (id)[v16 count];
  if (result) {
    return (id)[v16 componentsJoinedByString:@" "];
  }
  return result;
}

- (id)_stringForCompletion:(id)a3 languageModel:(id)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 prefix:(id)a8 capitalized:(BOOL)a9
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  CFStringEncoding v16 = [a5 encoding];
  if (a8)
  {
    if ((acceptAsCompletion(a3, (uint64_t)a8, a5) & 1) == 0) {
      return 0;
    }
  }
  else
  {
    objc_msgSend(a3, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x263F08708], "alphanumericCharacterSet"));
    if (!v17) {
      return 0;
    }
  }
  CFIndex v18 = [a3 length];
  CFIndex v25 = 0;
  if (v18)
  {
    v28.NSUInteger location = 0;
    v28.NSUInteger length = v18;
    if (v18 == CFStringGetBytes((CFStringRef)a3, v28, v16, 0x5Fu, 0, buffer, 254, &v25))
    {
      BYTE6(usedBufLen) = 1;
      WORD2(usedBufLen) = 257;
      LODWORD(usedBufLen) = 16842753;
      if (!-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, v25, a5, a6, a7, 1, usedBufLen, 0))return 0; {
      if ([(AppleSpell *)self checkWordBuffer:buffer length:v25 languageObject:a5 index:1])
      }
      {
        return 0;
      }
      unint64_t v19 = [(AppleSpell *)self acceptabilityOfWordBuffer:buffer length:v25 languageObject:a5 forPrediction:1 alreadyCapitalized:a9];
      if (!v19 || a4 && v19 == 1) {
        return 0;
      }
    }
  }
  int v20 = [a5 isTurkish];
  if (a9)
  {
    int v21 = v20;
    if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(a3, "lowercaseString")))
    {
      if (v21)
      {
        uint64_t v22 = _stringForCompletion_languageModel_languageObject_connection_sender_prefix_capitalized__turkishLocale;
        if (!_stringForCompletion_languageModel_languageObject_connection_sender_prefix_capitalized__turkishLocale)
        {
          uint64_t v22 = [objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"tr"];
          _stringForCompletion_languageModel_languageObject_connection_sender_prefix_capitalized__turkishLocale = v22;
        }
      }
      else
      {
        uint64_t v22 = 0;
      }
      return (id)initialCapitalizedString(a3, v22);
    }
  }
  return a3;
}

- (BOOL)shouldBlockWord:(id)a3 languageObject:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CFStringEncoding v7 = [a4 encoding];
  uint64_t v8 = [(AppleSpell *)self _standardizedLanguageModelStringForString:a3];
  if ([a4 isKorean]) {
    uint64_t v8 = [(AppleSpell *)self internalStringForKoreanExternalString:v8];
  }
  uint64_t v9 = [(__CFString *)v8 length];
  if (v9)
  {
    uint64_t v10 = v9;
    CFIndex usedBufLen = 0;
    v16.NSUInteger location = 0;
    v16.NSUInteger length = v9;
    CFIndex Bytes = CFStringGetBytes(v8, v16, v7, 0, 0, buffer, 254, &usedBufLen);
    LOBYTE(v9) = 0;
    if (v10 == Bytes) {
      LOBYTE(v9) = [(AppleSpell *)self checkNegativeWordBuffer:buffer length:usedBufLen languageObject:a4];
    }
  }
  return v9;
}

- (id)backgroundMaintenanceQueue
{
  if (backgroundMaintenanceQueue_onceToken != -1) {
    dispatch_once(&backgroundMaintenanceQueue_onceToken, &__block_literal_global_33);
  }
  return (id)backgroundMaintenanceQueue__backgroundMaintenanceQueue;
}

dispatch_queue_t __58__AppleSpell_LanguageModeling__backgroundMaintenanceQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t result = dispatch_queue_create("com.apple.ProofReader.backgroundMaintenanceQueue", v0);
  backgroundMaintenanceQueue__backgroundMaintenanceQueue = (uint64_t)result;
  return result;
}

- (unint64_t)_contextLengthForRange:(_NSRange)a3 languageObject:(id)a4 tagger:(id)a5 languageModel:(id)a6 maxContextLength:(unint64_t)a7 context:(unsigned int *)a8 cleanOffset:(unint64_t *)a9 cleanContextRange:(_NSRange *)a10 lastTokenRange:(_NSRange *)a11 lastTokenID:(unsigned int *)a12
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v44 = (id)[a5 string];
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 0;
  uint64_t v19 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  int v21 = (NSRange *)&v37[-2 * v20];
  MEMORY[0x270FA5388](v19);
  uint64_t v41 = (void *)((char *)v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  int v38 = objc_msgSend((id)objc_msgSend(a4, "identifier"), "isEqualToString:", @"en_CN");
  if (!a6)
  {
    unint64_t v25 = 0;
    goto LABEL_47;
  }
  if (length)
  {
    uint64_t v23 = objc_msgSend(a5, "sentenceRangeForRange:", location, length);
  }
  else
  {
    if (!location)
    {
      uint64_t v24 = 0;
      uint64_t v26 = 0;
      goto LABEL_8;
    }
    uint64_t v23 = objc_msgSend(a5, "sentenceRangeForRange:", location - 1, 1);
  }
  uint64_t v26 = v23;
LABEL_8:
  if (a7)
  {
    if ((v38 & 1) == 0)
    {
      v57[3] = 1;
      *int v21 = (NSRange)xmmword_20CC61990;
      *uint64_t v41 = *MEMORY[0x263F13F60];
    }
    if (v24 && v26 + v24 >= location)
    {
      uint64_t v45 = MEMORY[0x263EF8330];
      uint64_t v46 = 3221225472;
      uint64_t v47 = __173__AppleSpell_LanguageModeling___contextLengthForRange_languageObject_tagger_languageModel_maxContextLength_context_cleanOffset_cleanContextRange_lastTokenRange_lastTokenID___block_invoke;
      uint64_t v48 = &unk_2640EF520;
      NSUInteger v51 = location;
      NSUInteger v52 = length;
      id v49 = a5;
      uint64_t v50 = &v56;
      uint64_t v53 = v21;
      v54 = v41;
      unint64_t v55 = a7;
      objc_msgSend(a5, "enumerateTagsInRange:unit:scheme:options:usingBlock:");
    }
  }
  v37[1] = v37;
  if (v57[3])
  {
    unint64_t v27 = 0;
    unint64_t v28 = 0;
    unint64_t v29 = 0;
    *((void *)&v39 + 1) = 0;
    _NSRange v43 = (_NSRange)xmmword_20CC61990;
    uint64_t v40 = *MEMORY[0x263F13F90];
    *(void *)&unsigned long long v39 = 0x7FFFFFFFFFFFFFFFLL;
    unsigned int v42 = 1;
    while (1)
    {
      if (v21->length)
      {
        uint64_t v30 = [v44 substringWithRange:v21->location];
        unsigned int v31 = [(AppleSpell *)self _tokenIDForString:v30 languageModel:a6 languageObject:a4 terminatorTokenID:1];
        if (v31 || v41[v27] != v40)
        {
          BOOL v32 = [(AppleSpell *)self shouldBlockWord:v30 languageObject:a4];
          a8[v29] = v31;
          if (v31 != 1)
          {
            _NSRange v43 = *v21;
            unsigned int v42 = v31;
          }
          unint64_t v25 = v29 + 1;
          if (v32 || ([a6 tokenSequenceIsBlocklisted:a8 length:v29 + 1] & 1) != 0)
          {
            unint64_t v28 = v29 + 1;
          }
          else if (v31 == 1)
          {
            int v33 = v38;
            if (v29 == -1) {
              int v33 = 1;
            }
            if (v33) {
              unint64_t v28 = v29 + 1;
            }
            else {
              unint64_t v28 = v29;
            }
          }
          else
          {
            v34.NSUInteger length = *((void *)&v39 + 1);
            if (*((void *)&v39 + 1))
            {
              v34.NSUInteger location = v39;
              unsigned long long v39 = (unsigned __int128)NSUnionRange(v34, *v21);
            }
            else
            {
              unsigned long long v39 = (unsigned __int128)*v21;
            }
          }
          goto LABEL_36;
        }
      }
      else if (!v27)
      {
        unint64_t v25 = v29 + 1;
        a8[v29] = 1;
        goto LABEL_36;
      }
      unint64_t v25 = v29;
LABEL_36:
      ++v27;
      ++v21;
      unint64_t v29 = v25;
      if (v27 >= v57[3]) {
        goto LABEL_39;
      }
    }
  }
  unsigned long long v39 = 0x7FFFFFFFFFFFFFFFuLL;
  unint64_t v25 = 0;
  unint64_t v28 = 0;
  _NSRange v43 = (_NSRange)xmmword_20CC61990;
  unsigned int v42 = 1;
LABEL_39:
  if (a9) {
    *a9 = v28;
  }
  NSUInteger v35 = *((void *)&v39 + 1);
  if (a10)
  {
    a10->NSUInteger location = v39;
    a10->NSUInteger length = v35;
  }
  if (a11) {
    *a11 = v43;
  }
  if (a12) {
    *a12 = v42;
  }
LABEL_47:
  _Block_object_dispose(&v56, 8);
  return v25;
}

uint64_t __173__AppleSpell_LanguageModeling___contextLengthForRange_languageObject_tagger_languageModel_maxContextLength_context_cleanOffset_cleanContextRange_lastTokenRange_lastTokenID___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4, unsigned char *a5)
{
  if (a3 >= *(void *)(result + 48))
  {
    *a5 = 1;
  }
  else
  {
    uint64_t v8 = (void *)result;
    dispatch_queue_t result = [*(id *)(result + 32) orthoIndex];
    unint64_t v9 = *(void *)(*(void *)(v8[5] + 8) + 24);
    if (result != 239
      && v9
      && ((uint64_t v10 = v8[8], v11 = v9 - 1, v12 = (uint64_t *)(v10 + 16 * (v9 - 1)), v14 = *v12, v13 = v12[1], v13 + v14 == a3)
        ? (BOOL v15 = *MEMORY[0x263F13FD8] == a2)
        : (BOOL v15 = 0),
          v15 && *(void *)(v8[9] + 8 * v11) == a2))
    {
      *(void *)(v10 + 16 * v11 + 8) = v13 + a4;
    }
    else
    {
      unint64_t v16 = v8[10];
      if (v9 >= v16)
      {
        if (v16 >= 2)
        {
          uint64_t v19 = 0;
          uint64_t v20 = 0;
          do
          {
            *(_OWORD *)(v8[8] + v19) = *(_OWORD *)(v8[8] + v19 + 16);
            *(void *)(v8[9] + 8 * v20) = *(void *)(v8[9] + 8 * v20 + 8);
            unint64_t v16 = v8[10];
            unint64_t v21 = v20 + 2;
            ++v20;
            v19 += 16;
          }
          while (v21 < v16);
        }
        uint64_t v22 = v8[9];
        uint64_t v23 = v8[8] + 16 * v16;
        *(void *)(v23 - 16) = a3;
        *(void *)(v23 - 8) = a4;
        *(void *)(v22 + 8 * v8[10] - 8) = a2;
      }
      else
      {
        uint64_t v17 = v8[9];
        CFIndex v18 = (unint64_t *)(v8[8] + 16 * v9);
        unint64_t *v18 = a3;
        v18[1] = a4;
        *(void *)(v17 + 8 * (*(void *)(*(void *)(v8[5] + 8) + 24))++) = a2;
      }
    }
  }
  return result;
}

- (id)languageModelLocalizationForLanguage:(id)a3
{
  return +[PRLanguage languageModelLocalizationForLanguage:a3];
}

- (void)_readLanguageModelParametersFromDefaults
{
  if ((_readLanguageModelParametersFromDefaults_readDefaults & 1) == 0)
  {
    v2 = (void *)[MEMORY[0x263EFFA40] standardUserDefaults];
    if ([v2 objectForKey:@"NSSpellCheckerUseCharacterLanguageModels"]) {
      _kUseCharacterLanguageModels = [v2 BOOLForKey:@"NSSpellCheckerUseCharacterLanguageModels"];
    }
    if ([v2 objectForKey:@"NSSpellCheckerSuppressLanguageModels"]) {
      _kSuppressLanguageModels = [v2 BOOLForKey:@"NSSpellCheckerSuppressLanguageModels"];
    }
    if ([v2 objectForKey:@"NSSpellCheckerSuppressAdaptation"]) {
      _kSuppressAdaptatiouint64_t n = [v2 BOOLForKey:@"NSSpellCheckerSuppressAdaptation"];
    }
    if ([v2 objectForKey:@"NSSpellCheckerMaxContextLength"])
    {
      uint64_t v3 = [v2 integerForKey:@"NSSpellCheckerMaxContextLength"];
      _kMaxContextLength = v3 & ~(v3 >> 63);
    }
    if ([v2 objectForKey:@"NSSpellCheckerMaxCorrectionRescoreCount"])
    {
      uint64_t v4 = [v2 integerForKey:@"NSSpellCheckerMaxCorrectionRescoreCount"];
      _kMaxCorrectionRescoreCount = v4 & ~(v4 >> 63);
    }
    if ([v2 objectForKey:@"NSSpellCheckerMaxCompletionRescoreCount"])
    {
      uint64_t v5 = [v2 integerForKey:@"NSSpellCheckerMaxCompletionRescoreCount"];
      _kMaxCompletionRescoreCount = v5 & ~(v5 >> 63);
    }
    if ([v2 objectForKey:@"NSSpellCheckerMaxPredictionSampleCount"])
    {
      uint64_t v6 = [v2 integerForKey:@"NSSpellCheckerMaxPredictionSampleCount"];
      _kMaxPredictionSampleCount = v6 & ~(v6 >> 63);
    }
    if ([v2 objectForKey:@"NSSpellCheckerMaxTokensPerPrediction"])
    {
      uint64_t v7 = [v2 integerForKey:@"NSSpellCheckerMaxTokensPerPrediction"];
      _kMaxTokensPerPredictiouint64_t n = v7 & ~(v7 >> 63);
    }
    if ([v2 objectForKey:@"NSSpellCheckerMaxPredictionsToExamine"])
    {
      uint64_t v8 = [v2 integerForKey:@"NSSpellCheckerMaxPredictionsToExamine"];
      _kMaxPredictionsToExamine = v8 & ~(v8 >> 63);
    }
    if ([v2 objectForKey:@"NSSpellCheckerMaxPredictionsToAdd"])
    {
      uint64_t v9 = [v2 integerForKey:@"NSSpellCheckerMaxPredictionsToAdd"];
      _kMaxPredictionsToAdd = v9 & ~(v9 >> 63);
    }
    if ([v2 objectForKey:@"NSSpellCheckerMaxCompletionsToExamine"])
    {
      uint64_t v10 = [v2 integerForKey:@"NSSpellCheckerMaxCompletionsToExamine"];
      _kMaxCompletionsToExamine = v10 & ~(v10 >> 63);
    }
    if ([v2 objectForKey:@"NSSpellCheckerMaxCompletionsToAdd"])
    {
      uint64_t v11 = [v2 integerForKey:@"NSSpellCheckerMaxCompletionsToAdd"];
      _kMaxCompletionsToAdd = v11 & ~(v11 >> 63);
    }
    _readLanguageModelParametersFromDefaults_readDefaults = 1;
  }
}

- (void)_readLanguageModelParametersFromDictionary:(id)a3
{
  uint64_t v4 = [a3 objectForKey:@"NSSpellCheckerUseCharacterLanguageModels"];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    if (objc_opt_respondsToSelector())
    {
      unsigned int v6 = [v5 BOOLValue];
      _kUseCharacterLanguageModels = v6;
      NSLog((NSString *)@"NSSpellCheckerUseCharacterLanguageModels -> %d", v6);
    }
  }
  uint64_t v7 = [a3 objectForKey:@"NSSpellCheckerSuppressLanguageModels"];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    if (objc_opt_respondsToSelector())
    {
      unsigned int v9 = [v8 BOOLValue];
      _kSuppressLanguageModels = v9;
      NSLog((NSString *)@"NSSpellCheckerSuppressLanguageModels -> %d", v9);
    }
  }
  uint64_t v10 = [a3 objectForKey:@"NSSpellCheckerSuppressAdaptation"];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    if (objc_opt_respondsToSelector())
    {
      unsigned int v12 = [v11 BOOLValue];
      _kSuppressAdaptatiouint64_t n = v12;
      NSLog((NSString *)@"NSSpellCheckerSuppressAdaptation -> %d", v12);
    }
  }
  uint64_t v13 = [a3 objectForKey:@"NSSpellCheckerMaxContextLength"];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v15 = [v14 integerValue];
      _kMaxContextLength = v15 & ~(v15 >> 63);
      NSLog((NSString *)@"NSSpellCheckerMaxContextLength -> %lu", v15 & ~(v15 >> 63));
    }
  }
  uint64_t v16 = [a3 objectForKey:@"NSSpellCheckerMaxCorrectionRescoreCount"];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v18 = [v17 integerValue];
      _kMaxCorrectionRescoreCount = v18 & ~(v18 >> 63);
      NSLog((NSString *)@"NSSpellCheckerMaxCorrectionRescoreCount -> %lu", v18 & ~(v18 >> 63));
    }
  }
  uint64_t v19 = [a3 objectForKey:@"NSSpellCheckerMaxCompletionRescoreCount"];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v21 = [v20 integerValue];
      _kMaxCompletionRescoreCount = v21 & ~(v21 >> 63);
      NSLog((NSString *)@"NSSpellCheckerMaxCompletionRescoreCount -> %lu", v21 & ~(v21 >> 63));
    }
  }
  uint64_t v22 = [a3 objectForKey:@"NSSpellCheckerMaxPredictionSampleCount"];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v24 = [v23 integerValue];
      _kMaxPredictionSampleCount = v24 & ~(v24 >> 63);
      NSLog((NSString *)@"NSSpellCheckerMaxPredictionSampleCount -> %lu", v24 & ~(v24 >> 63));
    }
  }
  uint64_t v25 = [a3 objectForKey:@"NSSpellCheckerMaxTokensPerPrediction"];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v27 = [v26 integerValue];
      _kMaxTokensPerPredictiouint64_t n = v27 & ~(v27 >> 63);
      NSLog((NSString *)@"NSSpellCheckerMaxTokensPerPrediction -> %lu", v27 & ~(v27 >> 63));
    }
  }
  uint64_t v28 = [a3 objectForKey:@"NSSpellCheckerMaxPredictionsToExamine"];
  if (v28)
  {
    unint64_t v29 = (void *)v28;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v30 = [v29 integerValue];
      _kMaxPredictionsToExamine = v30 & ~(v30 >> 63);
      NSLog((NSString *)@"NSSpellCheckerMaxPredictionsToExamine -> %lu", v30 & ~(v30 >> 63));
    }
  }
  uint64_t v31 = [a3 objectForKey:@"NSSpellCheckerMaxPredictionsToAdd"];
  if (v31)
  {
    BOOL v32 = (void *)v31;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v33 = [v32 integerValue];
      _kMaxPredictionsToAdd = v33 & ~(v33 >> 63);
      NSLog((NSString *)@"NSSpellCheckerMaxPredictionsToAdd -> %lu", v33 & ~(v33 >> 63));
    }
  }
  uint64_t v34 = [a3 objectForKey:@"NSSpellCheckerMaxCompletionsToExamine"];
  if (v34)
  {
    NSUInteger v35 = (void *)v34;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v36 = [v35 integerValue];
      _kMaxCompletionsToExamine = v36 & ~(v36 >> 63);
      NSLog((NSString *)@"NSSpellCheckerMaxCompletionsToExamine -> %lu", v36 & ~(v36 >> 63));
    }
  }
  uint64_t v37 = [a3 objectForKey:@"NSSpellCheckerMaxCompletionsToAdd"];
  if (v37)
  {
    int v38 = (void *)v37;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v39 = [v38 integerValue];
      _kMaxCompletionsToAdd = v39 & ~(v39 >> 63);
      NSLog((NSString *)@"NSSpellCheckerMaxCompletionsToAdd -> %lu", v39 & ~(v39 >> 63));
    }
  }
}

- (id)_loadWordLanguageModelForLanguage:(id)a3 localization:(id)a4 appIdentifier:(id)a5 onQueue:(id)a6
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  uint64_t v24 = 0;
  id v10 = [(AppleSpell *)self lexiconForLanguage:a3];
  languageModelSerialQueue = self->_languageModelSerialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __101__AppleSpell_LanguageModeling___loadWordLanguageModelForLanguage_localization_appIdentifier_onQueue___block_invoke;
  block[3] = &unk_2640EF548;
  block[4] = self;
  void block[5] = a4;
  block[6] = a5;
  void block[7] = &v19;
  dispatch_sync(languageModelSerialQueue, block);
  unsigned int v12 = (void *)v20[5];
  if (!v12 || objc_msgSend(v12, "isEqual:", objc_msgSend(MEMORY[0x263EFF9D0], "null")))
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __101__AppleSpell_LanguageModeling___loadWordLanguageModelForLanguage_localization_appIdentifier_onQueue___block_invoke_2;
    v17[3] = &unk_2640EF570;
    v17[4] = a4;
    v17[5] = a5;
    v17[6] = v10;
    v17[7] = &v19;
    dispatch_sync((dispatch_queue_t)a6, v17);
    uint64_t v13 = self->_languageModelSerialQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __101__AppleSpell_LanguageModeling___loadWordLanguageModelForLanguage_localization_appIdentifier_onQueue___block_invoke_3;
    v16[3] = &unk_2640EF548;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a5;
    v16[7] = &v19;
    dispatch_sync(v13, v16);
  }
  uint64_t v14 = (void *)v20[5];
  _Block_object_dispose(&v19, 8);
  return v14;
}

id __101__AppleSpell_LanguageModeling___loadWordLanguageModelForLanguage_localization_appIdentifier_onQueue___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 56) objectForKey:a1[5]];
  if (result)
  {
    if (a1[6]) {
      uint64_t v3 = (__CFString *)a1[6];
    }
    else {
      uint64_t v3 = &stru_26C1C71A8;
    }
    id result = (id)[result objectForKey:v3];
    *(void *)(*(void *)(a1[7] + 8) + 40) = result;
  }
  return result;
}

PRWordLanguageModel *__101__AppleSpell_LanguageModeling___loadWordLanguageModelForLanguage_localization_appIdentifier_onQueue___block_invoke_2(void *a1)
{
  id result = +[PRWordLanguageModel languageModelWithLocalization:a1[4] appIdentifier:a1[5] lexicon:a1[6]];
  *(void *)(*(void *)(a1[7] + 8) + 40) = result;
  return result;
}

uint64_t __101__AppleSpell_LanguageModeling___loadWordLanguageModelForLanguage_localization_appIdentifier_onQueue___block_invoke_3(uint64_t a1)
{
  return _setLanguageModel(*(void **)(*(void *)(a1 + 32) + 56), *(void *)(a1 + 40), *(__CFString **)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
}

- (id)modelCreationQueue
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__AppleSpell_LanguageModeling__modelCreationQueue__block_invoke;
  block[3] = &unk_2640EF4B0;
  block[4] = self;
  if (modelCreationQueue_onceToken != -1) {
    dispatch_once(&modelCreationQueue_onceToken, block);
  }
  return (id)modelCreationQueue__modelCreationSerialQueue;
}

uint64_t __50__AppleSpell_LanguageModeling__modelCreationQueue__block_invoke(uint64_t a1)
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  modelCreationQueue__modelCreationSerialQueue = (uint64_t)dispatch_queue_create("com.apple.ProofReader.modelCreationSerialQueue", v2);
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _readLanguageModelParametersFromDefaults];
}

- (id)wordLanguageModelForLanguage:(id)a3 appIdentifier:(id)a4 waitForResult:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3052000000;
  uint64_t v20 = __Block_byref_object_copy__0;
  uint64_t v21 = __Block_byref_object_dispose__0;
  uint64_t v22 = 0;
  id v9 = -[AppleSpell languageModelLocalizationForLanguage:](self, "languageModelLocalizationForLanguage:");
  id v10 = [(AppleSpell *)self modelCreationQueue];
  if (_allowModelUsage())
  {
    languageModelSerialQueue = self->_languageModelSerialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __89__AppleSpell_LanguageModeling__wordLanguageModelForLanguage_appIdentifier_waitForResult___block_invoke;
    block[3] = &unk_2640EF548;
    block[4] = self;
    void block[5] = v9;
    block[6] = a4;
    void block[7] = &v17;
    dispatch_sync(languageModelSerialQueue, block);
    if (objc_msgSend((id)v18[5], "isEqual:", objc_msgSend(MEMORY[0x263EFF9D0], "null")))
    {
      id v12 = 0;
      v18[5] = 0;
    }
    else
    {
      id v12 = (id)v18[5];
      if (!v12 && !_kSuppressLanguageModels)
      {
        if (v5)
        {
          id v12 = [(AppleSpell *)self _loadWordLanguageModelForLanguage:a3 localization:v9 appIdentifier:a4 onQueue:v10];
          v18[5] = (uint64_t)v12;
        }
        else
        {
          uint64_t v14 = [(AppleSpell *)self backgroundLoadingQueue];
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __89__AppleSpell_LanguageModeling__wordLanguageModelForLanguage_appIdentifier_waitForResult___block_invoke_2;
          v15[3] = &unk_2640EF598;
          v15[4] = self;
          v15[5] = a3;
          v15[6] = v9;
          v15[7] = a4;
          v15[8] = v10;
          dispatch_async(v14, v15);
          id v12 = (id)v18[5];
        }
      }
    }
  }
  else
  {
    id v12 = 0;
  }
  _Block_object_dispose(&v17, 8);
  return v12;
}

id __89__AppleSpell_LanguageModeling__wordLanguageModelForLanguage_appIdentifier_waitForResult___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 56) objectForKey:a1[5]];
  if (result)
  {
    if (a1[6]) {
      uint64_t v3 = (__CFString *)a1[6];
    }
    else {
      uint64_t v3 = &stru_26C1C71A8;
    }
    id result = (id)[result objectForKey:v3];
    *(void *)(*(void *)(a1[7] + 8) + 40) = result;
  }
  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v4 = a1[5];
    BOOL v5 = *(void **)(a1[4] + 56);
    unsigned int v6 = (__CFString *)a1[6];
    return (id)_setLanguageModel(v5, v4, v6, 0);
  }
  return result;
}

void __89__AppleSpell_LanguageModeling__wordLanguageModelForLanguage_appIdentifier_waitForResult___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x210556730]();
  [*(id *)(a1 + 32) _loadWordLanguageModelForLanguage:*(void *)(a1 + 40) localization:*(void *)(a1 + 48) appIdentifier:*(void *)(a1 + 56) onQueue:*(void *)(a1 + 64)];
}

- (id)wordLanguageModelForLanguageObject:(id)a3 appIdentifier:(id)a4 waitForResult:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = [a3 identifier];
  return [(AppleSpell *)self wordLanguageModelForLanguage:v8 appIdentifier:a4 waitForResult:v5];
}

- (BOOL)useWordLanguageModelForLanguageObject:(id)a3 tagger:(id)a4 appIdentifier:(id)a5
{
  BOOL v9 = _allowModelUsage();
  LOBYTE(v10) = 0;
  if (a4)
  {
    if (v9)
    {
      uint64_t v10 = [a4 orthoIndex];
      if (v10) {
        LOBYTE(v10) = [(AppleSpell *)self wordLanguageModelForLanguageObject:a3 appIdentifier:a5 waitForResult:0] != 0;
      }
    }
  }
  return v10;
}

- (BOOL)useCharacterLanguageModelForLanguageObject:(id)a3 tagger:(id)a4 appIdentifier:(id)a5
{
  BOOL v8 = _allowModelUsage();
  LOBYTE(v9) = 0;
  if (a4)
  {
    if (v8)
    {
      uint64_t v9 = [a4 orthoIndex];
      if (v9) {
        LOBYTE(v9) = [(AppleSpell *)self characterLanguageModelForLanguageObject:a3 waitForResult:0] != 0;
      }
    }
  }
  return v9;
}

- (BOOL)useTransformerLanguageModelForLanguageObject:(id)a3 tagger:(id)a4 appIdentifier:(id)a5
{
  LODWORD(v8) = _allowModelUsage();
  if (v8)
  {
    int v9 = [a3 isEnglish];
    LOBYTE(v8) = 0;
    if (a4)
    {
      if (v9)
      {
        uint64_t v8 = [a4 orthoIndex];
        if (v8) {
          LOBYTE(v8) = [(AppleSpell *)self transformerLanguageModelForLanguageObject:a3 waitForResult:0] != 0;
        }
      }
    }
  }
  return v8;
}

- (BOOL)useSentencePieceLanguageModelForLanguageObject:(id)a3 tagger:(id)a4 appIdentifier:(id)a5
{
  LODWORD(v8) = _allowModelUsage();
  if (v8)
  {
    int v9 = [a3 usesSentencePieceModel];
    LOBYTE(v8) = 0;
    if (a4)
    {
      if (v9)
      {
        uint64_t v8 = [a4 orthoIndex];
        if (v8) {
          LOBYTE(v8) = [(AppleSpell *)self sentencePieceLanguageModelForLanguageObject:a3 waitForResult:0] != 0;
        }
      }
    }
  }
  return v8;
}

- (void)loadWordLanguageModelForLanguageObject:(id)a3
{
}

- (BOOL)useUnigramProbabilityForLanguageObject:(id)a3
{
  int v4 = _allowModelUsage();
  if (v4)
  {
    LOBYTE(v4) = [a3 usesUnigramProbabilities];
  }
  return v4;
}

- (id)_loadNLPLanguageModelWithType:(int64_t)a3 forLanguageObject:(id)a4 onQueue:(id)a5
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  uint64_t v24 = 0;
  if ((unint64_t)(a3 - 1) > 3) {
    uint64_t v8 = &OBJC_IVAR___AppleSpell__sentencePieceLanguageModelDictionary;
  }
  else {
    uint64_t v8 = off_2640EF790[a3 - 1];
  }
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa + *v8);
  uint64_t v10 = [a4 languageModelLocalization];
  languageModelSerialQueue = self->_languageModelSerialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__AppleSpell_LanguageModeling___loadNLPLanguageModelWithType_forLanguageObject_onQueue___block_invoke;
  block[3] = &unk_2640EF438;
  void block[5] = v10;
  block[6] = &v19;
  block[4] = v9;
  dispatch_sync(languageModelSerialQueue, block);
  id v12 = (void *)v20[5];
  if (!v12 || objc_msgSend(v12, "isEqual:", objc_msgSend(MEMORY[0x263EFF9D0], "null")))
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __88__AppleSpell_LanguageModeling___loadNLPLanguageModelWithType_forLanguageObject_onQueue___block_invoke_2;
    v17[3] = &unk_2640EF5C0;
    v17[4] = v10;
    v17[5] = &v19;
    v17[6] = a3;
    dispatch_sync((dispatch_queue_t)a5, v17);
    uint64_t v13 = self->_languageModelSerialQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __88__AppleSpell_LanguageModeling___loadNLPLanguageModelWithType_forLanguageObject_onQueue___block_invoke_3;
    v16[3] = &unk_2640EF5E8;
    v16[5] = v10;
    v16[6] = &v19;
    v16[4] = v9;
    dispatch_sync(v13, v16);
  }
  uint64_t v14 = (void *)v20[5];
  _Block_object_dispose(&v19, 8);
  return v14;
}

uint64_t __88__AppleSpell_LanguageModeling___loadNLPLanguageModelWithType_forLanguageObject_onQueue___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

PRNLPLanguageModel *__88__AppleSpell_LanguageModeling___loadNLPLanguageModelWithType_forLanguageObject_onQueue___block_invoke_2(void *a1)
{
  uint64_t result = +[PRNLPLanguageModel languageModelWithLocalization:a1[4] type:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 40) = result;
  return result;
}

uint64_t __88__AppleSpell_LanguageModeling___loadNLPLanguageModelWithType_forLanguageObject_onQueue___block_invoke_3(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (!v3) {
    uint64_t v3 = [MEMORY[0x263EFF9D0] null];
  }
  uint64_t v4 = a1[5];
  return [v2 setObject:v3 forKey:v4];
}

- (id)_NLPLanguageModelWithType:(int64_t)a3 forLanguageObject:(id)a4 waitForResult:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  uint64_t v24 = 0;
  if ((unint64_t)(a3 - 1) > 3) {
    uint64_t v9 = &OBJC_IVAR___AppleSpell__sentencePieceLanguageModelDictionary;
  }
  else {
    uint64_t v9 = off_2640EF790[a3 - 1];
  }
  uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + *v9);
  uint64_t v11 = [a4 languageModelLocalization];
  id v12 = [(AppleSpell *)self modelCreationQueue];
  if (_allowModelUsage())
  {
    languageModelSerialQueue = self->_languageModelSerialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__AppleSpell_LanguageModeling___NLPLanguageModelWithType_forLanguageObject_waitForResult___block_invoke;
    block[3] = &unk_2640EF438;
    void block[5] = v11;
    block[6] = &v19;
    block[4] = v10;
    dispatch_sync(languageModelSerialQueue, block);
    if (objc_msgSend((id)v20[5], "isEqual:", objc_msgSend(MEMORY[0x263EFF9D0], "null")))
    {
      id v14 = 0;
      v20[5] = 0;
    }
    else
    {
      id v14 = (id)v20[5];
      if (!v14 && !_kSuppressLanguageModels)
      {
        if (v5)
        {
          id v14 = [(AppleSpell *)self _loadNLPLanguageModelWithType:a3 forLanguageObject:a4 onQueue:v12];
          v20[5] = (uint64_t)v14;
        }
        else
        {
          uint64_t v16 = [(AppleSpell *)self backgroundLoadingQueue];
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __90__AppleSpell_LanguageModeling___NLPLanguageModelWithType_forLanguageObject_waitForResult___block_invoke_2;
          v17[3] = &unk_2640EF610;
          v17[4] = self;
          v17[5] = a4;
          v17[6] = v12;
          void v17[7] = a3;
          dispatch_async(v16, v17);
          id v14 = (id)v20[5];
        }
      }
    }
  }
  else
  {
    id v14 = 0;
  }
  _Block_object_dispose(&v19, 8);
  return v14;
}

id __90__AppleSpell_LanguageModeling___NLPLanguageModelWithType_forLanguageObject_waitForResult___block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(a1 + 32) objectForKey:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = [MEMORY[0x263EFF9D0] null];
    uint64_t v5 = *(void *)(a1 + 40);
    return (id)[v3 setObject:v4 forKey:v5];
  }
  return result;
}

void __90__AppleSpell_LanguageModeling___NLPLanguageModelWithType_forLanguageObject_waitForResult___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x210556730]();
  [*(id *)(a1 + 32) _loadNLPLanguageModelWithType:*(void *)(a1 + 56) forLanguageObject:*(void *)(a1 + 40) onQueue:*(void *)(a1 + 48)];
}

- (id)characterLanguageModelForLanguageObject:(id)a3 waitForResult:(BOOL)a4
{
  return [(AppleSpell *)self _NLPLanguageModelWithType:1 forLanguageObject:a3 waitForResult:a4];
}

- (id)transformerLanguageModelForLanguageObject:(id)a3 waitForResult:(BOOL)a4
{
  return [(AppleSpell *)self _NLPLanguageModelWithType:2 forLanguageObject:a3 waitForResult:a4];
}

- (id)sentencePieceLanguageModelForLanguageObject:(id)a3 waitForResult:(BOOL)a4
{
  return [(AppleSpell *)self _NLPLanguageModelWithType:3 forLanguageObject:a3 waitForResult:a4];
}

- (id)transformerOrSiriLanguageModelForLanguageObject:(id)a3 appIdentifier:(id)a4 waitForResult:(BOOL)a5
{
  BOOL v5 = a5;
  if (a4)
  {
    if ([a4 isEqual:@"com.apple.SiriNCService"]) {
      uint64_t v8 = 4;
    }
    else {
      uint64_t v8 = 2;
    }
  }
  else
  {
    uint64_t v8 = 2;
  }
  return [(AppleSpell *)self _NLPLanguageModelWithType:v8 forLanguageObject:a3 waitForResult:v5];
}

- (unint64_t)_resetLanguageModels
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  languageModelSerialQueue = self->_languageModelSerialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__AppleSpell_LanguageModeling___resetLanguageModels__block_invoke;
  v5[3] = &unk_2640EF638;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(languageModelSerialQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__AppleSpell_LanguageModeling___resetLanguageModels__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "distantFuture"), "timeIntervalSinceReferenceDate");
  *(void *)(*(void *)(a1 + 32) + 128) = v2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 56);
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v17 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = (void *)[v7 objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * j)];
              if ((objc_msgSend(v12, "isEqual:", objc_msgSend(MEMORY[0x263EFF9D0], "null")) & 1) == 0)
              {
                [v12 reset];
                ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v9);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }
  uint64_t result = [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1 + 32) + 128) = v14;
  return result;
}

- (void)_releaseLanguageModels
{
  languageModelSerialQueue = self->_languageModelSerialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__AppleSpell_LanguageModeling___releaseLanguageModels__block_invoke;
  block[3] = &unk_2640EF4B0;
  block[4] = self;
  dispatch_sync(languageModelSerialQueue, block);
}

uint64_t __54__AppleSpell_LanguageModeling___releaseLanguageModels__block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "distantFuture"), "timeIntervalSinceReferenceDate");
  *(void *)(*(void *)(a1 + 32) + 136) = v2;
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  uint64_t result = [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1 + 32) + 136) = v4;
  return result;
}

- (void)resetLanguageModels
{
}

- (void)releaseLanguageModels
{
}

- (void)_addLanguageModelCompletionsForPrefix:(id)a3 languageModel:(id)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 capitalized:(BOOL)a8 candidates:(id)a9
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v16 = [a3 lowercaseString];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __140__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPrefix_languageModel_languageObject_connection_sender_capitalized_candidates___block_invoke;
  v19[3] = &unk_2640EF660;
  v19[10] = &v25;
  v19[11] = &v21;
  v19[4] = self;
  v19[5] = a4;
  v19[12] = a6;
  v19[6] = a5;
  v19[7] = a7;
  BOOL v20 = a8;
  v19[8] = a3;
  v19[9] = a9;
  [a4 enumerateCompletionEntriesForPrefix:v16 maxCompletions:_kMaxCompletionsToExamine withBlock:v19];
  if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend(a3, "lowercaseString")) & 1) == 0)
  {
    v22[3] = 0;
    v26[3] = 0;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __140__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPrefix_languageModel_languageObject_connection_sender_capitalized_candidates___block_invoke_2;
    v17[3] = &unk_2640EF660;
    v17[10] = &v25;
    v17[11] = &v21;
    v17[4] = self;
    v17[5] = a4;
    v17[12] = a6;
    v17[6] = a5;
    void v17[7] = a7;
    BOOL v18 = a8;
    void v17[8] = a3;
    v17[9] = a9;
    [a4 enumerateCompletionEntriesForPrefix:a3 maxCompletions:_kMaxCompletionsToExamine withBlock:v17];
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

uint64_t __140__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPrefix_languageModel_languageObject_connection_sender_capitalized_candidates___block_invoke(uint64_t result, uint64_t a2, int a3, unsigned char *a4)
{
  uint64_t v5 = result;
  int v8 = a3;
  if (*(void *)(*(void *)(*(void *)(result + 80) + 8) + 24) < (unint64_t)_kMaxCompletionsToExamine
    && *(void *)(*(void *)(*(void *)(result + 88) + 8) + 24) < (unint64_t)_kMaxCompletionsToAdd)
  {
    LOBYTE(v7) = *(unsigned char *)(result + 104);
    uint64_t result = [*(id *)(result + 32) _stringForTokenIDs:&v8 tokenCount:1 entryString:a2 languageModel:*(void *)(result + 40) languageObject:*(void *)(result + 48) connection:*(void *)(result + 96) sender:*(void *)(result + 56) prefix:*(void *)(result + 64) capitalized:v7];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t result = [*(id *)(v5 + 72) containsObject:result];
      if ((result & 1) == 0)
      {
        uint64_t result = [*(id *)(v5 + 72) addObject:v6];
        ++*(void *)(*(void *)(*(void *)(v5 + 88) + 8) + 24);
      }
    }
  }
  if (++*(void *)(*(void *)(*(void *)(v5 + 80) + 8) + 24) >= (unint64_t)_kMaxCompletionsToExamine
    || *(void *)(*(void *)(*(void *)(v5 + 88) + 8) + 24) >= (unint64_t)_kMaxCompletionsToAdd)
  {
    *a4 = 1;
  }
  return result;
}

uint64_t __140__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPrefix_languageModel_languageObject_connection_sender_capitalized_candidates___block_invoke_2(uint64_t result, uint64_t a2, int a3, unsigned char *a4)
{
  uint64_t v5 = result;
  int v8 = a3;
  if (*(void *)(*(void *)(*(void *)(result + 80) + 8) + 24) < (unint64_t)_kMaxCompletionsToExamine
    && *(void *)(*(void *)(*(void *)(result + 88) + 8) + 24) < (unint64_t)_kMaxCompletionsToAdd)
  {
    LOBYTE(v7) = *(unsigned char *)(result + 104);
    uint64_t result = [*(id *)(result + 32) _stringForTokenIDs:&v8 tokenCount:1 entryString:a2 languageModel:*(void *)(result + 40) languageObject:*(void *)(result + 48) connection:*(void *)(result + 96) sender:*(void *)(result + 56) prefix:*(void *)(result + 64) capitalized:v7];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t result = [*(id *)(v5 + 72) containsObject:result];
      if ((result & 1) == 0)
      {
        uint64_t result = [*(id *)(v5 + 72) addObject:v6];
        ++*(void *)(*(void *)(*(void *)(v5 + 88) + 8) + 24);
      }
    }
  }
  if (++*(void *)(*(void *)(*(void *)(v5 + 80) + 8) + 24) >= (unint64_t)_kMaxCompletionsToExamine
    || *(void *)(*(void *)(*(void *)(v5 + 88) + 8) + 24) >= (unint64_t)_kMaxCompletionsToAdd)
  {
    *a4 = 1;
  }
  return result;
}

- (id)languageModelCompletionsForPartialWord:(id)a3 languageObject:(id)a4 sender:(id)a5 appIdentifier:(id)a6
{
  uint64_t v11 = (void *)[MEMORY[0x263EFF980] array];
  id v12 = [(AppleSpell *)self _standardizedLanguageModelStringForString:a3];
  uint64_t v13 = [(AppleSpell *)self databaseConnectionForLanguageObject:a4];
  id v14 = [(AppleSpell *)self wordLanguageModelForLanguageObject:a4 appIdentifier:a6 waitForResult:1];
  if (v14 && v12)
  {
    id v15 = v14;
    if ([a4 isKorean])
    {
      id v12 = [(AppleSpell *)self internalStringForKoreanExternalString:v12];
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = objc_msgSend(v12, "isEqualToString:", objc_msgSend(v12, "capitalizedString"));
    }
    [(AppleSpell *)self _addLanguageModelCompletionsForPrefix:v12 languageModel:v15 languageObject:a4 connection:v13 sender:a5 capitalized:v16 candidates:v11];
  }
  return v11;
}

- (BOOL)_addLanguageModelCompletionsForPartialWordRange:(_NSRange)a3 languageObject:(id)a4 connection:(_PR_DB_IO *)a5 sender:(id)a6 tagger:(id)a7 appIdentifier:(id)a8 waitForLanguageModel:(BOOL)a9 allowTransformer:(BOOL)a10 candidates:(id)a11 scoreDictionary:(id)a12 tryTransliteration:(BOOL *)a13
{
  uint64_t v56 = a5;
  id v57 = a6;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v58 = a8;
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v59 = a7;
  long long v17 = (void *)[a7 string];
  id v53 = v17;
  NSUInteger v55 = location;
  if (length) {
    id v18 = -[AppleSpell _standardizedLanguageModelStringForString:](self, "_standardizedLanguageModelStringForString:", objc_msgSend(v17, "substringWithRange:", location, length));
  }
  else {
    id v18 = 0;
  }
  id v19 = v58;
  id v60 = [(AppleSpell *)self wordLanguageModelForLanguageObject:a4 appIdentifier:v58 waitForResult:a9];
  MEMORY[0x270FA5388](v60);
  uint64_t v21 = (char *)&v48 - ((v20 + 19) & 0xFFFFFFFFFFFFFFF0);
  int v76 = 1;
  unint64_t v75 = 0;
  long long v73 = xmmword_20CC61990;
  long long v74 = xmmword_20CC61990;
  int v22 = [a4 isArabic];
  BOOL v23 = [(AppleSpell *)self useSentencePieceLanguageModelForLanguageObject:a4 tagger:v59 appIdentifier:v19];
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  v72[3] = 0;
  uint64_t v68 = 0;
  id v69 = &v68;
  uint64_t v70 = 0x2020000000;
  uint64_t v71 = 0;
  if (_addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration__onceToken != -1) {
    dispatch_once(&_addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration__onceToken, &__block_literal_global_131);
  }
  if (a13) {
    *a13 = 0;
  }
  if (v60)
  {
    BOOL v24 = v23;
    int v50 = v22;
    uint64_t v25 = v21;
    NSUInteger v26 = v55;
    unint64_t v51 = -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](self, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", v55, length, a4, v59, v60, _kMaxContextLength, v21, &v75, &v73, &v74, &v76);
    uint64_t v28 = v56;
    id v27 = v57;
    if (*((void *)&v73 + 1))
    {
      unint64_t v29 = (void *)[v59 string];
      id v49 = (__CFString *)objc_msgSend(v29, "substringWithRange:", (void)v73, *((void *)&v73 + 1));
      if (v18)
      {
LABEL_11:
        if ([a4 isKorean])
        {
          id v18 = [(AppleSpell *)self internalStringForKoreanExternalString:v18];
LABEL_18:
          unsigned int v54 = 0;
          goto LABEL_19;
        }
        unsigned int v54 = objc_msgSend(v18, "isEqualToString:", objc_msgSend(v18, "capitalizedString"));
        goto LABEL_19;
      }
    }
    else
    {
      id v49 = &stru_26C1C71A8;
      if (v18) {
        goto LABEL_11;
      }
    }
    if (!v51)
    {
      id v18 = 0;
      goto LABEL_18;
    }
    id v18 = 0;
    unsigned int v54 = *(_DWORD *)&v25[4 * v51 - 4] == 1;
LABEL_19:
    id v52 = a12;
    if (_kMaxTokensPerPrediction)
    {
      if (a10)
      {
        if (_kMaxPredictionSampleCount)
        {
          if ([(AppleSpell *)self useTransformerLanguageModelForLanguageObject:a4 tagger:v59 appIdentifier:v58])
          {
            id v30 = [(AppleSpell *)self transformerOrSiriLanguageModelForLanguageObject:a4 appIdentifier:v58 waitForResult:0];
            if (v30)
            {
              uint64_t v31 = (void *)[v30 stateWithContext:v49];
              if (v31)
              {
                v66[0] = MEMORY[0x263EF8330];
                v66[1] = 3221225472;
                v66[2] = __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_2;
                v66[3] = &unk_2640EF688;
                v66[4] = self;
                v66[5] = v60;
                v66[12] = &v68;
                v66[13] = v28;
                v66[6] = a4;
                v66[7] = v27;
                char v67 = v54;
                v66[8] = v18;
                v66[9] = a11;
                v66[11] = v72;
                v66[10] = v52;
                [v31 enumeratePredictions:_kMaxPredictionSampleCount maxTokensPerPrediction:1 withBlock:v66];
              }
            }
          }
        }
      }
      if (v24)
      {
        id v32 = [(AppleSpell *)self sentencePieceLanguageModelForLanguageObject:a4 waitForResult:0];
        if (v32)
        {
          uint64_t v33 = (void *)[v32 stateWithContext:v49];
          if (v33)
          {
            v64[0] = MEMORY[0x263EF8330];
            v64[1] = 3221225472;
            v64[2] = __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_3;
            v64[3] = &unk_2640EF688;
            v64[4] = self;
            v64[5] = v60;
            v64[12] = &v68;
            v64[13] = v28;
            v64[6] = a4;
            v64[7] = v27;
            char v65 = v54;
            v64[8] = v18;
            v64[9] = a11;
            v64[11] = v72;
            v64[10] = v52;
            [v33 enumeratePredictions:_kMaxPredictionsToExamine maxTokensPerPrediction:_kMaxTokensPerPrediction withBlock:v64];
          }
        }
      }
      unint64_t v34 = v69[3];
      if (!v34 || v34 < _kMaxPredictionSampleCount)
      {
        v61[0] = MEMORY[0x263EF8330];
        if (v51 <= v75) {
          NSUInteger v35 = 0;
        }
        else {
          NSUInteger v35 = &v25[4 * v75];
        }
        if (v51 >= v75) {
          unint64_t v36 = v51 - v75;
        }
        else {
          unint64_t v36 = 0;
        }
        v61[1] = 3221225472;
        v61[2] = __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_4;
        v61[3] = &unk_2640EF6D8;
        v61[4] = self;
        v61[5] = v60;
        v61[12] = &v68;
        v61[13] = v28;
        v61[6] = a4;
        v61[7] = v27;
        char v62 = v54;
        v61[8] = v18;
        v61[9] = a11;
        v61[11] = v72;
        v61[10] = v52;
        char v63 = v50;
        [v60 enumeratePredictionsForContext:v35 length:v36 maxPredictions:_kMaxPredictionsToExamine maxTokensPerPrediction:_kMaxTokensPerPrediction withBlock:v61];
      }
    }
    if (v18) {
      [(AppleSpell *)self _addLanguageModelCompletionsForPrefix:v18 languageModel:v60 languageObject:a4 connection:v28 sender:v27 capitalized:v54 candidates:a11];
    }
    if (*((void *)&v74 + 1))
    {
      if (*((void *)&v74 + 1) + (void)v74 <= v26)
      {
        uint64_t v37 = objc_msgSend(v53, "substringWithRange:", (void)v74, v26 - (void)v74);
        unint64_t v38 = [v37 length];
        uint64_t v39 = [a11 count];
        if (v39)
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            uint64_t v41 = [a11 objectAtIndex:i];
            id v42 = -[AppleSpell phraseMatching:inLexiconForLanguageObject:](self, "phraseMatching:inLexiconForLanguageObject:", [v37 stringByAppendingString:v41], a4);
            _NSRange v43 = v42;
            if (v42)
            {
              if ([v42 hasPrefix:v37])
              {
                if ([v43 length] > v38)
                {
                  id v44 = (void *)[v43 substringFromIndex:v38];
                  if (([v44 isEqualToString:v41] & 1) == 0
                    && objc_msgSend((id)objc_msgSend(v44, "lowercaseString"), "isEqualToString:", v41)
                    && ([a11 containsObject:v44] & 1) == 0)
                  {
                    uint64_t v45 = [v52 objectForKey:v41];
                    if (v45)
                    {
                      [v52 setObject:v45 forKey:v44];
                      [v52 removeObjectForKey:v41];
                    }
                    [a11 replaceObjectAtIndex:i withObject:v44];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  BOOL v46 = v60 != 0;
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(v72, 8);
  return v46;
}

uint64_t __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26C1D3270];
  _addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration__transliterationExceptionSet = result;
  return result;
}

uint64_t __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_2(uint64_t result, uint64_t a2, unsigned char *a3, double a4)
{
  uint64_t v5 = result;
  if (*(void *)(*(void *)(*(void *)(result + 88) + 8) + 24) < (unint64_t)_kMaxPredictionsToExamine
    && *(void *)(*(void *)(*(void *)(result + 96) + 8) + 24) < (unint64_t)_kMaxPredictionsToAdd)
  {
    LOBYTE(v8) = *(unsigned char *)(result + 112);
    uint64_t result = [*(id *)(result + 32) _stringForCompletion:a2 languageModel:*(void *)(result + 40) languageObject:*(void *)(result + 48) connection:*(void *)(result + 104) sender:*(void *)(result + 56) prefix:*(void *)(result + 64) capitalized:v8];
    if (result)
    {
      uint64_t v7 = result;
      uint64_t result = [*(id *)(v5 + 72) containsObject:result];
      if ((result & 1) == 0)
      {
        [*(id *)(v5 + 72) addObject:v7];
        uint64_t result = objc_msgSend(*(id *)(v5 + 80), "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a4), v7);
        ++*(void *)(*(void *)(*(void *)(v5 + 96) + 8) + 24);
      }
    }
  }
  if (++*(void *)(*(void *)(*(void *)(v5 + 88) + 8) + 24) >= (unint64_t)_kMaxPredictionsToExamine
    || *(void *)(*(void *)(*(void *)(v5 + 96) + 8) + 24) >= (unint64_t)_kMaxPredictionsToAdd)
  {
    *a3 = 1;
  }
  return result;
}

uint64_t __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_3(uint64_t result, uint64_t a2, unsigned char *a3, double a4)
{
  uint64_t v5 = result;
  if (*(void *)(*(void *)(*(void *)(result + 88) + 8) + 24) < (unint64_t)_kMaxPredictionsToExamine
    && *(void *)(*(void *)(*(void *)(result + 96) + 8) + 24) < (unint64_t)_kMaxPredictionsToAdd)
  {
    LOBYTE(v8) = *(unsigned char *)(result + 112);
    uint64_t result = [*(id *)(result + 32) _stringForCompletion:a2 languageModel:*(void *)(result + 40) languageObject:*(void *)(result + 48) connection:*(void *)(result + 104) sender:*(void *)(result + 56) prefix:*(void *)(result + 64) capitalized:v8];
    if (result)
    {
      uint64_t v7 = result;
      uint64_t result = [*(id *)(v5 + 72) containsObject:result];
      if ((result & 1) == 0)
      {
        [*(id *)(v5 + 72) addObject:v7];
        uint64_t result = objc_msgSend(*(id *)(v5 + 80), "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a4), v7);
        ++*(void *)(*(void *)(*(void *)(v5 + 96) + 8) + 24);
      }
    }
  }
  if (++*(void *)(*(void *)(*(void *)(v5 + 88) + 8) + 24) >= (unint64_t)_kMaxPredictionsToExamine
    || *(void *)(*(void *)(*(void *)(v5 + 96) + 8) + 24) >= (unint64_t)_kMaxPredictionsToAdd)
  {
    *a3 = 1;
  }
  return result;
}

void __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, double a5)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) >= (unint64_t)_kMaxPredictionsToExamine
    || *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) >= (unint64_t)_kMaxPredictionsToAdd)
  {
    uint64_t v10 = 0;
  }
  else
  {
    LOBYTE(v15) = *(unsigned char *)(a1 + 112);
    uint64_t v10 = [*(id *)(a1 + 32) _stringForTokenIDs:a2 tokenCount:a3 entryString:0 languageModel:*(void *)(a1 + 40) languageObject:*(void *)(a1 + 48) connection:*(void *)(a1 + 104) sender:*(void *)(a1 + 56) prefix:*(void *)(a1 + 64) capitalized:v15];
    if (v10 && ([*(id *)(a1 + 72) containsObject:v10] & 1) == 0)
    {
      [*(id *)(a1 + 72) addObject:v10];
      objc_msgSend(*(id *)(a1 + 80), "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", a5), v10);
      ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
    }
  }
  if (++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) >= (unint64_t)_kMaxPredictionsToExamine
    || *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) >= (unint64_t)_kMaxPredictionsToAdd)
  {
    *a4 = 1;
  }
  else if (a3 == 1 && v10 && *(unsigned char *)(a1 + 113))
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3052000000;
    id v27 = __Block_byref_object_copy__0;
    uint64_t v28 = __Block_byref_object_dispose__0;
    uint64_t v29 = 0;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_5;
    v16[3] = &unk_2640EF6B0;
    id v19 = &v24;
    uint64_t v20 = a2;
    uint64_t v11 = *(void *)(a1 + 32);
    v16[4] = v10;
    v16[5] = v11;
    long long v12 = *(_OWORD *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 104);
    uint64_t v21 = 1;
    uint64_t v22 = v13;
    long long v14 = *(_OWORD *)(a1 + 56);
    long long v17 = v12;
    long long v18 = v14;
    char v23 = *(unsigned char *)(a1 + 112);
    [(id)v12 enumerateEntriesForString:v10 withBlock:v16];
    if (v25[5])
    {
      if ((objc_msgSend(*(id *)(a1 + 72), "containsObject:") & 1) == 0)
      {
        [*(id *)(a1 + 72) addObject:v25[5]];
        ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
        if (++*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) >= (unint64_t)_kMaxPredictionsToExamine
          || *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) >= (unint64_t)_kMaxPredictionsToAdd)
        {
          *a4 = 1;
        }
      }
    }
    _Block_object_dispose(&v24, 8);
  }
}

uint64_t __218__AppleSpell_LanguageModeling___addLanguageModelCompletionsForPartialWordRange_languageObject_connection_sender_tagger_appIdentifier_waitForLanguageModel_allowTransformer_candidates_scoreDictionary_tryTransliteration___block_invoke_5(uint64_t result, void *a2, int a3, unsigned char *a4)
{
  if (a2)
  {
    uint64_t v4 = result;
    if (**(_DWORD **)(result + 88) == a3)
    {
      uint64_t result = [a2 isEqualToString:*(void *)(result + 32)];
      if ((result & 1) == 0)
      {
        LOBYTE(v7) = *(unsigned char *)(v4 + 112);
        uint64_t result = [*(id *)(v4 + 40) _stringForTokenIDs:*(void *)(v4 + 88) tokenCount:*(void *)(v4 + 96) entryString:a2 languageModel:*(void *)(v4 + 48) languageObject:*(void *)(v4 + 56) connection:*(void *)(v4 + 104) sender:*(void *)(v4 + 64) prefix:*(void *)(v4 + 72) capitalized:v7];
        *(void *)(*(void *)(*(void *)(v4 + 80) + 8) + 40) = result;
        *a4 = 1;
      }
    }
  }
  return result;
}

- (BOOL)_getUnigramProbabilityForString:(id)a3 languageModel:(id)a4 probability:(double *)a5
{
  unint64_t v10 = 0xC03E000000000000;
  id v7 = [(AppleSpell *)self _standardizedLanguageModelStringForString:a3];
  if ([a4 getUnigramProbabilityForString:v7 probability:&v10])
  {
    int v8 = 1;
    if (!a5) {
      return v8;
    }
  }
  else
  {
    int v8 = objc_msgSend(a4, "getUnigramProbabilityForString:probability:", objc_msgSend(v7, "lowercaseString"), &v10);
    if (!a5) {
      return v8;
    }
  }
  if (v8) {
    *(void *)a5 = v10;
  }
  return v8;
}

- (id)_rankedCandidatesForRange:(_NSRange)a3 candidates:(id)a4 languageObject:(id)a5 tagger:(id)a6 appIdentifier:(id)a7 allowTransformer:(BOOL)a8 scoreDictionary:(id)a9
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  BOOL v83 = a8;
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v69 = a7;
  id v15 = [(AppleSpell *)self wordLanguageModelForLanguageObject:a5 appIdentifier:a7 waitForResult:0];
  MEMORY[0x270FA5388](v15);
  long long v17 = (char *)&v67 - ((v16 + 23) & 0xFFFFFFFFFFFFFFF0);
  long long v96 = xmmword_20CC61990;
  id v80 = a4;
  unint64_t v78 = [a4 count];
  unint64_t v95 = 0;
  unint64_t v75 = v17;
  uint64_t v84 = self;
  id v82 = a5;
  unint64_t v77 = -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](self, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", location, length, a5, a6, v15, _kMaxContextLength, v17, &v95, &v96, 0, 0);
  if (*((void *)&v96 + 1))
  {
    long long v18 = (void *)[a6 string];
    uint64_t v71 = (__CFString *)objc_msgSend(v18, "substringWithRange:", (void)v96, *((void *)&v96 + 1));
  }
  else
  {
    uint64_t v71 = &stru_26C1C71A8;
  }
  id v19 = a9;
  uint64_t v20 = v82;
  int v76 = [(AppleSpell *)v84 useUnigramProbabilityForLanguageObject:v82];
  int v74 = [v20 isArabic];
  id v21 = v69;
  if (v83)
  {
    unint64_t v22 = [v80 count];
    BOOL v23 = 0;
    if (v22 >= 2 && _kMaxCompletionRescoreCount) {
      BOOL v23 = [(AppleSpell *)v84 useTransformerLanguageModelForLanguageObject:v82 tagger:a6 appIdentifier:v21];
    }
  }
  else
  {
    BOOL v23 = 0;
  }
  BOOL v68 = v23;
  if ([(AppleSpell *)v84 useSentencePieceLanguageModelForLanguageObject:v82 tagger:a6 appIdentifier:v21]&& (id v24 = [(AppleSpell *)v84 sentencePieceLanguageModelForLanguageObject:v82 waitForResult:0]) != 0)
  {
    id v70 = v24;
    uint64_t v25 = (void *)[v24 stateWithContext:v71];
    uint64_t v26 = (void *)[NSDictionary dictionaryWithDictionary:a9];
    if (v25) {
      uint64_t v25 = (void *)[v25 conditionalProbabilityDictionaryForStrings:v80];
    }
  }
  else
  {
    uint64_t v26 = (void *)[NSDictionary dictionaryWithDictionary:a9];
    id v70 = 0;
    uint64_t v25 = 0;
  }
  [a9 removeAllObjects];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v27 = [v80 countByEnumeratingWithState:&v91 objects:v98 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v79 = 0;
    uint64_t v81 = *(void *)v92;
    int v29 = v76;
    if (!v15) {
      int v29 = 1;
    }
    BOOL v83 = v29;
    unint64_t v72 = v77 + 1;
    double v30 = (double)v78;
    long long v73 = v25;
    do
    {
      uint64_t v31 = 0;
      unint64_t v78 = v28;
      do
      {
        if (*(void *)v92 != v81) {
          objc_enumerationMutation(v80);
        }
        uint64_t v32 = *(void *)(*((void *)&v91 + 1) + 8 * v31);
        uint64_t v33 = [(AppleSpell *)v84 _tokenIDForString:v32 languageModel:v15 languageObject:v82 terminatorTokenID:0];
        unint64_t v34 = (void *)[v26 objectForKey:v32];
        if (v25)
        {
          NSUInteger v35 = (void *)[v25 objectForKey:v32];
          double v90 = 0.0;
          if (v35) {
            char v36 = v83;
          }
          else {
            char v36 = 1;
          }
          if ((v36 & 1) == 0)
          {
            [v35 doubleValue];
            double v90 = v37;
            uint64_t v38 = [NSString stringWithFormat:@"%@ %@", v71, v32];
            if ([v70 stringIsBlocklisted:v38]) {
              goto LABEL_53;
            }
            goto LABEL_43;
          }
        }
        else
        {
          double v90 = 0.0;
        }
        char v39 = v83;
        if (!v33) {
          char v39 = 1;
        }
        if (v39)
        {
          if (v76) {
            [(AppleSpell *)v84 _getUnigramProbabilityForString:v32 languageModel:v15 probability:&v90];
          }
LABEL_43:
          if (v34)
          {
            [v34 doubleValue];
            double v49 = v48;
            double v50 = v90;
            if (v49 < 0.0 && v49 > v90)
            {
              double v90 = v49;
              double v50 = v49;
            }
          }
          else
          {
            double v50 = v90;
          }
          if (v50 >= 0.0) {
            double v90 = -30.0 - (double)(unint64_t)(v79 + v31) / v30;
          }
          objc_msgSend(v19, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:"), v32);
          goto LABEL_53;
        }
        uint64_t v40 = v26;
        id v41 = v19;
        id v42 = v75;
        _NSRange v43 = v15;
        unint64_t v44 = v77;
        if (v77 <= v95) {
          uint64_t v45 = 0;
        }
        else {
          uint64_t v45 = &v75[4 * v95];
        }
        if (v77 >= v95) {
          unint64_t v46 = v77 - v95;
        }
        else {
          unint64_t v46 = 0;
        }
        [v43 getConditionalProbabilityForTokenID:v33 context:v45 length:v46 probability:&v90];
        *(_DWORD *)&v42[4 * v44] = v33;
        id v15 = v43;
        char v47 = [v43 tokenSequenceIsBlocklisted:v42 length:v72];
        if (v74)
        {
          double v89 = 0.0;
          [(AppleSpell *)v84 _getUnigramProbabilityForString:v32 languageModel:v43 probability:&v89];
          double v90 = v90 + v89 * 0.000001;
        }
        id v19 = v41;
        uint64_t v26 = v40;
        uint64_t v25 = v73;
        uint64_t v28 = v78;
        if ((v47 & 1) == 0) {
          goto LABEL_43;
        }
LABEL_53:
        ++v31;
      }
      while (v28 != v31);
      uint64_t v28 = [v80 countByEnumeratingWithState:&v91 objects:v98 count:16];
      v79 += v31;
    }
    while (v28);
  }
  id v52 = (void *)[v19 keysSortedByValueUsingComparator:&__block_literal_global_373];
  id v53 = v52;
  if (v68 && (unint64_t)[v52 count] >= 2)
  {
    id v54 = [(AppleSpell *)v84 transformerOrSiriLanguageModelForLanguageObject:v82 appIdentifier:v69 waitForResult:0];
    if (v54)
    {
      uint64_t v55 = [v54 stateWithContext:v71];
      if (v55)
      {
        uint64_t v56 = (void *)v55;
        unint64_t v57 = [v53 count];
        uint64_t v58 = (uint64_t)v53;
        if (v57 > _kMaxCompletionRescoreCount) {
          uint64_t v58 = [v53 subarrayWithRange:0];
        }
        id v59 = (void *)[v56 conditionalProbabilityDictionaryForStrings:v58];
        id v60 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", objc_msgSend(v59, "keysSortedByValueUsingComparator:", &__block_literal_global_373));
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        uint64_t v61 = [v53 countByEnumeratingWithState:&v85 objects:v97 count:16];
        if (v61)
        {
          uint64_t v62 = v61;
          uint64_t v63 = *(void *)v86;
          do
          {
            for (uint64_t i = 0; i != v62; ++i)
            {
              if (*(void *)v86 != v63) {
                objc_enumerationMutation(v53);
              }
              uint64_t v65 = *(void *)(*((void *)&v85 + 1) + 8 * i);
              if (([v60 containsObject:v65] & 1) == 0) {
                [v60 addObject:v65];
              }
            }
            uint64_t v62 = [v53 countByEnumeratingWithState:&v85 objects:v97 count:16];
          }
          while (v62);
        }
        return v60;
      }
    }
  }
  return v53;
}

- (void)getParameterValue:(double *)a3 forName:(id)a4 languageObject:(id)a5 tagger:(id)a6 appIdentifier:(id)a7 parameterBundles:(id)a8 defaultValue:(double)a9
{
  if (!a8
    || (uint64_t v17 = objc_msgSend(a8, "objectForKey:", objc_msgSend(a5, "identifier"))) == 0
    && (uint64_t v17 = objc_msgSend(a8, "objectForKey:", objc_msgSend(a5, "languageModelLocalization"))) == 0
    && (uint64_t v17 = objc_msgSend(a8, "objectForKey:", objc_msgSend(a5, "languageModelFallbackLocalization"))) == 0
    || (id v18 = (id)[objc_alloc(MEMORY[0x263F14030]) initWithDictionaryRepresentation:v17 error:0]) == 0|| (objc_msgSend(v18, "getContinuousParameterValueForName:value:", a4, a3) & 1) == 0)
  {
    if (_kMaxCorrectionRescoreCount
      && [(AppleSpell *)self useTransformerLanguageModelForLanguageObject:a5 tagger:a6 appIdentifier:a7])
    {
      id v19 = [(AppleSpell *)self transformerParameterBundleForLanguageObject:a5];
      if (!v19) {
        goto LABEL_10;
      }
    }
    else
    {
      id v19 = [(AppleSpell *)self parameterBundleForLanguageObject:a5];
      if (!v19)
      {
LABEL_10:
        if (!a3) {
          return;
        }
LABEL_15:
        *a3 = a9;
        return;
      }
    }
    char v20 = [v19 getContinuousParameterValueForName:a4 value:a3];
    if (a3 && (v20 & 1) == 0) {
      goto LABEL_15;
    }
  }
}

- (id)_languageModelStateScoresForCandidateList:(id)a3 languageModel:(id)a4 state:(id)a5 language:(id)a6 tagger:(id)a7
{
  id v36 = a6;
  id v35 = a4;
  unint64_t v34 = self;
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v10 = [a3 defaultReplacementRange];
  id v37 = a5;
  if (!a5) {
    return 0;
  }
  uint64_t v12 = v10;
  uint64_t v13 = v11;
  long long v14 = (void *)[MEMORY[0x263EFF980] array];
  id v31 = (id)[MEMORY[0x263EFF9A0] dictionary];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v38 = (id)[a3 candidates];
  uint64_t v15 = [v38 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v42;
    long long v32 = xmmword_20CC61990;
    uint64_t v33 = v14;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v38);
        }
        id v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        uint64_t v20 = [v19 replacementRange];
        double v40 = 0.0;
        if (v12 == v20 && v13 == v21)
        {
          objc_msgSend(v14, "addObject:", objc_msgSend(v19, "string"));
        }
        else
        {
          long long v39 = v32;
          MEMORY[0x270FA5388](v20);
          -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](v34, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", (char *)&v30 - ((v23 + 19) & 0xFFFFFFFFFFFFFFF0), 0, &v39, 0, 0);
          if (*((void *)&v39 + 1))
          {
            id v24 = (void *)[a7 string];
            uint64_t v25 = (__CFString *)objc_msgSend(v24, "substringWithRange:", (void)v39, *((void *)&v39 + 1));
          }
          else
          {
            uint64_t v25 = &stru_26C1C71A8;
          }
          if (objc_msgSend((id)objc_msgSend(v37, "languageModel"), "getConditionalProbabilityForString:context:probability:", objc_msgSend(v19, "string"), v25, &v40))
          {
            uint64_t v26 = [NSNumber numberWithDouble:v40];
            uint64_t v27 = [v19 string];
            [v31 setObject:v26 forKey:v27];
          }
          long long v14 = v33;
        }
      }
      uint64_t v16 = [v38 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v16);
  }
  if ([v14 count])
  {
    uint64_t v28 = [v37 conditionalProbabilityDictionaryForStrings:v14];
    [v31 addEntriesFromDictionary:v28];
  }
  return v31;
}

- (id)_rankedCandidatesForCandidateList:(id)a3 languageObject:(id)a4 tagger:(id)a5 appIdentifier:(id)a6 parameterBundles:(id)a7
{
  v198 = (char *)a7;
  uint64_t v245 = *MEMORY[0x263EF8340];
  uint64_t v164 = [MEMORY[0x263EFF980] array];
  uint64_t v12 = [a3 defaultReplacementRange];
  uint64_t v14 = v13;
  long long v169 = xmmword_20CC61990;
  long long v237 = xmmword_20CC61990;
  id v165 = a6;
  id v15 = [(AppleSpell *)self wordLanguageModelForLanguageObject:a4 appIdentifier:a6 waitForResult:0];
  long long v163 = v161;
  MEMORY[0x270FA5388](v15);
  uint64_t v17 = &v161[-((v16 + 19) & 0xFFFFFFFFFFFFFFF0)];
  id v166 = a3;
  id v197 = (id)[a3 count];
  unint64_t v236 = 0;
  long long v171 = v17;
  id v18 = self;
  id v19 = self;
  uint64_t v181 = v14;
  long long v182 = (char *)v12;
  id v20 = a4;
  id v199 = v15;
  unint64_t v172 = -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](v19, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", v12, v14, a4, a5, v15, _kMaxContextLength, v17, &v236, &v237, 0, 0);
  if (*((void *)&v237 + 1))
  {
    uint64_t v21 = (void *)[a5 string];
    long long v175 = (__CFString *)[v21 substringWithRange:v237];
  }
  else
  {
    long long v175 = &stru_26C1C71A8;
  }
  int v176 = (unint64_t)[v166 count] < 2
      || [(AppleSpell *)v18 useUnigramProbabilityForLanguageObject:a4];
  unint64_t v22 = [v166 count];
  BOOL v23 = 0;
  if (v22 >= 2 && _kMaxCorrectionRescoreCount) {
    BOOL v23 = [(AppleSpell *)v18 useTransformerLanguageModelForLanguageObject:a4 tagger:a5 appIdentifier:v165];
  }
  BOOL v162 = v23;
  BOOL v24 = 0;
  if ((unint64_t)[v166 count] >= 2 && _kUseCharacterLanguageModels) {
    BOOL v24 = [(AppleSpell *)v18 useCharacterLanguageModelForLanguageObject:a4 tagger:a5 appIdentifier:v165];
  }
  id v25 = a4;
  BOOL v26 = [(AppleSpell *)v18 useSentencePieceLanguageModelForLanguageObject:a4 tagger:a5 appIdentifier:v165];
  id v174 = 0;
  id v27 = 0;
  double v235 = 0.0;
  double v234 = 0.0;
  double v233 = 0.0;
  double v232 = 0.0;
  double v231 = 0.0;
  id v177 = a5;
  LODWORD(v196) = v26;
  if (v26)
  {
    id v28 = [(AppleSpell *)v18 sentencePieceLanguageModelForLanguageObject:a4 waitForResult:0];
    if (v28)
    {
      id v174 = v28;
      uint64_t v29 = [v28 stateWithContext:v175];
      if (v29)
      {
        a5 = v177;
        id v27 = [(AppleSpell *)v18 _languageModelStateScoresForCandidateList:v166 languageModel:v199 state:v29 language:a4 tagger:v177];
        goto LABEL_19;
      }
    }
    else
    {
      id v174 = 0;
    }
    id v27 = 0;
    a5 = v177;
  }
LABEL_19:
  id v30 = v165;
  id v31 = v198;
  [(AppleSpell *)v18 getParameterValue:&v235 forName:*MEMORY[0x263F13F20] languageObject:v20 tagger:a5 appIdentifier:v165 parameterBundles:v198 defaultValue:1.0];
  [(AppleSpell *)v18 getParameterValue:&v234 forName:*MEMORY[0x263F13F10] languageObject:v20 tagger:a5 appIdentifier:v30 parameterBundles:v31 defaultValue:0.0];
  [(AppleSpell *)v18 getParameterValue:&v233 forName:*MEMORY[0x263F13F18] languageObject:v20 tagger:a5 appIdentifier:v30 parameterBundles:v31 defaultValue:0.0];
  [(AppleSpell *)v18 getParameterValue:&v232 forName:@"StandaloneLexiconWeight" languageObject:v20 tagger:a5 appIdentifier:v30 parameterBundles:v31 defaultValue:1.0];
  [(AppleSpell *)v18 getParameterValue:&v231 forName:@"TransformerLanguageModelWeight" languageObject:v20 tagger:a5 appIdentifier:v30 parameterBundles:v31 defaultValue:1.0];
  if (v234 > 0.0 && v24)
  {
    id v33 = -[AppleSpell characterLanguageModelForLanguageObject:waitForResult:](v18, "characterLanguageModelForLanguageObject:waitForResult:", v20, 0, v234);
    id v34 = v20;
    if (v33 && (uint64_t v35 = [v33 stateWithContext:v175]) != 0) {
      id v36 = [(AppleSpell *)v18 _languageModelStateScoresForCandidateList:v166 languageModel:v199 state:v35 language:v25 tagger:v177];
    }
    else {
      id v36 = 0;
    }
  }
  else
  {
    id v36 = 0;
    id v34 = v20;
  }
  long long v229 = 0u;
  long long v230 = 0u;
  long long v227 = 0u;
  long long v228 = 0u;
  id v179 = (id)[v166 candidates];
  uint64_t v37 = [v179 countByEnumeratingWithState:&v227 objects:v244 count:16];
  v186 = v36;
  uint64_t v188 = v37;
  if (v37)
  {
    uint64_t v187 = *(void *)v228;
    if (v199) {
      int v38 = v176;
    }
    else {
      int v38 = 1;
    }
    unint64_t v39 = 0;
    int v173 = v38;
    int v180 = v38 | v196 ^ 1;
    unint64_t v170 = v172 + 1;
    double v40 = (double)(unint64_t)v197;
    long long v178 = v27;
    do
    {
      uint64_t v41 = 0;
      do
      {
        if (*(void *)v228 != v187)
        {
          uint64_t v42 = v41;
          objc_enumerationMutation(v179);
          uint64_t v41 = v42;
        }
        uint64_t v191 = v41;
        long long v43 = *(void **)(*((void *)&v227 + 1) + 8 * v41);
        unint64_t v44 = [v43 numberOfWords];
        v198 = (char *)[v43 replacementRange];
        uint64_t v46 = v45;
        id v194 = v43;
        if (v36) {
          id v190 = (id)objc_msgSend(v36, "objectForKey:", objc_msgSend(v43, "string"));
        }
        else {
          id v190 = 0;
        }
        unint64_t v192 = v39;
        if (v27) {
          id v47 = (id)objc_msgSend(v27, "objectForKey:", objc_msgSend(v194, "string"));
        }
        else {
          id v47 = 0;
        }
        *(void *)&long long v204 = 0;
        double v226 = 0.0;
        BOOL v48 = v44 > 1;
        if (v44 != 1)
        {
          BOOL v52 = 0;
          int v53 = 0;
          unsigned int v193 = 0;
          id v54 = v194;
          goto LABEL_49;
        }
        BOOL v49 = v182 == v198 && v181 == v46;
        id v54 = v194;
        if (!v49)
        {
          LOBYTE(v50) = 0;
          unsigned int v193 = 0;
          unint64_t v51 = v192;
LABEL_144:
          [v54 setLinguisticScore:-30.0 - (double)v51 / v40];
          if ((v50 & 1) == 0) {
            goto LABEL_146;
          }
          goto LABEL_145;
        }
        id v189 = v47;
        uint64_t v61 = [v194 string];
        uint64_t v62 = [(AppleSpell *)v18 _tokenIDForString:v61 languageModel:v199 languageObject:v34 terminatorTokenID:0];
        uint64_t v196 = v46;
        if (v180)
        {
          int v63 = v62;
          if (v62) {
            char v64 = v173;
          }
          else {
            char v64 = 1;
          }
          if (v64)
          {
            objc_msgSend((id)objc_msgSend(v54, "string"), "rangeOfString:", @"-");
            int v65 = 0;
            unsigned int v193 = 0;
            BOOL v48 = v66 != 0;
            goto LABEL_116;
          }
          long long v93 = v171;
          unint64_t v92 = v172;
          if (v172 <= v236) {
            long long v94 = 0;
          }
          else {
            long long v94 = &v171[4 * v236];
          }
          if (v172 >= v236) {
            unint64_t v95 = v172 - v236;
          }
          else {
            unint64_t v95 = 0;
          }
          id v96 = v199;
          int v65 = [v199 getConditionalProbabilityForTokenID:v62 context:v94 length:v95 probability:&v204];
          *(_DWORD *)&v93[4 * v92] = v63;
          id v27 = v178;
          unsigned int v97 = [v96 tokenSequenceIsBlocklisted:v93 length:v170];
        }
        else
        {
          if (v189)
          {
            [v189 doubleValue];
            *(void *)&long long v204 = v87;
            int v65 = 1;
          }
          else
          {
            int v65 = 0;
          }
          uint64_t v98 = NSString;
          id v54 = v194;
          uint64_t v99 = [v194 string];
          uint64_t v100 = [v98 stringWithFormat:@"%@ %@", v175, v99];
          unsigned int v97 = [v174 stringIsBlocklisted:v100];
        }
        unsigned int v193 = v97;
        BOOL v48 = 0;
LABEL_116:
        uint64_t v101 = [v54 string];
        BOOL v102 = [(AppleSpell *)v18 _getUnigramProbabilityForString:v101 languageModel:v199 probability:&v226];
        BOOL v52 = v65 != 0;
        if (!v102)
        {
          int v53 = 0;
          id v54 = v194;
          id v47 = v189;
          uint64_t v46 = v196;
LABEL_49:
          if (!v48) {
            goto LABEL_135;
          }
          goto LABEL_50;
        }
        uint64_t v103 = *(void *)&v226 & 0x7FFFFFFFFFFFFFFFLL;
        BOOL v108 = *(uint64_t *)&v226 > -1 && ((*(void *)&v226 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF
            || (*(void *)&v226 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000
            || v103 == 0x7FF0000000000000
            || (unint64_t)(*(void *)&v226 - 1) < 0xFFFFFFFFFFFFFLL
            || v103 == 0;
        uint64_t v46 = v196;
        if (!v108)
        {
          int v53 = 1;
          id v54 = v194;
          id v47 = v189;
          goto LABEL_49;
        }
        int v53 = 0;
        id v54 = v194;
        id v47 = v189;
        if (!v48)
        {
LABEL_135:
          unint64_t v51 = v192;
          if (!v52) {
            goto LABEL_91;
          }
          goto LABEL_136;
        }
LABEL_50:
        int v184 = v53;
        int v185 = v52;
        id v189 = v47;
        uint64_t v55 = (void *)[v54 candidateWords];
        long long v222 = 0u;
        long long v223 = 0u;
        long long v224 = 0u;
        long long v225 = 0u;
        id v197 = v55;
        uint64_t v56 = [v55 countByEnumeratingWithState:&v222 objects:v243 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v58 = 0;
          uint64_t v59 = *(void *)v223;
          do
          {
            for (uint64_t i = 0; i != v57; ++i)
            {
              if (*(void *)v223 != v59) {
                objc_enumerationMutation(v197);
              }
              v58 += objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v222 + 1) + 8 * i), "componentsSeparatedByString:", @"-"), "count");
            }
            uint64_t v57 = [v197 countByEnumeratingWithState:&v222 objects:v243 count:16];
          }
          while (v57);
        }
        long long v183 = v161;
        MEMORY[0x270FA5388](0);
        BOOL v68 = &v161[-v67];
        uint64_t v221 = 0;
        id v34 = v20;
        uint64_t v69 = [(AppleSpell *)v18 _contextLengthForRange:v198 languageObject:v46 tagger:v20 languageModel:v177 maxContextLength:v199 context:&v161[-v67] cleanOffset:&v221 cleanContextRange:0 lastTokenRange:0 lastTokenID:0];
        long long v217 = 0u;
        long long v218 = 0u;
        long long v219 = 0u;
        long long v220 = 0u;
        uint64_t v196 = [v197 countByEnumeratingWithState:&v217 objects:v242 count:16];
        if (v196)
        {
          id v195 = *(id *)v218;
          do
          {
            id v70 = 0;
            do
            {
              if (*(id *)v218 != v195) {
                objc_enumerationMutation(v197);
              }
              uint64_t v71 = *(void **)(*((void *)&v217 + 1) + 8 * (void)v70);
              unsigned int v72 = [(AppleSpell *)v18 _tokenIDForString:v71 languageModel:v199 languageObject:v34 terminatorTokenID:0];
              v198 = v70;
              if (v72)
              {
                *(_DWORD *)&v68[4 * v69++] = v72;
              }
              else
              {
                long long v73 = (void *)[v71 componentsSeparatedByString:@"-"];
                long long v213 = 0u;
                long long v214 = 0u;
                long long v215 = 0u;
                long long v216 = 0u;
                uint64_t v74 = [v73 countByEnumeratingWithState:&v213 objects:v241 count:16];
                if (v74)
                {
                  uint64_t v75 = v74;
                  uint64_t v76 = *(void *)v214;
                  do
                  {
                    for (uint64_t j = 0; j != v75; ++j)
                    {
                      if (*(void *)v214 != v76) {
                        objc_enumerationMutation(v73);
                      }
                      unint64_t v78 = *(void **)(*((void *)&v213 + 1) + 8 * j);
                      if ([v78 length]) {
                        *(_DWORD *)&v68[4 * v69++] = [(AppleSpell *)v18 _tokenIDForString:v78 languageModel:v199 languageObject:v20 terminatorTokenID:0];
                      }
                    }
                    uint64_t v75 = [v73 countByEnumeratingWithState:&v213 objects:v241 count:16];
                  }
                  while (v75);
                }
              }
              id v70 = v198 + 1;
              id v34 = v20;
            }
            while (v198 + 1 != (char *)v196);
            uint64_t v196 = [v197 countByEnumeratingWithState:&v217 objects:v242 count:16];
          }
          while (v196);
        }
        if ((v180 & 1) == 0)
        {
          if (v189)
          {
            [v189 doubleValue];
            *(void *)&long long v204 = v82;
            int v185 = 1;
          }
          BOOL v83 = NSString;
          id v84 = v194;
          uint64_t v160 = [v194 string];
          long long v85 = v83;
          id v54 = v84;
          uint64_t v86 = [v85 stringWithFormat:@"%@ %@", v175, v160];
          unsigned int v193 = [v174 stringIsBlocklisted:v86];
          id v27 = v178;
          unint64_t v51 = v192;
LABEL_90:
          int v53 = v184;
          if ((v185 & 1) == 0) {
            goto LABEL_91;
          }
          goto LABEL_136;
        }
        unint64_t v79 = v69 - 1;
        int v80 = *(_DWORD *)&v68[4 * v69 - 4];
        char v81 = v173;
        if (!v80) {
          char v81 = 1;
        }
        if (v81)
        {
          id v34 = v20;
          id v27 = v178;
          unint64_t v51 = v192;
          id v54 = v194;
          goto LABEL_90;
        }
        if (v79 <= v236) {
          long long v88 = 0;
        }
        else {
          long long v88 = &v68[4 * v236];
        }
        if (v79 >= v236) {
          unint64_t v89 = v79 - v236;
        }
        else {
          unint64_t v89 = 0;
        }
        id v90 = v199;
        char v91 = [v199 getConditionalProbabilityForTokenID:*(unsigned int *)&v68[4 * v69 - 4] context:v88 length:v89 probability:&v204];
        *(_DWORD *)&v68[4 * v79] = v80;
        unsigned int v193 = [v90 tokenSequenceIsBlocklisted:v68 length:v69];
        id v34 = v20;
        id v27 = v178;
        unint64_t v51 = v192;
        id v54 = v194;
        int v53 = v184;
        if ((v91 & 1) == 0)
        {
LABEL_91:
          if ((v176 & v53 & 1) == 0)
          {
            id v36 = v186;
            LOBYTE(v50) = v53;
            goto LABEL_144;
          }
          id v36 = v186;
          if (v232 * v226 >= 0.0)
          {
            LOBYTE(v50) = 1;
            goto LABEL_144;
          }
          [v54 setLinguisticScore:v232 * v226];
LABEL_145:
          [v54 setLexiconScore:v226];
          goto LABEL_146;
        }
LABEL_136:
        int v50 = v53;
        if (v53) {
          double v109 = v235 * *(double *)&v204 + v233 * v226;
        }
        else {
          double v109 = v235 * *(double *)&v204;
        }
        if (v190)
        {
          [v190 doubleValue];
          double v109 = v109 + v234 * v110;
        }
        id v36 = v186;
        if (v109 >= 0.0) {
          goto LABEL_144;
        }
        [v54 setLinguisticScore:v109];
        if (v50) {
          goto LABEL_145;
        }
LABEL_146:
        [v54 setBlocklisted:v193];
        unint64_t v39 = v51 + 1;
        uint64_t v41 = v191 + 1;
      }
      while (v191 + 1 != v188);
      uint64_t v111 = [v179 countByEnumeratingWithState:&v227 objects:v244 count:16];
      uint64_t v188 = v111;
    }
    while (v111);
  }
  uint64_t v112 = objc_msgSend((id)objc_msgSend(v166, "candidates"), "sortedArrayUsingComparator:", &__block_literal_global_375);
  uint64_t v113 = v112;
  BOOL v114 = v231 > 0.0 && v162;
  if (v114 && (unint64_t)objc_msgSend(v112, "count", v231) >= 2)
  {
    id v115 = [(AppleSpell *)v18 transformerOrSiriLanguageModelForLanguageObject:v34 appIdentifier:v165 waitForResult:0];
    if (v115)
    {
      uint64_t v116 = v115;
      uint64_t v117 = [v115 stateWithContext:v175];
      if (v117)
      {
        v118 = (void *)v117;
        unint64_t v119 = [v113 count];
        id v195 = v116;
        if (v119 > _kMaxCorrectionRescoreCount) {
          uint64_t v113 = (void *)[v113 subarrayWithRange:0];
        }
        uint64_t v120 = (void *)[MEMORY[0x263EFF980] array];
        long long v209 = 0u;
        long long v210 = 0u;
        long long v211 = 0u;
        long long v212 = 0u;
        uint64_t v121 = [v113 countByEnumeratingWithState:&v209 objects:v240 count:16];
        if (v121)
        {
          uint64_t v122 = v121;
          uint64_t v123 = *(void *)v210;
          do
          {
            for (uint64_t k = 0; k != v122; ++k)
            {
              if (*(void *)v210 != v123) {
                objc_enumerationMutation(v113);
              }
              v125 = *(void **)(*((void *)&v209 + 1) + 8 * k);
              uint64_t v126 = [v125 replacementRange];
              if (v182 == (char *)v126 && v181 == v127) {
                objc_msgSend(v120, "addObject:", objc_msgSend(v125, "string"));
              }
            }
            uint64_t v122 = [v113 countByEnumeratingWithState:&v209 objects:v240 count:16];
          }
          while (v122);
        }
        uint64_t v129 = [v120 count];
        long long v167 = v18;
        id v168 = v20;
        if (v129) {
          id v130 = (id)[v118 conditionalProbabilityDictionaryForStrings:v120];
        }
        else {
          id v130 = 0;
        }
        uint64_t v131 = v186;
        long long v207 = 0u;
        long long v208 = 0u;
        long long v205 = 0u;
        long long v206 = 0u;
        uint64_t v132 = [v113 countByEnumeratingWithState:&v205 objects:v239 count:16];
        if (v132)
        {
          uint64_t v133 = v132;
          v134 = *(char **)v206;
          id v197 = v130;
          v198 = v134;
          do
          {
            uint64_t v135 = 0;
            do
            {
              if (*(char **)v206 != v198) {
                objc_enumerationMutation(v113);
              }
              int v136 = *(void **)(*((void *)&v205 + 1) + 8 * v135);
              double v226 = 0.0;
              if (v130) {
                id v130 = (id)objc_msgSend(v130, "objectForKey:", objc_msgSend(v136, "string"));
              }
              v137 = v113;
              if (v131) {
                uint64_t v138 = objc_msgSend(v131, "objectForKey:", objc_msgSend(v136, "string"));
              }
              else {
                uint64_t v138 = 0;
              }
              uint64_t v139 = [v136 replacementRange];
              uint64_t v141 = v140;
              uint64_t v142 = [v136 lexiconScore];
              double v144 = v143;
              if (v130)
              {
                [v130 doubleValue];
                double v226 = v145;
              }
              else
              {
                if (v182 == (char *)v139 && v181 == v141) {
                  goto LABEL_202;
                }
                uint64_t v196 = (uint64_t)v161;
                long long v204 = v169;
                MEMORY[0x270FA5388](v142);
                long long v151 = v177;
                [(AppleSpell *)v167 _contextLengthForRange:v139 languageObject:v141 tagger:v168 languageModel:v177 maxContextLength:v199 context:&v161[-((v150 + 19) & 0xFFFFFFFFFFFFFFF0)] cleanOffset:0 cleanContextRange:&v204 lastTokenRange:0 lastTokenID:0];
                if (*((void *)&v204 + 1))
                {
                  long long v152 = (void *)[v151 string];
                  long long v153 = (__CFString *)objc_msgSend(v152, "substringWithRange:", (void)v204, *((void *)&v204 + 1));
                }
                else
                {
                  long long v153 = &stru_26C1C71A8;
                }
                if (!objc_msgSend(v195, "getConditionalProbabilityForString:context:probability:", objc_msgSend(v136, "string"), v153, &v226))goto LABEL_202; {
                double v145 = v226;
                }
              }
              double v146 = v231 * v145;
              if (v144 >= 0.0) {
                double v147 = v146;
              }
              else {
                double v147 = v146 + v233 * v144;
              }
              if (v138)
              {
                [v138 doubleValue];
                double v147 = v147 + v234 * v148;
              }
              [v136 setLinguisticScore:v147];
LABEL_202:
              ++v135;
              uint64_t v131 = v186;
              uint64_t v113 = v137;
              id v130 = v197;
            }
            while (v133 != v135);
            uint64_t v133 = [v137 countByEnumeratingWithState:&v205 objects:v239 count:16];
          }
          while (v133);
        }
        uint64_t v113 = (void *)[v113 sortedArrayUsingComparator:&__block_literal_global_375];
      }
    }
  }
  long long v202 = 0u;
  long long v203 = 0u;
  long long v200 = 0u;
  long long v201 = 0u;
  uint64_t v154 = [v113 countByEnumeratingWithState:&v200 objects:v238 count:16];
  long long v155 = (void *)v164;
  if (v154)
  {
    uint64_t v156 = v154;
    uint64_t v157 = *(void *)v201;
    do
    {
      for (uint64_t m = 0; m != v156; ++m)
      {
        if (*(void *)v201 != v157) {
          objc_enumerationMutation(v113);
        }
        [v155 addObject:*(void *)(*((void *)&v200 + 1) + 8 * m)];
      }
      uint64_t v156 = [v113 countByEnumeratingWithState:&v200 objects:v238 count:16];
    }
    while (v156);
  }
  return v155;
}

- (BOOL)_useAlternateLanguageForRange:(_NSRange)a3 ofString:(id)a4 languageObject:(id)a5 tagger:(id)a6 alternateLanguageObject:(id)a7 alternateTagger:(id)a8 appIdentifier:(id)a9
{
  id v41 = a6;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v43[1] = *MEMORY[0x263EF8340];
  unint64_t v40 = [a4 length];
  id v15 = [(AppleSpell *)self wordLanguageModelForLanguageObject:a5 appIdentifier:a9 waitForResult:0];
  id v16 = [(AppleSpell *)self wordLanguageModelForLanguageObject:a7 appIdentifier:a9 waitForResult:0];
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  unint64_t v39 = (char *)&v34 - ((v18 + 23) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  int v38 = (char *)&v34 - v19;
  uint64_t v42 = 0;
  v43[0] = 0;
  int v36 = [v15 getFirstDynamicTokenID:(char *)v43 + 4 lastDynamicTokenID:v43];
  int v35 = [v16 getFirstDynamicTokenID:(char *)&v42 + 4 lastDynamicTokenID:&v42];
  BOOL v20 = [(AppleSpell *)self useUnigramProbabilityForLanguageObject:a5];
  BOOL v21 = [(AppleSpell *)self useUnigramProbabilityForLanguageObject:a7];
  BOOL result = 0;
  id v37 = a8;
  if (a8)
  {
    id v23 = v41;
    if (v41)
    {
      if (a4)
      {
        if (v15)
        {
          if (v16)
          {
            if (!v20 && !v21 && v40 >= location + length)
            {
              NSUInteger v24 = location - objc_msgSend(a4, "paragraphRangeForRange:", location, length);
              unint64_t v25 = -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](self, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", v24, length, a5, v23, v15, _kMaxContextLength, v39, 0, 0, 0, 0);
              unint64_t v26 = -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](self, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", v24, length, a7, v37, v16, _kMaxContextLength, v38, 0, 0, 0, 0);
              BOOL result = 0;
              if (v25)
              {
                if (v26)
                {
                  unsigned int v27 = *(_DWORD *)&v39[4 * v25 - 4];
                  BOOL v28 = v27 != 0;
                  unsigned int v29 = *(_DWORD *)&v38[4 * v26 - 4];
                  char v30 = v36;
                  if (!v27) {
                    char v30 = 0;
                  }
                  BOOL v31 = HIDWORD(v43[0]) > v27;
                  BOOL v32 = v27 > LODWORD(v43[0]);
                  int v33 = v35;
                  if (!v29) {
                    int v33 = 0;
                  }
                  if (v33 == 1)
                  {
                    if (HIDWORD(v42) <= v29 && v29 <= v42) {
                      return 0;
                    }
                  }
                  else if (!v29)
                  {
                    return 0;
                  }
                  return (v31 | ~v30 | v32) & v28 ^ 1;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (float)dynamicScoreForWord:(id)a3 languageModel:(id)a4 languageObject:(id)a5
{
  if (!a3) {
    return 0.0;
  }
  if (!a4) {
    return 0.0;
  }
  uint64_t v6 = -[AppleSpell _tokenIDForString:languageModel:languageObject:terminatorTokenID:](self, "_tokenIDForString:languageModel:languageObject:terminatorTokenID:");
  if (!v6) {
    return 0.0;
  }
  [a4 usageCountForTokenID:v6];
  return result;
}

- (float)dynamicScoreForWord:(id)a3 languageObject:(id)a4 appIdentifier:(id)a5
{
  id v8 = [(AppleSpell *)self wordLanguageModelForLanguageObject:a4 appIdentifier:a5 waitForResult:0];
  [(AppleSpell *)self dynamicScoreForWord:a3 languageModel:v8 languageObject:a4];
  return result;
}

- (id)assetDataBundleURLsForLanguageObject:(id)a3
{
  if (a3)
  {
    uint64_t v4 = [a3 identifier];
    uint64_t v5 = (void *)[MEMORY[0x263EFF980] array];
    if (v4)
    {
      uint64_t v6 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v4];
      if (v6)
      {
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __69__AppleSpell_LanguageModeling__assetDataBundleURLsForLanguageObject___block_invoke;
        v9[3] = &unk_2640EF700;
        v9[4] = v5;
        [(AppleSpell *)self enumerateAssetDataItemsForLocale:v6 withBlock:v9];
      }
    }
    return v5;
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFF980];
    return (id)[v8 array];
  }
}

uint64_t __69__AppleSpell_LanguageModeling__assetDataBundleURLsForLanguageObject___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = [@"Spelling" isEqualToString:a4];
  if (result)
  {
    id v7 = *(void **)(a1 + 32);
    return [v7 addObject:a2];
  }
  return result;
}

- (BOOL)getConditionalProbabilityForWord:(id)a3 context:(id)a4 language:(id)a5 probability:(double *)a6
{
  v21[1] = *MEMORY[0x263EF8340];
  id v10 = +[PRLanguage languageObjectWithIdentifier:a5];
  id v11 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", v10, a4, 0, [a4 length]);
  id v12 = [(AppleSpell *)self wordLanguageModelForLanguageObject:v10 appIdentifier:0 waitForResult:1];
  MEMORY[0x270FA5388](v12);
  uint64_t v14 = (char *)v21 - ((v13 + 23) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = [a4 length];
  unint64_t v16 = -[AppleSpell _contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:](self, "_contextLengthForRange:languageObject:tagger:languageModel:maxContextLength:context:cleanOffset:cleanContextRange:lastTokenRange:lastTokenID:", v15, 0, v10, v11, v12, _kMaxContextLength, v14, 0, 0, 0, 0);
  uint64_t v17 = [(AppleSpell *)self _tokenIDForString:a3 languageModel:v12 languageObject:v10 terminatorTokenID:0];
  BOOL v18 = [(AppleSpell *)self useUnigramProbabilityForLanguageObject:v10];
  char v19 = 0;
  if (v12 && !v18 && v17) {
    char v19 = [v12 getConditionalProbabilityForTokenID:v17 context:v14 length:v16 probability:a6];
  }
  [(AppleSpell *)self invalidateTagger:v11];
  return v19;
}

- (BOOL)getCharacterModelConditionalProbabilityForString:(id)a3 context:(id)a4 language:(id)a5 probability:(double *)a6
{
  id v9 = [(AppleSpell *)self characterLanguageModelForLanguageObject:+[PRLanguage languageObjectWithIdentifier:a5] waitForResult:1];
  if (v9)
  {
    LOBYTE(v9) = [v9 getConditionalProbabilityForString:a3 context:a4 probability:a6];
  }
  return (char)v9;
}

- (BOOL)getTransformerModelConditionalProbabilityForString:(id)a3 context:(id)a4 language:(id)a5 probability:(double *)a6
{
  id v9 = [(AppleSpell *)self transformerLanguageModelForLanguageObject:+[PRLanguage languageObjectWithIdentifier:a5] waitForResult:1];
  if (v9)
  {
    LOBYTE(v9) = [v9 getConditionalProbabilityForString:a3 context:a4 probability:a6];
  }
  return (char)v9;
}

- (id)globalDictionaryArray
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!self->_globalDictionaryArray)
  {
    self->_globalDictionaryArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = -[AppleSpell dataBundlesForLanguageObject:](self, "dataBundlesForLanguageObject:", 0, 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) URLForResource:@"gbindict.dat" withExtension:0 subdirectory:0 localization:0];
          if (v8)
          {
            id v9 = [[PRDictionary alloc] initWithURL:v8 fallbackURL:0];
            if (v9)
            {
              id v10 = v9;
              [(NSMutableArray *)self->_globalDictionaryArray addObject:v9];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
  return self->_globalDictionaryArray;
}

- (id)localDictionaryArrayForLanguageObject:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v5 = [a3 identifier];
    uint64_t v28 = 0;
    unsigned int v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    if (v5)
    {
      if (self->_hasUpdatedDataBundleLanguages)
      {
        assetDataBundleSerialQueue = self->_assetDataBundleSerialQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __64__AppleSpell_Dictionary__localDictionaryArrayForLanguageObject___block_invoke;
        block[3] = &unk_2640EF7B8;
        block[4] = self;
        void block[5] = v5;
        block[6] = &v28;
        dispatch_sync(assetDataBundleSerialQueue, block);
        if (*((unsigned char *)v29 + 24))
        {
          [(NSMutableDictionary *)self->_localDictionaryArrays removeObjectForKey:v5];
          [(AppleSpell *)self updateLexiconsForLanguageIfNecessary:v5];
        }
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v28 = 0;
    unsigned int v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
  }
  id v7 = (void *)[(NSMutableDictionary *)self->_localDictionaryArrays objectForKey:v5];
  if (!v7)
  {
    uint64_t v20 = v5;
    BOOL v21 = self;
    unint64_t v22 = (void *)[MEMORY[0x263EFF980] array];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = [(AppleSpell *)self dataBundlesForLanguageObject:a3];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (!v9) {
      goto LABEL_24;
    }
    uint64_t v10 = *(void *)v24;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v13 = [a3 localization];
        long long v14 = (void *)[a3 fallbackLocalization];
        uint64_t v15 = [v12 URLForResource:@"bindict.dat" withExtension:0 subdirectory:0 localization:v13];
        if (v14 && ([v14 isEqualToString:v13] & 1) == 0)
        {
          uint64_t v16 = [v12 URLForResource:@"bindict.dat" withExtension:0 subdirectory:0 localization:v14];
          if (v15)
          {
LABEL_16:
            uint64_t v17 = [PRDictionary alloc];
            goto LABEL_20;
          }
        }
        else
        {
          uint64_t v16 = 0;
          if (v15) {
            goto LABEL_16;
          }
        }
        if (!v16) {
          continue;
        }
        uint64_t v17 = [PRDictionary alloc];
        uint64_t v15 = v16;
        uint64_t v16 = 0;
LABEL_20:
        BOOL v18 = [(PRDictionary *)v17 initWithURL:v15 fallbackURL:v16];
        if (v18)
        {
          [v22 addObject:v18];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v32 count:16];
      if (!v9)
      {
LABEL_24:
        id v7 = v22;
        [(NSMutableDictionary *)v21->_localDictionaryArrays setObject:v22 forKey:v20];
        break;
      }
    }
  }
  _Block_object_dispose(&v28, 8);
  return v7;
}

uint64_t __64__AppleSpell_Dictionary__localDictionaryArrayForLanguageObject___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 408) containsObject:a1[5]];
  if (result)
  {
    [*(id *)(a1[4] + 408) removeObject:a1[5]];
    uint64_t result = [*(id *)(a1[4] + 408) count];
    if (!result) {
      *(unsigned char *)(a1[4] + 578) = 0;
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)checkWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 index:(unint64_t)a6
{
  id v11 = [(AppleSpell *)self localDictionaryArrayForLanguageObject:a5];
  id v12 = [(AppleSpell *)self globalDictionaryArray];
  unint64_t v13 = [v11 count];
  unint64_t v14 = [v12 count] + v13;
  if (!v14) {
    return 0;
  }
  for (unint64_t i = 0; i < v14; ++i)
  {
    if (i >= v13)
    {
      uint64_t v17 = i - v13;
      uint64_t v16 = v12;
    }
    else
    {
      uint64_t v16 = v11;
      uint64_t v17 = i;
    }
    BOOL result = objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", v17), "checkWordBuffer:length:encoding:index:caseInsensitive:", a3, a4, objc_msgSend(a5, "encoding"), a6, 1);
    if (result) {
      break;
    }
  }
  return result;
}

- (BOOL)checkNameWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 globalOnly:(BOOL)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v11 = [(AppleSpell *)self globalDictionaryArray];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (!v12)
  {
    char v14 = 0;
LABEL_14:
    if (!a6)
    {
      id v17 = [(AppleSpell *)self localDictionaryArrayForLanguageObject:a5];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        char v14 = 0;
        uint64_t v20 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v17);
            }
            if (v14) {
              char v14 = 1;
            }
            else {
              char v14 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "checkWordBuffer:length:encoding:index:caseInsensitive:", a3, a4, objc_msgSend(a5, "encoding"), 7, 0);
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v19);
      }
      else
      {
        return 0;
      }
    }
    return v14;
  }
  uint64_t v13 = v12;
  char v14 = 0;
  uint64_t v15 = *(void *)v28;
  do
  {
    for (uint64_t j = 0; j != v13; ++j)
    {
      if (*(void *)v28 != v15) {
        objc_enumerationMutation(v11);
      }
      if (v14) {
        char v14 = 1;
      }
      else {
        char v14 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * j), "checkWordBuffer:length:encoding:index:caseInsensitive:", a3, a4, objc_msgSend(a5, "encoding"), 7, 0);
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v32 count:16];
  }
  while (v13);
  if ((v14 & 1) == 0) {
    goto LABEL_14;
  }
  return v14;
}

- (id)dictionaryForLanguageObject:(id)a3 index:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = [(AppleSpell *)self localDictionaryArrayForLanguageObject:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if (!v8) {
          id v8 = (void *)[*(id *)(*((void *)&v12 + 1) + 8 * i) dictionaryAtIndex:a4];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)autocorrectionDictionaryForLanguageObject:(id)a3
{
  return [(AppleSpell *)self dictionaryForLanguageObject:a3 index:0];
}

- (id)guessesDictionaryForLanguageObject:(id)a3
{
  return [(AppleSpell *)self dictionaryForLanguageObject:a3 index:1];
}

- (id)capitalizationDictionaryArrayForLanguageObject:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = [(AppleSpell *)self dictionaryForLanguageObject:a3 index:2];
  id v5 = [(AppleSpell *)self globalDictionaryArray];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        if (!v8) {
          uint64_t v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryAtIndex:2];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (v4) {
    return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v4, v8, 0);
  }
  else {
    return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v8, 0, v12);
  }
}

- (id)phraseCorrectionsDictionaryForLanguageObject:(id)a3
{
  return [(AppleSpell *)self dictionaryForLanguageObject:a3 index:3];
}

- (id)sentenceCorrectionsDictionaryForLanguageObject:(id)a3
{
  return [(AppleSpell *)self dictionaryForLanguageObject:a3 index:4];
}

- (id)regionalCorrectionsDictionaryForLanguageObject:(id)a3
{
  return [(AppleSpell *)self dictionaryForLanguageObject:a3 index:7];
}

- (id)parameterBundleForLanguageObject:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(AppleSpell *)self localDictionaryArrayForLanguageObject:a3];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (void *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      id v4 = (void *)[*(id *)(*((void *)&v9 + 1) + 8 * v7) parameterBundle];
      if (v4) {
        break;
      }
      if (v5 == (void *)++v7)
      {
        id v4 = (void *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        id v5 = v4;
        if (v4) {
          goto LABEL_3;
        }
        return v4;
      }
    }
  }
  return v4;
}

- (id)transformerParameterBundleForLanguageObject:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = -[AppleSpell localDictionaryArrayForLanguageObject:](self, "localDictionaryArrayForLanguageObject:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = (id)[*(id *)(*((void *)&v12 + 1) + 8 * v9) transformerParameterBundle];
      if (v10) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v10 = [(AppleSpell *)self parameterBundleForLanguageObject:a3];
  }
  return v10;
}

- (void)clearCaches
{
  self->_globalDictionaryArray = 0;
}

- (id)_taggerForOrthoIndex:(unint64_t)a3
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3052000000;
  long long v13 = __Block_byref_object_copy__1;
  taggerSerialQueue = self->_taggerSerialQueue;
  long long v14 = __Block_byref_object_dispose__1;
  uint64_t v15 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__AppleSpell_Tagger___taggerForOrthoIndex___block_invoke;
  block[3] = &unk_2640EF7E0;
  block[4] = self;
  void block[5] = &v10;
  block[6] = a3;
  dispatch_sync(taggerSerialQueue, block);
  id v5 = (PRTagger *)v11[5];
  if (!v5)
  {
    uint64_t v6 = [PRTagger alloc];
    id v5 = -[PRTagger initWithTagSchemes:orthoIndex:](v6, "initWithTagSchemes:orthoIndex:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263F13FC0], 0), a3);
    v11[5] = (uint64_t)v5;
  }
  uint64_t v7 = v5;
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __43__AppleSpell_Tagger___taggerForOrthoIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 88) count];
  if (result)
  {
    *(void *)(*(void *)(a1[5] + 8) + 40) = (id)[*(id *)(a1[4] + 88) lastObject];
    [*(id *)(*(void *)(a1[5] + 8) + 40) setOrthoIndex:a1[6]];
    id v3 = *(void **)(a1[4] + 88);
    return [v3 removeLastObject];
  }
  return result;
}

- (void)invalidateTagger:(id)a3
{
  if (a3)
  {
    [a3 setString:&stru_26C1C71A8];
    [a3 setOrthoIndex:0];
    taggerSerialQueue = self->_taggerSerialQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__AppleSpell_Tagger__invalidateTagger___block_invoke;
    v6[3] = &unk_2640EF488;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(taggerSerialQueue, v6);
  }
}

unint64_t __39__AppleSpell_Tagger__invalidateTagger___block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) count];
  if (result <= 4)
  {
    unint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) containsObject:*(void *)(a1 + 40)];
    if ((result & 1) == 0)
    {
      uint64_t v3 = *(void *)(a1 + 40);
      id v4 = *(void **)(*(void *)(a1 + 32) + 88);
      return [v4 addObject:v3];
    }
  }
  return result;
}

- (id)taggerForLanguageObject:(id)a3 string:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v10 = [a3 orthographyIndex];
  if (!v10) {
    return 0;
  }
  uint64_t v11 = v10;
  id v12 = [(AppleSpell *)self _taggerForOrthoIndex:v10];
  [v12 setString:a4];
  if (v11 > 191)
  {
    if (v11 > 230)
    {
      switch(v11)
      {
        case 231:
          long long v13 = (void *)MEMORY[0x263F08A58];
          long long v14 = @"pa";
          goto LABEL_24;
        case 235:
          long long v13 = (void *)MEMORY[0x263F08A58];
          long long v14 = @"te";
          goto LABEL_24;
        case 239:
          long long v13 = (void *)MEMORY[0x263F08A58];
          long long v14 = @"th";
          goto LABEL_24;
      }
      goto LABEL_28;
    }
    if (v11 != 192)
    {
      if (v11 == 224)
      {
        long long v13 = (void *)MEMORY[0x263F08A58];
        long long v14 = @"el";
        goto LABEL_24;
      }
      if (v11 == 227)
      {
        long long v13 = (void *)MEMORY[0x263F08A58];
        long long v14 = @"he";
LABEL_24:
        uint64_t v16 = [v13 defaultOrthographyForLanguage:v14];
        goto LABEL_25;
      }
      goto LABEL_28;
    }
    uint64_t v15 = (void *)MEMORY[0x263F08B20];
LABEL_19:
    uint64_t v16 = [v15 orthographyWithFlags:NSOrthographyFlagsForScriptAndOrthographyIndexes()];
LABEL_25:
    uint64_t v17 = v16;
LABEL_26:
    objc_msgSend(v12, "setOrthography:range:", v17, location, length);
    return v12;
  }
  if ((unint64_t)(v11 - 128) < 3)
  {
    uint64_t v15 = (void *)MEMORY[0x263F08B20];
    goto LABEL_19;
  }
  if (v11 == 3)
  {
    long long v13 = (void *)MEMORY[0x263F08A58];
    long long v14 = @"ko";
    goto LABEL_24;
  }
  if (v11 == 160)
  {
    uint64_t v15 = (void *)MEMORY[0x263F08B20];
    goto LABEL_19;
  }
LABEL_28:
  uint64_t v19 = NSOrthographyFlagsForScriptAndOrthographyIndexes();
  if (v19)
  {
    uint64_t v17 = [MEMORY[0x263F08B20] orthographyWithFlags:v19];
    if (v17) {
      goto LABEL_26;
    }
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x263F08A58], "defaultOrthographyForLanguage:", objc_msgSend(a3, "identifier", v17));
  if (v17) {
    goto LABEL_26;
  }
  return v12;
}

- (id)spellServer:(id)a3 suggestCompletionsForPartialWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)lastLanguage options:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v14 = (void *)[MEMORY[0x263EFF980] array];
  id v15 = objc_alloc_init(MEMORY[0x263F086B0]);
  if (!lastLanguage
    || ([lastLanguage isEqualToString:@"und"] & 1) != 0
    || [lastLanguage isEqualToString:@"Multilingual"])
  {
    lastLanguage = self->_lastLanguage;
    if (!lastLanguage)
    {
      if ([(NSArray *)self->_userPreferredLanguages count]) {
        lastLanguage = [(NSArray *)self->_userPreferredLanguages objectAtIndex:0];
      }
      else {
        lastLanguage = @"en";
      }
    }
  }
  id v16 = -[AppleSpell spellServer:suggestCompletionDictionariesForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestCompletionDictionariesForPartialWordRange:inString:inLanguage:options:", a3, location, length, a5, lastLanguage, a7);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v25;
LABEL_10:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v25 != v19) {
        objc_enumerationMutation(v16);
      }
      uint64_t v21 = [*(id *)(*((void *)&v24 + 1) + 8 * v20) objectForKey:@"Completion"];
      if (v21)
      {
        uint64_t v22 = v21;
        if (([v14 containsObject:v21] & 1) == 0) {
          [v14 addObject:v22];
        }
      }
      if ((unint64_t)[v14 count] > 0x13) {
        break;
      }
      if (v18 == ++v20)
      {
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v18) {
          goto LABEL_10;
        }
        break;
      }
    }
  }
  [(AppleSpell *)self resetTimer];

  return v14;
}

- (id)spellServer:(id)a3 suggestCompletionDictionariesForPartialWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)lastLanguage options:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v12 = (void *)[MEMORY[0x263EFF980] array];
  id v49 = objc_alloc_init(MEMORY[0x263F086B0]);
  uint64_t v13 = [MEMORY[0x263EFF980] array];
  long long v14 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  NSUInteger v52 = location;
  if (length) {
    id v15 = (__CFString *)objc_msgSend(a5, "substringWithRange:", location, length);
  }
  else {
    id v15 = 0;
  }
  uint64_t v51 = _appIdentifierFromOptions(a7);
  id v16 = (void *)[a7 objectForKey:@"AsynchronousLanguageModelCreation"];
  uint64_t v55 = (void *)v13;
  if (v16) {
    int v17 = [v16 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v17) = 1;
  }
  char v50 = v17;
  char v70 = 0;
  CFIndex v18 = [(__CFString *)v15 length];
  CFIndex v69 = 0;
  if (!lastLanguage
    || ([lastLanguage isEqualToString:@"und"] & 1) != 0
    || [lastLanguage isEqualToString:@"Multilingual"])
  {
    lastLanguage = self->_lastLanguage;
    if (!lastLanguage)
    {
      if ([(NSArray *)self->_userPreferredLanguages count]) {
        lastLanguage = [(NSArray *)self->_userPreferredLanguages objectAtIndex:0];
      }
      else {
        lastLanguage = @"en";
      }
    }
  }
  id v19 = +[PRLanguage languageObjectWithIdentifier:lastLanguage];
  uint64_t v20 = [(AppleSpell *)self databaseConnectionForLanguageObject:v19];
  CFStringEncoding v21 = [v19 encoding];
  id v22 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", v19, a5, 0, [a5 length]);
  if (v22)
  {
    BYTE1(v48) = v50;
    LOBYTE(v48) = v50;
    [(AppleSpell *)self _addLanguageModelCompletionsForPartialWordRange:v52 languageObject:length connection:v19 sender:v20 tagger:a3 appIdentifier:v22 waitForLanguageModel:v51 allowTransformer:v48 candidates:v55 scoreDictionary:v14 tryTransliteration:&v70];
  }
  if (v15)
  {
    if (v20 && v18 != 0)
    {
      v76.NSUInteger location = 0;
      v76.NSUInteger length = v18;
      CFStringGetBytes(v15, v76, v21, 0x5Fu, 0, buffer, 253, &v69);
    }
  }
  uint64_t v24 = [v55 count];
  id v54 = v22;
  if (v22) {
    BOOL v25 = v24 == 0;
  }
  else {
    BOOL v25 = 1;
  }
  if (!v25)
  {
    LOBYTE(usedBufLen) = v50;
    id v26 = -[AppleSpell _rankedCandidatesForRange:candidates:languageObject:tagger:appIdentifier:allowTransformer:scoreDictionary:](self, "_rankedCandidatesForRange:candidates:languageObject:tagger:appIdentifier:allowTransformer:scoreDictionary:", v52, length, v55, v19, v22, v51, usedBufLen, v14);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v65 objects:v73 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v66;
      double v30 = 0.0;
      double v31 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v66 != v29) {
            objc_enumerationMutation(v26);
          }
          objc_msgSend((id)objc_msgSend(v14, "objectForKey:", *(void *)(*((void *)&v65 + 1) + 8 * i)), "doubleValue");
          if (v33 < v31) {
            double v31 = v33;
          }
          double v30 = v30 + v33;
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v65 objects:v73 count:16];
      }
      while (v28);
      if (v31 >= 0.0)
      {
        if (v30 > 0.0)
        {
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          uint64_t v40 = [v26 countByEnumeratingWithState:&v57 objects:v71 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v58;
LABEL_48:
            uint64_t v43 = 0;
            while (1)
            {
              if (*(void *)v58 != v42) {
                objc_enumerationMutation(v26);
              }
              uint64_t v44 = *(void *)(*((void *)&v57 + 1) + 8 * v43);
              objc_msgSend((id)objc_msgSend(v14, "objectForKey:", v44), "doubleValue");
              objc_msgSend(v12, "addObject:", objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v44, @"Completion", objc_msgSend(NSNumber, "numberWithDouble:", v45 / v30), @"Score", 0));
              if ((unint64_t)[v12 count] > 0x13) {
                break;
              }
              if (v41 == ++v43)
              {
                uint64_t v41 = [v26 countByEnumeratingWithState:&v57 objects:v71 count:16];
                if (v41) {
                  goto LABEL_48;
                }
                break;
              }
            }
          }
        }
      }
      else
      {
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v34 = [v26 countByEnumeratingWithState:&v61 objects:v72 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v62;
LABEL_38:
          uint64_t v37 = 0;
          while (1)
          {
            if (*(void *)v62 != v36) {
              objc_enumerationMutation(v26);
            }
            uint64_t v38 = *(void *)(*((void *)&v61 + 1) + 8 * v37);
            objc_msgSend((id)objc_msgSend(v14, "objectForKey:", v38), "doubleValue");
            objc_msgSend(v12, "addObject:", objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v38, @"Completion", objc_msgSend(NSNumber, "numberWithDouble:", v39 - v31), @"Score", 0));
            if ((unint64_t)[v12 count] > 0x13) {
              break;
            }
            if (v35 == ++v37)
            {
              uint64_t v35 = [v26 countByEnumeratingWithState:&v61 objects:v72 count:16];
              if (v35) {
                goto LABEL_38;
              }
              break;
            }
          }
        }
      }
    }
  }
  [(AppleSpell *)self resetTimer];
  [(AppleSpell *)self invalidateTagger:v54];

  return v12;
}

- (id)spellServer:(id)a3 suggestNextLetterDictionariesForPartialWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)a6 options:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v45 = *MEMORY[0x263EF8340];
  long long v14 = objc_msgSend(a5, "substringWithRange:", a4.location, a4.length);
  uint64_t v36 = (void *)[MEMORY[0x263EFF980] array];
  id v35 = objc_alloc_init(MEMORY[0x263F086B0]);
  unint64_t v15 = [v14 length];
  uint64_t v16 = 0;
  uint64_t v44 = 0;
  memset(v43, 0, sizeof(v43));
  int v17 = spellServer_suggestNextLetterDictionariesForPartialWordRange_inString_inLanguage_options__total_frequency;
  do
    *(float *)&int v17 = *(float *)&spellServer_suggestNextLetterDictionariesForPartialWordRange_inString_inLanguage_options__letter_unigram_frequencies[v16++]
                   + *(float *)&v17;
  while (v16 != 26);
  uint64_t v18 = 0;
  spellServer_suggestNextLetterDictionariesForPartialWordRange_inString_inLanguage_options__total_frequency = v17;
  double v19 = *(float *)&v17;
  do
  {
    float v20 = *(float *)&spellServer_suggestNextLetterDictionariesForPartialWordRange_inString_inLanguage_options__letter_unigram_frequencies[v18]
        * 0.1
        / v19;
    *(float *)((char *)v43 + v18 * 4) = v20;
    ++v18;
  }
  while (v18 != 26);
  uint64_t v37 = self;
  id v21 = -[AppleSpell spellServer:suggestCompletionDictionariesForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestCompletionDictionariesForPartialWordRange:inString:inLanguage:options:", a3, location, length, a5, a6, a7);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v39 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v27 = (void *)[v26 objectForKey:@"Completion"];
        if ([v27 length] > v15)
        {
          if ([v27 hasPrefix:v14])
          {
            int v28 = [v27 characterAtIndex:v15];
            objc_msgSend((id)objc_msgSend(v26, "objectForKey:", @"Score"), "floatValue");
            if ((v28 - 97) <= 0x19)
            {
              float v30 = v29 * 0.9;
              *((float *)v43 + (v28 - 97)) = *((float *)v43 + (v28 - 97)) + v30;
            }
          }
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v23);
  }
  for (uint64_t j = 0; j != 26; ++j)
  {
    uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"%C", j + 97);
    LODWORD(v33) = *((_DWORD *)v43 + j);
    objc_msgSend(v36, "addObject:", objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v32, @"Letter", objc_msgSend(NSNumber, "numberWithFloat:", v33), @"Score", 0));
  }
  [v36 sortUsingComparator:&__block_literal_global_296];
  [(AppleSpell *)v37 resetTimer];

  return v36;
}

uint64_t __115__AppleSpell_Completion__spellServer_suggestNextLetterDictionariesForPartialWordRange_inString_inLanguage_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (void *)[a2 objectForKey:@"Score"];
  id v5 = (void *)[a3 objectForKey:@"Score"];
  [v4 floatValue];
  float v7 = v6;
  [v5 floatValue];
  if (v7 > v8) {
    return -1;
  }
  [v4 floatValue];
  float v11 = v10;
  [v5 floatValue];
  return v11 < v12;
}

- (id)spellServer:(id)a3 suggestWordWithMinimumLength:(unint64_t)a4 maximumLength:(unint64_t)a5 language:(id)lastLanguage
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v42 = objc_alloc_init(MEMORY[0x263F086B0]);
  if (!lastLanguage
    || ([lastLanguage isEqualToString:@"und"] & 1) != 0
    || [lastLanguage isEqualToString:@"Multilingual"])
  {
    lastLanguage = self->_lastLanguage;
    if (!lastLanguage)
    {
      if ([(NSArray *)self->_userPreferredLanguages count]) {
        lastLanguage = [(NSArray *)self->_userPreferredLanguages objectAtIndex:0];
      }
      else {
        lastLanguage = @"en";
      }
    }
  }
  memset(v64, 0, sizeof(v64));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  int v63 = 0;
  id v10 = +[PRLanguage languageObjectWithIdentifier:lastLanguage];
  int v44 = [v10 isGerman];
  uint64_t v43 = self;
  float v11 = [(AppleSpell *)self databaseConnectionForLanguageObject:v10];
  CFStringEncoding v12 = [v10 encoding];
  if (v11)
  {
    CFStringEncoding encoding = v12;
    id v41 = v10;
    double Current = CFAbsoluteTimeGetCurrent();
    memset((char *)v64 + 8, 0, 136);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    HIDWORD(v62) = 0;
    int v63 = 0;
    *(void *)&v64[0] = v45;
    *((void *)&v64[6] + 1) = &v47;
    HIBYTE(v64[7]) = 1;
    *(_WORD *)((char *)&v64[8] + 1) = v11->isa;
    srandom(((Current - floor(Current)) * 100000.0));
    uint64_t v14 = 0;
    while (v14 != 10)
    {
      v45[0] = aAaaaabbbccddee[random() % 0x39uLL];
      HIDWORD(v16) = v45[0] - 65;
      LODWORD(v16) = HIDWORD(v16);
      unsigned int v15 = v16 >> 1;
      BOOL v29 = v15 > 0x1C;
      int v17 = (1 << v15) & 0x14951495;
      BOOL v18 = v29 || v17 == 0;
      if (!v18
        || (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20CC61C20, (uint32x4_t)vaddq_s32(vdupq_n_s32(v45[0]), (int32x4_t)xmmword_20CC61C10)))) & 1) != 0|| v45[0] - 248 < 6|| (v45[0] & 0xD8) == 0xC8)
      {
        double v19 = &aAaaaabbbccddee[random() % 0x39uLL];
      }
      else
      {
        double v19 = &aAeiou[random() % 5uLL];
      }
      v45[1] = *v19;
      __int16 v46 = 42;
      PRword((uint64_t)v64, 5, 0);
      float v20 = (uint64_t *)*((void *)&v64[0] + 1);
      if (*((void *)&v64[0] + 1) && *(void *)(*((void *)&v64[0] + 1) + 8) && **((void **)&v64[0] + 1))
      {
        uint64_t v21 = *(unsigned __int16 *)(*((void *)&v64[0] + 1) + 18);
        if (*(_WORD *)(*((void *)&v64[0] + 1) + 18))
        {
          uint64_t v22 = 0;
          uint64_t v23 = 0;
          uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
          do
          {
            uint64_t v25 = *v20;
            if (*v20)
            {
              uint64_t v26 = *(__int16 *)(v20[1] + 2 * v23);
              uint64_t v27 = (char *)(v25 + v26);
              size_t v28 = strlen((const char *)(v25 + v26));
              BOOL v29 = v28 < a4 || v28 > a5;
              if (!v29)
              {
                int v30 = *v27;
                if ((v30 & 0xFFFFFFDF) - 65 <= 0x19)
                {
                  BOOL v34 = __CFADD__(v30 - 91, 26);
                  int v31 = v44;
                  if (!v34) {
                    int v31 = 1;
                  }
                  if (v31 == 1)
                  {
                    if (v28 < 2) {
                      goto LABEL_38;
                    }
                    unint64_t v32 = 1;
                    do
                    {
                      unsigned int v33 = v27[v32++] - 97;
                      BOOL v34 = v33 > 0x19 || v32 >= v28;
                    }
                    while (!v34);
                    if (v33 <= 0x19)
                    {
LABEL_38:
                      if (!(random() % (unint64_t)++v22)) {
                        uint64_t v24 = v26;
                      }
                    }
                  }
                }
              }
            }
            ++v23;
          }
          while (v23 != v21);
          if (v24 != 0x7FFFFFFFFFFFFFFFLL
            && (uint64_t v35 = *v20) != 0
            && (v36 = (const char *)(v35 + v24), (size_t v37 = strlen((const char *)(v35 + v24))) != 0))
          {
            size_t v38 = v37;
            if ([(AppleSpell *)v43 checkWordBuffer:v36 length:v37 languageObject:v41 index:1]|| [(AppleSpell *)v43 checkNegativeWordBuffer:v36 length:v38 languageObject:v41])
            {
              float v11 = 0;
            }
            else
            {
              float v11 = (__CFString *)CFStringCreateWithCString(0, v36, encoding);
            }
          }
          else
          {
            float v11 = 0;
          }
        }
        else
        {
          float v11 = 0;
        }
      }
      else
      {
        float v11 = 0;
      }
      ++v14;
      PRword((uint64_t)v64, 17, 0);
      if (v11) {
        goto LABEL_58;
      }
    }
    float v11 = 0;
  }
LABEL_58:
  [(AppleSpell *)v43 resetTimer];

  return v11;
}

- (void)personalizeEmojiArray:(id)a3
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue(@"SkinTones:com.apple.CharacterPicker.DefaultDataStorage", @"com.apple.CharacterPicker");
  if (v4)
  {
    id v5 = (void *)v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [a3 count];
      if (v6)
      {
        uint64_t v7 = v6;
        for (uint64_t i = 0; i != v7; ++i)
        {
          uint64_t v9 = (void *)[a3 objectAtIndex:i];
          uint64_t v10 = [v5 objectForKey:v9];
          if (v10)
          {
            uint64_t v11 = v10;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && ([v9 isEqual:v11] & 1) == 0 && _loadEmojiKit())
            {
              if (_CEMStringIsSingleEmoji(v11))
              {
                if (![v9 hasPrefix:@"✊"]
                  || !_loadEmojiKit()
                  || !_CEMStringIsSingleEmoji(v9)
                  || (uint64_t v12 = _CEMEmojiTokenCreateWithString(v9, 0)) == 0
                  || (uint64_t v13 = (const void *)v12, SkinTone = _CEMEmojiTokenGetSkinTone(), CFRelease(v13), !SkinTone))
                {
                  [a3 replaceObjectAtIndex:i withObject:v11];
                }
              }
            }
          }
        }
      }
    }
    CFRelease(v5);
  }
}

- (BOOL)noSuggestForCompletion:(id)a3 languageObject:(id)a4 appIdentifier:(id)a5 alreadyCapitalized:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v10 = 0;
  BOOL v7 = [(AppleSpell *)self getMetaFlagsForWord:a3 inLexiconForLanguageObject:a4 metaFlags:(char *)&v10 + 4 otherMetaFlags:&v10];
  LOBYTE(v8) = 0;
  if (v7)
  {
    if (v6)
    {
      if ((v10 & 0x8000000000) != 0) {
        return v10 >> 7;
      }
      else {
        LOBYTE(v8) = 0;
      }
    }
    else
    {
      return (HIDWORD(v10) >> 7) & 1;
    }
  }
  return v8;
}

- (id)spellServer:(id)a3 candidatesForSelectedRange:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 types:(unint64_t)a7 options:(id)a8 orthography:(id)a9
{
  int v158 = a7;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v248 = *MEMORY[0x263EF8340];
  unint64_t v170 = (void *)[MEMORY[0x263EFF980] array];
  id v166 = (id)[MEMORY[0x263EFF980] array];
  id v165 = (void *)[MEMORY[0x263EFF980] array];
  obuint64_t j = (id)[MEMORY[0x263EFF980] array];
  id v168 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a8];
  uint64_t v11 = [a9 dominantScript];
  uint64_t v12 = (void *)_appIdentifierFromOptions(a8);
  CFStringRef theString = (__CFString *)a5;
  unint64_t v159 = [a5 length];
  uint64_t v160 = v12;
  int v154 = [v12 isEqualToString:@"com.apple.DiskUtility"];
  [a8 objectForKey:@"AppIdentifier"];
  uint64_t v13 = (void *)[a8 objectForKey:@"KeyEventArray"];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = (void *)[v13 lastObject];
    }
    else {
      uint64_t v13 = 0;
    }
  }
  if (PRUseSingleCompletions_onceToken == -1)
  {
    if (!v13) {
      goto LABEL_10;
    }
  }
  else
  {
    dispatch_once(&PRUseSingleCompletions_onceToken, &__block_literal_global_421);
    if (!v13) {
      goto LABEL_10;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = (void *)[v13 keyboardLayoutIdentifier];
    if (v14) {
      [v14 rangeOfString:@"inputmethod"];
    }
  }
LABEL_10:
  uint64_t v15 = [a8 objectForKey:@"InlinePredictionsOnly"];
  if (v15 && (unint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    int v155 = [v16 BOOLValue];
  }
  else {
    int v155 = 0;
  }
  uint64_t v237 = 0;
  v238 = &v237;
  uint64_t v239 = 0x3010000000;
  v240 = &unk_20CC73CF2;
  NSUInteger v241 = location;
  uint64_t v242 = 0;
  uint64_t v231 = 0;
  double v232 = &v231;
  uint64_t v233 = 0x3010000000;
  double v234 = &unk_20CC73CF2;
  NSUInteger v235 = location;
  uint64_t v236 = 0;
  uint64_t v225 = 0;
  double v226 = &v225;
  uint64_t v227 = 0x3010000000;
  long long v228 = &unk_20CC73CF2;
  NSUInteger v229 = location;
  uint64_t v230 = 0;
  uint64_t v219 = 0;
  long long v220 = &v219;
  uint64_t v221 = 0x3010000000;
  long long v222 = &unk_20CC73CF2;
  NSUInteger v223 = location;
  uint64_t v224 = 0;
  uint64_t v213 = 0;
  long long v214 = &v213;
  uint64_t v215 = 0x3010000000;
  uint64_t v218 = 0;
  long long v216 = &unk_20CC73CF2;
  uint64_t v217 = 0;
  uint64_t v207 = 0;
  long long v208 = &v207;
  uint64_t v209 = 0x3010000000;
  long long v210 = &unk_20CC73CF2;
  NSUInteger v211 = location;
  uint64_t v212 = 0;
  v206[0] = 0;
  v206[1] = v206;
  v206[2] = 0x2020000000;
  v206[3] = 0;
  CFIndex usedBufLen = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke;
  block[3] = &unk_2640EF4B0;
  block[4] = self;
  if (spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__onceToken != -1) {
    dispatch_once(&spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__onceToken, block);
  }
  objc_msgSend(v168, "setObject:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, length), @"SelectedRange");
  objc_msgSend(v168, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"SuppressAdaptation");
  objc_msgSend(v168, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"OnlyAtInsertionPoint");
  if ((([@"Latn" isEqualToString:v11] & 1) != 0
     || ([@"Cyrl" isEqualToString:v11] & 1) != 0
     || ([@"Kore" isEqualToString:v11] & 1) != 0
     || (int v17 = (__CFString *)[a9 dominantLanguageForScript:@"Latn"]) == 0)
    && (int v17 = (__CFString *)[a9 dominantLanguage]) == 0
    || ([(__CFString *)v17 isEqualToString:@"und"] & 1) != 0
    || [(__CFString *)v17 isEqualToString:@"Multilingual"])
  {
    if ([@"Cyrl" isEqualToString:v11])
    {
      int v17 = @"ru";
    }
    else if ([@"Kore" isEqualToString:v11])
    {
      int v17 = @"ko";
    }
    else if ([@"Thai" isEqualToString:v11])
    {
      int v17 = @"th";
    }
    else
    {
      int v17 = [(NSArray *)self->_userPreferredLanguages firstObject];
    }
  }
  else if (([(__CFString *)v17 isEqualToString:@"en"] & 1) != 0 {
         || [(__CFString *)v17 isEqualToString:@"pt"])
  }
  {
    long long v202 = 0u;
    long long v203 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    userPreferredLanguages = self->_userPreferredLanguages;
    uint64_t v19 = [(NSArray *)userPreferredLanguages countByEnumeratingWithState:&v200 objects:v246 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v201;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v201 != v20) {
            objc_enumerationMutation(userPreferredLanguages);
          }
          uint64_t v22 = *(__CFString **)(*((void *)&v200 + 1) + 8 * i);
          if ([(__CFString *)v22 hasPrefix:v17])
          {
            int v17 = v22;
            goto LABEL_42;
          }
        }
        uint64_t v19 = [(NSArray *)userPreferredLanguages countByEnumeratingWithState:&v200 objects:v246 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }
  }
LABEL_42:
  if (v17) {
    uint64_t v23 = v17;
  }
  else {
    uint64_t v23 = @"en_US";
  }
  id v24 = +[PRLanguage languageObjectWithIdentifier:v23];
  id v156 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF960]), "initWithLocaleIdentifier:", objc_msgSend(v24, "identifier"));
  CFStringEncoding v25 = [v24 encoding];
  id v26 = [(AppleSpell *)self autocorrectionDictionaryForLanguageObject:v24];
  uint64_t v27 = (char *)[v24 oneLetterWords];
  char v28 = [v24 isThai];
  if (v26) {
    char v29 = v28;
  }
  else {
    char v29 = 1;
  }
  if ((v29 & 1) != 0 || ![v24 isSupportedCompletionLanguage]) {
    goto LABEL_244;
  }
  id v152 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", v24, theString, 0, [(__CFString *)theString length]);
  long long v151 = self;
  if (![(AppleSpell *)self useWordLanguageModelForLanguageObject:v24 tagger:v152 appIdentifier:v160])goto LABEL_243; {

  }
  unsigned int v149 = 0;
  self->_lastCandidateLanguage = (NSString *)objc_msgSend((id)objc_msgSend(v24, "identifier"), "copy");
  uint64_t v147 = 0;
  if (!theString)
  {
    uint64_t v146 = location;
    uint64_t v150 = 0;
    int v30 = 0;
    goto LABEL_192;
  }
  uint64_t v146 = location;
  uint64_t v150 = 0;
  int v30 = 0;
  if (v159 < location) {
    goto LABEL_192;
  }
  unint64_t v148 = -[__CFString paragraphRangeForRange:](theString, "paragraphRangeForRange:", location, 0);
  if (location > v148)
  {
    v199[0] = MEMORY[0x263EF8330];
    v199[1] = 3221225472;
    v199[2] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_2;
    v199[3] = &unk_2640EF858;
    v199[6] = location;
    v199[4] = theString;
    v199[5] = &v237;
    -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:", v148, location - v148, 771, v199);
    *((_OWORD *)v232 + 2) = *((_OWORD *)v238 + 2);
  }
  if (v159 > v232[5] + v232[4])
  {
    v198[10] = MEMORY[0x263EF8330];
    v198[11] = 3221225472;
    v198[12] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_3;
    v198[13] = &unk_2640EF880;
    v198[14] = theString;
    v198[15] = &v231;
    v198[16] = location;
    v198[17] = length;
    -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:");
  }
  int v31 = v238;
  *((_OWORD *)v226 + 2) = *((_OWORD *)v238 + 2);
  unint64_t v32 = v31[4] - v148;
  unsigned int v33 = v214;
  v214[4] = v148;
  v33[5] = v32;
  v198[0] = MEMORY[0x263EF8330];
  v198[1] = 3221225472;
  v198[2] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_4;
  v198[3] = &unk_2640EF8A8;
  v198[4] = theString;
  v198[5] = &v225;
  v198[6] = &v219;
  v198[7] = &v213;
  v198[8] = &v237;
  v198[9] = v206;
  -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:", v33[4], v33[5], 771, v198);
  uint64_t v36 = v226;
  unint64_t v37 = v226[4];
  uint64_t v38 = v37 - v148;
  if (v37 > v148)
  {
    long long v39 = v238;
    if (v37 == v238[4])
    {
      uint64_t v40 = v226[5];
      if (v40 == v238[5])
      {
        v226[4] = v148;
        v36[5] = v38 + v40;
        uint64_t v41 = v39[5];
        if (v38 + v40 > (unint64_t)(v41 + 256))
        {
          v36[4] = v37 + v40 - v41 - 256;
          v36[5] = v41 + 256;
        }
      }
    }
  }
  if ((v158 & 0x40000000) != 0)
  {
    uint64_t v42 = v220[5];
    if (!v42
      || v220[4] + v42 >= v159
      || -[__CFString characterAtIndex:](theString, "characterAtIndex:") != 46
      || (v249.NSUInteger location = v220[4],
          CFIndex v43 = v220[5] + 1,
          v249.NSUInteger length = v43,
          v43 != CFStringGetBytes(theString, v249, v25, 0x5Fu, 0, buffer, 72, &usedBufLen))
      || ![(AppleSpell *)self checkNoCapAbbreviationWordBuffer:buffer length:usedBufLen languageObject:v24])
    {
      uint64_t v44 = v214[4];
      if (v44 == v148)
      {
        unsigned int v149 = treatWordAsSentenceInitial(theString, v148, v238[4], v238[5], v24);
        goto LABEL_79;
      }
      uint64_t v45 = -[__CFString rangeOfCharacterFromSet:options:range:](theString, "rangeOfCharacterFromSet:options:range:", spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__terminatorCharacterSet, 0, v44, v214[5]);
      unint64_t v47 = v45;
      unsigned int v149 = 0;
      if (v45 == 0x7FFFFFFFFFFFFFFFLL || !v46) {
        goto LABEL_79;
      }
      uint64_t v48 = v45 + v46;
      long long v49 = v214;
      if (v45 + v46 < (unint64_t)(v214[5] + v214[4]))
      {
        uint64_t v50 = v238[4] - v48;
        v214[4] = v48;
        v49[5] = v50;
        uint64_t v34 = -[__CFString rangeOfCharacterFromSet:options:range:](theString, "rangeOfCharacterFromSet:options:range:", spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__nonPunctuationCharacterSet, 0);
        unsigned int v149 = 0;
        if (v34 == 0x7FFFFFFFFFFFFFFFLL || !v51) {
          goto LABEL_79;
        }
        if (objc_msgSend((id)spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__whitespaceCharacterSet, "characterIsMember:", -[__CFString characterAtIndex:](theString, "characterAtIndex:", v34)))
        {
          unsigned int v149 = treatWordAsSentenceInitial(theString, v47, v238[4], v238[5], v24);
          goto LABEL_79;
        }
      }
    }
  }
  unsigned int v149 = 0;
LABEL_79:
  if (v155)
  {
    int v145 = 0;
  }
  else
  {
    id v52 = -[AppleSpell spellServer:suggestCompletionsForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestCompletionsForPartialWordRange:inString:inLanguage:options:", a3, v232[4], v232[5], theString, objc_msgSend(v24, "identifier", v34), v168);
    uint64_t v53 = [v52 count];
    if (v232[5]
      && (uint64_t v54 = [(__CFString *)theString rangeOfComposedCharacterSequenceAtIndex:v232[4]], v55))
    {
      long long v56 = (void *)-[__CFString substringWithRange:](theString, "substringWithRange:", v54, v55);
      int v145 = objc_msgSend(v56, "isEqualToString:", objc_msgSend(v56, "capitalizedString"));
    }
    else
    {
      int v145 = 0;
    }
    if (v53)
    {
      uint64_t v57 = 0;
      do
      {
        if ((unint64_t)[v166 count] > 0x63) {
          break;
        }
        long long v58 = (void *)[v52 objectAtIndex:v57];
        if ([v58 length] == 1)
        {
          if (v27)
          {
            unsigned int v59 = [v58 characterAtIndex:0];
            if (v59 > 0xFF || !strchr(v27, (char)v59)) {
              continue;
            }
          }
        }
        if (![(AppleSpell *)self noSuggestForCompletion:v58 languageObject:v24 appIdentifier:v160 alreadyCapitalized:v145 | v149])
        {
          if (v149) {
            long long v58 = (void *)initialCapitalizedString(v58, (uint64_t)v156);
          }
          if (([v166 containsObject:v58] & 1) == 0) {
            [v166 addObject:v58];
          }
        }
        ++v57;
      }
      while (v53 != v57);
    }
  }
  uint64_t v150 = 0;
  if ((v158 & 0x100) != 0)
  {
    uint64_t v35 = v232[5];
    if (v35)
    {
      long long v60 = (void *)[(__CFString *)theString substringWithRange:v232[4]];
      uint64_t v150 = (void *)-[NSMutableDictionary objectForKey:](self->_foundShortcutsDictionary, "objectForKey:", [v60 lowercaseStringWithLocale:v156]);
      if (v150)
      {
        if (!spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__lowercaseLetterCharacterSet) {
          spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__lowercaseLetterCharacterSet = [MEMORY[0x263F08708] lowercaseLetterCharacterSet];
        }
        if (!spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__uppercaseLetterCharacterSet) {
          spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__uppercaseLetterCharacterSet = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
        }
        objc_msgSend(v150, "rangeOfCharacterFromSet:");
        if (v61)
        {
          [v150 rangeOfCharacterFromSet:spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__uppercaseLetterCharacterSet];
          if (!v62)
          {
            [v60 rangeOfCharacterFromSet:spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__lowercaseLetterCharacterSet];
            if (v63)
            {
              if ((v149 & 1) != 0
                || objc_msgSend(v60, "isEqualToString:", initialCapitalizedString(v60, (uint64_t)v156)))
              {
                uint64_t v150 = (void *)initialCapitalizedString(v150, (uint64_t)v156);
              }
            }
            else
            {
              uint64_t v150 = (void *)uppercasedString(v150, (uint64_t)v156);
            }
          }
        }
      }
      else
      {
        uint64_t v150 = 0;
      }
    }
  }
  if ((v158 & 2) == 0) {
    goto LABEL_123;
  }
  unint64_t v64 = v232[5] + v232[4];
  unint64_t v65 = v226[4];
  uint64_t v35 = v64 - v65;
  if (v64 <= v65) {
    goto LABEL_123;
  }
  uint64_t v66 = -[__CFString substringWithRange:](theString, "substringWithRange:", v226[4], v35);
  objc_msgSend(v168, "setObject:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location - v65, length), @"SelectedRange");
  id v67 = [(AppleSpell *)self spellServer:a3 checkString:v66 offset:v65 types:v158 & 0xC0000000 | 0x202 options:v168 orthography:a9 wordCount:0];
  long long v196 = 0u;
  long long v197 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  uint64_t v68 = [v67 countByEnumeratingWithState:&v194 objects:v245 count:16];
  if (!v68) {
    goto LABEL_123;
  }
  uint64_t v69 = *(void *)v195;
  while (2)
  {
    for (uint64_t j = 0; j != v68; ++j)
    {
      if (*(void *)v195 != v69) {
        objc_enumerationMutation(v67);
      }
      uint64_t v71 = *(void **)(*((void *)&v194 + 1) + 8 * j);
      if ([v71 resultType] == 512)
      {
        uint64_t v72 = [v71 range];
        if (v72 + v73 == v232[5] + v232[4])
        {
          uint64_t v74 = (void *)[v71 replacementString];
          uint64_t v146 = [v71 range];
          uint64_t v147 = v89;
          if (v149)
          {
            uint64_t v90 = [v71 range];
            if (v90 == v232[4]
              && v91 == v232[5]
              && (objc_msgSend(v74, "isEqualToString:", initialCapitalizedString((void *)-[__CFString substringWithRange:](theString, "substringWithRange:"), (uint64_t)v156)) & 1) != 0)
            {
              goto LABEL_171;
            }
            uint64_t v74 = (void *)initialCapitalizedString(v74, (uint64_t)v156);
          }
          if (v74) {
            char v92 = v155;
          }
          else {
            char v92 = 1;
          }
          if (v92) {
            goto LABEL_124;
          }
          if (![v166 count] && v146 == v232[4] && v147 == v232[5])
          {
            uint64_t v140 = (void *)[MEMORY[0x263F089D8] stringWithString:theString];
            objc_msgSend(v140, "replaceCharactersInRange:withString:", v232[4], v232[5], v74);
            id v141 = -[AppleSpell spellServer:suggestCompletionsForPartialWordRange:inString:inLanguage:options:](self, "spellServer:suggestCompletionsForPartialWordRange:inString:inLanguage:options:", a3, v232[4], [v74 length], v140, objc_msgSend(v24, "identifier"), v168);
            uint64_t v142 = [v141 count];
            if (v142)
            {
              for (uint64_t k = 0; k != v142; ++k)
              {
                if ((unint64_t)[v166 count] > 0x63) {
                  break;
                }
                double v144 = (void *)[v141 objectAtIndex:k];
                if (![(AppleSpell *)self noSuggestForCompletion:v144 languageObject:v24 appIdentifier:v160 alreadyCapitalized:v145 | v149])
                {
                  if (v149) {
                    double v144 = (void *)initialCapitalizedString(v144, (uint64_t)v156);
                  }
                  if (([v166 containsObject:v144] & 1) == 0) {
                    [v166 addObject:v144];
                  }
                }
              }
            }
          }
          if ((v158 & 0x200) != 0 && !v150) {
            goto LABEL_124;
          }
          if (([v166 containsObject:v74] & 1) == 0 && v146 == v232[4] && v147 == v232[5])
          {
            [v166 insertObject:v74 atIndex:0];
            uint64_t v74 = 0;
            goto LABEL_124;
          }
LABEL_171:
          uint64_t v74 = 0;
          goto LABEL_124;
        }
      }
    }
    uint64_t v68 = [v67 countByEnumeratingWithState:&v194 objects:v245 count:16];
    if (v68) {
      continue;
    }
    break;
  }
LABEL_123:
  uint64_t v74 = 0;
  uint64_t v146 = location;
  uint64_t v147 = 0;
LABEL_124:
  int v75 = v155;
  if (v150) {
    int v75 = 1;
  }
  CFRange v76 = v74;
  if (v74) {
    int v77 = 1;
  }
  else {
    int v77 = v75;
  }
  if (((v77 | v154) & 1) == 0)
  {
    *((_OWORD *)v208 + 2) = *((_OWORD *)v232 + 2);
    id v78 = v24;
    if (v226[5])
    {
      userTransliterationLocalizations = self->_userTransliterationLocalizations;
      id v78 = v24;
      if (userTransliterationLocalizations)
      {
        id v78 = v24;
        if ([(NSArray *)userTransliterationLocalizations count] == 1)
        {
          id v80 = [(NSArray *)self->_userTransliterationLocalizations firstObject];
          id v78 = v24;
          if ((objc_msgSend((id)objc_msgSend(v24, "identifier"), "isEqualToString:", v80) & 1) == 0)
          {
            char v81 = v232;
            if (v232[5] || (v81 = v220, uint64_t v35 = v220[5], v78 = v24, v35))
            {
              uint64_t v82 = (void *)[(__CFString *)theString substringWithRange:v81[4]];
              BOOL v83 = v82;
              id v78 = v24;
              if (v82)
              {
                id v78 = v24;
                if ((unint64_t)[v82 length] >= 3)
                {
                  id v78 = v24;
                  if ([(AppleSpell *)self validateWord:v83 inLexiconForLanguage:v80])
                  {
                    id v78 = +[PRLanguage languageObjectWithIdentifier:v80];
                  }
                }
              }
            }
          }
        }
      }
    }
    if (v232[5] && v226[5])
    {
      uint64_t v184 = MEMORY[0x263EF8330];
      uint64_t v185 = 3221225472;
      v186 = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_5;
      uint64_t v187 = &unk_2640EF8D0;
      uint64_t v188 = theString;
      id v189 = v78;
      uint64_t v191 = &v231;
      id v190 = v165;
      unint64_t v192 = &v225;
      unsigned int v193 = &v207;
      -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:");
    }
    if (!objc_msgSend(v165, "count", v34, v35) && !v232[5] && v220[5] && v226[5])
    {
      uint64_t v180 = 0;
      uint64_t v181 = &v180;
      uint64_t v182 = 0x2020000000;
      uint64_t v183 = 0;
      if (![v165 count])
      {
        v179[14] = MEMORY[0x263EF8330];
        v179[15] = 3221225472;
        v179[16] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_6;
        v179[17] = &unk_2640EF8F8;
        v179[22] = &v225;
        v179[18] = theString;
        v179[19] = v78;
        v179[21] = &v219;
        v179[20] = v165;
        -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:");
        if (v232[4] > (unint64_t)(v220[5] + v220[4]))
        {
          v179[7] = MEMORY[0x263EF8330];
          v179[8] = 3221225472;
          v179[9] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_7;
          v179[10] = &unk_2640EF920;
          v179[11] = v78;
          v179[12] = v165;
          v179[13] = &v180;
          -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:");
        }
      }
      uint64_t v94 = [v165 count];
      if (v94)
      {
        uint64_t v95 = v94 - 1;
        do
        {
          uint64_t v96 = [v165 objectAtIndex:v95];
          -[__CFString rangeOfString:options:range:](theString, "rangeOfString:options:range:", v96, 4, v220[4], location - v220[4]);
          if (v97) {
            [v165 removeObjectAtIndex:v95];
          }
          --v95;
        }
        while (v95 != -1);
      }
      goto LABEL_182;
    }
    if (![v165 count] && !v232[5])
    {
      unint64_t v85 = v232[4];
      uint64_t v84 = v85 - v148;
      if (v85 > v148)
      {
        uint64_t v180 = 0;
        uint64_t v181 = &v180;
        uint64_t v182 = 0x2020000000;
        uint64_t v183 = 0;
        v179[0] = MEMORY[0x263EF8330];
        v179[1] = 3221225472;
        v179[2] = __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_8;
        v179[3] = &unk_2640EF920;
        v179[4] = v78;
        v179[5] = v165;
        v179[6] = &v180;
        -[__CFString enumerateSubstringsInRange:options:usingBlock:](theString, "enumerateSubstringsInRange:options:usingBlock:", v148, v84, 258, v179);
        uint64_t v86 = [v165 count];
        if (v86)
        {
          uint64_t v87 = v86 - 1;
          do
          {
            -[__CFString rangeOfString:options:range:](theString, "rangeOfString:options:range:", [v165 objectAtIndex:v87], 4, v148, location - v148);
            if (v88) {
              [v165 removeObjectAtIndex:v87];
            }
            --v87;
          }
          while (v87 != -1);
        }
LABEL_182:
        _Block_object_dispose(&v180, 8);
      }
    }
    -[AppleSpell personalizeEmojiArray:](self, "personalizeEmojiArray:", v165, v84);
    uint64_t v98 = [v165 count];
    if (v98)
    {
      unint64_t v99 = v98 - 1;
      do
      {
        if (objc_msgSend(v165, "indexOfObject:", objc_msgSend(v165, "objectAtIndex:", v99)) < v99) {
          [v165 removeObjectAtIndex:v99];
        }
        --v99;
      }
      while (v99 != -1);
    }
  }
  if (v77)
  {
    int v30 = v76;
  }
  else
  {
    if (!objc_msgSend(v166, "count", v34, v35))
    {
      id v116 = -[AppleSpell _spellServer:suggestGuessesForWordRange:inString:languageObject:options:](self, "_spellServer:suggestGuessesForWordRange:inString:languageObject:options:", a3, v232[4] - v226[4], v232[5], -[__CFString substringWithRange:](theString, "substringWithRange:"), v24, v168);
      uint64_t v117 = [v116 count];
      if (v117)
      {
        for (uint64_t m = 0; m != v117; ++m)
        {
          if ((unint64_t)[v166 count] > 0x63) {
            break;
          }
          unint64_t v119 = (void *)[v116 objectAtIndex:m];
          if (![(AppleSpell *)self noSuggestForCompletion:v119 languageObject:v24 appIdentifier:v160 alreadyCapitalized:v145 | v149])
          {
            if (v149) {
              unint64_t v119 = (void *)initialCapitalizedString(v119, (uint64_t)v156);
            }
            if (([v166 containsObject:v119] & 1) == 0) {
              [v166 addObject:v119];
            }
          }
        }
      }
    }
    uint64_t v150 = 0;
    int v30 = 0;
  }
LABEL_192:
  BOOL v162 = v30;
  if (v238[4] - 1 >= v159)
  {
    long long v169 = &stru_26C1C71A8;
    uint64_t v100 = v147;
  }
  else
  {
    long long v169 = &stru_26C1C71A8;
    uint64_t v100 = v147;
    if (!v238[5])
    {
      [(__CFString *)theString rangeOfCharacterFromSet:spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__followingSpaceCharacterSet options:12 range:0];
      uint64_t v101 = @" ";
      if (!v102) {
        uint64_t v101 = &stru_26C1C71A8;
      }
      long long v169 = v101;
    }
  }
  NSUInteger v104 = v232[4];
  uint64_t v103 = v232[5];
  if ([obj count])
  {
    long long v177 = 0u;
    long long v178 = 0u;
    long long v175 = 0u;
    long long v176 = 0u;
    uint64_t v105 = [obj countByEnumeratingWithState:&v175 objects:v244 count:16];
    NSUInteger v104 = location;
    if (v105)
    {
      uint64_t v106 = *(void *)v176;
      do
      {
        for (uint64_t n = 0; n != v105; ++n)
        {
          if (*(void *)v176 != v106) {
            objc_enumerationMutation(obj);
          }
          uint64_t v108 = *(void *)(*((void *)&v175 + 1) + 8 * n);
          id v109 = objc_alloc(MEMORY[0x263F08728]);
          double v110 = (void *)[v109 initWithRange:location + a6, 0, objc_msgSend(NSString, "stringWithFormat:", @"%@%@%@", v169, v108, @" " replacementString];
          [v170 addObject:v110];
        }
        uint64_t v105 = [obj countByEnumeratingWithState:&v175 objects:v244 count:16];
      }
      while (v105);
      uint64_t v103 = 0;
      uint64_t v111 = 0;
      NSUInteger v104 = location;
      goto LABEL_229;
    }
    uint64_t v103 = 0;
LABEL_228:
    uint64_t v111 = 0;
    goto LABEL_229;
  }
  if (v150)
  {
    id v112 = objc_alloc(MEMORY[0x263F08B00]);
    uint64_t v113 = (void *)[v112 initWithRange:v232[4] + a6, v232[5], objc_msgSend(NSString, "stringWithFormat:", @"%@%@%@", v169, v150, @" " replacementString];
    [v170 addObject:v113];
  }
  else if (v162)
  {
    id v114 = objc_alloc(MEMORY[0x263F08758]);
    id v115 = (void *)[v114 initWithRange:v146 + a6, v100, objc_msgSend(NSString, "stringWithFormat:", @"%@%@%@", v169, v162, @" " replacementString];
    [v170 addObject:v115];

    uint64_t v103 = v100;
    NSUInteger v104 = v146;
  }
  else if ([v165 count])
  {
    NSUInteger v104 = v208[4];
    uint64_t v103 = v208[5];
  }
  if (!v103) {
    goto LABEL_228;
  }
  uint64_t v120 = (void *)-[__CFString substringWithRange:](theString, "substringWithRange:", v104, v103);
  uint64_t v111 = (uint64_t)v120;
  if (v149) {
    uint64_t v111 = initialCapitalizedString(v120, (uint64_t)v156);
  }
  id v121 = objc_alloc(MEMORY[0x263F08728]);
  uint64_t v122 = (void *)[v121 initWithRange:v104 + a6, v103, objc_msgSend(NSString, "stringWithFormat:", @"%@%@%@", v169, v111, @" " replacementString];
  [v170 insertObject:v122 atIndex:0];

LABEL_229:
  if (![obj count] && objc_msgSend(v166, "count"))
  {
    unint64_t v126 = v238[4];
    if (v126 <= v104)
    {
      char v128 = &stru_26C1C71A8;
LABEL_246:
      long long v173 = 0u;
      long long v174 = 0u;
      long long v171 = 0u;
      long long v172 = 0u;
      uint64_t v132 = [v166 countByEnumeratingWithState:&v171 objects:v243 count:16];
      if (v132)
      {
        NSUInteger v133 = v104 + a6;
        uint64_t v134 = *(void *)v172;
        do
        {
          for (iuint64_t i = 0; ii != v132; ++ii)
          {
            if (*(void *)v172 != v134) {
              objc_enumerationMutation(v166);
            }
            int v136 = (void *)[NSString stringWithFormat:@"%@%@", v128, *(void *)(*((void *)&v171 + 1) + 8 * ii)];
            v137 = v136;
            if (!v111 || ([v136 isEqualToString:v111] & 1) == 0)
            {
              id v138 = objc_alloc(MEMORY[0x263F08728]);
              uint64_t v139 = (void *)[v138 initWithRange:v133, v103, objc_msgSend(NSString, "stringWithFormat:", @"%@%@%@", v169, v137, @" " replacementString];
              [v170 addObject:v139];
            }
          }
          uint64_t v132 = [v166 countByEnumeratingWithState:&v171 objects:v243 count:16];
        }
        while (v132);
      }
    }
    else
    {
      uint64_t v127 = -[__CFString substringWithRange:](theString, "substringWithRange:", v104, v126 - v104);
      if (!v162)
      {
        char v128 = (__CFString *)v127;
        if (![v165 count]) {
          goto LABEL_246;
        }
      }
    }
  }
  if (![obj count] && !v150 && !v162 && objc_msgSend(v165, "count"))
  {
    uint64_t v123 = (void *)[MEMORY[0x263EFF980] array];
    id v124 = (id)[v165 firstObject];
    for (juint64_t j = 1; jj < [v165 count]; ++jj)
      [v123 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@%@%@", v169, objc_msgSend(v165, "objectAtIndex:", jj), @" "];
    id v129 = objc_alloc(MEMORY[0x263F087D0]);
    id v130 = (void *)[v129 initWithRange:v208[4] + a6, v208[5], objc_msgSend(NSString, "stringWithFormat:", @"%@%@%@", v169, v124, @" ", v123 replacementString alternativeStrings];
    [v170 addObject:v130];
  }
LABEL_243:
  [(AppleSpell *)v151 invalidateTagger:v152];
LABEL_244:
  _Block_object_dispose(v206, 8);
  _Block_object_dispose(&v207, 8);
  _Block_object_dispose(&v213, 8);
  _Block_object_dispose(&v219, 8);
  _Block_object_dispose(&v225, 8);
  _Block_object_dispose(&v231, 8);
  _Block_object_dispose(&v237, 8);
  return v170;
}

id __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F089C0] whitespaceAndNewlineCharacterSet];
  objc_msgSend(v2, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "punctuationCharacterSet"));
  [v2 invert];
  spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__nonPunctuationWhitespaceAndNewlineCharacterSet = [v2 copy];
  spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__terminatorCharacterSet = (uint64_t)(id)[*(id *)(a1 + 32) sentenceTerminatorCharacterSet];
  spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__nonPunctuationCharacterSet = (uint64_t)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "punctuationCharacterSet"), "invertedSet");
  spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__whitespaceCharacterSet = (uint64_t)(id)[MEMORY[0x263F08708] whitespaceCharacterSet];
  id result = (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@".!?։۔।።᙮‼‽⁈⁉。！．？｡,;:]}”’"]);
  spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__followingSpaceCharacterSet = (uint64_t)result;
  return result;
}

uint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "rangeOfComposedCharacterSequencesForRange:");
  uint64_t v11 = v10;
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "rangeOfCharacterFromSet:options:range:", spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__nonPunctuationWhitespaceAndNewlineCharacterSet, 0, v9, v10);
  if (v13)
  {
    unint64_t v14 = *(void *)(a1 + 48);
    if (v9 + v11 < v14)
    {
      if (v9 + v11 + 1 != v14) {
        goto LABEL_8;
      }
      uint64_t result = [*(id *)(a1 + 32) characterAtIndex:v14 - 1];
      if (result != 8217 && result != 39) {
        goto LABEL_8;
      }
      ++v11;
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v15 + 32) = v9;
    *(void *)(v15 + 40) = v11;
LABEL_8:
    *a7 = 1;
  }
  return result;
}

uint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  unint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "rangeOfComposedCharacterSequencesForRange:");
  uint64_t v11 = v10;
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "rangeOfCharacterFromSet:options:range:", spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__nonPunctuationWhitespaceAndNewlineCharacterSet, 0, v9, v10);
  if (v13)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v15 = *(void *)(v14 + 32);
    unint64_t v16 = v9 + v11;
    if (v9 <= *(void *)(v14 + 40) + v15 && v16 >= v15)
    {
      *(void *)(v14 + 40) = v16 - v15;
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      unint64_t v15 = *(void *)(v14 + 32);
    }
    unint64_t v18 = *(void *)(a1 + 56) + *(void *)(a1 + 48);
    if (v18 >= v15 && v18 <= *(void *)(v14 + 40) + v15) {
      *(void *)(v14 + 40) = v18 - v15;
    }
    *a7 = 1;
  }
  return result;
}

uint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  unint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "rangeOfComposedCharacterSequencesForRange:");
  uint64_t v11 = v10;
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "rangeOfCharacterFromSet:options:range:", spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography__nonPunctuationWhitespaceAndNewlineCharacterSet, 0, v9, v10);
  if (v13)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    if (!*(void *)(v14 + 40)) {
      *(void *)(v14 + 32) = v9 + v11;
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
    if (!*(void *)(v15 + 40))
    {
      *(void *)(v15 + 32) = v9;
      *(void *)(v15 + 40) = v11;
      unint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) - (v9 + v11);
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      *(void *)(v17 + 32) = v9 + v11;
      *(void *)(v17 + 40) = v16;
    }
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v19 = *(void *)(v18 + 32);
    BOOL v20 = v19 > v9;
    unint64_t v21 = v19 - v9;
    if (v20)
    {
      unint64_t v22 = v21 + *(void *)(v18 + 40);
      *(void *)(v18 + 32) = v9;
      *(void *)(v18 + 40) = v22;
    }
    uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8);
    unint64_t v24 = *(void *)(v23 + 24);
    *(void *)(v23 + 24) = v24 + 1;
    if (v24 >= 6) {
      *a7 = 1;
    }
  }
  return result;
}

uint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_5(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  int v11 = a3 > *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32)
     && [*(id *)(a1 + 32) characterAtIndex:a3 - 1] == 45;
  _addEmojiForStringToArray(v10, *(void **)(a1 + 40), *(void **)(a1 + 48), 0, v11);
  uint64_t result = [*(id *)(a1 + 48) count];
  if (result)
  {
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32)
        - a3
        + *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    *(void *)(v14 + 32) = a3;
    *(void *)(v14 + 40) = v13;
    *a7 = 1;
  }
  return result;
}

unint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_6(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  int v11 = a3 > *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32)
     && [*(id *)(a1 + 32) characterAtIndex:a3 - 1] == 45;
  _addEmojiForStringToArray(v10, *(void **)(a1 + 40), *(void **)(a1 + 48), 0, v11);
  unint64_t result = [*(id *)(a1 + 48) count];
  if (result >= 5) {
    *a7 = 1;
  }
  return result;
}

unint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  _addEmojiForStringToArray(a2, *(void **)(a1 + 32), *(void **)(a1 + 40), 1, 0);
  unint64_t result = [*(id *)(a1 + 40) count];
  if (result > 4
    || (uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8),
        unint64_t v11 = *(void *)(v10 + 24),
        *(void *)(v10 + 24) = v11 + 1,
        v11 >= 0x11))
  {
    *a7 = 1;
  }
  return result;
}

unint64_t __107__AppleSpell_Completion__spellServer_candidatesForSelectedRange_inString_offset_types_options_orthography___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  _addEmojiForStringToArray(a2, *(void **)(a1 + 32), *(void **)(a1 + 40), 1, 0);
  unint64_t result = [*(id *)(a1 + 40) count];
  if (result > 4
    || (uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8),
        unint64_t v11 = *(void *)(v10 + 24),
        *(void *)(v10 + 24) = v11 + 1,
        v11 >= 0x11))
  {
    *a7 = 1;
  }
  return result;
}

- (id)vietnameseModificationForWord:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", objc_msgSend(a3, "decomposedStringWithCanonicalMapping"));
  if (vietnameseModificationForWord__onceToken != -1) {
    dispatch_once(&vietnameseModificationForWord__onceToken, &__block_literal_global_2);
  }
  unint64_t v4 = [v3 length];
  do
  {
    if (v4 >= 2)
    {
      uint64_t v5 = [v3 characterAtIndex:--v4];
      if (([(id)vietnameseModificationForWord__vietnameseVowelCharacterSet characterIsMember:v5] & 1) == 0) {
        continue;
      }
    }
    goto LABEL_17;
  }
  while (![(id)vietnameseModificationForWord__vietnameseToneLetterCharacterSet characterIsMember:v5]);
  char v6 = 1;
  objc_msgSend(v3, "replaceCharactersInRange:withString:", v4, 1, &stru_26C1C71A8);
  if (v5 == [v3 characterAtIndex:v4 - 1])
  {
    BOOL v7 = 0;
    goto LABEL_18;
  }
  if ((int)v5 <= 113)
  {
    if (v5 != 102)
    {
      if (v5 == 106)
      {
        char v6 = 0;
        BOOL v7 = @"̣";
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    char v6 = 0;
    BOOL v7 = @"̀";
  }
  else
  {
    switch(v5)
    {
      case 'r':
        char v6 = 0;
        BOOL v7 = @"̉";
        break;
      case 's':
        char v6 = 0;
        BOOL v7 = @"́";
        break;
      case 'x':
        char v6 = 0;
        BOOL v7 = @"̃";
        break;
      default:
LABEL_17:
        BOOL v7 = 0;
        char v6 = 1;
        break;
    }
  }
LABEL_18:
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"dd", @"đ", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"aa", @"â", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"ee", @"ê", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"oo", @"ô", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"aw", @"ă", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"ow", @"ơ", 0, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"uw", @"ư", 0, 0, objc_msgSend(v3, "length"));
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = [v3 length];
    while (v8)
    {
      if (objc_msgSend((id)vietnameseModificationForWord__vietnameseToneVowelCharacterSet, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", --v8)))
      {
        if (v8
          && ((objc_msgSend((id)vietnameseModificationForWord__vietnameseToneVowelCharacterSet, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v8 - 1)) & 1) != 0|| objc_msgSend((id)vietnameseModificationForWord__vietnameseAccentCharacterSet, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v8 - 1))))
        {
          --v8;
        }
        uint64_t v9 = v8 + 1;
        if (v8 + 1 < (unint64_t)[v3 length])
        {
          if (objc_msgSend((id)vietnameseModificationForWord__vietnameseAccentCharacterSet, "characterIsMember:", objc_msgSend(v3, "characterAtIndex:", v8 + 1)))uint64_t v10 = v8 + 1; {
          else
          }
            uint64_t v10 = v8;
          uint64_t v9 = v10 + 1;
        }
        objc_msgSend(v3, "replaceCharactersInRange:withString:", v9, 0, v7);
        break;
      }
    }
  }
  return (id)[v3 precomposedStringWithCanonicalMapping];
}

id __56__AppleSpell_Correction__vietnameseModificationForWord___block_invoke()
{
  vietnameseModificationForWord__vietnameseVowelCharacterSet = (uint64_t)(id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"aeiou"];
  vietnameseModificationForWord__vietnameseToneVowelCharacterSet = (uint64_t)(id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"aeou"];
  vietnameseModificationForWord__vietnameseToneLetterCharacterSet = (uint64_t)(id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"fjrsxz"];
  id result = (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"̛̂̆"];
  vietnameseModificationForWord__vietnameseAccentCharacterSet = (uint64_t)result;
  return result;
}

- (char)_validatedGuessWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkUser:(BOOL)a8 additionalBuffer:(char *)a9
{
  if (a9)
  {
    id result = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, a4, 0x8000100u, 0);
    if (result)
    {
      id result = [(AppleSpell *)self vietnameseModificationForWord:result];
      if (result)
      {
        uint64_t v13 = result;
        CFIndex v14 = [result length];
        CFIndex v18 = 0;
        v19.NSUInteger location = 0;
        v19.NSUInteger length = v14;
        CFIndex Bytes = CFStringGetBytes((CFStringRef)v13, v19, 0x8000100u, 0x5Fu, 0, (UInt8 *)a9, 24, &v18);
        id result = 0;
        if (v14 == Bytes)
        {
          a9[v18] = 0;
          HIBYTE(usedBufLen) = 1;
          *(_DWORD *)((char *)&usedBufLen + 3) = 257;
          BYTE2(usedBufLen) = a8;
          LOWORD(usedBufLen) = 1;
          if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a9, usedBufLen, 0))
          {
            return a9;
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  else
  {
    HIBYTE(usedBufLena) = 1;
    *(_DWORD *)((char *)&usedBufLena + 3) = 257;
    BYTE2(usedBufLena) = a8;
    LOWORD(usedBufLena) = 1;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, a4, a5, a6, a7, 1, usedBufLena, 0))
    {
      return a3;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_addGuessesForWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 minAutocorrectionLength:(unint64_t)a8 previousLetter:(unsigned __int16)a9 nextLetter:(unsigned __int16)a10 basicOnly:(BOOL)a11 toGuesses:(id)a12
{
  uint64_t v222 = *MEMORY[0x263EF8340];
  uint64_t v15 = [a5 encoding];
  long long v216 = (unsigned char *)[a5 accents];
  char v196 = [a5 isEnglish];
  if (v196)
  {
    unint64_t v16 = 0;
  }
  else if ([a5 isVietnamese])
  {
    unint64_t v16 = &v219;
  }
  else
  {
    unint64_t v16 = 0;
  }
  unsigned int v17 = *a3;
  int v18 = isUpperCaseX(v17, v15);
  int v19 = v18;
  unint64_t v190 = a4 - 1;
  if (a4 > 1) {
    int v20 = v18;
  }
  else {
    int v20 = 0;
  }
  if (v17)
  {
    unint64_t v21 = a3 + 1;
    int v22 = 1;
    do
    {
      if (isAnyAlphaX(v17, v15))
      {
        v20 &= isUpperCaseX(v17, v15);
      }
      else
      {
        if (v17 == 45) {
          int v23 = v22;
        }
        else {
          int v23 = 0;
        }
        if (v17 != 39) {
          int v22 = v23;
        }
      }
      unsigned int v24 = *v21++;
      unsigned int v17 = v24;
    }
    while (v24);
  }
  else
  {
    int v22 = 1;
  }
  char v194 = v20;
  int v195 = v19 & ~v20;
  int v188 = (v16 == 0) & (v22 ^ 1);
  if (a4 >= a8
    && v216
    && (v20 & 1) == 0
    && a4 <= 0x1B
    && ((v16 == 0) & (v22 ^ 1)) == 0
    && ([a12 isFull] & 1) == 0)
  {
    char v25 = *a3;
    if (*a3)
    {
      id v26 = a3 + 1;
      uint64_t v27 = (char *)&v220;
      do
      {
        *v27++ = v25;
        int v28 = *v26++;
        char v25 = v28;
      }
      while (v28);
    }
    else
    {
      uint64_t v27 = (char *)&v220;
    }
    *uint64_t v27 = 0;
    int v205 = v220;
    if (v220)
    {
      if (v195) {
        uint64_t v29 = 3;
      }
      else {
        uint64_t v29 = 1;
      }
      long long v197 = &v220;
      do
      {
        int v30 = *v216;
        if (*v216)
        {
          long long v200 = v197 + 1;
          int v31 = v216;
          do
          {
            if (v30 == v205)
            {
              *long long v197 = v31[1];
              unint64_t v32 = [(AppleSpell *)self _validatedGuessWordBuffer:&v220 length:a4 languageObject:a5 connection:a6 sender:a7 checkUser:0 additionalBuffer:v16];
              if (v32) {
                [a12 addCandidateWithBuffer:v32 encoding:v15 transform:v29 errorType:1];
              }
              int v33 = *v200;
              if (*v200)
              {
                uint64_t v34 = v197 + 1;
                do
                {
                  int v35 = *v216;
                  if (*v216)
                  {
                    uint64_t v36 = v216 + 2;
                    do
                    {
                      if (v35 == v33)
                      {
                        unsigned char *v34 = *(v36 - 1);
                        unint64_t v37 = [(AppleSpell *)self _validatedGuessWordBuffer:&v220 length:a4 languageObject:a5 connection:a6 sender:a7 checkUser:0 additionalBuffer:v16];
                        if (v37) {
                          [a12 addCandidateWithBuffer:v37 encoding:v15 transform:v29 errorType:1];
                        }
                      }
                      int v38 = *v36;
                      v36 += 2;
                      int v35 = v38;
                    }
                    while (v38);
                  }
                  unsigned char *v34 = v33;
                  int v39 = *++v34;
                  int v33 = v39;
                }
                while (v39);
              }
            }
            int v40 = v31[2];
            v31 += 2;
            int v30 = v40;
          }
          while (v40);
        }
        *long long v197 = v205;
        int v41 = *++v197;
        int v205 = v41;
      }
      while (v41);
    }
  }
  if (a4 > a8 && v15 == 1280 && ([a12 isFull] & 1) == 0)
  {
    char v42 = *a3;
    if (*a3)
    {
      CFIndex v43 = a3 + 1;
      uint64_t v44 = (char *)&v220;
      do
      {
        *v44++ = v42;
        int v45 = *v43++;
        char v42 = v45;
      }
      while (v45);
    }
    else
    {
      uint64_t v44 = (char *)&v220;
    }
    *uint64_t v44 = 0;
    unsigned __int8 v46 = v220;
    if (v220)
    {
      unint64_t v47 = (char *)&v220;
      while (v46 - 65 >= 0x1A && v46 - 192 >= 0x17)
      {
        if (v46 - 216 < 7 || v46 - 138 <= 0x15 && ((1 << (v46 + 118)) & 0x200015) != 0)
        {
          if (v46 - 216 >= 7)
          {
            char v49 = v46;
            if (v46 - 138 > 0x15) {
              goto LABEL_80;
            }
            char v49 = v46;
            if (((1 << (v46 + 118)) & 0x200015) == 0) {
              goto LABEL_80;
            }
LABEL_77:
            if (v46 == 159) {
              char v49 = -1;
            }
            else {
              char v49 = v46 + 16;
            }
            goto LABEL_80;
          }
          goto LABEL_74;
        }
        if (v46 > 0xF7u || v46 - 97 < 0x1A || v46 - 223 < 0x18)
        {
          if (v46 - 154 > 4 || ((1 << (v46 + 102)) & 0x15) == 0)
          {
            char v49 = v46;
            if (v46 != 223)
            {
              if (v46 == 255) {
                char v49 = -97;
              }
              else {
                char v49 = v46 - 32;
              }
            }
            goto LABEL_80;
          }
        }
        else
        {
          char v49 = v46;
          if (v46 - 154 > 4) {
            goto LABEL_80;
          }
          char v49 = v46;
          if (((1 << (v46 + 102)) & 0x15) == 0) {
            goto LABEL_80;
          }
        }
        char v49 = v46 - 16;
LABEL_80:
        *unint64_t v47 = v49;
        if ([(AppleSpell *)self checkNameWordBuffer:&v220 length:a4 languageObject:a5 globalOnly:0])
        {
          [a12 addCandidateWithBuffer:&v220 encoding:1280 errorType:2];
        }
        *unint64_t v47 = v46;
        int v50 = *++v47;
        unsigned __int8 v46 = v50;
        if (!v50) {
          goto LABEL_97;
        }
      }
      if (v46 - 138 <= 0x15 && ((1 << (v46 + 118)) & 0x200015) != 0) {
        goto LABEL_77;
      }
LABEL_74:
      char v49 = v46 + 32;
      goto LABEL_80;
    }
  }
LABEL_97:
  char v51 = v196 & v195 ^ 1;
  if (a4 <= a8) {
    char v51 = 1;
  }
  if ((v51 & 1) == 0 && a3[v190] == 115 && a3[a4 - 2] != 39 && ([a12 isFull] & 1) == 0)
  {
    char v52 = *a3;
    if (*a3)
    {
      uint64_t v53 = a3 + 1;
      uint64_t v54 = (char *)&v220;
      do
      {
        *v54++ = v52;
        int v55 = *v53++;
        char v52 = v55;
      }
      while (v55);
    }
    *(&v220 + v190) = 0;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", &v220, 0x100000101000001, 0))
    {
      *(&v220 + v190) = 39;
      *(_WORD *)(&v220 + a4) = 115;
      [a12 addCandidateWithBuffer:&v220 encoding:v15 errorType:3];
    }
  }
  if (a4 < a8 || a4 > 0x1B) {
    char v57 = 1;
  }
  else {
    char v57 = v188;
  }
  if ((v57 & 1) == 0 && ([a12 isFull] & 1) == 0)
  {
    char v58 = *a3;
    if (*a3)
    {
      unsigned int v59 = a3 + 1;
      long long v60 = (char *)&v220;
      do
      {
        *v60++ = v58;
        int v61 = *v59++;
        char v58 = v61;
      }
      while (v61);
    }
    else
    {
      long long v60 = (char *)&v220;
    }
    char *v60 = 0;
    if (a4)
    {
      if (v15 == 517) {
        uint64_t v62 = 32;
      }
      else {
        uint64_t v62 = 26;
      }
      char v63 = 97;
      if (v15 == 517) {
        char v63 = -48;
      }
      char v181 = v63;
      uint64_t v184 = v62;
      uint64_t v64 = 3;
      if (!v195) {
        uint64_t v64 = 1;
      }
      if (v194) {
        uint64_t v64 = 2;
      }
      uint64_t v198 = v64;
      unint64_t v65 = a4;
      do
      {
        unint64_t v66 = v65 - 1;
        if (v65 == 1 && !isAnyAlphaX(v221, v15)) {
          break;
        }
        id v67 = &v220 + v66;
        if (v65 != a4 || isAnyAlphaX(*(v67 - 1), v15))
        {
          unsigned int v201 = *(&v220 + v66);
          int v210 = toLowerX(*(&v220 + v66), v15);
          char v68 = v195;
          if (v65 != 1) {
            char v68 = 0;
          }
          char v206 = v194 | v68;
          unsigned __int8 v69 = v181;
          uint64_t v70 = v184;
          do
          {
            if (v210 != v69 && adjacentMatch(v210, v69, v15))
            {
              unsigned __int8 v71 = v69;
              if (v206) {
                unsigned __int8 v71 = toUpperX(v69, v15);
              }
              *id v67 = v71;
              uint64_t v72 = [(AppleSpell *)self _validatedGuessWordBuffer:&v220 length:a4 languageObject:a5 connection:a6 sender:a7 checkUser:0 additionalBuffer:v16];
              if (v72) {
                [a12 addReplacementCandidateWithBuffer:v72 encoding:v15 transform:v198 intendedCharacter:*v67 actualCharacter:v201];
              }
            }
            ++v69;
            --v70;
          }
          while (v70);
          *id v67 = v201;
          unint64_t v66 = v65 - 1;
        }
        unint64_t v65 = v66;
      }
      while (v66);
    }
  }
  int v73 = a11 | v188;
  if (a4 < a8) {
    int v73 = 1;
  }
  int v185 = v73;
  if ((v73 & 1) == 0)
  {
    uint64_t v74 = v15;
    if (([a12 isFull] & 1) == 0)
    {
      char v75 = *a3;
      if (*a3)
      {
        CFRange v76 = a3 + 1;
        int v77 = (char *)&v220;
        do
        {
          *v77++ = v75;
          int v78 = *v76++;
          char v75 = v78;
        }
        while (v78);
      }
      else
      {
        int v77 = (char *)&v220;
      }
      *int v77 = 0;
      unsigned int v79 = v220;
      if (v220)
      {
        uint64_t v80 = 3;
        if (!v195) {
          uint64_t v80 = 1;
        }
        if (v194) {
          uint64_t v81 = 2;
        }
        else {
          uint64_t v81 = v80;
        }
        uint64_t v82 = &v221;
        do
        {
          unsigned int v83 = *v82;
          if (!*v82) {
            break;
          }
          if (isAnyAlphaX(v79, v15) && isAnyAlphaX(v83, v15))
          {
            *(v82 - 1) = v83;
            *uint64_t v82 = v79;
            uint64_t v84 = [(AppleSpell *)self _validatedGuessWordBuffer:&v220 length:a4 languageObject:a5 connection:a6 sender:a7 checkUser:0 additionalBuffer:v16];
            if (v84) {
              [a12 addTranspositionCandidateWithBuffer:v84 encoding:v15 transform:v81 intendedFirstCharacter:*(v82 - 1) intendedSecondCharacter:*v82];
            }
            unsigned int v83 = *(v82 - 1);
            *(v82 - 1) = *v82;
            *uint64_t v82 = v83;
          }
          ++v82;
          unsigned int v79 = v83;
        }
        while (v83);
      }
    }
    if (a4 > 0x1B)
    {
      int v186 = 0;
LABEL_213:
      char v183 = 1;
      goto LABEL_245;
    }
    if (([a12 isFull] & 1) == 0)
    {
      char v85 = *a3;
      if (*a3)
      {
        uint64_t v86 = a3 + 1;
        uint64_t v87 = (char *)&v220;
        do
        {
          *v87++ = v85;
          int v88 = *v86++;
          char v85 = v88;
        }
        while (v88);
      }
      else
      {
        uint64_t v87 = (char *)&v220;
      }
      char *v87 = 0;
      if (a4)
      {
        if (v15 == 517) {
          uint64_t v89 = 32;
        }
        else {
          uint64_t v89 = 26;
        }
        char v90 = 97;
        if (v15 == 517) {
          char v90 = -48;
        }
        char v180 = v90;
        uint64_t v182 = v89;
        uint64_t v91 = 3;
        if (!v195) {
          uint64_t v91 = 1;
        }
        if (v194) {
          uint64_t v91 = 2;
        }
        uint64_t v199 = v91;
        unint64_t v92 = a4;
        do
        {
          unint64_t v93 = v92 - 1;
          if (v92 == 1 && !isAnyAlphaX(v221, v15)) {
            break;
          }
          uint64_t v94 = &v220 + v93;
          if (v92 != a4 || isAnyAlphaX(*(v94 - 1), v15))
          {
            unsigned int v202 = *(&v220 + v93);
            int v211 = toLowerX(*(&v220 + v93), v15);
            char v95 = v195;
            if (v92 != 1) {
              char v95 = 0;
            }
            char v207 = v194 | v95;
            unsigned __int8 v96 = v180;
            uint64_t v97 = v182;
            do
            {
              if (v211 != v96 && !adjacentMatch(v211, v96, v15))
              {
                unsigned __int8 v98 = v96;
                if (v207) {
                  unsigned __int8 v98 = toUpperX(v96, v15);
                }
                unsigned __int8 *v94 = v98;
                unint64_t v99 = [(AppleSpell *)self _validatedGuessWordBuffer:&v220 length:a4 languageObject:a5 connection:a6 sender:a7 checkUser:0 additionalBuffer:v16];
                if (v99) {
                  [a12 addReplacementCandidateWithBuffer:v99 encoding:v15 transform:v199 intendedCharacter:*v94 actualCharacter:v202];
                }
              }
              ++v96;
              --v97;
            }
            while (v97);
            unsigned __int8 *v94 = v202;
            unint64_t v93 = v92 - 1;
          }
          unint64_t v92 = v93;
        }
        while (v93);
      }
    }
  }
  BOOL v100 = a11;
  if (!v216) {
    BOOL v100 = 1;
  }
  int v186 = v185 ^ 1;
  if (a4 > 0x1B)
  {
    char v183 = 1;
LABEL_244:
    uint64_t v74 = v15;
    goto LABEL_245;
  }
  uint64_t v74 = v15;
  if (a4 < a8 || ((v100 | v188) & 1) != 0) {
    goto LABEL_213;
  }
  if (([a12 isFull] & 1) == 0)
  {
    char v101 = *a3;
    if (*a3)
    {
      uint64_t v102 = a3 + 1;
      uint64_t v103 = (char *)&v220;
      char v104 = v194;
      do
      {
        *v103++ = v101;
        int v105 = *v102++;
        char v101 = v105;
      }
      while (v105);
    }
    else
    {
      uint64_t v103 = (char *)&v220;
      char v104 = v194;
    }
    *uint64_t v103 = 0;
    if (a4)
    {
      uint64_t v106 = 3;
      if (!v195) {
        uint64_t v106 = 1;
      }
      if (v104) {
        uint64_t v106 = 2;
      }
      uint64_t v208 = v106;
      unint64_t v107 = a4;
      do
      {
        unint64_t v108 = v107 - 1;
        if (v107 == 1 && !isAnyAlphaX(v221, v15)) {
          break;
        }
        id v109 = &v220 + v108;
        if (v107 != a4 || isAnyAlphaX(*(v109 - 1), v15))
        {
          unsigned int v212 = *v109;
          if (*v216)
          {
            int v110 = toLowerX(*v109, v15);
            uint64_t v111 = v216 + 2;
            if (v107 == 1) {
              char v112 = v195;
            }
            else {
              char v112 = 0;
            }
            char v113 = v194 | v112;
            do
            {
              uint64_t v114 = *(v111 - 1);
              if (v110 != v114)
              {
                if (v113) {
                  LOBYTE(v114) = toUpperX(v114, v15);
                }
                *id v109 = v114;
                id v115 = [(AppleSpell *)self _validatedGuessWordBuffer:&v220 length:a4 languageObject:a5 connection:a6 sender:a7 checkUser:0 additionalBuffer:v16];
                if (v115) {
                  [a12 addReplacementCandidateWithBuffer:v115 encoding:v15 transform:v208 intendedCharacter:*v109 actualCharacter:v212];
                }
              }
              int v116 = *v111;
              v111 += 2;
            }
            while (v116);
          }
          *id v109 = v212;
          unint64_t v108 = v107 - 1;
        }
        unint64_t v107 = v108;
      }
      while (v108);
    }
    char v183 = 0;
    goto LABEL_244;
  }
  char v183 = 0;
LABEL_245:
  if (a4 >= a8 && !a11 && ([a12 isFull] & 1) == 0 && *a3)
  {
    uint64_t v117 = 0;
    uint64_t v213 = &a3[a4 - 1];
    v118 = a3;
    while (1)
    {
      if (v118 == a3 && !isAnyAlphaX(a3[1], v74)
        || v118 == v213 && !isAnyAlphaX(a3[a4 - 2], v74))
      {
        goto LABEL_283;
      }
      char v119 = *a3;
      if (*a3)
      {
        uint64_t v120 = (char *)&v220;
        id v121 = a3 + 1;
        uint64_t v122 = v117;
        do
        {
          if (v122) {
            *v120++ = v119;
          }
          int v123 = *v121++;
          char v119 = v123;
          --v122;
        }
        while (v123);
      }
      else
      {
        uint64_t v120 = (char *)&v220;
      }
      *uint64_t v120 = 0;
      id v124 = [(AppleSpell *)self _validatedGuessWordBuffer:&v220 length:v190 languageObject:a5 connection:a6 sender:a7 checkUser:0 additionalBuffer:v16];
      if (!v124) {
        goto LABEL_283;
      }
      if (v118 != a3) {
        break;
      }
      int v126 = *a3;
      BOOL v127 = v126 == a9;
      if (v118 == v213 && v126 != a9) {
        goto LABEL_268;
      }
LABEL_269:
      if (a4 != a8 || v127)
      {
        if ((v195 & (v118 == a3)) != 0) {
          uint64_t v125 = 3;
        }
        else {
          uint64_t v125 = 0;
        }
        if (!v127) {
          goto LABEL_276;
        }
        [a12 addCandidateWithBuffer:v124 encoding:v74 transform:v125 errorType:5];
      }
LABEL_283:
      int v130 = *++v118;
      ++v117;
      if (!v130) {
        goto LABEL_284;
      }
    }
    if (v118 != v213)
    {
      if (a4 != a8)
      {
        uint64_t v125 = 0;
LABEL_276:
        if (v118 <= a3) {
          uint64_t v128 = 0;
        }
        else {
          uint64_t v128 = *(v118 - 1);
        }
        if (v118 >= v213) {
          uint64_t v129 = 0;
        }
        else {
          uint64_t v129 = v118[1];
        }
        [a12 addInsertionCandidateWithBuffer:v124 encoding:v74 transform:v125 intendedPrecedingCharacter:v128 insertedCharacter:*v118 intendedFollowingCharacter:v129];
        goto LABEL_283;
      }
      goto LABEL_283;
    }
LABEL_268:
    BOOL v127 = *v118 == a10;
    goto LABEL_269;
  }
LABEL_284:
  if (v186 && ([a12 isFull] & 1) == 0)
  {
    char v131 = *a3;
    if (*a3)
    {
      uint64_t v132 = a3 + 1;
      NSUInteger v133 = (char *)&v220;
      do
      {
        *v133++ = v131;
        int v134 = *v132++;
        char v131 = v134;
      }
      while (v134);
    }
    else
    {
      NSUInteger v133 = (char *)&v220;
    }
    *NSUInteger v133 = 0;
    uint64_t v187 = &v220 + a4;
    if ((a4 & 0x8000000000000000) == 0)
    {
      uint64_t v135 = &v220 + a4;
      do
      {
        v135[1] = *v135;
        --v135;
      }
      while (&v220 <= v135);
    }
    if (v220)
    {
      if (v74 == 517) {
        uint64_t v136 = 32;
      }
      else {
        uint64_t v136 = 26;
      }
      char v137 = 97;
      if (v74 == 517) {
        char v137 = -48;
      }
      char v189 = v137;
      uint64_t v191 = v136;
      unint64_t v214 = a4 + 1;
      uint64_t v138 = 3;
      if (!v195) {
        uint64_t v138 = 1;
      }
      if (v194) {
        uint64_t v138 = 2;
      }
      uint64_t v203 = v138;
      int64_t v139 = 0;
      uint64_t v140 = &v220;
      while (1)
      {
        int64_t v141 = v139;
        uint64_t v142 = v140;
        if (!v139) {
          break;
        }
        if (v139 != 1) {
          goto LABEL_310;
        }
        int v143 = isAnyAlphaX(v140[1], v74);
        int64_t v139 = v141;
        if (v143) {
          goto LABEL_310;
        }
LABEL_341:
        ++v139;
        uint64_t v140 = &v220 + v139;
        if (!*(&v220 + v139)) {
          goto LABEL_342;
        }
      }
      char v144 = isAnyAlphaX(v140[2], v74);
      int64_t v139 = 0;
      if ((v144 & 1) == 0) {
        goto LABEL_341;
      }
LABEL_310:
      if (v142 == v187 - 1)
      {
        int v145 = isAnyAlphaX(*(v187 - 2), v74);
        int64_t v139 = v141;
        if (!v145) {
          goto LABEL_341;
        }
      }
      if (v139 == a4)
      {
        int v146 = isAnyAlphaX(*(v142 - 2), v74);
        int64_t v139 = v141;
        if (!v146) {
          goto LABEL_341;
        }
      }
      char v147 = v195;
      if (v139) {
        char v147 = 0;
      }
      char v209 = v194 | v147;
      unsigned __int8 v149 = v189;
      uint64_t v148 = v191;
      while (1)
      {
        unsigned __int8 v150 = v149;
        if (v209) {
          unsigned __int8 v150 = toUpperX(v149, v74);
        }
        *uint64_t v142 = v150;
        long long v151 = [(AppleSpell *)self _validatedGuessWordBuffer:&v220 length:v214 languageObject:a5 connection:a6 sender:a7 checkUser:0 additionalBuffer:v16];
        if (!v151) {
          break;
        }
        id v152 = v151;
        uint64_t v153 = *v142;
        if (v141)
        {
          if (v141 != a4 || v153 != a10)
          {
            uint64_t v154 = *(v142 - 1);
            goto LABEL_334;
          }
        }
        else
        {
          int v162 = a9;
          if (!a4 && v153 != a9) {
            int v162 = a10;
          }
          if (v153 != v162)
          {
            uint64_t v154 = 0;
LABEL_334:
            if (v141 >= (uint64_t)a4) {
              uint64_t v158 = 0;
            }
            else {
              uint64_t v158 = v142[1];
            }
            id v159 = a12;
            uint64_t v160 = v74;
            uint64_t v161 = v203;
LABEL_338:
            [v159 addOmissionCandidateWithBuffer:v152 encoding:v160 transform:v161 intendedPrecedingCharacter:v154 omittedCharacter:v153 intendedFollowingCharacter:v158];
            goto LABEL_339;
          }
        }
        [a12 addCandidateWithBuffer:v151 encoding:v74 transform:v203 errorType:5];
LABEL_339:
        ++v149;
        if (!--v148)
        {
          *uint64_t v142 = v142[1];
          int64_t v139 = v141;
          goto LABEL_341;
        }
      }
      if (v141) {
        goto LABEL_339;
      }
      int v155 = *v142;
      int v156 = toUpperX(*v142, v74);
      if (v156 == v155) {
        goto LABEL_339;
      }
      *uint64_t v142 = v156;
      uint64_t v157 = [(AppleSpell *)self _validatedGuessWordBuffer:&v220 length:v214 languageObject:a5 connection:a6 sender:a7 checkUser:0 additionalBuffer:v16];
      if (!v157) {
        goto LABEL_339;
      }
      id v152 = v157;
      uint64_t v153 = *v142;
      uint64_t v158 = v142[1];
      id v159 = a12;
      uint64_t v160 = v74;
      uint64_t v161 = 0;
      uint64_t v154 = 0;
      goto LABEL_338;
    }
  }
LABEL_342:
  if ((v183 & 1) == 0 && ([a12 isFull] & 1) == 0)
  {
    char v163 = *a3;
    if (*a3)
    {
      uint64_t v164 = a3 + 1;
      id v165 = (char *)&v220;
      do
      {
        *v165++ = v163;
        int v166 = *v164++;
        char v163 = v166;
      }
      while (v166);
    }
    else
    {
      id v165 = (char *)&v220;
    }
    *id v165 = 0;
    long long v167 = &v220 + a4;
    id v168 = &v220;
    do
    {
      long long v169 = &v168[a4];
      v169[1] = v168[a4];
      --v168;
    }
    while (&v220 <= v169 - 1);
    if (v220)
    {
      int64_t v170 = 0;
      uint64_t v171 = 3;
      if (!v195) {
        uint64_t v171 = 1;
      }
      if (v194) {
        uint64_t v171 = 2;
      }
      uint64_t v204 = v171;
      long long v172 = &v220;
      do
      {
        if (v170)
        {
          if (v170 != 1 || isAnyAlphaX(v172[1], v74))
          {
LABEL_362:
            if ((v172 != v167 - 1 || isAnyAlphaX(*(v167 - 2), v74))
              && (v170 != a4 || isAnyAlphaX(*(v172 - 2), v74)))
            {
              if (*v216)
              {
                if (v170) {
                  char v173 = 0;
                }
                else {
                  char v173 = v195;
                }
                char v215 = v194 | v173;
                long long v174 = v216 + 2;
                do
                {
                  uint64_t v175 = *(v174 - 1);
                  if (v215) {
                    LOBYTE(v175) = toUpperX(v175, v74);
                  }
                  *long long v172 = v175;
                  long long v176 = [(AppleSpell *)self _validatedGuessWordBuffer:&v220 length:a4 + 1 languageObject:a5 connection:a6 sender:a7 checkUser:0 additionalBuffer:v16];
                  if (v176)
                  {
                    if (v170) {
                      uint64_t v177 = *(v172 - 1);
                    }
                    else {
                      uint64_t v177 = 0;
                    }
                    if (v170 >= (uint64_t)a4) {
                      uint64_t v178 = 0;
                    }
                    else {
                      uint64_t v178 = v172[1];
                    }
                    [a12 addOmissionCandidateWithBuffer:v176 encoding:v74 transform:v204 intendedPrecedingCharacter:v177 omittedCharacter:*v172 intendedFollowingCharacter:v178];
                  }
                  int v179 = *v174;
                  v174 += 2;
                }
                while (v179);
              }
              *long long v172 = v172[1];
            }
          }
        }
        else if (isAnyAlphaX(v172[2], v74))
        {
          goto LABEL_362;
        }
        ++v170;
        long long v172 = &v220 + v170;
      }
      while (*(&v220 + v170));
    }
  }
}

- (BOOL)_findMatchingRangesForRange:(_NSRange)a3 inString:(id)a4 keyEventArray:(id)a5 endingAtIndex:(unint64_t)a6 matchingStringRange:(_NSRange *)a7 correctableStringRange:(_NSRange *)a8 matchingKeyEventRange:(_NSRange *)a9 firstMisspelledKeyEventIndex:(unint64_t *)a10 lastMisspelledKeyEventIndex:(unint64_t *)a11 previousBackspaceCount:(unint64_t *)a12
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v15 = [a4 length];
  unint64_t v16 = [a5 count];
  if (_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__onceToken == -1)
  {
    if (a6)
    {
LABEL_3:
      uint64_t v17 = 0;
      int v18 = 0;
      int v54 = 0;
      unint64_t v50 = location + length;
      unint64_t v19 = a6;
      unint64_t v48 = a6;
      unint64_t v55 = v16;
      NSUInteger v56 = a6;
      NSUInteger v20 = v16;
      unint64_t v57 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v58 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        while (1)
        {
          while (1)
          {
            unint64_t v21 = v20;
            if (v19 > v15 || !v20 || v20 > v16)
            {
LABEL_50:
              NSUInteger v20 = v21;
LABEL_51:
              a6 = v48;
              CFIndex v43 = a7;
              unint64_t v32 = v55;
              goto LABEL_55;
            }
            --v20;
            int v22 = (void *)[a5 objectAtIndex:v21 - 1];
            int v23 = v21 < 2 ? 0 : (void *)[a5 objectAtIndex:v21 - 2];
            if (([v22 flags] & 0x400) == 0) {
              break;
            }
            ++v17;
            int v18 = 1;
          }
          if (!v17) {
            break;
          }
          --v17;
        }
        int v52 = v18;
        unsigned int v24 = (void *)[v22 characters];
        unint64_t v25 = objc_msgSend(a4, "rangeOfString:options:range:", v24, 13, 0, v19);
        uint64_t v27 = v26;
        if (v23 && !objc_msgSend((id)objc_msgSend(v23, "characters"), "length")) {
          goto LABEL_50;
        }
        if ([v24 length] == 1)
        {
          uint64_t v28 = [v24 characterAtIndex:0];
          int v29 = [(id)_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__wsSet characterIsMember:v28];
          unsigned __int8 v30 = [(id)_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__nlSet characterIsMember:v28];
          if (!v27)
          {
            int v31 = &_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__nlSet;
            if (v29) {
              int v31 = &_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__wsSet;
            }
            if ((v29 | v30))
            {
              unint64_t v32 = v55;
            }
            else
            {
              int v31 = &_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__sqSet;
              unint64_t v32 = v55;
              if (v28 != 39)
              {
                if (v28 != 34) {
                  goto LABEL_52;
                }
                int v31 = &_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__dqSet;
              }
            }
            uint64_t v34 = objc_msgSend(a4, "rangeOfCharacterFromSet:options:range:", *v31, 12, 0, v19);
            if (!v35)
            {
LABEL_52:
              NSUInteger v20 = v21;
              a6 = v48;
              CFIndex v43 = a7;
              goto LABEL_55;
            }
            unint64_t v25 = v34;
          }
          int v33 = v54;
          if (v54 & v29) {
            goto LABEL_50;
          }
        }
        else
        {
          if (!v27) {
            goto LABEL_50;
          }
          int v29 = 0;
          int v33 = v54;
        }
        uint64_t v17 = 0;
        if (v52) {
          unint64_t v36 = v55;
        }
        else {
          unint64_t v36 = v21;
        }
        NSUInteger v37 = v56;
        unint64_t v38 = v57;
        if ((v52 & 1) == 0) {
          NSUInteger v37 = v25;
        }
        unint64_t v55 = v36;
        NSUInteger v56 = v37;
        if (v25 >= v50) {
          unint64_t v39 = v57;
        }
        else {
          unint64_t v39 = v21 - 1;
        }
        if (v25 >= v50) {
          uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v40 = v21 - 1;
        }
        unint64_t v41 = v58;
        if (v58 != 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v40 = v58;
        }
        if (location <= v25)
        {
          unint64_t v38 = v39;
          unint64_t v41 = v40;
        }
        unint64_t v57 = v38;
        unint64_t v58 = v41;
        if (location > v25) {
          int v42 = v29;
        }
        else {
          int v42 = 0;
        }
        int v54 = v42 | v33;
        unint64_t v19 = v25;
        int v18 = v52;
        if (!v19) {
          goto LABEL_51;
        }
      }
    }
  }
  else
  {
    dispatch_once(&_findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__onceToken, &__block_literal_global_98);
    if (a6) {
      goto LABEL_3;
    }
  }
  unint64_t v19 = 0;
  unint64_t v58 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v56 = 0;
  unint64_t v57 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v20 = v16;
  unint64_t v32 = v16;
  CFIndex v43 = a7;
LABEL_55:
  if (v32)
  {
    unint64_t v44 = v32 - 1;
    if (v32 == 1)
    {
      NSUInteger v20 = 0;
    }
    else
    {
      unint64_t v45 = a6;
      unint64_t v46 = 0;
      NSUInteger v20 = v44;
      while ((objc_msgSend((id)objc_msgSend(a5, "objectAtIndex:", v20 - 1), "flags") & 0x400) != 0)
      {
        ++v46;
        if (!--v20) {
          goto LABEL_64;
        }
      }
      unint64_t v44 = v46;
LABEL_64:
      a6 = v45;
    }
  }
  else
  {
    unint64_t v44 = 0;
  }
  if (v43)
  {
    v43->NSUInteger location = v19;
    v43->NSUInteger length = a6 - v19;
  }
  if (a8)
  {
    a8->NSUInteger location = v56;
    a8->NSUInteger length = a6 - v56;
  }
  if (a9)
  {
    a9->NSUInteger location = v20;
    a9->NSUInteger length = v16 - v20;
  }
  if (a10) {
    *a10 = v57;
  }
  if (a11) {
    *a11 = v58;
  }
  if (a12) {
    *a12 = v44;
  }
  return a6 > v19;
}

id __236__AppleSpell_Correction___findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount___block_invoke()
{
  _findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__wsSet = (uint64_t)(id)[MEMORY[0x263F08708] whitespaceCharacterSet];
  _findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__nlSet = (uint64_t)(id)[MEMORY[0x263F08708] newlineCharacterSet];
  _findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__sqSet = (uint64_t)(id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"'‘’‚"];
  id result = (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"\"«»“”„"];
  _findMatchingRangesForRange_inString_keyEventArray_endingAtIndex_matchingStringRange_correctableStringRange_matchingKeyEventRange_firstMisspelledKeyEventIndex_lastMisspelledKeyEventIndex_previousBackspaceCount__dqSet = (uint64_t)result;
  return result;
}

- (BOOL)findMatchingRangesForRange:(_NSRange)a3 inString:(id)a4 keyEventArray:(id)a5 selectedRangeValue:(id)a6 matchingStringRange:(_NSRange *)a7 correctableStringRange:(_NSRange *)a8 matchingKeyEventRange:(_NSRange *)a9 firstMisspelledKeyEventIndex:(unint64_t *)a10 lastMisspelledKeyEventIndex:(unint64_t *)a11 previousBackspaceCount:(unint64_t *)a12
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v19 = [a4 length];
  uint64_t v20 = [a5 count];
  unint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v37 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v33 = 0;
  long long v30 = xmmword_20CC61990;
  _NSRange v31 = (_NSRange)xmmword_20CC61990;
  _NSRange v29 = (_NSRange)xmmword_20CC61990;
  if (a5)
  {
    uint64_t v21 = v20;
    uint64_t v22 = [a5 count];
    if (v22)
    {
      int v23 = a8;
      unint64_t v34 = 0;
      unint64_t v35 = 0;
      unint64_t v32 = 0;
      _NSRange v28 = (_NSRange)0;
      long long v27 = 0uLL;
      _NSRange v26 = (_NSRange)0;
      if (a6)
      {
        LOBYTE(v22) = -[AppleSpell _findMatchingRangesForRange:inString:keyEventArray:endingAtIndex:matchingStringRange:correctableStringRange:matchingKeyEventRange:firstMisspelledKeyEventIndex:lastMisspelledKeyEventIndex:previousBackspaceCount:](self, "_findMatchingRangesForRange:inString:keyEventArray:endingAtIndex:matchingStringRange:correctableStringRange:matchingKeyEventRange:firstMisspelledKeyEventIndex:lastMisspelledKeyEventIndex:previousBackspaceCount:", location, length, a4, a5, [a6 rangeValue], &v31, &v30, &v29, &v37, &v36, &v33);
      }
      else
      {
        unint64_t v24 = v21 + location + length;
        if (__CFADD__(v21, location + length))
        {
          LOBYTE(v22) = 0;
        }
        else
        {
          do
          {
            if (v24 <= v19
              && -[AppleSpell _findMatchingRangesForRange:inString:keyEventArray:endingAtIndex:matchingStringRange:correctableStringRange:matchingKeyEventRange:firstMisspelledKeyEventIndex:lastMisspelledKeyEventIndex:previousBackspaceCount:](self, "_findMatchingRangesForRange:inString:keyEventArray:endingAtIndex:matchingStringRange:correctableStringRange:matchingKeyEventRange:firstMisspelledKeyEventIndex:lastMisspelledKeyEventIndex:previousBackspaceCount:", location, length, a4, a5, v24, &v28, &v27, &v26, &v35, &v34, &v32)&& v28.length >= v31.length)
            {
              long long v30 = v27;
              _NSRange v31 = v28;
              _NSRange v29 = v26;
              unint64_t v36 = v34;
              unint64_t v37 = v35;
              unint64_t v33 = v32;
            }
            --v24;
          }
          while (v24 >= location + length);
          LOBYTE(v22) = v31.length != 0;
        }
        int v23 = a8;
      }
      if (a7) {
        *a7 = v31;
      }
      if (v23) {
        *int v23 = (_NSRange)v30;
      }
      if (a9) {
        *a9 = v29;
      }
      if (a10) {
        *a10 = v37;
      }
      if (a11) {
        *a11 = v36;
      }
      if (a12) {
        *a12 = v33;
      }
    }
  }
  else
  {
    LOBYTE(v22) = 0;
  }
  return v22;
}

- (id)_capitalizationResultForString:(id)a3 range:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 languageObject:(id)a7 onlyAtInsertionPoint:(BOOL)a8 keyEventArray:(id)a9 selectedRangeValue:(id)a10
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v14 = initialCapitalizedString(a3, 0);
  if (!v14) {
    return 0;
  }
  uint64_t v15 = v14;
  if ([a3 isEqualToString:v14]) {
    return 0;
  }
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263F08758]), "initWithRange:replacementString:", location + a6, length, v15);
  return v17;
}

- (id)_phraseCapitalizationResultForString:(id)a3 range:(_NSRange)a4 currentWordRange:(_NSRange)a5 inString:(id)a6 offset:(unint64_t)a7 languageObject:(id)a8 onlyAtInsertionPoint:(BOOL)a9 keyEventArray:(id)a10 selectedRangeValue:(id)a11
{
  NSUInteger location = a5.location;
  NSUInteger length = a4.length;
  NSUInteger v14 = a4.location;
  id v16 = -[AppleSpell phraseMatching:inLexiconForLanguageObject:](self, "phraseMatching:inLexiconForLanguageObject:", a3, a8, a4.length, a5.location, a5.length);
  if (!v16) {
    return 0;
  }
  uint64_t v17 = v16;
  if (([v16 isEqualToString:a3] & 1) != 0
    || (objc_msgSend(v17, "isEqualToString:", objc_msgSend(v17, "lowercaseString")) & 1) != 0)
  {
    return 0;
  }
  uint64_t v22 = 0;
  int v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v20 = [a3 length];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  void v21[2] = __171__AppleSpell_Correction___phraseCapitalizationResultForString_range_currentWordRange_inString_offset_languageObject_onlyAtInsertionPoint_keyEventArray_selectedRangeValue___block_invoke;
  v21[3] = &unk_2640EF948;
  v21[4] = v17;
  v21[5] = &v22;
  objc_msgSend(a3, "enumerateSubstringsInRange:options:usingBlock:", 0, v20, 3, v21);
  if (*((unsigned char *)v23 + 24))
  {
    id v18 = 0;
  }
  else
  {
    if (location > v14
      && [v17 length] + v14 > location
      && objc_msgSend((id)objc_msgSend(a6, "substringWithRange:", v14, location - v14), "isEqualToString:", objc_msgSend(v17, "substringToIndex:", location - v14)))
    {
      uint64_t v17 = (void *)[v17 substringFromIndex:location - v14];
      NSUInteger length = v14 + length - location;
      NSUInteger v14 = location;
    }
    id v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F08758]), "initWithRange:replacementString:", v14 + a7, length, v17);
  }
  _Block_object_dispose(&v22, 8);
  return v18;
}

uint64_t __171__AppleSpell_Correction___phraseCapitalizationResultForString_range_currentWordRange_inString_offset_languageObject_onlyAtInsertionPoint_keyEventArray_selectedRangeValue___block_invoke(uint64_t result, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if (a2)
  {
    if (a4 >= 2)
    {
      uint64_t v11 = result;
      id result = objc_msgSend(a2, "isEqualToString:", objc_msgSend(a2, "uppercaseString"));
      if (result)
      {
        if (a3 + a4 <= [*(id *)(v11 + 32) length]) {
          uint64_t v12 = (__CFString *)objc_msgSend(*(id *)(v11 + 32), "substringWithRange:", a3, a4);
        }
        else {
          uint64_t v12 = &stru_26C1C71A8;
        }
        id result = [a2 isEqualToString:v12];
        if ((result & 1) == 0)
        {
          *(unsigned char *)(*(void *)(*(void *)(v11 + 40) + 8) + 24) = 1;
          *a7 = 1;
        }
      }
    }
  }
  return result;
}

- (BOOL)wordIsAlreadyAccented:(id)a3
{
  if (wordIsAlreadyAccented__onceToken != -1) {
    dispatch_once(&wordIsAlreadyAccented__onceToken, &__block_literal_global_108);
  }
  [a3 rangeOfCharacterFromSet:wordIsAlreadyAccented__nonPlainSet];
  return v4 != 0;
}

id __48__AppleSpell_Correction__wordIsAlreadyAccented___block_invoke()
{
  v0 = (void *)[MEMORY[0x263F089C0] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_'"];
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 913, 27));
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 945, 27));
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 2308, 54));
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 2366, 15));
  id result = (id)[v0 invertedSet];
  wordIsAlreadyAccented__nonPlainSet = (uint64_t)result;
  return result;
}

- (id)_accentCorrectionResultForString:(id)a3 range:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 languageObject:(id)a7 onlyAtInsertionPoint:(BOOL)a8 capitalize:(BOOL)a9 keyEventArray:(id)a10 selectedRangeValue:(id)a11
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = a3;
  NSUInteger v14 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", a3, a4.location, a4.length, a5);
  uint64_t v48 = 0;
  char v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  [v12 rangeOfString:@"-"];
  BOOL v16 = v15 != 0;
  [v12 rangeOfString:@"’"];
  uint64_t v41 = v17;
  int v18 = [a7 isGreek];
  int v42 = [a7 isIrishGaelic];
  int v19 = [a7 isPolish];
  int v20 = [a7 isRomanian];
  int v40 = [a7 isVietnamese];
  if (_accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue__onceToken != -1) {
    dispatch_once(&_accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue__onceToken, &__block_literal_global_121);
  }
  if ([v12 length] == 1 && ((v18 | v42 | v19 | v20) & 1) != 0) {
    goto LABEL_15;
  }
  [v12 rangeOfCharacterFromSet:_accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue__nonPlainCapsSet];
  if (!v21) {
    goto LABEL_15;
  }
  if (v41) {
    id v12 = (id)[v12 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];
  }
  BOOL v22 = [(AppleSpell *)self wordIsAlreadyAccented:v12];
  if (a7)
  {
    if (v12)
    {
      id v23 = [(AppleSpell *)self autocorrectionDictionaryForLanguageObject:a7];
      uint64_t v24 = v23;
      if (v23)
      {
        if ([v23 objectForKey:v12]) {
          goto LABEL_15;
        }
        uint64_t v25 = [v12 lowercaseStringWithLocale:0];
        if (v25)
        {
          if ([v24 objectForKey:v25]) {
            goto LABEL_15;
          }
        }
      }
    }
  }
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __161__AppleSpell_Correction___accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue___block_invoke_2;
  v44[3] = &unk_2640EF970;
  BOOL v45 = v16;
  BOOL v46 = v22;
  char v47 = v42;
  v44[4] = self;
  v44[5] = v12;
  v44[7] = v14;
  v44[8] = &v48;
  v44[6] = 0;
  [(AppleSpell *)self enumerateEntriesForWord:v12 inLexiconForLanguageObject:a7 withBlock:v44];
  if (*((unsigned char *)v49 + 24) || ![v14 count]) {
    goto LABEL_15;
  }
  _NSRange v28 = (void *)[v14 allKeys];
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  void v43[2] = __161__AppleSpell_Correction___accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue___block_invoke_3;
  v43[3] = &unk_2640EF998;
  v43[4] = v14;
  _NSRange v29 = objc_msgSend((id)objc_msgSend(v28, "sortedArrayUsingComparator:", v43), "firstObject");
  long long v30 = v29;
  if ((v18 | v42 | v19 | v20 | v40) != 1
    || !objc_msgSend(v29, "isEqualToString:", objc_msgSend(v29, "lowercaseStringWithLocale:", 0)))
  {
    goto LABEL_25;
  }
  if (objc_msgSend(v12, "isEqualToString:", objc_msgSend(v12, "capitalizedStringWithLocale:", 0)))
  {
LABEL_38:
    uint64_t v31 = initialCapitalizedString(v30, 0);
    goto LABEL_24;
  }
  if (objc_msgSend(v12, "isEqualToString:", uppercasedString(v12, 0)))
  {
    uint64_t v31 = uppercasedString(v30, 0);
  }
  else
  {
    if (!v42)
    {
      if (!a9) {
        goto LABEL_25;
      }
      goto LABEL_38;
    }
    uint64_t v32 = [v12 rangeOfComposedCharacterSequenceAtIndex:0];
    unint64_t v34 = v32 + v33;
    if (v34 >= [v12 length]) {
      goto LABEL_25;
    }
    uint64_t v35 = [v12 substringToIndex:v34];
    unint64_t v36 = (void *)[v12 substringFromIndex:v34];
    if (![(id)_accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue__irishInitialsArray containsObject:v35]|| !objc_msgSend(v36, "isEqualToString:", objc_msgSend(v36, "capitalizedString")))
    {
      if (!a9) {
        goto LABEL_25;
      }
      goto LABEL_38;
    }
    uint64_t v31 = secondCapitalizedString(v30, 0);
  }
LABEL_24:
  long long v30 = (void *)v31;
LABEL_25:
  if (!v30 || ([v12 isEqualToString:v30] & 1) != 0)
  {
LABEL_15:
    id v26 = 0;
    goto LABEL_16;
  }
  if (v41) {
    long long v30 = (void *)[v30 stringByReplacingOccurrencesOfString:@"'" withString:@"’"];
  }
  id v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F08758]), "initWithRange:replacementString:", location + a6, length, v30);
LABEL_16:
  _Block_object_dispose(&v48, 8);
  return v26;
}

void *__161__AppleSpell_Correction___accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue___block_invoke()
{
  v0 = (void *)[MEMORY[0x263F089C0] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZ-_'"];
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 913, 27));
  _accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue__nonPlainCapsSet = (uint64_t)(id)[v0 invertedSet];
  id result = &unk_26C1D32D0;
  _accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue__irishInitialsArray = (uint64_t)result;
  return result;
}

uint64_t __161__AppleSpell_Correction___accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue___block_invoke_2(uint64_t a1, void *a2, double a3, uint64_t a4, unsigned char *a5)
{
  [a2 rangeOfString:@"-"];
  uint64_t v10 = v9;
  int v11 = [*(id *)(a1 + 32) wordIsAlreadyAccented:a2];
  if (*(unsigned char *)(a1 + 72)) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (*(unsigned char *)(a1 + 73)) {
      int v13 = v11;
    }
    else {
      int v13 = 1;
    }
    if (*(unsigned char *)(a1 + 72)) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v10 == 0;
    }
    if (v14)
    {
      int v16 = 0;
    }
    else
    {
      if (*(unsigned char *)(a1 + 74)) {
        BOOL v15 = *(unsigned char *)(a1 + 72) == 0;
      }
      else {
        BOOL v15 = 0;
      }
      int v16 = !v15;
    }
  }
  else
  {
    int v16 = 0;
    if (*(unsigned char *)(a1 + 73)) {
      int v13 = v11;
    }
    else {
      int v13 = 1;
    }
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "compare:options:range:locale:", a2, 1, 0, objc_msgSend(*(id *)(a1 + 40), "length"), *(void *)(a1 + 48));
  if (result)
  {
    if (((v16 | v13 ^ 1) & 1) == 0)
    {
      int v18 = *(void **)(a1 + 56);
      uint64_t v19 = [NSNumber numberWithDouble:a3];
      return [v18 setObject:v19 forKey:a2];
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

uint64_t __161__AppleSpell_Correction___accentCorrectionResultForString_range_inString_offset_languageObject_onlyAtInsertionPoint_capitalize_keyEventArray_selectedRangeValue___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2), "doubleValue");
  double v6 = v5;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a3), "doubleValue");
  if (v6 > v7) {
    return -1;
  }
  else {
    return v6 < v7;
  }
}

- (BOOL)_acceptWithoutAccentForString:(id)a3 range:(_NSRange)a4 inString:(id)a5 languageObject:(id)a6
{
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  int v9 = objc_msgSend(a6, "isGreek", a3, a4.location, a4.length, a5);
  int v10 = v9;
  if (_acceptWithoutAccentForString_range_inString_languageObject__onceToken == -1)
  {
    if (!v9)
    {
LABEL_4:
      BOOL v12 = 0;
      goto LABEL_5;
    }
  }
  else
  {
    dispatch_once(&_acceptWithoutAccentForString_range_inString_languageObject__onceToken, &__block_literal_global_150);
    if (!v10) {
      goto LABEL_4;
    }
  }
  [a3 rangeOfCharacterFromSet:_acceptWithoutAccentForString_range_inString_languageObject__nonGreekPlainUppercaseLetterCharacterSet];
  if (v11) {
    goto LABEL_4;
  }
  if ([a3 length] == 1)
  {
    BOOL v12 = 1;
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __86__AppleSpell_Correction___acceptWithoutAccentForString_range_inString_languageObject___block_invoke_2;
    v14[3] = &unk_2640EF9C0;
    v14[4] = a3;
    v14[5] = &v15;
    [(AppleSpell *)self enumerateEntriesForWord:a3 inLexiconForLanguageObject:a6 withBlock:v14];
    BOOL v12 = *((unsigned char *)v16 + 24) != 0;
  }
LABEL_5:
  _Block_object_dispose(&v15, 8);
  return v12;
}

id __86__AppleSpell_Correction___acceptWithoutAccentForString_range_inString_languageObject___block_invoke()
{
  id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 913, 27), "invertedSet");
  _acceptWithoutAccentForString_range_inString_languageObject__nonGreekPlainUppercaseLetterCharacterSet = (uint64_t)result;
  return result;
}

uint64_t __86__AppleSpell_Correction___acceptWithoutAccentForString_range_inString_languageObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", uppercasedString(a2, 0));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (id)_initialCorrectionForString:(id)a3 lowercaseString:(id)a4 isFirstSecondCapitalized:(BOOL)a5 dictionary:(id)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  CFStringEncoding v15 = [a7 encoding];
  id result = (id)[a6 objectForKey:a3];
  if (!result && !a5)
  {
    id result = (id)[a6 objectForKey:a4];
    if (a8)
    {
      if (!result)
      {
        uint64_t v17 = [a3 rangeOfString:@"-"];
        id result = 0;
        if (v18)
        {
          if (v17)
          {
            uint64_t v19 = (void *)[a3 substringToIndex:v17];
            uint64_t v20 = [a3 substringFromIndex:v17];
            id result = (id)[a6 objectForKey:v19];
            if (result || (id result = (id)objc_msgSend(a6, "objectForKey:", objc_msgSend(v19, "lowercaseString"))) != 0)
            {
              uint64_t v21 = (__CFString *)[result stringByAppendingString:v20];
              CFIndex v22 = [(__CFString *)v21 length];
              if (v21)
              {
                CFIndex v23 = v22;
                CFIndex v26 = 0;
                v29.NSUInteger location = 0;
                v29.NSUInteger length = v22;
                CFIndex Bytes = CFStringGetBytes(v21, v29, v15, 0, 0, buffer, 254, &v26);
                id result = 0;
                if (v23 == Bytes)
                {
                  BYTE4(usedBufLen) = 0;
                  LODWORD(usedBufLen) = 65793;
                  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, v26, a7, a8, 0, 1, usedBufLen, 0))
                  {
                    return v21;
                  }
                  else
                  {
                    return 0;
                  }
                }
              }
              else
              {
                return 0;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (BOOL)_prohibitCorrectionBasedOnCountsForString:(id)a3 lowercaseString:(id)a4 appIdentifier:(id)a5 languageObject:(id)a6 typologyCorrection:(id)a7
{
  learnedResponses = self->_learnedResponses;
  if (!learnedResponses)
  {
    probationaryLearnedResponses = self->_probationaryLearnedResponses;
    if (!probationaryLearnedResponses) {
      return (char)probationaryLearnedResponses;
    }
  }
  int v13 = (void *)-[NSMutableDictionary objectForKey:](learnedResponses, "objectForKey:", a3, a4, a5, a6, a7);
  BOOL v14 = (void *)[(NSMutableDictionary *)self->_probationaryLearnedResponses objectForKey:a3];
  CFStringEncoding v15 = (void *)[(NSMutableDictionary *)self->_probationaryLearnedResponseTimes objectForKey:a3];
  [(AppleSpell *)self dynamicScoreForWord:a3 languageObject:a6 appIdentifier:a5];
  float v17 = v16;
  double Current = CFAbsoluteTimeGetCurrent();
  if (v13)
  {
    if (v14) {
      goto LABEL_5;
    }
LABEL_8:
    BOOL v14 = (void *)[(NSMutableDictionary *)self->_probationaryLearnedResponses objectForKey:a4];
    CFStringEncoding v15 = (void *)[(NSMutableDictionary *)self->_probationaryLearnedResponseTimes objectForKey:a4];
    if (v13) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  int v13 = (void *)[(NSMutableDictionary *)self->_learnedResponses objectForKey:a4];
  if (!v14) {
    goto LABEL_8;
  }
LABEL_5:
  if (v13)
  {
LABEL_6:
    uint64_t v19 = [v13 integerValue];
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v19 = 0;
LABEL_10:
  if (v14) {
    BOOL v20 = v15 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  if (v20)
  {
    uint64_t v23 = 0;
    BOOL v25 = 0;
  }
  else
  {
    [v15 doubleValue];
    double v22 = v21;
    uint64_t v23 = [v14 integerValue];
    double probationaryInterval = self->_probationaryInterval;
    BOOL v25 = v22 + probationaryInterval > Current;
    if (v22 + probationaryInterval / 10.0 > Current)
    {
      int v26 = 1;
      goto LABEL_19;
    }
  }
  int v26 = 0;
LABEL_19:
  if (v17 >= 2.0)
  {
    if (v19 > -3 || (LOBYTE(probationaryLearnedResponses) = 0, (v25 | v26) == 1) && v23 >= -2) {
      LOBYTE(probationaryLearnedResponses) = 1;
    }
  }
  else
  {
    char v27 = v23 > 1 && v25;
    if (v19 > 2) {
      char v27 = 1;
    }
    if (v23 > 0) {
      char v28 = v26;
    }
    else {
      char v28 = 0;
    }
    LOBYTE(probationaryLearnedResponses) = v27 | v28;
  }
  return (char)probationaryLearnedResponses;
}

- (id)_umlautCorrectionForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 connection:(_PR_DB_IO *)a7 typologyCorrection:(id)a8
{
  int v10 = a4;
  uint64_t v49 = *MEMORY[0x263EF8340];
  int v12 = objc_msgSend(a6, "encoding", a3, a4, a5);
  int v13 = [a6 isGerman];
  int v14 = [a6 isDanish];
  int v15 = [a6 isNorwegian];
  char v16 = [a6 isNynorsk];
  float v17 = 0;
  if (!v13 || v12 != 1280) {
    goto LABEL_48;
  }
  char v18 = *v10;
  if (!*v10)
  {
    float v17 = 0;
    __s[0] = 0;
    goto LABEL_48;
  }
  float v17 = 0;
  char v19 = 0;
  BOOL v20 = __s;
  double v21 = v10;
  double v22 = v10;
  do
  {
    uint64_t v23 = v20;
    *v20++ = v18;
    int v26 = v22[1];
    BOOL v25 = v22 + 1;
    int v24 = v26;
    if (v26 == 115)
    {
      if (*v21 == 115) {
        float v17 = (__CFString *)v23;
      }
LABEL_13:
      BOOL v25 = v21;
      goto LABEL_23;
    }
    if (v24 != 101) {
      goto LABEL_13;
    }
    int v27 = *v21;
    switch(v27)
    {
      case 'u':
        if (v21 != v10)
        {
          unsigned int v28 = *(v21 - 1) - 97;
          BOOL v29 = v28 > 0x10;
          int v30 = (1 << v28) & 0x10011;
          if (!v29 && v30 != 0) {
            goto LABEL_13;
          }
        }
        *uint64_t v23 = -4;
        break;
      case 'o':
        *uint64_t v23 = -10;
        break;
      case 'a':
        *uint64_t v23 = -28;
        break;
      default:
        goto LABEL_13;
    }
    char v19 = 1;
LABEL_23:
    int v32 = v25[1];
    double v22 = v25 + 1;
    char v18 = v32;
    double v21 = v22;
  }
  while (v32);
  char *v20 = 0;
  if ((v19 & 1) == 0)
  {
    float v17 = 0;
    goto LABEL_48;
  }
  BYTE4(v47) = 0;
  LODWORD(v47) = 257;
  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", __s, strlen(__s), a6, a7, 0, 1, v47, 0))
  {
    goto LABEL_47;
  }
  char v33 = __s[0];
  if (__s[0] > 0xF7u
    || __s[0] - 97 < 0x1A
    || __s[0] - 223 < 0x18)
  {
    if (__s[0] - 154 <= 4 && ((1 << (__s[0] + 102)) & 0x15) != 0) {
      goto LABEL_40;
    }
    if (__s[0] != 223)
    {
      if (__s[0] == 255) {
        char v33 = -97;
      }
      else {
        char v33 = __s[0] - 32;
      }
    }
  }
  else
  {
    if (__s[0] - 154 > 4 || ((1 << (__s[0] + 102)) & 0x15) == 0)
    {
      if (v17)
      {
        LOBYTE(v17->isa) = -33;
        if (BYTE1(v17->isa))
        {
          unint64_t v34 = (unsigned __int8 *)&v17->isa + 2;
          do
          {
            int v35 = *v34;
            *(v34++ - 1) = v35;
          }
          while (v35);
        }
        goto LABEL_46;
      }
      goto LABEL_48;
    }
LABEL_40:
    char v33 = __s[0] - 16;
  }
  __s[0] = v33;
  BYTE4(v47) = 0;
  LODWORD(v47) = 257;
  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", __s, strlen(__s), a6, a7, 0, 1, v47, 0))
  {
    goto LABEL_47;
  }
  if (v17)
  {
    LOBYTE(v17->isa) = -33;
    if (BYTE1(v17->isa))
    {
      unint64_t v36 = (unsigned __int8 *)&v17->isa + 2;
      do
      {
        int v37 = *v36;
        *(v36++ - 1) = v37;
      }
      while (v37);
    }
LABEL_46:
    BYTE4(v47) = 0;
    LODWORD(v47) = 257;
    float v17 = 0;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", __s, strlen(__s), a6, a7, 0, 1, v47, 0))
    {
LABEL_47:
      float v17 = (id)CFStringCreateWithCString(0, __s, 0x500u);
    }
  }
LABEL_48:
  if ((v14 | v15))
  {
    if (v12 != 1280) {
      return v17;
    }
LABEL_55:
    char v39 = *v10;
    if (!*v10) {
      return v17;
    }
    char v40 = 0;
    uint64_t v41 = __s;
    while (2)
    {
      int v42 = v41;
      *v41++ = v39;
      if (*v10 == 97)
      {
        int v43 = v10[1];
        if (v43 == 101)
        {
          char v44 = -26;
LABEL_62:
          char *v42 = v44;
          char v40 = 1;
          ++v10;
        }
        else if (v43 == 97)
        {
          char v44 = -27;
          goto LABEL_62;
        }
      }
      int v45 = *++v10;
      char v39 = v45;
      if (!v45)
      {
        *uint64_t v41 = 0;
        if (v40)
        {
          BYTE4(v47) = 0;
          LODWORD(v47) = 257;
          if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", __s, strlen(__s), a6, a7, 0, 1, v47, 0))
          {
            return (id)(id)CFStringCreateWithCString(0, __s, 0x500u);
          }
        }
        return v17;
      }
      continue;
    }
  }
  if (v12 == 1280) {
    char v38 = v16;
  }
  else {
    char v38 = 0;
  }
  if (v38) {
    goto LABEL_55;
  }
  return v17;
}

- (id)_connectionCorrectionForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 connection:(_PR_DB_IO *)a7 flags:(unint64_t)a8 isCapitalized:(BOOL)a9 accentCorrectionOnly:(BOOL)a10 isAbbreviation:(BOOL *)a11 trySpaceInsertion:(BOOL *)a12 hasAccentCorrections:(BOOL *)a13 candidateList:(id)a14 typologyCorrection:(id)a15
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  uint64_t v20 = objc_msgSend(a6, "encoding", a3);
  int v21 = [a6 isGerman];
  CFStringRef v22 = 0;
  if (a5 - 2 > 0x3D || !a7) {
    return (id)v22;
  }
  int v23 = v21;
  uint64_t v114 = 0;
  long long v113 = 0u;
  long long v112 = 0u;
  long long v111 = 0u;
  long long v110 = 0u;
  long long v109 = 0u;
  long long v108 = 0u;
  long long v107 = 0u;
  long long v106 = 0u;
  memset(v102, 0, sizeof(v102));
  long long v103 = 0u;
  HIDWORD(v103) = 0;
  int v104 = 0;
  int v105 = a4;
  *(void *)&long long v112 = v102;
  BYTE7(v113) = 1;
  *(_WORD *)((char *)&v113 + 9) = *(_WORD *)&a7->var0;
  PRword((uint64_t)&v105, 8, 0);
  int v24 = (void *)v106;
  if (!(void)v106 || !*(void *)(v106 + 8) || (v97 = v23, (uint64_t v25 = *(void *)v106) == 0))
  {
    CFStringRef v22 = 0;
    goto LABEL_36;
  }
  unint64_t v93 = a11;
  unint64_t v26 = *(unsigned __int16 *)(v106 + 18);
  unint64_t v99 = (void *)v106;
  unint64_t v101 = v26;
  if (!*(_WORD *)(v106 + 18))
  {
    CFStringRef v22 = 0;
    LOBYTE(v43) = a10;
    if (a10) {
      goto LABEL_122;
    }
    goto LABEL_123;
  }
  unint64_t v94 = a8;
  int v27 = *(__int16 **)(v106 + 8);
  uint64_t v28 = 0;
  unsigned __int8 v98 = v27;
  while (1)
  {
    uint64_t v29 = *v27++;
    int v30 = (const char *)(v25 + v29);
    size_t v31 = strlen((const char *)(v25 + v29));
    if (v31) {
      break;
    }
LABEL_15:
    if (!--v26) {
      goto LABEL_16;
    }
  }
  if (v31 != a5 + 1 || v30[a5] != 46 || strncmp(a4, v30, a5))
  {
    if (((v97 | a9) & 1) != 0 || (isUpperCaseX(*(unsigned __int8 *)v30, v20) & 1) == 0) {
      ++v28;
    }
    goto LABEL_15;
  }
  uint64_t v28 = 0;
  *a11 = 1;
  *a12 = 0;
LABEL_16:
  if (a10)
  {
    unint64_t v32 = 0;
    unint64_t v33 = 0;
    unint64_t v100 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v34 = v98;
    do
    {
      int v35 = (const char *)(v25 + v34[v33]);
      if (((v94 >> 1) & 1 | v97 & 1 | a9 || (isUpperCaseX(*(unsigned __int8 *)v35, v20) & 1) == 0) && strlen(v35) == a5)
      {
        if (!a5) {
          goto LABEL_29;
        }
        unint64_t v36 = 0;
        do
        {
          int v37 = removeDiacriticsX(a4[v36], v20);
          int v38 = removeDiacriticsX(v35[v36++], v20);
        }
        while (v37 == v38 && v36 < a5);
        unint64_t v34 = v98;
        if (v37 == v38)
        {
LABEL_29:
          BOOL v40 = v32++ == 0;
          *a13 = 1;
          uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
          if (v40) {
            uint64_t v41 = v33;
          }
          unint64_t v100 = v41;
          *a12 = 0;
        }
      }
      ++v33;
    }
    while (v33 < v101 && v32 < 2);
    goto LABEL_97;
  }
  a8 = v94;
  if (!v28)
  {
    CFStringRef v22 = 0;
    int v24 = v99;
    LOBYTE(v43) = a10;
LABEL_123:
    if (!a14) {
      goto LABEL_36;
    }
    if (*a11) {
      goto LABEL_36;
    }
    [a14 addCandidateWithString:v22 errorType:6];
    if (!v101) {
      goto LABEL_36;
    }
    uint64_t v84 = 0;
    int v85 = (a8 >> 1) & 1 | v97 | a9;
    char v96 = v43;
    while (1)
    {
      uint64_t v86 = (const char *)(*v24 + *(__int16 *)(v24[1] + 2 * v84));
      if (v85 & 1) == 0 && (isUpperCaseX(*(unsigned __int8 *)v86, v20)) {
        goto LABEL_145;
      }
      size_t v87 = strlen(v86);
      if (!v87) {
        goto LABEL_145;
      }
      unint64_t v88 = effectiveEditDistance((uint64_t)a4, a5, (uint64_t)v86, v87);
      if (v43) {
        break;
      }
      if (v88 < 3)
      {
        uint64_t v92 = 8;
LABEL_144:
        objc_msgSend(a14, "addCandidateWithBuffer:encoding:errorType:", v86, v20, v92, v93);
      }
LABEL_145:
      if (++v84 == v101) {
        goto LABEL_36;
      }
    }
    if (strlen(v86) != a5) {
      goto LABEL_145;
    }
    if (a5)
    {
      unint64_t v89 = 0;
      do
      {
        int v43 = removeDiacriticsX(a4[v89], v20);
        int v90 = removeDiacriticsX(v86[v89++], v20);
      }
      while (v43 == v90 && v89 < a5);
      BOOL v40 = v43 == v90;
      int v24 = v99;
      LOBYTE(v43) = v96;
      if (!v40) {
        goto LABEL_145;
      }
    }
    uint64_t v92 = 1;
    goto LABEL_144;
  }
  if (v28 == 1)
  {
    unint64_t v44 = 0;
    unint64_t v100 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      int v45 = (const char *)(*v99 + *(__int16 *)(v99[1] + 2 * v44));
      if ((v94 >> 1) & 1 | v97 & 1 | a9 || (isUpperCaseX(*(unsigned __int8 *)v45, v20) & 1) == 0)
      {
        size_t v46 = strlen(v45);
        unint64_t v47 = effectiveEditDistance((uint64_t)a4, a5, (uint64_t)v45, v46);
        if (v47 >= 2)
        {
          BOOL v48 = v47 == 2 && a5 > 6;
          unint64_t v49 = v100;
          if (v48) {
            unint64_t v49 = v44;
          }
          unint64_t v100 = v49;
        }
        else
        {
          *a12 = 0;
          unint64_t v100 = v44;
        }
      }
      ++v44;
    }
    while (v101 != v44);
  }
  else
  {
    unint64_t v50 = 0;
    unint64_t v51 = 0;
    int v52 = (v94 >> 1) & 1 | v97 | a9;
    unint64_t v100 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v53 = v98;
    char v95 = v52;
    do
    {
      int v54 = (const char *)(v25 + v53[v51]);
      if (((v52 & 1) != 0 || (isUpperCaseX(*(unsigned __int8 *)v54, v20) & 1) == 0) && strlen(v54) == a5)
      {
        if (!a5) {
          goto LABEL_69;
        }
        unint64_t v55 = 0;
        do
        {
          uint64_t v56 = removeDiacriticsX(a4[v55], v20);
          int v52 = toLowerX(v56, v20);
          uint64_t v57 = removeDiacriticsX(v54[v55], v20);
          int v58 = toLowerX(v57, v20);
          ++v55;
        }
        while (v52 == v58 && v55 < a5);
        BOOL v40 = v52 == v58;
        uint64_t v53 = v98;
        LOBYTE(v52) = v95;
        if (v40)
        {
LABEL_69:
          BOOL v40 = v50++ == 0;
          *a13 = 1;
          uint64_t v60 = 0x7FFFFFFFFFFFFFFFLL;
          if (v40) {
            uint64_t v60 = v51;
          }
          unint64_t v100 = v60;
          *a12 = 0;
        }
      }
      ++v51;
    }
    while (v51 < v101 && v50 < 2);
    if (v100 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v61 = 0;
      unint64_t v62 = 0;
      unint64_t v100 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        char v63 = (const char *)(*v99 + *(__int16 *)(v99[1] + 2 * v62));
        if (((v95 & 1) != 0 || (isUpperCaseX(*(unsigned __int8 *)v63, v20) & 1) == 0) && strlen(v63) == a5)
        {
          unint64_t v64 = v101;
          if (!a5) {
            goto LABEL_90;
          }
          BOOL v65 = 0;
          unint64_t v66 = 0;
          do
          {
            int v67 = a4[v66];
            int v68 = v63[v66];
            BOOL v69 = v67 == v68;
            if (v67 != v68 && !v65)
            {
              BOOL v69 = adjacentMatch(a4[v66], v68, v20);
              BOOL v65 = v69;
            }
            ++v66;
          }
          while (v69 && v66 < a5);
          if (v69)
          {
LABEL_90:
            BOOL v40 = v61++ == 0;
            if (v40) {
              uint64_t v71 = v62;
            }
            else {
              uint64_t v71 = 0x7FFFFFFFFFFFFFFFLL;
            }
            unint64_t v100 = v71;
            *a12 = 0;
          }
        }
        else
        {
          unint64_t v64 = v101;
        }
        ++v62;
      }
      while (v62 < v64 && v61 < 2);
    }
  }
LABEL_97:
  CFStringRef v22 = 0;
  if (v100 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v24 = v99;
    int v43 = a10;
    a8 = v94;
  }
  else
  {
    int v24 = v99;
    int v43 = a10;
    a8 = v94;
    if (v100 < v101)
    {
      uint64_t v72 = (const char *)(*v99 + *(__int16 *)(v99[1] + 2 * v100));
      size_t v73 = strlen(v72);
      if (a5)
      {
        unint64_t v74 = 0;
        do
        {
          int v75 = a4[v74];
          int v76 = removeDiacriticsX(a4[v74++], v20);
        }
        while (v76 == v75 && v74 < a5);
        BOOL v78 = v76 == v75;
      }
      else
      {
        BOOL v78 = 1;
      }
      if (v73)
      {
        size_t v79 = 0;
        do
        {
          int v80 = v72[v79];
          int v81 = removeDiacriticsX(v72[v79], v20);
          BOOL v82 = v81 != v80;
          ++v79;
        }
        while (v81 == v80 && v79 < v73);
        int v43 = a10;
      }
      else
      {
        BOOL v82 = 0;
      }
      if (v82 || v78) {
        CFStringRef v22 = (id)CFStringCreateWithCString(0, v72, v20);
      }
      else {
        CFStringRef v22 = 0;
      }
    }
  }
  if (!v43) {
    goto LABEL_123;
  }
LABEL_122:
  if (*a13) {
    goto LABEL_123;
  }
LABEL_36:
  PRword((uint64_t)&v105, 17, 0);
  return (id)v22;
}

- (id)_spaceInsertionCorrectionForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 connection:(_PR_DB_IO *)a7 flags:(unint64_t)a8 isCapitalized:(BOOL)a9 typologyCorrection:(id)a10
{
  unsigned __int8 v10 = a8;
  unint64_t v100 = a7;
  id v11 = a6;
  uint64_t v103 = *MEMORY[0x263EF8340];
  CFStringEncoding v15 = objc_msgSend(a6, "encoding", a3);
  char v16 = (char *)[v11 oneLetterWords];
  uint64_t v17 = [v11 twoLetterWords];
  if (a5 - 3 > 0x14) {
    return 0;
  }
  char v18 = (const char *)v17;
  unint64_t v99 = self;
  BOOL v19 = a9;
  char v20 = *a4;
  id v97 = v11;
  CFStringEncoding encoding = v15;
  int v85 = a4;
  unsigned __int8 v91 = v10;
  if (*a4)
  {
    int v21 = a4 + 1;
    p_char cStr = &cStr;
    do
    {
      *p_cStr++ = v20;
      int v23 = *v21++;
      char v20 = v23;
    }
    while (v23);
    char *p_cStr = 0;
    int v24 = &v102[a5 - 1];
    int64_t v25 = a5 - 1;
    unint64_t v26 = &cStr + a5 - 1;
    if ((uint64_t)a5 < 3)
    {
      int64_t v96 = 0x7FFFFFFFFFFFFFFFLL;
      if ((a5 & 0x8000000000000000) != 0) {
        return 0;
      }
      goto LABEL_29;
    }
    unint64_t v87 = a5 - 1;
    unint64_t v88 = (const char *)v17;
    unint64_t v89 = &v102[a5 - 1];
    unint64_t v27 = a5;
    __s = v16;
    BOOL v19 = a9;
  }
  else
  {
    unint64_t v88 = (const char *)v17;
    __s = v16;
    char cStr = 0;
    unint64_t v89 = &v102[a5 - 1];
    unint64_t v27 = a5;
    unint64_t v87 = a5 - 1;
    unint64_t v26 = &cStr + a5 - 1;
  }
  uint64_t v28 = 0;
  unint64_t v29 = 0;
  int v30 = &v26[~(unint64_t)&cStr];
  unsigned int v95 = (v10 | v19) & 1;
  int64_t v96 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    size_t v31 = &v102[v28 - 1];
    int v32 = v102[v28];
    if (v32 == 59 || v32 == 44)
    {
      unint64_t v33 = v29;
      unint64_t v34 = v26;
      v31[1] = 45;
      BYTE4(v84) = 0;
      LODWORD(v84) = 65793;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &cStr, v27, v97, v100, 0, 1, v84, 0)&& ![(AppleSpell *)self checkNegativeWordBuffer:&cStr length:v28 + 1 languageObject:v97 alreadyCapitalized:v95])
      {
        BOOL v35 = [(AppleSpell *)self checkNegativeWordBuffer:&v102[v28 + 1] length:v30 languageObject:v97];
        uint64_t v36 = v28 + 2;
        if (v33) {
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        }
        int64_t v37 = v96;
        if (!v35) {
          int64_t v37 = v36;
        }
        int64_t v96 = v37;
        if (v35) {
          unint64_t v29 = v33;
        }
        else {
          unint64_t v29 = v33 + 1;
        }
        unint64_t v26 = v34;
      }
      else
      {
        unint64_t v26 = v34;
        unint64_t v29 = v33;
      }
      v31[1] = v32;
    }
    if (&v102[v28 + 1] >= v26) {
      break;
    }
    ++v28;
    --v30;
  }
  while (v29 < 2);
  char v16 = __s;
  a5 = v27;
  int v24 = v89;
  id v11 = v97;
  char v18 = v88;
  int64_t v25 = v87;
  if (!v29)
  {
    if ((a5 & 0x8000000000000000) != 0) {
      return 0;
    }
LABEL_29:
    int v38 = v24;
    do
    {
      v38[1] = *v38;
      --v38;
    }
    while (&cStr <= v38);
    char v39 = self;
    if ((uint64_t)a5 < 2) {
      return 0;
    }
    unint64_t v29 = 0;
    unint64_t v40 = a5;
    uint64_t v41 = v102;
    unint64_t v90 = v40;
    __sa = (char *)(v40 + 1);
    char v92 = v91 | a9;
    uint64_t v42 = 1;
    unsigned __int8 v98 = v26;
    while (1)
    {
      *uint64_t v41 = 45;
      if (v42 != 1 && v41 != v26) {
        goto LABEL_35;
      }
      unint64_t v44 = v18;
      int v45 = v41 - 1;
      if (v42 != 1) {
        int v45 = v41 + 1;
      }
      int v46 = *v45;
      if ((v46 - 48) >= 0xA)
      {
        if (!v16) {
          goto LABEL_63;
        }
        unint64_t v47 = v29;
        BOOL v48 = strchr(v16, v46);
        unint64_t v29 = v47;
        unint64_t v26 = v98;
        char v39 = v99;
        if (!v48) {
          goto LABEL_63;
        }
      }
      if (v42 == 1)
      {
        BOOL v49 = v46 == 97 && v16 == englishOneLetterWords[0];
        if (v49)
        {
          unsigned int v50 = v41[1];
          HIDWORD(v52) = v50 - 65;
          LODWORD(v52) = v50 - 65;
          unsigned int v51 = v52 >> 1;
          BOOL v53 = v51 > 0x1C;
          int v54 = (1 << v51) & 0x14951495;
          BOOL v55 = v53 || v54 == 0;
          if (!v55
            || vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20CC61C20, (uint32x4_t)vaddq_s32(vdupq_n_s32(v50), (int32x4_t)xmmword_20CC61C10)))) & 1 | (v50 - 248 < 6) | ((v50 & 0xD8) == 200 || v50 == 255))
          {
LABEL_63:
            char v18 = v44;
            goto LABEL_120;
          }
        }
      }
      if (v16 == frenchOneLetterWords)
      {
        if (v42 == 1 && v46 == 108)
        {
LABEL_105:
          unsigned int v70 = v41[1];
          HIDWORD(v72) = v70 - 65;
          LODWORD(v72) = v70 - 65;
          unsigned int v71 = v72 >> 1;
          if ((v71 > 0x1C || ((1 << v71) & 0x14951495) == 0)
            && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20CC61C20, (uint32x4_t)vaddq_s32(vdupq_n_s32(v70), (int32x4_t)xmmword_20CC61C10)))) & 1) == 0&& v70 - 248 >= 6&& v70 != 255&& v70 != 104&& (v70 & 0xD8) != 0xC8)
          {
            goto LABEL_63;
          }
        }
      }
      else if (v42 == 1 && v46 == 108 && v16 == (char *)italianOneLetterWords)
      {
        goto LABEL_105;
      }
      BOOL v74 = v16 == frenchOneLetterWords || v16 == (char *)italianOneLetterWords;
      BOOL v49 = v46 == 108;
      char v18 = v44;
      if (v49 && v74 && v41 == v26) {
        goto LABEL_120;
      }
LABEL_35:
      if (v42 == 2 || v41 == v24 - 2)
      {
        uint64_t v56 = -2;
        if (v42 != 2) {
          uint64_t v56 = 1;
        }
        uint64_t v57 = 2;
        if (v42 == 2) {
          uint64_t v57 = -1;
        }
        if (!v18) {
          goto LABEL_120;
        }
        unint64_t v58 = v29;
        int v59 = v41[v56];
        int v60 = v41[v57];
        size_t v61 = strlen(v18);
        if (!v61)
        {
          unint64_t v26 = v98;
          unint64_t v29 = v58;
LABEL_96:
          char v39 = v99;
          goto LABEL_120;
        }
        char v62 = 0;
        for (size_t i = 0; i < v61; i += 2)
        {
          if (v18[i] == v59 && v18[i + 1] == v60) {
            char v62 = 1;
          }
          if (v62) {
            break;
          }
        }
        unint64_t v26 = v98;
        unint64_t v29 = v58;
        if ((v62 & 1) == 0) {
          goto LABEL_96;
        }
        char v39 = v99;
        if (v42 == 2 && v18 == englishTwoLetterWords[0] && v59 == 97 && v60 == 110)
        {
          unsigned int v64 = v41[1];
          HIDWORD(v66) = v64 - 65;
          LODWORD(v66) = v64 - 65;
          unsigned int v65 = v66 >> 1;
          BOOL v53 = v65 > 0x1C;
          int v67 = (1 << v65) & 0x14951495;
          BOOL v68 = v53 || v67 == 0;
          if (v68
            && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20CC61C20, (uint32x4_t)vaddq_s32(vdupq_n_s32(v64), (int32x4_t)xmmword_20CC61C10)))) & 1) == 0&& v64 - 248 >= 6&& v64 != 255&& v64 != 104&& (v64 & 0xD8) != 0xC8)
          {
            goto LABEL_120;
          }
        }
      }
      unint64_t v43 = v29;
      BYTE4(v84) = 0;
      LODWORD(v84) = 1;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v39, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &cStr, __sa, v11, v100, 0, 1, v84, 0)&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:](v39, "checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:", &cStr, v42, v11, v92 & 1)&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:](
              v39,
              "checkNegativeWordBuffer:length:languageObject:",
              v41 + 1,
              v24 - v41,
              v11)
        || v42 == 1
        && (BYTE4(v84) = 0,
            LODWORD(v84) = 1,
            -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v39, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &v102[1], v25, v11, v100, 0, 1, v84, 0))&& ![(AppleSpell *)v39 checkNegativeWordBuffer:&v102[1] length:v25 languageObject:v11 alreadyCapitalized:v92 & 1])
      {
LABEL_92:
        unint64_t v29 = v43 + 1;
        uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
        if (!v43) {
          uint64_t v69 = v42;
        }
        int64_t v96 = v69;
        unint64_t v26 = v98;
        char v39 = v99;
        goto LABEL_120;
      }
      unint64_t v26 = v98;
      if (v41 == v98)
      {
        BYTE4(v84) = 0;
        LODWORD(v84) = 1;
        if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v39, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &cStr, v25, v11, v100, 0, 1, v84, 0)&& ![(AppleSpell *)v39 checkNegativeWordBuffer:&cStr length:v25 languageObject:v11])
        {
          goto LABEL_92;
        }
        unint64_t v26 = v98;
      }
      unint64_t v29 = v43;
LABEL_120:
      *uint64_t v41 = v41[1];
      if (v42 < v25)
      {
        uint64_t v41 = &v102[v42++];
        if (v29 < 2) {
          continue;
        }
      }
      a5 = v90;
      break;
    }
  }
  id result = 0;
  if (v29 && v96 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5 == 4 && v96 == 2) {
      return 0;
    }
    char v77 = *v85;
    if (*v85)
    {
      BOOL v78 = (unsigned __int8 *)(v85 + 1);
      size_t v79 = &cStr;
      CFStringEncoding v80 = encoding;
      do
      {
        *v79++ = v77;
        int v81 = *v78++;
        char v77 = v81;
      }
      while (v81);
    }
    else
    {
      size_t v79 = &cStr;
      CFStringEncoding v80 = encoding;
    }
    *size_t v79 = 0;
    BOOL v82 = &v102[v96 - 1];
    if (v96 <= (uint64_t)a5)
    {
      do
      {
        v24[1] = *v24;
        --v24;
      }
      while (v82 <= v24);
    }
    v102[v96 - 1] = 32;
    if (v96 == 1 && cStr == 108 && (v16 == frenchOneLetterWords || v16 == (char *)italianOneLetterWords)) {
      *BOOL v82 = 39;
    }
    return (id)(id)CFStringCreateWithCString(0, &cStr, v80);
  }
  return result;
}

- (BOOL)_prohibitCorrectionForLanguageObject:(id)a3 lastKeyboardLanguageObject:(id)a4
{
  BOOL result = 0;
  if (a3 && a4) {
    BOOL result = (objc_msgSend((id)objc_msgSend(a3, "identifier"), "isEqualToString:", objc_msgSend(a4, "identifier")) & 1) == 0
  }
          && (uint64_t v7 = [a3 orthographyIndex], v7 != objc_msgSend(a4, "orthographyIndex"))
          && ([a3 usesArabicScript] && (objc_msgSend(a4, "usesArabicScript") & 1) != 0
           || [a3 usesCyrillicScript] && (objc_msgSend(a4, "usesCyrillicScript") & 1) != 0
           || [a3 usesDevanagariScript]
           && ([a4 usesDevanagariScript] & 1) != 0
           || [a4 isVietnamese] && !objc_msgSend(a3, "isVietnamese"));
  return result;
}

- (BOOL)_permitCorrection:(id)a3 languageObject:(id)a4 flags:(unint64_t)a5 isCapitalized:(BOOL)a6 typologyCorrection:(id)a7
{
  unsigned __int8 v7 = a5;
  uint64_t v21 = *MEMORY[0x263EF8340];
  CFIndex v11 = [a3 length];
  CFStringEncoding v12 = [a4 encoding];
  int v13 = [a4 isSwedish];
  int v14 = [a4 isDanish];
  int v15 = [a4 isNorwegian];
  int v16 = [a4 isTurkish];
  BOOL result = 1;
  if (a3 && v11)
  {
    CFIndex usedBufLen = 0;
    v22.NSUInteger location = 0;
    v22.NSUInteger length = v11;
    if (v11 != CFStringGetBytes((CFStringRef)a3, v22, v12, 0, 0, buffer, 254, &usedBufLen)) {
      return 1;
    }
    if ([(AppleSpell *)self checkWordBuffer:buffer length:usedBufLen languageObject:a4 index:1]|| [(AppleSpell *)self checkNegativeWordBuffer:buffer length:usedBufLen languageObject:a4 alreadyCapitalized:(v7 | a6) & 1])
    {
      return 0;
    }
    return (v13 | v14 | v15 | v16) != 1
        || [(AppleSpell *)self checkNameWordBuffer:buffer length:usedBufLen languageObject:a4 globalOnly:0]|| [(AppleSpell *)self checkWordBuffer:buffer length:usedBufLen languageObject:a4 index:0]|| [(AppleSpell *)self validateWord:a3 inLexiconForLanguageObject:a4];
  }
  return result;
}

- (id)_correctionResultForWord:(id)a3 replacementRange:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 languageObject:(id)a7 capitalize:(BOOL)a8 isCapitalized:(BOOL)a9 isSecondCapitalized:(BOOL)a10 hasCurlyApostrophe:(BOOL)a11 appendCorrectionLanguage:(BOOL)a12 capitalizationLocale:(id)a13 proposedCorrection:(id)a14
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  char v20 = a14;
  unint64_t v21 = [a14 length];
  unint64_t v22 = [a3 length];
  int v23 = [a7 encoding];
  __int16 v58 = 8217;
  uint64_t v24 = [NSString stringWithCharacters:&v58 length:1];
  id result = 0;
  if (!a14 || !v21) {
    return result;
  }
  uint64_t v52 = v24;
  unint64_t v53 = a6;
  id v54 = a5;
  id v57 = a7;
  int v26 = a9;
  if (a9)
  {
    int v26 = a9;
    if (v22 >= 2)
    {
      unint64_t v27 = 2;
      do
      {
        unsigned int v28 = [a3 characterAtIndex:v27 - 1];
        if (isAnyAlphaX(v28, v23))
        {
          int v26 = isUpperCaseX(v28, v23);
          if (!v26) {
            break;
          }
        }
        else
        {
          int v26 = 1;
        }
        BOOL v29 = v27++ >= v22;
      }
      while (!v29);
    }
  }
  NSUInteger v55 = location;
  unint64_t v56 = length;
  unint64_t v30 = 1;
  do
  {
    unsigned int v31 = [a14 characterAtIndex:v30 - 1];
    if (isAnyAlphaX(v31, v23))
    {
      int v32 = isUpperCaseX(v31, v23);
      if (!v32) {
        break;
      }
    }
    else
    {
      LOBYTE(v32) = 1;
    }
    BOOL v29 = v30++ >= v21;
  }
  while (!v29);
  if (v26)
  {
    if ((v32 & 1) == 0)
    {
      if (v22 < 5) {
        char v20 = 0;
      }
      else {
        char v20 = (void *)uppercasedString(a14, (uint64_t)a13);
      }
    }
    NSUInteger v35 = v55;
    unint64_t v33 = v57;
    BOOL v34 = a9;
    goto LABEL_34;
  }
  unint64_t v33 = v57;
  BOOL v34 = a9;
  if (!a9)
  {
    if (!a10
      || (int v36 = toLowerX([a14 characterAtIndex:0], v23),
          v36 != toLowerX([a3 characterAtIndex:1], v23)))
    {
LABEL_31:
      NSUInteger v35 = v55;
      goto LABEL_34;
    }
  }
  if (v21 < 2)
  {
    char v20 = (void *)[a14 capitalizedStringWithLocale:a13];
    goto LABEL_31;
  }
  NSUInteger v35 = v55;
  if ((isUpperCaseX([a14 characterAtIndex:1], v23) & 1) == 0) {
    char v20 = (void *)initialCapitalizedString(a14, (uint64_t)a13);
  }
LABEL_34:
  if (a11)
  {
    [v20 rangeOfString:@"'"];
    if (v37) {
      char v20 = (void *)[v20 stringByReplacingOccurrencesOfString:@"'" withString:v52];
    }
  }
  if (!v20) {
    return 0;
  }
  uint64_t v38 = [v20 length];
  if (v38 != length + 1 || (NSUInteger v39 = v38, v40 = v35 + length, v35 + length >= [v54 length]))
  {
    if ([v20 length] == length + 2)
    {
      unint64_t v49 = [v54 length];
      if (length)
      {
        if (v35 + length < v49 && [v20 characterAtIndex:length] == 39)
        {
          objc_msgSend(v54, "rangeOfString:options:range:", objc_msgSend(v20, "substringToIndex:", length), 9, v35, length);
          if (v50)
          {
            int v51 = [v54 characterAtIndex:v35 + length];
            BOOL v48 = a8;
            if (v51 == 8217 || v51 == 39) {
              ++length;
            }
            goto LABEL_65;
          }
        }
      }
    }
    goto LABEL_64;
  }
  NSUInteger v41 = length - 2;
  if (length >= 2)
  {
    NSUInteger v42 = length - 1;
    if ([v20 characterAtIndex:v42] == 39)
    {
      objc_msgSend(v54, "rangeOfString:options:range:", objc_msgSend(v20, "substringToIndex:", v42), 9, v35, v42);
      if (v43)
      {
        objc_msgSend(v54, "rangeOfString:options:range:", objc_msgSend(v20, "substringFromIndex:", v56), 9, v40 - 1, 1);
        if (v44) {
          goto LABEL_48;
        }
      }
    }
    if (v56 < 3)
    {
      NSUInteger length = 2;
    }
    else
    {
      if ([v20 characterAtIndex:v41] == 39)
      {
        objc_msgSend(v54, "rangeOfString:options:range:", objc_msgSend(v20, "substringToIndex:", v41), 9, v35, v41);
        if (v45)
        {
          objc_msgSend(v54, "rangeOfString:options:range:", objc_msgSend(v20, "substringFromIndex:", v42), 9, v40 - 2, 2);
          if (v46)
          {
LABEL_48:
            int v47 = [v54 characterAtIndex:v40];
            if (v47 != 8217)
            {
              NSUInteger length = v56;
              unint64_t v33 = v57;
              BOOL v48 = a8;
              if (v47 == 39) {
                NSUInteger length = v39;
              }
              goto LABEL_65;
            }
            NSUInteger length = v39;
            goto LABEL_63;
          }
        }
      }
      NSUInteger length = v56;
    }
  }
LABEL_63:
  unint64_t v33 = v57;
LABEL_64:
  BOOL v48 = a8;
LABEL_65:
  if (v48) {
    char v20 = (void *)initialCapitalizedString(v20, 0);
  }
  if (a12 && !v34) {
    char v20 = (void *)[v20 stringByAppendingFormat:@"/%@", objc_msgSend(v33, "identifier")];
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x263F08758]), "initWithRange:replacementString:", v35 + v53, length, v20);
}

- (id)_correctionResultForString:(id)a3 range:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 tagger:(id)a7 appIdentifier:(id)a8 dictionary:(id)a9 languages:(id)a10 connection:(_PR_DB_IO *)a11 flags:(unint64_t)a12 keyEventArray:(id)a13 selectedRangeValue:(id)a14 parameterBundles:(id)a15 previousLetter:(unsigned __int16)a16 nextLetter:(unsigned __int16)a17 extraMisspellingCount:(unint64_t)a18 extraCorrectionCount:(unint64_t *)a19
{
  char v20 = (__CFString *)a3;
  uint64_t v146 = *MEMORY[0x263EF8340];
  __int16 v142 = 8217;
  __int16 v141 = 0;
  v118 = (void *)[a3 lowercaseString];
  uint64_t v22 = [NSString stringWithCharacters:&v142 length:1];
  uint64_t v23 = [NSString stringWithCharacters:&v141 length:1];
  unint64_t v24 = [(__CFString *)v20 length];
  CFIndex v139 = 0;
  CFIndex v140 = 0;
  id v25 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", [a10 firstObject]);
  int v26 = [v25 encoding];
  id v27 = [(AppleSpell *)self capitalizationDictionaryArrayForLanguageObject:v25];
  unsigned int v28 = isUpperCaseX([(__CFString *)v20 characterAtIndex:0], v26);
  int v29 = 0;
  if (!v28 && v24 >= 2) {
    int v29 = isUpperCaseX([(__CFString *)v20 characterAtIndex:1], v26);
  }
  int v121 = v29;
  if (v24 > 1) {
    unsigned int v30 = v28;
  }
  else {
    unsigned int v30 = 0;
  }
  unsigned int v128 = v28;
  CFStringEncoding encoding = v26;
  if (v30 == 1) {
    uint64_t v31 = isUpperCaseX([(__CFString *)v20 characterAtIndex:1], v26);
  }
  else {
    uint64_t v31 = 0;
  }
  unint64_t range = v24;
  BOOL v138 = v24 > 3;
  char v137 = 0;
  char v136 = 0;
  int v104 = [v25 isEnglish];
  [v25 isFrench];
  unsigned int v112 = [v25 isGerman];
  [v25 isSpanish];
  [v25 isItalian];
  [v25 isPortuguese];
  int v108 = [v25 isDanish];
  int v106 = [v25 isNorwegian];
  int v105 = [v25 isNynorsk];
  int v32 = [v25 isTurkish];
  int v116 = [v25 isKorean];
  int v103 = objc_msgSend((id)objc_msgSend(v25, "identifier"), "isEqualToString:", @"en_JP");
  int v125 = [v25 isArabic];
  int v124 = [v25 isHindi];
  int v123 = [v25 isTelugu];
  int v122 = [v25 isPunjabi];
  obuint64_t j = v27;
  long long v111 = -[PRCandidateList initWithMaxCount:defaultReplacementRange:customErrorModel:capitalizationDictionaryArray:]([PRCandidateList alloc], "initWithMaxCount:defaultReplacementRange:customErrorModel:capitalizationDictionaryArray:", 32, a4.location, a4.length, 0, v27);
  uint64_t v134 = 0;
  double v135 = 0.0;
  [(AppleSpell *)self getParameterValue:&v135 forName:@"CapitalizedWordThreshold" languageObject:v25 tagger:a7 appIdentifier:a8 parameterBundles:a15 defaultValue:-7.0];
  BOOL v127 = self;
  [(AppleSpell *)self getParameterValue:&v134 forName:@"CapitalizedWordSingleThreshold" languageObject:v25 tagger:a7 appIdentifier:a8 parameterBundles:a15 defaultValue:v135 + -2.0];
  id v126 = a7;
  if ((_correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__readMinAutocorrectionLengthDefault & 1) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"NSSpellCheckerMinAutocorrectionLength"))
    {
      _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__minAutocorrectionLength = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "integerForKey:", @"NSSpellCheckerMinAutocorrectionLength");
    }
    _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__readMinAutocorrectionLengthDefault = 1;
  }
  if (v32)
  {
    uint64_t v33 = _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__turkishLocale;
    if (!_correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__turkishLocale)
    {
      uint64_t v33 = [objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"tr"];
      _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__turkishLocale = v33;
    }
  }
  else
  {
    uint64_t v33 = 0;
  }
  if ((v125 | v124 | v123 | v122) == 1)
  {
    uint64_t v31 = 0;
    int v121 = 0;
    unsigned int v128 = 0;
  }
  [(__CFString *)v20 rangeOfString:v23];
  if (v34) {
    char v20 = (__CFString *)[(__CFString *)v20 stringByReplacingOccurrencesOfString:v23 withString:@"_"];
  }
  NSUInteger v35 = a11;
  [(__CFString *)v20 rangeOfString:v22];
  uint64_t v37 = v36;
  if (v36) {
    char v20 = (__CFString *)[(__CFString *)v20 stringByReplacingOccurrencesOfString:v22 withString:@"'"];
  }
  uint64_t v38 = [(AppleSpell *)self _initialCorrectionForString:v20 lowercaseString:v118 isFirstSecondCapitalized:v31 dictionary:a9 languageObject:v25 connection:a11];
  if (v38) {
    int v39 = 0;
  }
  else {
    int v39 = v31;
  }
  uint64_t v110 = v37;
  if (v39 != 1)
  {
    NSUInteger v40 = v38;
    goto LABEL_32;
  }
  if (range >= _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__minAutocorrectionLength
    && (isUpperCaseX([(__CFString *)v20 characterAtIndex:2], encoding) & 1) == 0)
  {
    NSUInteger v40 = (__CFString *)a11;
    uint64_t v52 = (__CFString *)initialCapitalizedString(v118, v33);
    CFIndex v53 = [(__CFString *)v52 length];
    if (a11)
    {
      v148.NSUInteger location = 0;
      v148.NSUInteger length = v53;
      if (v53 == CFStringGetBytes(v52, v148, encoding, 0, 0, buffer, 254, &v140))
      {
        BYTE4(usedBufLen) = 0;
        LODWORD(usedBufLen) = 65793;
        BOOL v54 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, v140, v25, a11, 0, 1, usedBufLen, 0);
        int v41 = !v54;
        if (v54) {
          NSUInteger v40 = v52;
        }
        else {
          NSUInteger v40 = 0;
        }
        goto LABEL_62;
      }
      NSUInteger v40 = 0;
    }
    int v41 = 1;
LABEL_62:
    NSUInteger v35 = a11;
    goto LABEL_33;
  }
  NSUInteger v40 = 0;
LABEL_32:
  int v41 = 1;
LABEL_33:
  if (v116) {
    return -[AppleSpell _correctionResultForKoreanString:range:inString:offset:tagger:appIdentifier:dictionary:keyEventArray:](self, "_correctionResultForKoreanString:range:inString:offset:tagger:appIdentifier:dictionary:keyEventArray:", v20, a4.location, a4.length, a5, a6, v126, a8, a9, a13);
  }
  char v43 = v128 ^ 1;
  if (v40) {
    char v43 = 1;
  }
  char v44 = v43 | v112;
  if (v40) {
    int v45 = 0;
  }
  else {
    int v45 = v41;
  }
  if (v44)
  {
    int v41 = v45;
  }
  else
  {
    if (v126 && [v126 orthoIndex]) {
      objc_msgSend(v126, "sentenceRangeForRange:", a4.location, a4.length);
    }
    BOOL v138 = 0;
  }
  CFStringRef v46 = 0;
  int v47 = 0;
  uint64_t v117 = v33;
  if (!v41)
  {
    int v51 = 0;
    BOOL v48 = &SLToDef5ChrSet;
    goto LABEL_71;
  }
  BOOL v48 = &SLToDef5ChrSet;
  if (range < _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__minAutocorrectionLength) {
    goto LABEL_70;
  }
  uint64_t v102 = v35;
  v147.NSUInteger location = 0;
  v147.NSUInteger length = range;
  if (range != CFStringGetBytes(v20, v147, encoding, 0, 0, buffer, 254, &v140)
    || (CFIndex v49 = v140, buffer[v140] = 0, !v49))
  {
    int v47 = 0;
    int v51 = 0;
    CFStringRef v46 = 0;
    goto LABEL_53;
  }
  if ((v112 | v108 | v106 | v105) == 1)
  {
    NSUInteger v40 = -[AppleSpell _umlautCorrectionForWord:buffer:length:languageObject:connection:typologyCorrection:](self, "_umlautCorrectionForWord:buffer:length:languageObject:connection:typologyCorrection:", v20, buffer);
    BOOL v50 = v40 == 0;
  }
  else
  {
    BOOL v50 = 1;
  }
  CFStringRef v46 = 0;
  int v47 = 0;
  if (!a9 || !v50)
  {
LABEL_70:
    int v51 = 0;
    goto LABEL_71;
  }
  if ([v25 isSupportedAssetLexiconLanguage]
    && ![(AppleSpell *)self loadedLexiconsCountForLanguageObject:v25]
    || [(AppleSpell *)self checkWordBuffer:buffer length:v140 languageObject:v25 index:4])
  {
    int v47 = 0;
    int v51 = 0;
    CFStringRef v46 = 0;
    goto LABEL_71;
  }
  unint64_t v76 = v140;
  if (!v140)
  {
LABEL_154:
    unint64_t v85 = v76;
    int v51 = 0;
    if (v104)
    {
      unsigned int v87 = v128;
      int v88 = v121;
      int v86 = encoding;
      BOOL v48 = (void *)&SLToDef5ChrSet;
    }
    else
    {
      int v86 = encoding;
      unsigned int v87 = v128;
      int v88 = v121;
      BOOL v48 = (void *)&SLToDef5ChrSet;
      if (encoding == 1280 && range >= 4)
      {
        if ([(AppleSpell *)self checkWordBuffer:buffer length:v85 languageObject:+[PRLanguage languageObjectWithIdentifier:@"en_US"] index:0])
        {
          BOOL v138 = 0;
          int v51 = 1;
        }
        else
        {
          int v51 = 0;
        }
      }
    }
    if ((v87 | v88))
    {
      CFStringRef v46 = 0;
      NSUInteger v35 = v102;
    }
    else
    {
      UInt8 v91 = buffer[0];
      buffer[0] = toUpperX(buffer[0], v86);
      BYTE4(usedBufLen) = 0;
      LODWORD(usedBufLen) = 65793;
      NSUInteger v35 = v102;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, v140, v25, v102, 0, 1, usedBufLen, 0))
      {
        if (((a12 >> 1) & 1 | v112) == 1) {
          CFStringRef v46 = (id)CFStringCreateWithCString(0, (const char *)buffer, encoding);
        }
        else {
          CFStringRef v46 = 0;
        }
        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        uint64_t v92 = [obj countByEnumeratingWithState:&v130 objects:v143 count:16];
        if (v92)
        {
          uint64_t v93 = v92;
          char v94 = 0;
          uint64_t v95 = *(void *)v131;
          do
          {
            for (uint64_t i = 0; i != v93; ++i)
            {
              if (*(void *)v131 != v95) {
                objc_enumerationMutation(obj);
              }
              v94 |= [*(id *)(*((void *)&v130 + 1) + 8 * i) objectForKey:v20] != 0;
            }
            uint64_t v93 = [obj countByEnumeratingWithState:&v130 objects:v143 count:16];
          }
          while (v93);
        }
        else
        {
          char v94 = 0;
        }
        if ((v94 & 1) != 0 || range >= 4)
        {
          BOOL v138 = 0;
          int v51 = 1;
        }
        self = v127;
        int v88 = v121;
        NSUInteger v35 = v102;
        BOOL v48 = (void *)&SLToDef5ChrSet;
      }
      else
      {
        CFStringRef v46 = 0;
      }
      buffer[0] = v91;
    }
    int v97 = v128 & (v88 ^ 1);
    int v47 = 1;
    if (v97 != 1 || range < 4) {
      goto LABEL_71;
    }
    id v98 = [(AppleSpell *)self nerTaggerWaitForResult:0];
    unint64_t v99 = v98;
    if (_correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__onceToken != -1)
    {
      dispatch_once(&_correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__onceToken, &__block_literal_global_174);
      if (!v99) {
        goto LABEL_53;
      }
      goto LABEL_197;
    }
    if (v98)
    {
LABEL_197:
      [v99 setString:v20];
      objc_msgSend(v99, "setLanguage:range:", objc_msgSend(v25, "localization"), 0, -[__CFString length](v20, "length"));
      uint64_t v100 = [v99 tagAtIndex:0 unit:0 scheme:*MEMORY[0x263F13FB0] tokenRange:0];
      int v47 = [(id)_correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__nerTags containsObject:v100] ^ 1;
      [v99 setString:&stru_26C1C71A8];
    }
LABEL_53:
    NSUInteger v35 = v102;
    goto LABEL_71;
  }
  unint64_t v77 = 0;
  unint64_t v78 = 0;
  unint64_t v79 = 0;
  unint64_t v80 = 0;
  unint64_t v107 = _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__minAutocorrectionLength;
  CFIndex v109 = v140 - 1;
  while (1)
  {
    unsigned int v81 = buffer[v80];
    if (v81 > 0x2F || ((1 << v81) & 0xA00100000000) == 0)
    {
      unsigned __int8 v83 = isUpperCaseX(v81, encoding);
      int v84 = 0;
      if (!v80)
      {
LABEL_141:
        unint64_t v77 = 0;
        goto LABEL_142;
      }
    }
    else
    {
      unsigned __int8 v83 = isUpperCaseX(v81, encoding);
      ++v79;
      int v84 = 1;
      if (!v80) {
        goto LABEL_141;
      }
    }
    if (v81 == buffer[v80 - 1]) {
      ++v77;
    }
    else {
      unint64_t v77 = 0;
    }
LABEL_142:
    if (v81 == 46 || v81 - 48 < 0xA || v81 == 64 || v81 == 95)
    {
      int v47 = 0;
      int v51 = 0;
      CFStringRef v46 = 0;
      NSUInteger v35 = v102;
      goto LABEL_169;
    }
    v78 += ((v83 ^ 1 | v125 | (v124 | v123 | v122)) & 1) == 0;
    NSUInteger v35 = v102;
    if (v84)
    {
      if (v79 > 1 || v80 < v107 || v107 + v80 >= v76) {
        break;
      }
    }
    if (v78 > 2 || v109 == v80 && v77 > 1) {
      break;
    }
    if (++v80 >= v76) {
      goto LABEL_154;
    }
  }
  int v47 = 0;
  int v51 = 0;
  CFStringRef v46 = 0;
LABEL_169:
  BOOL v48 = (void *)&SLToDef5ChrSet;
LABEL_71:
  if (v35 && v47 && (unint64_t)v140 >= 2 && (unint64_t)v140 <= 0x3F)
  {
    BOOL v55 = [(AppleSpell *)self useWordLanguageModelForLanguageObject:v25 tagger:v126 appIdentifier:a8];
    unint64_t v56 = v111;
    if (!v55) {
      unint64_t v56 = 0;
    }
    BYTE1(usedBufLen) = v51;
    LOBYTE(usedBufLen) = v128;
    NSUInteger v40 = -[AppleSpell _connectionCorrectionForWord:buffer:length:languageObject:connection:flags:isCapitalized:accentCorrectionOnly:isAbbreviation:trySpaceInsertion:hasAccentCorrections:candidateList:typologyCorrection:](self, "_connectionCorrectionForWord:buffer:length:languageObject:connection:flags:isCapitalized:accentCorrectionOnly:isAbbreviation:trySpaceInsertion:hasAccentCorrections:candidateList:typologyCorrection:", v20, buffer, v140, v25, v35, a12, usedBufLen, &v137, &v138, &v136, v56, 0);
  }
  if (!v47)
  {
    uint64_t v58 = v128;
LABEL_123:
    uint64_t v70 = v110;
    goto LABEL_124;
  }
  if (v40)
  {
    int v57 = 1;
  }
  else
  {
    if (v136) {
      BOOL v59 = 1;
    }
    else {
      BOOL v59 = v46 == 0;
    }
    int v57 = v59;
    if (v59) {
      NSUInteger v40 = 0;
    }
    else {
      NSUInteger v40 = (__CFString *)v46;
    }
  }
  int v60 = v35;
  uint64_t v58 = v128;
  if (v57
    && v51 != 1
    && !v137
    && [(AppleSpell *)self useWordLanguageModelForLanguageObject:v25 tagger:v126 appIdentifier:a8])
  {
    [(PRCandidateList *)v111 addCandidateWithString:v40 errorType:6];
    BYTE4(usedBufLen) = 1;
    LODWORD(usedBufLen) = __PAIR32__(a17, a16);
    -[AppleSpell _addGuessesForWordBuffer:length:languageObject:connection:sender:minAutocorrectionLength:previousLetter:nextLetter:basicOnly:toGuesses:](self, "_addGuessesForWordBuffer:length:languageObject:connection:sender:minAutocorrectionLength:previousLetter:nextLetter:basicOnly:toGuesses:", buffer, v140, v25, v35, 0, v48[63], usedBufLen, v111);
  }
  if (!v111) {
    goto LABEL_121;
  }
  if ([(PRCandidateList *)v111 count]
    && [(AppleSpell *)self useWordLanguageModelForLanguageObject:v25 tagger:v126 appIdentifier:a8])
  {
    id v61 = [(AppleSpell *)self _rankedCandidatesForCandidateList:v111 languageObject:v25 tagger:v126 appIdentifier:a8 parameterBundles:a15];
    uint64_t v62 = [v61 count];
    if (v61)
    {
      unint64_t v63 = v62;
      if (v62)
      {
        unsigned int v64 = (void *)[v61 objectAtIndex:0];
        goto LABEL_105;
      }
    }
    goto LABEL_121;
  }
  if (v40 || [(PRCandidateList *)v111 count] != 1) {
    goto LABEL_121;
  }
  unsigned int v64 = objc_msgSend(-[PRCandidateList candidates](v111, "candidates"), "objectAtIndex:", 0);
  unint64_t v63 = 1;
LABEL_105:
  if (!v64)
  {
LABEL_121:
    if (v138)
    {
      LOBYTE(usedBufLen) = v128;
      NSUInteger v40 = [(AppleSpell *)self _spaceInsertionCorrectionForWord:v20 buffer:buffer length:v140 languageObject:v25 connection:v60 flags:a12 isCapitalized:usedBufLen typologyCorrection:0];
    }
    goto LABEL_123;
  }
  uint64_t v65 = [v64 string];
  a4.NSUInteger location = [v64 replacementRange];
  a4.NSUInteger length = v66;
  if ([v64 isBlocklisted]) {
    NSUInteger v40 = 0;
  }
  else {
    NSUInteger v40 = (__CFString *)v65;
  }
  char v67 = v128 ^ 1;
  if (!v40) {
    char v67 = 1;
  }
  if (v67)
  {
    uint64_t v70 = v110;
  }
  else
  {
    BOOL v68 = &v135;
    if (v63 < 2) {
      BOOL v68 = (double *)&v134;
    }
    double v69 = *v68;
    uint64_t v70 = v110;
    if ((v112 | v103) == 1)
    {
      uint64_t v71 = [(__CFString *)v40 length];
      if (v71)
      {
        CFIndex v72 = v71;
LABEL_117:
        v149.NSUInteger location = 0;
        v149.NSUInteger length = v72;
        if (v72 == CFStringGetBytes(v40, v149, encoding, 0, 0, v144, 254, &v139)
          && ([(AppleSpell *)self checkNameWordBuffer:v144 length:v139 languageObject:v25 globalOnly:0]|| [(AppleSpell *)self validateWord:v40 inLexiconForLanguageObject:v25]))
        {
          double v69 = -99.0;
        }
      }
    }
    else if (v104)
    {
      if ((unint64_t)[(__CFString *)v40 length] >= 4)
      {
        if ([(__CFString *)v40 hasSuffix:@"'s"])
        {
          uint64_t v89 = [(__CFString *)v40 length];
          CFIndex v72 = v89 - 2;
          if (v89 != 2) {
            goto LABEL_117;
          }
        }
      }
    }
    [v64 score];
    if (v90 < v69) {
      NSUInteger v40 = 0;
    }
  }
  BOOL v138 = 0;
LABEL_124:
  if ([(AppleSpell *)v127 _permitCorrection:v40 languageObject:v25 flags:a12 isCapitalized:v58 typologyCorrection:0])
  {
    size_t v73 = v40;
  }
  else
  {
    size_t v73 = 0;
  }
  [(__CFString *)v73 length];
  BYTE4(usedBufLen) = (a12 & 0x10) != 0;
  BYTE3(usedBufLen) = v70 != 0;
  BYTE2(usedBufLen) = v121;
  BYTE1(usedBufLen) = v58;
  LOBYTE(usedBufLen) = a12 & 1;
  id v74 = -[AppleSpell _correctionResultForWord:replacementRange:inString:offset:languageObject:capitalize:isCapitalized:isSecondCapitalized:hasCurlyApostrophe:appendCorrectionLanguage:capitalizationLocale:proposedCorrection:](v127, "_correctionResultForWord:replacementRange:inString:offset:languageObject:capitalize:isCapitalized:isSecondCapitalized:hasCurlyApostrophe:appendCorrectionLanguage:capitalizationLocale:proposedCorrection:", v20, a4.location, a4.length, a5, a6, v25, usedBufLen, v117, v73);
  NSUInteger v42 = v74;
  if (v74) {
    [v74 replacementString];
  }
  return v42;
}

id __253__AppleSpell_Correction___correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount___block_invoke()
{
  v2[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F13F78];
  v2[0] = *MEMORY[0x263F13F70];
  v2[1] = v0;
  v2[2] = *MEMORY[0x263F13F58];
  id result = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:3];
  _correctionResultForString_range_inString_offset_tagger_appIdentifier_dictionary_languages_connection_flags_keyEventArray_selectedRangeValue_parameterBundles_previousLetter_nextLetter_extraMisspellingCount_extraCorrectionCount__nerTags = (uint64_t)result;
  return result;
}

- (void)enumerateAssetDataItemsForLocale:(id)a3 withBlock:(id)a4
{
}

uint64_t __66__AppleSpell_Lexicon__enumerateAssetDataItemsForLocale_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  char v8 = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v8) {
    *a6 = 1;
  }
  return result;
}

- (id)_lexiconPathForLocalization:(id)a3 type:(id)a4
{
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3052000000;
  int v15 = __Block_byref_object_copy__3;
  int v16 = __Block_byref_object_dispose__3;
  uint64_t v17 = 0;
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF960], "localeWithLocaleIdentifier:");
  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@-%@.dat", a4, a3];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__AppleSpell_Lexicon___lexiconPathForLocalization_type___block_invoke;
    v11[3] = &unk_2640EFA10;
    v11[4] = v8;
    v11[5] = &v12;
    [(AppleSpell *)self enumerateAssetDataItemsForLocale:v7 withBlock:v11];
  }
  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __56__AppleSpell_Lexicon___lexiconPathForLocalization_type___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [@"Lexicon" isEqualToString:a4];
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "lastPathComponent"), "isEqualToString:", *(void *)(a1 + 32));
    if (result)
    {
      uint64_t result = objc_msgSend((id)objc_msgSend(a2, "path"), "copy");
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
      *a5 = 1;
    }
  }
  return result;
}

- (id)_lexiconPathForLanguageObject:(id)a3 type:(id)a4
{
  id result = -[AppleSpell _lexiconPathForLocalization:type:](self, "_lexiconPathForLocalization:type:", [a3 languageModelLocalization], a4);
  if (!result)
  {
    uint64_t v8 = [a3 languageModelFallbackLocalization];
    return [(AppleSpell *)self _lexiconPathForLocalization:v8 type:a4];
  }
  return result;
}

- (id)_phraseLexiconPathForLanguage:(id)a3
{
  id v4 = +[PRLanguage languageObjectWithIdentifier:a3];
  return [(AppleSpell *)self _lexiconPathForLanguageObject:v4 type:@"Phrases"];
}

- (id)backgroundLoadingQueue
{
  if (backgroundLoadingQueue_onceToken != -1) {
    dispatch_once(&backgroundLoadingQueue_onceToken, &__block_literal_global_4);
  }
  return (id)backgroundLoadingQueue__backgroundLoadingQueue;
}

dispatch_queue_t __45__AppleSpell_Lexicon__backgroundLoadingQueue__block_invoke()
{
  uint64_t v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t result = dispatch_queue_create("com.apple.ProofReader.backgroundLoadingQueue", v0);
  backgroundLoadingQueue__backgroundLoadingQueue = (uint64_t)result;
  return result;
}

- (id)_loadLexiconsForLanguage:(id)a3 localization:(id)a4 cachedOnly:(BOOL)a5 onQueue:(id)a6
{
  BOOL v7 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3052000000;
  id v27 = __Block_byref_object_copy__3;
  unsigned int v28 = __Block_byref_object_dispose__3;
  uint64_t v29 = 0;
  id v10 = +[PRLanguage languageObjectWithIdentifier:a3];
  lexiconSerialQueue = self->_lexiconSerialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__AppleSpell_Lexicon___loadLexiconsForLanguage_localization_cachedOnly_onQueue___block_invoke;
  block[3] = &unk_2640EF438;
  void block[5] = a4;
  block[6] = &v24;
  block[4] = self;
  dispatch_sync(lexiconSerialQueue, block);
  uint64_t v12 = (void *)v25[5];
  if (!v12
    || (objc_msgSend(v12, "isEqual:", objc_msgSend(MEMORY[0x263EFF9D0], "null")) & 1) != 0
    || !v7 && [(id)v25[5] cachedOnly])
  {
    uint64_t v13 = [MEMORY[0x263EFF980] array];
    id v14 = objc_alloc_init(MEMORY[0x263F086B0]);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    void v21[2] = __80__AppleSpell_Lexicon___loadLexiconsForLanguage_localization_cachedOnly_onQueue___block_invoke_2;
    v21[3] = &unk_2640EFA38;
    BOOL v22 = v7;
    v21[4] = a4;
    v21[5] = v10;
    void v21[6] = v13;
    v21[7] = self;
    dispatch_sync((dispatch_queue_t)a6, v21);
    int v15 = [[PRLexiconGroup alloc] initWithLocalization:a4 lexicons:v13 cachedOnly:v7];
    v25[5] = (uint64_t)v15;
    int v16 = self->_lexiconSerialQueue;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __80__AppleSpell_Lexicon___loadLexiconsForLanguage_localization_cachedOnly_onQueue___block_invoke_3;
    v20[3] = &unk_2640EF5E8;
    v20[5] = a4;
    v20[6] = &v24;
    v20[4] = self;
    dispatch_sync(v16, v20);

    id v17 = (id)v25[5];
  }
  char v18 = (void *)v25[5];
  _Block_object_dispose(&v24, 8);
  return v18;
}

id __80__AppleSpell_Lexicon___loadLexiconsForLanguage_localization_cachedOnly_onQueue___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 64) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

uint64_t __80__AppleSpell_Lexicon___loadLexiconsForLanguage_localization_cachedOnly_onQueue___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[PRLexicon lexiconWithLocalization:*(void *)(a1 + 32) unigramsPath:0 cachedOnly:*(unsigned __int8 *)(a1 + 64)];
  uint64_t v3 = [*(id *)(a1 + 40) transliterationLocalization];
  uint64_t v14 = [*(id *)(a1 + 40) spellingFallbackLocalization];
  uint64_t v12 = [MEMORY[0x263EFF980] array];
  if (v2) {
    [*(id *)(a1 + 48) addObject:v2];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 56), "dataBundlesForLanguageObject:", *(void *)(a1 + 40), v12);
  uint64_t result = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        uint64_t v10 = objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", @"Unigrams", @"dat", 0, objc_msgSend(*(id *)(a1 + 40), "localization"));
        if (v10
          || (uint64_t v10 = objc_msgSend(v9, "pathForResource:ofType:inDirectory:forLocalization:", @"Unigrams", @"dat", 0, objc_msgSend(*(id *)(a1 + 40), "localization"))) != 0)
        {
          CFIndex v11 = +[PRLexicon lexiconWithLocalization:*(void *)(a1 + 32) unigramsPath:v10];
          if (v11) {
            [*(id *)(a1 + 48) addObject:v11];
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  if (v3)
  {
    uint64_t result = [v13 containsObject:v3];
    if ((result & 1) == 0)
    {
      uint64_t result = +[PRLexicon lexiconWithLocalization:v3 unigramsPath:0 cachedOnly:*(unsigned __int8 *)(a1 + 64)];
      if (result) {
        uint64_t result = [*(id *)(a1 + 48) addObject:result];
      }
    }
  }
  if (v14)
  {
    uint64_t result = [v13 containsObject:v14];
    if ((result & 1) == 0)
    {
      uint64_t result = +[PRLexicon lexiconWithLocalization:v14 unigramsPath:0 cachedOnly:*(unsigned __int8 *)(a1 + 64)];
      if (result) {
        return [*(id *)(a1 + 48) addObject:result];
      }
    }
  }
  return result;
}

uint64_t __80__AppleSpell_Lexicon___loadLexiconsForLanguage_localization_cachedOnly_onQueue___block_invoke_3(void *a1)
{
  return [*(id *)(a1[4] + 64) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKey:a1[5]];
}

- (id)_lexiconsForLanguage:(id)a3 loadType:(int64_t)a4
{
  id v7 = -[AppleSpell languageModelLocalizationForLanguage:](self, "languageModelLocalizationForLanguage:");
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x3052000000;
  unint64_t v21 = __Block_byref_object_copy__3;
  BOOL v22 = __Block_byref_object_dispose__3;
  uint64_t v23 = 0;
  if (_lexiconsForLanguage_loadType__onceToken != -1) {
    dispatch_once(&_lexiconsForLanguage_loadType__onceToken, &__block_literal_global_57);
  }
  lexiconSerialQueue = self->_lexiconSerialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__AppleSpell_Lexicon___lexiconsForLanguage_loadType___block_invoke_2;
  block[3] = &unk_2640EF438;
  void block[5] = v7;
  block[6] = &v18;
  block[4] = self;
  dispatch_sync(lexiconSerialQueue, block);
  if (objc_msgSend((id)v19[5], "isEqual:", objc_msgSend(MEMORY[0x263EFF9D0], "null")))
  {
    v19[5] = 0;
    goto LABEL_14;
  }
  id v9 = (void *)v19[5];
  if (v9)
  {
    if (a4 != 2 || ([v9 cachedOnly] & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  if (a4 == 1)
  {
    id v11 = [(AppleSpell *)self _loadLexiconsForLanguage:a3 localization:v7 cachedOnly:1 onQueue:_lexiconsForLanguage_loadType___waitingLexiconCreationSerialQueue];
    v19[5] = (uint64_t)v11;
  }
  else if (a4 == 2)
  {
LABEL_11:
    id v10 = [(AppleSpell *)self _loadLexiconsForLanguage:a3 localization:v7 cachedOnly:0 onQueue:_lexiconsForLanguage_loadType___waitingLexiconCreationSerialQueue];
    v19[5] = (uint64_t)v10;
    goto LABEL_14;
  }
  uint64_t v12 = [(AppleSpell *)self backgroundLoadingQueue];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__AppleSpell_Lexicon___lexiconsForLanguage_loadType___block_invoke_3;
  v16[3] = &unk_2640EF460;
  v16[4] = self;
  v16[5] = a3;
  void v16[6] = v7;
  dispatch_async(v12, v16);
LABEL_14:
  uint64_t v13 = (void *)v19[5];
  if (v13) {
    id v14 = (id)[v13 lexicons];
  }
  else {
    id v14 = 0;
  }
  _Block_object_dispose(&v18, 8);
  return v14;
}

dispatch_queue_t __53__AppleSpell_Lexicon___lexiconsForLanguage_loadType___block_invoke()
{
  _lexiconsForLanguage_loadType___waitingLexiconCreationSerialQueue = (uint64_t)dispatch_queue_create("com.apple.ProofReader.waitingLexiconCreationSerialQueue", 0);
  dispatch_queue_t result = dispatch_queue_create("com.apple.ProofReader.nonWaitingexiconCreationSerialQueue", 0);
  _lexiconsForLanguage_loadType___nonWaitingLexiconCreationSerialQueue = (uint64_t)result;
  return result;
}

id __53__AppleSpell_Lexicon___lexiconsForLanguage_loadType___block_invoke_2(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 64) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    uint64_t v3 = *(void **)(a1[4] + 64);
    uint64_t v4 = [MEMORY[0x263EFF9D0] null];
    uint64_t v5 = a1[5];
    return (id)[v3 setObject:v4 forKey:v5];
  }
  return result;
}

void __53__AppleSpell_Lexicon___lexiconsForLanguage_loadType___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x210556730]();
  [*(id *)(a1 + 32) _loadLexiconsForLanguage:*(void *)(a1 + 40) localization:*(void *)(a1 + 48) cachedOnly:0 onQueue:_lexiconsForLanguage_loadType___nonWaitingLexiconCreationSerialQueue];
}

- (id)_lexiconsForLanguage:(id)a3
{
  return [(AppleSpell *)self _lexiconsForLanguage:a3 loadType:1];
}

- (id)lexiconForLanguage:(id)a3
{
  id v3 = (id)objc_msgSend(-[AppleSpell _lexiconsForLanguage:loadType:](self, "_lexiconsForLanguage:loadType:", a3, 2), "firstObject");
  return v3;
}

- (id)_lexiconsForLanguageObject:(id)a3
{
  uint64_t v4 = [a3 identifier];
  return [(AppleSpell *)self _lexiconsForLanguage:v4 loadType:1];
}

- (id)lexiconForLanguageObject:(id)a3
{
  id v3 = (id)objc_msgSend(-[AppleSpell _lexiconsForLanguage:loadType:](self, "_lexiconsForLanguage:loadType:", objc_msgSend(a3, "identifier"), 2), "firstObject");
  return v3;
}

- (unint64_t)loadedLexiconsCountForLanguageObject:(id)a3
{
  id v3 = -[AppleSpell _lexiconsForLanguage:loadType:](self, "_lexiconsForLanguage:loadType:", [a3 identifier], 0);
  return [v3 count];
}

- (id)_loadPhraseLexiconsForLanguage:(id)a3 localization:(id)a4 onQueue:(id)a5
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  BOOL v22 = __Block_byref_object_copy__3;
  lexiconSerialQueue = self->_lexiconSerialQueue;
  uint64_t v23 = __Block_byref_object_dispose__3;
  uint64_t v24 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__AppleSpell_Lexicon___loadPhraseLexiconsForLanguage_localization_onQueue___block_invoke;
  block[3] = &unk_2640EF438;
  void block[5] = a4;
  block[6] = &v19;
  block[4] = self;
  dispatch_sync(lexiconSerialQueue, block);
  id v10 = (void *)v20[5];
  if (!v10 || objc_msgSend(v10, "isEqual:", objc_msgSend(MEMORY[0x263EFF9D0], "null")))
  {
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    id v12 = objc_alloc_init(MEMORY[0x263F086B0]);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __75__AppleSpell_Lexicon___loadPhraseLexiconsForLanguage_localization_onQueue___block_invoke_2;
    v17[3] = &unk_2640EFA60;
    v17[4] = self;
    v17[5] = a3;
    v17[6] = a4;
    void v17[7] = v11;
    dispatch_sync((dispatch_queue_t)a5, v17);
    v20[5] = v11;
    uint64_t v13 = self->_lexiconSerialQueue;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __75__AppleSpell_Lexicon___loadPhraseLexiconsForLanguage_localization_onQueue___block_invoke_3;
    v16[3] = &unk_2640EF5E8;
    v16[5] = a4;
    void v16[6] = &v19;
    v16[4] = self;
    dispatch_sync(v13, v16);
  }
  id v14 = (void *)v20[5];
  _Block_object_dispose(&v19, 8);
  return v14;
}

id __75__AppleSpell_Lexicon___loadPhraseLexiconsForLanguage_localization_onQueue___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 72) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

PRLexicon *__75__AppleSpell_Lexicon___loadPhraseLexiconsForLanguage_localization_onQueue___block_invoke_2(uint64_t a1)
{
  id result = (PRLexicon *)[*(id *)(a1 + 32) _phraseLexiconPathForLanguage:*(void *)(a1 + 40)];
  if (result)
  {
    id result = +[PRLexicon lexiconWithLocalization:*(void *)(a1 + 48) unigramsPath:result];
    if (result)
    {
      id v3 = result;
      uint64_t v4 = *(void **)(a1 + 56);
      return (PRLexicon *)[v4 addObject:v3];
    }
  }
  return result;
}

uint64_t __75__AppleSpell_Lexicon___loadPhraseLexiconsForLanguage_localization_onQueue___block_invoke_3(void *a1)
{
  return [*(id *)(a1[4] + 72) setObject:*(void *)(*(void *)(a1[6] + 8) + 40) forKey:a1[5]];
}

- (id)_phraseLexiconsForLanguage:(id)a3 waitForResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = -[AppleSpell languageModelLocalizationForLanguage:](self, "languageModelLocalizationForLanguage:");
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3052000000;
  long long v17 = __Block_byref_object_copy__3;
  uint64_t v18 = __Block_byref_object_dispose__3;
  uint64_t v19 = 0;
  if (_phraseLexiconsForLanguage_waitForResult__onceToken != -1) {
    dispatch_once(&_phraseLexiconsForLanguage_waitForResult__onceToken, &__block_literal_global_61);
  }
  lexiconSerialQueue = self->_lexiconSerialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__AppleSpell_Lexicon___phraseLexiconsForLanguage_waitForResult___block_invoke_2;
  block[3] = &unk_2640EF438;
  void block[5] = v7;
  block[6] = &v14;
  block[4] = self;
  dispatch_sync(lexiconSerialQueue, block);
  if (objc_msgSend((id)v15[5], "isEqual:", objc_msgSend(MEMORY[0x263EFF9D0], "null")))
  {
    id v9 = 0;
    v15[5] = 0;
  }
  else
  {
    id v9 = (id)v15[5];
    if (!v9)
    {
      if (v4)
      {
        id v9 = [(AppleSpell *)self _loadPhraseLexiconsForLanguage:a3 localization:v7 onQueue:_phraseLexiconsForLanguage_waitForResult___phraseLexiconCreationSerialQueue];
        v15[5] = (uint64_t)v9;
      }
      else
      {
        id v10 = [(AppleSpell *)self backgroundLoadingQueue];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __64__AppleSpell_Lexicon___phraseLexiconsForLanguage_waitForResult___block_invoke_3;
        v12[3] = &unk_2640EF460;
        v12[4] = self;
        v12[5] = a3;
        v12[6] = v7;
        dispatch_async(v10, v12);
        id v9 = (id)v15[5];
      }
    }
  }
  _Block_object_dispose(&v14, 8);
  return v9;
}

dispatch_queue_t __64__AppleSpell_Lexicon___phraseLexiconsForLanguage_waitForResult___block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.ProofReader.phraseLexiconCreationSerialQueue", 0);
  _phraseLexiconsForLanguage_waitForResult___phraseLexiconCreationSerialQueue = (uint64_t)result;
  return result;
}

id __64__AppleSpell_Lexicon___phraseLexiconsForLanguage_waitForResult___block_invoke_2(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 72) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v3 = *(void **)(a1[4] + 72);
    uint64_t v4 = [MEMORY[0x263EFF9D0] null];
    uint64_t v5 = a1[5];
    return (id)[v3 setObject:v4 forKey:v5];
  }
  return result;
}

void __64__AppleSpell_Lexicon___phraseLexiconsForLanguage_waitForResult___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x210556730]();
  [*(id *)(a1 + 32) _loadPhraseLexiconsForLanguage:*(void *)(a1 + 40) localization:*(void *)(a1 + 48) onQueue:_phraseLexiconsForLanguage_waitForResult___phraseLexiconCreationSerialQueue];
}

- (id)_phraseLexiconsForLanguage:(id)a3
{
  return [(AppleSpell *)self _phraseLexiconsForLanguage:a3 waitForResult:1];
}

- (void)updateLexiconsForLanguage:(id)a3
{
  id v4 = [(AppleSpell *)self languageModelLocalizationForLanguage:a3];
  lexiconSerialQueue = self->_lexiconSerialQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__AppleSpell_Lexicon__updateLexiconsForLanguage___block_invoke;
  v6[3] = &unk_2640EF488;
  v6[4] = self;
  v6[5] = v4;
  dispatch_sync(lexiconSerialQueue, v6);
}

uint64_t __49__AppleSpell_Lexicon__updateLexiconsForLanguage___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 64) objectForKey:*(void *)(a1 + 40)]) {
    [*(id *)(*(void *)(a1 + 32) + 64) removeObjectForKey:*(void *)(a1 + 40)];
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = *(void **)(*(void *)(a1 + 32) + 72);
    return [v4 removeObjectForKey:v3];
  }
  return result;
}

- (void)updateLexiconsForLanguageIfNecessary:(id)a3
{
  if (a3)
  {
    id v5 = -[AppleSpell languageModelLocalizationForLanguage:](self, "languageModelLocalizationForLanguage:");
    if (v5)
    {
      if (objc_msgSend(+[PRLanguage supportedAssetLexiconLanguages](PRLanguage, "supportedAssetLexiconLanguages"), "containsObject:", v5))
      {
        [(AppleSpell *)self updateLexiconsForLanguage:a3];
      }
    }
  }
}

- (void)updateLexiconsForLanguageObject:(id)a3
{
  uint64_t v4 = [a3 identifier];
  [(AppleSpell *)self updateLexiconsForLanguage:v4];
}

- (void)updateLexiconsForLanguageObjectIfNecessary:(id)a3
{
  if ([a3 isSupportedAssetLexiconLanguage])
  {
    [(AppleSpell *)self updateLexiconsForLanguageObject:a3];
  }
}

- (void)updateAllLexicons
{
  lexiconSerialQueue = self->_lexiconSerialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__AppleSpell_Lexicon__updateAllLexicons__block_invoke;
  block[3] = &unk_2640EF4B0;
  block[4] = self;
  dispatch_sync(lexiconSerialQueue, block);
}

uint64_t __40__AppleSpell_Lexicon__updateAllLexicons__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
}

- (BOOL)validateWord:(id)a3 inLexicons:(id)a4 forLanguage:(id)a5 requiredMetaFlags:(unsigned int)a6 alternativeRequiredMetaFlags:(unsigned int)a7 prohibitedMetaFlags:(unsigned int)a8 caseInsensitive:(BOOL)a9
{
  uint64_t v34 = 0;
  NSUInteger v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  uint64_t v12 = [a3 length];
  if (objc_msgSend(-[AppleSpell languageModelLocalizationForLanguage:](self, "languageModelLocalizationForLanguage:", a5), "isEqualToString:", @"tr"))
  {
    uint64_t v13 = validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive__turkishLocale;
    if (!validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive__turkishLocale)
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"tr"];
      validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive__turkishLocale = v13;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  if (a4 && v12)
  {
    uint64_t v14 = [a4 count];
    int v15 = *((unsigned __int8 *)v35 + 24);
    if (!*((unsigned char *)v35 + 24))
    {
      unint64_t v16 = v14;
      if (v14)
      {
        unint64_t v17 = 0;
        do
        {
          uint64_t v18 = (void *)[a4 objectAtIndex:v17];
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __142__AppleSpell_Lexicon__validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive___block_invoke;
          v25[3] = &unk_2640EFA88;
          BOOL v29 = a9;
          unsigned int v26 = a6;
          unsigned int v27 = a7;
          unsigned int v28 = a8;
          v25[6] = v30;
          v25[7] = v32;
          v25[4] = a3;
          v25[5] = v13;
          v25[8] = &v34;
          v25[9] = v12;
          [v18 enumerateEntriesForString:a3 usingBlock:v25];
          int v15 = *((unsigned __int8 *)v35 + 24);
          if (*((unsigned char *)v35 + 24)) {
            break;
          }
          ++v17;
        }
        while (v17 < v16);
      }
    }
  }
  else
  {
    int v15 = *((unsigned __int8 *)v35 + 24);
  }
  BOOL v19 = v15 != 0;
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);
  return v19;
}

uint64_t __142__AppleSpell_Lexicon__validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive___block_invoke(uint64_t result, void *a2, uint64_t a3, int a4, unsigned char *a5)
{
  uint64_t v7 = result;
  if (((*(_DWORD *)(result + 80) & ~a4) == 0 || (*(_DWORD *)(result + 84) & ~a4) == 0)
    && (*(_DWORD *)(result + 88) & a4) == 0)
  {
    if (*(unsigned char *)(result + 92) || (objc_msgSend(a2, "isEqualToString:", objc_msgSend(a2, "lowercaseString")) & 1) != 0)
    {
      BOOL v8 = 1;
    }
    else
    {
      if (!*(unsigned char *)(*(void *)(*(void *)(v7 + 48) + 8) + 24))
      {
        if (!validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive__lowercaseSet) {
          validateWord_inLexicons_forLanguage_requiredMetaFlags_alternativeRequiredMetaFlags_prohibitedMetaFlags_caseInsensitive__lowercaseSet = (uint64_t)(id)[MEMORY[0x263F08708] lowercaseLetterCharacterSet];
        }
        objc_msgSend(*(id *)(v7 + 32), "rangeOfCharacterFromSet:");
        *(unsigned char *)(*(void *)(*(void *)(v7 + 56) + 8) + 24) = v9 != 0;
        *(unsigned char *)(*(void *)(*(void *)(v7 + 48) + 8) + 24) = 1;
      }
      BOOL v8 = *(unsigned char *)(*(void *)(*(void *)(v7 + 56) + 8) + 24) == 0;
    }
    uint64_t result = objc_msgSend(*(id *)(v7 + 32), "compare:options:range:locale:", a2, v8, 0, *(void *)(v7 + 72), *(void *)(v7 + 40));
    if (!result)
    {
      *(unsigned char *)(*(void *)(*(void *)(v7 + 64) + 8) + 24) = 1;
      *a5 = 1;
    }
  }
  return result;
}

- (BOOL)validateWord:(id)a3 inLexiconForLanguage:(id)a4
{
  LOBYTE(v5) = 0;
  return [(AppleSpell *)self validateWord:a3 inLexicons:[(AppleSpell *)self _lexiconsForLanguage:a4] forLanguage:a4 requiredMetaFlags:0 alternativeRequiredMetaFlags:0 prohibitedMetaFlags:66 caseInsensitive:v5];
}

- (BOOL)validateAdditionalWord:(id)a3 inLexiconForLanguage:(id)a4
{
  LOBYTE(v5) = 0;
  return [(AppleSpell *)self validateWord:a3 inLexicons:[(AppleSpell *)self _lexiconsForLanguage:a4] forLanguage:a4 requiredMetaFlags:0 alternativeRequiredMetaFlags:0 prohibitedMetaFlags:64 caseInsensitive:v5];
}

- (BOOL)validateVariantWord:(id)a3 inLexiconForLanguage:(id)a4
{
  LOBYTE(v5) = 1;
  return [(AppleSpell *)self validateWord:a3 inLexicons:[(AppleSpell *)self _lexiconsForLanguage:a4] forLanguage:a4 requiredMetaFlags:0 alternativeRequiredMetaFlags:0 prohibitedMetaFlags:0 caseInsensitive:v5];
}

- (BOOL)validateNoCapAbbreviation:(id)a3 inLexiconForLanguage:(id)a4
{
  LOBYTE(v5) = 1;
  return [(AppleSpell *)self validateWord:a3 inLexicons:[(AppleSpell *)self _lexiconsForLanguage:a4] forLanguage:a4 requiredMetaFlags:64 alternativeRequiredMetaFlags:64 prohibitedMetaFlags:0 caseInsensitive:v5];
}

- (BOOL)validateUntilLearnedWord:(id)a3 inLexiconForLanguage:(id)a4
{
  LOBYTE(v5) = 0;
  return [(AppleSpell *)self validateWord:a3 inLexicons:[(AppleSpell *)self _lexiconsForLanguage:a4] forLanguage:a4 requiredMetaFlags:4 alternativeRequiredMetaFlags:128 prohibitedMetaFlags:66 caseInsensitive:v5];
}

- (BOOL)validateWord:(id)a3 inLexiconsForLanguageObject:(id)a4 requiredMetaFlags:(unsigned int)a5 alternativeRequiredMetaFlags:(unsigned int)a6 prohibitedMetaFlags:(unsigned int)a7 caseInsensitive:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return -[AppleSpell validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, -[AppleSpell _lexiconsForLanguage:](self, "_lexiconsForLanguage:", [a4 identifier]), objc_msgSend(a4, "identifier"), *(void *)&a5, *(void *)&a6, *(void *)&a7, v9);
}

- (BOOL)validateWord:(id)a3 inLexiconForLanguageObject:(id)a4
{
  return [(AppleSpell *)self validateWord:a3 inLexiconsForLanguageObject:a4 requiredMetaFlags:0 alternativeRequiredMetaFlags:0 prohibitedMetaFlags:66 caseInsensitive:0];
}

- (BOOL)validateAdditionalWord:(id)a3 inLexiconForLanguageObject:(id)a4
{
  return [(AppleSpell *)self validateWord:a3 inLexiconsForLanguageObject:a4 requiredMetaFlags:0 alternativeRequiredMetaFlags:0 prohibitedMetaFlags:64 caseInsensitive:0];
}

- (BOOL)validateVariantWord:(id)a3 inLexiconForLanguageObject:(id)a4
{
  return [(AppleSpell *)self validateWord:a3 inLexiconsForLanguageObject:a4 requiredMetaFlags:0 alternativeRequiredMetaFlags:0 prohibitedMetaFlags:0 caseInsensitive:1];
}

- (BOOL)validateNoCapAbbreviation:(id)a3 inLexiconForLanguageObject:(id)a4
{
  return [(AppleSpell *)self validateWord:a3 inLexiconsForLanguageObject:a4 requiredMetaFlags:64 alternativeRequiredMetaFlags:64 prohibitedMetaFlags:0 caseInsensitive:1];
}

- (BOOL)validateUntilLearnedWord:(id)a3 inLexiconForLanguageObject:(id)a4
{
  return [(AppleSpell *)self validateWord:a3 inLexiconsForLanguageObject:a4 requiredMetaFlags:4 alternativeRequiredMetaFlags:128 prohibitedMetaFlags:66 caseInsensitive:0];
}

- (BOOL)validateWord:(id)a3 inLexicon:(id)a4
{
  LOBYTE(v5) = 0;
  return -[AppleSpell validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:](self, "validateWord:inLexicons:forLanguage:requiredMetaFlags:alternativeRequiredMetaFlags:prohibitedMetaFlags:caseInsensitive:", a3, [MEMORY[0x263EFF8C0] arrayWithObject:a4], 0, 0, 0, 66, v5);
}

- (BOOL)getMetaFlagsForWord:(id)a3 inLexiconForLanguage:(id)a4 metaFlags:(unsigned int *)a5 otherMetaFlags:(unsigned int *)a6
{
  uint64_t v44 = 0;
  int v45 = &v44;
  uint64_t v46 = 0x2020000000;
  int v47 = 0;
  uint64_t v40 = 0;
  int v41 = &v40;
  uint64_t v42 = 0x2020000000;
  int v43 = 0;
  uint64_t v36 = 0;
  char v37 = &v36;
  uint64_t v38 = 0x2020000000;
  int v39 = 0;
  uint64_t v32 = 0;
  char v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v28 = 0;
  BOOL v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v22 = [a3 length];
  id v9 = [(AppleSpell *)self _lexiconsForLanguage:a4];
  if (getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__onceToken != -1) {
    dispatch_once(&getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__onceToken, &__block_literal_global_70);
  }
  if (objc_msgSend(-[AppleSpell languageModelLocalizationForLanguage:](self, "languageModelLocalizationForLanguage:", a4), "isEqualToString:", @"tr"))
  {
    uint64_t v10 = getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__turkishLocale;
    if (!getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__turkishLocale)
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"tr"];
      getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__turkishLocale = v10;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (v9 && v22)
  {
    unint64_t v11 = [v9 count];
    for (unint64_t i = 0; ; ++i)
    {
      if (*((unsigned char *)v33 + 24) && *((unsigned char *)v29 + 24))
      {
        if (*((unsigned char *)v25 + 24)) {
          BOOL v13 = 1;
        }
        else {
          BOOL v13 = i >= v11;
        }
        if (v13) {
          break;
        }
      }
      else if (i >= v11)
      {
        break;
      }
      uint64_t v14 = (void *)[v9 objectAtIndex:i];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __89__AppleSpell_Lexicon__getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags___block_invoke_2;
      v23[3] = &unk_2640EFAB0;
      v23[5] = v10;
      v23[6] = &v24;
      v23[7] = &v32;
      v23[8] = &v36;
      v23[9] = &v44;
      v23[10] = &v28;
      v23[11] = &v40;
      v23[12] = v22;
      v23[4] = a3;
      [v14 enumerateEntriesForString:a3 usingBlock:v23];
    }
  }
  [a3 rangeOfCharacterFromSet:getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__lowercaseSet];
  if (v15)
  {
    *((_DWORD *)v45 + 6) = 0;
    *((unsigned char *)v33 + 24) = 0;
  }
  if (a5)
  {
    if (*((unsigned char *)v25 + 24))
    {
      unint64_t v16 = v37;
    }
    else if (*((unsigned char *)v29 + 24))
    {
      unint64_t v16 = v41;
    }
    else
    {
      unint64_t v16 = v45;
    }
    *a5 = *((_DWORD *)v16 + 6);
  }
  if (a6)
  {
    if (*((unsigned char *)v29 + 24))
    {
      unint64_t v17 = v41;
    }
    else if (*((unsigned char *)v25 + 24))
    {
      unint64_t v17 = v37;
    }
    else
    {
      unint64_t v17 = v45;
    }
    *a6 = *((_DWORD *)v17 + 6);
  }
  BOOL v18 = *((unsigned char *)v33 + 24) || *((unsigned char *)v29 + 24) || *((unsigned char *)v25 + 24) != 0;
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  return v18;
}

id __89__AppleSpell_Lexicon__getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags___block_invoke()
{
  id result = (id)[MEMORY[0x263F08708] lowercaseLetterCharacterSet];
  getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags__lowercaseSet = (uint64_t)result;
  return result;
}

uint64_t __89__AppleSpell_Lexicon__getMetaFlagsForWord_inLexiconForLanguage_metaFlags_otherMetaFlags___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  int v7 = objc_msgSend(a2, "isEqualToString:", objc_msgSend(a2, "lowercaseString"));
  uint64_t result = [*(id *)(a1 + 32) isEqualToString:a2];
  if (!result)
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 32), "compare:options:range:locale:", a2, 1, 0, *(void *)(a1 + 96), *(void *)(a1 + 40));
    if (result) {
      return result;
    }
    if (!v7 || *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
      if (*(unsigned char *)(v9 + 24)) {
        return result;
      }
      *(unsigned char *)(v9 + 24) = 1;
      uint64_t v10 = *(void *)(a1 + 72);
      goto LABEL_12;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a4;
LABEL_11:
    uint64_t v10 = *(void *)(a1 + 88);
LABEL_12:
    *(_DWORD *)(*(void *)(v10 + 8) + 24) = a4;
    return result;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a4;
    if (v7)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      goto LABEL_11;
    }
  }
  return result;
}

- (id)phraseMatching:(id)a3 inLexiconForLanguage:(id)a4
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy__3;
  uint64_t v23 = __Block_byref_object_dispose__3;
  uint64_t v24 = 0;
  CFIndex v7 = [a3 length];
  v25.NSUInteger location = 0;
  v25.NSUInteger length = v7;
  CFIndex Bytes = CFStringGetBytes((CFStringRef)a3, v25, 0x8000100u, 0, 0, 0, 0, 0);
  id v9 = [(AppleSpell *)self _phraseLexiconsForLanguage:a4];
  uint64_t v10 = 0;
  if (v7 && v7 == Bytes)
  {
    unint64_t v11 = v9;
    if (v9)
    {
      uint64_t v12 = [v9 count];
      uint64_t v10 = (void *)v20[5];
      if (!v10)
      {
        unint64_t v13 = v12;
        if (v12)
        {
          unint64_t v14 = 0;
          do
          {
            uint64_t v15 = (void *)[v11 objectAtIndex:v14];
            v18[0] = MEMORY[0x263EF8330];
            v18[1] = 3221225472;
            v18[2] = __59__AppleSpell_Lexicon__phraseMatching_inLexiconForLanguage___block_invoke;
            v18[3] = &unk_2640EFAD8;
            v18[4] = a3;
            v18[5] = &v19;
            [v15 enumerateEntriesForString:a3 usingBlock:v18];
            ++v14;
            uint64_t v10 = (void *)v20[5];
            if (v10) {
              BOOL v16 = 1;
            }
            else {
              BOOL v16 = v14 >= v13;
            }
          }
          while (!v16);
        }
      }
    }
    else
    {
      uint64_t v10 = (void *)v20[5];
    }
  }
  _Block_object_dispose(&v19, 8);
  return v10;
}

void *__59__AppleSpell_Lexicon__phraseMatching_inLexiconForLanguage___block_invoke(void *result, void *a2, uint64_t a3, char a4, unsigned char *a5)
{
  if ((a4 & 0xCA) == 0)
  {
    CFIndex v7 = result;
    uint64_t result = (void *)[a2 compare:result[4] options:129];
    if (!result)
    {
      uint64_t result = (id)[a2 copy];
      *(void *)(*(void *)(v7[5] + 8) + 40) = result;
      *a5 = 1;
    }
  }
  return result;
}

- (void)enumerateEntriesForWord:(id)a3 inLexiconForLanguage:(id)a4 withBlock:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = [(AppleSpell *)self _lexiconsForLanguage:a4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __78__AppleSpell_Lexicon__enumerateEntriesForWord_inLexiconForLanguage_withBlock___block_invoke;
        v13[3] = &unk_2640EF4D8;
        v13[4] = a5;
        [v12 enumerateEntriesForString:a3 usingBlock:v13];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

uint64_t __78__AppleSpell_Lexicon__enumerateEntriesForWord_inLexiconForLanguage_withBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 0xC2) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)enumerateCorrectionEntriesForWord:(id)a3 maxCorrections:(unint64_t)a4 inLexiconForLanguage:(id)a5 withBlock:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = [(AppleSpell *)self _lexiconsForLanguage:a5];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __103__AppleSpell_Lexicon__enumerateCorrectionEntriesForWord_maxCorrections_inLexiconForLanguage_withBlock___block_invoke;
        v15[3] = &unk_2640EFB00;
        v15[4] = a6;
        [v14 enumerateCorrectionEntriesForWord:a3 maxCorrections:a4 withBlock:v15];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

uint64_t __103__AppleSpell_Lexicon__enumerateCorrectionEntriesForWord_maxCorrections_inLexiconForLanguage_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)getMetaFlagsForWord:(id)a3 inLexiconForLanguageObject:(id)a4 metaFlags:(unsigned int *)a5 otherMetaFlags:(unsigned int *)a6
{
  uint64_t v10 = [a4 identifier];
  return [(AppleSpell *)self getMetaFlagsForWord:a3 inLexiconForLanguage:v10 metaFlags:a5 otherMetaFlags:a6];
}

- (id)phraseMatching:(id)a3 inLexiconForLanguageObject:(id)a4
{
  uint64_t v6 = [a4 identifier];
  return [(AppleSpell *)self phraseMatching:a3 inLexiconForLanguage:v6];
}

- (void)enumerateEntriesForWord:(id)a3 inLexiconForLanguageObject:(id)a4 withBlock:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = [(AppleSpell *)self _lexiconsForLanguageObject:a4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __84__AppleSpell_Lexicon__enumerateEntriesForWord_inLexiconForLanguageObject_withBlock___block_invoke;
        v13[3] = &unk_2640EF4D8;
        v13[4] = a5;
        [v12 enumerateEntriesForString:a3 usingBlock:v13];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

uint64_t __84__AppleSpell_Lexicon__enumerateEntriesForWord_inLexiconForLanguageObject_withBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 0xC2) == 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)enumerateCorrectionEntriesForWord:(id)a3 maxCorrections:(unint64_t)a4 inLexiconForLanguageObject:(id)a5 withBlock:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = [(AppleSpell *)self _lexiconsForLanguageObject:a5];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __109__AppleSpell_Lexicon__enumerateCorrectionEntriesForWord_maxCorrections_inLexiconForLanguageObject_withBlock___block_invoke;
        v15[3] = &unk_2640EFB00;
        v15[4] = a6;
        [v14 enumerateCorrectionEntriesForWord:a3 maxCorrections:a4 withBlock:v15];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

uint64_t __109__AppleSpell_Lexicon__enumerateCorrectionEntriesForWord_maxCorrections_inLexiconForLanguageObject_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_loadNERTaggerOnQueue:(id)a3
{
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3052000000;
  long long v17 = __Block_byref_object_copy__3;
  long long v18 = __Block_byref_object_dispose__3;
  uint64_t v19 = 0;
  nerTaggerSerialQueue = self->_nerTaggerSerialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__AppleSpell_Lexicon___loadNERTaggerOnQueue___block_invoke;
  block[3] = &unk_2640EFB28;
  block[4] = self;
  void block[5] = &v14;
  dispatch_sync(nerTaggerSerialQueue, block);
  uint64_t v6 = (void *)v15[5];
  if (!v6 || objc_msgSend(v6, "isEqual:", objc_msgSend(MEMORY[0x263EFF9D0], "null")))
  {
    id v7 = objc_alloc_init(MEMORY[0x263F086B0]);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __45__AppleSpell_Lexicon___loadNERTaggerOnQueue___block_invoke_2;
    v12[3] = &unk_2640EF830;
    v12[4] = &v14;
    dispatch_sync((dispatch_queue_t)a3, v12);
    uint64_t v8 = self->_nerTaggerSerialQueue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __45__AppleSpell_Lexicon___loadNERTaggerOnQueue___block_invoke_3;
    v11[3] = &unk_2640EFB28;
    v11[4] = self;
    v11[5] = &v14;
    dispatch_sync(v8, v11);
  }
  id v9 = (void *)v15[5];
  _Block_object_dispose(&v14, 8);
  return v9;
}

id __45__AppleSpell_Lexicon___loadNERTaggerOnQueue___block_invoke(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 80) objectForKey:@"NER"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void *__45__AppleSpell_Lexicon___loadNERTaggerOnQueue___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F14038]);
  uint64_t v3 = *MEMORY[0x263F13FB0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_msgSend(v2, "initWithTagSchemes:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263F13FB0], 0));
  id result = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (result)
  {
    [result setString:@"This is a test string."];
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    return (void *)[v5 tagAtIndex:0 unit:0 scheme:v3 tokenRange:0];
  }
  return result;
}

uint64_t __45__AppleSpell_Lexicon___loadNERTaggerOnQueue___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40);
  if (v1) {
    return [*(id *)(*(void *)(result + 32) + 80) setObject:v1 forKey:@"NER"];
  }
  return result;
}

- (id)nerTaggerWaitForResult:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy__3;
  long long v15 = __Block_byref_object_dispose__3;
  uint64_t v16 = 0;
  if (nerTaggerWaitForResult__onceToken != -1) {
    dispatch_once(&nerTaggerWaitForResult__onceToken, &__block_literal_global_80);
  }
  nerTaggerSerialQueue = self->_nerTaggerSerialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__AppleSpell_Lexicon__nerTaggerWaitForResult___block_invoke_2;
  block[3] = &unk_2640EFB28;
  block[4] = self;
  void block[5] = &v11;
  dispatch_sync(nerTaggerSerialQueue, block);
  if (objc_msgSend((id)v12[5], "isEqual:", objc_msgSend(MEMORY[0x263EFF9D0], "null")))
  {
    id v6 = 0;
    void v12[5] = 0;
  }
  else
  {
    id v6 = (id)v12[5];
    if (!v6)
    {
      if (v3)
      {
        id v6 = [(AppleSpell *)self _loadNERTaggerOnQueue:nerTaggerWaitForResult___taggerCreationSerialQueue];
        void v12[5] = (uint64_t)v6;
      }
      else
      {
        id v7 = [(AppleSpell *)self backgroundLoadingQueue];
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __46__AppleSpell_Lexicon__nerTaggerWaitForResult___block_invoke_3;
        v9[3] = &unk_2640EF4B0;
        v9[4] = self;
        dispatch_async(v7, v9);
        id v6 = (id)v12[5];
      }
    }
  }
  _Block_object_dispose(&v11, 8);
  return v6;
}

dispatch_queue_t __46__AppleSpell_Lexicon__nerTaggerWaitForResult___block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.ProofReader.nerTaggerCreationSerialQueue", 0);
  nerTaggerWaitForResult___taggerCreationSerialQueue = (uint64_t)result;
  return result;
}

id __46__AppleSpell_Lexicon__nerTaggerWaitForResult___block_invoke_2(uint64_t a1)
{
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 80) objectForKey:@"NER"];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 80);
    uint64_t v4 = [MEMORY[0x263EFF9D0] null];
    return (id)[v3 setObject:v4 forKey:@"NER"];
  }
  return result;
}

void __46__AppleSpell_Lexicon__nerTaggerWaitForResult___block_invoke_3(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x210556730]();
  [*(id *)(a1 + 32) _loadNERTaggerOnQueue:nerTaggerWaitForResult___taggerCreationSerialQueue];
}

- (void)_checkEnglishArticlesInSentence:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 mutableCorrections:(id)a6
{
  v69[1] = *MEMORY[0x263EF8340];
  id v10 = +[PRLanguage languageObjectWithIdentifier:@"en"];
  uint64_t v11 = [(AppleSpell *)self databaseConnectionForLanguageObject:v10];
  CFStringEncoding v12 = [v10 encoding];
  if (v11)
  {
    if (v11[24] == 16)
    {
      long long v68 = 0u;
      long long v67 = 0u;
      long long v66 = 0u;
      long long v65 = 0u;
      int v59 = 0;
      v58[0] = 0;
      v58[1] = 0;
      int v56 = 0;
      __int16 v57 = 0;
      int v60 = a4;
      __int16 v61 = *(_WORD *)v11;
      HIWORD(v58[0]) = 256;
      *((void *)&v65 + 1) = v58;
      *(void *)&long long v66 = &v56;
      BYTE13(v67) = 0;
      __int16 v62 = 32;
      __int16 v64 = 0;
      __int16 v63 = a5;
      if (a5)
      {
        CFStringEncoding v13 = v12;
        id v46 = a6;
        PRbuf((uint64_t)&v60, 0xEu, 0);
        uint64_t v14 = (unsigned __int16 *)*((void *)&v66 + 1);
        if (*((void *)&v66 + 1))
        {
          BOOL v55 = a4 + 1;
          do
          {
            if (*((unsigned char *)v14 + 12) == 6)
            {
              CFIndex v15 = v14[1];
              if ((v15 - 1) <= 1)
              {
                uint64_t v16 = *v14;
                if (v15 + v16 + 3 < a5)
                {
                  long long v17 = (id)CFStringCreateWithBytes(0, (const UInt8 *)&a4[v16], v15, v13, 0);
                  long long v18 = (void *)[(__CFString *)v17 lowercaseString];
                  int v47 = v17;
                  int v50 = [(__CFString *)v17 isEqualToString:v18];
                  uint64_t v19 = *v14;
                  uint64_t v20 = v14[1];
                  uint64_t v21 = v20 + v19;
                  uint64_t v22 = &a4[v20 + v19];
                  int v23 = isLowerCaseX(*(v22 - 1), v13);
                  int v24 = 0;
                  if (v23)
                  {
                    if (a4[v21] == 32
                      && isAnyAlphaX_0(a4[v21 + 1], v13)
                      && isLowerCaseX(a4[v21 + 2], v13))
                    {
                      int v24 = isLowerCaseX(a4[v21 + 3], v13);
                    }
                    else
                    {
                      int v24 = 0;
                    }
                  }
                  int v54 = v24;
                  int v53 = toLowerX_0(v22[1], v13);
                  BOOL v48 = v21 + 5 < a5 && strncasecmp_l(&a4[v19 + 1 + v20], "for-", 4uLL, 0) == 0;
                  int v25 = v50;
                  int v51 = objc_msgSend(v18, "isEqualToString:", @"a", v46);
                  uint64_t v26 = @"an";
                  int v49 = [v18 isEqualToString:@"an"];
                  unint64_t v27 = 0;
                  if (v25)
                  {
                    uint64_t v28 = @"a";
                  }
                  else
                  {
                    uint64_t v26 = @"An";
                    uint64_t v28 = @"A";
                  }
                  do
                  {
                    size_t v29 = strlen(off_2640EFC88[v27]);
                    uint64_t v30 = *v14;
                    uint64_t v31 = v14[1];
                    if (v29 + v30 + v31 + 1 >= a5)
                    {
                      BOOL v32 = 0;
                    }
                    else
                    {
                      BOOL v32 = strncasecmp_l(&a4[v30 + 1 + v31], off_2640EFC88[v27], v29, 0) == 0;
                      if (v32) {
                        break;
                      }
                    }
                  }
                  while (v27++ <= 3);
                  if (v51) {
                    uint64_t v34 = v26;
                  }
                  else {
                    uint64_t v34 = 0;
                  }
                  if (v49) {
                    char v35 = v28;
                  }
                  else {
                    char v35 = v34;
                  }
                  CFIndex v36 = *v14;
                  uint64_t v52 = v14[1];
                  CFIndex v37 = v52 + v36;
                  if (v52 + v36 + 1 < a5)
                  {
                    while (1)
                    {
                      uint64_t v38 = v55[v37];
                      if (!isAnyAlphaX_0(v55[v37], v13)) {
                        break;
                      }
                      unsigned int v39 = toLowerX_0(v38, v13);
                      char v40 = vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(vdupq_n_s32(v39), (int32x4_t)xmmword_20CC64DD0))) | ((v39 & 0x1FB) == 97);
                      if ((v40 & 1) == 0)
                      {
                        unint64_t v41 = v37 + 2;
                        ++v37;
                        if (v41 < a5) {
                          continue;
                        }
                      }
                      goto LABEL_39;
                    }
                  }
                  char v40 = 0;
LABEL_39:
                  int v42 = v54 ^ 1;
                  if (!v35) {
                    int v42 = 1;
                  }
                  if (v53 == 104) {
                    int v42 = 1;
                  }
                  if (!(v32 | (v42 | v48) & 1 | ((v40 & 1) == 0)))
                  {
                    if (v36) {
                      uint64_t v43 = [(__CFString *)(id)(id)CFStringCreateWithBytes(0, (const UInt8 *)a4, v36, v13, 0) length];
                    }
                    else {
                      uint64_t v43 = 0;
                    }
                    uint64_t v44 = [PRSentenceCorrection alloc];
                    v69[0] = v35;
                    int v45 = -[PRSentenceCorrection initWithCategory:range:word:corrections:](v44, "initWithCategory:range:word:corrections:", 4, v43, v52, v47, [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:1]);
                    [v46 addObject:v45];
                  }
                }
              }
            }
            uint64_t v14 = (unsigned __int16 *)*((void *)v14 + 5);
          }
          while (v14);
        }
        PRbuf((uint64_t)&v60, 0x11u, 0);
      }
    }
  }
}

- (const)englishPhraseRoot
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__AppleSpell_SentenceCorrection__englishPhraseRoot__block_invoke;
  block[3] = &unk_2640EF4B0;
  block[4] = self;
  if (englishPhraseRoot_onceToken != -1) {
    dispatch_once(&englishPhraseRoot_onceToken, block);
  }
  return (const void *)englishPhraseRoot_phrase_root;
}

uint64_t *__51__AppleSpell_SentenceCorrection__englishPhraseRoot__block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v2 = +[PRLanguage languageObjectWithIdentifier:@"en"];
  CFStringEncoding v3 = [v2 encoding];
  uint64_t v4 = (void *)[*(id *)(a1 + 32) phraseCorrectionsDictionaryForLanguageObject:v2];
  obuint64_t j = (id)[MEMORY[0x263EFF980] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v5 = v4;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v42 objects:v47 count:16];
  id v7 = &OBJC_METACLASS___PRTagger;
  if (v6)
  {
    uint64_t v8 = v6;
    unint64_t v35 = 0;
    uint64_t v9 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(__CFString **)(*((void *)&v42 + 1) + 8 * i);
        CFStringEncoding v12 = (__CFString *)[v5 objectForKey:v11];
        CFIndex v13 = [(__CFString *)v11 length];
        CFIndex v14 = [(__CFString *)v12 length];
        CFIndex v40 = 0;
        CFIndex usedBufLen = 0;
        v49.NSUInteger location = 0;
        v49.NSUInteger length = v13;
        CFIndex Bytes = CFStringGetBytes(v11, v49, v3, 0x5Fu, 0, 0, 0, &usedBufLen);
        v50.NSUInteger location = 0;
        v50.NSUInteger length = v14;
        CFIndex v16 = CFStringGetBytes(v12, v50, v3, 0x5Fu, 0, 0, 0, &v40);
        if (Bytes == v13 && v16 == v14)
        {
          v35 += usedBufLen + v40 + 2;
          [obj addObject:v11];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v8);
    id v7 = &OBJC_METACLASS___PRTagger;
    if (v35)
    {
      long long v18 = (UInt8 *)malloc_type_malloc(v35 + 2, 0xA495E794uLL);
      englishPhraseRoot_strings = (uint64_t)v18;
      *(_WORD *)&v18[v35] = 0;
      [obj sortUsingSelector:sel_compare_];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v19 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v33 = *(void *)v37;
        while (2)
        {
          uint64_t v21 = 0;
          unint64_t v22 = v35;
          do
          {
            if (*(void *)v37 != v33) {
              objc_enumerationMutation(obj);
            }
            int v23 = *(__CFString **)(*((void *)&v36 + 1) + 8 * v21);
            int v24 = (__CFString *)[v5 objectForKey:v23];
            CFIndex v25 = [(__CFString *)v23 length];
            CFIndex v26 = [(__CFString *)v24 length];
            CFIndex v40 = 0;
            CFIndex usedBufLen = 0;
            v51.NSUInteger location = 0;
            v51.NSUInteger length = v25;
            CFStringGetBytes(v23, v51, v3, 0x5Fu, 0, v18, v22, &usedBufLen);
            unint64_t v27 = &v18[usedBufLen];
            v18[usedBufLen] = 0;
            BOOL v28 = v22 > usedBufLen + 1;
            unint64_t v29 = v22 - (usedBufLen + 1);
            if (!v28) {
              goto LABEL_27;
            }
            uint64_t v30 = v27 + 1;
            v52.NSUInteger location = 0;
            v52.NSUInteger length = v26;
            CFStringGetBytes(v24, v52, v3, 0x5Fu, 0, v27 + 1, v29, &v40);
            uint64_t v31 = &v30[v40];
            v30[v40] = 0;
            BOOL v28 = v29 > v40 + 1;
            unint64_t v22 = v29 - (v40 + 1);
            if (!v28)
            {
LABEL_27:
              id v7 = &OBJC_METACLASS___PRTagger;
              goto LABEL_28;
            }
            long long v18 = v31 + 1;
            ++v21;
          }
          while (v20 != v21);
          unint64_t v35 = v22;
          uint64_t v20 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
          id v7 = &OBJC_METACLASS___PRTagger;
          if (v20) {
            continue;
          }
          break;
        }
      }
    }
  }
LABEL_28:
  id result = (uint64_t *)v7[8].cache;
  if (result)
  {
    id result = create_phrase_root_from_strings((const char *)result);
    englishPhraseRoot_phrase_root = (uint64_t)result;
  }
  return result;
}

- (void)_checkEnglishPhrasesInSentence:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 mutableCorrections:(id)a6
{
  id v22 = +[PRLanguage languageObjectWithIdentifier:@"en"];
  CFStringEncoding v9 = [v22 encoding];
  BOOL v32 = a4;
  int v23 = self;
  id v10 = [(AppleSpell *)self englishPhraseRoot];
  if (v10 && a4)
  {
    uint64_t v11 = (uint64_t)v10;
    uint64_t v31 = 0;
    CFStringEncoding v12 = &a4[a5];
    CFIndex v13 = (unsigned __int8 *)a4;
    while (v13 < (unsigned __int8 *)v12)
    {
      uint64_t v27 = 0;
      BOOL v28 = &v27;
      uint64_t v29 = 0x2020000000;
      char v30 = 0;
      CFIndex v14 = next_phrase(v13, v12 - (char *)v13, v11, (unsigned __int8 **)&v32, &v31);
      unint64_t v15 = (unint64_t)v14;
      if (v14 < (unsigned __int8 *)a4 || !v14 || !v31 || v32 < (char *)v14)
      {
        _Block_object_dispose(&v27, 8);
        return;
      }
      CFIndex v16 = (void *)[(__CFString *)(id)(id)CFStringCreateWithBytes(0, v14, v32 - (char *)v14, v9, 0) lowercaseString];
      CFStringRef v17 = (id)CFStringCreateWithCString(0, v31, v9);
      long long v18 = &stru_26C1C71A8;
      CFIndex v19 = v15 - (void)a4;
      if (v15 > (unint64_t)a4) {
        long long v18 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a4, v19, v9, 0);
      }
      uint64_t v20 = [(__CFString *)v18 length];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __98__AppleSpell_SentenceCorrection___checkEnglishPhrasesInSentence_buffer_length_mutableCorrections___block_invoke;
      v26[3] = &unk_2640EF948;
      v26[4] = v18;
      v26[5] = &v27;
      -[__CFString enumerateSubstringsInRange:options:usingBlock:](v18, "enumerateSubstringsInRange:options:usingBlock:", 0, v20, 771, v26);
      if (!*((unsigned char *)v28 + 24))
      {
        uint64_t v21 = [v16 length];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __98__AppleSpell_SentenceCorrection___checkEnglishPhrasesInSentence_buffer_length_mutableCorrections___block_invoke_2;
        v25[3] = &unk_2640EFCB8;
        v25[4] = v23;
        v25[5] = v22;
        v25[6] = v17;
        v25[7] = v16;
        v25[8] = v18;
        v25[9] = a6;
        objc_msgSend(v16, "enumerateSubstringsInRange:options:usingBlock:", 0, v21, 3, v25);
      }
      _Block_object_dispose(&v27, 8);
      CFIndex v13 = (unsigned __int8 *)v32;
      if (!v32) {
        return;
      }
    }
  }
}

unint64_t __98__AppleSpell_SentenceCorrection___checkEnglishPhrasesInSentence_buffer_length_mutableCorrections___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  unint64_t v9 = a3 + a4;
  unint64_t result = [*(id *)(a1 + 32) length];
  if (v9 >= result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  *a7 = 1;
  return result;
}

void __98__AppleSpell_SentenceCorrection___checkEnglishPhrasesInSentence_buffer_length_mutableCorrections___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v11 = (void *)[*(id *)(a1 + 32) potentialSentenceCorrectionsForWord:a2 languageObject:*(void *)(a1 + 40)];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", objc_msgSend(*(id *)(a1 + 56), "stringByReplacingCharactersInRange:withString:", a3, a4, v16)))
        {
          uint64_t v17 = [*(id *)(a1 + 64) length] + a3;
          long long v18 = [PRSentenceCorrection alloc];
          uint64_t v25 = v16;
          CFIndex v19 = -[PRSentenceCorrection initWithCategory:range:word:corrections:](v18, "initWithCategory:range:word:corrections:", 5, v17, a4, a2, [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1]);
          [*(id *)(a1 + 72) addObject:v19];

          *a7 = 1;
          return;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
}

- (id)_checkSentence:(id)a3 languageObject:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = (void *)[MEMORY[0x263EFF980] array];
  CFStringEncoding v8 = [a4 encoding];
  CFIndex v9 = [a3 length];
  CFIndex usedBufLen = 0;
  if ([a4 isEnglish])
  {
    v19.NSUInteger location = 0;
    v19.NSUInteger length = v9;
    if (v9 == CFStringGetBytes((CFStringRef)a3, v19, v8, 0x5Fu, 0, buffer, 1024, &usedBufLen))
    {
      unint64_t v10 = usedBufLen;
      if (usedBufLen)
      {
        for (uint64_t i = 0; v10 != i; ++i)
        {
          unsigned int v12 = buffer[i];
          int v13 = 32;
          if (v12 > 0x9F)
          {
            if (buffer[i] > 0xB3u)
            {
              if (v12 == 187) {
                goto LABEL_20;
              }
              if (v12 == 180)
              {
LABEL_8:
                int v13 = 39;
LABEL_22:
                buffer[i] = v13;
                unsigned int v12 = v13;
              }
            }
            else
            {
              if (v12 == 160) {
                goto LABEL_22;
              }
              if (v12 == 171)
              {
LABEL_20:
                int v13 = 34;
                goto LABEL_22;
              }
            }
          }
          else
          {
            if (buffer[i] > 0x81u)
            {
              switch(buffer[i])
              {
                case 0x82u:
                case 0x84u:
                case 0x8Bu:
                case 0x91u:
                case 0x92u:
                case 0x9Bu:
                  goto LABEL_8;
                case 0x85u:
                case 0x97u:
                  goto LABEL_22;
                case 0x93u:
                case 0x94u:
                  goto LABEL_20;
                case 0x96u:
                  int v13 = 45;
                  goto LABEL_22;
                default:
                  goto LABEL_23;
              }
              goto LABEL_23;
            }
            if (v12 == 92 || v12 == 95) {
              goto LABEL_22;
            }
            if (v12 == 96) {
              goto LABEL_8;
            }
          }
LABEL_23:
          if (i + 2 < v10 && v12 == 46)
          {
            uint64_t v14 = &buffer[i];
            if (buffer[i + 1] == 46 && v14[2] == 46)
            {
              v14[2] = 32;
              v14[1] = 32;
              buffer[i] = 32;
            }
          }
        }
      }
      buffer[v10] = 0;
      -[AppleSpell _checkEnglishArticlesInSentence:buffer:length:mutableCorrections:](self, "_checkEnglishArticlesInSentence:buffer:length:mutableCorrections:", a3, buffer);
      [(AppleSpell *)self _checkEnglishPhrasesInSentence:a3 buffer:buffer length:usedBufLen mutableCorrections:v7];
    }
  }
  return v7;
}

- (void)_checkSentence:(id)a3 languageObject:(id)a4 mutableCorrections:(id)a5
{
  if (_checkSentence_languageObject_mutableCorrections__onceToken != -1) {
    dispatch_once(&_checkSentence_languageObject_mutableCorrections__onceToken, &__block_literal_global_69);
  }
  uint64_t v9 = [(id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionDictionary objectForKey:a3];
  if (v9)
  {
    id v10 = (id)v9;
    [(id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionArray removeObject:a3];
  }
  else
  {
    id v10 = [(AppleSpell *)self _checkSentence:a3 languageObject:a4];
    if ((unint64_t)[(id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionArray count] >= 0x80)
    {
      for (uint64_t i = 0; i != 32; ++i)
        objc_msgSend((id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionDictionary, "removeObjectForKey:", objc_msgSend((id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionArray, "objectAtIndex:", i));
      objc_msgSend((id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionArray, "removeObjectsInRange:", 0, 32);
    }
    [(id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionDictionary setObject:v10 forKey:a3];
  }
  [(id)_checkSentence_languageObject_mutableCorrections__sentenceCorrectionArray addObject:a3];
  [a5 addObjectsFromArray:v10];
}

id __83__AppleSpell_SentenceCorrection___checkSentence_languageObject_mutableCorrections___block_invoke()
{
  _checkSentence_languageObject_mutableCorrections__sentenceCorrectionDictionary = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  id result = objc_alloc_init(MEMORY[0x263EFF980]);
  _checkSentence_languageObject_mutableCorrections__sentenceCorrectionArray = (uint64_t)result;
  return result;
}

- (void)spellServer:(id)a3 checkSentenceCorrectionInString:(id)a4 rangeInParagraph:(_NSRange)a5 languageObject:(id)a6 locale:(id)a7 tagger:(id)a8 offset:(unint64_t)a9 keyEventArray:(id)a10 selectedRangeValue:(id)a11 autocorrect:(BOOL)a12 checkGrammar:(BOOL)a13 ignoreTermination:(BOOL)a14 mutableResults:(id)a15
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v145 = *MEMORY[0x263EF8340];
  __int16 v127 = 8217;
  __int16 v126 = 0;
  uint64_t v73 = [NSString stringWithCharacters:&v127 length:1];
  uint64_t v74 = [NSString stringWithCharacters:&v126 length:1];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __222__AppleSpell_SentenceCorrection__spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults___block_invoke;
  block[3] = &unk_2640EF4B0;
  block[4] = self;
  if (spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__onceToken != -1) {
    dispatch_once(&spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__onceToken, block);
  }
  NSUInteger v75 = location + length;
  if (location < location + length)
  {
    unint64_t v18 = 0x263EFF000uLL;
    id v19 = a8;
    uint64_t v76 = *MEMORY[0x263F13FC0];
    do
    {
      uint64_t v121 = 0;
      int v122 = &v121;
      uint64_t v123 = 0x2020000000;
      char v124 = 0;
      uint64_t v115 = 0;
      int v116 = &v115;
      uint64_t v117 = 0x3010000000;
      v118 = &unk_20CC73CF2;
      uint64_t v119 = 0;
      uint64_t v120 = 0;
      uint64_t v111 = 0;
      unsigned int v112 = &v111;
      uint64_t v113 = 0x2020000000;
      uint64_t v114 = 0;
      uint64_t v20 = objc_msgSend(v19, "sentenceRangeForRange:", location, 0);
      long long v21 = v116;
      v116[4] = v20;
      v21[5] = 0;
      uint64_t v103 = MEMORY[0x263EF8330];
      uint64_t v104 = 3221225472;
      int v105 = __222__AppleSpell_SentenceCorrection__spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults___block_invoke_2;
      int v106 = &unk_2640EFCE0;
      id v107 = a4;
      int v108 = &v121;
      CFIndex v109 = &v115;
      uint64_t v110 = &v111;
      uint64_t v80 = v22;
      uint64_t v81 = v20;
      objc_msgSend(v19, "enumerateTagsInRange:unit:scheme:options:usingBlock:");
      if ((*((unsigned char *)v122 + 24) || a14)
        && (unint64_t)v112[3] <= 0x50
        && (unint64_t)(v116[5] - 1) <= 0xFF)
      {
        obuint64_t j = (id)[*(id *)(v18 + 2432) array];
        unsigned __int8 v83 = (void *)[*(id *)(v18 + 2432) array];
        long long v101 = xmmword_20CC61990;
        long long v102 = xmmword_20CC61990;
        UInt8 v91 = objc_msgSend(a4, "substringWithRange:", v116[4], v116[5]);
        [v91 rangeOfString:v74];
        if (v23) {
          UInt8 v91 = (void *)[v91 stringByReplacingOccurrencesOfString:v74 withString:@"_"];
        }
        [v91 rangeOfString:v73];
        if (v24) {
          UInt8 v91 = (void *)[v91 stringByReplacingOccurrencesOfString:v73 withString:@"'"];
        }
        [(AppleSpell *)self _checkSentence:v91 languageObject:a6 mutableCorrections:obj];
        [obj count];
        if (a12)
        {
          uint64_t v141 = 0;
          __int16 v142 = &v141;
          uint64_t v143 = 0x2020000000;
          uint64_t v144 = 6;
          v100[0] = MEMORY[0x263EF8330];
          v100[1] = 3221225472;
          v100[2] = __222__AppleSpell_SentenceCorrection__spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults___block_invoke_3;
          v100[3] = &unk_2640EFD08;
          v100[4] = &v115;
          v100[5] = &v141;
          objc_msgSend(a8, "enumerateTagsInRange:unit:scheme:options:usingBlock:", v81, v80, 0, v76, 6, v100);
          unint64_t v25 = v142[3];
          if (v25 >= 0xD)
          {
            v142[3] = 12;
            unint64_t v25 = 12;
          }
          if (v116[5] + v116[4] > v25
            && -[AppleSpell findMatchingRangesForRange:inString:keyEventArray:selectedRangeValue:matchingStringRange:correctableStringRange:matchingKeyEventRange:firstMisspelledKeyEventIndex:lastMisspelledKeyEventIndex:previousBackspaceCount:](self, "findMatchingRangesForRange:inString:keyEventArray:selectedRangeValue:matchingStringRange:correctableStringRange:matchingKeyEventRange:firstMisspelledKeyEventIndex:lastMisspelledKeyEventIndex:previousBackspaceCount:", &v101, 0, 0, 0, 0))
          {
            *(void *)&long long v102 = v102 + a9;
            *(void *)&long long v101 = v101 + a9;
          }
          _Block_object_dispose(&v141, 8);
        }
        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        uint64_t v93 = [obj countByEnumeratingWithState:&v96 objects:v136 count:16];
        if (v93)
        {
          uint64_t v92 = *(void *)v97;
          do
          {
            for (uint64_t i = 0; i != v93; ++i)
            {
              if (*(void *)v97 != v92) {
                objc_enumerationMutation(obj);
              }
              CFIndex v26 = *(void **)(*((void *)&v96 + 1) + 8 * i);
              uint64_t v94 = [v26 range];
              uint64_t v28 = v27;
              if (v27)
              {
                uint64_t v90 = v116[4];
                if (v94 + v27 <= (unint64_t)[v91 length])
                {
                  uint64_t v29 = objc_msgSend(v91, "substringWithRange:", v94, v28);
                  char v30 = (void *)[v26 corrections];
                  id v31 = [(AppleSpell *)self potentialSentenceCorrectionsForWord:v29 languageObject:a6];
                  if ([v26 presentAsSpellingError])
                  {
                    BOOL v32 = (void *)[MEMORY[0x263EFF9C0] set];
                    long long v134 = 0u;
                    long long v135 = 0u;
                    long long v132 = 0u;
                    long long v133 = 0u;
                    uint64_t v33 = [v30 countByEnumeratingWithState:&v132 objects:&v141 count:16];
                    uint64_t v34 = v28;
                    unint64_t v35 = v26;
                    if (v33)
                    {
                      uint64_t v36 = *(void *)v133;
                      do
                      {
                        for (uint64_t j = 0; j != v33; ++j)
                        {
                          if (*(void *)v133 != v36) {
                            objc_enumerationMutation(v30);
                          }
                          objc_msgSend(v32, "addObject:", objc_msgSend(*(id *)(*((void *)&v132 + 1) + 8 * j), "lowercaseString"));
                        }
                        uint64_t v33 = [v30 countByEnumeratingWithState:&v132 objects:&v141 count:16];
                      }
                      while (v33);
                    }
                    long long v130 = 0u;
                    long long v131 = 0u;
                    long long v128 = 0u;
                    long long v129 = 0u;
                    uint64_t v38 = [v31 countByEnumeratingWithState:&v128 objects:&v137 count:16];
                    CFIndex v26 = v35;
                    if (v38)
                    {
                      uint64_t v39 = *(void *)v129;
                      while (2)
                      {
                        for (uint64_t k = 0; k != v38; ++k)
                        {
                          if (*(void *)v129 != v39) {
                            objc_enumerationMutation(v31);
                          }
                          if (objc_msgSend(v32, "containsObject:", objc_msgSend(*(id *)(*((void *)&v128 + 1) + 8 * k), "lowercaseString")))
                          {
                            CFIndex v26 = v35;
                            uint64_t v28 = v34;
                            BOOL v89 = [a3 isWordInUserDictionaries:v29 caseSensitive:0] == 0;
                            goto LABEL_46;
                          }
                        }
                        uint64_t v38 = [v31 countByEnumeratingWithState:&v128 objects:&v137 count:16];
                        CFIndex v26 = v35;
                        if (v38) {
                          continue;
                        }
                        break;
                      }
                    }
                    BOOL v89 = 0;
                    uint64_t v28 = v34;
                  }
                  else
                  {
                    BOOL v89 = 0;
                  }
LABEL_46:
                  if (a12) {
                    int v87 = [v26 presentAsAutocorrection];
                  }
                  else {
                    int v87 = 0;
                  }
                  int v88 = v29;
                  if (v29)
                  {
                    if ([v29 length])
                    {
                      uint64_t v41 = [v29 rangeOfComposedCharacterSequenceAtIndex:0];
                      uint64_t v43 = v42;
                      if (v42)
                      {
                        uint64_t v44 = v41;
                        objc_msgSend(v29, "rangeOfCharacterFromSet:options:range:", objc_msgSend(MEMORY[0x263F08708], "letterCharacterSet"), 0, v41, v42);
                        if (v45)
                        {
                          id v46 = objc_msgSend(v29, "substringWithRange:", v44, v43);
                          if (objc_msgSend(v46, "isEqualToString:", objc_msgSend(v46, "capitalizedStringWithLocale:", a7)))
                          {
                            int v47 = (void *)[MEMORY[0x263EFF980] array];
                            long long v140 = 0u;
                            long long v139 = 0u;
                            long long v137 = 0u;
                            long long v138 = 0u;
                            uint64_t v48 = [v30 countByEnumeratingWithState:&v137 objects:&v141 count:16];
                            if (v48)
                            {
                              uint64_t v78 = v28;
                              unint64_t v79 = v26;
                              uint64_t v49 = *(void *)v138;
                              do
                              {
                                for (uint64_t m = 0; m != v48; ++m)
                                {
                                  if (*(void *)v138 != v49) {
                                    objc_enumerationMutation(v30);
                                  }
                                  CFRange v51 = *(void **)(*((void *)&v137 + 1) + 8 * m);
                                  if ([v51 length]
                                    && objc_msgSend(v51, "isEqualToString:", objc_msgSend(v51, "lowercaseStringWithLocale:", a7)))
                                  {
                                    uint64_t v52 = [v51 rangeOfComposedCharacterSequenceAtIndex:0];
                                    uint64_t v54 = v53;
                                    if (v53
                                      && (uint64_t v55 = v52,
                                          uint64_t v56 = v52 + v53,
                                          v52 + v53 < (unint64_t)[v51 length]))
                                    {
                                      uint64_t v57 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v51, "substringWithRange:", v55, v54), "capitalizedStringWithLocale:", a7), "stringByAppendingString:", objc_msgSend(v51, "substringFromIndex:", v56));
                                    }
                                    else
                                    {
                                      uint64_t v57 = [v51 capitalizedStringWithLocale:a7];
                                    }
                                    CFRange v51 = (void *)v57;
                                  }
                                  [v47 addObject:v51];
                                }
                                uint64_t v48 = [v30 countByEnumeratingWithState:&v137 objects:&v141 count:16];
                              }
                              while (v48);
                              char v30 = v47;
                              uint64_t v28 = v78;
                              CFIndex v26 = v79;
                            }
                            else
                            {
                              char v30 = v47;
                            }
                          }
                        }
                      }
                    }
                  }
                  uint64_t v58 = v94 + a9 + v90;
                  BOOL v59 = v89;
                  if (spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__disableSpellingErrors) {
                    BOOL v59 = 0;
                  }
                  if (v59)
                  {
                    int v60 = objc_msgSend(objc_alloc(MEMORY[0x263F08B38]), "initWithRange:", v58, v28);
                    [a15 addObject:v60];
                  }
                  int v61 = v87;
                  if (spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__disableAutocorrections) {
                    int v61 = 0;
                  }
                  unint64_t v18 = 0x263EFF000;
                  if (v61 == 1)
                  {
                    __int16 v62 = objc_msgSend(objc_alloc(MEMORY[0x263F08758]), "initWithRange:replacementString:", v58, v28, objc_msgSend(v30, "firstObject"));
                    [a15 addObject:v62];
                  }
                  if (v89 || a13 && [v26 presentAsGrammarError])
                  {
                    __int16 v63 = (void *)MEMORY[0x263F08D40];
                    uint64_t v64 = [v26 range];
                    uint64_t v66 = objc_msgSend(v63, "valueWithRange:", v64, v65);
                    unsigned int v67 = [v26 category];
                    if (v67 > 5) {
                      uint64_t v68 = 0;
                    }
                    else {
                      uint64_t v68 = qword_20CC64E20[v67];
                    }
                    if ([v26 category] == 3)
                    {
                      uint64_t v69 = [NSString stringWithFormat:@"Consider adding an article before the word ‘%@’.", v88];
                      char v30 = 0;
                    }
                    else
                    {
                      if ([v30 count] == 1)
                      {
                        uint64_t v70 = [NSString stringWithFormat:@"Consider ‘%@’ instead", objc_msgSend(v30, "firstObject")];
                      }
                      else if ([v30 count] == 2)
                      {
                        uint64_t v70 = [NSString stringWithFormat:@"Consider ‘%@’ or ‘%@’ instead", objc_msgSend(v30, "firstObject"), objc_msgSend(v30, "lastObject")];
                      }
                      else
                      {
                        uint64_t v70 = [NSString stringWithFormat:@"The word ‘%@’ may not agree with the rest of the sentence.", v88];
                      }
                      uint64_t v69 = v70;
                    }
                    objc_msgSend(v83, "addObject:", objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v66, @"NSGrammarRange", v69, @"NSGrammarUserDescription", v30, @"NSGrammarCorrections", &unk_26C1D3590, @"NSGrammarConfidenceScore", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v68), @"NSGrammarIssueType", 0));
                  }
                }
              }
            }
            uint64_t v93 = [obj countByEnumeratingWithState:&v96 objects:v136 count:16];
          }
          while (v93);
        }
        if ([v83 count])
        {
          id v71 = objc_alloc(MEMORY[0x263F08880]);
          CFIndex v72 = objc_msgSend(v71, "initWithRange:details:", v116[4] + a9, v116[5], v83);
          [a15 addObject:v72];
        }
      }
      _Block_object_dispose(&v111, 8);
      _Block_object_dispose(&v115, 8);
      _Block_object_dispose(&v121, 8);
      NSUInteger location = v81 + v80;
      id v19 = a8;
    }
    while (v81 + v80 < v75);
  }
}

id __222__AppleSpell_SentenceCorrection__spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults___block_invoke(uint64_t a1)
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"NSSpellCheckerSentenceCorrectionDisableSpellingErrors"))
  {
    spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__disableSpellingErrors = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"NSSpellCheckerSentenceCorrectionDisableSpellingErrors");
  }
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"NSSpellCheckerSentenceCorrectionDisableAutocorrections");
  if (v2) {
    LOBYTE(v2) = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"NSSpellCheckerSentenceCorrectionDisableAutocorrections");
  }
  spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__disableAutocorrections = v2;
  spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__sentenceTerminatorCharacterSet = (uint64_t)(id)[*(id *)(a1 + 32) sentenceTerminatorCharacterSet];
  id result = (id)[(id)spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__sentenceTerminatorCharacterSet invertedSet];
  spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__nonSentenceTerminatorCharacterSet = (uint64_t)result;
  return result;
}

uint64_t __222__AppleSpell_SentenceCorrection__spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = result;
  if (*MEMORY[0x263F13F90] == a2 && a4 != 0)
  {
    id result = objc_msgSend(*(id *)(result + 32), "rangeOfCharacterFromSet:options:range:", spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__sentenceTerminatorCharacterSet, 0, a3, a4);
    if (v8)
    {
      id result = objc_msgSend(*(id *)(v6 + 32), "rangeOfCharacterFromSet:options:range:", spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults__nonSentenceTerminatorCharacterSet, 0, a3, a4);
      if (!v9)
      {
        id v10 = objc_msgSend(*(id *)(v6 + 32), "substringWithRange:", a3, a4);
        id result = [v10 isEqualToString:@".."];
        if ((result & 1) == 0)
        {
          id result = [v10 isEqualToString:@"..."];
          if ((result & 1) == 0) {
            *(unsigned char *)(*(void *)(*(void *)(v6 + 40) + 8) + 24) = 1;
          }
        }
      }
    }
  }
  uint64_t v11 = *(void *)(*(void *)(v6 + 48) + 8);
  uint64_t v12 = *(void *)(v11 + 32);
  if (a3 + a4 > (unint64_t)(*(void *)(v11 + 40) + v12)) {
    *(void *)(v11 + 40) = a3 + a4 - v12;
  }
  ++*(void *)(*(void *)(*(void *)(v6 + 56) + 8) + 24);
  return result;
}

uint64_t __222__AppleSpell_SentenceCorrection__spellServer_checkSentenceCorrectionInString_rangeInParagraph_languageObject_locale_tagger_offset_keyEventArray_selectedRangeValue_autocorrect_checkGrammar_ignoreTermination_mutableResults___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40)
     + *(void *)(*(void *)(*(void *)(result + 32) + 8) + 32);
  if (a3 + 6 < v3) {
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v3 - a3;
  }
  return result;
}

- (BOOL)supportSentenceCorrectionForLanguageObject:(id)a3 appIdentifier:(id)a4
{
  if (supportSentenceCorrectionForLanguageObject_appIdentifier__onceToken != -1) {
    dispatch_once(&supportSentenceCorrectionForLanguageObject_appIdentifier__onceToken, &__block_literal_global_125);
  }
  if (supportSentenceCorrectionForLanguageObject_appIdentifier__sentenceCorrectionDisabled) {
    return 0;
  }
  if ([a3 isEnglish]) {
    return 1;
  }
  return [a3 isSpanish];
}

uint64_t __91__AppleSpell_SentenceCorrection__supportSentenceCorrectionForLanguageObject_appIdentifier___block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"NSSpellCheckerSentenceCorrectionDisabled");
  if (result)
  {
    uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"NSSpellCheckerSentenceCorrectionDisabled");
    supportSentenceCorrectionForLanguageObject_appIdentifier__sentenceCorrectionDisabled = result;
  }
  return result;
}

- (void)spellServer:(id)a3 checkSentenceCorrectionInString:(id)a4 range:(_NSRange)a5 languageObject:(id)a6 offset:(unint64_t)a7 keyEventArray:(id)a8 selectedRangeValue:(id)a9 autocorrect:(BOOL)a10 checkGrammar:(BOOL)a11 ignoreTermination:(BOOL)a12 mutableResults:(id)a13
{
  unint64_t v33 = 0;
  NSUInteger v35 = 0;
  NSUInteger location = a5.location;
  if (a6)
  {
    NSUInteger length = a5.length;
    NSUInteger v16 = a5.location;
    uint64_t v19 = objc_msgSend(MEMORY[0x263EFF960], "localeWithLocaleIdentifier:", objc_msgSend(a6, "identifier"));
    id v20 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", a6, a4, v16, length);
    id v21 = v20;
    if (v19) {
      BOOL v22 = v20 == 0;
    }
    else {
      BOOL v22 = 1;
    }
    NSUInteger v23 = v16 + length;
    if (!v22 && v16 < v23)
    {
      NSUInteger v25 = v16;
      do
      {
        objc_msgSend(a4, "getParagraphStart:end:contentsEnd:forRange:", &v35, &location, &v33, v25, 0);
        if (v35 < v23 && v33 > v35 && v33 > v16)
        {
          NSUInteger v28 = v33 - v35;
          if (v35 >= v16)
          {
            NSUInteger v29 = v35;
          }
          else
          {
            NSUInteger v28 = v33 - v16;
            NSUInteger v29 = v16;
          }
          if (v33 <= v23) {
            NSUInteger v30 = v28;
          }
          else {
            NSUInteger v30 = v23 - v29;
          }
          if (v30)
          {
            BYTE2(v31) = a12;
            LOWORD(v31) = __PAIR16__(a11, a10);
            -[AppleSpell spellServer:checkSentenceCorrectionInString:rangeInParagraph:languageObject:locale:tagger:offset:keyEventArray:selectedRangeValue:autocorrect:checkGrammar:ignoreTermination:mutableResults:](self, "spellServer:checkSentenceCorrectionInString:rangeInParagraph:languageObject:locale:tagger:offset:keyEventArray:selectedRangeValue:autocorrect:checkGrammar:ignoreTermination:mutableResults:", a3, a4, v29, v30, a6, v19, v21, a7, a8, a9, v31, a13);
          }
        }
        NSUInteger v25 = location;
      }
      while (location < v23);
    }
  }
  else
  {
    id v21 = 0;
  }
  [(AppleSpell *)self invalidateTagger:v21];
}

- (id)potentialSentenceCorrectionsForWord:(id)a3 languageObject:(id)a4
{
  if ([a4 isEnglish])
  {
    blocuint64_t k = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    NSUInteger v16 = __85__AppleSpell_SentenceCorrection__potentialSentenceCorrectionsForWord_languageObject___block_invoke;
    uint64_t v17 = &unk_2640EF4B0;
    unint64_t v18 = self;
    if (potentialSentenceCorrectionsForWord_languageObject__onceToken != -1) {
      dispatch_once(&potentialSentenceCorrectionsForWord_languageObject__onceToken, &block);
    }
    id v7 = &potentialSentenceCorrectionsForWord_languageObject__potentialCorrectionsDictionary;
    return (id)objc_msgSend((id)objc_msgSend((id)*v7, "objectForKey:", objc_msgSend(a3, "lowercaseString", v9, v10, v11, v12, v13, block, v15, v16, v17, v18)), "componentsSeparatedByString:", @"/");
  }
  if ([a4 isSpanish])
  {
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __85__AppleSpell_SentenceCorrection__potentialSentenceCorrectionsForWord_languageObject___block_invoke_2;
    uint64_t v12 = &unk_2640EF4B0;
    int v13 = self;
    if (potentialSentenceCorrectionsForWord_languageObject__onceToken_131 != -1) {
      dispatch_once(&potentialSentenceCorrectionsForWord_languageObject__onceToken_131, &v9);
    }
    id v7 = &potentialSentenceCorrectionsForWord_languageObject__potentialCorrectionsDictionary_130;
    return (id)objc_msgSend((id)objc_msgSend((id)*v7, "objectForKey:", objc_msgSend(a3, "lowercaseString", v9, v10, v11, v12, v13, block, v15, v16, v17, v18)), "componentsSeparatedByString:", @"/");
  }
  return 0;
}

id __85__AppleSpell_SentenceCorrection__potentialSentenceCorrectionsForWord_languageObject___block_invoke(uint64_t a1)
{
  id result = (id)objc_msgSend(*(id *)(a1 + 32), "sentenceCorrectionsDictionaryForLanguageObject:", +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", @"en"));
  potentialSentenceCorrectionsForWord_languageObject__potentialCorrectionsDictionary = (uint64_t)result;
  return result;
}

id __85__AppleSpell_SentenceCorrection__potentialSentenceCorrectionsForWord_languageObject___block_invoke_2(uint64_t a1)
{
  id result = (id)objc_msgSend(*(id *)(a1 + 32), "sentenceCorrectionsDictionaryForLanguageObject:", +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", @"es"));
  potentialSentenceCorrectionsForWord_languageObject__potentialCorrectionsDictionary_130 = (uint64_t)result;
  return result;
}

- (unint64_t)numberOfTurkishSuffixPointsInBuffer:(char *)a3 length:(unint64_t)a4 maxSuffixPoints:(unint64_t)a5 suffixPoints:(id *)a6
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __95__AppleSpell_Turkish__numberOfTurkishSuffixPointsInBuffer_length_maxSuffixPoints_suffixPoints___block_invoke;
  v10[3] = &unk_2640F01D8;
  v10[4] = &v11;
  v10[5] = a5;
  v10[6] = a6;
  +[PRTurkishSuffix enumerateSuffixMatchesForBuffer:a3 length:a4 options:2 usingBlock:v10];
  size_t v7 = v12[3];
  if (v7)
  {
    qsort_b(a6, v7, 0x10uLL, &__block_literal_global_6);
    unint64_t v8 = v12[3];
  }
  else
  {
    unint64_t v8 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v8;
}

void *__95__AppleSpell_Turkish__numberOfTurkishSuffixPointsInBuffer_length_maxSuffixPoints_suffixPoints___block_invoke(void *result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  if (a2 >= 2 && a6 - 1 <= 0xB)
  {
    unint64_t v6 = *(void *)(*(void *)(result[4] + 8) + 24);
    if (v6 < result[5])
    {
      int v7 = a6 > 4;
      if (a6 == 12) {
        int v7 = 2;
      }
      uint64_t v8 = result[6];
      if (v6)
      {
        uint64_t v9 = 0;
        uint64_t v10 = *(void *)(*(void *)(result[4] + 8) + 24);
        while (*(void *)(v8 + v9) != a2 || *(_DWORD *)(v8 + v9 + 8) != v7)
        {
          uint64_t v8 = result[6];
          v9 += 16;
          if (!--v10) {
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:
        *(void *)(v8 + 16 * v6) = a2;
        *(_DWORD *)(v8 + 16 * (*(void *)(*(void *)(result[4] + 8) + 24))++ + 8) = v7;
      }
    }
  }
  return result;
}

uint64_t __95__AppleSpell_Turkish__numberOfTurkishSuffixPointsInBuffer_length_maxSuffixPoints_suffixPoints___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)a2 < *(void *)a3) {
    return 0xFFFFFFFFLL;
  }
  if (*(void *)a2 > *(void *)a3) {
    return 1;
  }
  unsigned int v4 = *(_DWORD *)(a2 + 8);
  unsigned int v5 = *(_DWORD *)(a3 + 8);
  BOOL v6 = v4 >= v5;
  BOOL v7 = v4 > v5;
  if (v6) {
    return v7;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

- (BOOL)testTurkishSuffixationPattern:(id)a3
{
  __base[36] = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26C1C71A8];
  unsigned int v5 = (void *)[MEMORY[0x263F089D8] stringWithString:v4];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  unint64_t v6 = [a3 length];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = objc_msgSend(a3, "rangeOfString:options:range:", @"-", 0, v8, v6 - v8);
      if (!v11) {
        break;
      }
      if (v9 > 0x23) {
        break;
      }
      v27[v9++] = v10 + v7;
      uint64_t v8 = v10 + v11;
      --v7;
    }
    while (v10 + v11 < v6);
  }
  else
  {
    unint64_t v9 = 0;
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __53__AppleSpell_Turkish__testTurkishSuffixationPattern___block_invoke;
  v22[3] = &unk_2640F0220;
  v22[4] = &v23;
  v22[5] = __base;
  +[PRTurkishSuffix enumerateSuffixMatchesForWord:v4 options:2 usingBlock:v22];
  size_t v12 = v24[3];
  if (v12)
  {
    qsort_b(__base, v12, 8uLL, &__block_literal_global_1670);
    unint64_t v13 = v24[3];
    if (v13)
    {
      unint64_t v14 = 0;
      uint64_t v15 = -1;
      do
      {
        objc_msgSend(v5, "replaceCharactersInRange:withString:", __base[v13 + v15], 0, @"-");
        ++v14;
        unint64_t v13 = v24[3];
        --v15;
      }
      while (v14 < v13);
    }
    if (!v9) {
      goto LABEL_20;
    }
  }
  else
  {
    unint64_t v13 = 0;
    if (!v9) {
      goto LABEL_20;
    }
  }
  uint64_t v16 = 0;
  while (2)
  {
    uint64_t v17 = __base;
    unint64_t v18 = v13;
    do
    {
      if (!v18)
      {
        BOOL v20 = 0;
        goto LABEL_22;
      }
      uint64_t v19 = *v17++;
      --v18;
    }
    while (v19 != v27[v16]);
    if (++v16 < v9) {
      continue;
    }
    break;
  }
LABEL_20:
  BOOL v20 = 1;
LABEL_22:
  _Block_object_dispose(&v23, 8);
  return v20;
}

uint64_t __53__AppleSpell_Turkish__testTurkishSuffixationPattern___block_invoke(uint64_t result, unint64_t a2)
{
  if (a2 >= 2)
  {
    uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
    unint64_t v3 = *(void *)(v2 + 24);
    if (v3 <= 0x23)
    {
      uint64_t v4 = *(uint64_t **)(result + 40);
      unsigned int v5 = v4;
      for (uint64_t i = *(void *)(v2 + 24); i; --i)
      {
        uint64_t v7 = *v5++;
        if (v7 == a2) {
          return result;
        }
      }
      *(void *)(v2 + 24) = v3 + 1;
      v4[v3] = a2;
    }
  }
  return result;
}

uint64_t __53__AppleSpell_Turkish__testTurkishSuffixationPattern___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (*a2 < *a3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a2 > *a3;
  }
}

- (unint64_t)acceptabilityOfWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 forPrediction:(BOOL)a6 alreadyCapitalized:(BOOL)a7 depth:(unint64_t)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v48 = 0;
  int v47 = 0;
  CFStringEncoding v15 = [a5 encoding];
  unint64_t v16 = a4 - 2;
  if (a4 < 2) {
    return 2;
  }
  CFStringEncoding v18 = v15;
  if ([(AppleSpell *)self checkWordBuffer:a3 length:a4 languageObject:a5 index:8])
  {
    if (a4 == 4)
    {
      uint64_t v19 = "sean";
      BOOL v20 = a3;
      size_t v21 = 4;
    }
    else
    {
      if (a4 != 2) {
        return 0;
      }
      if (!strncasecmp_l(a3, "sa", 2uLL, 0)) {
        goto LABEL_16;
      }
      uint64_t v19 = "se";
      BOOL v20 = a3;
      size_t v21 = 2;
    }
    unint64_t v17 = 0;
    if (strncasecmp_l(v20, v19, v21, 0)) {
      return v17;
    }
LABEL_16:
    if (([a5 isIrishGaelic] & 1) == 0) {
      return 0;
    }
LABEL_17:
    if (a4 < 4) {
      goto LABEL_29;
    }
    goto LABEL_18;
  }
  if (a4 < 6 || v18 != 517) {
    goto LABEL_17;
  }
  if (a3[a4 - 1] == 235 && a3[a4 - 2] == 230 && a3[a4 - 3] == 236) {
    return 0;
  }
LABEL_18:
  BOOL v22 = v10;
  BOOL v23 = v9;
  unint64_t v24 = a8;
  unint64_t v25 = 5;
  do
  {
    int v26 = strncasecmp_l(&a3[v25 - 5], "porn", 4uLL, 0);
    BOOL v27 = v26 == 0;
    if (!v26) {
      break;
    }
    BOOL v40 = v25++ > a4;
  }
  while (!v40);
  if (v26 && a4 >= 6)
  {
    unint64_t v28 = 7;
    do
    {
      int v29 = strncasecmp_l(&a3[v28 - 7], "hitler", 6uLL, 0);
      BOOL v27 = v29 == 0;
      if (!v29) {
        break;
      }
      BOOL v40 = v28++ > a4;
    }
    while (!v40);
  }
  a8 = v24;
  BOOL v9 = v23;
  BOOL v10 = v22;
  unint64_t v16 = a4 - 2;
  if (v27) {
    return 0;
  }
LABEL_29:
  NSUInteger v30 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, a4, v18, 0);
  if (v30
    && [(AppleSpell *)self getMetaFlagsForWord:v30 inLexiconForLanguageObject:a5 metaFlags:(char *)&v48 + 4 otherMetaFlags:&v48])
  {
    unsigned int v31 = HIDWORD(v48);
    if (v9)
    {
      if ((v48 & 0x200000000) == 0)
      {
        int v32 = 0;
LABEL_37:
        int v46 = 1;
        goto LABEL_38;
      }
      unsigned int v31 = v48;
    }
    int v32 = (v31 >> 1) & 1;
    goto LABEL_37;
  }
  int v46 = 0;
  int v32 = 0;
LABEL_38:
  if ([a5 isEnglish]
    && (unint64_t)[(__CFString *)v30 length] >= 4
    && [(__CFString *)v30 hasSuffix:@"'s"]
    && [(AppleSpell *)self getMetaFlagsForWord:[(__CFString *)v30 substringToIndex:[(__CFString *)v30 length] - 2] inLexiconForLanguageObject:a5 metaFlags:&v47 otherMetaFlags:0])
  {
    v32 &= v47 >> 1;
  }
  if ([a5 isEnglish] && -[__CFString length](v30, "length") == 2)
  {
    if ((v32 & ~[(__CFString *)v30 isEqual:@"ve"] & 1) == 0) {
      goto LABEL_46;
    }
    return 0;
  }
  if (v32) {
    return 0;
  }
LABEL_46:
  if (v10)
  {
    if (v46)
    {
      if (v9)
      {
        BOOL v33 = (v48 & 4) == 0 || (v48 & 0x400000000) == 0;
        BOOL v34 = (v48 & 0x80) == 0 || (v48 & 0x8000000000) == 0;
        LODWORD(v35) = 1;
        if (v34 && v33)
        {
          if (v9) {
            goto LABEL_59;
          }
          goto LABEL_92;
        }
LABEL_93:
        if (v30)
        {
          if (v35)
          {
            uint64_t v35 = [(__CFString *)v30 compare:@"covid" options:1];
            if (v35)
            {
              unint64_t v17 = 1;
              uint64_t v35 = [(__CFString *)v30 compare:@"covid-19" options:1];
              if (v35) {
                return v17;
              }
            }
          }
        }
        goto LABEL_60;
      }
      if ((v48 & 0x8400000000) != 0)
      {
        LODWORD(v35) = 1;
        goto LABEL_93;
      }
    }
LABEL_92:
    LODWORD(v35) = [(AppleSpell *)self checkNameWordBuffer:a3 length:a4 languageObject:a5 globalOnly:0];
    goto LABEL_93;
  }
LABEL_59:
  LOBYTE(v35) = 0;
LABEL_60:
  if ((v35 & 1) != 0 || ((v46 ^ 1) & 1) != 0 || (v48 & 0x8000000000) == 0)
  {
    if (v35) {
      return 1;
    }
  }
  else if ([a5 isKorean])
  {
    return 1;
  }
  if (a8 > 3) {
    return 2;
  }
  unint64_t v37 = 0;
  unint64_t v17 = 2;
  while (1)
  {
    int v38 = a3[v37];
    if ((v38 - 32) <= 0x3F && ((1 << (v38 - 32)) & 0x800000000400E001) != 0) {
      break;
    }
    BOOL v40 = v16 != v37 && v37 > 1;
    BOOL v41 = !v40 || a4 - 1 == v37;
    if (v41 && v38 == 39) {
      break;
    }
    if (++v37 >= a4) {
      return v17;
    }
  }
  uint64_t v42 = &a3[v37];
  unint64_t v43 = a8 + 1;
  unint64_t v44 = [(AppleSpell *)self acceptabilityOfWordBuffer:a3 length:v37 languageObject:a5 forPrediction:v10 alreadyCapitalized:v9 depth:v43];
  unint64_t v45 = [(AppleSpell *)self acceptabilityOfWordBuffer:v42 + 1 length:~v37 + a4 languageObject:a5 forPrediction:v10 alreadyCapitalized:v9 depth:v43];
  if (v44 >= v45) {
    return v45;
  }
  else {
    return v44;
  }
}

- (unint64_t)acceptabilityOfWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 forPrediction:(BOOL)a6 alreadyCapitalized:(BOOL)a7
{
  return [(AppleSpell *)self acceptabilityOfWordBuffer:a3 length:a4 languageObject:a5 forPrediction:a6 alreadyCapitalized:a7 depth:0];
}

- (BOOL)checkNegativeWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 alreadyCapitalized:(BOOL)a6
{
  return [(AppleSpell *)self acceptabilityOfWordBuffer:a3 length:a4 languageObject:a5 forPrediction:0 alreadyCapitalized:a6 depth:0] == 0;
}

- (BOOL)checkNegativeWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5
{
  return [(AppleSpell *)self checkNegativeWordBuffer:a3 length:a4 languageObject:a5 alreadyCapitalized:0];
}

- (BOOL)checkNoCapAbbreviationWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5
{
  CFStringEncoding v9 = [a5 encoding];
  if (a4 < 3) {
    goto LABEL_16;
  }
  unint64_t v10 = a4 - 1;
  if (a3[v10] != 46) {
    goto LABEL_16;
  }
  CFStringEncoding v11 = v9;
  unint64_t v12 = 0;
  do
    int v13 = a3[v12++];
  while (v13 != 46 && v12 < v10);
  if (v13 == 46
    || [(AppleSpell *)self checkWordBuffer:a3 length:v10 languageObject:a5 index:10])
  {
LABEL_11:
    LOBYTE(v15) = 1;
    return (char)v15;
  }
  CFStringRef v15 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v10, v11, 0);
  if (!v15) {
    return (char)v15;
  }
  unint64_t v16 = (__CFString *)v15;
  if (![(AppleSpell *)self validateNoCapAbbreviation:v15 inLexiconForLanguageObject:a5])
  {
    if (([(__CFString *)v16 hasSuffix:@"."] & 1) == 0)
    {
      LODWORD(v15) = [(AppleSpell *)self validateNoCapAbbreviation:[(__CFString *)v16 stringByAppendingString:@"."] inLexiconForLanguageObject:a5];
      goto LABEL_19;
    }
LABEL_16:
    LOBYTE(v15) = 0;
    return (char)v15;
  }
  LODWORD(v15) = 1;
LABEL_19:
  if (v10 == 2 && v15 && v11 == 1280)
  {
    if (*a3 == 78)
    {
      LOBYTE(v15) = a3[1] != 111;
      return (char)v15;
    }
    goto LABEL_11;
  }
  return (char)v15;
}

- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 connection:(_PR_DB_IO *)a5
{
  BOOL v5 = 0;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a5 && a4 - 1 <= 0x3E)
  {
    char v8 = a3[a4];
    a3[a4] = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v22 = 0;
    memset(v10, 0, sizeof(v10));
    long long v11 = 0u;
    HIDWORD(v11) = 0;
    int v12 = 0;
    int v13 = a3;
    *(void *)&long long v20 = v10;
    BYTE7(v21) = 1;
    *(_WORD *)((char *)&v21 + 9) = *(_WORD *)&a5->var0;
    BOOL v5 = PRword((uint64_t)&v13, 3, 0) == 0;
    PRword((uint64_t)&v13, 17, 0);
    a3[a4] = v8;
  }
  return v5;
}

- (BOOL)validateWordPrefixBuffer:(char *)a3 length:(unint64_t)a4 connection:(_PR_DB_IO *)a5
{
  BOOL v5 = 0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a5 && a4 - 1 <= 0x16)
  {
    char v8 = a3[a4];
    char v9 = a3[a4 + 1];
    *(_WORD *)&a3[a4] = 42;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v23 = 0;
    memset(v11, 0, sizeof(v11));
    long long v12 = 0u;
    HIDWORD(v12) = 0;
    int v13 = 0;
    long long v14 = a3;
    *(void *)&long long v21 = v11;
    BYTE7(v22) = 1;
    *(_WORD *)((char *)&v22 + 9) = *(_WORD *)&a5->var0;
    BOOL v5 = 0;
    if (!PRword((uint64_t)&v14, 5, 0)) {
      BOOL v5 = (void)v15 && *(void *)(v15 + 8) && *(void *)v15 && *(_WORD *)(v15 + 18) != 0;
    }
    PRword((uint64_t)&v14, 17, 0);
    a3[a4] = v8;
    a3[a4 + 1] = v9;
  }
  return v5;
}

- (BOOL)validateAbbreviationOrNumberWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7
{
  int v10 = [a5 encoding];
  BOOL v11 = a4 < 7 || a6 == 0;
  int v12 = v11;
  if (v11 && (v10 & 0xFFFFFFFB) == 0x500)
  {
    char v13 = 1;
    if (!a4) {
      return v13 & 1;
    }
    uint64_t v14 = 0;
    int v15 = 1;
    int v16 = 1;
    int v17 = 1;
    do
    {
      unsigned int v18 = a3[v14];
      unsigned int v19 = v18 - 216;
      if (v18 - 192 < 0x17
        || (v18 <= 0xF7 ? (BOOL v20 = v19 >= 0x1F) : (BOOL v20 = 0),
            v20 ? (BOOL v21 = (v18 & 0xFFFFFFDF) - 65 >= 0x1A) : (BOOL v21 = 0),
            !v21 || (v18 - 138 <= 0x15 ? (BOOL v22 = ((1 << (v18 + 118)) & 0x350015) == 0) : (BOOL v22 = 1), !v22)))
      {
        BOOL v23 = v18 - 65 >= 0x1A && v18 - 192 >= 0x17;
        if (v23 && v19 >= 7)
        {
          BOOL v25 = a4 != 3 || v14 != 2;
          int v26 = v17 & v16 & v25;
          BOOL v27 = v18 - 138 > 0x15 || ((1 << (v18 + 118)) & 0x200015) == 0;
          if (v27) {
            int v17 = 0;
          }
          if (v27) {
            int v16 = v26;
          }
        }
      }
      int v28 = (v18 == 46) & v15;
      if (v14) {
        int v15 = v28;
      }
      ++v14;
    }
    while (a4 != v14);
    if ((v16 | v15)) {
      goto LABEL_121;
    }
  }
  int v29 = v10 == 514 ? v12 : 0;
  if (v29 == 1)
  {
    char v13 = 1;
    if (!a4) {
      return v13 & 1;
    }
    uint64_t v30 = 0;
    int v31 = 1;
    int v32 = 1;
    int v33 = 1;
    do
    {
      unsigned int v34 = a3[v30];
      if (v34 - 192 < 0x17
        || (v34 <= 0xF7 ? (BOOL v35 = v34 - 216 >= 0x1F) : (BOOL v35 = 0),
            v35 ? (BOOL v36 = (v34 & 0xFFFFFFDF) - 65 >= 0x1A) : (BOOL v36 = 0),
            !v36 || (v34 - 161 <= 0x1E ? (BOOL v37 = ((1 << (v34 + 95)) & 0x6F356F35) == 0) : (BOOL v37 = 1), !v37)))
      {
        if (v34 - 65 >= 0x1A
          && v34 - 192 >= 0x17
          && (v34 - 161 > 0x3D || ((1 << (v34 + 95)) & 0x3F80000000006F35) == 0))
        {
          BOOL v42 = a4 != 3 || v30 != 2;
          v32 &= v33 & v42;
          int v33 = 0;
        }
      }
      int v40 = (v34 == 46) & v31;
      if (v30) {
        int v31 = v40;
      }
      ++v30;
    }
    while (a4 != v30);
    if ((v32 | v31)) {
      goto LABEL_121;
    }
  }
  int v43 = v10 == 517 ? v12 : 0;
  if (v43 != 1) {
    goto LABEL_129;
  }
  if (!a4) {
    goto LABEL_127;
  }
  uint64_t v44 = 0;
  int v45 = 1;
  int v46 = 1;
  int v47 = 1;
  do
  {
    int v48 = a3[v44];
    unsigned int v49 = v48 - 174;
    if ((v48 - 161) < 0xC
      || (v49 >= 0x42 ? (BOOL v50 = (v48 & 0xFFFFFFDF) - 65 >= 0x1A) : (BOOL v50 = 0),
          !v50 || (v48 - 241) < 0xC || (v48 & 0xFE) == 0xFE))
    {
      if ((v48 - 161) >= 0xC && (v48 - 65) >= 0x1A)
      {
        BOOL v52 = a4 == 3 && v44 == 2;
        BOOL v53 = !v52;
        int v54 = v47 & v46 & v53;
        if (v49 >= 0x22)
        {
          int v47 = 0;
          int v46 = v54;
        }
      }
    }
    int v55 = (v48 == 46) & v45;
    if (v44) {
      int v45 = v55;
    }
    ++v44;
  }
  while (a4 != v44);
  if ((v46 | v45))
  {
LABEL_121:
    char v13 = 1;
  }
  else
  {
LABEL_129:
    if (v10 != 134217984) {
      int v12 = 0;
    }
    if (v12 == 1)
    {
      if (a4)
      {
        uint64_t v57 = 0;
        int v58 = 1;
        int v59 = 1;
        int v60 = 1;
        do
        {
          int v61 = a3[v57];
          unsigned int v62 = v61 - 97;
          BOOL v63 = (v61 - 65) >= 0x1A && (v61 - 48) >= 0xA;
          if (v63) {
            int v64 = 0;
          }
          else {
            int v64 = v60;
          }
          if (v63) {
            int v65 = 0;
          }
          else {
            int v65 = v59;
          }
          if (v63) {
            int v66 = 0;
          }
          else {
            int v66 = v58;
          }
          BOOL v68 = a4 != 3 || v57 != 2;
          v59 &= v60 & v68;
          if (v62 <= 0x19) {
            int v60 = 0;
          }
          else {
            int v60 = v64;
          }
          if (v62 > 0x19)
          {
            int v59 = v65;
            int v58 = v66;
          }
          int v69 = (v61 == 46) & v58;
          if (v57) {
            int v58 = v69;
          }
          ++v57;
        }
        while (a4 != v57);
      }
      else
      {
        LOBYTE(v59) = 1;
        LOBYTE(v58) = 1;
      }
      char v13 = v59 | v58;
    }
    else
    {
      char v13 = 0;
    }
    if (a4 >= 3 && (v13 & 1) == 0)
    {
      if (a4 != 4 && a4 != 40 && (*a3 != 48 || a3[1] != 120))
      {
        char v13 = 0;
        return v13 & 1;
      }
      if (*a3 == 48) {
        unint64_t v70 = 2 * (a3[1] == 120);
      }
      else {
        unint64_t v70 = 0;
      }
      char v71 = 1;
      char v72 = 1;
      do
      {
        int v73 = a3[v70];
        if ((v73 - 48) >= 0xA)
        {
          v72 &= (v73 - 97) < 6;
          v71 &= (v73 - 65) < 6;
        }
        char v13 = v72 | v71;
        if (((v72 | v71) & 1) == 0) {
          break;
        }
        ++v70;
      }
      while (v70 < a4);
    }
  }
  if (a4 == 3 && (v13 & 1) != 0)
  {
    if (*a3 == 79 && a3[1] == 83)
    {
      char v13 = a3[2] != 88;
      return v13 & 1;
    }
LABEL_127:
    char v13 = 1;
  }
  return v13 & 1;
}

- (BOOL)checkSpecialPrefixesForWordBuffer:(char *)a3 length:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a4 - 1 > 0x47) {
    return 0;
  }
  uint64_t v4 = 0;
  do
  {
    int v5 = a3[v4];
    if ((v5 - 65) < 0x1A || (v5 - 192) < 0x17)
    {
      if ((v5 - 138) > 0x15 || ((1 << (v5 + 118)) & 0x200015) == 0)
      {
LABEL_14:
        LOBYTE(v5) = v5 + 32;
        goto LABEL_22;
      }
LABEL_19:
      if (v5 == 159) {
        LOBYTE(v5) = -1;
      }
      else {
        LOBYTE(v5) = v5 + 16;
      }
      goto LABEL_22;
    }
    if ((v5 - 216) < 7) {
      goto LABEL_14;
    }
    if ((v5 - 138) <= 0x15 && ((1 << (v5 + 118)) & 0x200015) != 0) {
      goto LABEL_19;
    }
LABEL_22:
    *(&v10 + v4++) = v5;
  }
  while (a4 != v4);
  return a4 >= 4 && v10 == 106 && v11 == 252 && v12 == 100
      || a4 >= 5 && v10 == 106 && v11 == 117 && v12 == 100 && v13 == 101
      || a4 >= 0xA
      && v10 == 97
      && v11 == 117
      && v12 == 115
      && v13 == 108
      && v14 == 228
      && v15 == 110
      && v16 == 100
      && v17 == 101
      && v18 == 114
      || a4 >= 0xA
      && v10 == 101
      && v11 == 110
      && v12 == 100
      && v13 == 108
      && v14 == 246
      && v15 == 115
      && v16 == 117
      && v17 == 110
      && v18 == 103
      || a4 >= 7 && v10 == 104 && v11 == 105 && v12 == 116 && v13 == 108 && v14 == 101 && v15 == 114
      || a4 >= 7 && v10 == 103 && v11 == 246 && v12 == 114 && v13 == 105 && v14 == 110 && v15 == 103;
}

- (id)stringByRemovingArabicDiacriticsFromString:(id)a3
{
  if (stringByRemovingArabicDiacriticsFromString__onceToken != -1) {
    dispatch_once(&stringByRemovingArabicDiacriticsFromString__onceToken, &__block_literal_global_7);
  }
  uint64_t v4 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", stringByRemovingArabicDiacriticsFromString__diacriticCharacterSet, 4, 0, objc_msgSend(a3, "length"));
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    char v8 = (void *)[MEMORY[0x263F089D8] stringWithString:a3];
    do
    {
      objc_msgSend(v8, "replaceCharactersInRange:withString:", v6, v7, &stru_26C1C71A8);
      if (!v6) {
        break;
      }
      uint64_t v6 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", stringByRemovingArabicDiacriticsFromString__diacriticCharacterSet, 4, 0, v6);
      uint64_t v7 = v9;
    }
    while (v9);
    return v8;
  }
  return a3;
}

id __67__AppleSpell_Spelling__stringByRemovingArabicDiacriticsFromString___block_invoke()
{
  id result = (id)objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 1611, 8);
  stringByRemovingArabicDiacriticsFromString__diacriticCharacterSet = (uint64_t)result;
  return result;
}

- (id)stringByReducingArabicAlefVariantsInString:(id)a3
{
  if (stringByReducingArabicAlefVariantsInString__onceToken != -1) {
    dispatch_once(&stringByReducingArabicAlefVariantsInString__onceToken, &__block_literal_global_24);
  }
  objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", stringByReducingArabicAlefVariantsInString__alefVariantSet, 0, 0, objc_msgSend(a3, "length"));
  if (v4)
  {
    a3 = (id)[MEMORY[0x263F089D8] stringWithString:a3];
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", @"آ", @"ا", 0, 0, objc_msgSend(a3, "length"));
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", @"أ", @"ا", 0, 0, objc_msgSend(a3, "length"));
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", @"إ", @"ا", 0, 0, objc_msgSend(a3, "length"));
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", @"ا53", @"ا", 0, 0, objc_msgSend(a3, "length"));
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", @"ا54", @"ا", 0, 0, objc_msgSend(a3, "length"));
    objc_msgSend(a3, "replaceOccurrencesOfString:withString:options:range:", @"ا55", @"ا", 0, 0, objc_msgSend(a3, "length"));
  }
  return a3;
}

id __67__AppleSpell_Spelling__stringByReducingArabicAlefVariantsInString___block_invoke()
{
  id result = (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"آأإٕٓٔ"];
  stringByReducingArabicAlefVariantsInString__alefVariantSet = (uint64_t)result;
  return result;
}

- (id)stringByRemovingHebrewDiacriticsFromString:(id)a3
{
  if (stringByRemovingHebrewDiacriticsFromString__onceToken != -1) {
    dispatch_once(&stringByRemovingHebrewDiacriticsFromString__onceToken, &__block_literal_global_50);
  }
  uint64_t v4 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", stringByRemovingHebrewDiacriticsFromString__diacriticCharacterSet, 4, 0, objc_msgSend(a3, "length"));
  if (v5)
  {
    uint64_t v6 = v4;
    uint64_t v7 = v5;
    char v8 = (void *)[MEMORY[0x263F089D8] stringWithString:a3];
    do
    {
      objc_msgSend(v8, "replaceCharactersInRange:withString:", v6, v7, &stru_26C1C71A8);
      if (!v6) {
        break;
      }
      uint64_t v6 = objc_msgSend(a3, "rangeOfCharacterFromSet:options:range:", stringByRemovingHebrewDiacriticsFromString__diacriticCharacterSet, 4, 0, v6);
      uint64_t v7 = v9;
    }
    while (v9);
    return v8;
  }
  return a3;
}

id __67__AppleSpell_Spelling__stringByRemovingHebrewDiacriticsFromString___block_invoke()
{
  id result = (id)objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 1456, 14);
  stringByRemovingHebrewDiacriticsFromString__diacriticCharacterSet = (uint64_t)result;
  return result;
}

- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkBase:(BOOL)a8 checkDict:(BOOL)a9 checkTemp:(BOOL)a10 checkUser:(BOOL)a11 checkNames:(BOOL)a12 checkHyphens:(BOOL)a13 checkIntercaps:(BOOL)a14 checkOptions:(BOOL)a15 forCorrection:(BOOL)a16 depth:(unint64_t)a17
{
  BOOL v17 = a8;
  BOOL v21 = a14;
  v286[10] = *MEMORY[0x263EF8340];
  int v22 = [a5 isEnglish];
  int v272 = [a5 isFrench];
  int v275 = [a5 isGerman];
  int v270 = [a5 isSpanish];
  int v266 = [a5 isItalian];
  int v271 = [a5 isRussian];
  int v23 = [a5 isTurkish];
  int v263 = [a5 isSwedish];
  unsigned __int8 v262 = [a5 isDanish];
  int v261 = [a5 isHungarian];
  unsigned __int8 v264 = [a5 isIrishGaelic];
  int v24 = [a5 isKorean];
  int v25 = [a5 isArabic];
  int v260 = [a5 isHindi];
  int v259 = [a5 isPunjabi];
  int v258 = [a5 isTelugu];
  int v268 = objc_msgSend((id)objc_msgSend(a5, "identifier"), "hasPrefix:", @"ars");
  int v278 = objc_msgSend((id)objc_msgSend(a5, "identifier"), "isEqualToString:", @"en_CN");
  int v26 = [a5 isHebrew];
  CFStringEncoding encoding = [a5 encoding];
  int v265 = v22;
  if (validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__onceToken != -1) {
    dispatch_once(&validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__onceToken, &__block_literal_global_58);
  }
  do
  {
    if (!a4)
    {
      unint64_t v29 = 0;
      id v33 = a7;
      int v267 = !v17;
      BOOL v269 = a7 != 0;
      LOBYTE(v34) = 1;
      goto LABEL_607;
    }
    unint64_t v27 = a4 - 1;
    int v28 = a3[--a4];
  }
  while (v28 == 32);
  int v255 = v23;
  unint64_t v29 = v27 + 1;
  if (!a15)
  {
    v280 = 0;
    LODWORD(v30) = 0;
    BOOL v35 = encoding == 134217984;
LABEL_15:
    BOOL v256 = v35;
    goto LABEL_16;
  }
  LODWORD(v30) = [(AppleSpell *)self validateAbbreviationOrNumberWordBuffer:a3 length:v27 + 1 languageObject:a5 connection:a6 sender:a7];
  v280 = 0;
  BOOL v256 = encoding == 134217984;
  if (!v30 && a15 && encoding == 134217984)
  {
    int v31 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, 0x8000100u, 0);
    if (v31)
    {
      v280 = v31;
      [(__CFString *)v31 rangeOfCharacterFromSet:validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__nonDigitOrPunctuationCharacterSet];
      LODWORD(v30) = v32 == 0;
    }
    else
    {
      v280 = 0;
      LODWORD(v30) = 0;
    }
    BOOL v35 = 1;
    goto LABEL_15;
  }
LABEL_16:
  BOOL v36 = !a9;
  if (((v30 | v24 | v36) & 1) == 0)
  {
    BOOL v37 = [(AppleSpell *)self checkWordBuffer:a3 length:v27 + 1 languageObject:a5 index:0];
    LODWORD(v30) = v37;
    if (v29 >= 3 && v37 && (encoding & 0xFFFFFFFB) == 0x500)
    {
      int v38 = *a3;
      a4 = (unint64_t)v280;
      if ((v38 - 65) >= 0x1A && (v38 - 192) >= 0x17 && (v38 - 216) >= 7)
      {
        unsigned int v39 = v38 - 138;
        if (v39 > 0x15 || ((1 << v39) & 0x200015) == 0) {
          goto LABEL_46;
        }
      }
      int v40 = a3[1];
      if ((v40 - 65) >= 0x1A && (v40 - 192) >= 0x17 && (v40 - 216) >= 7)
      {
        unsigned int v41 = v40 - 138;
        if (v41 > 0x15 || ((1 << v41) & 0x200015) == 0) {
          goto LABEL_46;
        }
      }
      for (unint64_t i = 2; i < v29; ++i)
      {
        unsigned int v43 = a3[i];
        BOOL v44 = v43 <= 0xF7 && v43 - 97 >= 0x1A;
        if (v44 && v43 - 223 >= 0x18)
        {
          unsigned int v46 = v43 - 154;
          BOOL v109 = v46 > 4;
          int v47 = (1 << v46) & 0x15;
          if (v109 || v47 == 0) {
            goto LABEL_46;
          }
        }
      }
      if (v29 <= 3 && a3[2] == 115)
      {
LABEL_46:
        int v267 = !v17;
        goto LABEL_47;
      }
      LODWORD(v30) = 0;
    }
  }
  if ((v30 & 1) == 0 && a12) {
    LODWORD(v30) = [(AppleSpell *)self checkNameWordBuffer:a3 length:v27 + 1 languageObject:a5 globalOnly:0];
  }
  int v49 = !v17;
  int v267 = !v17;
  if (!a6) {
    int v49 = 1;
  }
  int v257 = v49;
  if (v30)
  {
    BOOL v50 = self;
  }
  else
  {
    BOOL v50 = self;
    if ((v49 & 1) == 0)
    {
      LODWORD(v30) = [(AppleSpell *)self validateWordBuffer:a3 length:v27 + 1 connection:a6];
      if ((v30 & v275) == 1) {
        LODWORD(v30) = ![(AppleSpell *)self checkSpecialPrefixesForWordBuffer:a3 length:v27 + 1];
      }
    }
    if ((v30 & 1) == 0 && a10) {
      LODWORD(v30) = [(AppleSpell *)self checkWordBuffer:a3 length:v27 + 1 languageObject:a5 index:4];
    }
  }
  if ((v30 | v36)) {
    goto LABEL_66;
  }
  BOOL v51 = a16;
  if (!a6) {
    BOOL v51 = 0;
  }
  if ((v51 | v278 | v24 | v25)) {
    goto LABEL_65;
  }
  uint64_t v30 = v280;
  if (!v280)
  {
    uint64_t v30 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, encoding, 0);
    if (!v30)
    {
      if (([a5 isMarathi] & 1) == 0) {
        [a5 isUrdu];
      }
      v280 = 0;
      goto LABEL_65;
    }
  }
  v280 = v30;
  if (![(AppleSpell *)v50 validateWord:v30 inLexiconForLanguageObject:a5])
  {
    if (([a5 isMarathi] & 1) != 0 || objc_msgSend(a5, "isUrdu"))
    {
      LODWORD(v30) = [(AppleSpell *)v50 validateAdditionalWord:v30 inLexiconForLanguageObject:a5];
      goto LABEL_80;
    }
LABEL_65:
    LODWORD(v30) = 0;
    goto LABEL_66;
  }
  LODWORD(v30) = 1;
LABEL_80:
  if (v29 >= 3 && v30 && (encoding & 0xFFFFFFFB) == 0x500)
  {
    int v56 = *a3;
    a4 = (unint64_t)v280;
    if ((v56 - 65) >= 0x1A && (v56 - 192) >= 0x17 && (v56 - 216) >= 7)
    {
      unsigned int v57 = v56 - 138;
      if (v57 > 0x15 || ((1 << v57) & 0x200015) == 0) {
        goto LABEL_47;
      }
    }
    int v58 = a3[1];
    if ((v58 - 65) >= 0x1A && (v58 - 192) >= 0x17 && (v58 - 216) >= 7)
    {
      unsigned int v59 = v58 - 138;
      if (v59 > 0x15 || ((1 << v59) & 0x200015) == 0) {
        goto LABEL_47;
      }
    }
    for (unint64_t j = 2; j < v29; ++j)
    {
      unsigned int v61 = a3[j];
      if (v61 <= 0xF7 && v61 - 97 >= 0x1A && v61 - 223 >= 0x18)
      {
        unsigned int v64 = v61 - 154;
        BOOL v109 = v64 > 4;
        int v65 = (1 << v64) & 0x15;
        if (v109 || v65 == 0) {
          goto LABEL_47;
        }
      }
    }
    if (v29 <= 3 && a3[2] == 115)
    {
LABEL_47:
      id v33 = a7;
      BOOL v269 = a7 != 0;
      LOBYTE(v34) = 1;
      goto LABEL_606;
    }
    goto LABEL_65;
  }
LABEL_66:
  if (((v30 | v36) & 1) == 0)
  {
    if ([a5 isUkrainian])
    {
      BOOL v52 = v280;
      if (!v280) {
        BOOL v52 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, encoding, 0);
      }
      [(__CFString *)v52 rangeOfString:@"ʼ"];
      v280 = v52;
      if (v53)
      {
        int v54 = @"ʼ";
        int v55 = @"'";
      }
      else
      {
        [(__CFString *)v52 rangeOfString:@"'"];
        if (!v67) {
          goto LABEL_114;
        }
        int v54 = @"'";
        int v55 = @"ʼ";
      }
      uint64_t v68 = [(__CFString *)v52 stringByReplacingOccurrencesOfString:v54 withString:v55];
      if (v68)
      {
        LODWORD(v30) = [(AppleSpell *)v50 validateWord:v68 inLexiconForLanguageObject:a5];
        goto LABEL_115;
      }
    }
LABEL_114:
    LODWORD(v30) = 0;
  }
LABEL_115:
  if ((v30 | v36) & 1) != 0 || ((v25 ^ 1))
  {
    id v69 = a7;
  }
  else
  {
    id v69 = a7;
    CFStringRef v70 = v280;
    if (!v280)
    {
      CFStringRef v70 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, encoding, 0);
      if (!v70)
      {
        if ((v26 & 1) == 0)
        {
          v280 = 0;
          goto LABEL_142;
        }
        goto LABEL_133;
      }
    }
    uint64_t v71 = [(AppleSpell *)v50 stringByRemovingArabicDiacriticsFromString:v70];
    v280 = (__CFString *)v70;
    if (!v71) {
      goto LABEL_128;
    }
    uint64_t v72 = v71;
    if (a16) {
      BOOL v73 = [(AppleSpell *)self validateWord:v71 inLexiconForLanguageObject:a5];
    }
    else {
      BOOL v73 = [(AppleSpell *)self validateAdditionalWord:v71 inLexiconForLanguageObject:a5];
    }
    LODWORD(v30) = v73;
    if (v73) {
      goto LABEL_129;
    }
    if ((v268 ^ 1)) {
      goto LABEL_129;
    }
    uint64_t v74 = [(AppleSpell *)self stringByReducingArabicAlefVariantsInString:v72];
    uint64_t v30 = v74;
    if (!v74) {
      goto LABEL_129;
    }
    if ([(__CFString *)v74 isEqualToString:v72])
    {
LABEL_128:
      LODWORD(v30) = 0;
LABEL_129:
      BOOL v50 = self;
      goto LABEL_130;
    }
    BOOL v50 = self;
    if (a16) {
      BOOL v101 = [(AppleSpell *)self validateWord:v30 inLexiconForLanguageObject:a5];
    }
    else {
      BOOL v101 = [(AppleSpell *)self validateAdditionalWord:v30 inLexiconForLanguageObject:a5];
    }
    LODWORD(v30) = v101;
  }
LABEL_130:
  if ((v30 | v36) & 1) != 0 || ((v26 ^ 1)) {
    goto LABEL_143;
  }
  uint64_t v30 = v280;
  if (!v280)
  {
LABEL_133:
    uint64_t v30 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, encoding, 0);
    if (!v30)
    {
      v280 = 0;
      goto LABEL_143;
    }
  }
  uint64_t v75 = [(AppleSpell *)v50 stringByRemovingHebrewDiacriticsFromString:v30];
  v280 = v30;
  if (!v75)
  {
LABEL_142:
    LODWORD(v30) = 0;
    goto LABEL_143;
  }
  if (a16) {
    BOOL v76 = [(AppleSpell *)v50 validateWord:v75 inLexiconForLanguageObject:a5];
  }
  else {
    BOOL v76 = [(AppleSpell *)v50 validateAdditionalWord:v75 inLexiconForLanguageObject:a5];
  }
  LODWORD(v30) = v76;
LABEL_143:
  BOOL v269 = v69 != 0;
  if ((v30 & 1) != 0 || !v69 || !a11)
  {
LABEL_149:
    int v78 = v24 ^ 1;
    unint64_t v79 = a6;
    if ((v30 | v36) & 1) != 0 || (v78) {
      goto LABEL_161;
    }
    v286[0] = 0;
    uint64_t v30 = v280;
    if (v280) {
      goto LABEL_153;
    }
    goto LABEL_152;
  }
  CFStringRef v77 = v280;
  if (v280
    || (CFStringRef v77 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, encoding, 0)) != 0)
  {
    v280 = (__CFString *)v77;
    LODWORD(v30) = [v69 isWordInUserDictionaries:v77 caseSensitive:0];
    goto LABEL_149;
  }
  int v78 = v24 ^ 1;
  if (((v36 | v24 ^ 1) & 1) == 0)
  {
    v286[0] = 0;
    unint64_t v79 = a6;
LABEL_152:
    uint64_t v30 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v27 + 1, encoding, 0);
    if (!v30)
    {
      v280 = 0;
LABEL_160:
      int v78 = 0;
      goto LABEL_161;
    }
LABEL_153:
    [(__CFString *)v30 rangeOfCharacterFromSet:validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__nonPunctuationCharacterSet];
    v280 = v30;
    LODWORD(v30) = !v80
                || (uint64_t v30 = -[AppleSpell internalStringForKoreanExternalString:](self, "internalStringForKoreanExternalString:", v30), v81 = -[__CFString length](v30, "length"), v287.location = 0, v287.length = v81, v81 == CFStringGetBytes(v30, v287, encoding, 0x5Fu, 0, (UInt8 *)buffer, 72, v286))&& (!v286[0]|| -[AppleSpell checkWordBuffer:length:languageObject:index:](self, "checkWordBuffer:length:languageObject:index:", buffer, v286[0], a5, 5))|| -[AppleSpell validateWord:inLexiconForLanguageObject:](self, "validateWord:inLexiconForLanguageObject:", v30,
                     a5);
    goto LABEL_160;
  }
  v280 = 0;
  LODWORD(v30) = 0;
  unint64_t v79 = a6;
LABEL_161:
  if (v79) {
    BOOL v82 = !a15;
  }
  else {
    BOOL v82 = 1;
  }
  if ((v30 & 1) == 0 && !v82 && ((v275 ^ 1) & 1) == 0)
  {
    uint64_t v83 = 0;
    while (!v83 || (a3[v83] | 0x20) != 0x73 || (a3[v83 - 1] | 0x20) != 0x73)
    {
      if (++v83 >= v29) {
        goto LABEL_177;
      }
    }
    v79->var7 = 64;
    if (PRdb(&v79->var0, 4, 128))
    {
      v79->var7 = 128;
      PRdb(&v79->var0, 4, 128);
    }
    else
    {
      BOOL v84 = [(AppleSpell *)self validateWordBuffer:a3 length:v27 + 1 connection:v79];
      v79->var7 = 128;
      PRdb(&v79->var0, 4, 128);
      if (v84)
      {
        LODWORD(v30) = ![(AppleSpell *)self checkSpecialPrefixesForWordBuffer:a3 length:v27 + 1];
        goto LABEL_178;
      }
    }
LABEL_177:
    LODWORD(v30) = 0;
  }
LABEL_178:
  if (((v30 | v82) & 1) == 0 && ((v270 ^ 1) & 1) == 0)
  {
    uint64_t v85 = 0;
    while (1)
    {
      int v86 = a3[v85];
      if ((v86 & 0xF8) == 0xC8) {
        break;
      }
      if ((v86 - 210) <= 0xB && ((1 << (v86 + 46)) & 0xF9F) != 0) {
        break;
      }
      unsigned int v88 = v86 - 138;
      BOOL v109 = v88 > 0x3B;
      uint64_t v89 = (1 << v88) & 0xFC0000000200011;
      if (!v109 && v89 != 0) {
        break;
      }
      if (++v85 >= v29)
      {
        LODWORD(v30) = 0;
        goto LABEL_198;
      }
    }
    v79->var8 = 128;
    if (PRdb(&v79->var0, 4, 128)) {
      LODWORD(v30) = 0;
    }
    else {
      LODWORD(v30) = [(AppleSpell *)self validateWordBuffer:a3 length:v27 + 1 connection:v79];
    }
    v79->var8 = 64;
    PRdb(&v79->var0, 4, 128);
  }
LABEL_198:
  if (((v30 | v82) & 1) == 0 && ((v271 ^ 1) & 1) == 0)
  {
    uint64_t v91 = 0;
    while (1)
    {
      int v92 = a3[v91];
      if (v92 == 161 || v92 == 241) {
        break;
      }
      if (++v91 >= v29)
      {
        LODWORD(v30) = 0;
        goto LABEL_209;
      }
    }
    v79->var8 = 64;
    if (PRdb(&v79->var0, 4, 128)) {
      LODWORD(v30) = 0;
    }
    else {
      LODWORD(v30) = [(AppleSpell *)self validateWordBuffer:a3 length:v27 + 1 connection:v79];
    }
    v79->var8 = 128;
    PRdb(&v79->var0, 4, 128);
  }
LABEL_209:
  int v93 = v272 ^ 1;
  if ((v30 | v82) & 1) != 0 || (v93) {
    goto LABEL_254;
  }
  uint64_t v94 = 0;
  int v95 = 1;
  while (1)
  {
    int v96 = a3[v94];
    if ((v96 & 0xF8) == 0xC8) {
      break;
    }
    if ((v96 - 210) <= 0xB && ((1 << (v96 + 46)) & 0xF9F) != 0) {
      goto LABEL_230;
    }
    unsigned int v98 = v96 - 138;
    BOOL v109 = v98 > 0x3B;
    uint64_t v99 = (1 << v98) & 0xFC0000000200011;
    if (!v109 && v99 != 0) {
      goto LABEL_230;
    }
    if (++v94 >= v29)
    {
      int v95 = 0;
      goto LABEL_230;
    }
  }
  int v95 = 1;
LABEL_230:
  uint64_t v102 = 0;
  while (1)
  {
    if (v102)
    {
      if ((a3[v102] | 0x20) == 0x65)
      {
        unsigned int v103 = a3[v102 - 1] - 65;
        if (v103 < 0x2F && ((0x400100004001uLL >> v103) & 1) != 0) {
          break;
        }
      }
    }
    if (++v102 >= v29)
    {
      int v104 = 0;
      if (!v95) {
        goto LABEL_240;
      }
      goto LABEL_237;
    }
  }
  int v104 = 1;
  if (!v95) {
    goto LABEL_240;
  }
LABEL_237:
  v79->var8 = 160;
  if (!PRdb(&v79->var0, 4, 128))
  {
    LODWORD(v30) = [(AppleSpell *)self validateWordBuffer:a3 length:v27 + 1 connection:v79];
    goto LABEL_241;
  }
LABEL_240:
  LODWORD(v30) = 0;
LABEL_241:
  if (v30 & 1) != 0 || ((v104 ^ 1))
  {
LABEL_245:
    if ((v30 & 1) == 0) {
      goto LABEL_246;
    }
    goto LABEL_252;
  }
  v79->var8 = 80;
  if (PRdb(&v79->var0, 4, 128))
  {
    LODWORD(v30) = 0;
    goto LABEL_245;
  }
  LODWORD(v30) = [(AppleSpell *)self validateWordBuffer:a3 length:v27 + 1 connection:v79];
  if ((v30 & 1) == 0)
  {
LABEL_246:
    if ((v95 & v104) != 0)
    {
      v79->var8 = 144;
      if (PRdb(&v79->var0, 4, 128)) {
        LODWORD(v30) = 0;
      }
      else {
        LODWORD(v30) = [(AppleSpell *)self validateWordBuffer:a3 length:v27 + 1 connection:v79];
      }
    }
  }
LABEL_252:
  if ((v95 | v104) == 1)
  {
    v79->var8 = 96;
    PRdb(&v79->var0, 4, 128);
  }
LABEL_254:
  if (((v30 | v257) & 1) == 0 && ((v278 ^ 1) & 1) == 0)
  {
    v79->var7 = 64;
    if (PRdb(&v79->var0, 4, 128)) {
      LODWORD(v30) = 0;
    }
    else {
      LODWORD(v30) = [(AppleSpell *)self validateWordBuffer:a3 length:v27 + 1 connection:v79];
    }
    v79->var7 = 128;
    PRdb(&v79->var0, 4, 128);
  }
  BOOL v105 = a17 < 4 && a13;
  if (!v105 || v30)
  {
LABEL_281:
    if (v30)
    {
      LOBYTE(v34) = 1;
      goto LABEL_604;
    }
  }
  else
  {
    unint64_t v106 = 0;
    while (1)
    {
      int v107 = a3[v106];
      if ((v107 - 32) <= 0x3F && ((1 << (v107 - 32)) & 0x800000000400E001) != 0) {
        break;
      }
      BOOL v109 = v27 - 1 != v106 && v106 > 1;
      BOOL v110 = !v109 || v27 == v106;
      if (v110 && v107 == 39) {
        break;
      }
      if (++v106 >= v29) {
        goto LABEL_281;
      }
    }
    if (!v106) {
      goto LABEL_744;
    }
    HIBYTE(usedBufLena) = a16;
    BYTE6(usedBufLena) = a15;
    BYTE5(usedBufLena) = a14;
    BYTE4(usedBufLena) = 1;
    BYTE3(usedBufLena) = a12;
    BYTE2(usedBufLena) = a11;
    BYTE1(usedBufLena) = a10;
    LOBYTE(usedBufLena) = a9;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v106, a5, a6, a7, 1, usedBufLena, a17 + 1))
    {
LABEL_744:
      LOBYTE(v34) = 1;
      if (v106 + 1 >= v29) {
        goto LABEL_604;
      }
      HIBYTE(usedBufLenb) = a16;
      BYTE6(usedBufLenb) = a15;
      BYTE5(usedBufLenb) = a14;
      BYTE4(usedBufLenb) = 1;
      BYTE3(usedBufLenb) = a12;
      BYTE2(usedBufLenb) = a11;
      BYTE1(usedBufLenb) = a10;
      LOBYTE(usedBufLenb) = a9;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", &a3[v106 + 1], v27 - v106, a5, a6, a7, 1, usedBufLenb, a17 + 1))
      {
        goto LABEL_604;
      }
    }
  }
  LODWORD(v34) = 0;
  if (v29 >= 3 && v105 && v256)
  {
    uint64_t v111 = 0;
    uint64_t v112 = 0;
    do
    {
      if (a3[v112] == 226 && a3[v112 + 1] == 128)
      {
        BOOL v113 = (a3[v112 + 2] & 0xFE) == 144;
        if ((a3[v112 + 2] & 0xFE) == 0x90) {
          uint64_t v111 = v112;
        }
      }
      else
      {
        BOOL v113 = 0;
      }
      if (v113) {
        break;
      }
      unint64_t v114 = v112 + 3;
      ++v112;
    }
    while (v114 < v29);
    if (!v113) {
      goto LABEL_303;
    }
    if (!v111) {
      goto LABEL_301;
    }
    HIBYTE(usedBufLenc) = a16;
    BYTE6(usedBufLenc) = a15;
    BYTE5(usedBufLenc) = a14;
    BYTE4(usedBufLenc) = 1;
    BYTE3(usedBufLenc) = a12;
    BYTE2(usedBufLenc) = a11;
    BYTE1(usedBufLenc) = a10;
    LOBYTE(usedBufLenc) = a9;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v111, a5, a6, a7, 1, usedBufLenc, a17 + 1))
    {
LABEL_301:
      LOBYTE(v34) = 1;
      if (v111 + 3 >= v29) {
        goto LABEL_604;
      }
      HIBYTE(usedBufLend) = a16;
      BYTE6(usedBufLend) = a15;
      BYTE5(usedBufLend) = a14;
      BYTE4(usedBufLend) = 1;
      BYTE3(usedBufLend) = a12;
      BYTE2(usedBufLend) = a11;
      BYTE1(usedBufLend) = a10;
      LOBYTE(usedBufLend) = a9;
      LODWORD(v34) = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", &a3[v111 + 3], v27 - v111 - 2, a5, a6, a7, 1, usedBufLend, a17 + 1);
    }
    else
    {
LABEL_303:
      LODWORD(v34) = 0;
    }
  }
  a4 = (unint64_t)v280;
  if ((v34 | v78 | !v105)) {
    goto LABEL_327;
  }
  uint64_t v115 = 0;
  while (1)
  {
    int v116 = a3[v115];
    if (v116 == 39
      || v115 + 2 < v29 && v116 == 226 && a3[v115 + 1] == 128 && a3[v115 + 2] == 153)
    {
      break;
    }
    if (++v115 >= v29) {
      goto LABEL_326;
    }
  }
  uint64_t v117 = 0;
  unint64_t v118 = 0;
  do
  {
    int v119 = a3[v118];
    if (v118 + 2 < v29 && v119 == 226)
    {
      if (a3[v118 + 1] == 128 && a3[v118 + 2] == 153)
      {
        v118 += 2;
        goto LABEL_323;
      }
      LOBYTE(v119) = -30;
LABEL_322:
      *((unsigned char *)&buffer[0].location + v117++) = v119;
      goto LABEL_323;
    }
    if (v119 != 39) {
      goto LABEL_322;
    }
LABEL_323:
    ++v118;
  }
  while (v118 < v29);
  if (v117)
  {
    HIBYTE(usedBufLene) = a16;
    BYTE6(usedBufLene) = a15;
    BYTE5(usedBufLene) = a14;
    BYTE4(usedBufLene) = 1;
    BYTE3(usedBufLene) = a12;
    BYTE2(usedBufLene) = a11;
    BYTE1(usedBufLene) = a10;
    LOBYTE(usedBufLene) = a9;
    LODWORD(v34) = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", buffer, v117, a5, a6, a7, 1, usedBufLene, a17 + 1);
    goto LABEL_327;
  }
LABEL_326:
  LODWORD(v34) = 0;
LABEL_327:
  unsigned __int8 v120 = v34 ^ 1;
  int v121 = v105 & (v34 ^ 1);
  if ((v121 & v266) == 1)
  {
    id v33 = a7;
    if (v29 >= 4)
    {
      unint64_t v122 = 3;
      BOOL v21 = a14;
      if (!strncasecmp_l(a3, "un'", 3uLL, 0)) {
        goto LABEL_345;
      }
      if (v29 >= 5)
      {
        unint64_t v122 = 4;
        if (strncasecmp_l(a3, "all'", 4uLL, 0))
        {
          unint64_t v122 = 4;
          if (strncasecmp_l(a3, "com'", 4uLL, 0))
          {
            unint64_t v122 = 4;
            if (strncasecmp_l(a3, "dev'", 4uLL, 0))
            {
              if (v29 < 6)
              {
                unint64_t v29 = 5;
                goto LABEL_419;
              }
              unint64_t v122 = 5;
              if (strncasecmp_l(a3, "dall'", 5uLL, 0))
              {
                unint64_t v122 = 5;
                if (strncasecmp_l(a3, "dell'", 5uLL, 0))
                {
                  unint64_t v122 = 5;
                  if (strncasecmp_l(a3, "nell'", 5uLL, 0))
                  {
                    unint64_t v122 = 5;
                    if (strncasecmp_l(a3, "sant'", 5uLL, 0))
                    {
                      unint64_t v122 = 5;
                      if (strncasecmp_l(a3, "sull'", 5uLL, 0))
                      {
                        unint64_t v122 = 5;
                        if (strncasecmp_l(a3, "tutt'", 5uLL, 0))
                        {
                          if (v29 >= 7)
                          {
                            unint64_t v122 = 6;
                            if (!strncasecmp_l(a3, "quand'", 6uLL, 0)) {
                              goto LABEL_345;
                            }
                            unint64_t v122 = 6;
                            if (!strncasecmp_l(a3, "quell'", 6uLL, 0)) {
                              goto LABEL_345;
                            }
                            unint64_t v122 = 6;
                            if (!strncasecmp_l(a3, "quest'", 6uLL, 0)) {
                              goto LABEL_345;
                            }
LABEL_419:
                            a4 = (unint64_t)v280;
                            goto LABEL_607;
                          }
LABEL_431:
                          unint64_t v29 = 6;
                          goto LABEL_419;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_345:
        if (v122 >= v29) {
          goto LABEL_419;
        }
        unsigned int v123 = a3[v122];
        HIDWORD(v125) = v123 - 65;
        LODWORD(v125) = v123 - 65;
        unsigned int v124 = v125 >> 1;
        __int16 v126 = self;
        if (v124 <= 0x1C && ((1 << v124) & 0x14951495) != 0) {
          goto LABEL_379;
        }
        uint32x4_t v127 = (uint32x4_t)vaddq_s32(vdupq_n_s32(v123), (int32x4_t)xmmword_20CC61C10);
        if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20CC61C20, v127))) & 1) != 0
          || v123 - 248 < 6
          || (v123 & 0xD8) == 0xC8
          || v123 == 255)
        {
          goto LABEL_379;
        }
        if (v123 - 65 >= 0x1A && v127.i32[0] >= 0x17u)
        {
          if (v123 - 216 >= 7)
          {
            if (v123 - 138 <= 0x15 && ((1 << (v123 + 118)) & 0x200015) != 0) {
              goto LABEL_419;
            }
            goto LABEL_540;
          }
LABEL_539:
          v123 += 32;
LABEL_540:
          if (v123 != 104) {
            goto LABEL_419;
          }
LABEL_379:
          HIBYTE(usedBufLenf) = a16;
          BYTE6(usedBufLenf) = a15;
          BYTE5(usedBufLenf) = v21;
          BYTE4(usedBufLenf) = 1;
          BYTE3(usedBufLenf) = a12;
          BYTE2(usedBufLenf) = a11;
          BYTE1(usedBufLenf) = a10;
          LOBYTE(usedBufLenf) = a9;
          LOBYTE(v34) = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](v126, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", usedBufLenf, a17 + 1);
          goto LABEL_419;
        }
LABEL_537:
        if (v123 - 138 <= 0x15 && ((1 << (v123 + 118)) & 0x200015) != 0) {
          goto LABEL_419;
        }
        goto LABEL_539;
      }
LABEL_418:
      unint64_t v29 = 4;
      goto LABEL_419;
    }
LABEL_606:
    BOOL v21 = a14;
    goto LABEL_607;
  }
  id v33 = a7;
  if (((v121 ^ 1 | v93) & 1) == 0)
  {
    BOOL v21 = a14;
    if (v29 < 4) {
      goto LABEL_607;
    }
    unint64_t v131 = 3;
    if (strncasecmp_l(a3, "qu'", 3uLL, 0))
    {
      if (v29 < 6) {
        goto LABEL_419;
      }
      unint64_t v131 = 5;
      if (strncasecmp_l(a3, "entr'", 5uLL, 0))
      {
        if (v29 < 7) {
          goto LABEL_431;
        }
        unint64_t v131 = 6;
        if (strncasecmp_l(a3, "jusqu'", 6uLL, 0))
        {
          if (v29 < 8)
          {
            unint64_t v29 = 7;
            goto LABEL_419;
          }
          unint64_t v131 = 7;
          if (strncasecmp_l(a3, "presqu'", 7uLL, 0))
          {
            unint64_t v131 = 7;
            if (strncasecmp_l(a3, "quelqu'", 7uLL, 0)) {
              goto LABEL_419;
            }
          }
        }
      }
    }
    if (v131 >= v29) {
      goto LABEL_419;
    }
    unsigned int v123 = a3[v131];
    HIDWORD(v133) = v123 - 65;
    LODWORD(v133) = v123 - 65;
    unsigned int v132 = v133 >> 1;
    __int16 v126 = self;
    if (v132 <= 0x1C && ((1 << v132) & 0x14951495) != 0) {
      goto LABEL_379;
    }
    uint32x4_t v173 = (uint32x4_t)vaddq_s32(vdupq_n_s32(v123), (int32x4_t)xmmword_20CC61C10);
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20CC61C20, v173))) & 1) != 0
      || v123 - 248 < 6
      || (v123 & 0xD8) == 0xC8
      || v123 == 255)
    {
      goto LABEL_379;
    }
    if (v123 - 65 >= 0x1A && v173.i32[0] >= 0x17u)
    {
      if (v123 - 216 < 7) {
        goto LABEL_539;
      }
      if (v123 - 138 > 0x15)
      {
        id v33 = a7;
        __int16 v126 = self;
        BOOL v21 = a14;
      }
      else
      {
        id v33 = a7;
        __int16 v126 = self;
        BOOL v21 = a14;
        if (((1 << (v123 + 118)) & 0x200015) != 0) {
          goto LABEL_419;
        }
      }
      goto LABEL_540;
    }
    goto LABEL_537;
  }
  BOOL v21 = a14;
  if ((v121 & v265) == 1)
  {
    if (v29 < 4) {
      goto LABEL_607;
    }
    unint64_t v128 = 3;
    if (strncasecmp_l(&a3[v27 - 2], "'ed", 3uLL, 0))
    {
      unint64_t v128 = 3;
      long long v129 = self;
      if (strncasecmp_l(&a3[v27 - 2], "'er", 3uLL, 0))
      {
        unint64_t v128 = 3;
        if (strncasecmp_l(&a3[v27 - 2], "'ll", 3uLL, 0))
        {
          unint64_t v128 = 3;
          if (strncasecmp_l(&a3[v27 - 2], "'ve", 3uLL, 0))
          {
            a4 = (unint64_t)v280;
            if (v29 < 5)
            {
              unint64_t v29 = 4;
              goto LABEL_607;
            }
            BOOL v130 = strncasecmp_l(&a3[v27 - 3], "'ing", 4uLL, 0) == 0;
            unint64_t v128 = 4 * v130;
            goto LABEL_423;
          }
        }
      }
      BOOL v130 = 1;
    }
    else
    {
      BOOL v130 = 1;
      long long v129 = self;
    }
    a4 = (unint64_t)v280;
LABEL_423:
    if (v130 && v128 < v29)
    {
      HIBYTE(usedBufLenh) = a16;
      BYTE6(usedBufLenh) = a15;
      BYTE5(usedBufLenh) = a14;
      BYTE4(usedBufLenh) = 1;
      BYTE3(usedBufLenh) = a12;
      BYTE2(usedBufLenh) = a11;
      BYTE1(usedBufLenh) = a10;
      LOBYTE(usedBufLenh) = a9;
      BOOL v138 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](v129, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v27 - v128 + 1, a5, a6, a7, 1, usedBufLenh, a17 + 1);
      goto LABEL_426;
    }
    goto LABEL_607;
  }
  if (a17 < 4) {
    unsigned __int8 v134 = v34 ^ 1;
  }
  else {
    unsigned __int8 v134 = 0;
  }
  if ((v134 & (a12 && a13) & v264) == 1)
  {
    if (v29 >= 3)
    {
      unsigned int v135 = *a3 - 98;
      if (v135 <= 0xC && ((1 << v135) & 0x1865) != 0)
      {
        int v136 = a3[1];
        if ((v136 - 65) < 0x1A
          || (v136 - 192) < 0x17
          || (v136 - 216) < 7
          || (unsigned int v137 = v136 - 138, v137 <= 0x15) && ((1 << v137) & 0x200015) != 0)
        {
          BOOL v138 = [(AppleSpell *)self checkNameWordBuffer:a3 + 1 length:v27 languageObject:a5 globalOnly:0];
          goto LABEL_426;
        }
      }
    }
    goto LABEL_607;
  }
  if ((v121 & v263) == 1)
  {
    if (v29 >= 3 && a3[v27] == 115 && toLower(a3[v27 - 1]) != 115)
    {
      HIBYTE(usedBufLeng) = a16;
      BYTE6(usedBufLeng) = 0;
      WORD2(usedBufLeng) = 0;
      LODWORD(usedBufLeng) = 0x1000000;
      BOOL v138 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v27, a5, a6, a7, 0, usedBufLeng, a17 + 1);
      goto LABEL_426;
    }
    goto LABEL_607;
  }
  if (a17 >= 2) {
    unsigned __int8 v120 = 0;
  }
  if ((v120 & a13 & v262) == 1)
  {
    if (v29 < 4) {
      goto LABEL_607;
    }
    unint64_t v139 = 3;
    if (strncasecmp_l(&a3[v27 - 2], "'en", 3uLL, 0) && (unint64_t v139 = 3, strncasecmp_l(&a3[v27 - 2], "'er", 3uLL, 0)))
    {
      unint64_t v139 = 3;
      long long v140 = self;
      if (strncasecmp_l(&a3[v27 - 2], "'et", 3uLL, 0))
      {
        if (v29 < 5) {
          goto LABEL_418;
        }
        unint64_t v139 = 4;
        if (strncasecmp_l(&a3[v27 - 3], "'ens", 4uLL, 0))
        {
          unint64_t v139 = 4;
          if (strncasecmp_l(&a3[v27 - 3], "'ers", 4uLL, 0))
          {
            if (v29 < 6)
            {
              unint64_t v29 = 5;
              goto LABEL_604;
            }
            if (strncasecmp_l(&a3[v27 - 3], "'erne", 5uLL, 0))
            {
              if (v29 >= 7)
              {
                BOOL v141 = strncasecmp_l(&a3[v27 - 3], "'ernes", 5uLL, 0) == 0;
                unint64_t v139 = 4 * v141;
                goto LABEL_601;
              }
              unint64_t v29 = 6;
LABEL_604:
              id v33 = a7;
LABEL_605:
              a4 = (unint64_t)v280;
              goto LABEL_606;
            }
            BOOL v141 = 1;
            unint64_t v139 = 4;
LABEL_601:
            id v33 = a7;
            long long v140 = self;
            a4 = (unint64_t)v280;
            BOOL v21 = a14;
            if (!v141)
            {
LABEL_587:
              if ((v34 & 1) != 0 || v29 < 8) {
                goto LABEL_607;
              }
              unint64_t v194 = v27 - 3;
              unint64_t v195 = a17 + 1;
              uint64_t v196 = 4;
              do
              {
                BYTE6(usedBufLen) = a15;
                BYTE5(usedBufLen) = 0;
                *(_WORD *)((char *)&usedBufLen + 3) = 0;
                BYTE2(usedBufLen) = a11;
                LOWORD(usedBufLen) = __PAIR16__(a10, a9);
                LOBYTE(v34) = 0;
                if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", a3, v196, a5, a6, v33, 0, usedBufLen, v195))
                {
                  HIBYTE(usedBufLenn) = a16;
                  BYTE6(usedBufLenn) = a15;
                  BYTE5(usedBufLenn) = 0;
                  *(_WORD *)((char *)&usedBufLenn + 3) = 256;
                  BYTE2(usedBufLenn) = a11;
                  BYTE1(usedBufLenn) = a10;
                  LOBYTE(usedBufLenn) = a9;
                  LOBYTE(v34) = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", &a3[v196], v194, a5, a6, v33, 0, usedBufLenn, v195);
                }
                if (v34) {
                  break;
                }
                unint64_t v197 = v196 + 5;
                --v194;
                ++v196;
              }
              while (v197 <= v29);
              goto LABEL_605;
            }
LABEL_585:
            if (v139 < v29)
            {
              HIBYTE(usedBufLenm) = a16;
              BYTE6(usedBufLenm) = a15;
              BYTE5(usedBufLenm) = v21;
              BYTE4(usedBufLenm) = 1;
              BYTE3(usedBufLenm) = a12;
              BYTE2(usedBufLenm) = a11;
              BYTE1(usedBufLenm) = a10;
              LOBYTE(usedBufLenm) = a9;
              LOBYTE(v34) = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](v140, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v27 - v139 + 1, a5, a6, v33, 1, usedBufLenm, a17 + 1);
            }
            goto LABEL_587;
          }
        }
      }
    }
    else
    {
      long long v140 = self;
    }
    a4 = (unint64_t)v280;
    goto LABEL_585;
  }
  if ((v121 & v261) == 1)
  {
    if (v29 >= 4 && !strncasecmp_l(a3, "leg", 3uLL, 0))
    {
      __int16 v142 = a3 + 3;
      uint64_t v143 = v27 - 2;
      goto LABEL_525;
    }
    goto LABEL_607;
  }
  if ((v121 & v255) == 1)
  {
    uint64_t v144 = self;
    unint64_t v145 = [(AppleSpell *)self numberOfTurkishSuffixPointsInBuffer:a3 length:v27 + 1 maxSuffixPoints:36 suffixPoints:buffer];
    if (v145) {
      char v146 = v34;
    }
    else {
      char v146 = 1;
    }
    if (v146) {
      goto LABEL_419;
    }
    unint64_t v147 = v145;
    unint64_t v276 = a17 + 1;
    p_NSUInteger length = &buffer[0].length;
    unint64_t v149 = 1;
    while (2)
    {
      unint64_t v34 = *(p_length - 1);
      if (v34 >= v29) {
        goto LABEL_462;
      }
      int v150 = *(_DWORD *)p_length;
      if (*(_DWORD *)p_length == 2)
      {
        if (!a12) {
          goto LABEL_462;
        }
        BOOL v154 = [(AppleSpell *)v144 checkNameWordBuffer:a3 length:*(p_length - 1) languageObject:a5 globalOnly:1];
      }
      else
      {
        if (v150 != 1)
        {
          if (v150) {
            goto LABEL_462;
          }
          HIBYTE(usedBufLeni) = a16;
          BYTE6(usedBufLeni) = a15;
          WORD2(usedBufLeni) = 0;
          BYTE3(usedBufLeni) = a12;
          BYTE2(usedBufLeni) = a11;
          BYTE1(usedBufLeni) = a10;
          LOBYTE(usedBufLeni) = a9;
          if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](v144, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v34, a5, a6, v33, 0, usedBufLeni, v276))
          {
            if (v34 == 3)
            {
              if (!strncasecmp_l(a3, "her", 3uLL, 0)) {
                goto LABEL_462;
              }
            }
            else
            {
              if (v34 == 2)
              {
                long long v151 = a3;
                id v152 = "am";
                size_t v153 = 2;
LABEL_461:
                if (strncasecmp_l(v151, v152, v153, 0))
                {
LABEL_599:
                  LOBYTE(v34) = 1;
                  goto LABEL_419;
                }
LABEL_462:
                LOBYTE(v34) = 0;
LABEL_463:
                p_length += 2;
                BOOL v44 = v149++ >= v147;
                if (v44) {
                  goto LABEL_419;
                }
                continue;
              }
              if (v34 < 3) {
                goto LABEL_599;
              }
            }
            long long v151 = a3;
            id v152 = "sik";
            size_t v153 = 3;
            goto LABEL_461;
          }
          if (v34 < 2 || !isVowelTurkish(a3[v34])) {
            goto LABEL_462;
          }
          unint64_t v155 = v34 - 1;
          int v156 = a3[v34 - 1];
          if ((v156 & 0xFFFFFFDF) == 0x43)
          {
            char v157 = v156 - 124;
          }
          else
          {
            if ((v156 & 0xFFFFFFDF) == 0x42)
            {
              char v157 = v156 + 14;
              goto LABEL_472;
            }
            int v158 = v156 & 0xDF;
            BOOL v159 = v158 == 68;
            if (v158 == 68) {
              char v157 = v156 + 10;
            }
            else {
              char v157 = a3[v34 - 1];
            }
            if (!v159)
            {
              LOBYTE(v34) = 0;
              id v33 = a7;
              uint64_t v144 = self;
              goto LABEL_473;
            }
          }
LABEL_472:
          char v273 = a3[v34 - 1];
          a3[v155] = v157;
          HIBYTE(usedBufLenj) = a16;
          BYTE6(usedBufLenj) = a15;
          WORD2(usedBufLenj) = 0;
          BYTE3(usedBufLenj) = a12;
          BYTE2(usedBufLenj) = a11;
          BYTE1(usedBufLenj) = a10;
          LOBYTE(usedBufLenj) = a9;
          uint64_t v144 = self;
          id v33 = a7;
          LOBYTE(v34) = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v34, a5, a6, a7, 0, usedBufLenj, v276);
          a3[v155] = v273;
LABEL_473:
          BOOL v21 = a14;
          if (v34) {
            goto LABEL_419;
          }
          goto LABEL_463;
        }
        BOOL v154 = [(AppleSpell *)v144 checkWordBuffer:a3 length:*(p_length - 1) languageObject:a5 index:6];
      }
      break;
    }
    LOBYTE(v34) = v154;
    if (v154) {
      goto LABEL_419;
    }
    goto LABEL_463;
  }
  if (((v121 ^ 1 | v78) & 1) == 0)
  {
    long long v174 = off_2676F5000;
    if (!validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__koreanTokenizer)
    {
      CFLocaleRef v175 = CFLocaleCreate(0, @"ko");
      v289.NSUInteger location = 0;
      v289.NSUInteger length = 0;
      validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__koreanTokenizer = (uint64_t)CFStringTokenizerCreate(0, &stru_26C1C71A8, v289, 0, v175);
      CFLocaleRef v176 = v175;
      a4 = (unint64_t)v280;
      CFRelease(v176);
    }
    if (!a4) {
      a4 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v29, encoding, 0);
    }
    uint64_t v177 = (__CFString *)a4;
    uint64_t v178 = (__CFStringTokenizer *)validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__koreanTokenizer;
    v290.NSUInteger length = [(__CFString *)v177 length];
    v290.NSUInteger location = 0;
    CFStringTokenizerSetString(v178, v177, v290);
    v280 = v177;
    if (v177)
    {
      BOOL v277 = 1;
      do
      {
        Tokeuint64_t n = CFStringTokenizerAdvanceToNextToken((CFStringTokenizerRef)v174[396]);
        LOBYTE(v34) = Token == 0;
        if (!Token) {
          break;
        }
        char v180 = Token;
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)v174[396]);
        CFIndex v284 = 0;
        BOOL v182 = (v180 & 6) == 0 || CurrentTokenRange.length < 2;
        if (v182
          || (CFIndex CurrentSubTokens = CFStringTokenizerGetCurrentSubTokens((CFStringTokenizerRef)v174[396], buffer, 64, 0)) == 0)
        {
          buffer[0] = CurrentTokenRange;
          CFIndex CurrentSubTokens = 1;
        }
        int v183 = v277;
        if (v277)
        {
          id v33 = a7;
          if (CurrentSubTokens >= 1)
          {
            uint64_t v184 = &buffer[0].length;
            uint64_t v185 = 1;
            while (1)
            {
              CFIndex v186 = *v184;
              if (*v184 >= 1)
              {
                unint64_t v187 = *(v184 - 1);
                unint64_t v188 = v186 + v187;
                if (v186 + v187 > [(__CFString *)v280 length]) {
                  goto LABEL_575;
                }
                unint64_t v189 = -[__CFString rangeOfCharacterFromSet:options:range:](v280, "rangeOfCharacterFromSet:options:range:", validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__nonDigitCharacterSet, 0, v187, v186);
                if (v190) {
                  BOOL v191 = v189 > v187;
                }
                else {
                  BOOL v191 = 0;
                }
                if (v191 && v188 >= v189)
                {
                  unint64_t v187 = v189;
                  CFIndex v186 = v188 - v189;
                }
                if (!v187 && ![(__CFString *)v280 length])
                {
                  LOBYTE(v34) = 0;
                  id v33 = a7;
                  BOOL v21 = a14;
                  long long v174 = off_2676F5000;
                  goto LABEL_597;
                }
                if (v186 >= 1 && v187 + v186 <= [(__CFString *)v280 length])
                {
                  v288.NSUInteger location = v187;
                  v288.NSUInteger length = v186;
                  id v33 = a7;
                  if (v186 == CFStringGetBytes(v280, v288, encoding, 0x5Fu, 0, (UInt8 *)v286, 72, &v284))
                  {
                    HIBYTE(usedBufLenl) = a16;
                    BYTE6(usedBufLenl) = a15;
                    BYTE5(usedBufLenl) = a14;
                    *(_WORD *)((char *)&usedBufLenl + 3) = a12;
                    BYTE2(usedBufLenl) = a11;
                    BYTE1(usedBufLenl) = a10;
                    LOBYTE(usedBufLenl) = a9;
                    BOOL v277 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", v286, v284, a5, a6, a7, 1, usedBufLenl, a17 + 1);
                  }
                }
                else
                {
LABEL_575:
                  id v33 = a7;
                }
              }
              int v183 = v277;
              if (v277)
              {
                v184 += 2;
                BOOL v109 = v185++ < CurrentSubTokens;
                if (v109) {
                  continue;
                }
              }
              break;
            }
          }
        }
        else
        {
          id v33 = a7;
        }
        BOOL v21 = a14;
        long long v174 = off_2676F5000;
      }
      while (v183);
    }
    else
    {
      LOBYTE(v34) = 1;
    }
LABEL_597:
    v291.NSUInteger location = 0;
    v291.NSUInteger length = 0;
    CFStringTokenizerSetString((CFStringTokenizerRef)v174[396], &stru_26C1C71A8, v291);
    goto LABEL_419;
  }
  if ((v121 & (v260 | v259 | v258)) != 1) {
    goto LABEL_607;
  }
  unint64_t v160 = 0;
  while (2)
  {
    int v161 = a3[v160];
    if (v160 + 2 >= v29 || v161 != 224) {
      goto LABEL_489;
    }
    BOOL v162 = a3[v160 + 1] - 165 > 0xC || ((1 << (a3[v160 + 1] + 91)) & 0x1011) == 0;
    if (v162 || (a3[v160 + 2] + 90) >= 0xAu)
    {
      int v161 = 224;
LABEL_489:
      if ((v161 - 48) >= 0xA) {
        uint64_t v163 = v160;
      }
      else {
        uint64_t v163 = 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_492;
    }
    uint64_t v163 = 0x7FFFFFFFFFFFFFFFLL;
    v160 += 2;
LABEL_492:
    ++v160;
    if (v163 == 0x7FFFFFFFFFFFFFFFLL && v160 < v29) {
      continue;
    }
    break;
  }
  unint64_t v165 = 0;
  int v166 = &a3[v27];
  do
  {
    if (v27 - v165 < 2
      || v166[-v165 - 2] != 224
      || (v166[~v165] - 165 <= 0xC
        ? (BOOL v167 = ((1 << (v166[~v165] + 91)) & 0x1011) == 0)
        : (BOOL v167 = 1),
          v167 || (v166[-v165] + 90) > 9u))
    {
      if (v166[-v165] - 48 >= 0xA) {
        uint64_t v168 = v165;
      }
      else {
        uint64_t v168 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      v165 += 2;
      uint64_t v168 = 0x7FFFFFFFFFFFFFFFLL;
    }
    ++v165;
  }
  while (v168 == 0x7FFFFFFFFFFFFFFFLL && v165 < v29);
  if (v168 + v163 < v29 && v163 != 0x7FFFFFFFFFFFFFFFLL && v168 != 0x7FFFFFFFFFFFFFFFLL && (v168 | v163) != 0)
  {
    __int16 v142 = &a3[v163];
    uint64_t v143 = v27 - (v163 + v168) + 1;
LABEL_525:
    HIBYTE(usedBufLenk) = a16;
    BYTE6(usedBufLenk) = a15;
    BYTE5(usedBufLenk) = a14;
    BYTE4(usedBufLenk) = 1;
    BYTE3(usedBufLenk) = a12;
    BYTE2(usedBufLenk) = a11;
    BYTE1(usedBufLenk) = a10;
    LOBYTE(usedBufLenk) = a9;
    BOOL v138 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", v142, v143, a5, a6, a7, 1, usedBufLenk, a17 + 1);
LABEL_426:
    LOBYTE(v34) = v138;
  }
LABEL_607:
  char v198 = a17 > 7 || !v21;
  if ((v34 & 1) != 0 || (v198 & 1) != 0 || (encoding & 0xFFFFFFFB) != 0x500 || !v29) {
    goto LABEL_685;
  }
  char v199 = 0;
  char v200 = 0;
  unint64_t v201 = 0;
  while (2)
  {
    unsigned int v202 = a3[v201];
    unsigned int v203 = v202 - 216;
    if (v202 - 192 >= 0x17)
    {
      BOOL v204 = v202 <= 0xF7 && v203 >= 0x1F;
      if (v204 && (v202 & 0xFFFFFFDF) - 65 >= 0x1A && (v202 - 138 > 0x15 || ((1 << (v202 + 118)) & 0x350015) == 0))
      {
        if (v202 - 48 < 0xA || v202 - 178 <= 7 && ((1 << (v202 + 78)) & 0x83) != 0 || v202 - 188 <= 2)
        {
          char v200 = 0;
          if ((v201 == 0) | v199 & 1) {
            unint64_t v211 = 0;
          }
          else {
            unint64_t v211 = v201;
          }
          char v199 = 1;
          goto LABEL_642;
        }
        goto LABEL_676;
      }
    }
    BOOL v207 = v202 - 65 >= 0x1A && v202 - 192 >= 0x17;
    if (!v207
      || v203 < 7
      || ((v208 = v202 - 138, BOOL v109 = v208 > 0x15, v209 = (1 << v208) & 0x200015, !v109)
        ? (BOOL v210 = v209 == 0)
        : (BOOL v210 = 1),
          !v210))
    {
      char v199 = 0;
      if ((v201 == 0) | v200 & 1) {
        unint64_t v211 = 0;
      }
      else {
        unint64_t v211 = v201;
      }
      char v200 = 1;
      goto LABEL_642;
    }
    if (((v201 != 0) & v199) != 0)
    {
      unint64_t v211 = v201;
      goto LABEL_680;
    }
    if (v201 < 3 || (v200 & 1) == 0)
    {
      if (v201 == 2 && (v200 & 1) != 0)
      {
        int v212 = *a3;
        if ((v212 - 65) >= 0x1A && (v212 - 192) >= 0x17 && (v212 - 216) >= 7)
        {
          char v200 = 0;
          unsigned int v213 = v212 - 138;
          if (v213 > 0x15)
          {
LABEL_677:
            unint64_t v211 = 1;
            char v199 = 0;
            goto LABEL_642;
          }
          int v214 = 1 << v213;
          unint64_t v211 = 1;
          char v199 = 0;
          if ((v214 & 0x200015) == 0)
          {
LABEL_642:
            if (v211) {
              goto LABEL_680;
            }
            if (++v201 >= v29) {
              goto LABEL_680;
            }
            continue;
          }
        }
        if (v29 >= 4)
        {
          uint64_t v215 = 3;
          while (1)
          {
            int v216 = a3[v215];
            char v200 = 0;
            if ((v216 - 65) < 0x1A || (v216 - 192) < 0x17) {
              break;
            }
            if ((v216 - 216) < 7) {
              goto LABEL_677;
            }
            unsigned int v218 = v216 - 138;
            BOOL v109 = v218 > 0x15;
            int v219 = (1 << v218) & 0x200015;
            BOOL v220 = v109 || v219 == 0;
            unint64_t v211 = 1;
            char v199 = 0;
            if (v220)
            {
              unint64_t v211 = 0;
              char v200 = 0;
              char v199 = 0;
              if (++v215 < v29) {
                continue;
              }
            }
            goto LABEL_642;
          }
          char v199 = 0;
          unint64_t v211 = 1;
          goto LABEL_642;
        }
      }
LABEL_676:
      unint64_t v211 = 0;
      char v200 = 0;
      char v199 = 0;
      goto LABEL_642;
    }
    break;
  }
  unint64_t v211 = v201 - 1;
LABEL_680:
  if (v211 && v29 > v211)
  {
    unint64_t v221 = a4;
    HIBYTE(usedBufLeno) = a16;
    BYTE6(usedBufLeno) = a15;
    WORD2(usedBufLeno) = a13;
    int v222 = 1;
    WORD1(usedBufLeno) = a11;
    BYTE1(usedBufLeno) = a10;
    LOBYTE(usedBufLeno) = a9;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v211, a5, a6, v33, 1, usedBufLeno, a17 + 1))
    {
      HIBYTE(usedBufLenp) = a16;
      BYTE6(usedBufLenp) = a15;
      BYTE5(usedBufLenp) = 1;
      BYTE4(usedBufLenp) = a13;
      WORD1(usedBufLenp) = a11;
      BYTE1(usedBufLenp) = a10;
      LOBYTE(usedBufLenp) = a9;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", &a3[v211], v29 - v211, a5, a6, v33, 1, usedBufLenp, a17 + 1))
      {
        goto LABEL_687;
      }
    }
LABEL_698:
    LOBYTE(v222) = 0;
    if (encoding == 1280) {
      char v225 = v198;
    }
    else {
      char v225 = 1;
    }
    if ((v225 & 1) == 0 && v29)
    {
      char v226 = 0;
      for (unint64_t k = 0; k < v29; ++k)
      {
        unint64_t v228 = 0;
        if (k >= 3 && (v226 & 1) != 0)
        {
          if (a3[k] != 105 || k + 6 > v29)
          {
            unint64_t v228 = 0;
          }
          else if (!strncmp(&a3[k], "iCloud", 6uLL))
          {
            unint64_t v228 = k;
          }
          else
          {
            unint64_t v228 = 0;
          }
        }
        unsigned int v230 = a3[k];
        BOOL v231 = (v230 + 102) <= 4u && (v230 & 1) == 0;
        char v226 = v230 > 0xF7 || v230 - 97 < 0x1A || v230 - 223 < 0x18 || v231;
        if (v228) {
          break;
        }
      }
      LOBYTE(v222) = 0;
      if (v228)
      {
        if (v29 > v228)
        {
          HIBYTE(usedBufLenq) = a16;
          BYTE6(usedBufLenq) = a15;
          WORD2(usedBufLenq) = a13;
          WORD1(usedBufLenq) = a11;
          BYTE1(usedBufLenq) = a10;
          LOBYTE(usedBufLenq) = a9;
          LOBYTE(v222) = 0;
          if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, v228, a5, a6, v33, 1, usedBufLenq, a17 + 1))
          {
            HIBYTE(usedBufLenr) = a16;
            BYTE6(usedBufLenr) = a15;
            BYTE5(usedBufLenr) = 1;
            BYTE4(usedBufLenr) = a13;
            WORD1(usedBufLenr) = a11;
            BYTE1(usedBufLenr) = a10;
            LOBYTE(usedBufLenr) = a9;
            int v222 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", &a3[v228], v29 - v228, a5, a6, v33, 1, usedBufLenr, a17 + 1);
            goto LABEL_687;
          }
        }
      }
    }
    return v222;
  }
LABEL_685:
  unint64_t v221 = a4;
  if ((v34 & 1) == 0) {
    goto LABEL_698;
  }
  int v222 = 1;
LABEL_687:
  if (((v222 ^ 1 | v278) & 1) == 0)
  {
    BOOL v223 = [(AppleSpell *)self checkWordBuffer:a3 length:v29 languageObject:a5 index:1];
    LOBYTE(v222) = !v223;
    if (v223)
    {
      int v224 = v267;
    }
    else
    {
      int v224 = v267;
      if (encoding == 1280
        && (!strncmp(a3, "imac", 4uLL)
         || !strncmp(a3, "ipod", 4uLL)
         || !strncmp(a3, "ipad", 4uLL)
         || !strncmp(a3, "ibook", 5uLL)
         || !strncmp(a3, "iphone", 6uLL)
         || !strncmp(a3, "itunes", 6uLL)
         || !strncmp(a3, "icloud", 6uLL)))
      {
        LOBYTE(v222) = 0;
      }
    }
    if (((v224 | !v269) & 1) == 0 && (v222 & 1) == 0)
    {
      CFStringRef v234 = (const __CFString *)v221;
      if (v221
        || (CFStringRef v234 = (id)CFStringCreateWithBytes(0, (const UInt8 *)a3, v29, encoding, 0)) != 0)
      {
        LOBYTE(v222) = [v33 isWordInUserDictionaries:v234 caseSensitive:0];
      }
      else
      {
        LOBYTE(v222) = 0;
      }
    }
  }
  return v222;
}

id __195__AppleSpell_Spelling__validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth___block_invoke()
{
  uint64_t v0 = (void *)[MEMORY[0x263F089C0] decimalDigitCharacterSet];
  objc_msgSend(v0, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x263F08708], "punctuationCharacterSet"));
  [v0 invert];
  validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__nonDigitOrPunctuationCharacterSet = [v0 copy];
  validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__nonDigitCharacterSet = (uint64_t)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "decimalDigitCharacterSet"), "invertedSet");
  id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "punctuationCharacterSet"), "invertedSet");
  validateWordBuffer_length_languageObject_connection_sender_checkBase_checkDict_checkTemp_checkUser_checkNames_checkHyphens_checkIntercaps_checkOptions_forCorrection_depth__nonPunctuationCharacterSet = (uint64_t)result;
  return result;
}

- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkBase:(BOOL)a8 checkDict:(BOOL)a9 checkTemp:(BOOL)a10 checkUser:(BOOL)a11 checkNames:(BOOL)a12 checkHyphens:(BOOL)a13 checkIntercaps:(BOOL)a14 checkOptions:(BOOL)a15 depth:(unint64_t)a16
{
  return -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:forCorrection:depth:", a3, a4, a5, a6, a7, a8);
}

- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkBase:(BOOL)a8 checkDict:(BOOL)a9 checkTemp:(BOOL)a10 checkNames:(BOOL)a11 checkHyphens:(BOOL)a12 checkIntercaps:(BOOL)a13 checkOptions:(BOOL)a14 depth:(unint64_t)a15
{
  return -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", a3, a4, a5, a6, a7);
}

- (BOOL)validateWordBuffer:(char *)a3 length:(unint64_t)a4 languageObject:(id)a5 connection:(_PR_DB_IO *)a6 sender:(id)a7 checkBase:(BOOL)a8 checkDict:(BOOL)a9 checkNames:(BOOL)a10 checkHyphens:(BOOL)a11 checkIntercaps:(BOOL)a12 checkOptions:(BOOL)a13 depth:(unint64_t)a14
{
  return -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", a3, a4, a5, a6, a7);
}

- (id)_orthographyByModifyingOrthography:(id)a3 withLatinLanguage:(id)a4
{
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:", objc_msgSend(a3, "languageMap"));
  objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", a4), @"Latn");
  uint64_t v7 = (void *)MEMORY[0x263F08A58];
  uint64_t v8 = [a3 dominantScript];
  return (id)[v7 orthographyWithDominantScript:v8 languageMap:v6];
}

- (id)normalizedStringInString:(id)a3 range:(_NSRange)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(a3, "substringWithRange:", a4.location, a4.length);
  if (normalizedStringInString_range__onceToken != -1) {
    dispatch_once(&normalizedStringInString_range__onceToken, &__block_literal_global_117);
  }
  [v4 rangeOfCharacterFromSet:normalizedStringInString_range__allSet];
  if (v5)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F089D8] stringWithString:v4];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = (void *)normalizedStringInString_range__sets;
    uint64_t v7 = [(id)normalizedStringInString_range__sets countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned __int8 v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v12 = [(id)normalizedStringInString_range__sets objectForKey:v11];
          if ([v4 length])
          {
            unint64_t v13 = 0;
            do
            {
              uint64_t v14 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v12, 0, v13, objc_msgSend(v4, "length") - v13);
              if (!v15) {
                break;
              }
              uint64_t v16 = v14;
              objc_msgSend(v4, "replaceCharactersInRange:withString:", v14, v15, v11);
              unint64_t v13 = [v11 length] + v16;
            }
            while (v13 < [v4 length]);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
  }
  return v4;
}

id __55__AppleSpell_Spelling__normalizedStringInString_range___block_invoke()
{
  v4[5] = *MEMORY[0x263EF8340];
  v4[0] = @"            ";
  v4[1] = @"‘’‚‛′";
  v4[2] = @"“”„‟″";
  v4[3] = @"·․‧";
  v4[4] = @"‐‑‒–—";
  uint64_t v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v4, 5), "componentsJoinedByString:", &stru_26C1C71A8);
  v3[0] = objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @"            ", @" ");
  v2[1] = @"'";
  v3[1] = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"‘’‚‛′"];
  v2[2] = @"\"";
  v3[2] = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"“”„‟″"];
  v2[3] = @".";
  v3[3] = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"·․‧"];
  void v2[4] = @"-";
  v3[4] = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"‐‑‒–—"];
  normalizedStringInString_range__sets = (uint64_t)(id)[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:5];
  id result = (id)[MEMORY[0x263F08708] characterSetWithCharactersInString:v0];
  normalizedStringInString_range__allSet = (uint64_t)result;
  return result;
}

- (_NSRange)spellServer:(id)a3 findMisspelledWordInString:(id)a4 range:(_NSRange)a5 languages:(id)a6 topLanguages:(id)a7 orthography:(id)a8 checkOrthography:(BOOL)a9 mutableResults:(id)a10 offset:(unint64_t)a11 autocorrect:(BOOL)a12 onlyAtInsertionPoint:(BOOL)a13 initialCapitalize:(BOOL)a14 autocapitalize:(BOOL)a15 keyEventArray:(id)a16 appIdentifier:(id)a17 selectedRangeValue:(id)a18 parameterBundles:(id)a19 wordCount:(int64_t *)a20 countOnly:(BOOL)a21 appendCorrectionLanguage:(BOOL)a22 correction:(id *)a23
{
  NSUInteger range1 = a5.length;
  v313[0] = a5.location;
  v345[9] = *MEMORY[0x263EF8340];
  id v276 = objc_alloc_init(MEMORY[0x263F086B0]);
  unint64_t v310 = [a4 length];
  unint64_t v27 = [a6 count];
  unint64_t v273 = [a7 count];
  uint64_t v336 = 0;
  if (v27) {
    int v28 = (__CFString *)[a6 objectAtIndex:0];
  }
  else {
    int v28 = @"en";
  }
  CFStringRef theString = (__CFString *)a4;
  int v267 = v28;
  id v29 = +[PRLanguage languageObjectWithIdentifier:v28];
  signed int v30 = [v29 encoding];
  numCFIndex Bytes = 0;
  uint64_t v334 = 0;
  long long v332 = 0u;
  long long v333 = 0u;
  long long v330 = 0u;
  long long v331 = 0u;
  long long v328 = 0u;
  long long v329 = 0u;
  long long v326 = 0u;
  long long v327 = 0u;
  long long v324 = 0u;
  long long v325 = 0u;
  *(_OWORD *)v323 = 0u;
  memset(&v339[22], 0, 40);
  memset(&v339[16], 0, 40);
  v304 = self;
  if ([a17 isEqualToString:@"com.apple.mail"]) {
    int v31 = 1;
  }
  else {
    int v31 = [a17 hasPrefix:@"com.apple.iWork"];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __329__AppleSpell_Spelling__spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction___block_invoke;
  block[3] = &unk_2640EF4B0;
  block[4] = v304;
  if (spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__onceToken != -1) {
    dispatch_once(&spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__onceToken, block);
  }
  uint64_t v32 = 0;
  int64x2_t v33 = vdupq_n_s64(v313[0]);
  long long v34 = 0uLL;
  do
  {
    BOOL v35 = (double *)((char *)&v340 + v32);
    vst2q_f64(v35, *(float64x2x2_t *)v33.i8);
    v32 += 32;
  }
  while (v32 != 64);
  uint64_t v36 = 0;
  uint64_t v37 = 24;
  if (v30 == 134217984) {
    uint64_t v37 = 48;
  }
  maxBufLeuint64_t n = v37;
  BOOL v308 = a10 != 0;
  if (a10 && v27 >= 2 && a9) {
    uint64_t v36 = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", 8 * v27 + 8), "mutableBytes");
  }
  v306 = (void *)v36;
  v297 = v29;
  if (a21)
  {
    uint64_t v295 = 0;
    uint64_t v38 = 0;
    int v272 = 0;
    BOOL v39 = 0;
    uint64_t v40 = 0;
  }
  else
  {
    uint64_t v295 = [(AppleSpell *)v304 databaseConnectionForLanguageObject:v29];
    BOOL v39 = objc_msgSend(-[AppleSpell localDictionaryArrayForLanguageObject:](v304, "localDictionaryArrayForLanguageObject:", v29), "count") != 0;
    uint64_t v41 = -[AppleSpell taggerForLanguageObject:string:range:](v304, "taggerForLanguageObject:string:range:", v29, a4, v313[0], range1);
    uint64_t v40 = v41;
    if (a12 && v41) {
      [(AppleSpell *)v304 useWordLanguageModelForLanguageObject:v29 tagger:v41 appIdentifier:a17];
    }
    if (a10)
    {
      uint64_t v281 = 0;
      if (v27 > 1)
      {
        int v272 = 0;
        uint64_t v38 = 0;
      }
      else
      {
        int v272 = 0;
        uint64_t v38 = 0;
        if (a12)
        {
          if ([a7 count])
          {
            int v309 = v31;
            uint64_t v38 = [a7 firstObject];
            id v42 = +[PRLanguage languageObjectWithIdentifier:v38];
            if (([v42 isEqual:v297] & 1) != 0
              || (uint64_t v43 = -[AppleSpell taggerForLanguageObject:string:range:](v304, "taggerForLanguageObject:string:range:", v42, theString, v313[0], range1)) == 0)
            {
              uint64_t v281 = 0;
              int v272 = 0;
              uint64_t v38 = 0;
            }
            else
            {
              int v272 = v42;
              uint64_t v281 = v43;
              -[AppleSpell useWordLanguageModelForLanguageObject:tagger:appIdentifier:](v304, "useWordLanguageModelForLanguageObject:tagger:appIdentifier:", v42);
            }
            int v31 = v309;
          }
          else
          {
            uint64_t v281 = 0;
            int v272 = 0;
            uint64_t v38 = 0;
          }
        }
      }
      id v280 = 0;
      BOOL v308 = 1;
      if (a18 && !a13)
      {
        BYTE2(usedBufLen) = a15;
        BYTE1(usedBufLen) = a14;
        LOBYTE(usedBufLen) = a12;
        id v280 = +[PRTypologyRecord openTypologyRecordWithString:range:languageObject:languages:topLanguages:autocorrect:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:](PRTypologyRecord, "openTypologyRecordWithString:range:languageObject:languages:topLanguages:autocorrect:initialCapitalize:autocapitalize:keyEventArray:appIdentifier:selectedRangeValue:", theString, v313[0], range1, v297, a6, a7, usedBufLen, a16, a17, a18);
        BOOL v308 = 1;
      }
      goto LABEL_31;
    }
    BOOL v308 = 0;
    uint64_t v38 = 0;
    int v272 = 0;
  }
  id v280 = 0;
  uint64_t v281 = 0;
LABEL_31:
  uint64_t v282 = v40;
  NSUInteger v44 = 0x7FFFFFFFFFFFFFFFLL;
  id v283 = a6;
  if (!theString || !v310)
  {
    int64_t v307 = -1;
    NSUInteger range2 = 0;
    v285 = 0;
    size_t v301 = 0;
    uint64_t v277 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_570;
  }
  if (!range1)
  {
    int64_t v307 = -1;
    NSUInteger range2 = 0;
    v285 = 0;
    size_t v301 = 0;
    uint64_t v277 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_570;
  }
  *(void *)&long long v331 = theString;
  *((void *)&v332 + 1) = v313[0];
  *(void *)&long long v333 = range1;
  *((void *)&v331 + 1) = CFStringGetCharactersPtr(theString);
  id v266 = a7;
  uint64_t v264 = v38;
  if (*((void *)&v331 + 1)) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
  }
  size_t v301 = 0;
  size_t v46 = 0;
  NSUInteger range2 = 0;
  int64_t v307 = 0;
  uint64_t v265 = 0;
  unint64_t v274 = 0;
  v285 = 0;
  unint64_t v47 = 0;
  BOOL v299 = 0;
  BOOL v48 = v30 != -1 && v39;
  BOOL v275 = v48;
  int v263 = v31 ^ 1;
  uint64_t v49 = 1;
  if (v27 + 1 > 1) {
    uint64_t v49 = v27 + 1;
  }
  uint64_t v269 = 8 * v49;
  uint64_t v334 = 0;
  *(void *)&long long v332 = CStringPtr;
  *((void *)&v333 + 1) = 0;
  uint64_t v277 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v50 = v313[0];
  unint64_t v51 = v313[0];
  NSUInteger v44 = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v52 = theString;
  signed int v294 = v30;
  unint64_t v300 = v27;
  do
  {
    NSUInteger v53 = v44;
    uint64_t v54 = simpleTokenRangeAfterIndex(v323, v313[0], range1, v50 + v47);
    if (v55 < 1)
    {
      NSUInteger v44 = v53;
      break;
    }
    unint64_t v50 = v54;
    unint64_t v47 = v55;
    unint64_t v56 = v54 - 1;
    if (v54 < 1)
    {
      unsigned int v64 = 0;
    }
    else
    {
      int v57 = [(__CFString *)v52 characterAtIndex:v56];
      unsigned int v58 = v57 - 39;
      BOOL v59 = v57 != 39 && (v57 - 45) >= 2;
      BOOL v60 = !v59 || v57 == 64;
      unsigned int v64 = v60 || v57 == 95 || (v57 & 0xFFFE) == 8208 || v57 == 8217;
      if (v58 <= 0x38 && ((1 << v58) & 0x1000000020000C1) != 0
        || (v57 - 8208) <= 9 && ((1 << (v57 - 16)) & 0x203) != 0)
      {
        ++v47;
        unint64_t v50 = v56;
      }
    }
    unint64_t v65 = v47 + v50;
    if (v47 + v50 < v310)
    {
      while (1)
      {
        int v66 = [(__CFString *)v52 characterAtIndex:v65];
        int v67 = v66;
        unsigned int v68 = v66 - 39;
        if (((v66 - 39) > 0x39 || ((1 << v68) & 0x3000000021800E1) == 0)
          && ((v66 - 8208) > 9 || ((1 << (v66 - 16)) & 0x203) == 0)
          && v66 != 180)
        {
          break;
        }
        uint64_t v69 = simpleTokenRangeAfterIndex(v323, v313[0], range1, v65);
        if (v70 < 1 || v69 != v65 + 1 || (unint64_t v65 = v69 + v70, v69 + v70 > v50 + maxBufLen))
        {
          uint64_t v72 = v306;
          NSUInteger v44 = v53;
          if (v68 <= 0x38 && ((1 << v68) & 0x1000000020000C1) != 0
            || (int v71 = 0, (v67 - 8208) <= 9) && ((1 << (v67 - 16)) & 0x203) != 0)
          {
            ++v47;
            int v71 = 1;
          }
          BOOL v52 = theString;
          signed int v30 = v294;
          goto LABEL_91;
        }
        unint64_t v47 = v65 - v50;
        BOOL v52 = theString;
        if (v65 >= v310)
        {
          int v71 = 0;
LABEL_82:
          signed int v30 = v294;
          goto LABEL_84;
        }
      }
      int v71 = 0;
      BOOL v52 = theString;
      goto LABEL_82;
    }
    int v71 = 0;
LABEL_84:
    uint64_t v72 = v306;
    NSUInteger v44 = v53;
LABEL_91:
    if (a21)
    {
      size_t v73 = v46;
      unint64_t v74 = v51;
      unint64_t v27 = v300;
      goto LABEL_565;
    }
    if (v47 > 1) {
      uint64_t v75 = v64;
    }
    else {
      uint64_t v75 = 0;
    }
    size_t v76 = v47 - v75;
    obuint64_t j = v75;
    uint64_t v289 = v47 - v75;
    unint64_t v77 = v50 + v75;
    unsigned int v292 = v71;
    if (v47 - v75 > 1) {
      int v78 = v71;
    }
    else {
      int v78 = 0;
    }
    if (v78 == 1) {
      size_t v79 = v76 - (v77 + v76 == v47 + v50);
    }
    else {
      size_t v79 = v76;
    }
    size_t v305 = v79;
    if (v308)
    {
      unint64_t v27 = v300;
      if (v50 < v44 || v50 - v44 >= range2)
      {
        if (v72)
        {
          v351.NSUInteger location = v44;
          v346.NSUInteger location = v313[0];
          v346.NSUInteger length = range1;
          v351.NSUInteger length = range2;
          NSRange v80 = NSIntersectionRange(v346, v351);
          CFIndex v81 = v306;
          if (v80.length && v306[v300] && v300)
          {
            for (unint64_t i = 0; i < v300; ++i)
            {
              unint64_t v83 = v81[i];
              if (v83 >= 2 && v81[v300] <= 2 * v83)
              {
                uint64_t v84 = [v283 objectAtIndex:i];
                CFIndex v81 = v306;
                if (v84) {
                  break;
                }
              }
              else
              {
                uint64_t v84 = 0;
              }
            }
            BOOL v52 = theString;
            if (v84)
            {
              uint64_t v85 = -[AppleSpell _orthographyByModifyingOrthography:withLatinLanguage:](v304, "_orthographyByModifyingOrthography:withLatinLanguage:", a8);
              id v86 = objc_alloc(MEMORY[0x263F08A60]);
              uint64_t v87 = v85;
              BOOL v52 = theString;
              unsigned int v88 = objc_msgSend(v86, "initWithRange:orthography:", v80.location + a11, v80.length, v87);
              [a10 addObject:v88];

              CFIndex v81 = v306;
            }
          }
          bzero(v81, v269);
          signed int v30 = v294;
        }
        NSUInteger v44 = -[__CFString paragraphRangeForRange:](v52, "paragraphRangeForRange:", v50, v47);
        NSUInteger range2 = v89;
        uint64_t v90 = 0;
        if (v51 < v44) {
          size_t v46 = 0;
        }
        do
        {
          if (*(void *)((char *)&v340 + v90) < v44)
          {
            uint64_t v91 = (NSUInteger *)((char *)&v340 + v90);
            *uint64_t v91 = v44;
            v91[1] = 0;
          }
          v90 += 16;
        }
        while (v90 != 64);
        if (v51 <= v44) {
          unint64_t v51 = v44;
        }
        uint64_t v72 = v306;
      }
    }
    else
    {
      unint64_t v27 = v300;
    }
    if (v72) {
      ++v72[v27];
    }
    if (!v308 || !a14 || v299)
    {
      unint64_t v74 = v77;
LABEL_132:
      unsigned int v93 = 0;
      goto LABEL_138;
    }
    unint64_t v92 = v51 + v46;
    unint64_t v74 = v77;
    if (v77 < v51 + v46) {
      goto LABEL_132;
    }
    unint64_t v94 = v44;
    NSUInteger v95 = v44;
    if (v92 == v44) {
      goto LABEL_134;
    }
    if (v74 == v92) {
      goto LABEL_136;
    }
    uint64_t v122 = -[__CFString rangeOfCharacterFromSet:options:range:](v52, "rangeOfCharacterFromSet:options:range:", spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__terminatorCharacterSet, 0);
    unsigned int v93 = 0;
    if (v122 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_137;
    }
    unint64_t v94 = v122;
    NSUInteger v44 = v95;
    if (v123)
    {
      if (v74 <= v94 + v123) {
        goto LABEL_132;
      }
      uint64_t v124 = -[__CFString rangeOfCharacterFromSet:options:range:](v52, "rangeOfCharacterFromSet:options:range:", spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__nonPunctuationCharacterSet, 0, v94 + v123, v74 - (v94 + v123));
      unsigned int v93 = 0;
      if (v124 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_137;
      }
      uint64_t v126 = v124;
      NSUInteger v44 = v95;
      if (v125)
      {
        uint64_t v127 = spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__whitespaceCharacterSet;
        uint64_t v128 = [(__CFString *)theString characterAtIndex:v126];
        long long v129 = (void *)v127;
        BOOL v52 = theString;
        if ([v129 characterIsMember:v128]) {
LABEL_134:
        }
          unsigned int v93 = treatWordAsSentenceInitial(v52, v94, v74, v305, v297);
        else {
LABEL_136:
        }
          unsigned int v93 = 0;
LABEL_137:
        NSUInteger v44 = v95;
      }
    }
LABEL_138:
    long long v96 = v342;
    long long v97 = v341;
    long long v341 = v340;
    long long v342 = v97;
    long long v343 = v96;
    *(void *)&long long v340 = v51;
    *((void *)&v340 + 1) = v46;
    if (v295)
    {
      size_t v73 = v305;
      if (v30 == -1)
      {
        BOOL v299 = 0;
        goto LABEL_565;
      }
    }
    else
    {
      size_t v73 = v305;
      if (!v275)
      {
        BOOL v299 = 0;
        uint64_t v295 = 0;
        goto LABEL_565;
      }
    }
    unsigned int v284 = v93;
    NSUInteger v290 = v44;
    unsigned int v98 = -[AppleSpell normalizedStringInString:range:](v304, "normalizedStringInString:range:", v52, v50, v47);
    uint64_t v99 = [(__CFString *)v98 length];
    v349.NSUInteger length = [(__CFString *)v98 length];
    v349.NSUInteger location = 0;
    if (v99 != CFStringGetBytes(v98, v349, v30, 0x5Fu, 0, buffer, maxBufLen, &numBytes))
    {
      BOOL v299 = 0;
      BOOL v52 = theString;
      goto LABEL_564;
    }
    if (v30 > 1279)
    {
      BOOL v52 = theString;
      if (v30 != 1280 && v30 != 1284)
      {
LABEL_248:
        int v270 = 0;
        unint64_t v100 = numBytes;
        if (!numBytes) {
          goto LABEL_249;
        }
        goto LABEL_228;
      }
    }
    else
    {
      BOOL v52 = theString;
      if (v30 != 514 && v30 != 517) {
        goto LABEL_248;
      }
    }
    unint64_t v100 = numBytes;
    if (numBytes)
    {
      unint64_t v101 = 0;
      char v102 = 0;
      uint64_t v103 = -1;
      int v104 = v345;
      while (1)
      {
        unint64_t v105 = v101;
        UInt8 v106 = buffer[v101];
        if ((v106 & 0xFC) == 0x28
          || ((int v107 = buffer[v101], v106 - 35 <= 0x3B)
            ? (BOOL v108 = ((1 << (v106 - 35)) & 0xF0000003E00000FLL) == 0)
            : (BOOL v108 = 1),
              !v108
           || ((v107 - 123) <= 0x25
             ? (BOOL v109 = ((1 << (v107 - 123)) & 0x201000041FLL) == 0)
             : (BOOL v109 = 1),
               v109 ? (BOOL v110 = v107 == 0) : (BOOL v110 = 1),
               v110)))
        {
          UInt8 v106 = 32;
          buffer[v105] = 32;
        }
        if ((v30 | 4) == 0x504) {
          break;
        }
        if (v30 == 514)
        {
          if (v106 > 0xF7u
            || v106 - 216 < 0x1F
            || v106 - 192 < 0x17
            || (v106 & 0xDFu) - 65 < 0x1A)
          {
            goto LABEL_201;
          }
          char v112 = v106 + 95;
          if (v106 + 95) < 0x1Fu && ((0x6F356F35u >> v112))
          {
            UInt8 v106 = byte_20CC66958[v112];
LABEL_201:
            char v102 = 1;
          }
        }
        else
        {
          if (v30 != 517) {
            goto LABEL_201;
          }
          if (v106 <= 0x2Fu && ((1 << v106) & 0xE00400000000) != 0)
          {
            UInt8 v106 = 32;
            buffer[v105] = 32;
          }
          if (v106 - 174 < 0x42
            || v106 - 161 < 0xC
            || (v106 & 0xDFu) - 65 < 0x1A
            || v106 - 241 < 0xC
            || (v106 & 0xFE) == 0xFE)
          {
            goto LABEL_201;
          }
        }
LABEL_202:
        if (v106 == 33 || v106 == 63)
        {
          UInt8 v106 = 46;
          buffer[v105] = 46;
          unint64_t v113 = v105 + 2;
          if (v105 + 2 < v100) {
            goto LABEL_208;
          }
        }
        else
        {
          unint64_t v113 = v105 + 2;
          if (v105 + 2 < v100 && v106 == 46)
          {
LABEL_208:
            if (buffer[v105 + 1] == 46 && buffer[v113] == 46)
            {
              UInt8 v106 = 32;
              buffer[v113] = 32;
              buffer[v105 + 1] = 32;
              buffer[v105] = 32;
            }
            else
            {
              UInt8 v106 = 46;
            }
          }
        }
        unint64_t v101 = v105 + 1;
        if (v105 + 1 < v100
          && v106 <= 0x2Eu
          && ((1 << v106) & 0x700200000000) != 0
          && (unsigned int v114 = buffer[v101], v114 <= 0x3F)
          && ((1 << v114) & 0x8000700200000000) != 0)
        {
          buffer[v101] = 32;
          buffer[v105] = 32;
        }
        else if (v30 == 1280 && v106 == 173)
        {
          if (v101 < v100)
          {
            unint64_t v115 = v100 + v103;
            int v116 = v104;
            do
            {
              *(v116 - 1) = *v116;
              ++v116;
              --v115;
            }
            while (v115);
          }
          numCFIndex Bytes = --v100;
        }
        --v103;
        int v104 = (void *)((char *)v104 + 1);
        if (v101 >= v100) {
          goto LABEL_227;
        }
      }
      uint64_t v111 = v106 - 130;
      if (v111 <= 0x39)
      {
        if (((1 << (v106 + 126)) & 0x2018205) != 0)
        {
          UInt8 v106 = 39;
          goto LABEL_194;
        }
        if (((1 << (v106 + 126)) & 0x200020000060000) != 0)
        {
          UInt8 v106 = 34;
          goto LABEL_194;
        }
        if (v111 == 20)
        {
          UInt8 v106 = 45;
LABEL_194:
          buffer[v105] = v106;
        }
      }
      if (v106 > 0xF7u
        || v106 - 216 < 0x1F
        || v106 - 192 < 0x17
        || (v106 & 0xDFu) - 65 < 0x1A
        || v106 - 138 <= 0x15 && ((1 << (v106 + 118)) & 0x350015) != 0)
      {
        goto LABEL_201;
      }
      goto LABEL_202;
    }
    char v102 = 0;
LABEL_227:
    int v270 = v102 & 1;
    if (!v100)
    {
LABEL_249:
      BOOL v120 = 1;
      goto LABEL_250;
    }
LABEL_228:
    unint64_t v117 = 0;
    do
    {
      int v118 = buffer[v117];
      BOOL v120 = (v118 & 0x80u) == 0 && v118 != 95;
      ++v117;
    }
    while (v120 && v117 < v100);
LABEL_250:
    BOOL v299 = 0;
    buffer[v100] = 0;
    if (!v308)
    {
      int v133 = !a12 || !v308;
      BOOL v134 = !a12;
      goto LABEL_270;
    }
    long long v130 = *(_OWORD *)&v339[24];
    *(_OWORD *)&v339[23] = *(_OWORD *)&v339[22];
    *(_OWORD *)&v339[25] = v130;
    long long v131 = *(_OWORD *)&v339[18];
    *(_OWORD *)&v339[17] = *(_OWORD *)&v339[16];
    *(_OWORD *)&v339[19] = v131;
    v339[16] = 0;
    v339[22] = 0;
    uint64_t v132 = v339[23];
    BOOL v299 = v308
        && a14
        && -[AppleSpell checkNoCapAbbreviationWordBuffer:length:languageObject:](v304, "checkNoCapAbbreviationWordBuffer:length:languageObject:", buffer);
    v274 += v132;
    if (!a12)
    {
      BOOL v134 = 1;
      int v133 = !v308 | 1;
      goto LABEL_269;
    }
    size_t v73 = v305;
    if (a15)
    {
      uint64_t v135 = 0;
      unint64_t v136 = v47 + v50;
      while (v135 != -64)
      {
        if (v135 == -48)
        {
          unint64_t v137 = v340;
        }
        else
        {
          unint64_t v137 = *(void *)&buffer[v135 - 9];
          if (v137 == *(void *)((char *)&v342 + v135)) {
            goto LABEL_267;
          }
        }
        if (v137 < v50)
        {
          unint64_t v138 = v136 - v137;
          uint64_t v139 = v136 - v137 > 1 ? v292 : 0;
          uint64_t v140 = v138 - v139;
          uint64_t v141 = -[__CFString substringWithRange:](theString, "substringWithRange:", v137, v138 - v139);
          LOBYTE(v257) = a13;
          uint64_t v142 = v140;
          BOOL v52 = theString;
          uint64_t v143 = -[AppleSpell _phraseCapitalizationResultForString:range:currentWordRange:inString:offset:languageObject:onlyAtInsertionPoint:keyEventArray:selectedRangeValue:](v304, "_phraseCapitalizationResultForString:range:currentWordRange:inString:offset:languageObject:onlyAtInsertionPoint:keyEventArray:selectedRangeValue:", v141, v137, v142, v74, v305, theString, a11, v297, v257, a16, a18);
          if (v143)
          {
            uint64_t v160 = v143;
            unint64_t v27 = v300;
            goto LABEL_562;
          }
        }
LABEL_267:
        v135 -= 16;
      }
    }
    if (!a12 || !v308)
    {
      id v144 = 0;
      BOOL v134 = !a12;
      int v151 = !v308;
LABEL_286:
      unint64_t v27 = v300;
      goto LABEL_302;
    }
    int v161 = v297;
    unint64_t v27 = v300;
    if (![v297 isEnglish])
    {
      int v133 = 0;
      BOOL v134 = 0;
      goto LABEL_270;
    }
    unint64_t v162 = 0;
    char v163 = 0;
    do
    {
      if (v305 == strlen(off_2640F1490[v162]) && !strncasecmp_l((const char *)buffer, off_2640F1490[v162], v305, 0)) {
        char v163 = 1;
      }
      if (v163) {
        break;
      }
      BOOL v59 = v162++ >= 0xB;
    }
    while (!v59);
    if ((v163 & 1) == 0)
    {
      int v133 = 0;
      BOOL v134 = 0;
      signed int v30 = v294;
LABEL_269:
      size_t v73 = v305;
LABEL_270:
      if ((v133 | !a15))
      {
        id v144 = 0;
LABEL_301:
        int v151 = !v308;
LABEL_302:
        BOOL v153 = v144 == 0;
        BOOL v154 = v308 && v153;
        if (v308 && v153) {
          id v155 = 0;
        }
        else {
          id v155 = v144;
        }
        int v293 = v151;
        if (!v134 && v154)
        {
          if (([v297 isIrishGaelic] & 1) != 0
            || ([v297 isNynorsk] & 1) != 0
            || [v297 isRomanian])
          {
            int v156 = (void *)-[__CFString substringWithRange:](v52, "substringWithRange:", v74, v305);
            char v157 = v52;
            id v158 = [(AppleSpell *)v304 autocorrectionDictionaryForLanguageObject:v297];
            if ([v297 isNynorsk]) {
              id v158 = &unk_26C1D3568;
            }
            if (objc_msgSend(v158, "objectForKey:", objc_msgSend(v156, "lowercaseString")))
            {
              LODWORD(v258) = 0;
              uint64_t v159 = -[AppleSpell _correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:](v304, "_correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:", v156, 0, v158, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", objc_msgSend(v297, "identifier")), 0, correctionFlags(v284, 0, a13, 0, a22), 0, 0, a19, v258, v265, &v336);
              BOOL v52 = v157;
              size_t v73 = v305;
              if (v159)
              {
                uint64_t v160 = v159;
                unint64_t v27 = v300;
                signed int v30 = v294;
                goto LABEL_562;
              }
              BOOL v134 = 0;
              id v155 = 0;
              unint64_t v27 = v300;
              signed int v30 = v294;
            }
            else
            {
              BOOL v134 = 0;
              id v155 = 0;
              BOOL v52 = v157;
              signed int v30 = v294;
              size_t v73 = v305;
            }
          }
          else
          {
            BOOL v134 = 0;
            id v155 = 0;
            size_t v73 = v305;
          }
        }
        if (v155) {
          BOOL v164 = 0;
        }
        else {
          BOOL v164 = v308;
        }
        if (v134 || !v164)
        {
          int v161 = v297;
        }
        else
        {
          int v161 = v297;
          if (([v297 isGreek] & 1) != 0
            || ([v297 isHindi] & 1) != 0
            || ([v297 isIrishGaelic] & 1) != 0
            || ([v297 isPunjabi] & 1) != 0
            || ([v297 isPolish] & 1) != 0
            || ([v297 isRomanian] & 1) != 0
            || ([v297 isTelugu] & 1) != 0
            || [v297 isVietnamese])
          {
            BYTE1(usedBufLena) = v284;
            LOBYTE(usedBufLena) = a13;
            uint64_t v165 = -[AppleSpell _accentCorrectionResultForString:range:inString:offset:languageObject:onlyAtInsertionPoint:capitalize:keyEventArray:selectedRangeValue:](v304, "_accentCorrectionResultForString:range:inString:offset:languageObject:onlyAtInsertionPoint:capitalize:keyEventArray:selectedRangeValue:", -[__CFString substringWithRange:](v52, "substringWithRange:", v74, v73), v74, v73, v52, a11, v297, usedBufLena, a16, a18);
            if (v165)
            {
              uint64_t v160 = v165;
              goto LABEL_562;
            }
          }
        }
        goto LABEL_345;
      }
      id v144 = [(AppleSpell *)v304 capitalizationDictionaryArrayForLanguageObject:v297];
      if (!v144) {
        goto LABEL_301;
      }
      unint64_t v145 = (void *)-[__CFString substringWithRange:](v52, "substringWithRange:", v74, v73);
      [v145 rangeOfString:@"’"];
      if (v146) {
        unint64_t v145 = (void *)[v145 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];
      }
      long long v320 = 0u;
      long long v321 = 0u;
      long long v318 = 0u;
      long long v319 = 0u;
      uint64_t v147 = [v144 countByEnumeratingWithState:&v318 objects:v339 count:16];
      uint64_t v148 = (uint64_t)v285;
      if (v147)
      {
        uint64_t v149 = *(void *)v319;
        while (2)
        {
          for (uint64_t j = 0; j != v147; ++j)
          {
            if (*(void *)v319 != v149) {
              objc_enumerationMutation(v144);
            }
            uint64_t v148 = [*(id *)(*((void *)&v318 + 1) + 8 * j) objectForKey:v145];
            if (v148)
            {
              signed int v30 = v294;
              size_t v73 = v305;
              goto LABEL_288;
            }
          }
          uint64_t v147 = [v144 countByEnumeratingWithState:&v318 objects:v339 count:16];
          if (v147) {
            continue;
          }
          break;
        }
        id v144 = 0;
        v285 = 0;
        int v151 = !v308;
        unint64_t v27 = v300;
        BOOL v52 = theString;
        signed int v30 = v294;
        size_t v73 = v305;
        goto LABEL_302;
      }
LABEL_288:
      if (v148) {
        BOOL v152 = v73 == 1;
      }
      else {
        BOOL v152 = 0;
      }
      v285 = (void *)v148;
      if (v152)
      {
        unint64_t v27 = v300;
        BOOL v52 = theString;
        if ((v74 + 1 >= v310
           || [(__CFString *)theString characterAtIndex:v74 + 1] != 46
           && [(__CFString *)theString characterAtIndex:v74 + 1] != 41)
          && (!v74
           || v74 + 1 != v310
           || [(__CFString *)theString characterAtIndex:v74 - 1] != 40))
        {
          goto LABEL_293;
        }
      }
      else
      {
        unint64_t v27 = v300;
        BOOL v52 = theString;
        if (v148)
        {
LABEL_293:
          id v144 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F08758]), "initWithRange:replacementString:", v74 + a11, v73, v285);
          [a10 addObject:v144];
          goto LABEL_301;
        }
      }
      id v144 = 0;
      v285 = 0;
      goto LABEL_301;
    }
    uint64_t v180 = -[__CFString substringWithRange:](v52, "substringWithRange:", v74, v305);
    LODWORD(v258) = 0;
    uint64_t v256 = [(AppleSpell *)v304 autocorrectionDictionaryForLanguageObject:v297];
    BOOL v52 = theString;
    size_t v73 = v305;
    id v181 = -[AppleSpell _correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:](v304, "_correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:", v180, v74, v305, theString, a11, v282, 0, v256, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", objc_msgSend(v297, "identifier")), 0, correctionFlags(v284, 0, a13, 0, a22), 0, 0, a19, v258, v265,
             &v336);
    id v144 = v181;
    signed int v30 = v294;
    if (!v181)
    {
      BOOL v134 = 0;
      int v151 = 0;
      goto LABEL_286;
    }
    v285 = (void *)[v181 replacementString];
    [a10 addObject:v144];
    int v293 = 0;
    unint64_t v27 = v300;
LABEL_345:
    if ([v161 isGreek]
      && -[AppleSpell _acceptWithoutAccentForString:range:inString:languageObject:](v304, "_acceptWithoutAccentForString:range:inString:languageObject:", -[__CFString substringWithRange:](v52, "substringWithRange:", v74, v73), v74, v73, v52, v161))
    {
      goto LABEL_564;
    }
    WORD2(usedBufLena) = 257;
    LODWORD(usedBufLena) = 16843009;
    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v304, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, numBytes, v161, v295, a3, 1, usedBufLena, 0))
    {
      if (v306)
      {
        int v166 = numBytes > 1 ? v270 : 0;
        if (v166 == 1
          && !-[AppleSpell validateAbbreviationOrNumberWordBuffer:length:languageObject:connection:sender:](v304, "validateAbbreviationOrNumberWordBuffer:length:languageObject:connection:sender:", buffer)&& ![(AppleSpell *)v304 checkNameWordBuffer:buffer length:numBytes languageObject:v161 globalOnly:1])
        {
          uint64_t v167 = [v283 indexOfObject:v267];
          ++v306[v167];
        }
      }
      if (v264)
      {
        if (v30 == [v272 encoding])
        {
          uint64_t v168 = [(AppleSpell *)v304 databaseConnectionForLanguageObject:v272];
          WORD2(usedBufLenb) = 257;
          LODWORD(usedBufLenb) = 16777473;
          if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v304, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, numBytes, v272, v168, a3, 1, usedBufLenb, 0))
          {
            v339[16] = 1;
          }
        }
      }
      goto LABEL_557;
    }
    uint64_t v169 = -[__CFString substringWithRange:](v52, "substringWithRange:", v50, v47);
    int64_t v170 = (void *)v169;
    if (v47 == v73) {
      int v171 = obj;
    }
    else {
      int v171 = 1;
    }
    if (v171 == 1)
    {
      long long v172 = v161;
      uint64_t v173 = v169;
      uint64_t v174 = -[__CFString substringWithRange:](v52, "substringWithRange:", v74, v73);
      int64_t v170 = (void *)v173;
      int v161 = v172;
      uint64_t v175 = v174;
      if (!v170) {
        goto LABEL_557;
      }
    }
    else
    {
      uint64_t v175 = 0;
      if (!v169) {
        goto LABEL_557;
      }
    }
    int v271 = v170;
    if (([a3 isWordInUserDictionaries:v170 caseSensitive:0] & 1) != 0
      || v175
      && (([v271 hasPrefix:@"@"] & 1) != 0
       || ([a3 isWordInUserDictionaries:v175 caseSensitive:0] & 1) != 0))
    {
      goto LABEL_557;
    }
    CFIndex v176 = numBytes;
    unint64_t v268 = v74;
    if (numBytes)
    {
      uint64_t v177 = 0;
      char v178 = 0;
      CFIndex v179 = numBytes - 1;
      do
      {
        while (buffer[v177] == 39)
        {
          buffer[v177] = -110;
          char v178 = 1;
          BOOL v60 = v179 == v177++;
          if (v60) {
            goto LABEL_384;
          }
        }
        ++v177;
      }
      while (v176 != v177);
      if ((v178 & 1) == 0) {
        goto LABEL_393;
      }
LABEL_384:
      CFStringRef v182 = (id)CFStringCreateWithBytes(0, buffer, v176, v30, 0);
      if (v182) {
        LOBYTE(v182) = [a3 isWordInUserDictionaries:v182 caseSensitive:0];
      }
      CFIndex v183 = numBytes;
      if (numBytes)
      {
        uint64_t v184 = buffer;
        do
        {
          if (*v184 == 146) {
            *uint64_t v184 = 39;
          }
          ++v184;
          --v183;
        }
        while (v183);
      }
      if (v182)
      {
        id v185 = v161;
        goto LABEL_507;
      }
    }
LABEL_393:
    unsigned __int8 v262 = (void *)v175;
    v298 = v161;
    if (v27 < 2)
    {
      BOOL v191 = 0;
LABEL_430:
      if (!v191 && v273)
      {
        uint64_t v199 = 0;
        unint64_t v74 = v268;
        while (1)
        {
          id v200 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:", [v266 objectAtIndex:v199]);
          int v201 = [v200 encoding];
          if (([v161 isEqual:v200] & 1) == 0)
          {
            int v202 = objc_msgSend(v283, "containsObject:", objc_msgSend(v200, "identifier"));
            int v203 = v30 == v201 || v120;
            if (!v202 && v203 != 0)
            {
              uint64_t v205 = [(AppleSpell *)v304 databaseConnectionForLanguageObject:v200];
              WORD2(usedBufLenb) = 257;
              LODWORD(usedBufLenb) = 16777473;
              int v161 = v298;
              if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v304, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, numBytes, v200, v205, a3, 1, usedBufLenb, 0))
              {
                break;
              }
            }
          }
          if (++v199 >= v273) {
            goto LABEL_446;
          }
        }
        BOOL v52 = theString;
        if (!v199) {
          v339[16] = 1;
        }
        id v185 = v298;
        unint64_t v27 = v300;
        if (v306) {
          goto LABEL_508;
        }
        goto LABEL_509;
      }
      unint64_t v74 = v268;
      if (v191)
      {
        id v185 = v161;
        unint64_t v27 = v300;
        goto LABEL_506;
      }
LABEL_446:
      unint64_t v27 = v300;
      if ((spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__readDefault & 1) == 0)
      {
        if (objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "objectForKey:", @"NSSpellCheckerAutocorrectMultilingual"))
        {
          spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__autocorrectMultilingual = objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "BOOLForKey:", @"NSSpellCheckerAutocorrectMultilingual");
        }
        spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__readDefault = 1;
      }
      if (spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__autocorrectMultilingual) {
        BOOL v206 = 0;
      }
      else {
        BOOL v206 = v300 > 1;
      }
      if (v206) {
        uint64_t v207 = 0;
      }
      else {
        uint64_t v207 = v295;
      }
      if (a12)
      {
        uint64_t v208 = [(AppleSpell *)v304 autocorrectionDictionaryForLanguageObject:v161];
        BOOL v209 = 0;
        char v210 = 1;
        BOOL v278 = v74 != 0x7FFFFFFFFFFFFFFFLL;
        BOOL v52 = theString;
        if (v74 != 0x7FFFFFFFFFFFFFFFLL && v305 >= 3)
        {
          char v210 = 0;
          BOOL v209 = (v208 | v207) != 0;
          BOOL v278 = 1;
        }
      }
      else
      {
        uint64_t v208 = 0;
        BOOL v209 = 0;
        BOOL v278 = v74 != 0x7FFFFFFFFFFFFFFFLL;
        char v210 = 1;
        BOOL v52 = theString;
      }
      if (a23) {
        *a23 = 0;
      }
      if (v308)
      {
        if (v208) {
          char v210 = 1;
        }
        if ((v210 & 1) == 0 && !v207) {
          v339[22] = 1;
        }
      }
      uint64_t v260 = v208;
      if (v74) {
        BOOL v211 = v209;
      }
      else {
        BOOL v211 = 0;
      }
      size_t v73 = v305;
      if (v211)
      {
        if (!spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__precedingCharacterSet) {
          spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__precedingCharacterSet = (uint64_t)(id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"~!@#$%^&*-_=+[]\\|<./?"];
        }
        -[__CFString rangeOfCharacterFromSet:options:range:](v52, "rangeOfCharacterFromSet:options:range:");
        BOOL v209 = v212 == 0;
      }
      uint64_t v261 = v207;
      if (v30 == 1280 && v209 && v74 >= 4)
      {
        BOOL v259 = v209;
        int v213 = isUpperCase([(__CFString *)v52 characterAtIndex:v74]);
        BOOL v209 = v259;
        if (v213)
        {
          int v214 = (void *)spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__titlesArray;
          if (!spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__titlesArray)
          {
            int v214 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"Mr", @"Mrs", @"Ms", @"Mme", @"Mlle", @"Sr", @"Sra", @"Srta", @"Dr", 0);
            spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__titlesArray = (uint64_t)v214;
          }
          long long v315 = 0u;
          long long v316 = 0u;
          *(_OWORD *)&v313[1] = 0u;
          long long v314 = 0u;
          uint64_t v215 = [v214 countByEnumeratingWithState:&v313[1] objects:v337 count:16];
          BOOL v209 = v259;
          if (v215)
          {
            uint64_t v216 = v215;
            uint64_t v217 = *(void *)v314;
            unint64_t v302 = v74 - 2;
            id objb = v214;
            while (2)
            {
              for (uint64_t k = 0; k != v216; ++k)
              {
                if (*(void *)v314 != v217) {
                  objc_enumerationMutation(objb);
                }
                int v219 = *(void **)(v313[2] + 8 * k);
                uint64_t v220 = [v219 length];
                if (v74 >= v220 + 2
                  && [(__CFString *)theString characterAtIndex:v302] == 46
                  && !-[__CFString compare:options:range:](theString, "compare:options:range:", v219, 0, v302 - v220, v220)|| v74 >= v220 + 1&& !-[__CFString compare:options:range:](theString, "compare:options:range:", v219, 0, v74 + ~v220, v220))
                {
                  BOOL v224 = 0;
                  unint64_t v27 = v300;
                  int v161 = v298;
                  goto LABEL_516;
                }
              }
              uint64_t v216 = [objb countByEnumeratingWithState:&v313[1] objects:v337 count:16];
              unint64_t v27 = v300;
              BOOL v52 = theString;
              BOOL v209 = v259;
              if (v216) {
                continue;
              }
              break;
            }
          }
        }
      }
      if (v209)
      {
        int v161 = v298;
        uint64_t v221 = (uint64_t)v285;
        unsigned int v222 = v284;
        if (v310 <= v305 + v74)
        {
          BOOL v224 = 1;
          BOOL v52 = theString;
          goto LABEL_518;
        }
        if (!spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__followingCharacterSet) {
          spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__followingCharacterSet = (uint64_t)objc_retain((id)[MEMORY[0x263F08708] characterSetWithCharactersInString:@"@#$%^&*-_=+([]\\|>/"];
        }
        -[__CFString rangeOfCharacterFromSet:options:range:](theString, "rangeOfCharacterFromSet:options:range:");
        BOOL v224 = v223 == 0;
        if (!v223)
        {
          BOOL v52 = theString;
          uint64_t v221 = (uint64_t)v285;
          unsigned int v222 = v284;
          if (v305 <= 3)
          {
            int v225 = [(__CFString *)theString characterAtIndex:v305 + v74];
            unsigned int v222 = v284;
            BOOL v60 = v225 == 46;
            uint64_t v221 = (uint64_t)v285;
            BOOL v224 = !v60;
          }
LABEL_518:
          if (v308)
          {
            BOOL v227 = v339[23] && v224;
            if (v227
              && (unint64_t)(4 * vaddvq_s64(vaddq_s64(*(int64x2_t *)&v339[25], *(int64x2_t *)&v339[23]))) > 0xB)
            {
              v339[22] = 1;
              if ((v278 & ~v293) == 1 && v305)
              {
                BOOL v224 = 0;
                goto LABEL_532;
              }
LABEL_542:
              size_t v301 = v305;
              uint64_t v277 = v74;
              goto LABEL_559;
            }
          }
          int v228 = v278;
          if ((v293 | !v224 | v263)) {
            int v228 = v278 & ~v293;
          }
          else {
            uint64_t v265 = vaddvq_s64(vaddq_s64(vshlq_n_s64(vaddq_s64(*(int64x2_t *)&v339[23], *(int64x2_t *)&v339[25]), 2uLL), (int64x2_t)v274));
          }
          if (!v228 || !v305)
          {
            if (v224)
            {
              if (v262) {
                double v232 = v262;
              }
              else {
                double v232 = v271;
              }
              LODWORD(v258) = 0;
              BOOL v52 = theString;
              uint64_t v221 = objc_msgSend(-[AppleSpell _correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:](v304, "_correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:", v232, v74, v305, theString, a11, v282, a17, v260, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:", objc_msgSend(v161, "identifier")), v261, correctionFlags(v284, a15, a13, 0, a22), a16, a18, a19,
                         v258,
                         v265,
                         &v336),
                       "replacementString");
              unsigned int v222 = v284;
              goto LABEL_542;
            }
            size_t v301 = v305;
            uint64_t v277 = v74;
LABEL_558:
            unsigned int v222 = v284;
            goto LABEL_559;
          }
LABEL_532:
          NSUInteger v229 = objc_msgSend(objc_alloc(MEMORY[0x263F08B38]), "initWithRange:", v74 + a11, v305);
          [a10 addObject:v229];

          if (v224)
          {
            unsigned int v230 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObject:", objc_msgSend(v161, "identifier"));
            BOOL v231 = v262;
            if (v272)
            {
              if (*(_OWORD *)&v339[17] == 0
                || !-[AppleSpell _useAlternateLanguageForRange:ofString:languageObject:tagger:alternateLanguageObject:alternateTagger:appIdentifier:](v304, "_useAlternateLanguageForRange:ofString:languageObject:tagger:alternateLanguageObject:alternateTagger:appIdentifier:", v74, v305, v52, v161, v282, v272, v281, a17))
              {
                objc_msgSend(v230, "addObject:", objc_msgSend(v272, "identifier"));
              }
              else
              {
                objc_msgSend(v230, "insertObject:atIndex:", objc_msgSend(v272, "identifier"), 0);
              }
            }
            if (v74 < 2) {
              __int16 v233 = 0;
            }
            else {
              __int16 v233 = [(__CFString *)v52 characterAtIndex:v74 - 2];
            }
            v303 = v230;
            if (v305 + v74 + 2 <= v310)
            {
              NSUInteger v235 = theString;
              __int16 v234 = [(__CFString *)theString characterAtIndex:v305 + v74 + 1];
            }
            else
            {
              __int16 v234 = 0;
              NSUInteger v235 = theString;
            }
            if (!v262) {
              BOOL v231 = v271;
            }
            WORD1(v258) = v234;
            LOWORD(v258) = v233;
            id v236 = -[AppleSpell _correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:](v304, "_correctionResultForString:range:inString:offset:tagger:appIdentifier:dictionary:languages:connection:flags:keyEventArray:selectedRangeValue:parameterBundles:previousLetter:nextLetter:extraMisspellingCount:extraCorrectionCount:", v231, v74, v305, v235, a11, v282, a17, v260, v303, v261, correctionFlags(v284, a15, a13, 0, a22), a16, a18, a19, v258,
                     v265,
                     &v336);
            BOOL v52 = v235;
            if (v236)
            {
              id v237 = v236;
              uint64_t v238 = [v236 replacementString];
              [a10 addObject:v237];
              uint64_t v221 = v238;
              size_t v301 = v305;
              uint64_t v277 = v74;
              unint64_t v27 = v300;
              goto LABEL_558;
            }
            v339[22] = 1;
            size_t v301 = v305;
            uint64_t v277 = v74;
            unint64_t v27 = v300;
          }
          else
          {
            size_t v301 = v305;
            uint64_t v277 = v74;
          }
LABEL_557:
          uint64_t v221 = (uint64_t)v285;
          goto LABEL_558;
        }
LABEL_516:
        BOOL v52 = theString;
      }
      else
      {
        BOOL v224 = 0;
        int v161 = v298;
      }
      uint64_t v221 = (uint64_t)v285;
      unsigned int v222 = v284;
      goto LABEL_518;
    }
    uint64_t v186 = 0;
    while (1)
    {
      id obja = (__CFString *)[v283 objectAtIndex:v186];
      id v185 = +[PRLanguage languageObjectWithIdentifier:](PRLanguage, "languageObjectWithIdentifier:");
      CFStringEncoding v187 = [v185 encoding];
      int v188 = [v161 isEqual:v185];
      int v189 = v30 == v187 || v120;
      if (!v188 && v189 != 0) {
        break;
      }
      if ((([v161 isEqual:v185] | v120) & 1) == 0
        && (v30 == 1280 && v187 == 514
         || (v30 == 1280 ? (BOOL v194 = v187 == 134217984) : (BOOL v194 = 0),
             !v194 ? (char v195 = 0) : (char v195 = 1),
             v187 == 1280 ? (BOOL v196 = v30 == 514) : (BOOL v196 = 0),
             v187 == 1280 ? (BOOL v197 = v30 == 134217984) : (BOOL v197 = 0),
             v196 || (v195 & 1) != 0 || v197)))
      {
        CFIndex v317 = 0;
        [(AppleSpell *)v304 databaseConnectionForLanguageObject:v185];
        v350.NSUInteger location = v50;
        v350.NSUInteger length = v47;
        CFIndex Bytes = CFStringGetBytes(theString, v350, v187, 0x5Fu, 0, v338, maxBufLen, &v317);
        BOOL v191 = 0;
        if (v47 == Bytes)
        {
          v338[v317] = 0;
          WORD2(usedBufLenb) = 257;
          LODWORD(usedBufLenb) = 16777473;
          BOOL v191 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v304, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", v338, usedBufLenb, 0);
        }
        unint64_t v27 = v300;
        if (v191) {
          goto LABEL_430;
        }
      }
      else
      {
        BOOL v191 = 0;
      }
LABEL_427:
      if (++v186 >= v27) {
        goto LABEL_430;
      }
    }
    uint64_t v192 = [(AppleSpell *)v304 databaseConnectionForLanguageObject:v185];
    WORD2(usedBufLenb) = 257;
    LODWORD(usedBufLenb) = 16777473;
    if (!-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v304, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, numBytes, v185, v192, a3, 1, usedBufLenb, 0))
    {
      BOOL v191 = 0;
      int v161 = v298;
      goto LABEL_427;
    }
    int v267 = obja;
    uint64_t v295 = v192;
LABEL_506:
    BOOL v52 = theString;
LABEL_507:
    if (v306)
    {
LABEL_508:
      uint64_t v226 = objc_msgSend(v283, "indexOfObject:", objc_msgSend(v185, "identifier"));
      ++v306[v226];
    }
LABEL_509:
    int v161 = v185;
    uint64_t v221 = (uint64_t)v285;
    unsigned int v222 = v284;
    unint64_t v74 = v268;
LABEL_559:
    v297 = v161;
    if ((v308 & v222) != 1 || v221)
    {
      v285 = (void *)v221;
    }
    else
    {
      LOBYTE(usedBufLenb) = a13;
      uint64_t v160 = -[AppleSpell _capitalizationResultForString:range:inString:offset:languageObject:onlyAtInsertionPoint:keyEventArray:selectedRangeValue:](v304, "_capitalizationResultForString:range:inString:offset:languageObject:onlyAtInsertionPoint:keyEventArray:selectedRangeValue:", -[__CFString substringWithRange:](v52, "substringWithRange:", v74, v289), v74, v289, v52, a11, v161, usedBufLenb, a16, a18);
      v285 = 0;
      if (v160) {
LABEL_562:
      }
        [a10 addObject:v160];
    }
LABEL_564:
    NSUInteger v44 = v290;
LABEL_565:
    ++v307;
    char v239 = v308;
    if (!v301) {
      char v239 = 1;
    }
    unint64_t v51 = v74;
    size_t v46 = v73;
  }
  while ((v239 & 1) != 0);
LABEL_570:
  if (a20) {
    *a20 = v307;
  }
  uint64_t v240 = v282;
  if (v27 >= 2)
  {
    v352.NSUInteger location = v44;
    v347.NSUInteger location = v313[0];
    v347.NSUInteger length = range1;
    v352.NSUInteger length = range2;
    NSRange v241 = NSIntersectionRange(v347, v352);
    uint64_t v242 = v306;
    BOOL v243 = v308;
    if (!v306) {
      BOOL v243 = 0;
    }
    if (v243 && v241.length && v306[v27])
    {
      for (unint64_t m = 0; m < v27; ++m)
      {
        unint64_t v245 = v242[m];
        if (v245 >= 2 && v242[v27] <= 2 * v245)
        {
          uint64_t v246 = [v283 objectAtIndex:m];
          uint64_t v242 = v306;
          if (v246) {
            break;
          }
        }
        else
        {
          uint64_t v246 = 0;
        }
      }
      uint64_t v240 = v282;
      if (v246)
      {
        uint64_t v247 = -[AppleSpell _orthographyByModifyingOrthography:withLatinLanguage:](v304, "_orthographyByModifyingOrthography:withLatinLanguage:", a8);
        uint64_t v248 = objc_msgSend(objc_alloc(MEMORY[0x263F08A60]), "initWithRange:orthography:", v241.location + a11, v241.length, v247);
        [a10 addObject:v248];
      }
    }
    CFRange v249 = v304->_lastLanguage;
    v304->_lastLanguage = (NSString *)objc_msgSend((id)objc_msgSend(v297, "identifier"), "copy");
  }
  [v280 closeTypologyRecordWithResults:a10];
  [(AppleSpell *)v304 resetTimer];
  if (a23 && v285)
  {
    id v250 = v285;
    [(AppleSpell *)v304 invalidateTagger:v240];
    [(AppleSpell *)v304 invalidateTagger:v281];

    *a23 = v285;
  }
  else
  {
    [(AppleSpell *)v304 invalidateTagger:v240];
    [(AppleSpell *)v304 invalidateTagger:v281];
  }
  NSUInteger v251 = v277;
  NSUInteger v252 = v301;
  result.NSUInteger length = v252;
  result.NSUInteger location = v251;
  return result;
}

id __329__AppleSpell_Spelling__spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction___block_invoke(uint64_t a1)
{
  spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__terminatorCharacterSet = (uint64_t)(id)[*(id *)(a1 + 32) sentenceTerminatorCharacterSet];
  spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__nonPunctuationCharacterSet = (uint64_t)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "punctuationCharacterSet"), "invertedSet");
  id result = (id)[MEMORY[0x263F08708] whitespaceCharacterSet];
  spellServer_findMisspelledWordInString_range_languages_topLanguages_orthography_checkOrthography_mutableResults_offset_autocorrect_onlyAtInsertionPoint_initialCapitalize_autocapitalize_keyEventArray_appIdentifier_selectedRangeValue_parameterBundles_wordCount_countOnly_appendCorrectionLanguage_correction__whitespaceCharacterSet = (uint64_t)result;
  return result;
}

- (BOOL)_spellServer:(id)a3 canChangeCaseOfFirstLetterInString:(id)a4 toUpperCase:(BOOL)a5 languageObject:(id)a6
{
  BOOL v7 = a5;
  uint64_t v52 = *MEMORY[0x263EF8340];
  unint64_t v11 = [a4 length];
  uint64_t v12 = [(AppleSpell *)self databaseConnectionForLanguageObject:a6];
  CFStringEncoding v13 = [a6 encoding];
  LOBYTE(v14) = 0;
  if (a4 && v11)
  {
    CFStringEncoding encoding = v13;
    id v34 = a3;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    *(_OWORD *)BOOL v35 = 0u;
    long long v36 = 0u;
    id v43 = a4;
    uint64_t v46 = 0;
    unint64_t v47 = v11;
    CharactersPtr = CFStringGetCharactersPtr((CFStringRef)a4);
    CStringPtr = 0;
    NSUInteger v44 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr((CFStringRef)a4, 0x600u);
    }
    int64x2_t v33 = v12;
    CFIndex v50 = 0;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    int v45 = CStringPtr;
    uint64_t v17 = simpleTokenRangeAfterIndex(v35, 0, v11, 0);
    CFIndex v18 = v17;
    CFIndex v20 = v19;
    unint64_t v21 = v19 + v17;
    if (v19 + v17 < v11)
    {
      uint64_t v22 = v17 + 72;
      do
      {
        int v23 = [a4 characterAtIndex:v21];
        if (((v23 - 39) > 0x38 || ((1 << (v23 - 39)) & 0x1000000020000C1) == 0)
          && ((v23 - 8208) > 9 || ((1 << (v23 - 16)) & 0x203) == 0))
        {
          break;
        }
        uint64_t v24 = simpleTokenRangeAfterIndex(v35, 0, v11, v21);
        if (v25 < 1 || v24 != v21 + 1 || (unint64_t v21 = v24 + v25, v24 + v25 > v22))
        {
          if (++v20) {
            goto LABEL_16;
          }
          goto LABEL_26;
        }
        CFIndex v20 = v21 - v18;
      }
      while (v21 < v11);
    }
    if (!v20)
    {
LABEL_26:
      LOBYTE(v14) = 0;
      return v14;
    }
LABEL_16:
    v53.NSUInteger location = v18;
    v53.NSUInteger length = v20;
    CFIndex Bytes = CFStringGetBytes((CFStringRef)a4, v53, encoding, 0x5Fu, 0, buffer, 72, &v50);
    LOBYTE(v14) = 0;
    if (v20 == Bytes)
    {
      if (v7)
      {
        if (buffer[0] > 0xF7u
          || buffer[0] - 97 < 0x1A
          || buffer[0] - 223 < 0x18
          || (LOBYTE(v14) = 1, buffer[0] - 154 <= 4) && ((1 << (buffer[0] + 102)) & 0x15) != 0)
        {
          BOOL v27 = [(AppleSpell *)self checkNameWordBuffer:buffer length:v50 languageObject:a6 globalOnly:0];
          LOBYTE(v14) = 0;
          if (!v27)
          {
            UInt8 v28 = toUpper(buffer[0]);
            goto LABEL_35;
          }
        }
      }
      else if (buffer[0] - 65 < 0x1A {
             || buffer[0] - 192 < 0x17
      }
             || buffer[0] - 216 < 7
             || (LOBYTE(v14) = 1, buffer[0] - 138 <= 0x15) && ((1 << (buffer[0] + 118)) & 0x200015) != 0)
      {
        BOOL v29 = [(AppleSpell *)self checkNameWordBuffer:buffer length:v50 languageObject:a6 globalOnly:0];
        LOBYTE(v14) = 0;
        if (!v29)
        {
          UInt8 v28 = toLower(buffer[0]);
LABEL_35:
          buffer[0] = v28;
          WORD2(usedBufLen) = 257;
          LODWORD(usedBufLen) = 16843009;
          BOOL v14 = -[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", buffer, v50, a6, v33, v34, 1, usedBufLen, 0);
          if (v14) {
            LOBYTE(v14) = ![(AppleSpell *)self validateAbbreviationOrNumberWordBuffer:buffer length:v50 languageObject:a6 connection:v33 sender:v34];
          }
        }
      }
    }
  }
  return v14;
}

- (id)_modifiedGrammarDescriptionForDescription:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [a3 rangeOfString:@".  "];
  uint64_t v6 = v5;
  [v3 rangeOfString:@"{"];
  uint64_t v8 = v7;
  [v3 rangeOfString:@"'"];
  uint64_t v10 = v9;
  unsigned __int16 v14 = 8216;
  __int16 v13 = 8217;
  if (v6)
  {
    unint64_t v11 = v4 + v6;
    if (v11 < [v3 length]) {
      id v3 = (id)[v3 substringFromIndex:v11];
    }
  }
  if (v8 | v10)
  {
    id v3 = (id)[MEMORY[0x263F089D8] stringWithString:v3];
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"{", objc_msgSend(NSString, "stringWithCharacters:length:", &v14, 1), 0, 0, objc_msgSend(v3, "length"));
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"}", objc_msgSend(NSString, "stringWithCharacters:length:", &v13, 1), 0, 0, objc_msgSend(v3, "length"));
    [v3 replaceOccurrencesOfString:@" '", objc_msgSend(NSString, "stringWithFormat:", @" %C", v14), 0, 0, objc_msgSend(v3, "length") withString options range];
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"'", objc_msgSend(NSString, "stringWithCharacters:length:", &v13, 1), 0, 0, objc_msgSend(v3, "length"));
  }
  return v3;
}

- (id)_detailWithRange:(_NSRange)a3 description:(id)a4 corrections:(id)a5 issueType:(unint64_t)a6
{
  uint64_t v10 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a3.location, a3.length);
  id v11 = [(AppleSpell *)self _modifiedGrammarDescriptionForDescription:a4];
  return (id)objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v10, @"NSGrammarRange", v11, @"NSGrammarUserDescription", a5, @"NSGrammarCorrections", &unk_26C1D35A0, @"NSGrammarConfidenceScore", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a6), @"NSGrammarIssueType", 0);
}

- (id)_detailWithRange:(_NSRange)a3 description:(id)a4 corrections:(id)a5
{
  return -[AppleSpell _detailWithRange:description:corrections:issueType:](self, "_detailWithRange:description:corrections:issueType:", a3.location, a3.length, a4, a5, 0);
}

- (_NSRange)_modifiedGrammarRangeForDoubledWordRange:(_NSRange)a3 sentenceRange:(_NSRange)a4 inString:(id)a5 corrections:(id)a6
{
  uint64_t v17 = 0;
  CFIndex v18 = &v17;
  uint64_t v19 = 0x3010000000;
  CFIndex v20 = &unk_20CC73CF2;
  _NSRange v21 = a3;
  if (a3.length)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    if (a3.location > a3.length)
    {
      NSUInteger v8 = a4.length;
      if (a3.location + a3.length <= a4.length)
      {
        NSUInteger v11 = a4.location;
        if (a4.location + a4.length <= [a5 length])
        {
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __106__AppleSpell_EnglishGrammar___modifiedGrammarRangeForDoubledWordRange_sentenceRange_inString_corrections___block_invoke;
          v16[3] = &unk_2640F95A0;
          void v16[8] = v8;
          v16[9] = location;
          v16[10] = length;
          void v16[6] = &v17;
          void v16[7] = v11;
          v16[4] = a5;
          v16[5] = a6;
          objc_msgSend(a5, "enumerateSubstringsInRange:options:usingBlock:", v11, location, 259, v16);
        }
      }
    }
  }
  NSUInteger v12 = v18[4];
  NSUInteger v13 = v18[5];
  _Block_object_dispose(&v17, 8);
  NSUInteger v14 = v12;
  NSUInteger v15 = v13;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

uint64_t __106__AppleSpell_EnglishGrammar___modifiedGrammarRangeForDoubledWordRange_sentenceRange_inString_corrections___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  unint64_t v8 = *(void *)(result + 56);
  if (a3 >= v8)
  {
    uint64_t v11 = result;
    _NSRange result = objc_msgSend(*(id *)(result + 32), "compare:options:range:", a2, 1, *(void *)(v11 + 72) + v8, *(void *)(v11 + 80));
    if (!result)
    {
      unint64_t v12 = a3 - *(void *)(v11 + 56);
      uint64_t v13 = *(void *)(v11 + 72) - v12 + *(void *)(v11 + 80);
      uint64_t v14 = *(void *)(*(void *)(v11 + 48) + 8);
      *(void *)(v14 + 32) = v12;
      *(void *)(v14 + 40) = v13;
      _NSRange result = [*(id *)(v11 + 40) addObject:a2];
    }
  }
  *a7 = 1;
  return result;
}

- (BOOL)_acceptErrorWithRuleType:(unint64_t)a3 ruleNumber:(unint64_t)a4 grammarRange:(_NSRange)a5 sentenceRange:(_NSRange)a6 inString:(id)a7 corrections:(id)a8 issueType:(unint64_t *)a9
{
  if (!a5.length)
  {
    LOBYTE(v13) = 0;
    return v13;
  }
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  if (a5.location + a5.length > a6.length) {
    goto LABEL_4;
  }
  NSUInteger v11 = a6.location;
  if (a6.location + a6.length > objc_msgSend(a7, "length", a3, a4)) {
    goto LABEL_4;
  }
  uint64_t v14 = objc_msgSend(a7, "substringWithRange:", v11 + location, length);
  LOBYTE(v13) = 0;
  if ((uint64_t)a3 > 51)
  {
    if ((uint64_t)a3 <= 63)
    {
      if (a3 == 52)
      {
        int v13 = [&unk_26C1D34E0 containsObject:v14];
        unint64_t v15 = 8;
        goto LABEL_28;
      }
      if (a3 == 60) {
        return v13;
      }
    }
    else
    {
      switch(a3)
      {
        case '@':
          return v13;
        case 'A':
          int v13 = [&unk_26C1D34F8 containsObject:v14];
          unint64_t v15 = 10;
          goto LABEL_28;
        case 'N':
          return v13;
      }
    }
    goto LABEL_27;
  }
  if ((uint64_t)a3 <= 6)
  {
    if (a3 == 3) {
      return v13;
    }
    if (a3 == 4)
    {
      int v13 = [&unk_26C1D34C8 containsObject:v14] ^ 1;
      unint64_t v15 = 12;
      goto LABEL_28;
    }
LABEL_27:
    unint64_t v15 = 0;
    int v13 = 1;
    goto LABEL_28;
  }
  if (a3 - 7 >= 2)
  {
    if (a3 == 51)
    {
      objc_msgSend(v14, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x263F08708], "decimalDigitCharacterSet"));
      if (!v16)
      {
LABEL_4:
        LOBYTE(v13) = 0;
        return v13;
      }
      objc_msgSend(v14, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x263F08708], "alphanumericCharacterSet"));
      unint64_t v15 = 0;
      int v13 = v17 == 0;
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  int v13 = 1;
  unint64_t v15 = 11;
LABEL_28:
  if (a9 && v13)
  {
    *a9 = v15;
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (BOOL)_checkEnglishGrammarInString:(id)a3 range:(_NSRange)a4 indexIntoBuffer:(unint64_t)a5 bufferLength:(unint64_t)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8 sender:(id)a9 bufIO:(_PR_BUF_IO *)a10 retval:(int *)a11 errorRange:(_NSRange *)a12 details:(id *)a13
{
  uint64_t v13 = MEMORY[0x270FA5388](self);
  unint64_t v15 = v14;
  unsigned __int16 v232 = v16;
  uint64_t v246 = v17;
  uint64_t v247 = v18;
  CFIndex v20 = v19;
  _NSRange v21 = (void *)v13;
  uint64_t v22 = a10;
  int v23 = a11;
  uint64_t v261 = *MEMORY[0x263EF8340];
  var0 = a10->var0;
  id v237 = (void *)[MEMORY[0x263EFF980] array];
  CFLocaleRef v24 = CFLocaleCreate(0, @"en");
  unint64_t v25 = [(__CFString *)v20 length];
  int v26 = off_2676F5000;
  if (!_checkEnglishGrammarInString_range_indexIntoBuffer_bufferLength_languageObject_connection_sender_bufIO_retval_errorRange_details__bindictData)
  {
    uint64_t v27 = objc_msgSend((id)objc_msgSend(v21, "dataBundle"), "URLForResource:withExtension:subdirectory:localization:", @"bindict3", 0, 0, objc_msgSend(v15, "localization"));
    if (v27
      || (uint64_t v27 = objc_msgSend((id)objc_msgSend(v21, "dataBundle"), "URLForResource:withExtension:subdirectory:localization:", @"bindict3", 0, 0, objc_msgSend(v15, "fallbackLocalization"))) != 0)
    {
      _checkEnglishGrammarInString_range_indexIntoBuffer_bufferLength_languageObject_connection_sender_bufIO_retval_errorRange_details__bindictData = [objc_alloc(MEMORY[0x263EFF8F8]) initWithContentsOfURL:v27 options:8 error:0];
    }
  }
  id v236 = v21;
  int v28 = PRbuf((uint64_t)a10, 0xEu, 0);
  *a11 = v28;
  var9 = a10->var9;
  NSUInteger v251 = v20;
  if (var9)
  {
    unint64_t v242 = v25;
    uint64_t v260 = 0;
    uint64_t v248 = v246 - v247;
    long long v258 = 0u;
    long long v259 = 0u;
    long long v256 = 0u;
    long long v257 = 0u;
    long long v254 = 0u;
    long long v255 = 0u;
    while (1)
    {
      unsigned int v31 = *((unsigned __int8 *)var9 + 12);
      if (v31 < 2 || !*((_WORD *)var9 + 1)) {
        goto LABEL_101;
      }
      if (v31 == 52)
      {
        int v32 = *((unsigned __int8 *)var9 + 13);
        if ((v32 - 101) <= 7)
        {
          int v33 = 1 << (v32 - 101);
          if ((v33 & 0x11) != 0)
          {
            unint64_t v49 = [(__CFString *)v251 paragraphRangeForRange:v248 + a10->var5 + *(_WORD *)var9];
            if (v49 >= v49 + v50) {
              goto LABEL_101;
            }
            unint64_t v51 = v49;
            uint64_t v52 = v50;
            uint64_t v53 = 0;
            uint64_t v54 = 0;
            do
            {
              int v55 = [(__CFString *)v251 characterAtIndex:v51];
              if (v55 == 40) {
                uint64_t v56 = v53 + 1;
              }
              else {
                uint64_t v56 = v53;
              }
              if (v55 == 41) {
                ++v54;
              }
              else {
                uint64_t v53 = v56;
              }
              ++v51;
              --v52;
            }
            while (v52);
            if (v53 == v54) {
              goto LABEL_101;
            }
            goto LABEL_49;
          }
          if ((v33 & 0x44) != 0)
          {
            unint64_t v43 = [(__CFString *)v251 paragraphRangeForRange:v248 + a10->var5 + *(_WORD *)var9];
            if (v43 >= v43 + v44) {
              goto LABEL_101;
            }
            unint64_t v45 = v43;
            uint64_t v46 = v44;
            char v47 = 0;
            do
            {
              int v48 = [(__CFString *)v251 characterAtIndex:v45];
              if ((v48 - 8220) < 4 || v48 == 34) {
                ++v47;
              }
              ++v45;
              --v46;
            }
            while (v46);
            if ((v47 & 1) == 0) {
              goto LABEL_101;
            }
            goto LABEL_49;
          }
          if ((v33 & 0x88) != 0)
          {
            unint64_t v34 = [(__CFString *)v251 paragraphRangeForRange:v248 + a10->var5 + *(_WORD *)var9];
            uint64_t v36 = v35;
            uint64_t v37 = [MEMORY[0x263F08708] alphanumericCharacterSet];
            unint64_t v38 = v34 + v36;
            if (v34 >= v34 + v36) {
              goto LABEL_101;
            }
            long long v39 = (void *)v37;
            char v40 = 0;
            unint64_t v41 = v34;
            do
            {
              int v42 = [(__CFString *)v251 characterAtIndex:v41];
              if (((v42 - 8216) < 4 || v42 == 96 || v42 == 39)
                && (v41 <= v34
                 || v41 + 1 >= v38
                 || !objc_msgSend(v39, "characterIsMember:", -[__CFString characterAtIndex:](v251, "characterAtIndex:", v41 - 1))|| (objc_msgSend(v39, "characterIsMember:", -[__CFString characterAtIndex:](v251, "characterAtIndex:", v41 + 1)) & 1) == 0))
              {
                ++v40;
              }
              ++v41;
              --v36;
            }
            while (v36);
            if ((v40 & 1) == 0) {
              goto LABEL_101;
            }
            goto LABEL_49;
          }
        }
        if (v32 == 74) {
          goto LABEL_101;
        }
      }
LABEL_49:
      long long v254 = 0u;
      long long v255 = 0u;
      uint64_t v260 = 0;
      long long v258 = 0u;
      long long v259 = 0u;
      long long v256 = 0u;
      long long v257 = 0u;
      LOWORD(v254) = *(_WORD *)&a8->var0;
      *((void *)&v254 + 1) = var9;
      LOBYTE(v255) = 16;
      LOBYTE(v259) = a8->var6;
      LOWORD(v260) = a8->var7;
      if (!PRerr((unsigned __int8 *)&v254, 16, 1))
      {
        if (*((void *)&v255 + 1))
        {
          CFStringRef v57 = (id)CFStringCreateWithCString(0, *((const char **)&v255 + 1), 0x500u);
          if (v57)
          {
            int v58 = *((unsigned __int8 *)var9 + 12);
            if ((v58 - 3) <= 0x60)
            {
              CFStringRef v59 = v57;
              uint64_t v60 = *(_WORD *)var9;
              uint64_t v61 = *((unsigned __int16 *)var9 + 1);
              if (*((unsigned __int8 *)var9 + 12) > 0x33u)
              {
                if (*((unsigned __int8 *)var9 + 12) > 0x41u)
                {
                  if (v58 != 66 && (v58 != 78 || *((unsigned char *)var9 + 13) != 24)) {
                    goto LABEL_84;
                  }
                }
                else if (v58 == 52)
                {
                  int v64 = *((unsigned __int8 *)var9 + 13);
                  if ((v64 - 18) > 0x3D
                    || ((1 << (v64 - 18)) & 0x2780000040000001) == 0)
                  {
                    unsigned int v65 = v64 - 81;
                    if (v65 > 0x22 || ((1 << v65) & 0x400000043) == 0)
                    {
LABEL_84:
                      uint64_t v66 = *((void *)var9 + 3);
                      if (v66)
                      {
                        int v67 = v251;
                        if (*(void *)(v66 + 8) && *(void *)v66)
                        {
                          uint64_t v239 = *((unsigned __int16 *)var9 + 1);
                          uint64_t v68 = *(_WORD *)var9;
                          uint64_t v69 = *(unsigned __int16 *)(v66 + 18);
                          uint64_t v70 = (void *)[MEMORY[0x263EFF980] array];
                          if (v69)
                          {
                            uint64_t v71 = 0;
                            uint64_t v72 = 2 * v69;
                            do
                            {
                              CFStringRef v73 = (id)CFStringCreateWithCString(0, (const char *)(*(void *)v66+ *(__int16 *)(*(void *)(v66 + 8) + v71)), 0x500u);
                              if (v73) {
                                [v70 addObject:v73];
                              }
                              v71 += 2;
                            }
                            while (v72 != v71);
                          }
                          uint64_t v60 = v68;
                          uint64_t v61 = v239;
                        }
                        else
                        {
                          uint64_t v70 = 0;
                        }
                      }
                      else
                      {
                        uint64_t v70 = 0;
                        int v67 = v251;
                      }
                      uint64_t v74 = v248 + a10->var5;
                      uint64_t var6 = a10->var6;
                      v253[0] = 0;
                      if (objc_msgSend(v236, "_acceptErrorWithRuleType:ruleNumber:grammarRange:sentenceRange:inString:corrections:issueType:", *((unsigned __int8 *)var9 + 12), *((unsigned __int8 *)var9 + 13), v60, v61, v74, var6, v67, v70, v253))
                      {
                        uint64_t v240 = v61;
                        uint64_t v76 = v60;
                        if (*((unsigned char *)var9 + 12) == 4)
                        {
                          uint64_t v70 = (void *)[MEMORY[0x263EFF980] array];
                          unint64_t v77 = v236;
                          uint64_t v78 = objc_msgSend(v236, "_modifiedGrammarRangeForDoubledWordRange:sentenceRange:inString:corrections:", v76, v240, v74, var6, v67, v70);
                          uint64_t v80 = v79;
                        }
                        else
                        {
                          unint64_t v77 = v236;
                          uint64_t v78 = v76;
                          uint64_t v80 = v240;
                        }
                        objc_msgSend(v237, "addObject:", objc_msgSend(v77, "_detailWithRange:description:corrections:issueType:", v78, v80, v59, v70, v253[0]));
                      }
                    }
                  }
                }
                else
                {
                  if (v58 != 65) {
                    goto LABEL_84;
                  }
                  int v62 = *((unsigned __int8 *)var9 + 13);
                  if (v62 != 2 && v62 != 19) {
                    goto LABEL_84;
                  }
                }
              }
              else if (*((unsigned __int8 *)var9 + 12) > 6u)
              {
                if (v58 == 7)
                {
                  if (*((unsigned char *)var9 + 13) != 3) {
                    goto LABEL_84;
                  }
                }
                else
                {
                  if (v58 != 51) {
                    goto LABEL_84;
                  }
                  unsigned int v63 = *((unsigned __int8 *)var9 + 13);
                  if ((v63 > 0x3E || ((1 << v63) & 0x40183C0000001800) == 0)
                    && (v63 - 132 > 0x3B || ((1 << (v63 + 124)) & 0x800000200344001) == 0)
                    && v63 != 122)
                  {
                    goto LABEL_84;
                  }
                }
              }
              else if (v58 == 3)
              {
                if (*((unsigned char *)var9 + 13) != 1) {
                  goto LABEL_84;
                }
              }
              else if (v58 != 6)
              {
                goto LABEL_84;
              }
            }
          }
        }
      }
      PRerr((unsigned __int8 *)&v254, 17, 0);
LABEL_101:
      var9 = (_PR_ERROR *)*((void *)var9 + 5);
      if (!var9)
      {
        int v23 = a11;
        int v81 = *a11;
        unint64_t v25 = v242;
        CFIndex v20 = v251;
        int v26 = off_2676F5000;
        goto LABEL_104;
      }
    }
  }
  int v81 = v28;
LABEL_104:
  BOOL v82 = v26[415];
  BOOL v83 = v81 == 200 || v82 == 0;
  if (v83 || v246 + (unint64_t)a10->var5 >= v25 + v247) {
    goto LABEL_566;
  }
  __int16 v234 = v23;
  uint64_t v84 = [v82 bytes];
  unsigned int v85 = [v26[415] length];
  v86.CFIndex location = v246 - v247 + a10->var5;
  if (v86.location + (unint64_t)a10->var6 <= v25) {
    v86.CFIndex length = a10->var6;
  }
  else {
    v86.CFIndex length = v25 - v86.location;
  }
  uint64_t v87 = CFStringTokenizerCreate(0, v20, v86, 0, v24);
  unsigned int v88 = v87;
  unint64_t v89 = 0;
  CFLocaleRef v235 = v24;
  if (!v84 || v85 < 8 || !v87) {
    goto LABEL_244;
  }
  unint64_t v89 = 0;
  if (!CFStringTokenizerAdvanceToNextToken(v87))
  {
LABEL_245:
    CFRelease(v88);
    goto LABEL_246;
  }
  double v90 = (double)(v85 >> 3);
  unint64_t v91 = (v85 >> 3) - 1;
  CFRange v249 = &var0[v247 - v246];
  do
  {
    CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v88);
    if ((unint64_t)(CurrentTokenRange.length - 1) > 0x47) {
      continue;
    }
    CFIndex location = CurrentTokenRange.location;
    CFIndex length = CurrentTokenRange.length;
    if (v89
      && (v95 = &v254 + v89, uint64_t v96 = *((void *)v95 - 2), CurrentTokenRange.location == v96 + *((void *)v95 - 1) + 1)
      && (CFIndex v97 = CurrentTokenRange.location + CurrentTokenRange.length,
          CurrentTokenRange.location + CurrentTokenRange.length <= (unint64_t)(v96 + 72)))
    {
      int v154 = var0[~v246 + v247 + CurrentTokenRange.location];
      if (v154 == 39 || v154 == 46)
      {
        BOOL v98 = 0;
        CFIndex length = v97 - v96;
        uint64_t v243 = -1;
        CFIndex location = v96;
      }
      else
      {
        CFIndex v155 = v97 - v96;
        BOOL v98 = v154 == 45;
        uint64_t v243 = 0;
        if (v154 == 45)
        {
          CFIndex location = v96;
          CFIndex length = v155;
        }
      }
    }
    else
    {
      BOOL v98 = 0;
      uint64_t v243 = 0;
    }
    while (2)
    {
      if (!length) {
        goto LABEL_145;
      }
      for (uint64_t i = 0; i != length; ++i)
      {
        int v100 = v249[location + i];
        BOOL v101 = (v100 - 65) >= 0x1A && (v100 - 192) >= 0x17;
        if (!v101)
        {
          if ((v100 - 138) > 0x15 || ((1 << (v100 + 118)) & 0x200015) == 0)
          {
LABEL_135:
            LOBYTE(v100) = v100 + 32;
            goto LABEL_143;
          }
LABEL_140:
          if (v100 == 159) {
            LOBYTE(v100) = -1;
          }
          else {
            LOBYTE(v100) = v100 + 16;
          }
          goto LABEL_143;
        }
        if ((v100 - 216) < 7) {
          goto LABEL_135;
        }
        if ((v100 - 138) <= 0x15 && ((1 << (v100 + 118)) & 0x200015) != 0) {
          goto LABEL_140;
        }
LABEL_143:
        v252[i] = v100;
      }
      if ((unint64_t)length <= 0x47) {
LABEL_145:
      }
        memset(&v252[length], length, 72 - length);
      int v104 = v252;
      if (length < 0xC)
      {
        int v108 = -1640531527;
        unsigned int v107 = -1640531527;
        int v106 = -1640531527;
        unsigned int v105 = length;
      }
      else
      {
        unsigned int v105 = length;
        int v106 = -1640531527;
        unsigned int v107 = -1640531527;
        int v108 = -1640531527;
        do
        {
          unsigned int v109 = *((_DWORD *)v104 + 1) + v107;
          unsigned int v110 = *((_DWORD *)v104 + 2) + v106;
          int v111 = (*(_DWORD *)v104 + v108 - (v109 + v110)) ^ (v110 >> 13);
          unsigned int v112 = (v109 - v110 - v111) ^ (v111 << 8);
          unsigned int v113 = (v110 - v111 - v112) ^ (v112 >> 13);
          int v114 = (v111 - v112 - v113) ^ (v113 >> 12);
          unsigned int v115 = (v112 - v113 - v114) ^ (v114 << 16);
          unsigned int v116 = (v113 - v114 - v115) ^ (v115 >> 5);
          int v108 = (v114 - v115 - v116) ^ (v116 >> 3);
          unsigned int v107 = (v115 - v116 - v108) ^ (v108 << 10);
          int v106 = (v116 - v108 - v107) ^ (v107 >> 15);
          v104 += 12;
          v105 -= 12;
        }
        while (v105 > 0xB);
      }
      unsigned int v117 = v106 + length;
      switch(v105)
      {
        case 1u:
          goto LABEL_162;
        case 2u:
          goto LABEL_161;
        case 3u:
          goto LABEL_160;
        case 4u:
          goto LABEL_159;
        case 5u:
          goto LABEL_158;
        case 6u:
          goto LABEL_157;
        case 7u:
          goto LABEL_156;
        case 8u:
          goto LABEL_155;
        case 9u:
          goto LABEL_154;
        case 0xAu:
          goto LABEL_153;
        case 0xBu:
          v117 += v104[10] << 24;
LABEL_153:
          v117 += v104[9] << 16;
LABEL_154:
          v117 += v104[8] << 8;
LABEL_155:
          v107 += v104[7] << 24;
LABEL_156:
          v107 += v104[6] << 16;
LABEL_157:
          v107 += v104[5] << 8;
LABEL_158:
          v107 += v104[4];
LABEL_159:
          v108 += v104[3] << 24;
LABEL_160:
          v108 += v104[2] << 16;
LABEL_161:
          v108 += v104[1] << 8;
LABEL_162:
          v108 += *v104;
          break;
        default:
          break;
      }
      int v118 = (v108 - v107 - v117) ^ (v117 >> 13);
      unsigned int v119 = (v107 - v117 - v118) ^ (v118 << 8);
      unsigned int v120 = (v117 - v118 - v119) ^ (v119 >> 13);
      int v121 = (v118 - v119 - v120) ^ (v120 >> 12);
      unsigned int v122 = (v119 - v120 - v121) ^ (v121 << 16);
      unsigned int v123 = (v120 - v121 - v122) ^ (v122 >> 5);
      int v124 = (v121 - v122 - v123) ^ (v123 >> 3);
      unsigned int v125 = (v123 - v124 - ((v122 - v123 - v124) ^ (v124 << 10))) ^ (((v122 - v123 - v124) ^ (v124 << 10)) >> 15);
      unint64_t v126 = ((double)(v125 - 1) / 4294967300.0 * v90);
      unsigned int v127 = 2 * v126;
      if (bswap32(*(_DWORD *)(v84 + 4 * (2 * v126))) <= v125)
      {
        do
        {
          unsigned int v128 = bswap32(*(_DWORD *)(v84 + 4 * v127));
          BOOL v130 = v128 >= v125 || v126++ >= v91;
          v127 += 2;
        }
        while (!v130);
        unsigned int v129 = v127 - 2;
      }
      else
      {
        do
        {
          unsigned int v128 = bswap32(*(_DWORD *)(v84 + 4 * v127));
          v127 -= 2;
          BOOL v101 = v126-- != 0;
        }
        while (v101 && v128 > v125);
        unsigned int v129 = v127 + 2;
      }
      if (v128 != v125)
      {
        if (v98)
        {
LABEL_179:
          CFRange v132 = CFStringTokenizerGetCurrentTokenRange(v88);
          CFIndex location = v132.location;
          CFIndex length = v132.length;
          BOOL v98 = 0;
          continue;
        }
        unsigned int v133 = 0;
        goto LABEL_182;
      }
      break;
    }
    unsigned int v131 = *(_DWORD *)(v84 + 4 * (v129 | 1));
    if (!v98)
    {
      unsigned int v133 = bswap32(v131);
LABEL_182:
      uint64_t v134 = v243;
      goto LABEL_183;
    }
    if (!v131) {
      goto LABEL_179;
    }
    unsigned int v133 = bswap32(v131);
    uint64_t v134 = -1;
LABEL_183:
    unint64_t v135 = v89 + v134;
    unint64_t v136 = (CFIndex *)(&v254 + v89 + v134);
    *unint64_t v136 = location;
    v136[1] = length;
    *((_DWORD *)v253 + v135) = v133;
    int v137 = var0[location - v246 + v247];
    int v138 = 1;
    if ((v137 - 65) >= 0x1A && (v137 - 192) >= 0x17 && (v137 - 216) >= 7)
    {
      unsigned int v140 = v137 - 138;
      if (v140 > 0x15 || ((1 << v140) & 0x200015) == 0) {
        int v138 = 0;
      }
    }
    BOOL v141 = length >= 2 && v252[length - 1] == 115 && v252[length - 2] != 39;
    unsigned int v142 = v133;
    if (v133 || (unsigned int v142 = 0, length < 1))
    {
LABEL_212:
      if (!v138) {
        goto LABEL_225;
      }
LABEL_213:
      if (v135)
      {
        if (v141) {
          int v149 = 10;
        }
        else {
          int v149 = 2;
        }
        if ((v142 & 0xA) != 0) {
          int v149 = 0;
        }
        unsigned int v142 = v142 & 0xFFF87FFF | v149;
        *((_DWORD *)v253 + v135) = v142;
      }
      if (v142) {
        goto LABEL_234;
      }
      if (v141) {
        int v150 = 14;
      }
      else {
        int v150 = 3;
      }
LABEL_233:
      *((_DWORD *)v253 + v135) = v150;
      goto LABEL_234;
    }
    uint64_t v143 = 0;
    while (2)
    {
      int v144 = v249[location + v143];
      if ((v144 - 33) < 0x20
        || (v144 - 91) < 0x24 && ((0xF0000003FuLL >> (v144 - 91)) & 1) != 0)
      {
        BOOL v145 = 1;
        goto LABEL_209;
      }
      unsigned int v146 = v144 - 161;
      unsigned int v147 = v144 & 0xFFFFFFDF;
      BOOL v145 = v146 < 0x1F || v147 == 215;
      if (v145)
      {
LABEL_209:
        if (++v143 >= (unint64_t)length) {
          break;
        }
        continue;
      }
      break;
    }
    if (v145)
    {
      unsigned int v142 = 0x2000;
      *((_DWORD *)v253 + v135) = 0x2000;
      goto LABEL_212;
    }
    unsigned int v142 = 0;
    if (v138) {
      goto LABEL_213;
    }
LABEL_225:
    unsigned int v151 = v142 & 0xFFFFFFF5;
    if (!v133 || v151)
    {
      *((_DWORD *)v253 + v135) = v151;
      if (v151) {
        goto LABEL_234;
      }
LABEL_230:
      if (v141) {
        int v150 = 4;
      }
      else {
        int v150 = 1;
      }
      goto LABEL_233;
    }
    CFIndex v152 = location;
    BOOL v153 = v141;
    objc_msgSend((id)-[__CFString substringWithRange:](v251, "substringWithRange:", v152, length), "capitalizedString");
    BOOL v141 = v153;
    if (!v142) {
      goto LABEL_230;
    }
LABEL_234:
    unint64_t v89 = v135 + 1;
  }
  while (CFStringTokenizerAdvanceToNextToken(v88) && v89 < 0x100);
LABEL_244:
  if (v88) {
    goto LABEL_245;
  }
LABEL_246:
  BOOL v29 = var0;
  unint64_t v250 = v89;
  if (v89)
  {
    LOBYTE(v156) = 0;
    uint64_t v157 = 0;
    id v158 = &v254;
    while (2)
    {
      if ((v156 & 1) != 0 && v157)
      {
        if (*(void *)v158 > (unint64_t)(*((void *)v158 - 2) + *((void *)v158 - 1) + 1)) {
          goto LABEL_262;
        }
      }
      else if ((v156 & 1) == 0)
      {
        goto LABEL_262;
      }
      int v159 = *((_DWORD *)v253 + v157);
      if (v159) {
        BOOL v160 = (v159 & 0xFFF82BFF) == 0;
      }
      else {
        BOOL v160 = 0;
      }
      if (v160)
      {
        [v237 addObject:objc_msgSend(v236, "_detailWithRange:description:corrections:", *(void *)v158 + v247 - (v246 + a10->var5), *((void *)v158 + 1), objc_msgSend(NSString, "stringWithFormat:", @"The word '%@' may not agree with the rest of the sentence.", -[__CFString substringWithRange:](v251, "substringWithRange:")), 0)];
        BOOL v29 = var0;
      }
      else
      {
        if ((v159 & 0x182070) != 0) {
          int v161 = *((_DWORD *)v253 + v157) | ((*((_DWORD *)v253 + v157) & 5) == 0) | 4;
        }
        else {
          int v161 = *((_DWORD *)v253 + v157) | ((*((_DWORD *)v253 + v157) & 5) == 0);
        }
        *((_DWORD *)v253 + v157) = v161 & 0x18207F;
      }
LABEL_262:
      int v156 = (*((_DWORD *)v253 + v157++) >> 10) & 1;
      ++v158;
      if (v89 != v157) {
        continue;
      }
      break;
    }
    unint64_t v162 = v247 - v246 + *((void *)&v254 + 2 * v89 - 2) + *((void *)&v254 + 2 * v89 - 1);
    unint64_t v163 = a10->var6 + (unint64_t)a10->var5;
    if (v162 >= v163)
    {
      LOBYTE(v166) = 0;
      LOBYTE(v165) = 0;
      char v164 = 0;
      uint64_t v167 = v236;
    }
    else
    {
      char v164 = 0;
      int v165 = 0;
      int v166 = 0;
      uint64_t v167 = v236;
      do
      {
        int v168 = v29[v162];
        if (v168 == 63) {
          int v169 = 1;
        }
        else {
          int v169 = v165;
        }
        if (v168 == 46) {
          int v170 = 1;
        }
        else {
          int v170 = v166;
        }
        if (v168 == 46) {
          int v169 = v165;
        }
        if (v168 == 33)
        {
          char v164 = 1;
        }
        else
        {
          int v166 = v170;
          int v165 = v169;
        }
        ++v162;
      }
      while (v162 < v163);
    }
    uint64_t v171 = 0;
    uint64_t v172 = 0;
    unsigned __int8 v173 = ((v166 & 1) == 0) | v165;
    do
    {
      if ((*((_DWORD *)v253 + v172) & 0x7C000) != 0) {
        ++v171;
      }
      ++v172;
    }
    while (v89 != v172);
    if (v171 == 1)
    {
      if (!(v173 & 1 | ((v253[0] & 0x40000000) == 0))) {
        goto LABEL_293;
      }
      uint64_t v174 = (int *)v253;
      unint64_t v175 = v89;
      do
      {
        int v176 = *v174;
        if ((*v174 & 0x7C000) != 0) {
          int v176 = *v174 & 0x7C000;
        }
        *v174++ = v176;
        --v175;
      }
      while (v175);
    }
    else if (!v171 && ((v173 | v164) & 1) == 0)
    {
LABEL_293:
      objc_msgSend(v237, "addObject:", objc_msgSend(v167, "_detailWithRange:description:corrections:", 0, a10->var6, @"This may be a sentence fragment.", 0));
      BOOL v29 = var0;
    }
    int v177 = 0;
    char v231 = 0;
    int v178 = 0;
    LOBYTE(v179) = 0;
    int v180 = 0;
    int v241 = 0;
    int v233 = 0;
    uint64_t v238 = 0;
    int v244 = 0;
    int v181 = 0;
    int v182 = 0;
    uint64_t v183 = 0;
    uint64_t v184 = (unint64_t *)&v254 + 1;
    int v185 = 1;
    while (2)
    {
      if (v183)
      {
        int v186 = v180;
        uint64_t v187 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet", v29), "invertedSet");
        unint64_t v188 = *(v184 - 2) + *(v184 - 3);
        -[__CFString rangeOfCharacterFromSet:options:range:](v251, "rangeOfCharacterFromSet:options:range:", v187, 0, v188, *(v184 - 1) - v188);
        BOOL v190 = v189 == 0;
        if ((v179 & v190) != 0)
        {
          BOOL v29 = var0;
          int v180 = v186;
          break;
        }
        v177 &= v190;
        v178 &= v190;
        int v180 = v186 & v190;
        BOOL v29 = var0;
      }
      else if (v179)
      {
        break;
      }
      unsigned int v191 = *((_DWORD *)v253 + v183);
      if ((v191 & 0x8000) != 0 && *v184 == 2)
      {
        uint64_t v192 = *(v184 - 1) - v246 + v247;
        if (v29[v192] == 97 && v29[v192 + 1] == 109)
        {
          if ((v177 | v178 | v180))
          {
            char v193 = v182 | v181;
            goto LABEL_385;
          }
          if ((v238 & 1) == 0)
          {
            char v193 = v182 | v181;
            if ((v182 | v181))
            {
LABEL_385:
              BOOL v195 = (v193 & 1) == 0;
              BOOL v196 = &unk_26C1D3510;
              goto LABEL_386;
            }
          }
LABEL_361:
          int v180 = v191 == 0x10000;
          if ((v191 & 0x800) == 0 || *v184 != 2) {
            goto LABEL_391;
          }
          uint64_t v205 = *(v184 - 1) - v246 + v247;
          int v206 = v29[v205];
          if ((v206 - 65) < 0x1A || (v206 - 192) < 0x17)
          {
            if ((v206 - 138) > 0x15 || ((1 << (v206 + 118)) & 0x200015) == 0)
            {
LABEL_366:
              v206 += 32;
              goto LABEL_367;
            }
            goto LABEL_391;
          }
          if ((v206 - 216) < 7) {
            goto LABEL_366;
          }
          if ((v206 - 138) <= 0x15 && ((1 << (v206 + 118)) & 0x200015) != 0) {
            goto LABEL_391;
          }
LABEL_367:
          if (v206 != 116) {
            goto LABEL_391;
          }
          int v207 = v29[v205 + 1];
          if ((v207 - 65) < 0x1A || (v207 - 192) < 0x17)
          {
            if ((v207 - 138) <= 0x15 && ((1 << (v207 + 118)) & 0x200015) != 0) {
              goto LABEL_391;
            }
LABEL_371:
            v207 += 32;
          }
          else
          {
            if ((v207 - 216) < 7) {
              goto LABEL_371;
            }
            if ((v207 - 138) <= 0x15 && ((1 << (v207 + 118)) & 0x200015) != 0)
            {
LABEL_391:
              int v178 = 0;
              goto LABEL_392;
            }
          }
          if (v207 != 111) {
            goto LABEL_391;
          }
          int v233 = 1;
          int v178 = 1;
LABEL_392:
          if ((v191 & 0x68000) == 0) {
            goto LABEL_422;
          }
          uint64_t v208 = *(v184 - 1) - v246 + v247;
          int v209 = v29[v208];
          if ((v209 - 65) < 0x1A || (v209 - 192) < 0x17)
          {
            if ((v209 - 138) > 0x15 || ((1 << (v209 + 118)) & 0x200015) == 0)
            {
LABEL_396:
              v209 += 32;
              goto LABEL_397;
            }
            goto LABEL_422;
          }
          if ((v209 - 216) < 7) {
            goto LABEL_396;
          }
          if ((v209 - 138) <= 0x15 && ((1 << (v209 + 118)) & 0x200015) != 0) {
            goto LABEL_422;
          }
LABEL_397:
          if (v209 != 104) {
            goto LABEL_422;
          }
          int v210 = v29[v208 + 1];
          if ((v210 - 65) < 0x1A || (v210 - 192) < 0x17)
          {
            if ((v210 - 138) <= 0x15 && ((1 << (v210 + 118)) & 0x200015) != 0) {
              goto LABEL_422;
            }
LABEL_401:
            v210 += 32;
          }
          else
          {
            if ((v210 - 216) < 7) {
              goto LABEL_401;
            }
            if ((v210 - 138) <= 0x15 && ((1 << (v210 + 118)) & 0x200015) != 0)
            {
LABEL_422:
              unint64_t v212 = *v184;
              if (*v184 < 3) {
                goto LABEL_497;
              }
              unint64_t v213 = v247 - v246 + v212 + *(v184 - 1);
              int v214 = v29[v213 - 2];
              if (v214 != 39) {
                goto LABEL_437;
              }
              int v215 = v29[v213 - 1];
              if ((v215 - 65) < 0x1A || (v215 - 192) < 0x17)
              {
                if ((v215 - 138) <= 0x15 && ((1 << (v215 + 118)) & 0x200015) != 0) {
                  goto LABEL_437;
                }
                if (v215 == 83) {
                  goto LABEL_436;
                }
              }
              else if ((v215 - 216) >= 7)
              {
                if ((v215 - 115) > 0x2C) {
                  goto LABEL_435;
                }
                if (((1 << (v215 - 115)) & 0x10000A800000) == 0)
                {
                  if (v215 == 115) {
                    goto LABEL_436;
                  }
LABEL_435:
                  if (v215 == 100)
                  {
LABEL_436:
                    char v231 = 1;
                    int v177 = 1;
                    goto LABEL_498;
                  }
                }
LABEL_437:
                if (v212 < 4 || v29[v213 - 3] != 39) {
                  goto LABEL_497;
                }
                if ((v214 - 65) >= 0x1A && (v214 - 192) >= 0x17)
                {
                  if ((v214 - 216) < 7) {
                    goto LABEL_442;
                  }
                  if ((v214 - 138) <= 0x15 && ((1 << (v214 + 118)) & 0x200015) != 0) {
                    goto LABEL_497;
                  }
LABEL_443:
                  if (v214 != 118) {
                    goto LABEL_497;
                  }
                  int v216 = v29[v213 - 1];
                  if ((v216 - 65) < 0x1A || (v216 - 192) < 0x17)
                  {
                    if ((v216 - 138) <= 0x15 && ((1 << (v216 + 118)) & 0x200015) != 0) {
                      goto LABEL_497;
                    }
LABEL_447:
                    v216 += 32;
                  }
                  else
                  {
                    if ((v216 - 216) < 7) {
                      goto LABEL_447;
                    }
                    if ((v216 - 138) <= 0x15 && ((1 << (v216 + 118)) & 0x200015) != 0)
                    {
LABEL_497:
                      int v177 = 0;
LABEL_498:
                      v182 |= (v191 & 0x44083003) != 0;
                      v181 |= (v191 & 0x7280300C) != 0;
                      v244 |= (v191 & 0x72A0300C) != 0;
                      LODWORD(v238) = v238 | ((v191 & 0x200000) >> 21);
                      HIDWORD(v238) |= (v191 & 0x10000) >> 16;
                      int v179 = (v191 >> 13) & 1;
                      v241 |= (unsigned __int16)(v191 & 0x800) >> 11;
                      int v185 = ((v191 & 0x7C000) == 0) & v185;
                      ++v183;
                      v184 += 2;
                      if (v250 == v183) {
                        goto LABEL_565;
                      }
                      continue;
                    }
                  }
                  if (v216 == 101) {
                    goto LABEL_436;
                  }
                  goto LABEL_497;
                }
                if ((v214 - 138) > 0x15 || ((1 << (v214 + 118)) & 0x200015) == 0)
                {
LABEL_442:
                  v214 += 32;
                  goto LABEL_443;
                }
                goto LABEL_497;
              }
              v215 += 32;
              goto LABEL_435;
            }
          }
          if (v210 != 97) {
            goto LABEL_422;
          }
          switch(*v184)
          {
            case 3uLL:
              int v211 = v29[v208 + 2];
              if ((v211 - 65) < 0x1A || (v211 - 192) < 0x17)
              {
                if ((v211 - 138) <= 0x15 && ((1 << (v211 + 118)) & 0x200015) != 0) {
                  goto LABEL_422;
                }
                if (v211 == 83) {
                  goto LABEL_436;
                }
LABEL_503:
                v211 += 32;
                goto LABEL_504;
              }
              if ((v211 - 216) < 7) {
                goto LABEL_503;
              }
              if ((v211 - 115) <= 0x2C)
              {
                if (((1 << (v211 - 115)) & 0x10000A800000) != 0) {
                  goto LABEL_422;
                }
                if (v211 == 115) {
                  goto LABEL_436;
                }
              }
LABEL_504:
              if (v211 != 100) {
                goto LABEL_422;
              }
              goto LABEL_436;
            case 4uLL:
              int v217 = v29[v208 + 2];
              if ((v217 - 65) < 0x1A || (v217 - 192) < 0x17)
              {
                if ((v217 - 138) <= 0x15 && ((1 << (v217 + 118)) & 0x200015) != 0) {
                  goto LABEL_422;
                }
LABEL_462:
                v217 += 32;
                goto LABEL_463;
              }
              if ((v217 - 216) < 7) {
                goto LABEL_462;
              }
              if ((v217 - 138) <= 0x15 && ((1 << (v217 + 118)) & 0x200015) != 0) {
                goto LABEL_422;
              }
LABEL_463:
              if (v217 != 118) {
                goto LABEL_422;
              }
              int v218 = v29[v208 + 3];
              if ((v218 - 65) < 0x1A || (v218 - 192) < 0x17)
              {
                if ((v218 - 138) <= 0x15 && ((1 << (v218 + 118)) & 0x200015) != 0) {
                  goto LABEL_422;
                }
LABEL_467:
                v218 += 32;
                goto LABEL_468;
              }
              if ((v218 - 216) < 7) {
                goto LABEL_467;
              }
              if ((v218 - 138) <= 0x15 && ((1 << (v218 + 118)) & 0x200015) != 0) {
                goto LABEL_422;
              }
LABEL_468:
              if (v218 != 101) {
                goto LABEL_422;
              }
              goto LABEL_436;
            case 6uLL:
              int v219 = v29[v208 + 2];
              if ((v219 - 65) >= 0x1A && (v219 - 192) >= 0x17)
              {
                if ((v219 - 216) < 7)
                {
LABEL_512:
                  v219 += 32;
                }
                else if ((v219 - 115) <= 0x2C)
                {
                  if (((1 << (v219 - 115)) & 0x10000A800000) != 0) {
                    goto LABEL_422;
                  }
                  if (v219 == 115) {
                    goto LABEL_514;
                  }
                }
                if (v219 != 100) {
                  goto LABEL_422;
                }
                goto LABEL_514;
              }
              if ((v219 - 138) <= 0x15 && ((1 << (v219 + 118)) & 0x200015) != 0) {
                goto LABEL_422;
              }
              if (v219 != 83) {
                goto LABEL_512;
              }
LABEL_514:
              int v225 = v29[v208 + 3];
              if ((v225 - 65) < 0x1A || (v225 - 192) < 0x17)
              {
                if ((v225 - 138) <= 0x15 && ((1 << (v225 + 118)) & 0x200015) != 0) {
                  goto LABEL_422;
                }
              }
              else if ((v225 - 216) >= 7)
              {
                if ((v225 - 138) <= 0x15 && ((1 << (v225 + 118)) & 0x200015) != 0) {
                  goto LABEL_422;
                }
LABEL_518:
                if (v225 != 110) {
                  goto LABEL_422;
                }
                uint64_t v226 = &v29[v208];
                if (v226[4] != 39) {
                  goto LABEL_422;
                }
                int v227 = v226[5];
                if ((v227 - 65) < 0x1A || (v227 - 192) < 0x17)
                {
                  if ((v227 - 138) <= 0x15 && ((1 << (v227 + 118)) & 0x200015) != 0) {
                    goto LABEL_422;
                  }
                }
                else if ((v227 - 216) >= 7)
                {
                  if ((v227 - 138) <= 0x15 && ((1 << (v227 + 118)) & 0x200015) != 0) {
                    goto LABEL_422;
                  }
                  goto LABEL_524;
                }
                v227 += 32;
LABEL_524:
                if (v227 != 116) {
                  goto LABEL_422;
                }
                goto LABEL_436;
              }
              v225 += 32;
              goto LABEL_518;
            case 7uLL:
              int v220 = v29[v208 + 2];
              if ((v220 - 65) < 0x1A || (v220 - 192) < 0x17)
              {
                if ((v220 - 138) <= 0x15 && ((1 << (v220 + 118)) & 0x200015) != 0) {
                  goto LABEL_422;
                }
LABEL_480:
                v220 += 32;
                goto LABEL_481;
              }
              if ((v220 - 216) < 7) {
                goto LABEL_480;
              }
              if ((v220 - 138) <= 0x15 && ((1 << (v220 + 118)) & 0x200015) != 0) {
                goto LABEL_422;
              }
LABEL_481:
              if (v220 != 118) {
                goto LABEL_422;
              }
              int v221 = v29[v208 + 3];
              if ((v221 - 65) < 0x1A || (v221 - 192) < 0x17)
              {
                if ((v221 - 138) <= 0x15 && ((1 << (v221 + 118)) & 0x200015) != 0) {
                  goto LABEL_422;
                }
LABEL_485:
                v221 += 32;
                goto LABEL_486;
              }
              if ((v221 - 216) < 7) {
                goto LABEL_485;
              }
              if ((v221 - 138) <= 0x15 && ((1 << (v221 + 118)) & 0x200015) != 0) {
                goto LABEL_422;
              }
LABEL_486:
              if (v221 != 101) {
                goto LABEL_422;
              }
              int v222 = v29[v208 + 4];
              if ((v222 - 65) < 0x1A || (v222 - 192) < 0x17)
              {
                if ((v222 - 138) <= 0x15 && ((1 << (v222 + 118)) & 0x200015) != 0) {
                  goto LABEL_422;
                }
LABEL_490:
                v222 += 32;
                goto LABEL_491;
              }
              if ((v222 - 216) < 7) {
                goto LABEL_490;
              }
              if ((v222 - 138) <= 0x15 && ((1 << (v222 + 118)) & 0x200015) != 0) {
                goto LABEL_422;
              }
LABEL_491:
              if (v222 != 110) {
                goto LABEL_422;
              }
              uint64_t v223 = &v29[v208];
              if (v223[5] != 39) {
                goto LABEL_422;
              }
              int v224 = toLower(v223[6]);
              int v180 = v191 == 0x10000;
              BOOL v29 = var0;
              if (v224 != 116) {
                goto LABEL_422;
              }
              goto LABEL_436;
            default:
              goto LABEL_422;
          }
        }
      }
      break;
    }
    unsigned int v191 = *((_DWORD *)v253 + v183);
    if ((v191 & 0x20000) != 0 && *v184 == 2)
    {
      uint64_t v194 = *(v184 - 1) - v246 + v247;
      if (v29[v194] == 105 && v29[v194 + 1] == 115)
      {
        if (((v177 | v178 | v180) & 1) == 0 && ((v244 & ~v182 & 1) == 0 || ((v233 ^ 1 | v185) & 1) == 0)) {
          goto LABEL_361;
        }
        BOOL v195 = (v244 & 1) == 0;
        BOOL v196 = &unk_26C1D3528;
LABEL_386:
        if (v195) {
          int v202 = 0;
        }
        else {
          int v202 = v196;
        }
LABEL_360:
        [v237 addObject:objc_msgSend(v236, "_detailWithRange:description:corrections:", *(v184 - 1) + v247 - (v246 + a10->var5), *v184, objc_msgSend(NSString, "stringWithFormat:", @"The word '%@' may not agree with the rest of the sentence.", -[__CFString substringWithRange:](v251, "substringWithRange:")), v202)];
        BOOL v29 = var0;
        goto LABEL_361;
      }
    }
    if ((v191 & 0x8000) != 0
      && *v184 == 3
      && (uint64_t v197 = *(v184 - 1) - v246 + v247, v29[v197] == 97)
      && (char v198 = &v29[v197], v198[1] == 114)
      && v198[2] == 101)
    {
      if (((v177 | v178 | v180) & 1) == 0 && v181 & 1 | (((v182 | v238) & 1) == 0)) {
        goto LABEL_361;
      }
    }
    else if ((v191 & 0x40000) != 0 {
           && *v184 == 3
    }
           && (uint64_t v199 = *(v184 - 1) - v246 + v247, v29[v199] == 119)
           && (id v200 = &v29[v199], v200[1] == 97)
           && v200[2] == 115)
    {
      if ((v177 | v178 | v180) & 1) == 0 && (((v238 | v182) & 1) != 0 || ((v181 ^ 1))) {
        goto LABEL_361;
      }
    }
    else if ((v191 & 0x100000) != 0 {
           && *v184 == 4
    }
           && (uint64_t v201 = *(v184 - 1) - v246 + v247, v29[v201] == 98)
           && v29[v201 + 1] == 101
           && v29[v201 + 2] == 101
           && v29[v201 + 3] == 110)
    {
      if (v231) {
        goto LABEL_361;
      }
    }
    else
    {
      switch(v191)
      {
        case 0x40000u:
          if (((v177 | v178 | v180) & 1) == 0) {
            goto LABEL_361;
          }
          break;
        case 0x20000u:
          if ((v177 | v178 | v180))
          {
            int v202 = 0;
            unsigned int v191 = 0x20000;
            goto LABEL_360;
          }
          unsigned int v191 = 0x20000;
          if ((v244 & ~v182 & 1) == 0 || ((v233 ^ 1 | v185) & 1) == 0) {
            goto LABEL_361;
          }
          break;
        case 0x8000u:
          if (v244 & 1 | ((v185 & v182 & 1) == 0) | (BYTE4(v238) | v233) & 1) {
            goto LABEL_361;
          }
          break;
        default:
          BOOL v204 = (v191 & 0xFEBFFFFF) == 0 && v191 != 0;
          if (v241 & 1 | ((v204 & v185 & 1) == 0)) {
            goto LABEL_361;
          }
          break;
      }
    }
    int v202 = 0;
    goto LABEL_360;
  }
LABEL_565:
  uint64_t v22 = a10;
  int v23 = v234;
  CFLocaleRef v24 = v235;
LABEL_566:
  uint64_t v228 = objc_msgSend(v237, "count", v29);
  if (!v228)
  {
    if (*v23 != 200)
    {
      if (!v22->var6)
      {
        v22->unint64_t var5 = v232;
        if (!v24) {
          return v228 != 0;
        }
        goto LABEL_576;
      }
      v22->var5 += v22->var6;
    }
    goto LABEL_575;
  }
  if (a13) {
    *a13 = v237;
  }
  if (!a12)
  {
LABEL_575:
    if (v24) {
      goto LABEL_576;
    }
    return v228 != 0;
  }
  NSUInteger v229 = v22->var6;
  a12->CFIndex location = v246 - v247 + v22->var5;
  a12->CFIndex length = v229;
  if (!v24) {
    return v228 != 0;
  }
LABEL_576:
  CFRelease(v24);
  return v228 != 0;
}

- (void)_addContextAlternativesForZhuyinInputString:(id)a3 modifications:(id)a4 afterIndex:(unint64_t)a5 delta:(int64_t)a6 toArray:(id)a7
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v9 = [a4 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v49;
    uint64_t v34 = *(void *)v49;
    int64_t v35 = a6;
    do
    {
      uint64_t v12 = 0;
      uint64_t v36 = v10;
      do
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(a4);
        }
        uint64_t v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
        unint64_t v14 = [v13 range];
        uint64_t v41 = v15;
        unint64_t v16 = [v13 syllableRange];
        uint64_t v42 = v17;
        unint64_t v40 = v14;
        if (v14 >= a5 && v16 >= a5)
        {
          unint64_t v19 = v16;
          uint64_t v39 = v12;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          uint64_t v20 = [a4 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (!v20)
          {
            char v24 = 1;
LABEL_27:
            signed int v30 = (void *)[a3 mutableCopy];
            unsigned int v31 = (void *)[v13 replacementString];
            uint64_t v32 = [v31 length];
            objc_msgSend(v30, "replaceCharactersInRange:withString:", v40 + a6, v41, v31);
            if (v24)
            {
              if (([a7 containsObject:v30] & 1) == 0) {
                [a7 addObject:v30];
              }
            }
            else
            {
              [(AppleSpell *)self _addContextAlternativesForZhuyinInputString:v30 modifications:a4 afterIndex:v19 + v42 delta:a6 - v41 + v32 toArray:a7];
            }

            uint64_t v12 = v39;
            goto LABEL_32;
          }
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v45;
          char v23 = 1;
          char v24 = 1;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v45 != v22) {
                objc_enumerationMutation(a4);
              }
              int v26 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              unint64_t v27 = [v26 syllableRange];
              if (v26 != v13 && v27 >= a5)
              {
                v23 &= v27 + v28 > v19;
                v24 &= v19 + v42 > v27;
              }
            }
            uint64_t v21 = [a4 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v21);
          uint64_t v11 = v34;
          a6 = v35;
          uint64_t v10 = v36;
          uint64_t v12 = v39;
          if (v23) {
            goto LABEL_27;
          }
        }
LABEL_32:
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [a4 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v10);
  }
}

- (id)contextAlternativeAnnotatedStringsForZhuyinInputString:(id)a3
{
  uint64_t v5 = objc_alloc_init(PRZhuyinContext);
  uint64_t v6 = [a3 length];
  uint64_t v7 = (void *)[MEMORY[0x263EFF980] array];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
      -[PRZhuyinContext addInputCharacter:geometryModel:geometryData:](v5, "addInputCharacter:geometryModel:geometryData:", [a3 characterAtIndex:i], 0, 0);
  }
  [(AppleSpell *)self _addContextAlternativesForZhuyinInputString:a3 modifications:[(PRZhuyinContext *)v5 currentModifications] afterIndex:0 delta:0 toArray:v7];

  return v7;
}

- (void)_addTwoLetterWordGuessesForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 isCapitalized:(BOOL)a7 isAllCaps:(BOOL)a8 twoLetterWords:(const char *)a9 candidateList:(id)a10
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (a5 == 2)
  {
    if (a9)
    {
      BOOL v10 = a8;
      BOOL v11 = a7;
      uint64_t v13 = objc_msgSend(a6, "encoding", a3);
      unsigned __int8 v14 = toLowerX_1(*a4, v13);
      unsigned __int8 v15 = toLowerX_1(a4[1], v13);
      size_t v16 = strlen(a9);
      if (v16)
      {
        size_t v17 = v16;
        size_t v18 = 0;
        int v19 = v15;
        int v20 = v14;
        while (a9[v18] != v15 || a9[v18 + 1] != v14)
        {
          v18 += 2;
          if (v18 >= v16) {
            goto LABEL_15;
          }
        }
        char v30 = v15;
        char v31 = v14;
        char v32 = 0;
        uint64_t v21 = 3;
        if (!v11) {
          uint64_t v21 = 1;
        }
        if (v10) {
          uint64_t v22 = 2;
        }
        else {
          uint64_t v22 = v21;
        }
        [a10 addTranspositionCandidateWithBuffer:&v30 encoding:v13 transform:v22 intendedFirstCharacter:v15 intendedSecondCharacter:v14];
LABEL_15:
        unsigned __int8 v29 = v14;
        size_t v23 = 0;
        uint64_t v24 = 3;
        if (!v11) {
          uint64_t v24 = 1;
        }
        if (v10) {
          uint64_t v25 = 2;
        }
        else {
          uint64_t v25 = v24;
        }
        do
        {
          if (a9[v23] == v20)
          {
            uint64_t v26 = a9[v23 + 1];
            if (adjacentMatch(v15, a9[v23 + 1], v13))
            {
              char v30 = v20;
              char v31 = v26;
              char v32 = 0;
              [a10 addReplacementCandidateWithBuffer:&v30 encoding:v13 transform:v25 intendedCharacter:v26 actualCharacter:v15];
            }
          }
          v23 += 2;
        }
        while (v23 < v17);
        for (size_t i = 0; i < v17; i += 2)
        {
          if (a9[i + 1] == v19)
          {
            uint64_t v28 = a9[i];
            if (adjacentMatch(v29, a9[i], v13))
            {
              char v30 = v28;
              char v31 = v19;
              char v32 = 0;
              [a10 addReplacementCandidateWithBuffer:&v30 encoding:v13 transform:v25 intendedCharacter:v28 actualCharacter:v29];
            }
          }
        }
      }
    }
  }
}

- (void)_addConnectionGuessesForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 connection:(_PR_DB_IO *)a7 candidateList:(id)a8
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (a5 - 2 <= 0x3D && a7 != 0)
  {
    uint64_t v13 = objc_msgSend(a6, "encoding", a3);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v45 = 0;
    memset(v33, 0, sizeof(v33));
    long long v34 = 0u;
    HIDWORD(v34) = 0;
    int v35 = 0;
    uint64_t v36 = a4;
    *(void *)&long long v43 = v33;
    BYTE7(v44) = 1;
    *(_WORD *)((char *)&v44 + 9) = *(_WORD *)&a7->var0;
    PRword((uint64_t)&v36, 8, 0);
    unsigned __int8 v14 = (void *)v37;
    if ((void)v37)
    {
      if (*(void *)(v37 + 8))
      {
        if (*(void *)v37)
        {
          uint64_t v15 = *(unsigned __int16 *)(v37 + 18);
          if (*(_WORD *)(v37 + 18))
          {
            uint64_t v16 = 0;
            do
            {
              size_t v17 = (const char *)(*v14 + *(__int16 *)(v14[1] + 2 * v16));
              if (strlen(v17) == a5)
              {
                unint64_t v18 = 0;
                do
                {
                  uint64_t v19 = removeDiacriticsX_0(a4[v18], v13);
                  int v20 = toLowerX_1(v19, v13);
                  uint64_t v21 = removeDiacriticsX_0(v17[v18], v13);
                  int v22 = toLowerX_1(v21, v13);
                  ++v18;
                }
                while (v20 == v22 && v18 < a5);
                if (v20 == v22) {
                  [a8 addCandidateWithBuffer:v17 encoding:v13 errorType:1];
                }
              }
              ++v16;
            }
            while (v16 != v15);
            if (v15)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                uint64_t v25 = (const char *)(*v14 + *(__int16 *)(v14[1] + 2 * i));
                if (strlen(v25) == a5)
                {
                  if (!a5) {
                    goto LABEL_34;
                  }
                  BOOL v26 = 0;
                  unint64_t v27 = 0;
                  do
                  {
                    int v28 = a4[v27];
                    int v29 = v25[v27];
                    BOOL v30 = v28 == v29;
                    if (v28 != v29 && !v26)
                    {
                      BOOL v30 = adjacentMatch(a4[v27], v29, v13);
                      BOOL v26 = v30;
                    }
                    ++v27;
                  }
                  while (v30 && v27 < a5);
                  if (v30) {
LABEL_34:
                  }
                    [a8 addCandidateWithBuffer:v25 encoding:v13 errorType:7];
                }
              }
              uint64_t v32 = 0;
              do
              {
                [a8 addCandidateWithBuffer:*v14 + *(__int16 *)(v14[1] + v32) encoding:v13 errorType:8];
                v32 += 2;
              }
              while (2 * v15 != v32);
            }
          }
        }
      }
    }
    PRword((uint64_t)&v36, 17, 0);
  }
}

- (void)_addAdditionalGuessesForWord:(id)a3 sender:(id)a4 buffer:(char *)a5 length:(unint64_t)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8 accents:(const char *)a9 isCapitalized:(BOOL)a10 isAllCaps:(BOOL)a11 isAllAlpha:(BOOL)a12 hasLigature:(BOOL)a13 suggestPossessive:(BOOL)a14 checkUser:(BOOL)a15 checkHyphens:(BOOL)a16 candidateList:(id)a17
{
  int v221 = a8;
  uint64_t v227 = *MEMORY[0x263EF8340];
  unsigned int v219 = objc_msgSend(a7, "encoding", a3);
  if ((a6 & 0x7FFFFFFFFFFFFF80) != 0 || a6 < 2 || !a13) {
    goto LABEL_21;
  }
  p_s = &__s;
  for (uint64_t i = a5; ; ++i)
  {
    unsigned int v23 = *i;
    if (v23 > 0xC5)
    {
      switch(v23)
      {
        case 0xC6u:
          *(_WORD *)p_s = 25921;
          p_s += 2;
          continue;
        case 0xDFu:
          *(_WORD *)p_s = 29555;
          p_s += 2;
          continue;
        case 0xE6u:
          *(_WORD *)p_s = 25953;
          p_s += 2;
          continue;
      }
      goto LABEL_17;
    }
    if (v23 == 140)
    {
      *(_WORD *)p_s = 25935;
      p_s += 2;
      continue;
    }
    if (v23 == 156)
    {
      *(_WORD *)p_s = 25967;
      p_s += 2;
      continue;
    }
    if (!*i) {
      break;
    }
LABEL_17:
    *p_s++ = v23;
  }
  char *p_s = 0;
  *(_WORD *)((char *)&v196 + 5) = 0;
  BYTE4(v196) = a16;
  BYTE3(v196) = 0;
  BYTE2(v196) = a15;
  LOWORD(v196) = 1;
  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, strlen(&__s), a7, v221, a4, 1, v196, 0))
  {
    [a17 addCandidateWithBuffer:&__s encoding:v219 errorType:4];
  }
LABEL_21:
  BOOL v24 = danishAccents == (_UNKNOWN *)a9 || norwegianAccents == (_UNKNOWN *)a9;
  int v26 = !v24 && nynorskAccents != (_UNKNOWN *)a9;
  BOOL v27 = a6 < 3 || a11;
  if (a6 > 0x17 || v27 || v26 || ([a17 isFull] & 1) != 0) {
    goto LABEL_52;
  }
  int v28 = &__s;
  int v29 = a5;
  while (2)
  {
    int v30 = *v29;
    if (v30 == 65)
    {
      char v31 = v29 + 1;
      if (v29[1] != 101) {
        goto LABEL_49;
      }
      LOBYTE(v30) = -58;
LABEL_48:
      int v29 = v31;
      goto LABEL_49;
    }
    if (v30 == 97)
    {
      char v31 = v29 + 1;
      int v32 = v29[1];
      if (v32 == 97)
      {
        LOBYTE(v30) = -27;
      }
      else
      {
        if (v32 != 101) {
          goto LABEL_49;
        }
        LOBYTE(v30) = -26;
      }
      goto LABEL_48;
    }
    if (*v29)
    {
LABEL_49:
      *v28++ = v30;
      ++v29;
      continue;
    }
    break;
  }
  *int v28 = 0;
  *(_WORD *)((char *)&v196 + 5) = 0;
  BYTE4(v196) = a16;
  BYTE3(v196) = 0;
  BYTE2(v196) = a15;
  LOWORD(v196) = 1;
  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, strlen(&__s), a7, v221, a4, 1, v196, 0))
  {
    [a17 addCandidateWithBuffer:&__s encoding:v219 errorType:4];
  }
LABEL_52:
  int v202 = a5;
  unint64_t v34 = a6;
  if (a6 <= 0x17 && a9 && !v27 && ([a17 isFull] & 1) == 0)
  {
    char v35 = *a5;
    if (*a5)
    {
      uint64_t v36 = a5 + 1;
      long long v37 = &__s;
      do
      {
        *v37++ = v35;
        int v38 = *v36++;
        char v35 = v38;
      }
      while (v38);
    }
    else
    {
      long long v37 = &__s;
    }
    *long long v37 = 0;
    int v209 = __s;
    if (__s)
    {
      if (a10) {
        uint64_t v39 = 3;
      }
      else {
        uint64_t v39 = 1;
      }
      int v203 = &__s;
      do
      {
        int v40 = *(unsigned __int8 *)a9;
        if (*a9)
        {
          uint64_t v208 = v203 + 1;
          long long v41 = a9;
          do
          {
            if (v40 == v209)
            {
              *int v203 = v41[1];
              *(_WORD *)((char *)&v196 + 5) = 0;
              BYTE4(v196) = a16;
              BYTE3(v196) = 1;
              BYTE2(v196) = a15;
              LOWORD(v196) = 1;
              if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
              {
                [a17 addCandidateWithBuffer:&__s encoding:v219 transform:v39 errorType:1];
              }
              int v42 = *v208;
              if (*v208)
              {
                long long v43 = v203 + 1;
                do
                {
                  int v44 = *(unsigned __int8 *)a9;
                  if (*a9)
                  {
                    uint64_t v45 = a9 + 2;
                    do
                    {
                      if (v44 == v42)
                      {
                        *long long v43 = *(v45 - 1);
                        *(_DWORD *)((char *)&v196 + 3) = 257;
                        BYTE2(v196) = a15;
                        LOWORD(v196) = 1;
                        if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
                        {
                          [a17 addCandidateWithBuffer:&__s encoding:v219 transform:v39 errorType:1];
                        }
                      }
                      int v46 = *(unsigned __int8 *)v45;
                      v45 += 2;
                      int v44 = v46;
                    }
                    while (v46);
                  }
                  *long long v43 = v42;
                  int v47 = *++v43;
                  int v42 = v47;
                }
                while (v47);
              }
            }
            int v48 = *((unsigned __int8 *)v41 + 2);
            v41 += 2;
            int v40 = v48;
          }
          while (v48);
        }
        *int v203 = v209;
        int v49 = *++v203;
        int v209 = v49;
      }
      while (v49);
    }
  }
  BOOL v51 = v219 == 1280 || v219 == 517;
  int64_t v207 = v34;
  if (v34 < 4 || !v51)
  {
LABEL_104:
    uint64_t v52 = a5;
    if (v34 != 3 || v219 != 1280) {
      goto LABEL_128;
    }
    if ([a17 isFull]) {
      goto LABEL_139;
    }
    unsigned __int8 v61 = *a5;
    if (!*a5)
    {
LABEL_126:
      char v225 = v224;
      char v224 = 38;
      char v226 = 0;
      if ([(AppleSpell *)self checkNameWordBuffer:&__s length:4 languageObject:a7 globalOnly:0])
      {
        [a17 addCandidateWithBuffer:&__s encoding:1280 errorType:2];
      }
      goto LABEL_128;
    }
    int v62 = a5 + 1;
    unsigned int v63 = &__s;
    while (1)
    {
      if (v61 <= 0xF7u && (v61 - 97 >= 0x1A ? (BOOL v64 = v61 - 223 >= 0x18) : (BOOL v64 = 0), v64))
      {
        if (v61 - 154 > 4 || ((1 << (v61 + 102)) & 0x15) == 0) {
          goto LABEL_125;
        }
      }
      else if (v61 - 154 > 4 || ((1 << (v61 + 102)) & 0x15) == 0)
      {
        char v65 = v61 - 32;
        if (v61 == 255) {
          char v65 = -97;
        }
        if (v61 != 223) {
          unsigned __int8 v61 = v65;
        }
        goto LABEL_125;
      }
      v61 -= 16;
LABEL_125:
      *v63++ = v61;
      int v66 = *v62++;
      unsigned __int8 v61 = v66;
      if (!v66) {
        goto LABEL_126;
      }
    }
  }
  uint64_t v52 = a5;
  if (([a17 isFull] & 1) == 0)
  {
    char v53 = *a5;
    if (*a5)
    {
      uint64_t v54 = a5 + 1;
      int v55 = &__s;
      do
      {
        *v55++ = v53;
        int v56 = *v54++;
        char v53 = v56;
      }
      while (v56);
    }
    else
    {
      int v55 = &__s;
    }
    *int v55 = 0;
    uint64_t v57 = __s;
    if (__s)
    {
      int v58 = &__s;
      do
      {
        if (isUpperCaseX(v57, v219)) {
          char v59 = toLowerX_1(v57, v219);
        }
        else {
          char v59 = toUpperX_0(v57, v219);
        }
        *int v58 = v59;
        if ([(AppleSpell *)self checkNameWordBuffer:&__s length:v34 languageObject:a7 globalOnly:0])
        {
          [a17 addCandidateWithBuffer:&__s encoding:v219 errorType:2];
        }
        *int v58 = v57;
        unsigned int v60 = *++v58;
        uint64_t v57 = v60;
      }
      while (v60);
    }
    goto LABEL_104;
  }
LABEL_128:
  if (v34 >= 4 && a14)
  {
    unint64_t v67 = v34 - 1;
    if (v52[v34 - 1] == 115 && v52[v34 - 2] != 39 && ([a17 isFull] & 1) == 0)
    {
      char v68 = *v52;
      if (*v52)
      {
        uint64_t v69 = (unsigned __int8 *)(v52 + 1);
        uint64_t v70 = &__s;
        do
        {
          *v70++ = v68;
          int v71 = *v69++;
          char v68 = v71;
        }
        while (v71);
      }
      *(&__s + v67) = 0;
      *(_WORD *)((char *)&v196 + 5) = 0;
      BYTE4(v196) = a16;
      BYTE3(v196) = 1;
      BYTE2(v196) = a15;
      LOWORD(v196) = 1;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34 - 1, a7, v221, a4, 1, v196, 0))
      {
        *(&__s + v67) = 39;
        *(_WORD *)(&__s + v34) = 115;
        [a17 addCandidateWithBuffer:&__s encoding:v219 errorType:3];
      }
      goto LABEL_138;
    }
LABEL_139:
    if (([a17 isFull] & 1) == 0)
    {
      char v72 = *a5;
      if (*a5)
      {
        CFStringRef v73 = a5 + 1;
        uint64_t v74 = &__s;
        do
        {
          *v74++ = v72;
          int v75 = *v73++;
          char v72 = v75;
        }
        while (v75);
      }
      else
      {
        uint64_t v74 = &__s;
      }
      *uint64_t v74 = 0;
      int v76 = __s;
      if (__s)
      {
        uint64_t v77 = 3;
        if (!a10) {
          uint64_t v77 = 1;
        }
        if (a11) {
          uint64_t v78 = 2;
        }
        else {
          uint64_t v78 = v77;
        }
        uint64_t v79 = &v223;
        do
        {
          int v80 = *v79;
          if (!*v79) {
            break;
          }
          if (isAnyAlphaX_0(v76, v219) && isAnyAlphaX_0(v80, v219))
          {
            *(v79 - 1) = v80;
            *uint64_t v79 = v76;
            *(_WORD *)((char *)&v196 + 5) = 0;
            BYTE4(v196) = a16;
            BYTE3(v196) = 1;
            BYTE2(v196) = a15;
            LOWORD(v196) = 1;
            if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
            {
              [a17 addTranspositionCandidateWithBuffer:&__s encoding:v219 transform:v78 intendedFirstCharacter:*(v79 - 1) intendedSecondCharacter:*v79];
            }
            int v80 = *(v79 - 1);
            *(v79 - 1) = *v79;
            *uint64_t v79 = v80;
          }
          ++v79;
          int v76 = v80;
        }
        while (v80);
      }
    }
    if (v34 > 0x17) {
      goto LABEL_228;
    }
    int v81 = a5;
    if (([a17 isFull] & 1) == 0)
    {
      char v82 = *a5;
      if (*a5)
      {
        BOOL v83 = a5 + 1;
        uint64_t v84 = &__s;
        do
        {
          *v84++ = v82;
          int v85 = *v83++;
          char v82 = v85;
        }
        while (v85);
      }
      else
      {
        uint64_t v84 = &__s;
      }
      *uint64_t v84 = 0;
      uint64_t v86 = 26;
      if (v219 == 517) {
        uint64_t v86 = 32;
      }
      uint64_t v199 = v86;
      char v87 = 97;
      if (v219 == 517) {
        char v87 = -48;
      }
      char v204 = v87;
      uint64_t v88 = 3;
      if (!a10) {
        uint64_t v88 = 1;
      }
      if (a11) {
        uint64_t v88 = 2;
      }
      uint64_t v210 = v88;
      unint64_t v89 = v34;
      do
      {
        unint64_t v90 = v89 - 1;
        if (v89 == 1 && !isAnyAlphaX_0(v223, v219)) {
          break;
        }
        unint64_t v91 = (unsigned __int8 *)(&__s + v90);
        if (v89 != v34 || isAnyAlphaX_0(*(v91 - 1), v219))
        {
          uint64_t v92 = *(&__s + v90);
          int v93 = toLowerX_1(v92, v219);
          BOOL v94 = a10;
          if (v89 != 1) {
            BOOL v94 = 0;
          }
          int v214 = v94 || a11;
          unsigned __int8 v95 = v204;
          uint64_t v96 = v199;
          do
          {
            if (v93 != v95 && adjacentMatch(v93, v95, v219))
            {
              unsigned __int8 v97 = v95;
              if (v214) {
                unsigned __int8 v97 = toUpperX_0(v95, v219);
              }
              *unint64_t v91 = v97;
              *(_WORD *)((char *)&v196 + 5) = 0;
              BYTE4(v196) = a16;
              BYTE3(v196) = 1;
              BYTE2(v196) = a15;
              LOWORD(v196) = 1;
              if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
              {
                [a17 addReplacementCandidateWithBuffer:&__s encoding:v219 transform:v210 intendedCharacter:*v91 actualCharacter:v92];
              }
            }
            ++v95;
            --v96;
          }
          while (v96);
          *unint64_t v91 = v92;
          int v81 = v202;
        }
        --v89;
      }
      while (v90);
    }
    if (([a17 isFull] & 1) == 0)
    {
      char v98 = *v81;
      if (*v81)
      {
        uint64_t v99 = (unsigned __int8 *)(v81 + 1);
        int v100 = &__s;
        do
        {
          *v100++ = v98;
          int v101 = *v99++;
          char v98 = v101;
        }
        while (v101);
      }
      else
      {
        int v100 = &__s;
      }
      char *v100 = 0;
      uint64_t v102 = 26;
      if (v219 == 517) {
        uint64_t v102 = 32;
      }
      uint64_t v200 = v102;
      char v103 = 97;
      if (v219 == 517) {
        char v103 = -48;
      }
      char v205 = v103;
      uint64_t v104 = 3;
      if (!a10) {
        uint64_t v104 = 1;
      }
      if (a11) {
        uint64_t v104 = 2;
      }
      uint64_t v211 = v104;
      unint64_t v105 = v34;
      do
      {
        unint64_t v106 = v105 - 1;
        if (v105 == 1 && !isAnyAlphaX_0(v223, v219)) {
          break;
        }
        unsigned int v107 = (unsigned __int8 *)(&__s + v106);
        if (v105 != v34 || isAnyAlphaX_0(*(v107 - 1), v219))
        {
          uint64_t v108 = *(&__s + v106);
          int v109 = toLowerX_1(v108, v219);
          BOOL v110 = a10;
          if (v105 != 1) {
            BOOL v110 = 0;
          }
          int v215 = v110 || a11;
          unsigned __int8 v111 = v205;
          uint64_t v112 = v200;
          do
          {
            if (v109 != v111 && !adjacentMatch(v109, v111, v219))
            {
              unsigned __int8 v113 = v111;
              if (v215) {
                unsigned __int8 v113 = toUpperX_0(v111, v219);
              }
              unsigned __int8 *v107 = v113;
              *(_WORD *)((char *)&v196 + 5) = 0;
              BYTE4(v196) = a16;
              BYTE3(v196) = 1;
              BYTE2(v196) = a15;
              LOWORD(v196) = 1;
              if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
              {
                [a17 addReplacementCandidateWithBuffer:&__s encoding:v219 transform:v211 intendedCharacter:*v107 actualCharacter:v108];
              }
            }
            ++v111;
            --v112;
          }
          while (v112);
          unsigned __int8 *v107 = v108;
          int v81 = v202;
        }
        --v105;
      }
      while (v106);
    }
    if (a9)
    {
      if (([a17 isFull] & 1) == 0)
      {
        char v114 = *v81;
        if (*v81)
        {
          unsigned int v115 = (unsigned __int8 *)(v81 + 1);
          unsigned int v116 = &__s;
          do
          {
            *v116++ = v114;
            int v117 = *v115++;
            char v114 = v117;
          }
          while (v117);
        }
        else
        {
          unsigned int v116 = &__s;
        }
        *unsigned int v116 = 0;
        uint64_t v118 = 3;
        if (!a10) {
          uint64_t v118 = 1;
        }
        if (a11) {
          uint64_t v118 = 2;
        }
        uint64_t v216 = v118;
        unint64_t v119 = v34;
        do
        {
          unint64_t v120 = v119 - 1;
          if (v119 == 1 && !isAnyAlphaX_0(v223, v219)) {
            break;
          }
          int v121 = (unsigned __int8 *)(&__s + v120);
          if (v119 != v34 || isAnyAlphaX_0(*(v121 - 1), v219))
          {
            uint64_t v122 = *v121;
            if (*a9)
            {
              int v123 = toLowerX_1(*v121, v219);
              BOOL v124 = a10;
              if (v119 != 1) {
                BOOL v124 = 0;
              }
              int v125 = v124 || a11;
              unint64_t v126 = a9 + 2;
              do
              {
                uint64_t v127 = *((unsigned __int8 *)v126 - 1);
                if (v123 != v127)
                {
                  if (v125) {
                    LOBYTE(v127) = toUpperX_0(v127, v219);
                  }
                  *int v121 = v127;
                  *(_WORD *)((char *)&v196 + 5) = 0;
                  BYTE4(v196) = a16;
                  BYTE3(v196) = 1;
                  BYTE2(v196) = a15;
                  LOWORD(v196) = 1;
                  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
                  {
                    [a17 addReplacementCandidateWithBuffer:&__s encoding:v219 transform:v216 intendedCharacter:*v121 actualCharacter:v122];
                  }
                }
                int v128 = *(unsigned __int8 *)v126;
                v126 += 2;
              }
              while (v128);
            }
            *int v121 = v122;
          }
          --v119;
        }
        while (v120);
      }
      int v197 = 1;
    }
    else
    {
LABEL_228:
      int v197 = 0;
    }
    if (([a17 isFull] & 1) == 0)
    {
      char v129 = *v202;
      if (*v202)
      {
        BOOL v130 = (unsigned __int8 *)(v202 + 1);
        unsigned int v131 = &__s;
        do
        {
          *v131++ = v129;
          int v132 = *v130++;
          char v129 = v132;
        }
        while (v132);
      }
      else
      {
        unsigned int v131 = &__s;
      }
      *unsigned int v131 = 0;
      if (__s)
      {
        int v133 = __s;
        uint64_t v134 = 3;
        if (!a10) {
          uint64_t v134 = 1;
        }
        if (a11) {
          uint64_t v134 = 2;
        }
        uint64_t v217 = v134;
        unint64_t v135 = &__s;
        unint64_t v136 = &__s;
        do
        {
          if (!*++v136) {
            break;
          }
          for (uint64_t j = 0; j != 2; ++j)
          {
            uint64_t v139 = &v135[j];
            int v140 = v135[j + 2];
            if (!v135[j + 2]) {
              break;
            }
            if (isAnyAlphaX_0(v133, v219)
              && isAnyAlphaX_0(*v136, v219)
              && isAnyAlphaX_0(v135[j + 1], v219)
              && isAnyAlphaX_0(v140, v219))
            {
              char *v135 = v140;
              v139[2] = v133;
              *(_WORD *)((char *)&v196 + 5) = 0;
              BYTE4(v196) = a16;
              BYTE3(v196) = 1;
              BYTE2(v196) = a15;
              LOWORD(v196) = 1;
              if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34, a7, v221, a4, 1, v196, 0))
              {
                [a17 addCandidateWithBuffer:&__s encoding:v219 transform:v217 errorType:13];
              }
              char v141 = *v135;
              int v133 = v139[2];
              char *v135 = v133;
              v139[2] = v141;
            }
          }
          unint64_t v135 = v136;
          int v133 = *v136;
        }
        while (*v136);
      }
    }
    unsigned int v142 = v202;
    if (v34 < 4) {
      goto LABEL_312;
    }
    if (([a17 isFull] & 1) == 0 && *v202)
    {
      uint64_t v143 = 0;
      unint64_t v144 = (unint64_t)&v202[v34 - 1];
      BOOL v145 = (unsigned __int8 *)v202;
      do
      {
        if ((v145 != (unsigned __int8 *)v202 || isAnyAlphaX_0(v202[1], v219))
          && (v145 != (unsigned __int8 *)v144 || isAnyAlphaX_0(v202[v34 - 2], v219)))
        {
          char v146 = *v202;
          if (*v202)
          {
            unsigned int v147 = &__s;
            uint64_t v148 = (unsigned __int8 *)(v202 + 1);
            uint64_t v149 = v143;
            do
            {
              if (v149) {
                *v147++ = v146;
              }
              int v150 = *v148++;
              char v146 = v150;
              --v149;
            }
            while (v150);
          }
          else
          {
            unsigned int v147 = &__s;
          }
          *unsigned int v147 = 0;
          *(_WORD *)((char *)&v196 + 5) = 0;
          BYTE4(v196) = a16;
          BYTE3(v196) = 1;
          BYTE2(v196) = a15;
          LOWORD(v196) = 1;
          if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v34 - 1, a7, v221, a4, 1, v196, 0))
          {
            if (v145 == (unsigned __int8 *)v202 && a10) {
              uint64_t v151 = 3;
            }
            else {
              uint64_t v151 = 0;
            }
            if (v145 <= (unsigned __int8 *)v202) {
              uint64_t v152 = 0;
            }
            else {
              uint64_t v152 = *(v145 - 1);
            }
            if ((unint64_t)v145 >= v144) {
              uint64_t v153 = 0;
            }
            else {
              uint64_t v153 = v145[1];
            }
            [a17 addInsertionCandidateWithBuffer:&__s encoding:v219 transform:v151 intendedPrecedingCharacter:v152 insertedCharacter:*v145 intendedFollowingCharacter:v153];
          }
        }
        int v154 = *++v145;
        ++v143;
      }
      while (v154);
    }
    if (v34 <= 0x17)
    {
LABEL_312:
      if (([a17 isFull] & 1) == 0)
      {
        char v155 = *v202;
        if (*v202)
        {
          int v156 = (unsigned __int8 *)(v202 + 1);
          uint64_t v157 = &__s;
          do
          {
            *v157++ = v155;
            int v158 = *v156++;
            char v155 = v158;
          }
          while (v158);
        }
        else
        {
          uint64_t v157 = &__s;
        }
        *uint64_t v157 = 0;
        char v198 = &__s + v34;
        int v159 = &__s;
        do
        {
          BOOL v160 = &v159[v34];
          v160[1] = v159[v34];
          --v159;
        }
        while (&__s <= v160 - 1);
        if (__s)
        {
          int64_t v161 = 0;
          uint64_t v162 = 26;
          if (v219 == 517) {
            uint64_t v162 = 32;
          }
          uint64_t v206 = v162;
          char v163 = 97;
          if (v219 == 517) {
            char v163 = -48;
          }
          char v201 = v163;
          unint64_t v164 = v34 + 1;
          uint64_t v165 = 3;
          if (!a10) {
            uint64_t v165 = 1;
          }
          if (a11) {
            uint64_t v165 = 2;
          }
          uint64_t v212 = v165;
          int v166 = &__s;
          while (v161)
          {
            if (v161 != 1 || isAnyAlphaX_0(v166[1], v219)) {
              goto LABEL_327;
            }
LABEL_351:
            ++v161;
            int v166 = &__s + v161;
            if (!*(&__s + v161)) {
              goto LABEL_352;
            }
          }
          if ((isAnyAlphaX_0(v166[2], v219) & 1) == 0) {
            goto LABEL_351;
          }
LABEL_327:
          if (v166 == v198 - 1 && !isAnyAlphaX_0(*(v198 - 2), v219)
            || v161 == v34 && !isAnyAlphaX_0(*(v166 - 2), v219))
          {
            goto LABEL_351;
          }
          BOOL v167 = a10;
          if (v161) {
            BOOL v167 = 0;
          }
          int v218 = v167 || a11;
          unsigned __int8 v168 = v201;
          uint64_t v169 = v206;
          while (1)
          {
            char v170 = v168;
            if (v218) {
              char v170 = toUpperX_0(v168, v219);
            }
            *int v166 = v170;
            *(_WORD *)((char *)&v196 + 5) = 0;
            BYTE4(v196) = a16;
            BYTE3(v196) = 1;
            BYTE2(v196) = a15;
            LOWORD(v196) = 1;
            if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v164, a7, v221, a4, 1, v196, 0))
            {
              if (v161) {
                uint64_t v171 = *(v166 - 1);
              }
              else {
                uint64_t v171 = 0;
              }
              if (v161 >= (uint64_t)v34) {
                uint64_t v175 = 0;
              }
              else {
                uint64_t v175 = v166[1];
              }
              uint64_t v174 = *v166;
              id v176 = a17;
              uint64_t v177 = v219;
              uint64_t v178 = v212;
            }
            else
            {
              if (v161) {
                goto LABEL_349;
              }
              int v172 = *v166;
              int v173 = toUpperX_0(*v166, v219);
              BOOL v24 = v173 == v172;
              int64_t v161 = 0;
              if (v24) {
                goto LABEL_349;
              }
              *int v166 = v173;
              *(_WORD *)((char *)&v196 + 5) = 0;
              BYTE4(v196) = a16;
              BYTE3(v196) = 1;
              BYTE2(v196) = a15;
              LOWORD(v196) = 1;
              if (!-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v164, a7, v221, a4, 1, v196, 0))goto LABEL_349; {
              uint64_t v174 = *v166;
              }
              uint64_t v175 = v166[1];
              id v176 = a17;
              uint64_t v177 = v219;
              uint64_t v178 = 0;
              uint64_t v171 = 0;
            }
            [v176 addOmissionCandidateWithBuffer:&__s encoding:v177 transform:v178 intendedPrecedingCharacter:v171 omittedCharacter:v174 intendedFollowingCharacter:v175];
LABEL_349:
            ++v168;
            if (!--v169)
            {
              *int v166 = v166[1];
              unsigned int v142 = v202;
              goto LABEL_351;
            }
          }
        }
      }
    }
LABEL_352:
    if (v197 && ([a17 isFull] & 1) == 0)
    {
      char v179 = *v142;
      if (*v142)
      {
        int v180 = (unsigned __int8 *)(v142 + 1);
        int v181 = &__s;
        do
        {
          *v181++ = v179;
          int v182 = *v180++;
          char v179 = v182;
        }
        while (v182);
      }
      else
      {
        int v181 = &__s;
      }
      *int v181 = 0;
      uint64_t v183 = &__s + v34;
      if ((v34 & 0x8000000000000000) == 0)
      {
        uint64_t v184 = &__s + v34;
        do
        {
          v184[1] = *v184;
          --v184;
        }
        while (&__s <= v184);
      }
      if (__s)
      {
        int64_t v185 = 0;
        uint64_t v186 = 3;
        if (!a10) {
          uint64_t v186 = 1;
        }
        if (a11) {
          uint64_t v186 = 2;
        }
        uint64_t v213 = v186;
        uint64_t v187 = (unsigned __int8 *)&__s;
        do
        {
          if (v185)
          {
            uint64_t v188 = v219;
            if (v185 != 1 || isAnyAlphaX_0(v187[1], v219))
            {
LABEL_373:
              if ((v187 != (unsigned __int8 *)(v183 - 1)
                 || isAnyAlphaX_0(*(v183 - 2), v188))
                && (v185 != v207 || isAnyAlphaX_0(*(v187 - 2), v188)))
              {
                if (*a9)
                {
                  BOOL v189 = a10;
                  if (v185) {
                    BOOL v189 = 0;
                  }
                  int v190 = v189 || a11;
                  unsigned int v191 = a9 + 2;
                  do
                  {
                    uint64_t v192 = *((unsigned __int8 *)v191 - 1);
                    if (v190) {
                      LOBYTE(v192) = toUpperX_0(v192, v188);
                    }
                    *uint64_t v187 = v192;
                    *(_WORD *)((char *)&v196 + 5) = 0;
                    BYTE4(v196) = a16;
                    BYTE3(v196) = 1;
                    BYTE2(v196) = a15;
                    LOWORD(v196) = 1;
                    if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &__s, v207 + 1, a7, v221, a4, 1, v196, 0))
                    {
                      if (v185) {
                        uint64_t v193 = *(v187 - 1);
                      }
                      else {
                        uint64_t v193 = 0;
                      }
                      if (v185 >= v207) {
                        uint64_t v194 = 0;
                      }
                      else {
                        uint64_t v194 = v187[1];
                      }
                      [a17 addOmissionCandidateWithBuffer:&__s encoding:v188 transform:v213 intendedPrecedingCharacter:v193 omittedCharacter:*v187 intendedFollowingCharacter:v194];
                    }
                    int v195 = *(unsigned __int8 *)v191;
                    v191 += 2;
                  }
                  while (v195);
                }
                *uint64_t v187 = v187[1];
              }
            }
          }
          else
          {
            uint64_t v188 = v219;
            if (isAnyAlphaX_0(v187[2], v219)) {
              goto LABEL_373;
            }
          }
          ++v185;
          uint64_t v187 = (unsigned __int8 *)(&__s + v185);
        }
        while (*(&__s + v185));
      }
    }
  }
  else
  {
LABEL_138:
    if (v34 >= 3) {
      goto LABEL_139;
    }
  }
}

- (void)_addSpaceInsertionGuessesForWord:(id)a3 sender:(id)a4 buffer:(char *)a5 length:(unint64_t)a6 languageObject:(id)a7 connection:(_PR_DB_IO *)a8 isCapitalized:(BOOL)a9 checkUser:(BOOL)a10 oneLetterWords:(const char *)a11 twoLetterWords:(const char *)a12 candidateList:(id)a13
{
  char v59 = a8;
  *(void *)&v61[255] = *MEMORY[0x263EF8340];
  unsigned int v57 = objc_msgSend(a7, "encoding", a3);
  if (a6 - 3 <= 0x14 && ([a13 isFull] & 1) == 0)
  {
    char v17 = *a5;
    if (*a5)
    {
      unint64_t v18 = a5 + 1;
      uint64_t v19 = v60;
      do
      {
        *v19++ = v17;
        int v20 = *v18++;
        char v17 = v20;
      }
      while (v20);
      *uint64_t v19 = 0;
      if ((a6 & 0x8000000000000000) != 0) {
        return;
      }
    }
    else
    {
      v60[0] = 0;
    }
    int v55 = &v60[a6];
    uint64_t v21 = v60;
    do
    {
      int v22 = &v21[a6];
      v22[1] = v21[a6];
      --v21;
    }
    while (v60 <= v22 - 1);
    if ((uint64_t)a6 < 2) {
      return;
    }
    unint64_t v56 = a6 - 1;
    unsigned int v23 = &v60[a6 - 1];
    BOOL v24 = v61;
    uint64_t v25 = 1;
    do
    {
      *BOOL v24 = 45;
      if (v25 != 1 && v24 != v23) {
        goto LABEL_16;
      }
      BOOL v27 = v24 - 1;
      if (v25 != 1) {
        BOOL v27 = v24 + 1;
      }
      int v28 = *v27;
      if ((v28 - 48) >= 0xA && (!a11 || !strchr((char *)a11, v28))) {
        goto LABEL_101;
      }
      if (v25 == 1 && v28 == 97 && englishOneLetterWords[0] == a11)
      {
        unsigned int v30 = v24[1];
        HIDWORD(v32) = v30 - 65;
        LODWORD(v32) = v30 - 65;
        unsigned int v31 = v32 >> 1;
        BOOL v33 = v31 > 0x1C;
        int v34 = (1 << v31) & 0x14951495;
        BOOL v35 = v33 || v34 == 0;
        if (!v35
          || vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20CC61C20, (uint32x4_t)vaddq_s32(vdupq_n_s32(v30), (int32x4_t)xmmword_20CC61C10)))) & 1 | (v30 - 248 < 6) | ((v30 & 0xD8) == 200 || v30 == 255))
        {
          goto LABEL_101;
        }
      }
      if (frenchOneLetterWords == a11)
      {
        if (v25 != 1 || v28 != 108) {
          goto LABEL_86;
        }
      }
      else if (v25 != 1 || v28 != 108 || italianOneLetterWords != (_UNKNOWN *)a11)
      {
        goto LABEL_86;
      }
      unsigned int v48 = v24[1];
      HIDWORD(v50) = v48 - 65;
      LODWORD(v50) = v48 - 65;
      unsigned int v49 = v50 >> 1;
      if ((v49 > 0x1C || ((1 << v49) & 0x14951495) == 0)
        && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20CC61C20, (uint32x4_t)vaddq_s32(vdupq_n_s32(v48), (int32x4_t)xmmword_20CC61C10)))) & 1) == 0&& v48 - 248 >= 6&& v48 != 255&& v48 != 104&& (v48 & 0xD8) != 0xC8)
      {
        goto LABEL_101;
      }
LABEL_86:
      BOOL v52 = frenchOneLetterWords == a11 || italianOneLetterWords == (_UNKNOWN *)a11;
      if (v28 == 108 && v52 && v24 == v23) {
        goto LABEL_101;
      }
LABEL_16:
      if (v25 == 2 || v24 == v55 - 2)
      {
        uint64_t v36 = -2;
        if (v25 != 2) {
          uint64_t v36 = 1;
        }
        uint64_t v37 = 2;
        if (v25 == 2) {
          uint64_t v37 = -1;
        }
        if (!a12) {
          goto LABEL_101;
        }
        int v38 = v24[v36];
        int v39 = v24[v37];
        size_t v40 = strlen(a12);
        if (!v40) {
          goto LABEL_101;
        }
        char v41 = 0;
        for (size_t i = 0; i < v40; i += 2)
        {
          if (a12[i] == v38 && a12[i + 1] == v39) {
            char v41 = 1;
          }
          if (v41) {
            break;
          }
        }
        if ((v41 & 1) == 0) {
          goto LABEL_101;
        }
        if (v25 == 2 && englishTwoLetterWords[0] == a12 && v38 == 97 && v39 == 110)
        {
          unsigned int v43 = v24[1];
          HIDWORD(v45) = v43 - 65;
          LODWORD(v45) = v43 - 65;
          unsigned int v44 = v45 >> 1;
          BOOL v33 = v44 > 0x1C;
          int v46 = (1 << v44) & 0x14951495;
          BOOL v47 = v33 || v46 == 0;
          if (v47
            && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vcgtq_u32((uint32x4_t)xmmword_20CC61C20, (uint32x4_t)vaddq_s32(vdupq_n_s32(v43), (int32x4_t)xmmword_20CC61C10)))) & 1) == 0&& v43 - 248 >= 6&& v43 != 255&& v43 != 104&& (v43 & 0xD8) != 0xC8)
          {
            goto LABEL_101;
          }
        }
      }
      *(_DWORD *)((char *)&v54 + 3) = 0;
      BYTE2(v54) = a10;
      LOWORD(v54) = 1;
      if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", v60, a6 + 1, a7, v59, a4, 1, v54, 0)&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:](self, "checkNegativeWordBuffer:length:languageObject:alreadyCapitalized:", v60, v25, a7, a9)&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:](
              self,
              "checkNegativeWordBuffer:length:languageObject:",
              v24 + 1,
              v55 - v24,
              a7))
      {
        *BOOL v24 = 32;
        [a13 addCandidateWithBuffer:v60 encoding:v57 errorType:10];
        char v26 = 45;
LABEL_99:
        *BOOL v24 = v26;
        goto LABEL_100;
      }
      if (v25 != 1
        || (*(_DWORD *)((char *)&v54 + 3) = 0,
            BYTE2(v54) = a10,
            LOWORD(v54) = 1,
            !-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", &v61[1], v56, a7, v59, a4, 1, v54, 0))|| [(AppleSpell *)self checkNegativeWordBuffer:&v61[1] length:v56 languageObject:a7])
      {
        if (v24 != v23) {
          goto LABEL_101;
        }
        *(_DWORD *)((char *)&v54 + 3) = 0;
        BYTE2(v54) = a10;
        LOWORD(v54) = 1;
        if (!-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](self, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkUser:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", v60, v56, a7, v59, a4, 1, v54, 0)|| [(AppleSpell *)self checkNegativeWordBuffer:v60 length:v56 languageObject:a7])
        {
          goto LABEL_101;
        }
      }
      *BOOL v24 = 32;
      if (v25 == 1 && v60[0] == 108)
      {
        char v26 = 39;
        if (frenchOneLetterWords == a11 || italianOneLetterWords == (_UNKNOWN *)a11) {
          goto LABEL_99;
        }
      }
LABEL_100:
      [a13 addCandidateWithBuffer:v60 encoding:v57 errorType:10];
LABEL_101:
      *BOOL v24 = v24[1];
      BOOL v24 = &v60[++v25];
    }
    while (v25 != a6);
  }
}

- (void)addLexiconGuessesForWord:(id)a3 buffer:(char *)a4 length:(unint64_t)a5 languageObject:(id)a6 minCorrectionLength:(unint64_t)a7 minExtendedCorrectionLength:(unint64_t)a8 isCapitalized:(BOOL)a9 stopAfterFreeInsertions:(BOOL)a10 toGuesses:(id)a11
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  int v18 = [a6 encoding];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  uint64_t v19 = [a3 length];
  if (a5 >= a7)
  {
    unint64_t v20 = v19;
    if ([a6 isTurkish])
    {
      uint64_t v21 = addLexiconGuessesForWord_buffer_length_languageObject_minCorrectionLength_minExtendedCorrectionLength_isCapitalized_stopAfterFreeInsertions_toGuesses__turkishLocale;
      if (addLexiconGuessesForWord_buffer_length_languageObject_minCorrectionLength_minExtendedCorrectionLength_isCapitalized_stopAfterFreeInsertions_toGuesses__turkishLocale)
      {
        BOOL v22 = 0;
      }
      else
      {
        uint64_t v21 = [objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"tr"];
        BOOL v22 = 0;
        addLexiconGuessesForWord_buffer_length_languageObject_minCorrectionLength_minExtendedCorrectionLength_isCapitalized_stopAfterFreeInsertions_toGuesses__turkishLocale = v21;
      }
    }
    else
    {
      int v23 = [a6 isVietnamese];
      if (v20 < 0x40) {
        int v24 = v23;
      }
      else {
        int v24 = 0;
      }
      if (v24 == 1)
      {
        v37.CFIndex location = 0;
        v37.CFIndex length = v20;
        CFIndex Bytes = CFStringGetBytes((CFStringRef)a3, v37, 0x100u, 0, 0, buffer, 126, 0);
        uint64_t v21 = 0;
        BOOL v22 = v20 == Bytes;
        if (v22) {
          uint64_t v26 = 40;
        }
        else {
          uint64_t v26 = 20;
        }
        goto LABEL_15;
      }
      BOOL v22 = 0;
      uint64_t v21 = 0;
    }
    uint64_t v26 = 20;
LABEL_15:
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __174__AppleSpell_Guessing__addLexiconGuessesForWord_buffer_length_languageObject_minCorrectionLength_minExtendedCorrectionLength_isCapitalized_stopAfterFreeInsertions_toGuesses___block_invoke;
    v27[3] = &unk_2640F95C8;
    BOOL v29 = a9;
    v27[4] = v21;
    v27[5] = a11;
    BOOL v30 = a10;
    BOOL v31 = v22;
    v27[8] = a7;
    v27[9] = &v34;
    v27[10] = buffer;
    v27[11] = v20;
    int v28 = v18;
    v27[12] = a4;
    v27[13] = a5;
    v27[14] = a8;
    v27[6] = a6;
    v27[7] = v32;
    [(AppleSpell *)self enumerateCorrectionEntriesForWord:a3 maxCorrections:v26 inLexiconForLanguageObject:a6 withBlock:v27];
  }
  _Block_object_dispose(v32, 8);
}

unint64_t __174__AppleSpell_Guessing__addLexiconGuessesForWord_buffer_length_languageObject_minCorrectionLength_minExtendedCorrectionLength_isCapitalized_stopAfterFreeInsertions_toGuesses___block_invoke(uint64_t a1, __CFString *a2, uint64_t a3, char a4, unint64_t a5, unsigned char *a6)
{
  unint64_t v8 = a2;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ((a4 & 0x20) == 0 && *(unsigned char *)(a1 + 124)) {
    unint64_t v8 = (__CFString *)initialCapitalizedString(a2, *(void *)(a1 + 32));
  }
  unint64_t v10 = [(__CFString *)v8 length];
  unint64_t result = [*(id *)(a1 + 40) isFull];
  if ((result & 1) != 0
    || *(unsigned char *)(a1 + 125) && a5 >= 5 && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    *a6 = 1;
    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 126))
  {
    if (v10 <= 0x3F && v10 >= *(void *)(a1 + 64))
    {
      v17.CFIndex location = 0;
      v17.CFIndex length = v10;
      unint64_t result = CFStringGetBytes(v8, v17, 0x100u, 0, 0, *(UInt8 **)(a1 + 72), 126, 0);
      if (v10 == result)
      {
        unint64_t result = effectiveUTF16EditDistance(*(void *)(a1 + 80), *(void *)(a1 + 88), *(unsigned __int16 **)(a1 + 72), v10);
        if (result <= 2)
        {
LABEL_28:
          unint64_t result = [*(id *)(a1 + 40) addCandidateWithString:v8 errorType:a5];
          goto LABEL_9;
        }
      }
    }
    goto LABEL_9;
  }
  CFIndex usedBufLen = 0;
  v18.CFIndex location = 0;
  v18.CFIndex length = v10;
  unint64_t result = CFStringGetBytes(v8, v18, *(_DWORD *)(a1 + 120), 0, 0, buffer, 254, &usedBufLen);
  if (v10 != result || (unint64_t)usedBufLen < *(void *)(a1 + 64)) {
    goto LABEL_9;
  }
  unint64_t v12 = effectiveEditDistance(*(void *)(a1 + 96), *(void *)(a1 + 104), (uint64_t)buffer, usedBufLen);
  if (v12 < 2) {
    goto LABEL_28;
  }
  unint64_t v13 = v12;
  if (v12 == 2 && *(void *)(a1 + 104) >= *(void *)(a1 + 112)) {
    goto LABEL_28;
  }
  unint64_t result = [*(id *)(a1 + 48) isIrishGaelic];
  if (a5 > 4 || !result)
  {
LABEL_9:
    if (a5 > 4) {
      return result;
    }
    goto LABEL_10;
  }
  if (v13 == 3 && *(void *)(a1 + 104) >= *(void *)(a1 + 112)) {
    unint64_t result = [*(id *)(a1 + 40) addCandidateWithString:v8 errorType:a5];
  }
LABEL_10:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

- (id)_spellServer:(id)a3 suggestGuessesForWordRange:(_NSRange)a4 inString:(id)a5 languageObject:(id)a6 options:(id)a7 tagger:(id)a8 errorModel:(id)a9 guessesDictionaries:(id)a10
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v185 = *MEMORY[0x263EF8340];
  uint64_t v15 = objc_msgSend(a5, "substringWithRange:", a4.location, a4.length);
  uint64_t v16 = (void *)[MEMORY[0x263EFF980] array];
  id v130 = objc_alloc_init(MEMORY[0x263F086B0]);
  CFRange v17 = (void *)[a7 objectForKey:@"ContextualGuessDictionaries"];
  if (v17) {
    int v18 = [v17 BOOLValue];
  }
  else {
    int v18 = 0;
  }
  memset(v184, 0, sizeof(v184));
  int v183 = 0;
  long long v182 = 0u;
  long long v181 = 0u;
  long long v180 = 0u;
  long long v179 = 0u;
  long long v178 = 0u;
  long long v177 = 0u;
  long long v176 = 0u;
  long long v175 = 0u;
  long long v174 = 0u;
  long long v173 = 0u;
  long long v172 = 0u;
  long long v171 = 0u;
  long long v170 = 0u;
  long long v169 = 0u;
  long long v168 = 0u;
  long long v167 = 0u;
  CFIndex v160 = 0;
  __int16 v159 = 8217;
  __int16 v158 = 0;
  uint64_t v129 = [NSString stringWithCharacters:&v159 length:1];
  uint64_t v19 = [NSString stringWithCharacters:&v158 length:1];
  uint64_t v125 = _appIdentifierFromOptions(a7);
  uint64_t v124 = [a7 objectForKey:@"ParameterBundles"];
  if ([a6 isKorean])
  {

    return -[AppleSpell spellServer:suggestGuessesForKoreanWordRange:inString:options:](self, "spellServer:suggestGuessesForKoreanWordRange:inString:options:", a3, location, length, a5, a7);
  }
  int v121 = v18;
  obuint64_t j = [(AppleSpell *)self capitalizationDictionaryArrayForLanguageObject:a6];
  char v141 = -[PRCandidateList initWithMaxCount:defaultReplacementRange:customErrorModel:capitalizationDictionaryArray:]([PRCandidateList alloc], "initWithMaxCount:defaultReplacementRange:customErrorModel:capitalizationDictionaryArray:", 32, location, length, a9, obj);
  uint64_t v20 = [a6 oneLetterWords];
  uint64_t v118 = [a6 twoLetterWords];
  uint64_t v115 = [a6 accents];
  char v139 = [a6 isEnglish];
  if (v139)
  {
LABEL_7:
    uint64_t v113 = 0;
    goto LABEL_8;
  }
  if ([a6 isGerman])
  {
    unint64_t v112 = 0;
    uint64_t v113 = 0;
    int v119 = 0;
    char v114 = 1;
    goto LABEL_13;
  }
  if ([a6 isDutch] & 1) != 0 || (objc_msgSend(a6, "isSwedish"))
  {
    unint64_t v112 = 0;
    uint64_t v113 = 0;
    int v119 = 0;
    char v114 = 1;
    uint64_t v21 = 4;
    goto LABEL_14;
  }
  if (([a6 isDanish] & 1) != 0
    || ([a6 isNorwegian] & 1) != 0
    || ([a6 isNynorsk] & 1) != 0
    || ([a6 isIrishGaelic] & 1) != 0)
  {
    uint64_t v113 = 0;
    int v119 = 0;
    char v114 = 0;
    goto LABEL_10;
  }
  if (![a6 isTurkish])
  {
    if ([a6 isFinnish])
    {
      unint64_t v112 = 0;
      uint64_t v113 = 0;
      int v119 = 1;
      unint64_t v123 = 2;
      char v114 = 1;
      goto LABEL_15;
    }
    goto LABEL_7;
  }
  if (!_spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries__turkishLocale)
  {
    int v119 = 0;
    uint64_t v113 = [objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"tr"];
    _spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries__turkishLocale = v113;
    goto LABEL_9;
  }
  uint64_t v113 = _spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries__turkishLocale;
LABEL_8:
  int v119 = 0;
LABEL_9:
  char v114 = 1;
LABEL_10:
  unint64_t v112 = 2;
LABEL_13:
  uint64_t v21 = 6;
LABEL_14:
  unint64_t v123 = v21;
LABEL_15:
  [v15 rangeOfString:v19];
  if (v22) {
    uint64_t v15 = (void *)[v15 stringByReplacingOccurrencesOfString:v19 withString:@"_"];
  }
  int v23 = (__CFString *)objc_msgSend(v15, "stringByTrimmingCharactersInSet:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "alphanumericCharacterSet"), "invertedSet"));
  [(__CFString *)v23 rangeOfString:v129];
  uint64_t v25 = v24;
  if (v24) {
    int v23 = (__CFString *)[(__CFString *)v23 stringByReplacingOccurrencesOfString:v129 withString:@"'"];
  }
  unint64_t v26 = [(__CFString *)v23 length];
  unint64_t v120 = [(AppleSpell *)self databaseConnectionForLanguageObject:a6];
  CFStringEncoding v27 = [a6 encoding];
  id v116 = [(AppleSpell *)self autocorrectionDictionaryForLanguageObject:a6];
  if (!_spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries__disallowedInternalPunctuationCharacterSet)
  {
    int v28 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "punctuationCharacterSet"), "mutableCopy");
    [v28 removeCharactersInString:@"'-:/&_"];
    objc_msgSend(v28, "removeCharactersInRange:", 8208, 2);
    _spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries__disallowedInternalPunctuationCharacterSet = (uint64_t)v28;
  }
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  id v31 = a8;
  int v128 = self;
  CFStringEncoding encoding = v27;
  uint64_t v122 = v25;
  int v132 = v23;
  while (1)
  {
    unint64_t v32 = v29 + v30;
    if (v26 <= v29 + v30) {
      break;
    }
    uint64_t v29 = -[__CFString rangeOfCharacterFromSet:options:range:](v23, "rangeOfCharacterFromSet:options:range:", _spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries__disallowedInternalPunctuationCharacterSet, 0, v32, v26 - (v29 + v30));
    if (v30) {
      BOOL v33 = v29 == 0;
    }
    else {
      BOOL v33 = 1;
    }
    if (!v33 && v29 + v30 < v26) {
      goto LABEL_32;
    }
  }
  if (!v26)
  {
    int v137 = 0;
    uint64_t v36 = 0;
    goto LABEL_102;
  }
LABEL_32:
  v186.NSUInteger location = 0;
  v186.NSUInteger length = v26;
  CFIndex Bytes = CFStringGetBytes(v23, v186, v27, 0, 0, &buffer, 254, &v160);
  int v137 = 0;
  uint64_t v36 = 0;
  if (v26 != Bytes) {
    goto LABEL_102;
  }
  uint64_t v111 = v20;
  unint64_t v37 = v160;
  v166[v160 - 1] = 0;
  int v38 = buffer;
  unsigned int v39 = isUpperCaseX(buffer, v27);
  unsigned int v138 = v39;
  if (v37 > 1) {
    unsigned int v40 = v39;
  }
  else {
    unsigned int v40 = 0;
  }
  unsigned int v134 = v40;
  if (v38)
  {
    char v133 = 0;
    char v41 = v166;
    int v42 = 1;
    char v43 = 1;
    do
    {
      if ((v38 - 140) <= 0x3A && ((1 << (v38 + 116)) & 0x400000000010001) != 0
        || v38 == 230
        || v38 == 223)
      {
        char v133 = 1;
      }
      if ((v38 - 48) >= 0xA) {
        char v43 = 0;
      }
      if (isAnyAlphaX_0(v38, v27))
      {
        int v44 = isUpperCaseX(v38, v27);
        unsigned int v45 = v134;
        if (!v44) {
          unsigned int v45 = 0;
        }
        unsigned int v134 = v45;
      }
      else
      {
        if (v38 == 45) {
          int v46 = v42;
        }
        else {
          int v46 = 0;
        }
        if (v38 != 39) {
          int v42 = v46;
        }
      }
      int v47 = *v41++;
      int v38 = v47;
    }
    while (v47);
  }
  else
  {
    char v133 = 0;
    char v43 = 1;
    LOBYTE(v42) = 1;
  }
  char v48 = v134;
  if (v134) {
    uint64_t v49 = 0;
  }
  else {
    uint64_t v49 = v138;
  }
  uint64_t v36 = (void *)[v116 objectForKey:v132];
  if (!v36) {
    uint64_t v36 = objc_msgSend(v116, "objectForKey:", -[__CFString lowercaseString](v132, "lowercaseString"));
  }
  unsigned __int8 v117 = v139 & v49;
  uint64_t v50 = [v36 length];
  BOOL v51 = v128;
  id v31 = a8;
  if (v36 && v50)
  {
    if (v134)
    {
      if (v26 < 5)
      {
        uint64_t v36 = 0;
        goto LABEL_80;
      }
      uint64_t v52 = uppercasedString(v36, v113);
    }
    else
    {
      if (!v138)
      {
LABEL_80:
        [(PRCandidateList *)v141 addCandidateWithString:v36 errorType:6];
        goto LABEL_81;
      }
      uint64_t v52 = initialCapitalizedString(v36, v113);
    }
    uint64_t v36 = (void *)v52;
    goto LABEL_80;
  }
LABEL_81:
  if ((v49 | v134))
  {
    int v137 = 0;
  }
  else
  {
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    uint64_t v49 = [obj countByEnumeratingWithState:&v154 objects:v164 count:16];
    if (v49)
    {
      uint64_t v53 = *(void *)v155;
LABEL_85:
      uint64_t v54 = 0;
      while (1)
      {
        if (*(void *)v155 != v53) {
          objc_enumerationMutation(obj);
        }
        int v55 = objc_msgSend(*(id *)(*((void *)&v154 + 1) + 8 * v54), "objectForKey:", -[__CFString lowercaseString](v132, "lowercaseString"));
        if (v55) {
          break;
        }
        if (v49 == ++v54)
        {
          uint64_t v49 = [obj countByEnumeratingWithState:&v154 objects:v164 count:16];
          if (v49) {
            goto LABEL_85;
          }
          int v137 = 0;
          goto LABEL_98;
        }
      }
      unint64_t v56 = v55;
      int v137 = v55;
      if (![v55 length])
      {
        uint64_t v49 = 0;
LABEL_98:
        BOOL v51 = v128;
        id v31 = a8;
        char v48 = v134;
        goto LABEL_99;
      }
      BOOL v51 = v128;
      char v48 = v134;
      if (([v56 isEqualToString:v132] & 1) == 0) {
        [(PRCandidateList *)v141 addCandidateWithString:v56 errorType:2];
      }
      uint64_t v49 = 0;
      id v31 = a8;
    }
    else
    {
      int v137 = 0;
      unsigned __int8 v117 = 0;
    }
  }
LABEL_99:
  if (v26 <= v32 && (v43 & 1) == 0)
  {
    [(AppleSpell *)v51 _addTwoLetterWordGuessesForWord:v132 buffer:&buffer length:v160 languageObject:a6 isCapitalized:v49 isAllCaps:v48 & 1 twoLetterWords:v118 candidateList:v141];
    [(AppleSpell *)v51 _addConnectionGuessesForWord:v132 buffer:&buffer length:v160 languageObject:a6 connection:v120 candidateList:v141];
    BYTE6(v110) = v114;
    WORD2(v110) = v117;
    BYTE3(v110) = v133 & 1;
    BYTE2(v110) = v42 & 1;
    BYTE1(v110) = v48 & 1;
    LOBYTE(v110) = v49;
    -[AppleSpell _addAdditionalGuessesForWord:sender:buffer:length:languageObject:connection:accents:isCapitalized:isAllCaps:isAllAlpha:hasLigature:suggestPossessive:checkUser:checkHyphens:candidateList:](v51, "_addAdditionalGuessesForWord:sender:buffer:length:languageObject:connection:accents:isCapitalized:isAllCaps:isAllAlpha:hasLigature:suggestPossessive:checkUser:checkHyphens:candidateList:", v132, a3, &buffer, v160, a6, v120, v115, v110, v141);
    id v31 = a8;
    LOWORD(usedBufLen) = v49;
    -[AppleSpell _addSpaceInsertionGuessesForWord:sender:buffer:length:languageObject:connection:isCapitalized:checkUser:oneLetterWords:twoLetterWords:candidateList:](v51, "_addSpaceInsertionGuessesForWord:sender:buffer:length:languageObject:connection:isCapitalized:checkUser:oneLetterWords:twoLetterWords:candidateList:", v132, a3, &buffer, v160, a6, v120, usedBufLen, v111, v118, v141);
    LOWORD(usedBufLena) = v49;
    -[AppleSpell addLexiconGuessesForWord:buffer:length:languageObject:minCorrectionLength:minExtendedCorrectionLength:isCapitalized:stopAfterFreeInsertions:toGuesses:](v51, "addLexiconGuessesForWord:buffer:length:languageObject:minCorrectionLength:minExtendedCorrectionLength:isCapitalized:stopAfterFreeInsertions:toGuesses:", v132, &buffer, v160, a6, 3, 5, usedBufLena, v141);
  }
LABEL_102:
  int v140 = v36;
  if (v31)
  {
    id v57 = [(AppleSpell *)v128 _rankedCandidatesForCandidateList:v141 languageObject:a6 tagger:v31 appIdentifier:v125 parameterBundles:v124];
    if (v57)
    {
      int v58 = v57;
      long long v152 = 0u;
      long long v153 = 0u;
      long long v150 = 0u;
      long long v151 = 0u;
      uint64_t v59 = [v57 countByEnumeratingWithState:&v150 objects:v163 count:16];
      if (v59)
      {
        uint64_t v60 = v59;
        uint64_t v61 = *(void *)v151;
        if (a10) {
          BOOL v62 = v121 == 0;
        }
        else {
          BOOL v62 = 1;
        }
        char v63 = v62;
        do
        {
          for (uint64_t i = 0; i != v60; ++i)
          {
            if (*(void *)v151 != v61) {
              objc_enumerationMutation(v58);
            }
            char v65 = *(void **)(*((void *)&v150 + 1) + 8 * i);
            if (([v65 isBlocklisted] & 1) == 0)
            {
              uint64_t v66 = [v65 string];
              if (([v16 containsObject:v66] & 1) == 0)
              {
                [v16 addObject:v66];
                if ((v63 & 1) == 0)
                {
                  unint64_t v67 = NSDictionary;
                  char v68 = NSNumber;
                  [v65 score];
                  objc_msgSend(a10, "addObject:", objc_msgSend(v67, "dictionaryWithObjectsAndKeys:", v66, @"Guess", objc_msgSend(v68, "numberWithDouble:"), @"Score", 0));
                }
              }
            }
          }
          uint64_t v60 = [v58 countByEnumeratingWithState:&v150 objects:v163 count:16];
        }
        while (v60);
      }
    }
  }
  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id v69 = [(PRCandidateList *)v141 candidates];
  uint64_t v70 = [v69 countByEnumeratingWithState:&v146 objects:v162 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v147;
    if (a10) {
      BOOL v73 = v121 == 0;
    }
    else {
      BOOL v73 = 1;
    }
    char v74 = v73;
    do
    {
      for (uint64_t j = 0; j != v71; ++j)
      {
        if (*(void *)v147 != v72) {
          objc_enumerationMutation(v69);
        }
        int v76 = *(void **)(*((void *)&v146 + 1) + 8 * j);
        if (([v76 isBlocklisted] & 1) == 0)
        {
          uint64_t v77 = [v76 string];
          if (([v16 containsObject:v77] & 1) == 0)
          {
            [v16 addObject:v77];
            if ((v74 & 1) == 0)
            {
              uint64_t v78 = NSDictionary;
              uint64_t v79 = NSNumber;
              [v76 score];
              objc_msgSend(a10, "addObject:", objc_msgSend(v78, "dictionaryWithObjectsAndKeys:", v77, @"Guess", objc_msgSend(v79, "numberWithDouble:"), @"Score", 0));
            }
          }
        }
      }
      uint64_t v71 = [v69 countByEnumeratingWithState:&v146 objects:v162 count:16];
    }
    while (v71);
  }
  [v16 removeObject:v132];
  uint64_t v80 = [v16 count];
  int v81 = v128;
  id v82 = a6;
  if (v80)
  {
    uint64_t v83 = v80;
    if (v120) {
      int v84 = 1;
    }
    else {
      int v84 = v119;
    }
    do
    {
      int v85 = (__CFString *)[v16 objectAtIndex:--v83];
      unint64_t v86 = [(__CFString *)v85 length];
      if (v140 && ([(__CFString *)v85 isEqualToString:v140] & 1) != 0) {
        continue;
      }
      if (v137 && ([(__CFString *)v85 isEqualToString:v137] & 1) != 0) {
        continue;
      }
      v187.NSUInteger location = 0;
      v187.NSUInteger length = v86;
      if (v86 != CFStringGetBytes(v85, v187, encoding, 0, 0, &buffer, 254, &v160)) {
        continue;
      }
      if (![(AppleSpell *)v81 checkWordBuffer:&buffer length:v160 languageObject:v82 index:1]&& ![(AppleSpell *)v81 checkNegativeWordBuffer:&buffer length:v160 languageObject:v82])
      {
        if (!v84) {
          continue;
        }
        if (v86 < v123) {
          continue;
        }
        if (v160 < v123) {
          continue;
        }
        [(__CFString *)v85 rangeOfString:@" "];
        if (v87) {
          continue;
        }
        [(__CFString *)v85 rangeOfString:@"-"];
        if (v88) {
          continue;
        }
        [(__CFString *)v85 rangeOfString:@"'"];
        if (v89)
        {
          if ([(__CFString *)v85 rangeOfString:@"'"]) {
            continue;
          }
        }
        if ([v16 count] <= v112
          || ([a3 isWordInUserDictionaries:v85 caseSensitive:0] & 1) != 0)
        {
          continue;
        }
        if (v119)
        {
          if (![(AppleSpell *)v81 checkWordBuffer:&buffer length:v160 languageObject:v82 index:0])continue; {
        }
          }
        else
        {
          if ([(AppleSpell *)v81 checkNameWordBuffer:&buffer length:v160 languageObject:v82 globalOnly:0])
          {
            continue;
          }
          BOOL v90 = [(AppleSpell *)v81 checkWordBuffer:&buffer length:v160 languageObject:v82 index:0];
          if (!v120 || v90) {
            continue;
          }
          *(_WORD *)&v166[v160 - 2] = 42;
          memset((char *)v184 + 8, 0, 136);
          long long v167 = 0u;
          long long v168 = 0u;
          long long v169 = 0u;
          long long v170 = 0u;
          long long v171 = 0u;
          long long v172 = 0u;
          long long v173 = 0u;
          long long v174 = 0u;
          long long v175 = 0u;
          long long v176 = 0u;
          long long v177 = 0u;
          long long v178 = 0u;
          long long v179 = 0u;
          long long v180 = 0u;
          long long v181 = 0u;
          long long v182 = 0u;
          int v183 = 0;
          HIDWORD(v182) = 0;
          *(void *)&v184[0] = &buffer;
          *((void *)&v184[6] + 1) = &v167;
          HIBYTE(v184[7]) = 1;
          *(_WORD *)((char *)&v184[8] + 1) = *v120;
          PRword((uint64_t)v184, 5, 0);
          unint64_t v91 = (void *)*((void *)&v184[0] + 1);
          if (*((void *)&v184[0] + 1)
            && *(void *)(*((void *)&v184[0] + 1) + 8)
            && **((void **)&v184[0] + 1)
            && (unint64_t v135 = *(unsigned __int16 *)(*((void *)&v184[0] + 1) + 18),
                *(_WORD *)(*((void *)&v184[0] + 1) + 18)))
          {
            char v92 = 0;
            unint64_t v93 = 0;
            do
            {
              CFStringRef v94 = (id)CFStringCreateWithCString(0, (const char *)(*v91 + *(__int16 *)(v91[1] + 2 * v93)), encoding);
              if (v94 && ![(__CFString *)v85 caseInsensitiveCompare:v94]) {
                char v92 = 1;
              }
              if (v92) {
                break;
              }
              ++v93;
            }
            while (v93 < v135);
            PRword((uint64_t)v184, 17, 0);
            int v81 = v128;
            id v82 = a6;
            if (v92) {
              continue;
            }
          }
          else
          {
            PRword((uint64_t)v184, 17, 0);
            id v82 = a6;
          }
        }
      }
      [v16 removeObjectAtIndex:v83];
    }
    while (v83);
  }
  if (a10)
  {
    long long v144 = 0u;
    long long v145 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    uint64_t v95 = [v16 countByEnumeratingWithState:&v142 objects:v161 count:16];
    if (v95)
    {
      uint64_t v96 = v95;
      uint64_t v97 = *(void *)v143;
      do
      {
        for (uint64_t k = 0; k != v96; ++k)
        {
          if (*(void *)v143 != v97) {
            objc_enumerationMutation(v16);
          }
          uint64_t v99 = *(void *)(*((void *)&v142 + 1) + 8 * k);
          id v100 = [(PRCandidateList *)v141 candidateWithString:v99];
          if (v100)
          {
            int v101 = v100;
            if ([v100 hasCustomErrorScore])
            {
              [v101 errorScore];
              objc_msgSend(a10, "addObject:", objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v99, @"Guess", objc_msgSend(NSNumber, "numberWithDouble:"), @"Score", 0));
            }
          }
        }
        uint64_t v96 = [v16 countByEnumeratingWithState:&v142 objects:v161 count:16];
      }
      while (v96);
    }
    [a10 sortUsingComparator:&__block_literal_global_8];
    int v81 = v128;
  }
  uint64_t v102 = [v16 count];
  if (v122)
  {
    uint64_t v103 = v102;
    if (v102)
    {
      uint64_t v104 = 0;
      do
      {
        unint64_t v105 = (void *)[v16 objectAtIndex:v104];
        [v105 rangeOfString:@"'"];
        if (v106) {
          objc_msgSend(v16, "replaceObjectAtIndex:withObject:", v104, objc_msgSend(v105, "stringByReplacingOccurrencesOfString:withString:", @"'", v129));
        }
        ++v104;
      }
      while (v103 != v104);
    }
  }
  [(AppleSpell *)v81 resetTimer];

  return v16;
}

uint64_t __134__AppleSpell_Guessing___spellServer_suggestGuessesForWordRange_inString_languageObject_options_tagger_errorModel_guessesDictionaries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 objectForKey:@"Score"];
  uint64_t v5 = (void *)[a3 objectForKey:@"Score"];
  [v4 floatValue];
  float v7 = v6;
  [v5 floatValue];
  if (v7 > v8) {
    return -1;
  }
  [v4 floatValue];
  float v11 = v10;
  [v5 floatValue];
  return v11 < v12;
}

- (id)_spellServer:(id)a3 suggestGuessesForWordRange:(_NSRange)a4 inString:(id)a5 languageObject:(id)a6 options:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v14 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", a6, a5, 0, [a5 length]);
  id v15 = -[AppleSpell _spellServer:suggestGuessesForWordRange:inString:languageObject:options:tagger:errorModel:guessesDictionaries:](self, "_spellServer:suggestGuessesForWordRange:inString:languageObject:options:tagger:errorModel:guessesDictionaries:", a3, location, length, a5, a6, a7, v14, [a7 objectForKey:PRErrorModelKey], 0);
  [(AppleSpell *)self invalidateTagger:v14];
  return v15;
}

- (id)spellServer:(id)a3 suggestGuessesForWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)a6 options:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (!a6
    || (lastLanguage = (__CFString *)a6, ([a6 isEqualToString:@"und"] & 1) != 0)
    || [(__CFString *)lastLanguage isEqualToString:@"Multilingual"])
  {
    lastLanguage = (__CFString *)self->_lastLanguage;
    if (!lastLanguage)
    {
      if ([(NSArray *)self->_userPreferredLanguages count]) {
        lastLanguage = [(NSArray *)self->_userPreferredLanguages objectAtIndex:0];
      }
      else {
        lastLanguage = @"en";
      }
    }
  }
  id v14 = +[PRLanguage languageObjectWithIdentifier:lastLanguage];
  return -[AppleSpell _spellServer:suggestGuessesForWordRange:inString:languageObject:options:](self, "_spellServer:suggestGuessesForWordRange:inString:languageObject:options:", a3, location, length, a5, v14, a7);
}

- (id)spellServer:(id)a3 suggestContextualGuessDictionariesForWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)a6 options:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (!a6
    || (lastLanguage = (__CFString *)a6, ([a6 isEqualToString:@"und"] & 1) != 0)
    || [(__CFString *)lastLanguage isEqualToString:@"Multilingual"])
  {
    lastLanguage = (__CFString *)self->_lastLanguage;
    if (!lastLanguage)
    {
      if ([(NSArray *)self->_userPreferredLanguages count]) {
        lastLanguage = [(NSArray *)self->_userPreferredLanguages objectAtIndex:0];
      }
      else {
        lastLanguage = @"en";
      }
    }
  }
  id v14 = +[PRLanguage languageObjectWithIdentifier:lastLanguage];
  id v15 = (void *)[MEMORY[0x263EFF980] array];
  id v16 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", v14, a5, 0, [a5 length]);
  CFRange v17 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a7];
  objc_msgSend(v17, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", 1), @"ContextualGuessDictionaries");
  -[AppleSpell _spellServer:suggestGuessesForWordRange:inString:languageObject:options:tagger:errorModel:guessesDictionaries:](self, "_spellServer:suggestGuessesForWordRange:inString:languageObject:options:tagger:errorModel:guessesDictionaries:", a3, location, length, a5, v14, v17, v16, 0, v15);
  [(AppleSpell *)self invalidateTagger:v16];
  return v15;
}

- (id)spellServer:(id)a3 suggestGuessDictionariesForWordRange:(_NSRange)a4 inString:(id)a5 inLanguage:(id)a6 options:(id)a7 errorModel:(id)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (!a6
    || (lastLanguage = (__CFString *)a6, ([a6 isEqualToString:@"und"] & 1) != 0)
    || [(__CFString *)lastLanguage isEqualToString:@"Multilingual"])
  {
    lastLanguage = (__CFString *)self->_lastLanguage;
    if (!lastLanguage)
    {
      if ([(NSArray *)self->_userPreferredLanguages count]) {
        lastLanguage = [(NSArray *)self->_userPreferredLanguages objectAtIndex:0];
      }
      else {
        lastLanguage = @"en";
      }
    }
  }
  id v15 = +[PRLanguage languageObjectWithIdentifier:lastLanguage];
  id v16 = (void *)[MEMORY[0x263EFF980] array];
  -[AppleSpell _spellServer:suggestGuessesForWordRange:inString:languageObject:options:tagger:errorModel:guessesDictionaries:](self, "_spellServer:suggestGuessesForWordRange:inString:languageObject:options:tagger:errorModel:guessesDictionaries:", a3, location, length, a5, v15, a7, 0, a8, v16);
  return v16;
}

- (id)englishStringsFromWordBuffer:(char *)a3 length:(unint64_t)a4 connection:(_PR_DB_IO *)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  float v8 = (void *)[[NSString alloc] initWithBytes:a3 length:a4 encoding:12];
  id v9 = +[PRLanguage languageObjectWithIdentifier:@"en_CN"];
  if (a4)
  {
    unint64_t v10 = 0;
    int v11 = *a3;
    do
    {
      int v12 = a3[v10];
      BOOL v13 = v12 == v11;
      ++v10;
    }
    while (v12 == v11 && v10 < a4);
    uint64_t v15 = 0;
    while (1)
    {
      unsigned int v16 = a3[v15] - 99;
      BOOL v17 = v16 > 0x15;
      int v18 = (1 << v16) & 0x280643;
      if (v17 || v18 == 0) {
        break;
      }
      if (++v15 >= a4)
      {
        int v20 = 1;
        goto LABEL_15;
      }
    }
    int v20 = 0;
LABEL_15:
    uint64_t v21 = 0;
    while (1)
    {
      unsigned int v22 = a3[v21];
      BOOL v23 = v22 <= 0xF7 && v22 - 216 >= 0x1F;
      BOOL v24 = v23 && v22 - 192 >= 0x17;
      if (v24 && (v22 & 0xFFFFFFDF) - 65 >= 0x1A)
      {
        unsigned int v26 = v22 - 138;
        BOOL v17 = v26 > 0x15;
        int v27 = (1 << v26) & 0x350015;
        if (v17 || v27 == 0) {
          break;
        }
      }
      if (++v21 >= a4)
      {
        int v29 = 0;
        goto LABEL_33;
      }
    }
    int v29 = 1;
LABEL_33:
    unint64_t v30 = 0;
    int v31 = 1;
    do
    {
      int v32 = a3[v30];
      if ((v32 - 65) < 0x1A || (v32 - 192) < 0x17)
      {
        int v31 = 1;
        goto LABEL_49;
      }
      if ((v32 - 216) < 7) {
        goto LABEL_49;
      }
      unsigned int v34 = v32 - 138;
      BOOL v17 = v34 > 0x15;
      int v35 = (1 << v34) & 0x200015;
      if (!v17 && v35 != 0) {
        goto LABEL_49;
      }
      ++v30;
    }
    while (v30 < a4);
    int v31 = 0;
LABEL_49:
    uint64_t v38 = 0;
    int v65 = v29;
    int v66 = v20;
    while (1)
    {
      unsigned int v39 = a3[v38];
      BOOL v40 = v39 <= 0xF7 && v39 - 97 >= 0x1A;
      if (!v40 || v39 - 223 < 0x18) {
        break;
      }
      unsigned int v42 = v39 - 154;
      BOOL v17 = v42 > 4;
      int v43 = (1 << v42) & 0x15;
      if (!v17 && v43 != 0) {
        break;
      }
      if (++v38 >= a4)
      {
        int v37 = 0;
        goto LABEL_66;
      }
    }
    int v37 = 1;
  }
  else
  {
    int v31 = 0;
    int v37 = 0;
    int v65 = 0;
    int v66 = 1;
    BOOL v13 = 1;
  }
LABEL_66:
  id v45 = (id)englishStringsFromWordBuffer_length_connection__autocorrectionDictionary;
  if (!englishStringsFromWordBuffer_length_connection__autocorrectionDictionary)
  {
    id v45 = [(AppleSpell *)self autocorrectionDictionaryForLanguageObject:v9];
    englishStringsFromWordBuffer_length_connection__autocorrectionDictionary = (uint64_t)v45;
  }
  int v46 = self;
  id v47 = (id)[v45 objectForKey:v8];
  if (!v47)
  {
    char v48 = objc_msgSend((id)englishStringsFromWordBuffer_length_connection__autocorrectionDictionary, "objectForKey:", objc_msgSend(v8, "lowercaseString"));
    id v47 = v48;
    if (((v37 | v31 ^ 1) & 1) == 0) {
      id v47 = (id)[v48 uppercaseString];
    }
  }
  uint64_t v71 = 0;
  if ([&stru_26C1C71A8 isEqualToString:v47]) {
    goto LABEL_72;
  }
  if (v47)
  {
LABEL_76:

    goto LABEL_77;
  }
  int v51 = *a3;
  unsigned int v52 = v51 - 65;
  unsigned int v53 = v51 - 192;
  if ((v51 - 65) >= 0x1A
    && v53 >= 0x17
    && (v51 - 216) >= 7
    && ((v51 - 138) > 0x15 || ((1 << (v51 + 118)) & 0x200015) == 0))
  {
    if (next_pinyin((unsigned __int8 *)a3, a4, 0, 1, (unsigned __int8 **)&v71, 0) && v71 == &a3[a4]) {
      goto LABEL_140;
    }
    int v51 = *a3;
    unsigned int v52 = v51 - 65;
    unsigned int v53 = v51 - 192;
  }
  if (v52 >= 0x1A
    && v53 >= 0x17
    && (v51 - 216) >= 7
    && ((v51 - 138) > 0x15 || ((1 << (v51 + 118)) & 0x200015) == 0)
    && ((v13 | v66 | v65) & 1) != 0
    || a4 <= 3 && (isUpperCase(v51) & 1) == 0)
  {
    goto LABEL_140;
  }
  WORD2(v63) = 0;
  LODWORD(v63) = 65793;
  if (-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v46, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", a3, a4, v9, v63, 0)&& ((isUpperCase(*a3) & 1) != 0|| !-[AppleSpell checkWordBuffer:length:languageObject:index:](v46, "checkWordBuffer:length:languageObject:index:", a3, a4, v9, 1))&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:](v46, "checkNegativeWordBuffer:length:languageObject:",
          a3,
          a4,
          v9))
  {
    int v56 = isUpperCase(*a3);
    if (a4 < 2
      || !v56
      || !next_pinyin((unsigned __int8 *)a3 + 1, a4 - 1, 0, 1, (unsigned __int8 **)&v71, 0)
      || v71 != &a3[a4]
      || ![(AppleSpell *)v46 checkWordBuffer:a3 length:a4 languageObject:v9 index:1])
    {
      id v57 = (id)englishStringsFromWordBuffer_length_connection__capitalizationDictionaryArray;
      if (!englishStringsFromWordBuffer_length_connection__capitalizationDictionaryArray)
      {
        id v57 = [(AppleSpell *)v46 capitalizationDictionaryArrayForLanguageObject:v9];
        englishStringsFromWordBuffer_length_connection__capitalizationDictionaryArray = (uint64_t)v57;
      }
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      uint64_t v58 = [v57 countByEnumeratingWithState:&v67 objects:v72 count:16];
      if (v58)
      {
        uint64_t v59 = v58;
        uint64_t v60 = *(void *)v68;
        while (2)
        {
          for (uint64_t i = 0; i != v59; ++i)
          {
            if (*(void *)v68 != v60) {
              objc_enumerationMutation(v57);
            }
            uint64_t v62 = [*(id *)(*((void *)&v67 + 1) + 8 * i) objectForKey:v8];
            if (v62)
            {
              id v47 = (id)v62;
              goto LABEL_76;
            }
          }
          uint64_t v59 = [v57 countByEnumeratingWithState:&v67 objects:v72 count:16];
          if (v59) {
            continue;
          }
          break;
        }
      }
LABEL_72:
      id v49 = v8;
      goto LABEL_73;
    }
LABEL_140:

    return 0;
  }
  if (a4 < 4) {
    goto LABEL_140;
  }
  unsigned int v54 = *a3;
  if (v54 - 65 < 0x1A || v54 - 192 < 0x17 || v54 - 216 < 7 || v54 - 138 <= 0x15 && ((1 << (v54 + 118)) & 0x200015) != 0) {
    goto LABEL_140;
  }
  if (a4 + 1 > 1) {
    size_t v55 = a4 + 1;
  }
  else {
    size_t v55 = 1;
  }
  memcpy(__dst, a3, v55);
  if (v54 <= 0xF7 && v54 - 97 >= 0x1A && v54 - 223 >= 0x18)
  {
    if (v54 - 154 > 4 || ((1 << (v54 + 102)) & 0x15) == 0) {
      goto LABEL_137;
    }
LABEL_136:
    LOBYTE(v54) = v54 - 16;
    goto LABEL_137;
  }
  if (v54 - 154 <= 4 && ((1 << (v54 + 102)) & 0x15) != 0) {
    goto LABEL_136;
  }
  if (v54 != 223)
  {
    if (v54 == 255) {
      LOBYTE(v54) = -97;
    }
    else {
      LOBYTE(v54) = v54 - 32;
    }
  }
LABEL_137:
  __dst[0] = v54;
  WORD2(v64) = 0;
  LODWORD(v64) = 65793;
  if (!-[AppleSpell validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:](v46, "validateWordBuffer:length:languageObject:connection:sender:checkBase:checkDict:checkTemp:checkNames:checkHyphens:checkIntercaps:checkOptions:depth:", __dst, a4, v9, v64, 0)|| -[AppleSpell checkWordBuffer:length:languageObject:index:](v46, "checkWordBuffer:length:languageObject:index:", __dst, a4, v9, 1)|| -[AppleSpell checkNegativeWordBuffer:length:languageObject:](v46, "checkNegativeWordBuffer:length:languageObject:", __dst,
         a4,
         v9))
  {
    goto LABEL_140;
  }
  id v49 = (id)[[NSString alloc] initWithBytes:__dst length:a4 encoding:12];
LABEL_73:
  id v47 = v49;

  if (!v47) {
    return 0;
  }
LABEL_77:
  if ([v47 isEqualToString:@"apple"]) {
    return (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"Apple", @"apple", 0);
  }
  else {
    return (id)[MEMORY[0x263EFF8C0] arrayWithObject:v47];
  }
}

- (id)englishStringFromWordBuffer:(char *)a3 length:(unint64_t)a4 connection:(_PR_DB_IO *)a5
{
  id v5 = [(AppleSpell *)self englishStringsFromWordBuffer:a3 length:a4 connection:a5];
  if (!v5) {
    return 0;
  }
  float v6 = v5;
  if (![v5 count]) {
    return 0;
  }
  return (id)[v6 objectAtIndex:0];
}

- (void)addSpecialModifiedPinyinToArray:(id)a3 inBuffer:(char *)a4 length:(unint64_t)a5 atEnd:(BOOL)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  __int16 v31 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  if (a5 < 4) {
    return;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (a4[v9] != 105)
    {
LABEL_25:
      size_t v11 = 0;
      goto LABEL_26;
    }
    size_t v11 = 0;
    unsigned int v12 = a4[v9 + 1];
    if (v12 > 0x6C)
    {
      if (v12 == 109)
      {
LABEL_19:
        if (a4[v9 + 2] != 97 || a4[v9 + 3] != 99) {
          goto LABEL_25;
        }
        goto LABEL_21;
      }
      if (v12 != 112) {
        goto LABEL_26;
      }
    }
    else
    {
      if (v12 == 77) {
        goto LABEL_19;
      }
      if (v12 != 80) {
        goto LABEL_26;
      }
    }
    int v13 = a4[v9 + 2];
    if (v13 != 111 && v13 != 97 || a4[v9 + 3] != 100)
    {
      size_t v11 = 0;
      if (v9 + 5 >= a5 || v13 != 104) {
        goto LABEL_26;
      }
      if (a4[v9 + 3] != 111 || a4[v9 + 4] != 110 || a4[v9 + 5] != 101) {
        goto LABEL_25;
      }
      size_t v11 = 6;
      goto LABEL_22;
    }
LABEL_21:
    size_t v11 = 4;
LABEL_22:
    if (v11 + v9 < a5) {
      v11 |= a4[v11 + v9] == 115;
    }
    uint64_t v10 = v9;
LABEL_26:
    BOOL v14 = v10 + v11 < a5;
    if (a6 && v14) {
      size_t v15 = 0;
    }
    else {
      size_t v15 = v11;
    }
    if (a6 && v14) {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v9 + 4 >= a5) {
      break;
    }
    ++v9;
  }
  while (!v15);
  if (v15
    && (!v10
     || findPinyin((unsigned __int8 *)a4, v10, 0, 1, 0, 0, 0, 0, &v30, 0, &v29, (unsigned char *)&v31 + 1, &v28, 0, 0, 0, 0, 0)&& !HIBYTE(v31)
     && v30 == v10))
  {
    size_t v16 = v10 + v15;
    unint64_t v17 = a5 - (v10 + v15);
    if (a5 > v10 + v15)
    {
      size_t v18 = v16 - 1;
      if (a4[v16 - 1] == 115)
      {
        if (findPinyin((unsigned __int8 *)&a4[v16 - 1], v17 + 1, 0, 1, 0, 0, 0, 0, &v27, 0, &v26, &v31, &v25, 0, 0, 0, 0, 0))
        {
          LOBYTE(v17) = v27 + v18;
          if (v27 + v18 == a5)
          {
            size_t v11 = v15 - 1;
            goto LABEL_46;
          }
        }
      }
    }
    if (a5 == v16
      || findPinyin((unsigned __int8 *)&a4[v16], a5 - v16, 0, 1, 0, 0, 0, 0, &v27, 0, &v26, &v31, &v25, 0, 0, 0, 0, 0)&& (LOBYTE(v17) = v27 + v16, v27 + v16 == a5))
    {
LABEL_46:
      if (v11)
      {
        memcpy(&__dst, &a4[v10], v11);
        LOBYTE(v17) = v33;
      }
      if (v17 > 0xF7u
        || v17 - 97 < 0x1A
        || v17 - 223 < 0x18)
      {
        if (v17 - 154 <= 4 && ((1 << (v17 + 102)) & 0x15) != 0) {
          goto LABEL_56;
        }
        if (v17 != 223)
        {
          if (v17 == 255) {
            LOBYTE(v17) = -97;
          }
          else {
            LOBYTE(v17) = v17 - 32;
          }
        }
      }
      else
      {
        if (v17 - 154 > 4 || ((1 << (v17 + 102)) & 0x15) == 0) {
          goto LABEL_57;
        }
LABEL_56:
        LOBYTE(v17) = v17 - 16;
      }
LABEL_57:
      char v33 = v17;
      id v19 = (id)[[NSString alloc] initWithBytes:&__dst length:v11 encoding:12];
      if (v10) {
        int v20 = (__CFString *)(id)[[NSString alloc] initWithBytes:a4 length:v10 encoding:12];
      }
      else {
        int v20 = &stru_26C1C71A8;
      }
      if (a5 <= v11 + v10) {
        uint64_t v21 = &stru_26C1C71A8;
      }
      else {
        uint64_t v21 = (__CFString *)(id)[[NSString alloc] initWithBytes:&a4[v11 + v10] length:a5 - (v11 + v10) encoding:12];
      }
      [v19 length];
      unsigned int v22 = [PRPinyinString alloc];
      uint64_t v23 = [NSString stringWithFormat:@"%@%@%@", v20, v19, v21];
      BOOL v24 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v22, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v23, v29 + v26 + 1, v31, v28 + v25 + 128, a5, 5, v10, v11, v10, v11, v10, v11);
      if (([a3 containsObject:v24] & 1) == 0) {
        [a3 addObject:v24];
      }
    }
  }
}

- (void)addModifiedPinyinToArray:(id)a3 connection:(_PR_DB_IO *)a4 fromIndex:(unint64_t)a5 prevIndex:(unint64_t)a6 prevPrevIndex:(unint64_t)a7 startingModificationsAt:(unint64_t)a8 inBuffer:(char *)a9 length:(unint64_t)a10 initialSyllableCount:(unint64_t)a11 initialScore:(unint64_t)a12 prevScore:(unint64_t)a13 prevPrevScore:(unint64_t)a14 lastSyllableScore:(unint64_t)a15 couldBeAbbreviatedPinyin:(BOOL)a16
{
  unint64_t v20 = a14;
  uint64_t v21 = a9;
  unint64_t v22 = a10;
  uint64_t v316 = *MEMORY[0x263EF8340];
  uint64_t v313 = 0;
  uint64_t v314 = 0;
  uint64_t v311 = 0;
  unint64_t v312 = 0;
  unsigned __int8 v310 = 0;
  id v261 = +[PRLanguage languageObjectWithIdentifier:@"en_CN"];
  char v23 = 0;
  unsigned int v309 = 0;
  BOOL v308 = 0;
  unint64_t v304 = a5;
  uint64_t v295 = self;
  unint64_t v291 = a6;
  if (a7 < a5 && a7 < a6)
  {
    char v23 = 0;
    BOOL v24 = &a9[a7];
    unint64_t v298 = a10 - a7;
    uint64_t v25 = a10 - a7 - 14;
    unint64_t v26 = 14;
    BOOL v278 = &a9[a7];
    unint64_t v285 = a7;
    do
    {
      unint64_t v27 = a7 + v26;
      if (a7 + v26 <= v22)
      {
        uint64_t v311 = 0;
        unint64_t v312 = 0;
        uint64_t v313 = 0;
        id v28 = [(AppleSpell *)self englishStringFromWordBuffer:v24 length:v26 connection:a4];
        if (v28)
        {
          uint64_t v29 = v28;
          if (v298 == v26
            || findPinyin((unsigned __int8 *)&v24[v26], v25, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, 0)&& v298 - v313 == v26)
          {
            if (a7)
            {
              uint64_t v30 = (__CFString *)(id)[[NSString alloc] initWithBytes:a9 length:a7 encoding:12];
              __int16 v31 = &stru_26C1C71A8;
            }
            else
            {
              __int16 v31 = &stru_26C1C71A8;
              uint64_t v30 = &stru_26C1C71A8;
            }
            if (v27 < v22) {
              __int16 v31 = (__CFString *)(id)[[NSString alloc] initWithBytes:&v24[v26] length:v25 encoding:12];
            }
            uint64_t v32 = [v29 length];
            uint64_t v33 = [(__CFString *)v30 length];
            uint64_t v34 = [(__CFString *)v30 length];
            int v35 = [PRPinyinString alloc];
            uint64_t v36 = [NSString stringWithFormat:@"%@%@%@", v30, v29, v31];
            uint64_t v260 = v33;
            uint64_t v257 = v33;
            unint64_t v22 = a10;
            int v37 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v35, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v36, a11 - 1 + v312, v310, a14 + 128 + v311, a10, 5, v257, v26, v34, v32, v260, v26);
            if (([a3 containsObject:v37] & 1) == 0) {
              [a3 addObject:v37];
            }

            char v23 = 1;
            a5 = v304;
            self = v295;
            BOOL v24 = v278;
            a7 = v285;
          }
        }
      }
      --v26;
      ++v25;
    }
    while (v26 > 2);
    uint64_t v21 = a9;
    a6 = v291;
    unint64_t v20 = a14;
  }
  if (a7 + 2 < a6)
  {
    unint64_t v38 = a6 - 1;
    if (next_pinyin((unsigned __int8 *)&v21[a7], a6 - 1 - a7, 0, 0, (unsigned __int8 **)&v308, &v309))
    {
      if (&v21[v38] == v308)
      {
        BOOL v299 = &v21[v38];
        unint64_t v271 = v20 + 128;
        unint64_t v274 = a6 - 1;
        v279 = &v21[a6];
        uint64_t v39 = v22 - a6 - 13;
        unint64_t v286 = a6 - v22 + 13;
        for (unint64_t i = 14; i > 2; --i)
        {
          unint64_t v41 = a6 + i - 1;
          if (v41 <= v22)
          {
            uint64_t v311 = 0;
            unint64_t v312 = 0;
            uint64_t v313 = 0;
            id v42 = [(AppleSpell *)self englishStringFromWordBuffer:v299 length:i connection:a4];
            if (v42)
            {
              int v43 = v42;
              if (v286 + i == 14
                || findPinyin((unsigned __int8 *)&v279[i - 1], v39, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, 0)&& v286 + i + v313 == 14)
              {
                id v44 = (id)[[NSString alloc] initWithBytes:v21 length:v38 encoding:12];
                id v45 = &stru_26C1C71A8;
                if (v41 < v22) {
                  id v45 = (__CFString *)(id)[[NSString alloc] initWithBytes:&v279[i - 1] length:v39 encoding:12];
                }
                uint64_t v46 = [v43 length];
                uint64_t v47 = [v44 length];
                uint64_t v48 = [v44 length];
                id v49 = [PRPinyinString alloc];
                uint64_t v50 = [NSString stringWithFormat:@"%@%@%@", v44, v43, v45];
                int v51 = v49;
                unint64_t v22 = a10;
                unsigned int v52 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v51, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v50, v312 + a11, v310, v271 + v309 + v311, a10, 5, v47, i, v48, v46, v47, i);
                if (([a3 containsObject:v52] & 1) == 0) {
                  [a3 addObject:v52];
                }

                char v23 = 1;
                a5 = v304;
                uint64_t v21 = a9;
                self = v295;
                unint64_t v38 = v274;
              }
            }
          }
          ++v39;
          a6 = v291;
        }
      }
    }
  }
  if (a6 < a5)
  {
    unsigned int v53 = &v21[a6];
    unint64_t v54 = v22 - a6;
    uint64_t v55 = v22 - a6 - 14;
    unint64_t v56 = 14;
    unint64_t v300 = v53;
    unint64_t v280 = v22 - a6;
    do
    {
      if (a6 + v56 <= v22)
      {
        uint64_t v311 = 0;
        unint64_t v312 = 0;
        uint64_t v313 = 0;
        uint64_t v57 = [(AppleSpell *)v295 englishStringFromWordBuffer:v53 length:v56 connection:a4];
        if (v57)
        {
          uint64_t v58 = (void *)v57;
          if (v54 == v56
            || findPinyin((unsigned __int8 *)&v53[v56], v55, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, 0)&& v54 - v313 == v56)
          {
            if (a6)
            {
              uint64_t v59 = (__CFString *)(id)[[NSString alloc] initWithBytes:a9 length:a6 encoding:12];
              uint64_t v60 = &stru_26C1C71A8;
            }
            else
            {
              uint64_t v60 = &stru_26C1C71A8;
              uint64_t v59 = &stru_26C1C71A8;
            }
            if (a6 + v56 < v22) {
              uint64_t v60 = (__CFString *)(id)[[NSString alloc] initWithBytes:&v53[v56] length:v55 encoding:12];
            }
            uint64_t v61 = [v58 length];
            uint64_t v62 = [(__CFString *)v59 length];
            uint64_t v63 = [(__CFString *)v59 length];
            uint64_t v64 = [PRPinyinString alloc];
            uint64_t v65 = [NSString stringWithFormat:@"%@%@%@", v59, v58, v60];
            uint64_t v258 = v63;
            unint64_t v22 = a10;
            int v66 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v64, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v65, v312 + a11, v310, a13 + 128 + v311, a10, 5, v62, v56, v258, v61, v62, v56);
            if (([a3 containsObject:v66] & 1) == 0) {
              [a3 addObject:v66];
            }

            char v23 = 1;
            unsigned int v53 = v300;
            a5 = v304;
            a6 = v291;
            unint64_t v54 = v280;
          }
        }
      }
      --v56;
      ++v55;
    }
    while (v56 > 2);
  }
  long long v67 = v295;
  if (a6 + 2 >= a5)
  {
    long long v68 = a9;
  }
  else
  {
    long long v68 = a9;
    unint64_t v69 = a5 - 1;
    if (next_pinyin((unsigned __int8 *)&a9[a6], a5 - 1 - a6, 0, 0, (unsigned __int8 **)&v308, &v309)
      && &a9[v69] == v308)
    {
      size_t v301 = &a9[v69];
      unint64_t v275 = a5 - 1;
      uint64_t v281 = &a9[a5];
      uint64_t v70 = v22 - a5 - 13;
      unint64_t v287 = a5 - v22 + 13;
      for (unint64_t j = 14; j > 2; --j)
      {
        unint64_t v72 = a5 + j - 1;
        if (v72 <= v22)
        {
          uint64_t v311 = 0;
          unint64_t v312 = 0;
          uint64_t v313 = 0;
          uint64_t v73 = [(AppleSpell *)v67 englishStringFromWordBuffer:v301 length:j connection:a4];
          if (v73)
          {
            uint64_t v74 = (void *)v73;
            if (v287 + j == 14
              || findPinyin((unsigned __int8 *)&v281[j - 1], v70, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, 0)&& v287 + j + v313 == 14)
            {
              id v75 = (id)[[NSString alloc] initWithBytes:v68 length:v69 encoding:12];
              int v76 = &stru_26C1C71A8;
              if (v72 < v22) {
                int v76 = (__CFString *)(id)[[NSString alloc] initWithBytes:&v281[j - 1] length:v70 encoding:12];
              }
              uint64_t v77 = [v74 length];
              uint64_t v78 = [v75 length];
              uint64_t v79 = [v75 length];
              uint64_t v80 = [PRPinyinString alloc];
              uint64_t v81 = [NSString stringWithFormat:@"%@%@%@", v75, v74, v76];
              id v82 = v80;
              unint64_t v22 = a10;
              uint64_t v83 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v82, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v81, a11 + 1 + v312, v310, a13 + 128 + v309 + v311, a10, 5, v78, j, v79, v77, v78, j);
              if (([a3 containsObject:v83] & 1) == 0) {
                [a3 addObject:v83];
              }

              char v23 = 1;
              a5 = v304;
              long long v68 = a9;
              long long v67 = v295;
              unint64_t v69 = v275;
            }
          }
        }
        ++v70;
      }
    }
  }
  int v84 = (unsigned __int8 *)&v68[a5];
  unint64_t v85 = a8;
  unint64_t v272 = a11 + 1;
  unint64_t v276 = a12 + 128;
  uint64_t v302 = v22 - a5;
  uint64_t v86 = v22 - a5 - 14;
  unint64_t v87 = 14;
  uint64_t v282 = v84;
  do
  {
    unint64_t v88 = a5 + v87;
    if (a5 + v87 <= v22)
    {
      uint64_t v311 = 0;
      unint64_t v312 = 0;
      uint64_t v313 = 0;
      uint64_t v89 = [(AppleSpell *)v67 englishStringFromWordBuffer:v84 length:v87 connection:a4];
      if (v89)
      {
        BOOL v90 = (void *)v89;
        if (v302 == v87
          || findPinyin(&v84[v87], v86, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, 0)&& v302 - v313 == v87)
        {
          if (a5)
          {
            unint64_t v91 = (__CFString *)(id)[[NSString alloc] initWithBytes:a9 length:a5 encoding:12];
            char v92 = &stru_26C1C71A8;
          }
          else
          {
            char v92 = &stru_26C1C71A8;
            unint64_t v91 = &stru_26C1C71A8;
          }
          if (v88 < v22) {
            char v92 = (__CFString *)(id)[[NSString alloc] initWithBytes:&v84[v87] length:v86 encoding:12];
          }
          uint64_t v93 = [v90 length];
          uint64_t v94 = [(__CFString *)v91 length];
          uint64_t v95 = [(__CFString *)v91 length];
          uint64_t v96 = [PRPinyinString alloc];
          uint64_t v97 = [NSString stringWithFormat:@"%@%@%@", v91, v90, v92];
          char v98 = v96;
          unint64_t v22 = a10;
          uint64_t v99 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v98, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v97, v272 + v312, v310, v276 + v311, a10, 5, v94, v87, v95, v93, v94, v87);
          if (([a3 containsObject:v99] & 1) == 0) {
            [a3 addObject:v99];
          }

          char v23 = 1;
          a5 = v304;
          unint64_t v85 = a8;
          long long v67 = v295;
          int v84 = v282;
        }
      }
    }
    --v87;
    ++v86;
  }
  while (v87 > 2);
  if (v85 != a5)
  {
    CFRange v288 = &a9[v85];
    unint64_t v269 = v22 - v85;
    uint64_t v100 = v22 - v85 - 14;
    for (unint64_t k = 14; k > 2; --k)
    {
      if (v85 + k <= v22)
      {
        uint64_t v311 = 0;
        unint64_t v312 = 0;
        uint64_t v313 = 0;
        uint64_t v102 = [(AppleSpell *)v67 englishStringFromWordBuffer:v288 length:k connection:a4];
        if (v102)
        {
          uint64_t v103 = (void *)v102;
          if (v269 == k
            || findPinyin((unsigned __int8 *)&v288[k], v100, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, 0)&& v269 - v313 == k)
          {
            if (v85)
            {
              uint64_t v104 = (__CFString *)(id)[[NSString alloc] initWithBytes:a9 length:v85 encoding:12];
              unint64_t v105 = &stru_26C1C71A8;
            }
            else
            {
              unint64_t v105 = &stru_26C1C71A8;
              uint64_t v104 = &stru_26C1C71A8;
            }
            if (v85 + k < v22) {
              unint64_t v105 = (__CFString *)(id)[[NSString alloc] initWithBytes:&v288[k] length:v100 encoding:12];
            }
            uint64_t v106 = [v103 length];
            uint64_t v107 = [(__CFString *)v104 length];
            uint64_t v108 = [(__CFString *)v104 length];
            int v109 = [PRPinyinString alloc];
            uint64_t v110 = [NSString stringWithFormat:@"%@%@%@", v104, v103, v105];
            uint64_t v259 = v108;
            unint64_t v22 = a10;
            uint64_t v111 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v109, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v110, a11 + 2 + v312, v310, v276 + a15 + v311, a10, 5, v107, k, v259, v106, v107, k);
            if (([a3 containsObject:v111] & 1) == 0) {
              [a3 addObject:v111];
            }

            char v23 = 1;
            a5 = v304;
            unint64_t v85 = a8;
            long long v67 = v295;
            int v84 = v282;
          }
        }
      }
      ++v100;
    }
  }
  if ((v23 & 1) == 0)
  {
    unint64_t v112 = a5 + 2;
    if (a5 + 2 <= v22
      && (uint64_t v311 = 0,
          unint64_t v312 = 0,
          uint64_t v313 = 0,
          (uint64_t v113 = [(AppleSpell *)v67 englishStringFromWordBuffer:v84 length:2 connection:a4]) != 0)&& ((v114 = (void *)v113, v112 == v22)|| findPinyin(v84 + 2, v302 - 2, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310,
                          &v311,
                          0,
                          0,
                          0,
                          0,
                          0)
       && v313 + v112 == v22))
    {
      if (a5) {
        uint64_t v115 = (__CFString *)(id)[[NSString alloc] initWithBytes:a9 length:a5 encoding:12];
      }
      else {
        uint64_t v115 = &stru_26C1C71A8;
      }
      if (v112 >= v22) {
        int v121 = &stru_26C1C71A8;
      }
      else {
        int v121 = (__CFString *)(id)[[NSString alloc] initWithBytes:v84 + 2 length:v302 - 2 encoding:12];
      }
      uint64_t v122 = [v114 length];
      uint64_t v123 = [(__CFString *)v115 length];
      uint64_t v124 = [(__CFString *)v115 length];
      uint64_t v125 = [PRPinyinString alloc];
      uint64_t v126 = [NSString stringWithFormat:@"%@%@%@", v115, v114, v121];
    }
    else
    {
      if (v85 == a5
        || (unint64_t v116 = v85 + 2, v85 + 2 > v22)
        || (uint64_t v311 = 0,
            unint64_t v312 = 0,
            unsigned __int8 v117 = &a9[v85],
            uint64_t v313 = 0,
            (v118 = [(AppleSpell *)v67 englishStringFromWordBuffer:&a9[v85] length:2 connection:a4]) == 0)|| (int v119 = (void *)v118, v116 != v22)&& (!findPinyin((unsigned __int8 *)v117 + 2, v22 - v85 - 2, 0, 1, 0, 0, 0, 0, &v313, 0, &v312, &v310,
                             &v311,
                             0,
                             0,
                             0,
                             0,
                             0)
         || v313 + v116 != v22))
      {
        if (a5 + 4 < v22
          && a5 + 14 >= v22
          && -[AppleSpell validateWordPrefixBuffer:length:connection:](v67, "validateWordPrefixBuffer:length:connection:", v84, v302, a4)&& ((int v127 = *v84, (v127 - 65) < 0x1A)|| (v127 - 192) < 0x17|| (v127 - 216) < 7|| (v128 = v127 - 138, v128 <= 0x15) && ((1 << v128) & 0x200015) != 0|| !-[AppleSpell checkWordBuffer:length:languageObject:index:](v67, "checkWordBuffer:length:languageObject:index:", v84, v302, v261, 1))&& !-[AppleSpell checkNegativeWordBuffer:length:languageObject:](v67, "checkNegativeWordBuffer:length:languageObject:",
                v84,
                v302,
                v261))
        {
          if (a5) {
            unsigned int v134 = (__CFString *)(id)[[NSString alloc] initWithBytes:a9 length:a5 encoding:12];
          }
          else {
            unsigned int v134 = &stru_26C1C71A8;
          }
          id v135 = (id)[[NSString alloc] initWithBytes:v84 length:v302 encoding:12];
          uint64_t v136 = [v135 length];
          uint64_t v137 = [(__CFString *)v134 length];
          uint64_t v138 = [(__CFString *)v134 length];
          char v139 = [PRPinyinString alloc];
          uint64_t v140 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v139, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", [NSString stringWithFormat:@"%@%@%@", v134, v135, &stru_26C1C71A8], a11 + 2, 1, v276 + a15, v22, 5, v137, v302, v138, v136, v137, v302);
        }
        else
        {
          if (v85 + 4 >= v22) {
            goto LABEL_155;
          }
          if (v85 + 14 < v22) {
            goto LABEL_155;
          }
          uint64_t v129 = &a9[v85];
          unint64_t v130 = v22 - v85;
          if (![(AppleSpell *)v67 validateWordPrefixBuffer:&a9[v85] length:v22 - v85 connection:a4])goto LABEL_155; {
          int v131 = *v129;
          }
          if ((v131 - 65) >= 0x1A
            && (v131 - 192) >= 0x17
            && (v131 - 216) >= 7)
          {
            unsigned int v132 = v131 - 138;
            if ((v132 > 0x15 || ((1 << v132) & 0x200015) == 0)
              && [(AppleSpell *)v67 checkWordBuffer:v129 length:v22 - v85 languageObject:v261 index:1])
            {
              goto LABEL_155;
            }
          }
          if ([(AppleSpell *)v67 checkNegativeWordBuffer:v129 length:v22 - v85 languageObject:v261])
          {
            goto LABEL_155;
          }
          if (v85) {
            char v133 = (__CFString *)(id)[[NSString alloc] initWithBytes:a9 length:v85 encoding:12];
          }
          else {
            char v133 = &stru_26C1C71A8;
          }
          id v142 = (id)[[NSString alloc] initWithBytes:v129 length:v130 encoding:12];
          uint64_t v143 = [v142 length];
          uint64_t v144 = [(__CFString *)v133 length];
          uint64_t v145 = [(__CFString *)v133 length];
          long long v146 = [PRPinyinString alloc];
          uint64_t v140 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v146, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", [NSString stringWithFormat:@"%@%@%@", v133, v142, &stru_26C1C71A8], a11 + 2, 1, v276 + a15, v22, 5, v144, v130, v145, v143, v144, v130);
        }
        goto LABEL_152;
      }
      if (v85) {
        unint64_t v120 = (__CFString *)(id)[[NSString alloc] initWithBytes:a9 length:v85 encoding:12];
      }
      else {
        unint64_t v120 = &stru_26C1C71A8;
      }
      if (v116 >= v22) {
        char v141 = &stru_26C1C71A8;
      }
      else {
        char v141 = (__CFString *)(id)[[NSString alloc] initWithBytes:v117 + 2 length:v22 - a8 - 2 encoding:12];
      }
      uint64_t v122 = [v119 length];
      uint64_t v123 = [(__CFString *)v120 length];
      uint64_t v124 = [(__CFString *)v120 length];
      uint64_t v125 = [PRPinyinString alloc];
      uint64_t v126 = [NSString stringWithFormat:@"%@%@%@", v120, v119, v141];
    }
    uint64_t v140 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v125, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v126, v272 + v312, v310, v276 + a15 + v311, v22, 5, v123, 2, v124, v122, v123, 2);
LABEL_152:
    long long v147 = (void *)v140;
    if (([a3 containsObject:v140] & 1) == 0) {
      [a3 addObject:v147];
    }

    a5 = v304;
    unint64_t v85 = a8;
    long long v67 = v295;
  }
LABEL_155:
  long long v148 = a9;
  [(AppleSpell *)v67 addSpecialModifiedPinyinToArray:a3 inBuffer:a9 length:v22 atEnd:0];
  unint64_t v307 = v22 + 1;
  if (v22 + 1 > 1) {
    size_t v149 = v22 + 1;
  }
  else {
    size_t v149 = 1;
  }
  memcpy(__dst, a9, v149);
  long long v150 = malloc_type_malloc(8 * v22, 0x100004000313F17uLL);
  if (v22 >= 3)
  {
    if (v85 <= a5) {
      uint64_t v151 = 0;
    }
    else {
      uint64_t v151 = -1;
    }
    uint64_t v268 = v151;
    unint64_t v152 = v85 + 5;
    unint64_t v277 = v85 + 5;
    unint64_t v283 = ((__PAIR128__(v85, a5) - v85) >> 64) + 1;
    unint64_t v296 = (__PAIR128__(v85, a5) - v85) >> 64;
    if (v296 < v85 + 5 && v283 < a10)
    {
      uint64_t v289 = &__dst[a5];
      unint64_t v153 = ((__PAIR128__(v85, a5) - v85) >> 64) + 1;
      unint64_t v154 = (__PAIR128__(v85, a5) - v85) >> 64;
      while (1)
      {
        unint64_t v155 = v153;
        int v156 = v148[v154];
        unsigned int v157 = v148[v153];
        BOOL v158 = (v156 - 65) >= 0x1A && v157 - 65 >= 0x1A;
        if (!v158) {
          goto LABEL_213;
        }
        if ((v156 - 97) <= 0x19 && v157 >= 0x61 && v157 <= 0x7A) {
          break;
        }
LABEL_211:
        if (v155 < v152)
        {
          unint64_t v153 = v155 + 1;
          unint64_t v154 = v155;
          if (v155 + 1 < a10) {
            continue;
          }
        }
        goto LABEL_213;
      }
      __dst[v154] = v157;
      __dst[v153] = v156;
      if (findPinyin(v289, v302, 0, 0, 0, 0, 0, &v314, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, v150)&& v313 + a5 == a10
        && (!v310 || v155 < v314 + a5))
      {
        if (v312)
        {
          unint64_t v159 = 0;
          uint64_t v160 = 0;
          uint64_t v161 = 0;
          uint64_t v162 = 0x7FFFFFFFFFFFFFFFLL;
          unint64_t v163 = v304;
          while (1)
          {
            uint64_t v164 = v150[v159];
            unint64_t v165 = v164 + v163;
            if (v154 < v163) {
              goto LABEL_184;
            }
            if (v155 < v165)
            {
              uint64_t v160 = v150[v159];
              uint64_t v166 = v163;
              goto LABEL_185;
            }
            if (v154 >= v165)
            {
LABEL_184:
              uint64_t v166 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else
            {
              uint64_t v160 = v150[v159 + 1];
              uint64_t v161 = v150[v159];
              uint64_t v162 = v163;
              uint64_t v166 = v164 + v163;
            }
LABEL_185:
            if (v166 == 0x7FFFFFFFFFFFFFFFLL)
            {
              ++v159;
              v163 += v164;
              if (v159 < v312) {
                continue;
              }
            }
            goto LABEL_204;
          }
        }
        uint64_t v161 = 0;
        uint64_t v160 = 0;
        uint64_t v162 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v166 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_204:
        size_t __na = v162;
        uint64_t v175 = v161;
        long long v176 = (void *)[[NSString alloc] initWithBytes:__dst length:a10 encoding:12];
        long long v177 = [PRPinyinString alloc];
        uint64_t v178 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:originalAdditionalSyllableRange:](v177, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:originalAdditionalSyllableRange:", v176, v312 + a11, v310, v311 + a12, a10, 2, v154, 2, v154, 2, v166, v160, __na, v175);
        goto LABEL_207;
      }
      if (!findPinyin(&__dst[v291], a10 - v291, 0, 0, 0, 0, 0, &v314, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, v150)|| v313 + v291 != a10
        || v310 && v155 >= v314 + v291)
      {
LABEL_210:
        __dst[v154] = v156;
        __dst[v155] = v157;
        goto LABEL_211;
      }
      if (!v312)
      {
        uint64_t v169 = 0;
        uint64_t v168 = 0;
        uint64_t v174 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v170 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_206:
        uint64_t v263 = v168;
        size_t __nb = v170;
        long long v176 = (void *)[[NSString alloc] initWithBytes:__dst length:a10 encoding:12];
        long long v179 = [PRPinyinString alloc];
        uint64_t v178 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:originalAdditionalSyllableRange:](v179, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:originalAdditionalSyllableRange:", v176, a11 - 1 + v312, v310, v311 + a13, a10, 2, v154, 2, v154, 2, v174, v169, __nb, v263);
LABEL_207:
        long long v180 = (void *)v178;
        if (([a3 containsObject:v178] & 1) == 0) {
          [a3 addObject:v180];
        }

        a5 = v304;
        long long v148 = a9;
        unint64_t v152 = v277;
        goto LABEL_210;
      }
      unint64_t v167 = 0;
      uint64_t v168 = 0;
      uint64_t v169 = 0;
      uint64_t v170 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v171 = v291;
      while (1)
      {
        uint64_t v172 = v150[v167];
        unint64_t v173 = v172 + v171;
        if (v154 < v171) {
          goto LABEL_199;
        }
        if (v155 < v173)
        {
          uint64_t v174 = v171;
          uint64_t v169 = v150[v167];
          goto LABEL_200;
        }
        if (v154 >= v173)
        {
LABEL_199:
          uint64_t v174 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          uint64_t v169 = v150[v167 + 1];
          uint64_t v174 = v172 + v171;
          uint64_t v170 = v171;
          uint64_t v168 = v150[v167];
        }
LABEL_200:
        if (v174 == 0x7FFFFFFFFFFFFFFFLL)
        {
          ++v167;
          v171 += v172;
          if (v167 < v312) {
            continue;
          }
        }
        goto LABEL_206;
      }
    }
LABEL_213:
    unint64_t v181 = a8;
    if (a10 >= 4)
    {
      unint64_t v182 = a10;
      if (v277 >= a10) {
        unint64_t v183 = a10;
      }
      else {
        unint64_t v183 = v277;
      }
      unint64_t v184 = v296;
      if (v296 < v183)
      {
        unint64_t v185 = v304;
        CFRange v186 = &__dst[v304];
        unint64_t v290 = v183;
        unint64_t v187 = v296;
        do
        {
          int v188 = v148[v187];
          if ((v188 - 65) < 0x1A) {
            break;
          }
          if ((v188 - 97) <= 0x19)
          {
            uint64_t v189 = 0;
            unsigned int v190 = v188 - 97;
            do
            {
              int v191 = adjacentMatchesChinese[6 * v190 + v189];
              if ((_BYTE)v191)
              {
                __dst[v187] = v191;
                if (findPinyin(v186, v302, 0, 0, 0, 0, 0, &v314, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, v150))
                {
                  if (v313 + v185 == a10 && (!v310 || v187 < v314 + v185))
                  {
                    if (v312)
                    {
                      uint64_t v192 = 0;
                      uint64_t v193 = 0;
                      unint64_t v194 = v185;
                      do
                      {
                        uint64_t v195 = v150[v192];
                        unint64_t v196 = v195 + v194;
                        if (v187 >= v195 + v194) {
                          uint64_t v197 = 0x7FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          uint64_t v197 = v194;
                        }
                        if (v187 >= v195 + v194) {
                          uint64_t v195 = v193;
                        }
                        if (v187 >= v194) {
                          uint64_t v198 = v197;
                        }
                        else {
                          uint64_t v198 = 0x7FFFFFFFFFFFFFFFLL;
                        }
                        if (v187 >= v194) {
                          uint64_t v193 = v195;
                        }
                        BOOL v199 = v198 != 0x7FFFFFFFFFFFFFFFLL || ++v192 >= v312;
                        unint64_t v194 = v196;
                      }
                      while (!v199);
                    }
                    else
                    {
                      uint64_t v193 = 0;
                      uint64_t v198 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    uint64_t v200 = (void *)[[NSString alloc] initWithBytes:__dst length:a10 encoding:12];
                    char v201 = [PRPinyinString alloc];
                    int v202 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v201, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v200, v312 + a11, v310, a12 + 12 + v311, a10, 1, v187, 1, v187, 1, v198, v193);
                    if (([a3 containsObject:v202] & 1) == 0) {
                      [a3 addObject:v202];
                    }

                    unint64_t v185 = v304;
                    unint64_t v181 = a8;
                    long long v148 = a9;
                  }
                }
              }
              ++v189;
            }
            while (v189 != 6);
            LOBYTE(v188) = v148[v187];
            unint64_t v184 = v296;
            unint64_t v183 = v290;
          }
          __dst[v187++] = v188;
        }
        while (v187 < v183);
        uint64_t v203 = 0;
        unint64_t v204 = v307;
        uint64_t v205 = v307 - v185;
        unint64_t v206 = v184 + 2;
        unint64_t v262 = v184 + 2;
        unint64_t v264 = ~v181;
        unint64_t v182 = a10;
        do
        {
          if (v206 + v203 <= v204) {
            unint64_t v207 = v204;
          }
          else {
            unint64_t v207 = v206 + v203;
          }
          int v208 = v148[v184];
          if ((v208 - 65) < 0x1A) {
            break;
          }
          if ((v208 - 97) >= 0x1A)
          {
            unint64_t v213 = v184 + 1;
          }
          else
          {
            unint64_t v209 = v182;
            if (v204 > v184)
            {
              do
                __dst[v209 + 1] = __dst[v209];
              while (v209-- > v184);
            }
            uint64_t v211 = 0;
            int v270 = &v148[v283 + v203];
            unint64_t v273 = &__dst[v283 + v203];
            uint64_t v292 = v203;
            __uint64_t n = v207 + v264 - (v203 + v268);
            unsigned int v212 = v208 - 97;
            unint64_t v297 = v184;
            unint64_t v213 = v184 + 1;
            do
            {
              int v214 = insertionFollowers[6 * v212 + v211];
              if ((_BYTE)v214)
              {
                __dst[v213] = v214;
                if (findPinyin(v186, v205, 0, 0, 0, 0, 0, &v314, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, v150))
                {
                  if (v313 + v304 == v204 && (!v310 || v213 < v314 + v304))
                  {
                    if (v312)
                    {
                      uint64_t v215 = 0;
                      uint64_t v216 = 0;
                      unint64_t v217 = v304;
                      do
                      {
                        uint64_t v218 = v150[v215];
                        unint64_t v219 = v218 + v217;
                        uint64_t v220 = v218 - 1;
                        if (v213 >= v219) {
                          uint64_t v221 = 0x7FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          uint64_t v221 = v217;
                        }
                        if (v213 >= v219) {
                          uint64_t v220 = v216;
                        }
                        if (v213 >= v217) {
                          uint64_t v222 = v221;
                        }
                        else {
                          uint64_t v222 = 0x7FFFFFFFFFFFFFFFLL;
                        }
                        if (v213 >= v217) {
                          uint64_t v216 = v220;
                        }
                        BOOL v223 = v222 != 0x7FFFFFFFFFFFFFFFLL || ++v215 >= v312;
                        unint64_t v217 = v219;
                      }
                      while (!v223);
                    }
                    else
                    {
                      uint64_t v216 = 0;
                      uint64_t v222 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    char v224 = (void *)[[NSString alloc] initWithBytes:__dst length:v204 encoding:12];
                    char v225 = [PRPinyinString alloc];
                    char v226 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v225, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v224, v312 + a11, v310, a12 + 32 + v311, a10, 3, v213, 0, v213, 1, v222, v216);
                    if (([a3 containsObject:v226] & 1) == 0) {
                      [a3 addObject:v226];
                    }

                    unint64_t v182 = a10;
                    unint64_t v204 = v307;
                  }
                }
              }
              ++v211;
            }
            while (v211 != 6);
            unint64_t v181 = a8;
            if (v297 < v182) {
              memcpy(v273, v270, __n);
            }
            unint64_t v183 = v290;
            uint64_t v203 = v292;
            unint64_t v206 = v262;
          }
          ++v203;
          unint64_t v184 = v213;
          BOOL v158 = v213 >= v183;
          long long v148 = a9;
        }
        while (!v158);
      }
      unint64_t v227 = v304;
      if (v182 >= 5)
      {
        unint64_t v228 = v181 <= 1 ? 1 : v181;
        unint64_t v303 = v228;
        if (v228 < v277)
        {
          unint64_t v229 = v228 + 1;
          if (v228 + 1 < a10)
          {
            uint64_t v230 = 0;
            unint64_t v293 = a10 - 1;
            unint64_t v231 = v228;
            do
            {
              unint64_t v232 = v229;
              int v233 = &v148[v231];
              if (v229 <= v307) {
                unint64_t v234 = v307;
              }
              else {
                unint64_t v234 = v229;
              }
              int v235 = *v233;
              if ((v235 - 65) < 0x1A) {
                break;
              }
              int v236 = v148[v231 - 1];
              if ((v236 - 65) < 0x1A) {
                break;
              }
              int v237 = v148[v229];
              if ((v237 - 65) < 0x1A) {
                break;
              }
              if ((v235 - 97) <= 0x19)
              {
                if (v235 == v236
                  || !a16
                  || (v238 = v235 - 97, int v239 = adjacentMatchesChinese[6 * (v235 - 97)], v239 == v236)
                  || (int v240 = adjacentMatchesChinese[6 * v238 + 1], v240 == v236)
                  || (int v241 = adjacentMatchesChinese[6 * v238 + 2], v241 == v236)
                  || (int v242 = adjacentMatchesChinese[6 * v238 + 3], v242 == v236)
                  || (int v243 = adjacentMatchesChinese[6 * v238 + 4], v243 == v236)
                  || (int v244 = adjacentMatchesChinese[6 * v238 + 5], v244 == v236)
                  || v235 == v237
                  || v239 == v237
                  || v240 == v237
                  || v241 == v237
                  || v242 == v237
                  || v243 == v237
                  || v244 == v237)
                {
                  if (v231 < a10)
                  {
                    unint64_t v245 = v231;
                    do
                    {
                      __dst[v245] = __dst[v245 + 1];
                      ++v245;
                    }
                    while (v245 < a10);
                  }
                  if (findPinyin(&__dst[v304], a10 - 1 - v304, 0, 0, 0, 0, 0, &v314, &v313, 0, &v312, &v310, &v311, 0, 0, 0, 0, v150)&& v313 + v227 == v293
                    && (!v310 || v231 <= v314 + v227))
                  {
                    if (v312)
                    {
                      uint64_t v246 = 0;
                      uint64_t v247 = 0;
                      unint64_t v248 = v227;
                      do
                      {
                        uint64_t v249 = v150[v247];
                        unint64_t v250 = v249 + v248;
                        if (v231 >= v249 + v248) {
                          uint64_t v251 = 0x7FFFFFFFFFFFFFFFLL;
                        }
                        else {
                          uint64_t v251 = v248;
                        }
                        if (v231 < v249 + v248) {
                          uint64_t v252 = v249 + 1;
                        }
                        else {
                          uint64_t v252 = v246;
                        }
                        if (v231 >= v248) {
                          uint64_t v253 = v251;
                        }
                        else {
                          uint64_t v253 = 0x7FFFFFFFFFFFFFFFLL;
                        }
                        if (v231 >= v248) {
                          uint64_t v246 = v252;
                        }
                        BOOL v254 = v253 != 0x7FFFFFFFFFFFFFFFLL || ++v247 >= v312;
                        unint64_t v248 = v250;
                      }
                      while (!v254);
                    }
                    else
                    {
                      uint64_t v246 = 0;
                      uint64_t v253 = 0x7FFFFFFFFFFFFFFFLL;
                    }
                    unsigned int v284 = (void *)[[NSString alloc] initWithBytes:__dst length:v293 encoding:12];
                    long long v255 = [PRPinyinString alloc];
                    long long v256 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v255, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v284, v312 + a11, v310, a12 + 42 + v311, a10, 4, v231, 1, v231, 0, v253, v246);
                    if (([a3 containsObject:v256] & 1) == 0) {
                      [a3 addObject:v256];
                    }

                    unint64_t v227 = v304;
                    long long v148 = a9;
                  }
                  if (v231 <= a10) {
                    memcpy(&__dst[v231], v233, v234 - (v303 + v230));
                  }
                }
              }
              if (v232 >= v277) {
                break;
              }
              unint64_t v229 = v232 + 1;
              ++v230;
              unint64_t v231 = v232;
            }
            while (v232 + 1 < a10);
          }
        }
      }
    }
  }
  if (v150) {
    free(v150);
  }
}

- (void)addModifiedPartialPinyinToArray:(id)a3 connection:(_PR_DB_IO *)a4 fromIndex:(unint64_t)a5 prevIndex:(unint64_t)a6 prevPrevIndex:(unint64_t)a7 prePrevPrevIndex:(unint64_t)a8 startingModificationsAt:(unint64_t)a9 inBuffer:(char *)a10 length:(unint64_t)a11 initialSyllableCount:(unint64_t)a12 initialScore:(unint64_t)a13 prevScore:(unint64_t)a14 prevPrevScore:(unint64_t)a15 lastSyllableScore:(unint64_t)a16
{
  unint64_t v18 = a6;
  id v19 = a4;
  uint64_t v21 = self;
  char v23 = a10;
  unint64_t v22 = a11;
  if (a8 < a7)
  {
    unint64_t v24 = a11 - a8;
    if (a11 > a8)
    {
      id v25 = [(AppleSpell *)self englishStringFromWordBuffer:&a10[a8] length:a11 - a8 connection:a4];
      if (v25)
      {
        unint64_t v26 = v25;
        if (a8) {
          unint64_t v27 = (__CFString *)(id)[[NSString alloc] initWithBytes:a10 length:a8 encoding:12];
        }
        else {
          unint64_t v27 = &stru_26C1C71A8;
        }
        id v28 = a3;
        uint64_t v29 = [v26 length];
        uint64_t v30 = [(__CFString *)v27 length];
        uint64_t v31 = [(__CFString *)v27 length];
        uint64_t v32 = [PRPinyinString alloc];
        uint64_t v33 = [NSString stringWithFormat:@"%@%@", v27, v26];
        uint64_t v93 = v30;
        uint64_t v89 = v29;
        a3 = v28;
        uint64_t v84 = v30;
        unint64_t v22 = a11;
        uint64_t v34 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v32, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v33, a12 - 2, 0, a15 + 128, a11, 5, v84, v24, v31, v89, v93, v24);
        if (([v28 containsObject:v34] & 1) == 0) {
          [v28 addObject:v34];
        }

        unint64_t v18 = a6;
        uint64_t v21 = self;
        char v23 = a10;
        id v19 = a4;
      }
    }
  }
  v102[0] = 0;
  unsigned int v101 = 0;
  if (a8 + 2 < a7)
  {
    unint64_t v35 = a7 - 1;
    if (next_pinyin((unsigned __int8 *)&v23[a8], a7 - 1 - a8, 0, 0, v102, &v101) && &v23[a7 - 1] == (char *)v102[0])
    {
      unint64_t v37 = v22 - v35;
      uint64_t v38 = [(AppleSpell *)v21 englishStringFromWordBuffer:&v23[v35] length:v22 - v35 connection:v19];
      if (v38)
      {
        uint64_t v39 = (void *)v38;
        id v40 = a3;
        id v41 = (id)[[NSString alloc] initWithBytes:v23 length:a7 - 1 encoding:12];
        unint64_t v42 = v22;
        uint64_t v43 = [v39 length];
        uint64_t v44 = [v41 length];
        uint64_t v45 = [v41 length];
        uint64_t v46 = [PRPinyinString alloc];
        id v85 = v41;
        a3 = v40;
        uint64_t v47 = [NSString stringWithFormat:@"%@%@", v85, v39];
        uint64_t v90 = v43;
        unint64_t v22 = v42;
        uint64_t v48 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v46, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v47, a12 - 1, 0, a15 + v101 + 128, v42, 5, v44, v37, v45, v90, v44, v37);
        if (([v40 containsObject:v48] & 1) == 0) {
          [v40 addObject:v48];
        }

        unint64_t v18 = a6;
        uint64_t v21 = self;
        char v23 = a10;
        id v19 = a4;
      }
    }
  }
  if (a7 < v18)
  {
    unint64_t v49 = v22 - a7;
    if (v22 > a7)
    {
      uint64_t v50 = [(AppleSpell *)v21 englishStringFromWordBuffer:&v23[a7] length:v22 - a7 connection:v19];
      if (v50)
      {
        int v51 = (void *)v50;
        if (a7) {
          unsigned int v52 = (__CFString *)(id)[[NSString alloc] initWithBytes:v23 length:a7 encoding:12];
        }
        else {
          unsigned int v52 = &stru_26C1C71A8;
        }
        id v53 = a3;
        uint64_t v54 = [v51 length];
        unint64_t v55 = v22;
        uint64_t v56 = [(__CFString *)v52 length];
        uint64_t v57 = [(__CFString *)v52 length];
        uint64_t v58 = [PRPinyinString alloc];
        uint64_t v59 = [NSString stringWithFormat:@"%@%@", v52, v51];
        uint64_t v94 = v56;
        uint64_t v91 = v54;
        a3 = v53;
        uint64_t v86 = v56;
        unint64_t v22 = v55;
        uint64_t v60 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v58, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v59, a12 - 1, 0, a15 + 128, v55, 5, v86, v49, v57, v91, v94, v49);
        if (([v53 containsObject:v60] & 1) == 0) {
          [v53 addObject:v60];
        }

        unint64_t v18 = a6;
        uint64_t v21 = self;
        char v23 = a10;
        id v19 = a4;
      }
    }
  }
  if (a7 + 2 < v18)
  {
    unint64_t v61 = v18 - 1;
    if (next_pinyin((unsigned __int8 *)&v23[a7], v18 - 1 - a7, 0, 0, v102, &v101))
    {
      if (&v23[v61] == (char *)v102[0])
      {
        unint64_t v62 = v22 - v61;
        uint64_t v63 = [(AppleSpell *)v21 englishStringFromWordBuffer:&v23[v61] length:v22 - v61 connection:v19];
        if (v63)
        {
          uint64_t v64 = (void *)v63;
          id v65 = a3;
          id v66 = (id)[[NSString alloc] initWithBytes:v23 length:v18 - 1 encoding:12];
          unint64_t v67 = v22;
          uint64_t v68 = [v64 length];
          uint64_t v69 = [v66 length];
          uint64_t v70 = [v66 length];
          uint64_t v71 = [PRPinyinString alloc];
          id v87 = v66;
          a3 = v65;
          uint64_t v72 = [NSString stringWithFormat:@"%@%@", v87, v64];
          uint64_t v92 = v68;
          unint64_t v22 = v67;
          uint64_t v73 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v71, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v72, a12, 0, a15 + v101 + 128, v67, 5, v69, v62, v70, v92, v69, v62);
          if (([v65 containsObject:v73] & 1) == 0) {
            [v65 addObject:v73];
          }

          unint64_t v18 = a6;
          uint64_t v21 = self;
          char v23 = a10;
          id v19 = a4;
        }
      }
    }
  }
  unint64_t v74 = v22 - v18;
  if (v22 > v18)
  {
    uint64_t v75 = [(AppleSpell *)v21 englishStringFromWordBuffer:&v23[v18] length:v22 - v18 connection:v19];
    if (v75)
    {
      int v76 = (void *)v75;
      id v96 = a3;
      unint64_t v97 = v22;
      if (v18) {
        uint64_t v77 = (__CFString *)(id)[[NSString alloc] initWithBytes:v23 length:v18 encoding:12];
      }
      else {
        uint64_t v77 = &stru_26C1C71A8;
      }
      uint64_t v78 = [v76 length];
      uint64_t v79 = [(__CFString *)v77 length];
      uint64_t v80 = [(__CFString *)v77 length];
      uint64_t v81 = [PRPinyinString alloc];
      uint64_t v82 = [NSString stringWithFormat:@"%@%@", v77, v76];
      uint64_t v95 = v79;
      uint64_t v88 = v79;
      unint64_t v22 = v97;
      uint64_t v83 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:](v81, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v82, a12, 0, a14 + 128, v97, 5, v88, v74, v80, v78, v95, v74);
      a3 = v96;
      if (([v96 containsObject:v83] & 1) == 0) {
        [v96 addObject:v83];
      }

      char v23 = a10;
    }
  }
  [(AppleSpell *)v21 addSpecialModifiedPinyinToArray:a3 inBuffer:v23 length:v22 atEnd:1];
}

- (id)_primitiveRetainedAlternativesForPinyinInputString:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263F086B0]);
  float v6 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v41 = 0;
  CFIndex usedBufLen = 0;
  uint64_t v39 = 0;
  id v40 = 0;
  unint64_t v37 = 0;
  uint64_t v38 = 0;
  unint64_t v35 = 0;
  unint64_t v36 = 0;
  uint64_t v33 = 0;
  unint64_t v34 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  char v28 = 0;
  CFIndex v7 = [a3 length];
  float v8 = [(AppleSpell *)self databaseConnectionForLanguageObject:+[PRLanguage languageObjectWithIdentifier:@"en_CN"]];
  if (v7)
  {
    uint64_t v9 = v8;
    v46.NSUInteger location = 0;
    v46.NSUInteger length = v7;
    CFIndex Bytes = CFStringGetBytes((CFStringRef)a3, v46, 0x500u, 0, 0, buffer, 254, &usedBufLen);
    int v11 = 0;
    if (v7 == Bytes)
    {
      CFIndex v12 = usedBufLen;
      buffer[usedBufLen] = 0;
      int v11 = isFullOrAbbreviatedPinyin((uint64_t)buffer, v12, 0, &v34);
      if (findPinyin(buffer, usedBufLen, 0, 1, &v41, &v40, &v39, &v38, &v37, &v36, &v35, &v28, &v30, &v29, &v33, &v32, &v31, 0))
      {
        if (v37 && v37 < usedBufLen)
        {
          LOBYTE(v22) = v11;
          -[AppleSpell addModifiedPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:couldBeAbbreviatedPinyin:](self, "addModifiedPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:couldBeAbbreviatedPinyin:", v6, v9, v38, v39, v40, buffer, usedBufLen, v35 - 1, v33, v32, v31, v30 - v33, v22);
          if (v36 && v36 < usedBufLen)
          {
            LOBYTE(v23) = v11;
            -[AppleSpell addModifiedPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:couldBeAbbreviatedPinyin:](self, "addModifiedPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:couldBeAbbreviatedPinyin:", v6, v9, v38, v39, v40, buffer, usedBufLen, v35 - 1, v33, v32, v31, v29 - v33, v23);
          }
        }
        else if (v28)
        {
          [(AppleSpell *)self addModifiedPartialPinyinToArray:v6 connection:v9 fromIndex:v38 prevIndex:v39 prevPrevIndex:v40 prePrevPrevIndex:v41 startingModificationsAt:v37 inBuffer:buffer length:usedBufLen initialSyllableCount:v35 - 1 initialScore:v33 prevScore:v32 prevPrevScore:v31 lastSyllableScore:v30 - v33];
        }
      }
      else
      {
        LOBYTE(v22) = v11;
        -[AppleSpell addModifiedPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:couldBeAbbreviatedPinyin:](self, "addModifiedPinyinToArray:connection:fromIndex:prevIndex:prevPrevIndex:startingModificationsAt:inBuffer:length:initialSyllableCount:initialScore:prevScore:prevPrevScore:lastSyllableScore:couldBeAbbreviatedPinyin:", v6, v9, 0, 0, 0, buffer, usedBufLen, 0, 0, 0, 0, 0, v22);
      }
    }
  }
  else
  {
    int v11 = 0;
  }
  [v6 sortWithOptions:16 usingComparator:&__block_literal_global_9];
  if ([v6 count])
  {
    unint64_t v35 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", 0), "syllableCount");
    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v14 = [v6 countByEnumeratingWithState:&v24 objects:v43 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v6);
          }
          unint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          unint64_t v19 = [v18 syllableCount];
          if (v19 <= v35 || [v18 numberOfNonPinyinRanges])
          {
            if (!v11
              || (unint64_t v20 = [v18 syllableCount], v20 < v34)
              || [v18 numberOfNonPinyinRanges])
            {
              [v13 addObject:v18];
            }
          }
        }
        uint64_t v15 = [v6 countByEnumeratingWithState:&v24 objects:v43 count:16];
      }
      while (v15);
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __74__AppleSpell_Chinese___primitiveRetainedAlternativesForPinyinInputString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = [a2 syllableCount];
  unint64_t v6 = [a3 syllableCount];
  unint64_t v7 = [a2 score];
  unint64_t v8 = [a3 score];
  uint64_t v9 = -1;
  if (v5 < v6) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }
  if (v7 >= v8) {
    uint64_t v9 = 1;
  }
  if (v7 == v8) {
    uint64_t v9 = 0;
  }
  if (v5 == v6) {
    return v9;
  }
  else {
    return v10;
  }
}

- (unint64_t)_getSplitIndexes:(unint64_t *)a3 maxCount:(unint64_t)a4 forPinyinInputString:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  CFIndex v8 = [a5 length];
  unint64_t v28 = 0;
  if (!v8) {
    return 0;
  }
  CFIndex v9 = v8;
  CFIndex usedBufLen = 0;
  uint64_t v30 = 0;
  v33.NSUInteger location = 0;
  v33.NSUInteger length = v8;
  CFIndex Bytes = CFStringGetBytes((CFStringRef)a5, v33, 0x500u, 0, 0, buffer, 254, &usedBufLen);
  unint64_t v11 = 0;
  if (v9 == Bytes)
  {
    findPinyin(buffer, usedBufLen, 0, 1, 0, 0, 0, 0, &v28, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    unint64_t v11 = 0;
    unint64_t v13 = v28;
    unint64_t v12 = usedBufLen;
    if (v28 < usedBufLen)
    {
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v14 = &buffer[v13];
        uint64_t v15 = next_pinyin(&buffer[v13], v12 - v13, 0, 0, &v30, 0);
        unint64_t v12 = usedBufLen;
        if (v15)
        {
          if (v30 > v14 + 1 && v30 < &buffer[usedBufLen]) {
            break;
          }
        }
        if (++v13 < usedBufLen)
        {
          unsigned int v17 = *v14;
          BOOL v18 = v17 <= 0xF7 && v17 - 97 >= 0x1A;
          BOOL v19 = v18 && v17 - 223 >= 0x18;
          if (!v19
            || ((v20 = v17 - 154, BOOL v21 = v20 > 4, v22 = (1 << v20) & 0x15, !v21) ? (v23 = v22 == 0) : (v23 = 1), !v23))
          {
            int v24 = buffer[v13];
            if ((v24 - 65) < 0x1A || (v24 - 192) < 0x17) {
              goto LABEL_32;
            }
            if ((v24 - 216) < 7) {
              goto LABEL_32;
            }
            unsigned int v26 = v24 - 138;
            if (v26 <= 0x15 && ((1 << v26) & 0x200015) != 0) {
              goto LABEL_32;
            }
          }
        }
LABEL_33:
        if (v13 >= v12) {
          return v11;
        }
      }
      unint64_t v13 = v30 - buffer;
LABEL_32:
      a3[v11++] = v13;
      if (v11 >= a4) {
        return v11;
      }
      goto LABEL_33;
    }
  }
  return v11;
}

- (id)_pinyinStringByCombiningPinyinString:(id)a3 withPinyinString:(id)a4
{
  if (([a3 lastSyllableIsPartial] & 1) != 0
    || (uint64_t v6 = [a3 originalLength], v6 != objc_msgSend(a3, "originalCheckedLength")))
  {
    unint64_t v13 = 0;
  }
  else
  {
    uint64_t v58 = [a3 length];
    uint64_t v61 = [a3 originalLength];
    uint64_t v7 = [a3 numberOfModifications];
    uint64_t v8 = [a4 numberOfModifications];
    uint64_t v9 = v8 + v7;
    uint64_t v10 = (void *)[a3 string];
    uint64_t v52 = [a4 string];
    BOOL v60 = 0;
    if (v7 && v8) {
      BOOL v60 = [a3 typeOfModificationAtIndex:v7 - 1] == 5
    }
         && [a4 typeOfModificationAtIndex:0] == 5
         && (uint64_t v11 = [a3 finalRangeForModificationAtIndex:v7 - 1], v11 + v12 == v58)
         && [a4 finalRangeForModificationAtIndex:0] == 0;
    if (v9)
    {
      uint64_t v59 = v8;
      uint64_t v50 = v10;
      uint64_t v15 = malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
      uint64_t v51 = v8 + v7;
      uint64_t v16 = malloc_type_malloc(16 * v9, 0x1000040451B5BE8uLL);
      id v53 = malloc_type_malloc(16 * v9, 0x1000040451B5BE8uLL);
      unint64_t v55 = malloc_type_malloc(16 * v9, 0x1000040451B5BE8uLL);
      uint64_t v56 = (char *)malloc_type_malloc(16 * v9, 0x1000040451B5BE8uLL);
      if (v7)
      {
        uint64_t v17 = 0;
        BOOL v18 = v56 + 8;
        BOOL v19 = v16 + 1;
        unsigned int v20 = v55 + 1;
        BOOL v21 = v53 + 1;
        do
        {
          v15[v17] = [a3 typeOfModificationAtIndex:v17];
          *(v19 - 1) = [a3 originalRangeForModificationAtIndex:v17];
          *BOOL v19 = v22;
          *(v21 - 1) = [a3 finalRangeForModificationAtIndex:v17];
          *BOOL v21 = v23;
          *(v20 - 1) = [a3 originalSyllableRangeForModificationAtIndex:v17];
          void *v20 = v24;
          *(v18 - 1) = [a3 originalAdditionalSyllableRangeForModificationAtIndex:v17];
          void *v18 = v25;
          ++v17;
          v18 += 2;
          v19 += 2;
          v20 += 2;
          v21 += 2;
        }
        while (v7 != v17);
      }
      if (v59)
      {
        uint64_t v26 = 0;
        uint64_t v27 = 16 * v7;
        unint64_t v28 = v15;
        uint64_t v29 = v56 + 8;
        uint64_t v30 = (char *)(v55 + 1);
        unint64_t v49 = v16;
        uint64_t v31 = (char *)(v16 + 1);
        uint64_t v32 = v53;
        uint64_t v54 = v28;
        CFRange v33 = &v28[v7];
        do
        {
          v33[v26] = [a4 typeOfModificationAtIndex:v26];
          unint64_t v34 = &v31[v27];
          *((void *)v34 - 1) = [a4 originalRangeForModificationAtIndex:v26] + v61;
          *(void *)unint64_t v34 = v35;
          unint64_t v36 = &v32[(unint64_t)v27 / 8];
          uint64_t v38 = [a4 finalRangeForModificationAtIndex:v26] + v58;
          uint64_t *v36 = v38;
          v36[1] = v37;
          if (v60)
          {
            uint64_t v39 = v36 + 1;
            if (v26) {
              uint64_t v39 = &v32[(unint64_t)v27 / 8];
            }
            else {
              uint64_t v38 = v37;
            }
            *uint64_t v39 = v38 + 1;
          }
          id v40 = &v30[v27];
          uint64_t v41 = [a4 originalSyllableRangeForModificationAtIndex:v26];
          *((void *)v40 - 1) = v41;
          *(void *)id v40 = v42;
          if (v41 != 0x7FFFFFFFFFFFFFFFLL) {
            *((void *)v40 - 1) = v41 + v61;
          }
          uint64_t v43 = &v29[v27];
          uint64_t v44 = [a4 originalAdditionalSyllableRangeForModificationAtIndex:v26];
          *((void *)v43 - 1) = v44;
          *(void *)uint64_t v43 = v45;
          if (v44 != 0x7FFFFFFFFFFFFFFFLL) {
            *((void *)v43 - 1) = v44 + v61;
          }
          ++v26;
          v32 += 2;
          v29 += 16;
          v30 += 16;
          v31 += 16;
        }
        while (v59 != v26);
        uint64_t v10 = v50;
        uint64_t v9 = v51;
        CFRange v46 = v56;
        uint64_t v47 = v53;
        uint64_t v15 = v54;
        uint64_t v16 = v49;
      }
      else
      {
        uint64_t v10 = v50;
        uint64_t v9 = v51;
        CFRange v46 = v56;
        uint64_t v47 = v53;
      }
    }
    else
    {
      CFRange v46 = 0;
      unint64_t v55 = 0;
      uint64_t v47 = 0;
      uint64_t v16 = 0;
      uint64_t v15 = 0;
    }
    uint64_t v57 = v46;
    if (v60) {
      uint64_t v48 = [NSString stringWithFormat:@"%@ %@", v10, v52];
    }
    else {
      uint64_t v48 = [v10 stringByAppendingString:v52];
    }
    unint64_t v13 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:originalCheckedLength:numberOfModifications:modificationTypes:originalModificationRanges:finalModificationRanges:originalSyllableRanges:originalAdditionalSyllableRanges:]([PRPinyinString alloc], "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:originalCheckedLength:numberOfModifications:modificationTypes:originalModificationRanges:finalModificationRanges:originalSyllableRanges:originalAdditionalSyllableRanges:", v48, [a4 syllableCount] + objc_msgSend(a3, "syllableCount"), objc_msgSend(a4, "lastSyllableIsPartial"), objc_msgSend(a4, "score") + objc_msgSend(a3, "score"), objc_msgSend(a4, "originalLength") + objc_msgSend(a3, "originalLength"), objc_msgSend(a4, "originalCheckedLength") + objc_msgSend(a3, "originalCheckedLength"), v9, v15, v16, v47, v55, v57);
    if (v15) {
      free(v15);
    }
    if (v16) {
      free(v16);
    }
    if (v47) {
      free(v47);
    }
    if (v55) {
      free(v55);
    }
    if (v57) {
      free(v57);
    }
  }
  return v13;
}

- (id)_retainedAlternativesByCombiningAlternatives:(id)a3 withAlternatives:(id)a4 andAddingAlternatives:(id)a5
{
  id v30 = a5;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obunint64_t j = a3;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v40 + 1) + 8 * v12);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v36, v45, 16, v30);
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v37;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v37 != v16) {
                objc_enumerationMutation(a4);
              }
              id v18 = [(AppleSpell *)self _pinyinStringByCombiningPinyinString:v13 withPinyinString:*(void *)(*((void *)&v36 + 1) + 8 * v17)];
              if (v18) {
                [v8 addObject:v18];
              }
              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [a4 countByEnumeratingWithState:&v36 objects:v45 count:16];
          }
          while (v15);
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v10);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  BOOL v19 = v30;
  uint64_t v20 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v32, v44, 16, v30);
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        [v8 addObject:*(void *)(*((void *)&v32 + 1) + 8 * v23++)];
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v21);
  }
  [v8 sortWithOptions:16 usingComparator:&__block_literal_global_164];
  uint64_t v24 = [v8 count];
  if (v24)
  {
    uint64_t v25 = v24;
    unint64_t v26 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "syllableCount");
    uint64_t v27 = v25 - 1;
    do
    {
      unint64_t v28 = (void *)[v8 objectAtIndex:v27];
      if ([v28 syllableCount] > v26) {
        goto LABEL_29;
      }
      if (!v27) {
        return v8;
      }
      if (objc_msgSend(v28, "isEqual:", objc_msgSend(v8, "objectAtIndex:", v27 - 1))) {
LABEL_29:
      }
        [v8 removeObjectAtIndex:v27];
      --v27;
    }
    while (v27 != -1);
  }
  return v8;
}

uint64_t __107__AppleSpell_Chinese___retainedAlternativesByCombiningAlternatives_withAlternatives_andAddingAlternatives___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = [a2 syllableCount];
  unint64_t v6 = [a3 syllableCount];
  unint64_t v7 = [a2 score];
  unint64_t v8 = [a3 score];
  uint64_t v9 = -1;
  if (v5 < v6) {
    uint64_t v10 = -1;
  }
  else {
    uint64_t v10 = 1;
  }
  if (v7 >= v8) {
    uint64_t v9 = 1;
  }
  if (v7 == v8) {
    uint64_t v9 = 0;
  }
  if (v5 == v6) {
    return v9;
  }
  else {
    return v10;
  }
}

- (id)_recursiveRetainedAlternativesForPinyinInputString:(id)a3 depth:(unint64_t)a4
{
  unint64_t v6 = self;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = -[AppleSpell _primitiveRetainedAlternativesForPinyinInputString:](self, "_primitiveRetainedAlternativesForPinyinInputString:");
  unint64_t v8 = [a3 length];
  if ([v7 count] || a4 + 1 > 2) {
    return v7;
  }
  unint64_t v31 = a4 + 1;
  uint64_t v9 = [(AppleSpell *)v6 _getSplitIndexes:v40 maxCount:3 forPinyinInputString:a3];
  unint64_t v10 = 0;
  id v32 = 0;
LABEL_4:
  unint64_t v34 = v10;
  if (a4) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10 >= 2;
  }
  char v12 = !v11;
  uint64_t v13 = v9;
  while (1)
  {
    if (![v7 count])
    {
      if (!v13) {
        break;
      }
      goto LABEL_18;
    }
    char v14 = v13 ? v12 : 0;
    if ((v14 & 1) == 0) {
      break;
    }
LABEL_18:
    uint64_t v9 = v13 - 1;
    unint64_t v15 = *(void *)&v39[8 * v13 + 120];
    if (v15) {
      BOOL v16 = v8 > v15;
    }
    else {
      BOOL v16 = 0;
    }
    --v13;
    if (v16)
    {
      long long v33 = v6;
      id v17 = -[AppleSpell _primitiveRetainedAlternativesForPinyinInputString:](v6, "_primitiveRetainedAlternativesForPinyinInputString:", [a3 substringToIndex:v15]);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        unint64_t v30 = a4;
        uint64_t v20 = *(void *)v36;
LABEL_25:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v17);
          }
          if (![*(id *)(*((void *)&v35 + 1) + 8 * v21) lastSyllableIsPartial]) {
            break;
          }
          if (v19 == ++v21)
          {
            uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v39 count:16];
            if (v19) {
              goto LABEL_25;
            }
            goto LABEL_38;
          }
        }
        if (![v17 count])
        {
LABEL_38:
          a4 = v30;
          goto LABEL_39;
        }
        id v22 = -[AppleSpell _recursiveRetainedAlternativesForPinyinInputString:depth:](v33, "_recursiveRetainedAlternativesForPinyinInputString:depth:", [a3 substringFromIndex:v15], v31);
        a4 = v30;
        if ([v22 count])
        {
          uint64_t v23 = [(AppleSpell *)v33 _retainedAlternativesByCombiningAlternatives:v17 withAlternatives:v22 andAddingAlternatives:v7];

          id v7 = (id)v23;
        }

        unint64_t v24 = v34;
        if (![v7 count] && !objc_msgSend(v32, "count"))
        {
          uint64_t v25 = -[PRPinyinString initWithUncheckedString:score:originalLength:]([PRPinyinString alloc], "initWithUncheckedString:score:originalLength:", [a3 substringFromIndex:v15], 255, v8 - v15);
          uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObject:v25];

          uint64_t v27 = v26;
          a4 = v30;
          id v32 = [(AppleSpell *)v33 _retainedAlternativesByCombiningAlternatives:v17 withAlternatives:v27 andAddingAlternatives:0];
        }
      }
      else
      {
LABEL_39:
        unint64_t v24 = v34;
      }

      unint64_t v10 = v24 + 1;
      unint64_t v6 = v33;
      goto LABEL_4;
    }
  }
  unint64_t v28 = v32;
  if (!v32) {
    return v7;
  }
  if ([v7 count])
  {

    return v7;
  }

  return v28;
}

- (id)spellServer:(id)a3 _retainedAlternativesForPinyinInputString:(id)a4 extended:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v33 = objc_alloc_init(MEMORY[0x263F086B0]);
  id v8 = [(AppleSpell *)self _recursiveRetainedAlternativesForPinyinInputString:a4 depth:0];
  uint64_t v9 = v8;
  if (v5 && [v8 count])
  {
    id v36 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    obunint64_t j = v9;
    uint64_t v37 = [v9 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v37)
    {
      uint64_t v35 = *(void *)v43;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v41 = v10;
          BOOL v11 = *(void **)(*((void *)&v42 + 1) + 8 * v10);
          uint64_t v12 = [v11 numberOfNonPinyinRanges];
          if (v12)
          {
            uint64_t v13 = v12;
            long long v39 = (void *)MEMORY[0x263EFF980];
            uint64_t v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfReplacements"));
            uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfTranspositions"));
            uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfInsertions"));
            uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfDeletions"));
            uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "syllableCount"));
            uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "lastSyllableIsPartial"));
            uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "score"));
            uint64_t v20 = objc_msgSend(v39, "arrayWithObjects:", v11, v38, v14, v15, v16, v17, v18, v19, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfFirstModification")), 0);
            for (uint64_t i = 0; i != v13; ++i)
            {
              uint64_t v22 = [v11 nonPinyinRangeAtIndex:i];
              uint64_t v24 = v23;
              objc_msgSend(v20, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v22));
              objc_msgSend(v20, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v24));
            }
          }
          else
          {
            long long v40 = (void *)MEMORY[0x263EFF8C0];
            uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfReplacements"));
            uint64_t v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfTranspositions"));
            uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfInsertions"));
            uint64_t v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "numberOfDeletions"));
            uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "syllableCount"));
            uint64_t v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v11, "lastSyllableIsPartial"));
            uint64_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "score"));
            uint64_t v20 = objc_msgSend(v40, "arrayWithObjects:", v11, v25, v26, v27, v28, v29, v30, v31, objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfFirstModification")), 0);
          }
          [v36 addObject:v20];
          uint64_t v10 = v41 + 1;
        }
        while (v41 + 1 != v37);
        uint64_t v37 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v37);
    }
  }
  else
  {
    id v36 = v9;
  }

  return v36;
}

- (id)spellServer:(id)a3 alternativesForPinyinInputString:(id)a4
{
  id v4 = [(AppleSpell *)self spellServer:a3 _retainedAlternativesForPinyinInputString:a4 extended:0];
  return v4;
}

- (id)spellServer:(id)a3 extendedAlternativesForPinyinInputString:(id)a4
{
  id v4 = [(AppleSpell *)self spellServer:a3 _retainedAlternativesForPinyinInputString:a4 extended:1];
  return v4;
}

- (id)spellServer:(id)a3 _retainedPrefixesForPinyinInputString:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v26 = objc_alloc_init(MEMORY[0x263F086B0]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (spellServer__retainedPrefixesForPinyinInputString___cachedStringWithoutPrefixes
    && objc_msgSend(a4, "hasPrefix:"))
  {
    unint64_t v7 = [(id)spellServer__retainedPrefixesForPinyinInputString___cachedStringWithoutPrefixes length] + 1;
  }
  else
  {
    unint64_t v7 = 1;
  }
  uint64_t v27 = 0;
  CFIndex usedBufLen = 0;
  CFIndex v8 = [a4 length];
  uint64_t v9 = [(AppleSpell *)self databaseConnectionForLanguageObject:+[PRLanguage languageObjectWithIdentifier:@"en_CN"]];
  if (v8)
  {
    uint64_t v10 = v9;
    v34.NSUInteger location = 0;
    v34.NSUInteger length = v8;
    if (v8 == CFStringGetBytes((CFStringRef)a4, v34, 0x500u, 0, 0, &buffer, 254, &usedBufLen))
    {
      unint64_t v11 = usedBufLen;
      *(&buffer + usedBufLen) = 0;
      unint64_t v12 = 14;
      while (1)
      {
        while (v12 > v11)
        {
          if (--v12 <= 2) {
            goto LABEL_23;
          }
        }
        id v13 = [(AppleSpell *)self englishStringFromWordBuffer:&buffer length:v12 connection:v10];
        if (v13)
        {
          uint64_t v14 = v13;
          if (![v6 count]
            || usedBufLen == v12
            || findPinyin(&buffer + v12, usedBufLen - v12, 0, 1, 0, 0, 0, 0, &v27, 0, 0, 0, 0, 0, 0, 0, 0, 0)&& usedBufLen - v27 == v12)
          {
            uint64_t v15 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:]([PRPinyinString alloc], "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", v14, 0, 0, 128, v12, 5, 0, v12, 0, [v14 length], 0, v12);
            if (([v6 containsObject:v15] & 1) == 0) {
              [v6 addObject:v15];
            }
          }
        }
        if (v12 <= v7) {
          break;
        }
        if (--v12 < 3) {
          break;
        }
        unint64_t v11 = usedBufLen;
      }
LABEL_23:
      if (![v6 count])
      {

        spellServer__retainedPrefixesForPinyinInputString___cachedStringWithoutPrefixes = [a4 copy];
      }
      if ((unint64_t)usedBufLen >= 2)
      {
        unint64_t v16 = 0;
        do
        {
          if (additionalTwoLetterWords[v16] == buffer
            && additionalTwoLetterWords[v16 + 1] == v30
            && (usedBufLen == 2
             || findPinyin(&v31, usedBufLen - 2, 0, 1, 0, 0, 0, 0, &v27, 0, 0, 0, 0, 0, 0, 0, 0, 0)&& v27 + 2 == usedBufLen))
          {
            uint64_t v17 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:]([PRPinyinString alloc], "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", (id)[[NSString alloc] initWithBytes:&buffer length:2 encoding:12], 0, 0, 128, 2, 5, 0, 2, 0, 2, 0,
                    2);
            if (([v6 containsObject:v17] & 1) == 0) {
              [v6 addObject:v17];
            }
          }
          BOOL v18 = v16 >= 0x2E;
          v16 += 2;
        }
        while (!v18);
        if ((unint64_t)usedBufLen >= 2)
        {
          unint64_t v19 = 0;
          do
          {
            if (additionalTwoLetterAcronyms[v19] == buffer
              && additionalTwoLetterAcronyms[v19 + 1] == v30
              && (usedBufLen == 2
               || findPinyin(&v31, usedBufLen - 2, 0, 1, 0, 0, 0, 0, &v27, 0, 0, 0, 0, 0, 0, 0, 0, 0)&& v27 + 2 == usedBufLen))
            {
              uint64_t v20 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:]([PRPinyinString alloc], "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", objc_msgSend((id)objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", &buffer, 2, 12), "uppercaseString"), 0, 0, 128, 2, 5, 0, 2, 0,
                      2,
                      0,
                      2);
              if (([v6 containsObject:v20] & 1) == 0) {
                [v6 addObject:v20];
              }
            }
            BOOL v18 = v19 >= 8;
            v19 += 2;
          }
          while (!v18);
          if ((unint64_t)usedBufLen >= 3)
          {
            unint64_t v21 = 0;
            do
            {
              if (additionalThreeLetterWords[v21] == buffer
                && additionalThreeLetterWords[v21 + 1] == v30
                && additionalThreeLetterWords[v21 + 2] == v31
                && (usedBufLen == 3
                 || findPinyin(v32, usedBufLen - 3, 0, 1, 0, 0, 0, 0, &v27, 0, 0, 0, 0, 0, 0, 0, 0, 0)&& v27 + 3 == usedBufLen))
              {
                uint64_t v22 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:]([PRPinyinString alloc], "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", (id)[[NSString alloc] initWithBytes:&buffer length:3 encoding:12], 0, 0, 128, 3, 5, 0, 3, 0, 3, 0,
                        3);
                if (([v6 containsObject:v22] & 1) == 0) {
                  [v6 addObject:v22];
                }
              }
              BOOL v18 = v21 >= 0x12F;
              v21 += 3;
            }
            while (!v18);
            if ((unint64_t)usedBufLen >= 3)
            {
              unint64_t v23 = 0;
              do
              {
                if (additionalThreeLetterAcronyms[v23] == buffer
                  && additionalThreeLetterAcronyms[v23 + 1] == v30
                  && additionalThreeLetterAcronyms[v23 + 2] == v31
                  && (usedBufLen == 3
                   || findPinyin(v32, usedBufLen - 3, 0, 1, 0, 0, 0, 0, &v27, 0, 0, 0, 0, 0, 0, 0, 0, 0)&& v27 + 3 == usedBufLen))
                {
                  uint64_t v24 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:]([PRPinyinString alloc], "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:originalSyllableRange:", objc_msgSend((id)objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", &buffer, 3, 12), "uppercaseString"), 0, 0, 128, 3, 5, 0, 3, 0,
                          3,
                          0,
                          3);
                  if (([v6 containsObject:v24] & 1) == 0) {
                    [v6 addObject:v24];
                  }
                }
                BOOL v18 = v23 >= 0xC;
                v23 += 3;
              }
              while (!v18);
            }
          }
        }
      }
    }
  }

  return v6;
}

- (id)spellServer:(id)a3 prefixesForPinyinInputString:(id)a4
{
  id v4 = [(AppleSpell *)self spellServer:a3 _retainedPrefixesForPinyinInputString:a4];
  return v4;
}

- (id)spellServer:(id)a3 _retainedCorrectionsForPinyinInputString:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v18 = objc_alloc_init(MEMORY[0x263F086B0]);
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v24 = 0;
  CFIndex usedBufLen = 0;
  uint64_t v22 = 0;
  unint64_t v23 = 0;
  uint64_t v21 = 0;
  unsigned __int8 v20 = 0;
  CFIndex v5 = [a4 length];
  if (v5)
  {
    v29.NSUInteger location = 0;
    v29.NSUInteger length = v5;
    if (v5 == CFStringGetBytes((CFStringRef)a4, v29, 0x500u, 0, 0, buffer, 254, &usedBufLen))
    {
      unint64_t v6 = usedBufLen;
      buffer[usedBufLen] = 0;
      size_t v7 = v6 + 1 > 1 ? v6 + 1 : 1;
      memcpy(__dst, buffer, v7);
      if (v6)
      {
        for (unint64_t i = 0; i < v6; ++i)
        {
          int v9 = buffer[i];
          if ((v9 - 65) < 0x1A) {
            break;
          }
          if ((v9 - 97) <= 0x19)
          {
            uint64_t v10 = 0;
            unint64_t v11 = &adjacentMatchesChinese[6 * (v9 - 97)];
            do
            {
              int v12 = v11[v10];
              if ((_BYTE)v12)
              {
                __dst[i] = v12;
                if (findPinyin(__dst, usedBufLen, 0, 0, 0, 0, 0, &v23, &v24, 0, &v22, &v20, &v21, 0, 0, 0, 0, 0))
                {
                  if (v24 == usedBufLen && (!v20 || i < v23))
                  {
                    id v13 = [NSString alloc];
                    uint64_t v14 = (void *)[v13 initWithBytes:__dst length:usedBufLen encoding:12];
                    uint64_t v15 = [PRPinyinString alloc];
                    unint64_t v16 = -[PRPinyinString initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:](v15, "initWithString:syllableCount:lastSyllableIsPartial:score:originalLength:modificationType:originalModificationRange:finalModificationRange:", v14, v22, v20, v21, usedBufLen, 1, i, 1, i, 1);
                    if (([v19 containsObject:v16] & 1) == 0) {
                      [v19 addObject:v16];
                    }
                  }
                }
              }
              ++v10;
            }
            while (v10 != 6);
            LOBYTE(v9) = buffer[i];
            unint64_t v6 = usedBufLen;
          }
          __dst[i] = v9;
        }
      }
    }
  }

  return v19;
}

- (id)spellServer:(id)a3 correctionsForPinyinInputString:(id)a4
{
  id v4 = [(AppleSpell *)self spellServer:a3 _retainedCorrectionsForPinyinInputString:a4];
  return v4;
}

- (id)spellServer:(id)a3 _retainedModificationsForPinyinInputString:(id)a4 geometryModelData:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v22 = objc_alloc_init(MEMORY[0x263F086B0]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obunint64_t j = [(AppleSpell *)self _recursiveRetainedAlternativesForPinyinInputString:a4 depth:0];
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v7;
        CFIndex v8 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
        uint64_t v27 = [v8 numberOfModifications];
        if (v27)
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            uint64_t v30 = [v8 typeOfModificationAtIndex:i];
            uint64_t v29 = [v8 originalRangeForModificationAtIndex:i];
            uint64_t v11 = v10;
            uint64_t v12 = [v8 finalRangeForModificationAtIndex:i];
            uint64_t v14 = v13;
            uint64_t v15 = [v8 originalSyllableRangeForModificationAtIndex:i];
            uint64_t v17 = v16;
            uint64_t v18 = [v8 originalAdditionalSyllableRangeForModificationAtIndex:i];
            unsigned __int8 v20 = -[PRPinyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:]([PRPinyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:", v29, v11, objc_msgSend(v8, "substringWithRange:", v12, v14), v30, v15, v17, 0.0, v18, v19);
            if (([v28 containsObject:v20] & 1) == 0) {
              [v28 addObject:v20];
            }
          }
        }
        uint64_t v7 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v25);
  }

  return v28;
}

- (id)spellServer:(id)a3 _retainedFinalModificationsForPinyinInputString:(id)a4 geometryModelData:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v9 = [a4 length];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v11 = [(AppleSpell *)self spellServer:a3 _retainedModificationsForPinyinInputString:a4 geometryModelData:a5];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v17 = [v16 syllableRange];
        if (v17 + v18 == v9) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  return v10;
}

- (id)spellServer:(id)a3 modificationsForPinyinInputString:(id)a4
{
  id v4 = [(AppleSpell *)self spellServer:a3 _retainedModificationsForPinyinInputString:a4 geometryModelData:0];
  return v4;
}

- (id)spellServer:(id)a3 modificationsForPinyinInputString:(id)a4 geometryModelData:(id)a5
{
  id v5 = [(AppleSpell *)self spellServer:a3 _retainedModificationsForPinyinInputString:a4 geometryModelData:a5];
  return v5;
}

- (id)spellServer:(id)a3 finalModificationsForPinyinInputString:(id)a4
{
  id v4 = [(AppleSpell *)self spellServer:a3 _retainedFinalModificationsForPinyinInputString:a4 geometryModelData:0];
  return v4;
}

- (BOOL)inputStringIsPinyin:(id)a3 allowPartialLastSyllable:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0;
  char v12 = 0;
  uint64_t v6 = [a3 length];
  if (v6)
  {
    uint64_t v7 = v6;
    CFIndex usedBufLen = 0;
    v17.NSUInteger location = 0;
    v17.NSUInteger length = v6;
    CFIndex Bytes = CFStringGetBytes((CFStringRef)a3, v17, 0x500u, 0, 0, buffer, 254, &usedBufLen);
    LOBYTE(v6) = 0;
    if (v7 == Bytes)
    {
      CFIndex v9 = usedBufLen;
      buffer[usedBufLen] = 0;
      Pinyiuint64_t n = findPinyin(buffer, v9, 0, 1, 0, 0, 0, 0, &v13, 0, 0, &v12, 0, 0, 0, 0, 0, 0);
      LOBYTE(v6) = 0;
      if (Pinyin)
      {
        if (v13 == usedBufLen)
        {
          if (v12) {
            LOBYTE(v6) = a4;
          }
          else {
            LOBYTE(v6) = 1;
          }
        }
        else
        {
          LOBYTE(v6) = 0;
        }
      }
    }
  }
  return v6;
}

- (BOOL)inputStringIsFullOrAbbreviatedPinyin:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 length];
  if (v4)
  {
    uint64_t v5 = v4;
    CFIndex usedBufLen = 0;
    v12.NSUInteger location = 0;
    v12.NSUInteger length = v4;
    CFIndex Bytes = CFStringGetBytes((CFStringRef)a3, v12, 0x500u, 0, 0, buffer, 254, &usedBufLen);
    LOBYTE(v4) = 0;
    if (v5 == Bytes)
    {
      CFIndex v7 = usedBufLen;
      buffer[usedBufLen] = 0;
      LOBYTE(v4) = isFullOrAbbreviatedPinyin((uint64_t)buffer, v7, 0, 0);
    }
  }
  return v4;
}

- (void)_addContextAlternativesForPinyinInputString:(id)a3 modifications:(id)a4 afterIndex:(unint64_t)a5 delta:(int64_t)a6 toArray:(id)a7
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v39 = [a4 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v39)
  {
    uint64_t v9 = *(void *)v49;
    uint64_t v34 = *(void *)v49;
    int64_t v35 = a6;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(a4);
        }
        uint64_t v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        unint64_t v12 = [v11 range];
        uint64_t v41 = v13;
        unint64_t v14 = [v11 syllableRange];
        uint64_t v42 = v15;
        if (v12 >= a5 && v14 >= a5)
        {
          unint64_t v17 = v14;
          uint64_t v40 = i;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          uint64_t v18 = [a4 countByEnumeratingWithState:&v44 objects:v52 count:16];
          if (!v18)
          {
            char v22 = 1;
LABEL_27:
            id v28 = (void *)[a3 mutableCopy];
            if ([v11 modificationType] == 5) {
              uint64_t v29 = (void *)[NSString stringWithFormat:@"[%@]", objc_msgSend(v11, "replacementString")];
            }
            else {
              uint64_t v29 = (void *)[v11 replacementString];
            }
            uint64_t v30 = v29;
            uint64_t v31 = [v29 length];
            objc_msgSend(v28, "replaceCharactersInRange:withString:", v12 + a6, v41, v30);
            if (v22)
            {
              if (([a7 containsObject:v28] & 1) == 0) {
                [a7 addObject:v28];
              }
            }
            else
            {
              [(AppleSpell *)self _addContextAlternativesForPinyinInputString:v28 modifications:a4 afterIndex:v17 + v42 delta:a6 - v41 + v31 toArray:a7];
            }

            [v11 modificationScore];
            uint64_t i = v40;
            if (v32 < 1.0)
            {
              if (v22)
              {
                if (([a7 containsObject:a3] & 1) == 0) {
                  [a7 addObject:a3];
                }
              }
              else
              {
                [(AppleSpell *)self _addContextAlternativesForPinyinInputString:a3 modifications:a4 afterIndex:v17 + v42 delta:a6 toArray:a7];
              }
            }
            continue;
          }
          uint64_t v19 = v18;
          unint64_t v37 = v12;
          uint64_t v20 = *(void *)v45;
          char v21 = 1;
          char v22 = 1;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v45 != v20) {
                objc_enumerationMutation(a4);
              }
              uint64_t v24 = *(void **)(*((void *)&v44 + 1) + 8 * j);
              unint64_t v25 = [v24 syllableRange];
              if (v24 != v11 && v25 >= a5)
              {
                v21 &= v25 + v26 > v17;
                v22 &= v17 + v42 > v25;
              }
            }
            uint64_t v19 = [a4 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v19);
          uint64_t v9 = v34;
          a6 = v35;
          uint64_t i = v40;
          unint64_t v12 = v37;
          if (v21) {
            goto LABEL_27;
          }
        }
      }
      uint64_t v39 = [a4 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v39);
  }
}

- (id)contextAlternativeAnnotatedStringsForPinyinInputString:(id)a3
{
  uint64_t v5 = objc_alloc_init(PRPinyinContext);
  uint64_t v6 = [a3 length];
  CFIndex v7 = (void *)[MEMORY[0x263EFF980] array];
  double Current = CFAbsoluteTimeGetCurrent();
  if (v6)
  {
    for (uint64_t i = 0;
          i != v6;
          -[AppleSpell spellServer:alternativesForPinyinInputString:](self, "spellServer:alternativesForPinyinInputString:", 0, [a3 substringToIndex:i]))
    {
      ++i;
    }
  }
  *(double *)&contextAlternativeAnnotatedStringsForPinyinInputString__oldTimeTotal = *(double *)&contextAlternativeAnnotatedStringsForPinyinInputString__oldTimeTotal
                                                                                   + CFAbsoluteTimeGetCurrent()
                                                                                   - Current;
  double v10 = CFAbsoluteTimeGetCurrent();
  if (v6)
  {
    for (uint64_t j = 0; j != v6; ++j)
      -[PRPinyinContext addInputCharacter:geometryModel:geometryData:](v5, "addInputCharacter:geometryModel:geometryData:", [a3 characterAtIndex:j], 0, 0);
  }
  *(double *)&contextAlternativeAnnotatedStringsForPinyinInputString__newTimeTotal = *(double *)&contextAlternativeAnnotatedStringsForPinyinInputString__newTimeTotal
                                                                                   + CFAbsoluteTimeGetCurrent()
                                                                                   - v10;
  [(AppleSpell *)self _addContextAlternativesForPinyinInputString:a3 modifications:[(PRPinyinContext *)v5 currentModifications] afterIndex:0 delta:0 toArray:v7];

  return v7;
}

- (id)contextAlternativeAnnotatedStringsForJyutpingInputString:(id)a3
{
  uint64_t v5 = objc_alloc_init(PRJyutpingContext);
  uint64_t v6 = [a3 length];
  CFIndex v7 = (void *)[MEMORY[0x263EFF980] array];
  double Current = CFAbsoluteTimeGetCurrent();
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
      -[PRPinyinContext addInputCharacter:geometryModel:geometryData:](v5, "addInputCharacter:geometryModel:geometryData:", [a3 characterAtIndex:i], 0, 0);
  }
  *(double *)&contextAlternativeAnnotatedStringsForJyutpingInputString__timeTotal = *(double *)&contextAlternativeAnnotatedStringsForJyutpingInputString__timeTotal
                                                                                  + CFAbsoluteTimeGetCurrent()
                                                                                  - Current;
  [(AppleSpell *)self _addContextAlternativesForPinyinInputString:a3 modifications:[(PRPinyinContext *)v5 currentModifications] afterIndex:0 delta:0 toArray:v7];

  return v7;
}

- (id)internalStringForKoreanExternalString:(id)a3
{
  if (!_nonPunctuationCharacterSet) {
    _nonPunctuationCharacterSet = (uint64_t)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "punctuationCharacterSet"), "invertedSet");
  }
  objc_msgSend(a3, "rangeOfCharacterFromSet:");
  if (!v4) {
    return a3;
  }
  MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)a3);
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormD);
  uint64_t v6 = (void *)ConvertStringToHangulCompatibilityJamo(MutableCopy);
  CFRelease(MutableCopy);
  return v6;
}

- (id)externalStringForKoreanInternalString:(id)a3
{
  if (!_nonPunctuationCharacterSet) {
    _nonPunctuationCharacterSet = (uint64_t)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08708], "punctuationCharacterSet"), "invertedSet");
  }
  objc_msgSend(a3, "rangeOfCharacterFromSet:");
  id result = a3;
  if (v5)
  {
    CFStringRef v6 = (const __CFString *)ConvertStringFromHangulCompatibilityJamo(a3);
    MutableCopy = CFStringCreateMutableCopy(0, 0, v6);
    CFStringNormalize(MutableCopy, kCFStringNormalizationFormC);
    return MutableCopy;
  }
  return result;
}

- (void)addGuessesForKoreanWord:(id)a3 includeAdditionalGuesses:(BOOL)a4 toGuesses:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v26 = 0;
  CFIndex usedBufLen = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  id v7 = +[PRLanguage languageObjectWithIdentifier:@"ko", a4];
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)a3);
  CFStringNormalize(MutableCopy, kCFStringNormalizationFormD);
  unint64_t Length = CFStringGetLength(MutableCopy);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __81__AppleSpell_Korean__addGuessesForKoreanWord_includeAdditionalGuesses_toGuesses___block_invoke;
  v22[3] = &unk_2640F9630;
  v22[4] = &v23;
  -[__CFString enumerateSubstringsInRange:options:usingBlock:](MutableCopy, "enumerateSubstringsInRange:options:usingBlock:", 0, Length, 2, v22);
  [(id)ConvertStringToHangulCompatibilityJamo(MutableCopy) length];
  if ((unint64_t)(v24[3] - 2) <= 0x11 && Length >= 3)
  {
    for (CFIndex i = 0; i != Length; ++i)
    {
      unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(MutableCopy, i);
      if (CharacterAtIndex >> 8 == 17)
      {
        if (CharacterAtIndex == 4527)
        {
          uint64_t v12 = 13;
          uint64_t v13 = (const UniChar *)&LJongMatches;
          goto LABEL_20;
        }
        if (CharacterAtIndex >> 3 < 0x235)
        {
          if (CharacterAtIndex < 0x1161)
          {
            unsigned int v14 = CharacterAtIndex - 4352;
            if (CharacterAtIndex - 4352 <= 0x12)
            {
              uint64_t v15 = (char *)&ChoMatches;
LABEL_18:
              uint64_t v13 = (const UniChar *)&v15[12 * v14];
LABEL_19:
              uint64_t v12 = 6;
              do
              {
LABEL_20:
                if (*v13)
                {
                  CFStringRef v16 = CFStringCreateWithCharacters(0, v13, 1);
                  unint64_t v17 = CFStringCreateMutableCopy(0, 0, MutableCopy);
                  v30.NSUInteger location = i;
                  v30.NSUInteger length = 1;
                  CFStringReplace(v17, v30, v16);
                  uint64_t v18 = (__CFString *)ConvertStringToHangulCompatibilityJamo(v17);
                  CFIndex v19 = [(__CFString *)v18 length];
                  v31.NSUInteger location = 0;
                  v31.NSUInteger length = v19;
                  if (v19 == CFStringGetBytes(v18, v31, 0x8000100u, 0x5Fu, 0, buffer, 72, &usedBufLen)
                    && ([(AppleSpell *)self checkWordBuffer:buffer length:usedBufLen languageObject:v7 index:5]|| [(AppleSpell *)self validateWord:v18 inLexiconForLanguageObject:v7]))
                  {
                    CFStringNormalize(v17, kCFStringNormalizationFormC);
                    [a5 addCandidateWithString:v17 errorType:8];
                  }
                  CFRelease(v17);
                  CFRelease(v16);
                }
                ++v13;
                --v12;
              }
              while (v12);
            }
          }
          else
          {
            unsigned int v14 = CharacterAtIndex - 4449;
            if (CharacterAtIndex - 4449 <= 0x14)
            {
              uint64_t v15 = (char *)&JungMatches;
              goto LABEL_18;
            }
          }
        }
        else if (CharacterAtIndex - 4520 <= 0x1A)
        {
          uint64_t v13 = (const UniChar *)((char *)&JongMatches + 12 * CharacterAtIndex - 54240);
          goto LABEL_19;
        }
      }
    }
  }
  CFRelease(MutableCopy);
  _Block_object_dispose(&v23, 8);
}

uint64_t __81__AppleSpell_Korean__addGuessesForKoreanWord_includeAdditionalGuesses_toGuesses___block_invoke(uint64_t result)
{
  return result;
}

- (id)_correctionResultForKoreanString:(id)a3 range:(_NSRange)a4 inString:(id)a5 offset:(unint64_t)a6 tagger:(id)a7 appIdentifier:(id)a8 dictionary:(id)a9 keyEventArray:(id)a10
{
  return 0;
}

- (id)spellServer:(id)a3 suggestGuessesForKoreanWordRange:(_NSRange)a4 inString:(id)a5 options:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v56 = *MEMORY[0x263EF8340];
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "array", a3);
  id v42 = objc_alloc_init(MEMORY[0x263F086B0]);
  uint64_t v12 = objc_msgSend(a5, "substringWithRange:", location, length);
  uint64_t v13 = _appIdentifierFromOptions(a6);
  id v14 = +[PRLanguage languageObjectWithIdentifier:@"ko"];
  id v15 = -[AppleSpell taggerForLanguageObject:string:range:](self, "taggerForLanguageObject:string:range:", v14, a5, 0, [a5 length]);
  CFStringRef v16 = -[PRCandidateList initWithMaxCount:defaultReplacementRange:customErrorModel:capitalizationDictionaryArray:]([PRCandidateList alloc], "initWithMaxCount:defaultReplacementRange:customErrorModel:capitalizationDictionaryArray:", 32, location, length, [a6 objectForKey:PRErrorModelKey], 0);
  uint64_t v17 = objc_msgSend(-[AppleSpell autocorrectionDictionaryForLanguageObject:](self, "autocorrectionDictionaryForLanguageObject:", v14), "objectForKey:", v12);
  CFIndex usedBufLen = 0;
  uint64_t v18 = [a6 objectForKey:@"ParameterBundles"];
  uint64_t v41 = v12;
  [(AppleSpell *)self addGuessesForKoreanWord:v12 includeAdditionalGuesses:1 toGuesses:v16];
  id v43 = v15;
  if (v15)
  {
    id v19 = [(AppleSpell *)self _rankedCandidatesForCandidateList:v16 languageObject:v14 tagger:v15 appIdentifier:v13 parameterBundles:v18];
    if (v19)
    {
      uint64_t v20 = v19;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v21 = [v19 countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v49 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            if (([v25 isBlocklisted] & 1) == 0)
            {
              uint64_t v26 = [v25 string];
              if (([v11 containsObject:v26] & 1) == 0) {
                [v11 addObject:v26];
              }
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v54 count:16];
        }
        while (v22);
      }
    }
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v27 = [(PRCandidateList *)v16 candidates];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v45 != v30) {
          objc_enumerationMutation(v27);
        }
        double v32 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        if (([v32 isBlocklisted] & 1) == 0)
        {
          uint64_t v33 = [v32 string];
          if (([v11 containsObject:v33] & 1) == 0) {
            [v11 addObject:v33];
          }
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v29);
  }
  [v11 removeObject:v41];
  uint64_t v34 = [v11 count];
  if (v34)
  {
    uint64_t v35 = v34 - 1;
    do
    {
      uint64_t v36 = (void *)[v11 objectAtIndex:v35];
      unint64_t v37 = v36;
      if (!v17 || ([v36 isEqualToString:v17] & 1) == 0)
      {
        uint64_t v38 = [(AppleSpell *)self internalStringForKoreanExternalString:v37];
        CFIndex v39 = [(__CFString *)v38 length];
        v57.NSUInteger location = 0;
        v57.NSUInteger length = v39;
        if (v39 == CFStringGetBytes(v38, v57, 0x8000100u, 0, 0, buffer, 254, &usedBufLen)
          && ![(AppleSpell *)self checkWordBuffer:buffer length:usedBufLen languageObject:v14 index:1]&& [(AppleSpell *)self acceptabilityOfWordBuffer:buffer length:usedBufLen languageObject:v14 forPrediction:0 alreadyCapitalized:0] != 2)
        {
          [v11 removeObjectAtIndex:v35];
        }
      }
      --v35;
    }
    while (v35 != -1);
  }
  [(AppleSpell *)self resetTimer];
  [(AppleSpell *)self invalidateTagger:v43];

  return v11;
}

@end