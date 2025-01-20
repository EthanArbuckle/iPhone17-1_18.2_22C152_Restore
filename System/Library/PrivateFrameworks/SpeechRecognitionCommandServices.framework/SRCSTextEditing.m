@interface SRCSTextEditing
+ (id)wordsFromString:(id)a3;
+ (int64_t)doesArrayOfWords:(id)a3 containArrayOfArrayWords:(id)a4;
- (BOOL)_range:(_NSRange)a3 includesRange:(_NSRange)a4;
- (SRCSTextEditing)init;
- (SRCSTextEditingProviderProtocol)provider;
- (_NSRange)_findRangeForEnumerationType:(int64_t)a3 atRelativeIncrement:(int64_t)a4 fromPosition:(id)a5 options:(unint64_t)a6;
- (_NSRange)_rangeOfWordBasedSearchString:(id)a3 inString:(id)a4 withRange:(_NSRange)a5 forwardSearchDirection:(BOOL)a6;
- (_NSRange)rangeOfStrings:(id)a3 referenceRange:(_NSRange)a4 ambiguityResolution:(id)a5 substringSearchGranularity:(int)a6 foundStringRef:(id *)a7;
- (double)delayAfterSelectionBeforeExecutingAction;
- (id)_actOnStrings:(id)a3 range:(id)a4 ambiguityResolution:(id)a5 substringSearchGranularity:(int)a6 alwaysCallActionOnClosestMatch:(BOOL)a7 options:(id)a8 provider:(id)a9 actionBlock:(id)a10;
- (id)_capitalizedStringFromString:(id)a3;
- (id)_localizedPunctuationStringForIdentifier:(id)a3;
- (id)_prunedStringsFromCandidateStrings:(id)a3;
- (id)_stringBySurroundingString:(id)a3 withPrefixString:(id)a4 suffixString:(id)a5;
- (id)_strippedPhraseStringsFromStrings:(id)a3;
- (id)actOnRange:(id)a3 options:(id)a4 actionBlock:(id)a5;
- (id)actOnStrings:(id)a3 ambiguityResolution:(id)a4 substringSearchGranularity:(int)a5 alwaysCallActionOnClosestMatch:(BOOL)a6 options:(id)a7 actionBlock:(id)a8;
- (id)markerRangeForEnumerationType:(int64_t)a3 desiredBlock:(int)a4 count:(unint64_t)a5 options:(int)a6;
- (id)markerRangeForEnumerationType:(int64_t)a3 markerRange:(id)a4 desiredBlock:(int)a5 count:(unint64_t)a6 options:(int)a7;
- (id)markerRangeForLineInDesiredBlock:(int)a3 markerRange:(id)a4 count:(unint64_t)a5 options:(int)a6;
- (id)orderedPhraseMatchesFromStrings:(id)a3 forwardDirection:(BOOL)a4 referenceLocation:(int64_t)a5 substringSearchGranularity:(int)a6;
- (id)visiblePhraseMatchesFromStrings:(id)a3 substringSearchGranularity:(int)a4;
- (int64_t)_indexOfFirstPhraseMatchResultPairBeforeInsertion:(BOOL)a3 fromArray:(id)a4;
- (unint64_t)characterLengthOfTextMarkerRange:(id)a3;
- (void)_insertComponentsIndividuallyBySurroundingString:(id)a3 withPrefixString:(id)a4 suffixString:(id)a5 retainedProvider:(id)a6;
- (void)applyFormatWithCommandIdentifier:(id)a3;
- (void)correctSelection;
- (void)deleteAll;
- (void)deleteCurrentCharacter;
- (void)deleteCurrentLine;
- (void)deleteCurrentParagraph;
- (void)deleteCurrentSentence;
- (void)deleteCurrentWord;
- (void)deleteNextCharacterWithCount:(int64_t)a3;
- (void)deleteNextLineWithCount:(int64_t)a3;
- (void)deleteNextParagraphWithCount:(int64_t)a3;
- (void)deleteNextSentenceWithCount:(int64_t)a3;
- (void)deleteNextWordWithCount:(int64_t)a3;
- (void)deletePreviousCharacterWithCount:(int64_t)a3;
- (void)deletePreviousLineWithCount:(int64_t)a3;
- (void)deletePreviousParagraphWithCount:(int64_t)a3;
- (void)deletePreviousSentenceWithCount:(int64_t)a3;
- (void)deletePreviousWordWithCount:(int64_t)a3;
- (void)deleteSelection;
- (void)extendSelectionBackwardCharactersWithCount:(int64_t)a3;
- (void)extendSelectionBackwardLinesWithCount:(int64_t)a3;
- (void)extendSelectionBackwardParagraphsWithCount:(int64_t)a3;
- (void)extendSelectionBackwardSentencesWithCount:(int64_t)a3;
- (void)extendSelectionBackwardWordsWithCount:(int64_t)a3;
- (void)extendSelectionForwardCharactersWithCount:(int64_t)a3;
- (void)extendSelectionForwardLinesWithCount:(int64_t)a3;
- (void)extendSelectionForwardParagraphsWithCount:(int64_t)a3;
- (void)extendSelectionForwardSentencesWithCount:(int64_t)a3;
- (void)extendSelectionForwardWordsWithCount:(int64_t)a3;
- (void)extendSelectionToBeginning;
- (void)extendSelectionToEnd;
- (void)moveBackwardCharactersWithCount:(int64_t)a3;
- (void)moveBackwardLinesWithCount:(int64_t)a3;
- (void)moveBackwardParagraphsWithCount:(int64_t)a3;
- (void)moveBackwardSentencesWithCount:(int64_t)a3;
- (void)moveBackwardWordsWithCount:(int64_t)a3;
- (void)moveForwardCharactersWithCount:(int64_t)a3;
- (void)moveForwardLinesWithCount:(int64_t)a3;
- (void)moveForwardParagraphsWithCount:(int64_t)a3;
- (void)moveForwardSentencesWithCount:(int64_t)a3;
- (void)moveForwardWordsWithCount:(int64_t)a3;
- (void)moveToEndOfLineWithCount:(int64_t)a3;
- (void)moveToEndOfParagraphWithCount:(int64_t)a3;
- (void)moveToEndOfSelection;
- (void)moveToEndOfSentenceWithCount:(int64_t)a3;
- (void)moveToEndOfTextArea;
- (void)moveToEndOfWordWithCount:(int64_t)a3;
- (void)moveToStartOfLineWithCount:(int64_t)a3;
- (void)moveToStartOfParagraphWithCount:(int64_t)a3;
- (void)moveToStartOfSelection;
- (void)moveToStartOfSentenceWithCount:(int64_t)a3;
- (void)moveToStartOfTextArea;
- (void)moveToStartOfWordWithCount:(int64_t)a3;
- (void)pasteboardCopy;
- (void)pasteboardCut;
- (void)pasteboardPaste;
- (void)selectAll;
- (void)selectCurrentCharacter;
- (void)selectCurrentLine;
- (void)selectCurrentParagraph;
- (void)selectCurrentSentence;
- (void)selectCurrentWord;
- (void)selectFromPhraseVariants:(id)a3 insertionString:(id)a4 commandIdentifer:(id)a5;
- (void)selectFromPhraseVariants:(id)a3 insertionString:(id)a4 range:(id)a5 recognizedParameters:(id)a6 commandIdentifer:(id)a7;
- (void)selectFromPhraseVariants:(id)a3 insertionString:(id)a4 recognizedParameters:(id)a5 commandIdentifer:(id)a6;
- (void)selectFromPhraseVariants:(id)a3 throughPhraseVariants:(id)a4 commandIdentifer:(id)a5;
- (void)selectFromPhraseVariants:(id)a3 throughPhraseVariants:(id)a4 recognizedParameters:(id)a5 commandIdentifer:(id)a6;
- (void)selectFromRange:(id)a3 insertionString:(id)a4 commandIdentifier:(id)a5 recognizedParamaters:(id)a6;
- (void)selectNextCharacterWithCount:(int64_t)a3;
- (void)selectNextLineWithCount:(int64_t)a3;
- (void)selectNextParagraphWithCount:(int64_t)a3;
- (void)selectNextSentenceWithCount:(int64_t)a3;
- (void)selectNextWordWithCount:(int64_t)a3;
- (void)selectPreviousCharacterWithCount:(int64_t)a3;
- (void)selectPreviousLineWithCount:(int64_t)a3;
- (void)selectPreviousParagraphWithCount:(int64_t)a3;
- (void)selectPreviousSentenceWithCount:(int64_t)a3;
- (void)selectPreviousTextInsertion;
- (void)selectPreviousWordWithCount:(int64_t)a3;
- (void)setDelayAfterSelectionBeforeExecutingAction:(double)a3;
- (void)setProvider:(id)a3;
- (void)surroundSelectionWithPunctuationForCommandIdentifier:(id)a3;
@end

@implementation SRCSTextEditing

- (void)selectCurrentCharacter
{
  v3 = [(SRCSTextEditing *)self provider];
  id v5 = [v3 markerRangeForEnumerationType:2 desiredBlock:1 count:1 options:0];

  if (v5)
  {
    v4 = [(SRCSTextEditing *)self provider];
    [v4 setSelectionToTextMarkerRange:v5];
  }
}

- (void)selectPreviousCharacterWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:2 desiredBlock:2 count:a3 options:4];

  if (v7)
  {
    v6 = [(SRCSTextEditing *)self provider];
    [v6 setSelectionToTextMarkerRange:v7];
  }
}

- (void)selectNextCharacterWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:2 desiredBlock:0 count:a3 options:4];

  if (v7)
  {
    v6 = [(SRCSTextEditing *)self provider];
    [v6 setSelectionToTextMarkerRange:v7];
  }
}

- (void)selectCurrentWord
{
  v3 = [(SRCSTextEditing *)self provider];
  id v5 = [v3 markerRangeForEnumerationType:3 desiredBlock:1 count:1 options:0];

  if (v5)
  {
    v4 = [(SRCSTextEditing *)self provider];
    [v4 setSelectionToTextMarkerRange:v5];
  }
}

- (void)selectPreviousWordWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:3 desiredBlock:2 count:a3 options:4];

  if (v7)
  {
    v6 = [(SRCSTextEditing *)self provider];
    [v6 setSelectionToTextMarkerRange:v7];
  }
}

- (void)selectNextWordWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:3 desiredBlock:0 count:a3 options:4];

  if (v7)
  {
    v6 = [(SRCSTextEditing *)self provider];
    [v6 setSelectionToTextMarkerRange:v7];
  }
}

- (void)selectCurrentSentence
{
  v3 = [(SRCSTextEditing *)self provider];
  id v5 = [v3 markerRangeForEnumerationType:4 desiredBlock:1 count:1 options:0];

  if (v5)
  {
    v4 = [(SRCSTextEditing *)self provider];
    [v4 setSelectionToTextMarkerRange:v5];
  }
}

- (void)selectNextSentenceWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:4 desiredBlock:0 count:a3 options:4];

  if (v7)
  {
    v6 = [(SRCSTextEditing *)self provider];
    [v6 setSelectionToTextMarkerRange:v7];
  }
}

- (void)selectPreviousSentenceWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:4 desiredBlock:2 count:a3 options:4];

  if (v7)
  {
    v6 = [(SRCSTextEditing *)self provider];
    [v6 setSelectionToTextMarkerRange:v7];
  }
}

- (void)selectCurrentParagraph
{
  v3 = [(SRCSTextEditing *)self provider];
  id v5 = [v3 markerRangeForEnumerationType:1 desiredBlock:1 count:1 options:0];

  if (v5)
  {
    v4 = [(SRCSTextEditing *)self provider];
    [v4 setSelectionToTextMarkerRange:v5];
  }
}

- (void)selectNextParagraphWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:1 desiredBlock:0 count:a3 options:4];

  if (v7)
  {
    v6 = [(SRCSTextEditing *)self provider];
    [v6 setSelectionToTextMarkerRange:v7];
  }
}

- (void)selectPreviousParagraphWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:1 desiredBlock:2 count:a3 options:4];

  if (v7)
  {
    v6 = [(SRCSTextEditing *)self provider];
    [v6 setSelectionToTextMarkerRange:v7];
  }
}

- (void)selectCurrentLine
{
  v3 = [(SRCSTextEditing *)self provider];
  id v5 = [v3 markerRangeForEnumerationType:0 desiredBlock:1 count:1 options:0];

  if (v5)
  {
    v4 = [(SRCSTextEditing *)self provider];
    [v4 setSelectionToTextMarkerRange:v5];
  }
}

- (void)selectNextLineWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:0 desiredBlock:0 count:a3 options:4];

  if (v7)
  {
    v6 = [(SRCSTextEditing *)self provider];
    [v6 setSelectionToTextMarkerRange:v7];
  }
}

- (void)selectPreviousLineWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:0 desiredBlock:2 count:a3 options:4];

  if (v7)
  {
    v6 = [(SRCSTextEditing *)self provider];
    [v6 setSelectionToTextMarkerRange:v7];
  }
}

- (void)extendSelectionToEnd
{
  id v11 = [(SRCSTextEditing *)self provider];
  v3 = [(SRCSTextEditing *)self provider];
  v4 = (void *)[v3 textMarkerRangeClass];
  id v5 = [(SRCSTextEditing *)self provider];
  v6 = [v5 selectionTextMarkerRange];
  id v7 = [v6 startMarker];
  v8 = [(SRCSTextEditing *)self provider];
  v9 = [v8 lastPositionTextMarker];
  v10 = [v4 markerRangeWithStartMarker:v7 endMarker:v9];
  [v11 setSelectionToTextMarkerRange:v10];
}

- (void)extendSelectionToBeginning
{
  id v11 = [(SRCSTextEditing *)self provider];
  v3 = [(SRCSTextEditing *)self provider];
  v4 = (void *)[v3 textMarkerRangeClass];
  id v5 = [(SRCSTextEditing *)self provider];
  v6 = [v5 firstPositionTextMarker];
  id v7 = [(SRCSTextEditing *)self provider];
  v8 = [v7 selectionTextMarkerRange];
  v9 = [v8 endMarker];
  v10 = [v4 markerRangeWithStartMarker:v6 endMarker:v9];
  [v11 setSelectionToTextMarkerRange:v10];
}

- (void)extendSelectionForwardCharactersWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v14 = [v5 markerRangeForEnumerationType:2 desiredBlock:0 count:a3 options:4];

  if (v14)
  {
    v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    v8 = (void *)[v7 textMarkerRangeClass];
    v9 = [(SRCSTextEditing *)self provider];
    v10 = [v9 selectionTextMarkerRange];
    id v11 = [v10 startMarker];
    v12 = [v14 endMarker];
    v13 = [v8 markerRangeWithStartMarker:v11 endMarker:v12];
    [v6 setSelectionToTextMarkerRange:v13];
  }
}

- (void)extendSelectionBackwardCharactersWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v14 = [v5 markerRangeForEnumerationType:2 desiredBlock:2 count:a3 options:4];

  if (v14)
  {
    v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    v8 = (void *)[v7 textMarkerRangeClass];
    v9 = [v14 startMarker];
    v10 = [(SRCSTextEditing *)self provider];
    id v11 = [v10 selectionTextMarkerRange];
    v12 = [v11 endMarker];
    v13 = [v8 markerRangeWithStartMarker:v9 endMarker:v12];
    [v6 setSelectionToTextMarkerRange:v13];
  }
}

- (void)extendSelectionForwardWordsWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v14 = [v5 markerRangeForEnumerationType:3 desiredBlock:0 count:a3 options:4];

  if (v14)
  {
    v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    v8 = (void *)[v7 textMarkerRangeClass];
    v9 = [(SRCSTextEditing *)self provider];
    v10 = [v9 selectionTextMarkerRange];
    id v11 = [v10 startMarker];
    v12 = [v14 endMarker];
    v13 = [v8 markerRangeWithStartMarker:v11 endMarker:v12];
    [v6 setSelectionToTextMarkerRange:v13];
  }
}

- (void)extendSelectionBackwardWordsWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v14 = [v5 markerRangeForEnumerationType:3 desiredBlock:2 count:a3 options:4];

  if (v14)
  {
    v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    v8 = (void *)[v7 textMarkerRangeClass];
    v9 = [v14 startMarker];
    v10 = [(SRCSTextEditing *)self provider];
    id v11 = [v10 selectionTextMarkerRange];
    v12 = [v11 endMarker];
    v13 = [v8 markerRangeWithStartMarker:v9 endMarker:v12];
    [v6 setSelectionToTextMarkerRange:v13];
  }
}

- (void)extendSelectionForwardSentencesWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v14 = [v5 markerRangeForEnumerationType:4 desiredBlock:0 count:a3 options:4];

  if (v14)
  {
    v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    v8 = (void *)[v7 textMarkerRangeClass];
    v9 = [(SRCSTextEditing *)self provider];
    v10 = [v9 selectionTextMarkerRange];
    id v11 = [v10 startMarker];
    v12 = [v14 endMarker];
    v13 = [v8 markerRangeWithStartMarker:v11 endMarker:v12];
    [v6 setSelectionToTextMarkerRange:v13];
  }
}

- (void)extendSelectionBackwardSentencesWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v14 = [v5 markerRangeForEnumerationType:4 desiredBlock:2 count:a3 options:4];

  if (v14)
  {
    v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    v8 = (void *)[v7 textMarkerRangeClass];
    v9 = [v14 startMarker];
    v10 = [(SRCSTextEditing *)self provider];
    id v11 = [v10 selectionTextMarkerRange];
    v12 = [v11 endMarker];
    v13 = [v8 markerRangeWithStartMarker:v9 endMarker:v12];
    [v6 setSelectionToTextMarkerRange:v13];
  }
}

- (void)extendSelectionForwardParagraphsWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v14 = [v5 markerRangeForEnumerationType:1 desiredBlock:0 count:a3 options:4];

  if (v14)
  {
    v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    v8 = (void *)[v7 textMarkerRangeClass];
    v9 = [(SRCSTextEditing *)self provider];
    v10 = [v9 selectionTextMarkerRange];
    id v11 = [v10 startMarker];
    v12 = [v14 endMarker];
    v13 = [v8 markerRangeWithStartMarker:v11 endMarker:v12];
    [v6 setSelectionToTextMarkerRange:v13];
  }
}

- (void)extendSelectionBackwardParagraphsWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v14 = [v5 markerRangeForEnumerationType:1 desiredBlock:2 count:a3 options:4];

  if (v14)
  {
    v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    v8 = (void *)[v7 textMarkerRangeClass];
    v9 = [v14 startMarker];
    v10 = [(SRCSTextEditing *)self provider];
    id v11 = [v10 selectionTextMarkerRange];
    v12 = [v11 endMarker];
    v13 = [v8 markerRangeWithStartMarker:v9 endMarker:v12];
    [v6 setSelectionToTextMarkerRange:v13];
  }
}

- (void)extendSelectionForwardLinesWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v14 = [v5 markerRangeForEnumerationType:0 desiredBlock:0 count:a3 options:4];

  if (v14)
  {
    v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    v8 = (void *)[v7 textMarkerRangeClass];
    v9 = [(SRCSTextEditing *)self provider];
    v10 = [v9 selectionTextMarkerRange];
    id v11 = [v10 startMarker];
    v12 = [v14 endMarker];
    v13 = [v8 markerRangeWithStartMarker:v11 endMarker:v12];
    [v6 setSelectionToTextMarkerRange:v13];
  }
}

- (void)extendSelectionBackwardLinesWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v14 = [v5 markerRangeForEnumerationType:0 desiredBlock:2 count:a3 options:4];

  if (v14)
  {
    v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    v8 = (void *)[v7 textMarkerRangeClass];
    v9 = [v14 startMarker];
    v10 = [(SRCSTextEditing *)self provider];
    id v11 = [v10 selectionTextMarkerRange];
    v12 = [v11 endMarker];
    v13 = [v8 markerRangeWithStartMarker:v9 endMarker:v12];
    [v6 setSelectionToTextMarkerRange:v13];
  }
}

- (void)selectFromPhraseVariants:(id)a3 insertionString:(id)a4 commandIdentifer:(id)a5
{
}

- (void)selectFromPhraseVariants:(id)a3 insertionString:(id)a4 recognizedParameters:(id)a5 commandIdentifer:(id)a6
{
}

- (id)_actOnStrings:(id)a3 range:(id)a4 ambiguityResolution:(id)a5 substringSearchGranularity:(int)a6 alwaysCallActionOnClosestMatch:(BOOL)a7 options:(id)a8 provider:(id)a9 actionBlock:(id)a10
{
  if (a4) {
    objc_msgSend(a9, "actOnRange:options:actionBlock:", a4, a8, a10, *(void *)&a6, a7);
  }
  else {
  v10 = [a9 actOnStrings:a3 ambiguityResolution:a5 substringSearchGranularity:*(void *)&a6 alwaysCallActionOnClosestMatch:a7 options:a8 actionBlock:a10];
  }
  return v10;
}

- (void)selectFromPhraseVariants:(id)a3 insertionString:(id)a4 range:(id)a5 recognizedParameters:(id)a6 commandIdentifer:(id)a7
{
  v106[2] = *MEMORY[0x263EF8340];
  id v48 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [(SRCSTextEditing *)self _prunedStringsFromCandidateStrings:a3];
  v16 = [(SRCSTextEditing *)self _strippedPhraseStringsFromStrings:v15];

  v17 = [(SRCSTextEditing *)self provider];
  uint64_t v18 = [v17 searchGranularity];

  v19 = [(SRCSTextEditing *)self provider];
  v20 = [MEMORY[0x263EFF9A0] dictionary];
  v21 = v20;
  if (v13) {
    [v20 setObject:v13 forKey:@"RecognizedParameters"];
  }
  v22 = v48;
  v49 = v19;
  if ([v14 isEqualToString:@"Text.SelectPrevious"])
  {
    id v45 = v14;
    if ([v19 isNextPreviousResolverSpokenCommandEmojiBased]) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v18;
    }
    v23 = v21;
    [v21 addEntriesFromDictionary:&unk_26EE317F0];
    id v24 = v13;
    if ([v19 isNextPreviousResolverSpokenCommandEmojiBased]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v25 = v12;
      v26 = [v19 emojisMatchingTextInStrings:v16];
      int v27 = 1;
    }
    else
    {
      id v25 = v12;
      int v27 = 0;
      v26 = v16;
    }
    v102[0] = MEMORY[0x263EF8330];
    v102[1] = 3221225472;
    v102[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke;
    v102[3] = &unk_264DC9798;
    id v103 = v49;
    id v12 = v25;
    v34 = [(SRCSTextEditing *)self _actOnStrings:v26 range:v25 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestBeforeSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v23 provider:v103 actionBlock:v102];
    if (v27) {

    }
    v35 = v103;
    id v13 = v24;
    id v14 = v45;
    v21 = v23;
    goto LABEL_29;
  }
  if ([v14 isEqualToString:@"Text.SelectNext"])
  {
    id v46 = v14;
    if ([v19 isNextPreviousResolverSpokenCommandEmojiBased]) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v18;
    }
    v28 = v21;
    [v21 addEntriesFromDictionary:&unk_26EE31818];
    id v29 = v13;
    if ([v19 isNextPreviousResolverSpokenCommandEmojiBased])
    {
      id v30 = v48;
      id v31 = v12;
      if (objc_opt_respondsToSelector())
      {
        v32 = [v19 emojisMatchingTextInStrings:v16];
        int v33 = 1;
LABEL_26:
        v100[0] = MEMORY[0x263EF8330];
        v100[1] = 3221225472;
        v100[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_2;
        v100[3] = &unk_264DC9798;
        id v101 = v49;
        id v12 = v31;
        v34 = [(SRCSTextEditing *)self _actOnStrings:v32 range:v31 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestAfterSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v28 provider:v101 actionBlock:v100];
        if (v33) {

        }
        v35 = v101;
        id v13 = v29;
        id v14 = v46;
        v21 = v28;
        v22 = v30;
LABEL_29:

        v19 = v49;
        if (v34) {
          goto LABEL_32;
        }
        goto LABEL_30;
      }
    }
    else
    {
      id v31 = v12;
      id v30 = v48;
    }
    int v33 = 0;
    v32 = v16;
    goto LABEL_26;
  }
  if (![v14 isEqualToString:@"Text.ChangePhrase"])
  {
    if ([v14 isEqualToString:@"Text.InsertAfterPhrase"])
    {
      [v21 addEntriesFromDictionary:&unk_26EE31840];
      v92[0] = MEMORY[0x263EF8330];
      v92[1] = 3221225472;
      v92[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_5;
      v92[3] = &unk_264DC9838;
      id v93 = v19;
      v94 = self;
      v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v21 provider:v93 actionBlock:v92];
      v35 = v93;
      goto LABEL_29;
    }
    v40 = v21;
    if ([v14 isEqualToString:@"Text.InsertPhraseAfterPhrase"])
    {
      [v19 registerInsertedStringCategoryIdentifer:kSRCSCommandParameterDictation2[0]];
      [v21 addEntriesFromDictionary:&unk_26EE31868];
      v88[0] = MEMORY[0x263EF8330];
      v88[1] = 3221225472;
      v88[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_7;
      v88[3] = &unk_264DC9860;
      id v89 = v19;
      v90 = self;
      id v91 = v48;
      id v41 = v48;
      v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v21 provider:v89 actionBlock:v88];

      v35 = v89;
LABEL_37:
      v22 = v41;
      goto LABEL_29;
    }
    if ([v14 isEqualToString:@"Text.InsertBeforePhrase"])
    {
      [v21 addEntriesFromDictionary:&unk_26EE31890];
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_9;
      v85[3] = &unk_264DC9838;
      id v86 = v19;
      v87 = self;
      v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v21 provider:v86 actionBlock:v85];
      v35 = v86;
LABEL_40:
      v22 = v48;
      goto LABEL_29;
    }
    if ([v14 isEqualToString:@"Text.InsertPhraseBeforePhrase"])
    {
      [v19 registerInsertedStringCategoryIdentifer:kSRCSCommandParameterDictation2[0]];
      [v21 addEntriesFromDictionary:&unk_26EE318B8];
      v81[0] = MEMORY[0x263EF8330];
      v81[1] = 3221225472;
      v81[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_11;
      v81[3] = &unk_264DC9860;
      id v82 = v19;
      v83 = self;
      id v84 = v48;
      id v41 = v48;
      v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v21 provider:v82 actionBlock:v81];

      v35 = v82;
      goto LABEL_37;
    }
    if ([v14 isEqualToString:@"Text.DeletePhrase"])
    {
      [v21 addEntriesFromDictionary:&unk_26EE318E0];
      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_13;
      v79[3] = &unk_264DC9798;
      id v80 = v19;
      v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v21 provider:v80 actionBlock:v79];
      v35 = v80;
      goto LABEL_40;
    }
    if ([v14 isEqualToString:@"Text.CapitalizePhrase"])
    {
      [v21 addEntriesFromDictionary:&unk_26EE31908];
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_15;
      v76[3] = &unk_264DC9838;
      id v77 = v19;
      v78 = self;
      v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v21 provider:v77 actionBlock:v76];
      v35 = v77;
      goto LABEL_40;
    }
    if ([v14 isEqualToString:@"Text.LowercasePhrase"])
    {
      [v21 addEntriesFromDictionary:&unk_26EE31930];
      v73[0] = MEMORY[0x263EF8330];
      v73[1] = 3221225472;
      v73[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_17;
      v73[3] = &unk_264DC9838;
      id v74 = v19;
      v75 = self;
      v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v21 provider:v74 actionBlock:v73];
      v35 = v74;
      goto LABEL_40;
    }
    if ([v14 isEqualToString:@"Text.UppercasePhrase"])
    {
      [v21 addEntriesFromDictionary:&unk_26EE31958];
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_19;
      v70[3] = &unk_264DC9838;
      id v71 = v19;
      v72 = self;
      v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v21 provider:v71 actionBlock:v70];
      v35 = v71;
      goto LABEL_40;
    }
    if ([v14 isEqualToString:@"Text.FormatItalicPhrase"])
    {
      [v21 addEntriesFromDictionary:&unk_26EE31980];
      v67[0] = MEMORY[0x263EF8330];
      v67[1] = 3221225472;
      v67[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_21;
      v67[3] = &unk_264DC9838;
      id v68 = v19;
      v69 = self;
      v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v21 provider:v68 actionBlock:v67];
      v35 = v68;
      goto LABEL_40;
    }
    if ([v14 isEqualToString:@"Text.CorrectPhrase"])
    {
      [v21 addEntriesFromDictionary:&unk_26EE319A8];
      v64[0] = MEMORY[0x263EF8330];
      v64[1] = 3221225472;
      v64[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_23;
      v64[3] = &unk_264DC9838;
      id v65 = v19;
      v66 = self;
      v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v21 provider:v65 actionBlock:v64];
      v35 = v65;
      goto LABEL_40;
    }
    if ([v14 isEqualToString:@"Text.FormatBoldPhrase"])
    {
      [v21 addEntriesFromDictionary:&unk_26EE319D0];
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_25;
      v61[3] = &unk_264DC9838;
      id v62 = v19;
      v63 = self;
      v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v21 provider:v62 actionBlock:v61];
      v35 = v62;
      goto LABEL_40;
    }
    if ([v14 isEqualToString:@"Text.FormatUnderlinePhrase"])
    {
      [v21 addEntriesFromDictionary:&unk_26EE319F8];
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_27;
      v58[3] = &unk_264DC9838;
      id v59 = v19;
      v60 = self;
      v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v21 provider:v59 actionBlock:v58];
      v35 = v59;
LABEL_59:
      v22 = v48;
      goto LABEL_29;
    }
    if (([v14 isEqualToString:@"Text.PutDoubleQuotesAroundPhrase"] & 1) != 0
      || ([v14 isEqualToString:@"Text.PutDoubleCurlyQuotesAroundPhrase"] & 1) != 0
      || ([v14 isEqualToString:@"Text.PutSingleQuotesAroundPhrase"] & 1) != 0
      || ([v14 isEqualToString:@"Text.PutSingleCurlyQuotesAroundPhrase"] & 1) != 0
      || ([v14 isEqualToString:@"Text.PutParenthesesAroundPhrase"] & 1) != 0
      || ([v14 isEqualToString:@"Text.PutSquareBracketsAroundPhrase"] & 1) != 0
      || [v14 isEqualToString:@"Text.PutCurlyBracesAroundPhrase"])
    {
      [v21 addEntriesFromDictionary:&unk_26EE31A20];
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_29;
      v54[3] = &unk_264DC9860;
      id v55 = v19;
      id v56 = v14;
      v57 = self;
      v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:0 options:v21 provider:v55 actionBlock:v54];

      v35 = v55;
      id v42 = v48;
    }
    else
    {
      if (![v14 isEqualToString:@"Text.SelectEmojiWithPhrase"])
      {
        if ([v16 count])
        {
          v43 = [v16 objectAtIndex:0];
          int v44 = [v43 isEqualToString:@"\n\n"];

          if (v44)
          {
            [(SRCSTextEditing *)self selectNextParagraphWithCount:1];
            v34 = @"\n\n";
            v19 = v49;
            v21 = v40;
            v22 = v48;
            goto LABEL_32;
          }
        }
        v21 = v40;
        [v40 addEntriesFromDictionary:&unk_26EE31A70];
        v50[0] = MEMORY[0x263EF8330];
        v50[1] = 3221225472;
        v50[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_32;
        v50[3] = &unk_264DC9798;
        id v51 = v49;
        v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v18 alwaysCallActionOnClosestMatch:1 options:v40 provider:v51 actionBlock:v50];
        v35 = v51;
        goto LABEL_59;
      }
      if (objc_opt_respondsToSelector())
      {
        v35 = [v19 emojisMatchingTextInStrings:v16];
      }
      else
      {
        v35 = 0;
      }
      if ([v35 count])
      {
        [v21 addEntriesFromDictionary:&unk_26EE31A48];
        v52[0] = MEMORY[0x263EF8330];
        v52[1] = 3221225472;
        v52[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_31;
        v52[3] = &unk_264DC9798;
        id v53 = v19;
        v34 = [(SRCSTextEditing *)self _actOnStrings:v35 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:1 alwaysCallActionOnClosestMatch:1 options:v21 provider:v53 actionBlock:v52];

        goto LABEL_59;
      }
      v34 = 0;
      id v42 = v48;
    }
    v22 = v42;
    goto LABEL_29;
  }
  if (v48)
  {
    v105[0] = @"ActionIdentifier";
    v105[1] = @"ReplacementString";
    v106[0] = @"AXSelectTextActivityFindAndSelect";
    v106[1] = v48;
    [NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:2];
    unsigned int v47 = v18;
    v37 = v36 = v21;
    [v36 addEntriesFromDictionary:v37];

    v95[0] = MEMORY[0x263EF8330];
    v95[1] = 3221225472;
    v95[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_3;
    v95[3] = &unk_264DC97E8;
    id v96 = v48;
    id v97 = v19;
    id v98 = v13;
    v99 = self;
    v21 = v36;
    v34 = [(SRCSTextEditing *)self _actOnStrings:v16 range:v12 ambiguityResolution:@"AXSelectTextAmbiguityResolutionClosestToSelection" substringSearchGranularity:v47 alwaysCallActionOnClosestMatch:0 options:v36 provider:v97 actionBlock:v95];

    v35 = v96;
    goto LABEL_29;
  }
LABEL_30:
  v34 = [v16 firstObject];

  if (v34)
  {
    v38 = [v16 firstObject];
    v104 = v38;
    v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v104 count:1];
    [v19 handleErrorIdentifier:@"ErrorMessage.TextNotFound" withObjects:v39];

    v34 = 0;
  }
LABEL_32:
}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setSelectionToTextMarkerRange:a2];
}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setSelectionToTextMarkerRange:a2];
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 length] && objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    [*(id *)(a1 + 40) registerInsertedStringCategoryIdentifer:kSRCSCommandParameterDictation[0]];
    [*(id *)(a1 + 40) setSelectionToTextMarkerRange:v5];
    id v7 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:*(void *)(a1 + 32)];
    v8 = [*(id *)(a1 + 48) objectForKey:@"SRCSClientDictationRecognizerModeIsSpelling"];
    char v9 = [v8 BOOLValue];

    if ((v9 & 1) == 0)
    {
      v10 = [v6 lowercaseString];
      id v11 = [v6 uppercaseString];
      if (([v11 isEqualToString:v10] & 1) == 0)
      {
        if ((unint64_t)[*(id *)(a1 + 32) length] < 2
          || ([*(id *)(a1 + 32) uppercaseString],
              id v12 = objc_claimAutoreleasedReturnValue(),
              char v13 = [v12 isEqualToString:*(void *)(a1 + 32)],
              v12,
              (v13 & 1) == 0))
        {
          id v14 = [v6 substringToIndex:1];
          v15 = [v11 substringToIndex:1];
          char v16 = [v14 isEqualToString:v15];

          v17 = [v7 substringToIndex:1];
          uint64_t v18 = v17;
          if (v16) {
            [v17 uppercaseString];
          }
          else {
          v19 = [v17 lowercaseString];
          }
          objc_msgSend(v7, "replaceCharactersInRange:withString:", 0, 1, v19);
        }
      }
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_4;
    block[3] = &unk_264DC97C0;
    id v22 = *(id *)(a1 + 40);
    id v23 = v7;
    uint64_t v24 = *(void *)(a1 + 56);
    id v20 = v7;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  [*(id *)(a1 + 48) delayAfterSelectionBeforeExecutingAction];
  return objc_msgSend(v1, "performSelector:withObject:afterDelay:", sel_insertString_, v2);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setSelectionToTextMarkerRange:v3];
  [*(id *)(a1 + 40) delayAfterSelectionBeforeExecutingAction];
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_6;
  v7[3] = &unk_264DC9810;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v6 = v3;
  dispatch_after(v5, MEMORY[0x263EF83A0], v7);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)[v2 textMarkerRangeClass];
  id v6 = [*(id *)(a1 + 40) endMarker];
  double v4 = [*(id *)(a1 + 40) endMarker];
  dispatch_time_t v5 = [v3 markerRangeWithStartMarker:v6 endMarker:v4];
  [v2 setSelectionToTextMarkerRange:v5];
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_7(id *a1, uint64_t a2)
{
  [a1[4] setSelectionToTextMarkerRange:a2];
  [a1[5] delayAfterSelectionBeforeExecutingAction];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_8;
  block[3] = &unk_264DC97C0;
  int8x16_t v6 = *((int8x16_t *)a1 + 2);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  id v9 = a1[6];
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) moveToEndOfSelection];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![*(id *)(a1 + 40) shouldInsertInterWordSpaces])
  {
    double v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 insertString:v4];
  }
  else
  {
    uint64_t v2 = *(void **)(a1 + 40);
    id v5 = [NSString stringWithFormat:@" %@", *(void *)(a1 + 48)];
    [v2 insertString:v5];
  }
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setSelectionToTextMarkerRange:v3];
  [*(id *)(a1 + 40) delayAfterSelectionBeforeExecutingAction];
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_10;
  v7[3] = &unk_264DC9810;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v6 = v3;
  dispatch_after(v5, MEMORY[0x263EF83A0], v7);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_10(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = (void *)[v2 textMarkerRangeClass];
  id v6 = [*(id *)(a1 + 40) startMarker];
  double v4 = [*(id *)(a1 + 40) startMarker];
  dispatch_time_t v5 = [v3 markerRangeWithStartMarker:v6 endMarker:v4];
  [v2 setSelectionToTextMarkerRange:v5];
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_11(id *a1, uint64_t a2)
{
  [a1[4] setSelectionToTextMarkerRange:a2];
  [a1[5] delayAfterSelectionBeforeExecutingAction];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_12;
  block[3] = &unk_264DC97C0;
  int8x16_t v6 = *((int8x16_t *)a1 + 2);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  id v9 = a1[6];
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_12(uint64_t a1)
{
  [*(id *)(a1 + 32) moveToStartOfSelection];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![*(id *)(a1 + 40) shouldInsertInterWordSpaces])
  {
    double v3 = *(void **)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 insertString:v4];
  }
  else
  {
    uint64_t v2 = *(void **)(a1 + 40);
    id v5 = [NSString stringWithFormat:@"%@ ", *(void *)(a1 + 48)];
    [v2 insertString:v5];
  }
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setSelectionToTextMarkerRange:v3];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_14;
  v5[3] = &unk_264DC9810;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteTextAtTextMarkerRange:*(void *)(a1 + 40)];
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setSelectionToTextMarkerRange:a2];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_16;
  block[3] = &unk_264DC97C0;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v10 = v6;
  uint64_t v11 = v7;
  id v12 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_16(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _capitalizedStringFromString:*(void *)(a1 + 48)];
  [*(id *)(a1 + 40) delayAfterSelectionBeforeExecutingAction];
  objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel_insertString_, v3);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setSelectionToTextMarkerRange:a2];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_18;
  block[3] = &unk_264DC97C0;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 40);
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_18(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) lowercaseString];
  [*(id *)(a1 + 48) delayAfterSelectionBeforeExecutingAction];
  objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel_insertString_, v3);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setSelectionToTextMarkerRange:a2];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_20;
  block[3] = &unk_264DC97C0;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = *(void *)(a1 + 40);
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_20(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) uppercaseString];
  [*(id *)(a1 + 48) delayAfterSelectionBeforeExecutingAction];
  objc_msgSend(v2, "performSelector:withObject:afterDelay:", sel_insertString_, v3);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_21(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setSelectionToTextMarkerRange:a2];
  [*(id *)(a1 + 40) delayAfterSelectionBeforeExecutingAction];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_22;
  block[3] = &unk_264DC9888;
  id v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_22(uint64_t a1)
{
  return [*(id *)(a1 + 32) formatSelectionItalics];
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_23(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setSelectionToTextMarkerRange:a2];
  [*(id *)(a1 + 40) delayAfterSelectionBeforeExecutingAction];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_24;
  block[3] = &unk_264DC9888;
  id v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_24(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCorrectionRequestWithStrings:0];
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_25(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setSelectionToTextMarkerRange:a2];
  [*(id *)(a1 + 40) delayAfterSelectionBeforeExecutingAction];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_26;
  block[3] = &unk_264DC9888;
  id v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_26(uint64_t a1)
{
  return [*(id *)(a1 + 32) formatSelectionBold];
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_27(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setSelectionToTextMarkerRange:a2];
  [*(id *)(a1 + 40) delayAfterSelectionBeforeExecutingAction];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_28;
  block[3] = &unk_264DC9888;
  id v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_28(uint64_t a1)
{
  return [*(id *)(a1 + 32) formatSelectionUnderline];
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 32) setSelectionToTextMarkerRange:a2];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_30;
  v9[3] = &unk_264DC98B0;
  id v10 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_30(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"Text.PutDoubleQuotesAroundPhrase"])
  {
    double v3 = *(void **)(a1 + 40);
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    id v9 = [v2 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.StraightDoubleQuote.Opening"];
    id v5 = *(void **)(a1 + 48);
    id v6 = @"SurroundInPunctuation.StraightDoubleQuote.Closing";
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"Text.PutDoubleCurlyQuotesAroundPhrase"])
  {
    double v3 = *(void **)(a1 + 40);
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    id v9 = [v2 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.CurlyDoubleQuote.Opening"];
    id v5 = *(void **)(a1 + 48);
    id v6 = @"SurroundInPunctuation.CurlyDoubleQuote.Closing";
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"Text.PutSingleQuotesAroundPhrase"])
  {
    double v3 = *(void **)(a1 + 40);
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    id v9 = [v2 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.StraightSingleQuote.Opening"];
    id v5 = *(void **)(a1 + 48);
    id v6 = @"SurroundInPunctuation.StraightSingleQuote.Closing";
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"Text.PutSingleCurlyQuotesAroundPhrase"])
  {
    double v3 = *(void **)(a1 + 40);
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    id v9 = [v2 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.CurlySingleQuote.Opening"];
    id v5 = *(void **)(a1 + 48);
    id v6 = @"SurroundInPunctuation.CurlySingleQuote.Closing";
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"Text.PutParenthesesAroundPhrase"])
  {
    double v3 = *(void **)(a1 + 40);
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    id v9 = [v2 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.Parenthesis.Opening"];
    id v5 = *(void **)(a1 + 48);
    id v6 = @"SurroundInPunctuation.Parenthesis.Closing";
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"Text.PutSquareBracketsAroundPhrase"])
  {
    double v3 = *(void **)(a1 + 40);
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    id v9 = [v2 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.SquareBracket.Opening"];
    id v5 = *(void **)(a1 + 48);
    id v6 = @"SurroundInPunctuation.SquareBracket.Closing";
  }
  else
  {
    if (![*(id *)(a1 + 32) isEqualToString:@"Text.PutCurlyBracesAroundPhrase"]) {
      return;
    }
    double v3 = *(void **)(a1 + 40);
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    id v9 = [v2 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.CurlyBrace.Opening"];
    id v5 = *(void **)(a1 + 48);
    id v6 = @"SurroundInPunctuation.CurlyBrace.Closing";
  }
  uint64_t v7 = [v5 _localizedPunctuationStringForIdentifier:v6];
  id v8 = [v2 _stringBySurroundingString:v4 withPrefixString:v9 suffixString:v7];
  [*(id *)(a1 + 48) delayAfterSelectionBeforeExecutingAction];
  objc_msgSend(v3, "performSelector:withObject:afterDelay:", sel_insertString_, v8);
}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_31(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setSelectionToTextMarkerRange:a2];
}

uint64_t __115__SRCSTextEditing_Selection__selectFromPhraseVariants_insertionString_range_recognizedParameters_commandIdentifer___block_invoke_32(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setSelectionToTextMarkerRange:a2];
}

- (id)_prunedStringsFromCandidateStrings:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  id v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = +[SRCSTextEditing wordsFromString:](SRCSTextEditing, "wordsFromString:", v11, (void)v14);
        if (![v5 count]
          || +[SRCSTextEditing doesArrayOfWords:v12 containArrayOfArrayWords:v5] == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v5 addObject:v12];
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v4;
}

- (int64_t)_indexOfFirstPhraseMatchResultPairBeforeInsertion:(BOOL)a3 fromArray:(id)a4
{
  BOOL v4 = a3;
  id v22 = a4;
  uint64_t v5 = [v22 count];
  if (v5 >= 2)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 1;
    BOOL v21 = v4;
    do
    {
      int64_t v8 = v7 - 1;
      uint64_t v9 = [v22 objectAtIndex:v7 - 1];
      id v10 = [v22 objectAtIndex:v7];
      uint64_t v11 = [v9 userInfo];
      uint64_t v12 = [v11 objectForKey:@"Context"];
      id v13 = v12;
      if (v4)
      {
        if (![v12 isEqualToString:@"Suffix"]) {
          goto LABEL_10;
        }
        long long v14 = [v10 userInfo];
        long long v15 = [v14 objectForKey:@"Context"];
        char v16 = [v15 isEqualToString:@"Prefix"];

        BOOL v4 = v21;
        if (v16) {
          goto LABEL_14;
        }
      }
      else
      {
        if (![v12 isEqualToString:@"Prefix"])
        {
LABEL_10:

          goto LABEL_11;
        }
        long long v17 = [v10 userInfo];
        uint64_t v18 = [v17 objectForKey:@"Context"];
        int v19 = [v18 isEqualToString:@"Suffix"];

        BOOL v4 = v21;
        if (v19)
        {
LABEL_14:

          goto LABEL_13;
        }
      }
LABEL_11:

      ++v7;
    }
    while (v6 != v7);
  }
  int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:

  return v8;
}

- (void)selectFromPhraseVariants:(id)a3 throughPhraseVariants:(id)a4 commandIdentifer:(id)a5
{
}

- (void)selectFromPhraseVariants:(id)a3 throughPhraseVariants:(id)a4 recognizedParameters:(id)a5 commandIdentifer:(id)a6
{
  uint64_t v181 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v123 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(SRCSTextEditing *)self provider];
  uint64_t v14 = [v13 searchGranularity];
  v115 = v13;
  long long v15 = [v13 selectionTextMarkerRange];
  uint64_t v16 = [v15 nsRange];
  unint64_t v18 = v17;

  v120 = v11;
  v118 = v12;
  if ([v12 isEqualToString:@"Text.SelectPrevious"])
  {
    int v19 = @"AXSelectTextAmbiguityResolutionClosestBeforeSelection";
  }
  else
  {
    int v20 = [v12 isEqualToString:@"Text.SelectNext"];
    v16 += v18 >> (v20 ^ 1u);
    int v19 = @"AXSelectTextAmbiguityResolutionClosestToSelection";
    if (v20) {
      int v19 = @"AXSelectTextAmbiguityResolutionClosestAfterSelection";
    }
  }
  v116 = v19;
  uint64_t v21 = [(SRCSTextEditing *)self _strippedPhraseStringsFromStrings:v10];
  id v22 = [(SRCSTextEditing *)self orderedPhraseMatchesFromStrings:v21 forwardDirection:0 referenceLocation:v16 substringSearchGranularity:v14];
  v121 = (void *)v21;
  id v23 = [(SRCSTextEditing *)self orderedPhraseMatchesFromStrings:v21 forwardDirection:1 referenceLocation:v16 substringSearchGranularity:v14];
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id v24 = v22;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v172 objects:v180 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v173;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v173 != v27) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v172 + 1) + 8 * i) setUserInfo:&unk_26EE31A98];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v172 objects:v180 count:16];
    }
    while (v26);
  }

  long long v170 = 0u;
  long long v171 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  id v29 = v23;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v168 objects:v179 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v169;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v169 != v32) {
          objc_enumerationMutation(v29);
        }
        [*(id *)(*((void *)&v168 + 1) + 8 * j) setUserInfo:&unk_26EE31AC0];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v168 objects:v179 count:16];
    }
    while (v31);
  }
  v119 = v10;

  uint64_t v34 = [(SRCSTextEditing *)self _strippedPhraseStringsFromStrings:v123];
  v35 = [(SRCSTextEditing *)self orderedPhraseMatchesFromStrings:v34 forwardDirection:0 referenceLocation:v16 substringSearchGranularity:v14];
  v124 = (void *)v34;
  v36 = [(SRCSTextEditing *)self orderedPhraseMatchesFromStrings:v34 forwardDirection:1 referenceLocation:v16 substringSearchGranularity:v14];
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  id v37 = v35;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v164 objects:v178 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v165;
    do
    {
      for (uint64_t k = 0; k != v39; ++k)
      {
        if (*(void *)v165 != v40) {
          objc_enumerationMutation(v37);
        }
        [*(id *)(*((void *)&v164 + 1) + 8 * k) setUserInfo:&unk_26EE31AE8];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v164 objects:v178 count:16];
    }
    while (v39);
  }

  long long v162 = 0u;
  long long v163 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  id v42 = v36;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v160 objects:v177 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v161;
    do
    {
      for (uint64_t m = 0; m != v44; ++m)
      {
        if (*(void *)v161 != v45) {
          objc_enumerationMutation(v42);
        }
        [*(id *)(*((void *)&v160 + 1) + 8 * m) setUserInfo:&unk_26EE31B10];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v160 objects:v177 count:16];
    }
    while (v44);
  }

  unsigned int v47 = objc_opt_new();
  if ([v24 count] && objc_msgSend(v37, "count"))
  {
    [v47 addObjectsFromArray:v24];
    [v47 addObjectsFromArray:v37];
    [v47 sortUsingComparator:&__block_literal_global];
  }
  id v48 = objc_opt_new();
  v49 = v121;
  if ([v29 count] && objc_msgSend(v42, "count"))
  {
    [v48 addObjectsFromArray:v29];
    [v48 addObjectsFromArray:v42];
    [v48 sortUsingComparator:&__block_literal_global_258];
  }
  v122 = v48;
  v50 = v124;
  v114 = v47;
  if (![(__CFString *)v116 isEqualToString:@"AXSelectTextAmbiguityResolutionClosestBeforeSelection"])
  {
    if ([(__CFString *)v116 isEqualToString:@"AXSelectTextAmbiguityResolutionClosestAfterSelection"])
    {
      int64_t v65 = [(SRCSTextEditing *)self _indexOfFirstPhraseMatchResultPairBeforeInsertion:0 fromArray:v122];
      if (v65 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_74;
      }
      int64_t v66 = v65;
      v67 = [v122 objectAtIndex:v65];
      id v68 = [v122 objectAtIndex:v66 + 1];
      v69 = [v68 markerRange];
      uint64_t v70 = [v69 nsRange];
      uint64_t v72 = v71;

      uint64_t v73 = [v67 location];
      uint64_t v74 = v70 + v72 - [v67 location];
      v146[0] = MEMORY[0x263EF8330];
      v146[1] = 3221225472;
      v146[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_4;
      v146[3] = &unk_264DC98F8;
      id v147 = v115;
      id v148 = v120;
      id v149 = v67;
      id v150 = v68;
      uint64_t v151 = v73;
      v61 = v115;
      v49 = v121;
      uint64_t v152 = v74;
      id v62 = v68;
      id v63 = v67;
      dispatch_async(MEMORY[0x263EF83A0], v146);

      v64 = v147;
    }
    else
    {
      int64_t v75 = [(SRCSTextEditing *)self _indexOfFirstPhraseMatchResultPairBeforeInsertion:1 fromArray:v47];
      if (v75 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v117 = -1;
      }
      else
      {
        v76 = [v47 objectAtIndex:v75];
        uint64_t v117 = v16 - [v76 location];
      }
      int64_t v77 = [(SRCSTextEditing *)self _indexOfFirstPhraseMatchResultPairBeforeInsertion:0 fromArray:v122];
      if (v77 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v78 = -1;
      }
      else
      {
        v79 = [v122 objectAtIndex:v77];
        uint64_t v78 = [v79 location] - v16;
      }
      v50 = v124;
      if ([v24 count] && objc_msgSend(v42, "count"))
      {
        v113 = [v24 firstObject];
        v112 = [v113 userInfo];
        id v80 = [v112 objectForKey:@"Context"];
        if ([v80 isEqualToString:@"Prefix"])
        {
          v111 = [v42 firstObject];
          v109 = [v111 userInfo];
          v81 = [v109 objectForKey:@"Context"];
          int v110 = [v81 isEqualToString:@"Suffix"];

          v50 = v124;
          if (v110)
          {
            id v82 = [v24 firstObject];
            uint64_t v83 = v16 - [v82 location];

            v50 = v124;
            if ((v83 & 0x8000000000000000) == 0)
            {
              if (v117 == -1
                || (v83 < v117 ? (BOOL v84 = v117 <= -1) : (BOOL v84 = 1),
                    !v84 || v78 == -1 || (v78 & 0x8000000000000000) == 0 && v83 < v78))
              {
                v85 = [v24 firstObject];
                id v86 = [v42 firstObject];
                v87 = [v86 markerRange];
                uint64_t v88 = [v87 nsRange];
                uint64_t v90 = v89;

                uint64_t v91 = [v85 location];
                uint64_t v92 = v88 + v90 - [v85 location];
                v139[0] = MEMORY[0x263EF8330];
                v139[1] = 3221225472;
                v139[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_5;
                v139[3] = &unk_264DC98F8;
                id v140 = v115;
                id v141 = v120;
                id v142 = v85;
                id v143 = v86;
                uint64_t v144 = v91;
                v61 = v115;
                uint64_t v145 = v92;
                id v62 = v86;
                id v63 = v85;
                dispatch_async(MEMORY[0x263EF83A0], v139);

                v64 = v140;
                v49 = v121;
                goto LABEL_75;
              }
            }
          }
        }
        else
        {
        }
      }
      if ((v117 & 0x8000000000000000) == 0 && (v78 == -1 || (v78 & 0x8000000000000000) == 0 && v117 < v78))
      {
        unsigned int v47 = v114;
        id v93 = [v114 objectAtIndex:v75];
        v94 = [v114 objectAtIndex:v75 + 1];
        v95 = [v93 markerRange];
        uint64_t v96 = [v95 nsRange];
        uint64_t v98 = v97;

        uint64_t v99 = [v94 location];
        uint64_t v100 = v96 + v98 - [v94 location];
        v132[0] = MEMORY[0x263EF8330];
        v132[1] = 3221225472;
        v132[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_6;
        v132[3] = &unk_264DC98F8;
        id v133 = v115;
        id v134 = v120;
        id v135 = v94;
        id v136 = v93;
        uint64_t v137 = v99;
        v61 = v115;
        uint64_t v138 = v100;
        id v62 = v93;
        id v63 = v94;
        dispatch_async(MEMORY[0x263EF83A0], v132);

        v64 = v133;
        v49 = v121;
        goto LABEL_76;
      }
      v49 = v121;
      if (v78 < 0) {
        goto LABEL_74;
      }
      id v101 = [v122 objectAtIndex:v77];
      v102 = [v122 objectAtIndex:v77 + 1];
      id v103 = [v102 markerRange];
      uint64_t v104 = [v103 nsRange];
      uint64_t v106 = v105;

      uint64_t v107 = [v101 location];
      uint64_t v108 = v104 + v106 - [v101 location];
      v125[0] = MEMORY[0x263EF8330];
      v125[1] = 3221225472;
      v125[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_7;
      v125[3] = &unk_264DC98F8;
      id v126 = v115;
      id v127 = v120;
      id v128 = v101;
      id v129 = v102;
      uint64_t v130 = v107;
      v61 = v115;
      v49 = v121;
      uint64_t v131 = v108;
      id v62 = v102;
      id v63 = v101;
      dispatch_async(MEMORY[0x263EF83A0], v125);

      v64 = v126;
    }
LABEL_75:
    unsigned int v47 = v114;
    goto LABEL_76;
  }
  int64_t v51 = [(SRCSTextEditing *)self _indexOfFirstPhraseMatchResultPairBeforeInsertion:1 fromArray:v47];
  if (v51 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_74:
    id v63 = [v49 firstObject];
    v176[0] = v63;
    id v62 = [v50 firstObject];
    v176[1] = v62;
    v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v176 count:2];
    v61 = v115;
    [v115 handleErrorIdentifier:@"ErrorMessage.TextThroughTextNotFound" withObjects:v64];
    goto LABEL_75;
  }
  int64_t v52 = v51;
  id v53 = [v47 objectAtIndex:v51];
  v54 = [v47 objectAtIndex:v52 + 1];
  id v55 = [v53 markerRange];
  uint64_t v56 = [v55 nsRange];
  uint64_t v58 = v57;

  uint64_t v59 = [v54 location];
  uint64_t v60 = v56 + v58 - [v54 location];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_3;
  block[3] = &unk_264DC98F8;
  v61 = v115;
  id v154 = v115;
  id v155 = v120;
  id v156 = v54;
  id v157 = v53;
  uint64_t v158 = v59;
  uint64_t v159 = v60;
  v49 = v121;
  id v62 = v53;
  id v63 = v54;
  dispatch_async(MEMORY[0x263EF83A0], block);

  v64 = v154;
LABEL_76:
}

BOOL __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 location];
  uint64_t v6 = [v4 location];

  return v5 < v6;
}

BOOL __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 location];
  uint64_t v6 = [v4 location];

  return v5 > v6;
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_3(uint64_t a1)
{
  v11[2] = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) matchedString];
    if ([v4 length])
    {
      v10[0] = kSRCSCommandParameterDictation[0];
      uint64_t v5 = [*(id *)(a1 + 48) matchedString];
      v11[0] = v5;
      v10[1] = kSRCSCommandParameterDictation2[0];
      uint64_t v6 = [*(id *)(a1 + 56) matchedString];
      v11[1] = v6;
      uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
      [v2 handleSearchResultsWithRecognizedCommandParameters:v3 variantOverrides:v7];
    }
    else
    {
      [v2 handleSearchResultsWithRecognizedCommandParameters:v3 variantOverrides:0];
    }
  }
  int64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "textMarkerRangeClass"), "markerRangeWithNSRange:", *(void *)(a1 + 64), *(void *)(a1 + 72));
  [v8 setSelectionToTextMarkerRange:v9];
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_4(uint64_t a1)
{
  v11[2] = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) matchedString];
    if ([v4 length])
    {
      v10[0] = kSRCSCommandParameterDictation[0];
      uint64_t v5 = [*(id *)(a1 + 48) matchedString];
      v11[0] = v5;
      v10[1] = kSRCSCommandParameterDictation2[0];
      uint64_t v6 = [*(id *)(a1 + 56) matchedString];
      v11[1] = v6;
      uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
      [v2 handleSearchResultsWithRecognizedCommandParameters:v3 variantOverrides:v7];
    }
    else
    {
      [v2 handleSearchResultsWithRecognizedCommandParameters:v3 variantOverrides:0];
    }
  }
  int64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "textMarkerRangeClass"), "markerRangeWithNSRange:", *(void *)(a1 + 64), *(void *)(a1 + 72));
  [v8 setSelectionToTextMarkerRange:v9];
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_5(uint64_t a1)
{
  v11[2] = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) matchedString];
    if ([v4 length])
    {
      v10[0] = kSRCSCommandParameterDictation[0];
      uint64_t v5 = [*(id *)(a1 + 48) matchedString];
      v11[0] = v5;
      v10[1] = kSRCSCommandParameterDictation2[0];
      uint64_t v6 = [*(id *)(a1 + 56) matchedString];
      v11[1] = v6;
      uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
      [v2 handleSearchResultsWithRecognizedCommandParameters:v3 variantOverrides:v7];
    }
    else
    {
      [v2 handleSearchResultsWithRecognizedCommandParameters:v3 variantOverrides:0];
    }
  }
  int64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "textMarkerRangeClass"), "markerRangeWithNSRange:", *(void *)(a1 + 64), *(void *)(a1 + 72));
  [v8 setSelectionToTextMarkerRange:v9];
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_6(uint64_t a1)
{
  v11[2] = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) matchedString];
    if ([v4 length])
    {
      v10[0] = kSRCSCommandParameterDictation[0];
      uint64_t v5 = [*(id *)(a1 + 48) matchedString];
      v11[0] = v5;
      v10[1] = kSRCSCommandParameterDictation2[0];
      uint64_t v6 = [*(id *)(a1 + 56) matchedString];
      v11[1] = v6;
      uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
      [v2 handleSearchResultsWithRecognizedCommandParameters:v3 variantOverrides:v7];
    }
    else
    {
      [v2 handleSearchResultsWithRecognizedCommandParameters:v3 variantOverrides:0];
    }
  }
  int64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "textMarkerRangeClass"), "markerRangeWithNSRange:", *(void *)(a1 + 64), *(void *)(a1 + 72));
  [v8 setSelectionToTextMarkerRange:v9];
}

void __115__SRCSTextEditing_Selection__selectFromPhraseVariants_throughPhraseVariants_recognizedParameters_commandIdentifer___block_invoke_7(uint64_t a1)
{
  v11[2] = *MEMORY[0x263EF8340];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) matchedString];
    if ([v4 length])
    {
      v10[0] = kSRCSCommandParameterDictation[0];
      uint64_t v5 = [*(id *)(a1 + 48) matchedString];
      v11[0] = v5;
      v10[1] = kSRCSCommandParameterDictation2[0];
      uint64_t v6 = [*(id *)(a1 + 56) matchedString];
      v11[1] = v6;
      uint64_t v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
      [v2 handleSearchResultsWithRecognizedCommandParameters:v3 variantOverrides:v7];
    }
    else
    {
      [v2 handleSearchResultsWithRecognizedCommandParameters:v3 variantOverrides:0];
    }
  }
  int64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = objc_msgSend((id)objc_msgSend(v8, "textMarkerRangeClass"), "markerRangeWithNSRange:", *(void *)(a1 + 64), *(void *)(a1 + 72));
  [v8 setSelectionToTextMarkerRange:v9];
}

- (void)selectFromRange:(id)a3 insertionString:(id)a4 commandIdentifier:(id)a5 recognizedParamaters:(id)a6
{
  if (a3) {
    [(SRCSTextEditing *)self selectFromPhraseVariants:MEMORY[0x263EFFA68] insertionString:a4 range:a3 recognizedParameters:a6 commandIdentifer:a5];
  }
}

- (void)selectAll
{
  uint64_t v3 = [(SRCSTextEditing *)self provider];
  id v4 = [v3 selectionTextMarkerRange];
  uint64_t v5 = [v3 stringForTextMarkerRange:v4];

  if ([v5 length])
  {
    [(SRCSTextEditing *)self moveToStartOfTextArea];
    dispatch_time_t v6 = dispatch_time(0, 250000000);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __39__SRCSTextEditing_Selection__selectAll__block_invoke_2;
    v10[3] = &unk_264DC9888;
    uint64_t v7 = &v11;
    id v11 = v3;
    id v8 = v3;
    dispatch_after(v6, MEMORY[0x263EF83A0], v10);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__SRCSTextEditing_Selection__selectAll__block_invoke;
    block[3] = &unk_264DC9888;
    uint64_t v7 = &v13;
    id v13 = v3;
    id v9 = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __39__SRCSTextEditing_Selection__selectAll__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performTextSelectAll];
}

uint64_t __39__SRCSTextEditing_Selection__selectAll__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performTextSelectAll];
}

- (void)selectPreviousTextInsertion
{
  uint64_t v3 = [(SRCSTextEditing *)self provider];
  id v4 = [v3 selectionTextMarkerRange];

  if ([(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v4])
  {
    uint64_t v5 = v4;
  }
  else
  {
    dispatch_time_t v6 = [(SRCSTextEditing *)self provider];
    id v8 = [v6 textMarkerRangeFromPreviousTextInsertion];

    if ([(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v8])
    {
      uint64_t v7 = [(SRCSTextEditing *)self provider];
      [v7 setSelectionToTextMarkerRange:v8];
    }
    uint64_t v5 = v8;
  }
}

- (void)surroundSelectionWithPunctuationForCommandIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  dispatch_time_t v6 = [v5 selectionTextMarkerRange];
  [v5 setCompletionDeterminedManually:1];
  if ([(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v6])
  {
    int64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [v5 textMarkerRangeFromPreviousTextInsertion];

    if ([(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v8])
    {
      [v5 setSelectionToTextMarkerRange:v8];
      [(SRCSTextEditing *)self delayAfterSelectionBeforeExecutingAction];
      int64_t v7 = (uint64_t)(v9 * 1000000000.0);
    }
    else
    {
      int64_t v7 = 0;
    }
    dispatch_time_t v6 = (void *)v8;
  }
  id v10 = [v5 stringForTextMarkerRange:v6];
  if ([v10 length])
  {
    if ([v4 isEqualToString:@"Text.PutDoubleQuotesAroundSelection"])
    {
      dispatch_time_t v11 = dispatch_time(0, v7);
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke;
      v34[3] = &unk_264DC97C0;
      id v12 = (id *)v35;
      v35[0] = v5;
      v35[1] = self;
      id v13 = &v36;
      id v36 = v10;
      uint64_t v14 = MEMORY[0x263EF83A0];
      long long v15 = v34;
LABEL_22:
      dispatch_after(v11, v14, v15);

      goto LABEL_23;
    }
    if ([v4 isEqualToString:@"Text.PutDoubleCurlyQuotesAroundSelection"])
    {
      dispatch_time_t v11 = dispatch_time(0, v7);
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_2;
      v31[3] = &unk_264DC97C0;
      id v12 = (id *)v32;
      v32[0] = v5;
      v32[1] = self;
      id v13 = &v33;
      id v33 = v10;
      uint64_t v14 = MEMORY[0x263EF83A0];
      long long v15 = v31;
      goto LABEL_22;
    }
    if ([v4 isEqualToString:@"Text.PutSingleQuotesAroundSelection"])
    {
      dispatch_time_t v11 = dispatch_time(0, v7);
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_3;
      v28[3] = &unk_264DC97C0;
      id v12 = (id *)v29;
      v29[0] = v5;
      v29[1] = self;
      id v13 = &v30;
      id v30 = v10;
      uint64_t v14 = MEMORY[0x263EF83A0];
      long long v15 = v28;
      goto LABEL_22;
    }
    if ([v4 isEqualToString:@"Text.PutSingleCurlyQuotesAroundSelection"])
    {
      dispatch_time_t v11 = dispatch_time(0, v7);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_4;
      v25[3] = &unk_264DC97C0;
      id v12 = (id *)v26;
      v26[0] = v5;
      v26[1] = self;
      id v13 = &v27;
      id v27 = v10;
      uint64_t v14 = MEMORY[0x263EF83A0];
      long long v15 = v25;
      goto LABEL_22;
    }
    if ([v4 isEqualToString:@"Text.PutParenthesesAroundSelection"])
    {
      dispatch_time_t v11 = dispatch_time(0, v7);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_5;
      v22[3] = &unk_264DC97C0;
      id v12 = (id *)v23;
      v23[0] = v5;
      v23[1] = self;
      id v13 = &v24;
      id v24 = v10;
      uint64_t v14 = MEMORY[0x263EF83A0];
      long long v15 = v22;
      goto LABEL_22;
    }
    if ([v4 isEqualToString:@"Text.PutSquareBracketsAroundSelection"])
    {
      dispatch_time_t v11 = dispatch_time(0, v7);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_6;
      v19[3] = &unk_264DC97C0;
      id v12 = (id *)v20;
      v20[0] = v5;
      v20[1] = self;
      id v13 = &v21;
      id v21 = v10;
      uint64_t v14 = MEMORY[0x263EF83A0];
      long long v15 = v19;
      goto LABEL_22;
    }
    if ([v4 isEqualToString:@"Text.PutCurlyBracesAroundSelection"])
    {
      dispatch_time_t v11 = dispatch_time(0, v7);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_7;
      block[3] = &unk_264DC97C0;
      id v12 = (id *)v17;
      v17[0] = v5;
      v17[1] = self;
      id v13 = &v18;
      id v18 = v10;
      uint64_t v14 = MEMORY[0x263EF83A0];
      long long v15 = block;
      goto LABEL_22;
    }
  }
LABEL_23:
}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke(uint64_t a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([*(id *)(a1 + 32) targetApplicationBundleIdentifier],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 hasPrefix:@"com.microsoft."],
        v2,
        v3))
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.StraightDoubleQuote.Opening"];
    [v4 insertString:v5];

    [*(id *)(a1 + 32) insertString:*(void *)(a1 + 48)];
    dispatch_time_t v6 = *(void **)(a1 + 32);
    int64_t v7 = [*(id *)(a1 + 40) _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.StraightDoubleQuote.Closing"];
    [v6 insertString:v7];
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    double v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    int64_t v7 = [v9 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.StraightDoubleQuote.Opening"];
    dispatch_time_t v11 = [*(id *)(a1 + 40) _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.StraightDoubleQuote.Closing"];
    id v12 = [v9 _stringBySurroundingString:v10 withPrefixString:v7 suffixString:v11];
    [v8 insertString:v12];
  }
  id v13 = *(void **)(a1 + 32);
  return [v13 setExecuting:0];
}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [v3 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.CurlyDoubleQuote.Opening"];
  dispatch_time_t v6 = [*(id *)(a1 + 40) _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.CurlyDoubleQuote.Closing"];
  int64_t v7 = [v3 _stringBySurroundingString:v4 withPrefixString:v5 suffixString:v6];
  [v2 insertString:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  return [v8 setExecuting:0];
}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_3(uint64_t a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([*(id *)(a1 + 32) targetApplicationBundleIdentifier],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 hasPrefix:@"com.microsoft."],
        v2,
        v3))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.StraightSingleQuote.Opening"];
    [v4 insertString:v5];

    [*(id *)(a1 + 32) insertString:*(void *)(a1 + 48)];
    dispatch_time_t v6 = *(void **)(a1 + 32);
    int64_t v7 = [*(id *)(a1 + 40) _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.StraightSingleQuote.Closing"];
    [v6 insertString:v7];
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    double v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    int64_t v7 = [v9 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.StraightSingleQuote.Opening"];
    dispatch_time_t v11 = [*(id *)(a1 + 40) _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.StraightSingleQuote.Closing"];
    id v12 = [v9 _stringBySurroundingString:v10 withPrefixString:v7 suffixString:v11];
    [v8 insertString:v12];
  }
  id v13 = *(void **)(a1 + 32);
  return [v13 setExecuting:0];
}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [v3 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.CurlySingleQuote.Opening"];
  dispatch_time_t v6 = [*(id *)(a1 + 40) _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.CurlySingleQuote.Closing"];
  int64_t v7 = [v3 _stringBySurroundingString:v4 withPrefixString:v5 suffixString:v6];
  [v2 insertString:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  return [v8 setExecuting:0];
}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [v3 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.Parenthesis.Opening"];
  dispatch_time_t v6 = [*(id *)(a1 + 40) _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.Parenthesis.Closing"];
  int64_t v7 = [v3 _stringBySurroundingString:v4 withPrefixString:v5 suffixString:v6];
  [v2 insertString:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  return [v8 setExecuting:0];
}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [v3 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.SquareBracket.Opening"];
  dispatch_time_t v6 = [*(id *)(a1 + 40) _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.SquareBracket.Closing"];
  int64_t v7 = [v3 _stringBySurroundingString:v4 withPrefixString:v5 suffixString:v6];
  [v2 insertString:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  return [v8 setExecuting:0];
}

uint64_t __83__SRCSTextEditing_Selection__surroundSelectionWithPunctuationForCommandIdentifier___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = [v3 _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.CurlyBrace.Opening"];
  dispatch_time_t v6 = [*(id *)(a1 + 40) _localizedPunctuationStringForIdentifier:@"SurroundInPunctuation.CurlyBrace.Closing"];
  int64_t v7 = [v3 _stringBySurroundingString:v4 withPrefixString:v5 suffixString:v6];
  [v2 insertString:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  return [v8 setExecuting:0];
}

- (void)applyFormatWithCommandIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  dispatch_time_t v6 = [v5 selectionTextMarkerRange];
  [v5 setCompletionDeterminedManually:1];
  if ([(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v6])
  {
    int64_t v7 = 0;
  }
  else
  {
    uint64_t v8 = [v5 textMarkerRangeFromPreviousTextInsertion];

    if ([(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v8])
    {
      [v5 setSelectionToTextMarkerRange:v8];
      [(SRCSTextEditing *)self delayAfterSelectionBeforeExecutingAction];
      int64_t v7 = (uint64_t)(v9 * 1000000000.0);
    }
    else
    {
      int64_t v7 = 0;
    }
    dispatch_time_t v6 = (void *)v8;
  }
  uint64_t v10 = [v5 stringForTextMarkerRange:v6];
  if ([v10 length])
  {
    if ([v4 isEqualToString:@"Text.CapitalizeSelection"])
    {
      dispatch_time_t v11 = dispatch_time(0, v7);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke;
      block[3] = &unk_264DC97C0;
      id v12 = (id *)v32;
      v32[0] = v5;
      v32[1] = self;
      id v33 = v10;
      dispatch_after(v11, MEMORY[0x263EF83A0], block);
      id v13 = v33;
    }
    else if ([v4 isEqualToString:@"Text.LowercaseSelection"])
    {
      dispatch_time_t v14 = dispatch_time(0, v7);
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_2;
      v28[3] = &unk_264DC9810;
      id v12 = &v29;
      id v29 = v5;
      id v30 = v10;
      dispatch_after(v14, MEMORY[0x263EF83A0], v28);
      id v13 = v30;
    }
    else
    {
      if (![v4 isEqualToString:@"Text.UppercaseSelection"])
      {
        if ([v4 isEqualToString:@"Text.FormatBold"])
        {
          dispatch_time_t v16 = dispatch_time(0, v7);
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          void v23[2] = __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_4;
          v23[3] = &unk_264DC9888;
          id v12 = &v24;
          id v24 = v5;
          unint64_t v17 = MEMORY[0x263EF83A0];
          id v18 = v23;
        }
        else if ([v4 isEqualToString:@"Text.FormatItalic"])
        {
          dispatch_time_t v16 = dispatch_time(0, v7);
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_5;
          v21[3] = &unk_264DC9888;
          id v12 = &v22;
          id v22 = v5;
          unint64_t v17 = MEMORY[0x263EF83A0];
          id v18 = v21;
        }
        else
        {
          if (![v4 isEqualToString:@"Text.FormatUnderline"]) {
            goto LABEL_16;
          }
          dispatch_time_t v16 = dispatch_time(0, v7);
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          v19[2] = __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_6;
          v19[3] = &unk_264DC9888;
          id v12 = &v20;
          id v20 = v5;
          unint64_t v17 = MEMORY[0x263EF83A0];
          id v18 = v19;
        }
        dispatch_after(v16, v17, v18);
        goto LABEL_15;
      }
      dispatch_time_t v15 = dispatch_time(0, v7);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_3;
      v25[3] = &unk_264DC9810;
      id v12 = &v26;
      id v26 = v5;
      id v27 = v10;
      dispatch_after(v15, MEMORY[0x263EF83A0], v25);
      id v13 = v27;
    }

LABEL_15:
  }
LABEL_16:
}

uint64_t __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) _capitalizedStringFromString:*(void *)(a1 + 48)];
  [v2 insertString:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 setExecuting:0];
}

uint64_t __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) lowercaseString];
  [v2 insertString:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 setExecuting:0];
}

uint64_t __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  int v3 = [*(id *)(a1 + 40) uppercaseString];
  [v2 insertString:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 setExecuting:0];
}

uint64_t __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) formatSelectionBold];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setExecuting:0];
}

uint64_t __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) formatSelectionItalics];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setExecuting:0];
}

uint64_t __63__SRCSTextEditing_Selection__applyFormatWithCommandIdentifier___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) formatSelectionUnderline];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setExecuting:0];
}

- (void)pasteboardPaste
{
  id v2 = [(SRCSTextEditing *)self provider];
  [v2 performTextPaste];
}

- (void)pasteboardCopy
{
  int v3 = [(SRCSTextEditing *)self provider];
  id v4 = [v3 selectionTextMarkerRange];
  if ([(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v4])
  {
    [v3 performTextCopy];
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = [v3 textMarkerRangeFromPreviousTextInsertion];

    if ([(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v5])
    {
      [v3 setCompletionDeterminedManually:1];
      [v3 setSelectionToTextMarkerRange:v5];
      [(SRCSTextEditing *)self delayAfterSelectionBeforeExecutingAction];
      dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __44__SRCSTextEditing_Selection__pasteboardCopy__block_invoke;
      block[3] = &unk_264DC9888;
      id v9 = v3;
      dispatch_after(v7, MEMORY[0x263EF83A0], block);
    }
    else
    {
      [v3 performTextCopy];
    }
  }
}

uint64_t __44__SRCSTextEditing_Selection__pasteboardCopy__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) performTextCopy];
  id v2 = *(void **)(a1 + 32);
  return [v2 setExecuting:0];
}

- (void)pasteboardCut
{
  int v3 = [(SRCSTextEditing *)self provider];
  id v4 = [v3 selectionTextMarkerRange];
  if ([(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v4])
  {
    [v3 performTextCut];
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = [v3 textMarkerRangeFromPreviousTextInsertion];

    if ([(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v5])
    {
      [v3 setCompletionDeterminedManually:1];
      [v3 setSelectionToTextMarkerRange:v5];
      [(SRCSTextEditing *)self delayAfterSelectionBeforeExecutingAction];
      dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __43__SRCSTextEditing_Selection__pasteboardCut__block_invoke;
      block[3] = &unk_264DC9888;
      id v9 = v3;
      dispatch_after(v7, MEMORY[0x263EF83A0], block);
    }
    else
    {
      [v3 performTextCut];
    }
  }
}

uint64_t __43__SRCSTextEditing_Selection__pasteboardCut__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) performTextCut];
  id v2 = *(void **)(a1 + 32);
  return [v2 setExecuting:0];
}

- (void)correctSelection
{
  int v3 = [(SRCSTextEditing *)self provider];
  id v4 = [v3 selectionTextMarkerRange];
  if ([(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v4])
  {
    [v3 handleCorrectionRequestWithStrings:0];
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = [v3 textMarkerRangeFromPreviousTextInsertion];

    if ([(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v5])
    {
      [v3 setCompletionDeterminedManually:1];
      [v3 setSelectionToTextMarkerRange:v5];
      [(SRCSTextEditing *)self delayAfterSelectionBeforeExecutingAction];
      dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __46__SRCSTextEditing_Selection__correctSelection__block_invoke;
      block[3] = &unk_264DC9888;
      id v9 = v3;
      dispatch_after(v7, MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __46__SRCSTextEditing_Selection__correctSelection__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = [v2 nBestListFromPreviousTextInsertion];
  [v2 handleCorrectionRequestWithStrings:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 setExecuting:0];
}

- (id)_strippedPhraseStringsFromStrings:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v20 = [MEMORY[0x263EFF980] array];
  int v19 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v9 = [&unk_26EE31B38 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (!v9) {
          goto LABEL_17;
        }
        uint64_t v10 = v9;
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v22;
        do
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(&unk_26EE31B38);
            }
            dispatch_time_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
            if ([v8 hasPrefix:v14]) {
              uint64_t v11 = [v14 length];
            }
          }
          uint64_t v10 = [&unk_26EE31B38 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v10);
        if (v11)
        {
          dispatch_time_t v15 = [v8 substringFromIndex:v11];
          dispatch_time_t v16 = [v15 stringByTrimmingCharactersInSet:v19];
          [v20 addObject:v16];
        }
        else
        {
LABEL_17:
          dispatch_time_t v15 = [v8 stringByTrimmingCharactersInSet:v19];
          [v20 addObject:v15];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }

  return v20;
}

- (id)_capitalizedStringFromString:(id)a3
{
  id v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  uint64_t v5 = [v3 mainBundle];
  uint64_t v6 = [v5 preferredLocalizations];
  dispatch_time_t v7 = [v6 objectAtIndex:0];

  uint64_t v8 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v7];
  uint64_t v9 = [MEMORY[0x263F089D8] stringWithString:v4];
  uint64_t v10 = [v4 length];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__SRCSTextEditing_Selection___capitalizedStringFromString___block_invoke;
  v16[3] = &unk_264DC9920;
  id v17 = v8;
  id v11 = v9;
  id v18 = v11;
  id v12 = v8;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 3, v16);

  id v13 = v18;
  id v14 = v11;

  return v14;
}

void __59__SRCSTextEditing_Selection___capitalizedStringFromString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = [a2 capitalizedStringWithLocale:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", a3, a4, v7);
}

- (id)_stringBySurroundingString:(id)a3 withPrefixString:(id)a4 suffixString:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  id v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v12 = [v10 rangeOfCharacterFromSet:v11];
  unint64_t v14 = v13;

  if (v12) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v14 == 0;
  }
  if (v15 || v14 >= [v10 length])
  {
    dispatch_time_t v16 = &stru_26EE2ED18;
    id v17 = v10;
  }
  else
  {
    objc_msgSend(v10, "substringWithRange:", v12, v14);
    dispatch_time_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v17 = [v10 substringFromIndex:v14];
  }
  id v18 = [NSString stringWithFormat:@"%@%@%@%@", v16, v8, v17, v9];

  return v18;
}

- (void)_insertComponentsIndividuallyBySurroundingString:(id)a3 withPrefixString:(id)a4 suffixString:(id)a5 retainedProvider:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v25 = v10;
  uint64_t v12 = (void *)MEMORY[0x263F08708];
  id v13 = a5;
  id v14 = a4;
  BOOL v15 = [v12 whitespaceAndNewlineCharacterSet];
  uint64_t v16 = [v25 rangeOfCharacterFromSet:v15];
  unint64_t v18 = v17;

  if (v16) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = v18 == 0;
  }
  if (v19 || v18 >= [v25 length])
  {
    id v20 = &stru_26EE2ED18;
    long long v21 = v25;
  }
  else
  {
    objc_msgSend(v25, "substringWithRange:", v16, v18);
    id v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    long long v21 = [v25 substringFromIndex:v18];
  }
  if ([(__CFString *)v20 length])
  {
    [(SRCSTextEditing *)self delayAfterSelectionBeforeExecutingAction];
    objc_msgSend(v11, "performSelector:withObject:afterDelay:", sel_insertString_, v20);
  }
  [(SRCSTextEditing *)self delayAfterSelectionBeforeExecutingAction];
  [v11 performSelector:sel_insertString_ withObject:v14 afterDelay:v22 + 0.01];

  [(SRCSTextEditing *)self delayAfterSelectionBeforeExecutingAction];
  [v11 performSelector:sel_insertString_ withObject:v21 afterDelay:v23 + 0.02];
  [(SRCSTextEditing *)self delayAfterSelectionBeforeExecutingAction];
  [v11 performSelector:sel_insertString_ withObject:v13 afterDelay:v24 + 0.03];
}

- (id)_localizedPunctuationStringForIdentifier:(id)a3
{
  id v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  uint64_t v5 = [v3 bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:v4 value:&stru_26EE2ED18 table:0];

  return v6;
}

- (SRCSTextEditing)init
{
  v3.receiver = self;
  v3.super_class = (Class)SRCSTextEditing;
  result = [(SRCSTextEditing *)&v3 init];
  if (result) {
    result->_delayAfterSelectionBeforeExecutingAction = 0.125;
  }
  return result;
}

- (unint64_t)characterLengthOfTextMarkerRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SRCSTextEditing *)self provider];
    id v8 = [v4 startMarker];
    id v9 = [v4 endMarker];
    unint64_t v10 = [v7 lengthFromMarker:v8 toMarker:v9];
  }
  else
  {
    [v4 nsRange];
    unint64_t v10 = v11;
  }

  return v10;
}

- (SRCSTextEditingProviderProtocol)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (SRCSTextEditingProviderProtocol *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (double)delayAfterSelectionBeforeExecutingAction
{
  return self->_delayAfterSelectionBeforeExecutingAction;
}

- (void)setDelayAfterSelectionBeforeExecutingAction:(double)a3
{
  self->_delayAfterSelectionBeforeExecutingAction = a3;
}

- (void).cxx_destruct
{
}

- (void)moveToStartOfTextArea
{
  id v10 = [(SRCSTextEditing *)self provider];
  objc_super v3 = [(SRCSTextEditing *)self provider];
  id v4 = (void *)[v3 textMarkerRangeClass];
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  char v6 = [v5 firstPositionTextMarker];
  id v7 = [(SRCSTextEditing *)self provider];
  id v8 = [v7 firstPositionTextMarker];
  id v9 = [v4 markerRangeWithStartMarker:v6 endMarker:v8];
  [v10 setSelectionToTextMarkerRange:v9];
}

- (void)moveToEndOfTextArea
{
  id v10 = [(SRCSTextEditing *)self provider];
  objc_super v3 = [(SRCSTextEditing *)self provider];
  id v4 = (void *)[v3 textMarkerRangeClass];
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  char v6 = [v5 lastPositionTextMarker];
  id v7 = [(SRCSTextEditing *)self provider];
  id v8 = [v7 lastPositionTextMarker];
  id v9 = [v4 markerRangeWithStartMarker:v6 endMarker:v8];
  [v10 setSelectionToTextMarkerRange:v9];
}

- (void)moveToStartOfSelection
{
  objc_super v3 = [(SRCSTextEditing *)self provider];
  id v10 = [v3 selectionTextMarkerRange];

  if (v10)
  {
    id v4 = [(SRCSTextEditing *)self provider];
    uint64_t v5 = [(SRCSTextEditing *)self provider];
    char v6 = (void *)[v5 textMarkerRangeClass];
    id v7 = [v10 startMarker];
    id v8 = [v10 startMarker];
    id v9 = [v6 markerRangeWithStartMarker:v7 endMarker:v8];
    [v4 setSelectionToTextMarkerRange:v9];
  }
}

- (void)moveToEndOfSelection
{
  objc_super v3 = [(SRCSTextEditing *)self provider];
  id v10 = [v3 selectionTextMarkerRange];

  if (v10)
  {
    id v4 = [(SRCSTextEditing *)self provider];
    uint64_t v5 = [(SRCSTextEditing *)self provider];
    char v6 = (void *)[v5 textMarkerRangeClass];
    id v7 = [v10 endMarker];
    id v8 = [v10 endMarker];
    id v9 = [v6 markerRangeWithStartMarker:v7 endMarker:v8];
    [v4 setSelectionToTextMarkerRange:v9];
  }
}

- (void)moveToStartOfWordWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v12 = [v5 markerRangeForEnumerationType:3 desiredBlock:1 count:a3 options:0];

  if (v12)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v12 startMarker];
    id v10 = [v12 startMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
  }
}

- (void)moveToEndOfWordWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v12 = [v5 markerRangeForEnumerationType:3 desiredBlock:1 count:a3 options:0];

  if (v12)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v12 endMarker];
    id v10 = [v12 endMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
  }
}

- (void)moveToStartOfSentenceWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v12 = [v5 markerRangeForEnumerationType:4 desiredBlock:1 count:a3 options:0];

  if (v12)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v12 startMarker];
    id v10 = [v12 startMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
  }
}

- (void)moveToEndOfSentenceWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v12 = [v5 markerRangeForEnumerationType:4 desiredBlock:1 count:a3 options:1];

  if (v12)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v12 endMarker];
    id v10 = [v12 endMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
  }
}

- (void)moveToStartOfParagraphWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v12 = [v5 markerRangeForEnumerationType:1 desiredBlock:1 count:a3 options:0];

  if (v12)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v12 startMarker];
    id v10 = [v12 startMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
  }
}

- (void)moveToEndOfParagraphWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v12 = [v5 markerRangeForEnumerationType:1 desiredBlock:1 count:a3 options:1];

  if (v12)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v12 endMarker];
    id v10 = [v12 endMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
  }
}

- (void)moveToStartOfLineWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v12 = [v5 markerRangeForEnumerationType:0 desiredBlock:1 count:a3 options:0];

  if (v12)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v12 startMarker];
    id v10 = [v12 startMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
  }
}

- (void)moveToEndOfLineWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v12 = [v5 markerRangeForEnumerationType:0 desiredBlock:1 count:a3 options:1];

  if (v12)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    id v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v12 endMarker];
    id v10 = [v12 endMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
  }
}

- (void)moveForwardCharactersWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  char v6 = v5;
  if (a3 > 0) {
    int64_t v7 = a3 + 1;
  }
  else {
    int64_t v7 = 2;
  }
  id v18 = [v5 markerRangeForEnumerationType:2 desiredBlock:0 count:v7 options:0];

  id v8 = [(SRCSTextEditing *)self provider];
  if (v18)
  {
    id v9 = [(SRCSTextEditing *)self provider];
    id v10 = (void *)[v9 textMarkerRangeClass];
    unint64_t v11 = [v18 startMarker];
    id v12 = [v18 startMarker];
    id v13 = [v10 markerRangeWithStartMarker:v11 endMarker:v12];
    [v8 setSelectionToTextMarkerRange:v13];
    id v14 = v8;
  }
  else
  {
    id v14 = [v8 selectionTextMarkerRange];

    [v14 nsRange];
    if (!v15) {
      goto LABEL_9;
    }
    id v9 = [(SRCSTextEditing *)self provider];
    unint64_t v11 = [(SRCSTextEditing *)self provider];
    uint64_t v16 = (void *)[v11 textMarkerRangeClass];
    id v12 = [v14 endMarker];
    id v13 = [v14 endMarker];
    unint64_t v17 = [v16 markerRangeWithStartMarker:v12 endMarker:v13];
    [v9 setSelectionToTextMarkerRange:v17];
  }
LABEL_9:
}

- (void)moveBackwardCharactersWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v16 = [v5 markerRangeForEnumerationType:2 desiredBlock:2 count:a3 options:0];

  char v6 = [(SRCSTextEditing *)self provider];
  if (v16)
  {
    int64_t v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v16 startMarker];
    id v10 = [v16 startMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
    id v12 = v6;
LABEL_6:

    goto LABEL_7;
  }
  id v12 = [v6 selectionTextMarkerRange];

  if (![v12 nsRange] && v13)
  {
    int64_t v7 = [(SRCSTextEditing *)self provider];
    id v9 = [(SRCSTextEditing *)self provider];
    id v14 = (void *)[v9 textMarkerRangeClass];
    id v10 = [v12 startMarker];
    unint64_t v11 = [v12 startMarker];
    uint64_t v15 = [v14 markerRangeWithStartMarker:v10 endMarker:v11];
    [v7 setSelectionToTextMarkerRange:v15];

    goto LABEL_6;
  }
LABEL_7:
}

- (void)moveForwardWordsWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v19 = [v5 markerRangeForEnumerationType:3 desiredBlock:0 count:1 options:0];

  char v6 = [v19 startMarker];
  int64_t v7 = [(SRCSTextEditing *)self provider];
  id v8 = [v7 selectionTextMarkerRange];
  id v9 = [v8 endMarker];
  unsigned int v10 = [v6 isEqual:v9];

  unint64_t v11 = [(SRCSTextEditing *)self provider];
  id v12 = [v11 markerRangeForEnumerationType:3 desiredBlock:0 count:a3 + v10 options:0];

  if (v12)
  {
    uint64_t v13 = [(SRCSTextEditing *)self provider];
    id v14 = [(SRCSTextEditing *)self provider];
    uint64_t v15 = (void *)[v14 textMarkerRangeClass];
    id v16 = [v12 startMarker];
    unint64_t v17 = [v12 startMarker];
    id v18 = [v15 markerRangeWithStartMarker:v16 endMarker:v17];
    [v13 setSelectionToTextMarkerRange:v18];
  }
}

- (void)moveBackwardWordsWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v12 = [v5 markerRangeForEnumerationType:3 desiredBlock:2 count:a3 options:0];

  if (v12)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    int64_t v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v12 startMarker];
    unsigned int v10 = [v12 startMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
  }
}

- (void)moveForwardSentencesWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v19 = [v5 markerRangeForEnumerationType:4 desiredBlock:0 count:1 options:0];

  char v6 = [v19 startMarker];
  int64_t v7 = [(SRCSTextEditing *)self provider];
  id v8 = [v7 selectionTextMarkerRange];
  id v9 = [v8 endMarker];
  unsigned int v10 = [v6 isEqual:v9];

  unint64_t v11 = [(SRCSTextEditing *)self provider];
  id v12 = [v11 markerRangeForEnumerationType:4 desiredBlock:0 count:a3 + v10 options:0];

  if (v12)
  {
    uint64_t v13 = [(SRCSTextEditing *)self provider];
    id v14 = [(SRCSTextEditing *)self provider];
    uint64_t v15 = (void *)[v14 textMarkerRangeClass];
    id v16 = [v12 startMarker];
    unint64_t v17 = [v12 startMarker];
    id v18 = [v15 markerRangeWithStartMarker:v16 endMarker:v17];
    [v13 setSelectionToTextMarkerRange:v18];
  }
}

- (void)moveBackwardSentencesWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v12 = [v5 markerRangeForEnumerationType:4 desiredBlock:2 count:a3 options:0];

  if (v12)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    int64_t v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v12 startMarker];
    unsigned int v10 = [v12 startMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
  }
}

- (void)moveForwardParagraphsWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v19 = [v5 markerRangeForEnumerationType:1 desiredBlock:0 count:1 options:0];

  char v6 = [v19 startMarker];
  int64_t v7 = [(SRCSTextEditing *)self provider];
  id v8 = [v7 selectionTextMarkerRange];
  id v9 = [v8 endMarker];
  unsigned int v10 = [v6 isEqual:v9];

  unint64_t v11 = [(SRCSTextEditing *)self provider];
  id v12 = [v11 markerRangeForEnumerationType:1 desiredBlock:0 count:a3 + v10 options:0];

  if (v12)
  {
    uint64_t v13 = [(SRCSTextEditing *)self provider];
    id v14 = [(SRCSTextEditing *)self provider];
    uint64_t v15 = (void *)[v14 textMarkerRangeClass];
    id v16 = [v12 startMarker];
    unint64_t v17 = [v12 startMarker];
    id v18 = [v15 markerRangeWithStartMarker:v16 endMarker:v17];
    [v13 setSelectionToTextMarkerRange:v18];
  }
}

- (void)moveBackwardParagraphsWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v12 = [v5 markerRangeForEnumerationType:1 desiredBlock:2 count:a3 options:0];

  if (v12)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    int64_t v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v12 startMarker];
    unsigned int v10 = [v12 startMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
  }
}

- (void)moveForwardLinesWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v12 = [v5 markerRangeForEnumerationType:0 desiredBlock:0 count:a3 options:0];

  if (v12)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    int64_t v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v12 startMarker];
    unsigned int v10 = [v12 startMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
  }
}

- (void)moveBackwardLinesWithCount:(int64_t)a3
{
  uint64_t v5 = [(SRCSTextEditing *)self provider];
  id v12 = [v5 markerRangeForEnumerationType:0 desiredBlock:2 count:a3 options:0];

  if (v12)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    int64_t v7 = [(SRCSTextEditing *)self provider];
    id v8 = (void *)[v7 textMarkerRangeClass];
    id v9 = [v12 startMarker];
    unsigned int v10 = [v12 startMarker];
    unint64_t v11 = [v8 markerRangeWithStartMarker:v9 endMarker:v10];
    [v6 setSelectionToTextMarkerRange:v11];
  }
}

- (void)deleteCurrentCharacter
{
  objc_super v3 = [(SRCSTextEditing *)self provider];
  id v5 = [v3 markerRangeForEnumerationType:2 desiredBlock:1 count:0 options:8];

  if (v5)
  {
    id v4 = [(SRCSTextEditing *)self provider];
    [v4 deleteTextAtTextMarkerRange:v5];
  }
}

- (void)deletePreviousCharacterWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:2 desiredBlock:2 count:a3 options:4];

  if (v7)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    [v6 deleteTextAtTextMarkerRange:v7];
  }
}

- (void)deleteNextCharacterWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:2 desiredBlock:0 count:a3 options:4];

  if (v7)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    [v6 deleteTextAtTextMarkerRange:v7];
  }
}

- (void)deleteCurrentWord
{
  objc_super v3 = [(SRCSTextEditing *)self provider];
  id v5 = [v3 markerRangeForEnumerationType:3 desiredBlock:1 count:1 options:0];

  if (v5)
  {
    id v4 = [(SRCSTextEditing *)self provider];
    [v4 deleteTextAtTextMarkerRange:v5];
  }
}

- (void)deletePreviousWordWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:3 desiredBlock:2 count:a3 options:4];

  if (v7)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    [v6 deleteTextAtTextMarkerRange:v7];
  }
}

- (void)deleteNextWordWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:3 desiredBlock:0 count:a3 options:4];

  if (v7)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    [v6 deleteTextAtTextMarkerRange:v7];
  }
}

- (void)deleteCurrentSentence
{
  objc_super v3 = [(SRCSTextEditing *)self provider];
  id v5 = [v3 markerRangeForEnumerationType:4 desiredBlock:1 count:1 options:0];

  if (v5)
  {
    id v4 = [(SRCSTextEditing *)self provider];
    [v4 deleteTextAtTextMarkerRange:v5];
  }
}

- (void)deleteNextSentenceWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:4 desiredBlock:0 count:a3 options:4];

  if (v7)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    [v6 deleteTextAtTextMarkerRange:v7];
  }
}

- (void)deletePreviousSentenceWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:4 desiredBlock:2 count:a3 options:4];

  if (v7)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    [v6 deleteTextAtTextMarkerRange:v7];
  }
}

- (void)deleteCurrentParagraph
{
  objc_super v3 = [(SRCSTextEditing *)self provider];
  id v5 = [v3 markerRangeForEnumerationType:1 desiredBlock:1 count:1 options:0];

  if (v5)
  {
    id v4 = [(SRCSTextEditing *)self provider];
    [v4 deleteTextAtTextMarkerRange:v5];
  }
}

- (void)deleteNextParagraphWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:1 desiredBlock:0 count:a3 options:4];

  if (v7)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    [v6 deleteTextAtTextMarkerRange:v7];
  }
}

- (void)deletePreviousParagraphWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:1 desiredBlock:2 count:a3 options:4];

  if (v7)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    [v6 deleteTextAtTextMarkerRange:v7];
  }
}

- (void)deleteCurrentLine
{
  objc_super v3 = [(SRCSTextEditing *)self provider];
  id v5 = [v3 markerRangeForEnumerationType:0 desiredBlock:1 count:1 options:0];

  if (v5)
  {
    id v4 = [(SRCSTextEditing *)self provider];
    [v4 deleteTextAtTextMarkerRange:v5];
  }
}

- (void)deleteNextLineWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:0 desiredBlock:0 count:a3 options:4];

  if (v7)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    [v6 deleteTextAtTextMarkerRange:v7];
  }
}

- (void)deletePreviousLineWithCount:(int64_t)a3
{
  id v5 = [(SRCSTextEditing *)self provider];
  id v7 = [v5 markerRangeForEnumerationType:0 desiredBlock:2 count:a3 options:4];

  if (v7)
  {
    char v6 = [(SRCSTextEditing *)self provider];
    [v6 deleteTextAtTextMarkerRange:v7];
  }
}

- (void)deleteAll
{
  objc_super v3 = [(SRCSTextEditing *)self provider];
  id v4 = (void *)[v3 textMarkerRangeClass];
  id v5 = [(SRCSTextEditing *)self provider];
  char v6 = [v5 firstPositionTextMarker];
  id v7 = [(SRCSTextEditing *)self provider];
  id v8 = [v7 lastPositionTextMarker];
  id v10 = [v4 markerRangeWithStartMarker:v6 endMarker:v8];

  if (v10)
  {
    id v9 = [(SRCSTextEditing *)self provider];
    [v9 deleteTextAtTextMarkerRange:v10];
  }
}

- (void)deleteSelection
{
  objc_super v3 = [(SRCSTextEditing *)self provider];
  id v4 = [v3 selectionTextMarkerRange];

  unint64_t v5 = [(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v4];
  char v6 = [(SRCSTextEditing *)self provider];
  id v7 = v6;
  if (v5)
  {
    [v6 deleteText];
    id v10 = v4;
  }
  else
  {
    id v10 = [v6 textMarkerRangeFromPreviousTextInsertion];

    unint64_t v8 = [(SRCSTextEditing *)self characterLengthOfTextMarkerRange:v10];
    id v9 = [(SRCSTextEditing *)self provider];
    id v7 = v9;
    if (v8) {
      [v9 deleteTextAtTextMarkerRange:v10];
    }
    else {
      [v9 deleteText];
    }
  }
}

- (_NSRange)rangeOfStrings:(id)a3 referenceRange:(_NSRange)a4 ambiguityResolution:(id)a5 substringSearchGranularity:(int)a6 foundStringRef:(id *)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  if (![v11 count]) {
    goto LABEL_79;
  }
  int v13 = [v12 isEqualToString:@"AXSelectTextAmbiguityResolutionClosestToSelection"];
  BOOL v14 = length > 1;
  if ((v13 & v14) != 0) {
    NSUInteger v15 = 0;
  }
  else {
    NSUInteger v15 = length;
  }
  if ((v13 & v14) != 0) {
    NSUInteger v16 = length >> 1;
  }
  else {
    NSUInteger v16 = 0;
  }
  NSUInteger v17 = v16 + location;
  id v18 = [(SRCSTextEditing *)self provider];
  id v19 = [v18 lastPositionTextMarker];
  unint64_t v20 = [v19 index];

  v67 = self;
  NSUInteger v74 = v15;
  if (v20 >> 5 > 0xC34)
  {
    v17 += v15 >> 1;
    long long v21 = [(SRCSTextEditing *)self provider];
    id v29 = (void *)[v21 textMarkerRangeClass];
    if (v17 >> 4 > 0xC34) {
      NSUInteger v30 = v17 - 50000;
    }
    else {
      NSUInteger v30 = 0;
    }
    long long v28 = objc_msgSend(v29, "markerRangeWithNSRange:", v30, 100000);
  }
  else
  {
    long long v21 = [(SRCSTextEditing *)self provider];
    double v22 = (void *)[v21 textMarkerRangeClass];
    double v23 = [(SRCSTextEditing *)self provider];
    double v24 = [v23 firstPositionTextMarker];
    [(SRCSTextEditing *)self provider];
    v26 = id v25 = v11;
    long long v27 = [v26 lastPositionTextMarker];
    long long v28 = [v22 markerRangeWithStartMarker:v24 endMarker:v27];

    id v11 = v25;
    self = v67;

    NSUInteger v15 = v74;
  }

  uint64_t v61 = [v28 nsRange];
  uint64_t v31 = [(SRCSTextEditing *)self provider];
  uint64_t v32 = [v31 stringForTextMarkerRange:v28];

  if (![v32 length])
  {

LABEL_79:
    uint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_83;
  }
  uint64_t v59 = v28;
  id v60 = v11;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = v11;
  uint64_t v75 = [obj countByEnumeratingWithState:&v76 objects:v80 count:16];
  if (!v75)
  {
    unint64_t v70 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_81;
  }
  unint64_t v71 = v17 - v61;
  uint64_t v73 = *(void *)v77;
  unint64_t v62 = v17 - v61 + v15;
  NSUInteger v63 = v17 + (v15 >> 1);
  uint64_t v68 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v64 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v70 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (uint64_t i = 0; i != v75; ++i)
    {
      if (*(void *)v77 != v73) {
        objc_enumerationMutation(obj);
      }
      id v37 = *(void **)(*((void *)&v76 + 1) + 8 * i);
      uint64_t v38 = [v37 length];
      if (v15
        || (unint64_t v39 = v38,
            ![v12 isEqualToString:@"AXSelectTextAmbiguityResolutionClosestToSelection"]))
      {
        uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
        unint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        if (v71 >= v39) {
          unint64_t v40 = v71 - v39;
        }
        else {
          unint64_t v40 = 0;
        }
        if (v40 + 2 * v39 >= [v32 length]) {
          uint64_t v41 = [v32 length] - v40;
        }
        else {
          uint64_t v41 = 2 * v39;
        }
        if (a6) {
          uint64_t v51 = objc_msgSend(v32, "rangeOfString:options:range:", v37, 1, v40, v41);
        }
        else {
          uint64_t v51 = -[SRCSTextEditing _rangeOfWordBasedSearchString:inString:withRange:forwardSearchDirection:](v67, "_rangeOfWordBasedSearchString:inString:withRange:forwardSearchDirection:", v37, v32, v40, v41, 1);
        }
        uint64_t v42 = v51;
        unint64_t v43 = v52;
      }
      if (v42 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_63;
      }
      uint64_t v42 = v33;
      if (([v12 isEqualToString:@"AXSelectTextAmbiguityResolutionClosestToSelection"] & 1) != 0
        || [v12 isEqualToString:@"AXSelectTextAmbiguityResolutionClosestBeforeSelection"])
      {
        if (a6) {
          uint64_t v44 = objc_msgSend(v32, "rangeOfString:options:range:", v37, 5, 0, v71);
        }
        else {
          uint64_t v44 = -[SRCSTextEditing _rangeOfWordBasedSearchString:inString:withRange:forwardSearchDirection:](v67, "_rangeOfWordBasedSearchString:inString:withRange:forwardSearchDirection:", v37, v32, 0, v71, 0);
        }
        uint64_t v34 = v44;
        uint64_t v68 = v45;
      }
      if (([v12 isEqualToString:@"AXSelectTextAmbiguityResolutionClosestToSelection"] & 1) != 0
        || [v12 isEqualToString:@"AXSelectTextAmbiguityResolutionClosestAfterSelection"])
      {
        unint64_t v46 = [v32 length];
        [v32 length];
        if (v62 <= v46) {
          uint64_t v47 = v62;
        }
        else {
          uint64_t v47 = v71;
        }
        uint64_t v64 = v47;
        if (a6) {
          uint64_t v48 = objc_msgSend(v32, "rangeOfString:options:range:", v37, 1);
        }
        else {
          uint64_t v48 = -[SRCSTextEditing _rangeOfWordBasedSearchString:inString:withRange:forwardSearchDirection:](v67, "_rangeOfWordBasedSearchString:inString:withRange:forwardSearchDirection:", v37, v32);
        }
        uint64_t v42 = v48;
        uint64_t v69 = v49;
      }
      if (![v12 isEqualToString:@"AXSelectTextAmbiguityResolutionClosestToSelection"])
      {
        if ([v12 isEqualToString:@"AXSelectTextAmbiguityResolutionClosestBeforeSelection"])
        {
          uint64_t v33 = v42;
          unint64_t v43 = v68;
          uint64_t v42 = v34;
          uint64_t v50 = v34;
        }
        else
        {
          unint64_t v43 = v69;
          uint64_t v33 = v42;
          uint64_t v50 = v34;
          if (![v12 isEqualToString:@"AXSelectTextAmbiguityResolutionClosestAfterSelection"])goto LABEL_75; {
        }
          }
LABEL_51:
        if (v42 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_71;
        }
        goto LABEL_64;
      }
      uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v43 = v69;
      uint64_t v33 = v42;
      if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_51;
      }
      if (v42 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v64 - (v34 + v68) >= (unint64_t)(v42 - v64)) {
          unint64_t v43 = v69;
        }
        else {
          unint64_t v43 = v68;
        }
        if (v64 - (v34 + v68) < (unint64_t)(v42 - v64)) {
          uint64_t v42 = v34;
        }
LABEL_63:
        uint64_t v50 = v34;
        goto LABEL_64;
      }
      uint64_t v50 = v34;
      uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v42 = v34;
      unint64_t v43 = v68;
LABEL_64:
      if (v35 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v53 = v42 - v63 + (v43 >> 1);
        if (v53 < 0) {
          uint64_t v53 = -v53;
        }
        uint64_t v54 = v35 - v63 + (v70 >> 1);
        if (v54 < 0) {
          uint64_t v54 = -v54;
        }
        if (v53 >= (unint64_t)v54 || -[SRCSTextEditing _range:includesRange:](v67, "_range:includesRange:", v35))
        {
LABEL_71:
          uint64_t v34 = v50;
          goto LABEL_75;
        }
      }
      if (a7) {
        *a7 = v37;
      }
      uint64_t v34 = v50;
      unint64_t v70 = v43;
      uint64_t v35 = v42;
LABEL_75:
      NSUInteger v15 = v74;
    }
    uint64_t v75 = [obj countByEnumeratingWithState:&v76 objects:v80 count:16];
  }
  while (v75);
LABEL_81:

  if (v35 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = v60;
    uint64_t v55 = v70;
LABEL_83:
    uint64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v11 = v60;
    uint64_t v56 = v35 + v61;
    uint64_t v55 = v70;
  }

  NSUInteger v57 = v56;
  NSUInteger v58 = v55;
  result.NSUInteger length = v58;
  result.NSUInteger location = v57;
  return result;
}

- (id)actOnRange:(id)a3 options:(id)a4 actionBlock:(id)a5
{
  id v7 = (void (**)(id, id, void *))a5;
  id v8 = a3;
  id v9 = [(SRCSTextEditing *)self provider];
  id v10 = [v9 stringForTextMarkerRange:v8];

  v7[2](v7, v8, v10);
  return v10;
}

- (id)actOnStrings:(id)a3 ambiguityResolution:(id)a4 substringSearchGranularity:(int)a5 alwaysCallActionOnClosestMatch:(BOOL)a6 options:(id)a7 actionBlock:(id)a8
{
  BOOL v10 = a6;
  uint64_t v11 = *(void *)&a5;
  v124[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  NSUInteger v17 = (void (**)(id, id, id))a8;
  if (![v15 isEqualToString:@"AXSelectTextAmbiguityResolutionClosestToSelection"]
    || ([(SRCSTextEditing *)self provider],
        id v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v18 isTextDisambiguationSupported],
        v18,
        !v19))
  {
    NSUInteger v30 = [(SRCSTextEditing *)self provider];
    uint64_t v31 = [v30 selectionTextMarkerRange];
    uint64_t v32 = [v31 nsRange];
    id v110 = 0;
    uint64_t v34 = -[SRCSTextEditing rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:](self, "rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:", v14, v32, v33, v15, v11, &v110);
    uint64_t v36 = v35;
    id v24 = v110;

    if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_23;
    }
    id v37 = [(SRCSTextEditing *)self provider];
    char v38 = objc_opt_respondsToSelector();

    if (v38)
    {
      id v109 = v15;
      unint64_t v39 = v17;
      id v40 = v14;
      uint64_t v41 = [(SRCSTextEditing *)self provider];
      id v42 = v16;
      unint64_t v43 = [v16 objectForKey:@"RecognizedParameters"];
      if ([v24 length])
      {
        v113 = kSRCSCommandParameterDictation[0];
        id v114 = v24;
        uint64_t v44 = [NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
        [v41 handleSearchResultsWithRecognizedCommandParameters:v43 variantOverrides:v44];
      }
      else
      {
        [v41 handleSearchResultsWithRecognizedCommandParameters:v43 variantOverrides:0];
      }

      id v16 = v42;
      id v14 = v40;
      NSUInteger v17 = v39;
      id v15 = v109;
    }
    unint64_t v20 = [(SRCSTextEditing *)self provider];
    objc_msgSend((id)objc_msgSend(v20, "textMarkerRangeClass"), "markerRangeWithNSRange:", v34, v36);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v22, v24);
    goto LABEL_21;
  }
  uint64_t v108 = v16;
  unint64_t v20 = [(SRCSTextEditing *)self visiblePhraseMatchesFromStrings:v14 substringSearchGranularity:v11];
  if ([v20 count])
  {
    if ([v20 count] == 1)
    {
      long long v21 = [v20 firstObject];
      id v22 = [v21 markerRange];

      double v23 = [(SRCSTextEditing *)self provider];
      id v24 = [v23 stringForTextMarkerRange:v22];

      id v25 = [(SRCSTextEditing *)self provider];
      char v26 = objc_opt_respondsToSelector();

      if (v26)
      {
        long long v27 = [(SRCSTextEditing *)self provider];
        long long v28 = [v108 objectForKey:@"RecognizedParameters"];
        if ([v24 length])
        {
          v121 = kSRCSCommandParameterDictation[0];
          id v122 = v24;
          id v29 = [NSDictionary dictionaryWithObjects:&v122 forKeys:&v121 count:1];
          [v27 handleSearchResultsWithRecognizedCommandParameters:v28 variantOverrides:v29];
        }
        else
        {
          [v27 handleSearchResultsWithRecognizedCommandParameters:v28 variantOverrides:0];
        }
      }
      v17[2](v17, v22, v24);
      id v16 = v108;
LABEL_21:

      goto LABEL_22;
    }
    BOOL v106 = v10;
    unint64_t v52 = [(SRCSTextEditing *)self provider];
    uint64_t v53 = [v20 firstObject];
    uint64_t v54 = [v53 markerRange];
    id v24 = [v52 stringForTextMarkerRange:v54];

    uint64_t v55 = [(SRCSTextEditing *)self provider];
    uint64_t v56 = [v55 selectionTextMarkerRange];
    uint64_t v57 = [v56 nsRange];
    id v111 = 0;
    unint64_t v59 = -[SRCSTextEditing rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:](self, "rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:", v14, v57, v58, v15, v11, &v111);
    uint64_t v104 = v20;
    uint64_t v61 = v60;
    id v22 = v111;

    unint64_t v62 = [(SRCSTextEditing *)self provider];
    uint64_t v101 = v61;
    LODWORD(v56) = objc_msgSend(v62, "isVisibleTextRange:", v59, v61);

    if (v56)
    {
      unint64_t v99 = v59;
      NSUInteger v63 = [(SRCSTextEditing *)self provider];
      char v64 = objc_opt_respondsToSelector();

      id v16 = v108;
      unint64_t v20 = v104;
      if (v64)
      {
        int64_t v65 = [(SRCSTextEditing *)self provider];
        int64_t v66 = [v108 objectForKey:@"RecognizedParameters"];
        if ([v24 length])
        {
          v119 = kSRCSCommandParameterDictation[0];
          id v120 = v22;
          [NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
          uint64_t v98 = v65;
          uint64_t v68 = v67 = v66;
          [v98 handleSearchResultsWithRecognizedCommandParameters:v67 variantOverrides:v68];

          int64_t v66 = v67;
          int64_t v65 = v98;
        }
        else
        {
          [v65 handleSearchResultsWithRecognizedCommandParameters:v66 variantOverrides:0];
        }
      }
      if (v106)
      {
        uint64_t v91 = [(SRCSTextEditing *)self provider];
        uint64_t v92 = objc_msgSend((id)objc_msgSend(v91, "textMarkerRangeClass"), "markerRangeWithNSRange:", v99, v101);
        v17[2](v17, v92, v22);
      }
      if (![v22 length]) {
        goto LABEL_59;
      }
      id v93 = v24;
      id v24 = v22;
    }
    else
    {
      unint64_t v20 = v104;
      long long v77 = [v104 firstObject];
      long long v78 = [v77 markerRange];
      unint64_t v102 = [v78 nsRange];

      long long v79 = [(SRCSTextEditing *)self provider];
      if (v59 <= v102)
      {
        char v86 = objc_opt_respondsToSelector();

        id v16 = v108;
        if (v86)
        {
          v87 = [(SRCSTextEditing *)self provider];
          uint64_t v88 = [v108 objectForKey:@"RecognizedParameters"];
          if ([v24 length])
          {
            uint64_t v117 = kSRCSCommandParameterDictation[0];
            id v118 = v24;
            uint64_t v89 = [NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
            [v87 handleSearchResultsWithRecognizedCommandParameters:v88 variantOverrides:v89];
          }
          else
          {
            [v87 handleSearchResultsWithRecognizedCommandParameters:v88 variantOverrides:0];
          }

          id v16 = v108;
        }
        if (!v106) {
          goto LABEL_59;
        }
        id v93 = [v104 firstObject];
        v94 = [v93 markerRange];
        v17[2](v17, v94, v24);
      }
      else
      {
        id v80 = [v104 lastObject];
        uint64_t v81 = [v80 markerRange];
        id v103 = [v79 stringForTextMarkerRange:v81];

        id v82 = [(SRCSTextEditing *)self provider];
        char v83 = objc_opt_respondsToSelector();

        id v16 = v108;
        if (v83)
        {
          uint64_t v100 = [(SRCSTextEditing *)self provider];
          BOOL v84 = [v108 objectForKey:@"RecognizedParameters"];
          if ([v103 length])
          {
            v115 = kSRCSCommandParameterDictation[0];
            v116 = v103;
            v85 = [NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
            [v100 handleSearchResultsWithRecognizedCommandParameters:v84 variantOverrides:v85];
          }
          else
          {
            [v100 handleSearchResultsWithRecognizedCommandParameters:v84 variantOverrides:0];
          }
        }
        if (!v106)
        {
          id v24 = v103;
          goto LABEL_59;
        }
        id v93 = [v104 lastObject];
        v94 = [v93 markerRange];
        id v24 = v103;
        v17[2](v17, v94, v103);
      }
    }
LABEL_59:
    v95 = [(SRCSTextEditing *)self provider];
    char v96 = objc_opt_respondsToSelector();

    if (v96)
    {
      uint64_t v97 = [(SRCSTextEditing *)self provider];
      [v97 handleTextDisambiguationWithPhraseMatchResults:v20 actionBlock:v17];
    }
    goto LABEL_21;
  }
  uint64_t v45 = [(SRCSTextEditing *)self provider];
  unint64_t v46 = [v45 selectionTextMarkerRange];
  uint64_t v47 = [v46 nsRange];
  id v112 = 0;
  uint64_t v49 = -[SRCSTextEditing rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:](self, "rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:", v14, v47, v48, v15, v11, &v112);
  uint64_t v51 = v50;
  id v24 = v112;

  if (v49 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v107 = v49;
    unint64_t v70 = [(SRCSTextEditing *)self provider];
    char v71 = objc_opt_respondsToSelector();

    id v16 = v108;
    if (v71)
    {
      uint64_t v72 = [(SRCSTextEditing *)self provider];
      uint64_t v73 = [v108 objectForKey:@"RecognizedParameters"];
      if ([v24 length])
      {
        id v123 = kSRCSCommandParameterDictation[0];
        v124[0] = v24;
        [NSDictionary dictionaryWithObjects:v124 forKeys:&v123 count:1];
        uint64_t v105 = v51;
        NSUInteger v74 = v73;
        v76 = uint64_t v75 = v72;
        [v75 handleSearchResultsWithRecognizedCommandParameters:v74 variantOverrides:v76];

        uint64_t v72 = v75;
        uint64_t v73 = v74;
        uint64_t v51 = v105;
      }
      else
      {
        [v72 handleSearchResultsWithRecognizedCommandParameters:v73 variantOverrides:0];
      }
    }
    id v22 = [(SRCSTextEditing *)self provider];
    uint64_t v90 = objc_msgSend((id)objc_msgSend(v22, "textMarkerRangeClass"), "markerRangeWithNSRange:", v107, v51);
    v17[2](v17, v90, v24);

    goto LABEL_21;
  }
  id v16 = v108;
LABEL_22:

LABEL_23:
  return v24;
}

- (id)visiblePhraseMatchesFromStrings:(id)a3 substringSearchGranularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v44[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v35 = (id)objc_opt_new();
  char v38 = self;
  id v7 = [(SRCSTextEditing *)self provider];
  id v8 = [v7 lastPositionTextMarker];
  [v8 index];

  uint64_t v9 = v4;
  uint64_t v34 = v6;
  BOOL v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v6];
  unsigned int v36 = v9;
  if ([v10 count])
  {
    unint64_t v11 = 0;
    do
    {
      id v12 = [v10 objectAtIndex:v11];
      v44[0] = v12;
      int v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
      id v42 = 0;
      uint64_t v14 = [(SRCSTextEditing *)v38 rangeOfStrings:v13, 0, 0, @"AXSelectTextAmbiguityResolutionClosestAfterSelection", v9, &v42 referenceRange ambiguityResolution substringSearchGranularity foundStringRef];
      id v40 = v42;

      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v10 removeObjectAtIndex:v11];
      }
      else
      {
        id v37 = v12;
        id v15 = [v12 lowercaseString];
        id v16 = +[SRCSTextEditing wordsFromString:v15];

        unint64_t v39 = v11 + 1;
        if (v11 + 1 < [v10 count])
        {
          unint64_t v17 = v11 + 1;
          do
          {
            id v18 = [v10 objectAtIndex:v17];
            int v19 = +[SRCSTextEditing wordsFromString:v18];
            unint64_t v43 = v19;
            unint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
            int64_t v21 = +[SRCSTextEditing doesArrayOfWords:v16 containArrayOfArrayWords:v20];

            if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
              ++v17;
            }
            else {
              [v10 removeObjectAtIndex:v17];
            }
          }
          while (v17 < [v10 count]);
        }

        uint64_t v9 = v36;
        unint64_t v11 = v39;
        id v12 = v37;
      }
    }
    while (v11 < [v10 count]);
  }
  id v41 = 0;
  uint64_t v22 = [(SRCSTextEditing *)v38 rangeOfStrings:v10, 0, 0, @"AXSelectTextAmbiguityResolutionClosestAfterSelection", v9, &v41 referenceRange ambiguityResolution substringSearchGranularity foundStringRef];
  uint64_t v24 = v23;
  for (id i = v41; v22 != 0x7FFFFFFFFFFFFFFFLL; id i = v41)
  {
    char v26 = [(SRCSTextEditing *)v38 provider];
    int v27 = objc_msgSend(v26, "isVisibleTextRange:", v22, v24);

    if (v27)
    {
      long long v28 = [SRCSPhraseMatchResult alloc];
      id v29 = [(SRCSTextEditing *)v38 provider];
      NSUInteger v30 = objc_msgSend((id)objc_msgSend(v29, "textMarkerRangeClass"), "markerRangeWithNSRange:", v22, v24);
      uint64_t v31 = [(SRCSPhraseMatchResult *)v28 initWithMarkerRange:v30 matchedString:i userInfo:0];
      [v35 addObject:v31];

      uint64_t v9 = v36;
    }

    id v41 = 0;
    uint64_t v22 = [(SRCSTextEditing *)v38 rangeOfStrings:v10, v22 + v24, 0, @"AXSelectTextAmbiguityResolutionClosestAfterSelection", v9, &v41 referenceRange ambiguityResolution substringSearchGranularity foundStringRef];
    uint64_t v24 = v32;
  }

  return v35;
}

- (id)orderedPhraseMatchesFromStrings:(id)a3 forwardDirection:(BOOL)a4 referenceLocation:(int64_t)a5 substringSearchGranularity:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = objc_opt_new();
  if (v8) {
    id v12 = @"AXSelectTextAmbiguityResolutionClosestAfterSelection";
  }
  else {
    id v12 = @"AXSelectTextAmbiguityResolutionClosestBeforeSelection";
  }
  id v31 = 0;
  uint64_t v13 = -[SRCSTextEditing rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:](self, "rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:", v10, a5, 0, v12, v6, &v31);
  uint64_t v15 = v14;
  id v16 = v31;
  id v30 = (id)v11;
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned int v29 = v6;
    do
    {
      unint64_t v17 = [SRCSPhraseMatchResult alloc];
      id v18 = [(SRCSTextEditing *)self provider];
      objc_msgSend((id)objc_msgSend(v18, "textMarkerRangeClass"), "markerRangeWithNSRange:", v13, v15);
      int v19 = self;
      unint64_t v20 = v12;
      id v21 = v10;
      v23 = BOOL v22 = v8;
      uint64_t v24 = [(SRCSPhraseMatchResult *)v17 initWithMarkerRange:v23 matchedString:v16 userInfo:0];
      [v30 addObject:v24];

      BOOL v8 = v22;
      id v10 = v21;
      id v12 = v20;
      self = v19;

      if (v8) {
        uint64_t v25 = v15;
      }
      else {
        uint64_t v25 = 0;
      }
      uint64_t v26 = v25 + v13;

      id v31 = 0;
      uint64_t v13 = -[SRCSTextEditing rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:](v19, "rangeOfStrings:referenceRange:ambiguityResolution:substringSearchGranularity:foundStringRef:", v10, v26, 0, v12, v29, &v31);
      uint64_t v15 = v27;
      id v16 = v31;
    }
    while (v13 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v30;
}

- (_NSRange)_rangeOfWordBasedSearchString:(id)a3 inString:(id)a4 withRange:(_NSRange)a5 forwardSearchDirection:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a3;
  id v12 = a4;
  unint64_t v13 = [v11 length];
  if (v6) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = 5;
  }
  unint64_t v15 = objc_msgSend(v12, "rangeOfString:options:range:", v11, v14);
  uint64_t v17 = v16;
  id v18 = [(SRCSTextEditing *)self provider];
  uint64_t v32 = v11;
  if (objc_opt_respondsToSelector())
  {
    int v19 = [(SRCSTextEditing *)self provider];
    int v20 = [v19 statusOfEmojisFoundInString:v11];

    if (v20)
    {
      uint64_t v33 = v17;
      uint64_t v34 = v15;
      goto LABEL_30;
    }
  }
  else
  {
  }
  uint64_t v33 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    unint64_t v21 = v15 >= v13 ? v15 - v13 : 0;
    NSUInteger v22 = length + location;
    uint64_t v40 = 0;
    id v41 = &v40;
    unint64_t v23 = v15 + v17;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    unint64_t v24 = length + location - (v15 + v17) >= v13 ? v15 + v17 + v13 : length + location;
    uint64_t v36 = 0;
    id v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    void v35[2] = __99__SRCSTextEditing_Search___rangeOfWordBasedSearchString_inString_withRange_forwardSearchDirection___block_invoke;
    v35[3] = &unk_264DC99D8;
    v35[6] = v15;
    v35[7] = v17;
    v35[4] = &v40;
    v35[5] = &v36;
    objc_msgSend(v12, "enumerateSubstringsInRange:options:usingBlock:", v21, v24 - v21, 3, v35);
    if (!*((unsigned char *)v41 + 24)) {
      goto LABEL_19;
    }
    if (*((unsigned char *)v37 + 24))
    {
      char v25 = 0;
      uint64_t v33 = v17;
      uint64_t v34 = v15;
    }
    else
    {
LABEL_19:
      NSUInteger v26 = v22 - v23;
      if (v22 < v23) {
        NSUInteger v26 = 0;
      }
      NSUInteger v27 = v15 - location;
      if (v15 < location) {
        NSUInteger v27 = 0;
      }
      if (v6)
      {
        NSUInteger location = v15 + v17;
        NSUInteger length = v26;
      }
      else
      {
        NSUInteger length = v27;
      }
      if (length)
      {
        unint64_t v15 = objc_msgSend(v12, "rangeOfString:options:range:", v32, v31, location, length);
        uint64_t v17 = v28;
        char v25 = 1;
      }
      else
      {
        char v25 = 0;
      }
    }
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
  }
  while ((v25 & 1) != 0);
LABEL_30:

  NSUInteger v30 = v33;
  NSUInteger v29 = v34;
  result.NSUInteger length = v30;
  result.NSUInteger location = v29;
  return result;
}

void *__99__SRCSTextEditing_Search___rangeOfWordBasedSearchString_inString_withRange_forwardSearchDirection___block_invoke(void *result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, BOOL *a7)
{
  uint64_t v7 = *(void *)(result[4] + 8);
  if (!*(unsigned char *)(v7 + 24) && (*(unsigned char *)(v7 + 24) = a3 == result[6], !*(unsigned char *)(*(void *)(result[4] + 8) + 24))
    || (uint64_t v8 = *(void *)(result[5] + 8), !*(unsigned char *)(v8 + 24))
    && (*(unsigned char *)(v8 + 24) = a3 + a4 == result[7] + result[6], !*(unsigned char *)(*(void *)(result[4] + 8) + 24)))
  {
    if (a3 <= result[6])
    {
      if (*(unsigned char *)(*(void *)(result[5] + 8) + 24))
      {
        BOOL v9 = 0;
        goto LABEL_9;
      }
      goto LABEL_6;
    }
LABEL_8:
    BOOL v9 = 1;
    goto LABEL_9;
  }
  if (*(unsigned char *)(*(void *)(result[5] + 8) + 24)) {
    goto LABEL_8;
  }
LABEL_6:
  BOOL v9 = a3 > result[7] + result[6];
LABEL_9:
  *a7 = v9;
  return result;
}

- (BOOL)_range:(_NSRange)a3 includesRange:(_NSRange)a4
{
  return a4.location >= a3.location && a4.location + a4.length <= a3.location + a3.length;
}

+ (id)wordsFromString:(id)a3
{
  objc_super v3 = (__CFString *)a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  unint64_t v5 = objc_opt_class();
  objc_sync_enter(v5);
  BOOL v6 = +[SRCSSpokenCommandUtilities wordUnitStringTokenizerRefForLocaleIdentifier:0];
  if (v6)
  {
    v11.NSUInteger length = [(__CFString *)v3 length];
    v11.NSUInteger location = 0;
    CFStringTokenizerSetString(v6, v3, v11);
    while (CFStringTokenizerAdvanceToNextToken(v6))
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
      if (CurrentTokenRange.location != -1)
      {
        uint64_t v8 = -[__CFString substringWithRange:](v3, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
        [v4 addObject:v8];
      }
    }
  }
  objc_sync_exit(v5);

  return v4;
}

+ (int64_t)doesArrayOfWords:(id)a3 containArrayOfArrayWords:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = a4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    int64_t v8 = 0;
    uint64_t v9 = *(void *)v31;
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v25 = *(void *)v31;
    do
    {
      uint64_t v11 = 0;
      int64_t v24 = v8;
      uint64_t v27 = v7;
      do
      {
        int64_t v12 = v10;
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        unint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
        uint64_t v14 = objc_msgSend(v5, "count", v24);
        uint64_t v15 = [v13 count];
        uint64_t v16 = v14 - v15;
        if (v14 <= v15)
        {
          int64_t v10 = v12;
        }
        else
        {
          uint64_t v17 = v15;
          int64_t v10 = v8;
          if (v15 >= 1)
          {
            int64_t v26 = v12;
            uint64_t v18 = 0;
            uint64_t v29 = v16 + 1;
            do
            {
              uint64_t v19 = 0;
              while (1)
              {
                int v20 = [v5 objectAtIndexedSubscript:v18 + v19];
                unint64_t v21 = [v13 objectAtIndexedSubscript:v19];
                char v22 = [v20 isEqualToString:v21];

                if ((v22 & 1) == 0) {
                  break;
                }
                if (v17 == ++v19)
                {
                  int64_t v10 = v8;
                  goto LABEL_16;
                }
              }
              ++v18;
            }
            while (v18 != v29);
            int64_t v10 = v26;
LABEL_16:
            uint64_t v9 = v25;
            uint64_t v7 = v27;
          }
        }
        ++v8;
        ++v11;
      }
      while (v11 != v7);
      int64_t v8 = v24 + v7;
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }
  else
  {
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)markerRangeForEnumerationType:(int64_t)a3 desiredBlock:(int)a4 count:(unint64_t)a5 options:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  uint64_t v11 = [(SRCSTextEditing *)self provider];
  int64_t v12 = [v11 selectionTextMarkerRange];
  unint64_t v13 = [(SRCSTextEditing *)self markerRangeForEnumerationType:a3 markerRange:v12 desiredBlock:v8 count:a5 options:v6];

  return v13;
}

- (id)markerRangeForEnumerationType:(int64_t)a3 markerRange:(id)a4 desiredBlock:(int)a5 count:(unint64_t)a6 options:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a5;
  id v12 = a4;
  unint64_t v13 = v12;
  if (a3)
  {
    if (v9)
    {
      if (v9 != 2)
      {
        if (v9 == 1)
        {
          uint64_t v14 = v7;
          if ((v7 & 8) != 0)
          {
            uint64_t v15 = [v12 endMarker];
            uint64_t v16 = [(SRCSTextEditing *)self provider];
            uint64_t v17 = (void *)[v16 textMarkerRangeClass];
            uint64_t v18 = self;
            int64_t v19 = a3;
            uint64_t v20 = -1;
          }
          else
          {
            uint64_t v15 = [v12 startMarker];
            uint64_t v16 = [(SRCSTextEditing *)self provider];
            uint64_t v17 = (void *)[v16 textMarkerRangeClass];
            uint64_t v18 = self;
            int64_t v19 = a3;
            uint64_t v20 = 0;
          }
          uint64_t v31 = [(SRCSTextEditing *)v18 _findRangeForEnumerationType:v19 atRelativeIncrement:v20 fromPosition:v15 options:v14];
          unint64_t v21 = objc_msgSend(v17, "markerRangeWithNSRange:", v31, v32);
        }
        else
        {
          unint64_t v21 = 0;
        }
        goto LABEL_14;
      }
      char v22 = [v12 startMarker];
      unint64_t v23 = [(SRCSTextEditing *)self provider];
      int64_t v24 = (void *)[v23 textMarkerRangeClass];
      unint64_t v28 = -(uint64_t)a6;
      uint64_t v25 = v7;
      int64_t v26 = self;
      int64_t v27 = a3;
    }
    else
    {
      char v22 = [v12 endMarker];
      unint64_t v23 = [(SRCSTextEditing *)self provider];
      int64_t v24 = (void *)[v23 textMarkerRangeClass];
      uint64_t v25 = v7;
      int64_t v26 = self;
      int64_t v27 = a3;
      unint64_t v28 = a6;
    }
    uint64_t v29 = [(SRCSTextEditing *)v26 _findRangeForEnumerationType:v27 atRelativeIncrement:v28 fromPosition:v22 options:v25];
    unint64_t v21 = objc_msgSend(v24, "markerRangeWithNSRange:", v29, v30);
  }
  else
  {
    unint64_t v21 = [(SRCSTextEditing *)self markerRangeForLineInDesiredBlock:v9 markerRange:v12 count:a6 options:v7];
  }
LABEL_14:

  return v21;
}

- (id)markerRangeForLineInDesiredBlock:(int)a3 markerRange:(id)a4 count:(unint64_t)a5 options:(int)a6
{
  char v6 = a6;
  id v10 = a4;
  uint64_t v11 = v10;
  if (a3)
  {
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        id v12 = [(SRCSTextEditing *)self provider];
        unint64_t v13 = [v11 startMarker];
        uint64_t v14 = [v12 markerRangeForLineAtTextMarker:v13];
        uint64_t v15 = 0;
LABEL_30:

        goto LABEL_31;
      }
LABEL_12:
      uint64_t v15 = 0;
      uint64_t v14 = 0;
      goto LABEL_31;
    }
    uint64_t v31 = [v10 nsRange];
    uint64_t v15 = 0;
    if (a5 > 0x7FFFFFFFFFFFFFFELL)
    {
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v32 = v31;
      uint64_t v14 = 0;
      if (v31 >= 1)
      {
        char v46 = v6;
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        uint64_t v33 = 1;
        do
        {
          uint64_t v34 = v14;
          uint64_t v35 = [(SRCSTextEditing *)self provider];
          uint64_t v36 = [(SRCSTextEditing *)self provider];
          id v37 = objc_msgSend((id)objc_msgSend(v36, "textMarkerClass"), "markerWithIndex:", v32);
          uint64_t v14 = [v35 markerRangeForLineAtTextMarker:v37];

          uint64_t v38 = [v14 nsRange];
          if (!v33)
          {
            id v39 = v14;

            uint64_t v15 = v39;
          }
          if ((uint64_t)(a5 + v33) < 2) {
            break;
          }
          uint64_t v32 = v38 - 1;
          --v33;
        }
        while (v32 > 0);
        if (a5 >= 2 && (v46 & 4) != 0 && v15)
        {
          id v12 = [(SRCSTextEditing *)self provider];
          uint64_t v40 = (void *)[v12 textMarkerRangeClass];
          unint64_t v13 = [v14 startMarker];
          id v41 = v15;
LABEL_29:
          uint64_t v42 = [v41 endMarker];
          uint64_t v43 = [v40 markerRangeWithStartMarker:v13 endMarker:v42];

          uint64_t v14 = (void *)v43;
          goto LABEL_30;
        }
      }
    }
  }
  else
  {
    uint64_t v16 = [v10 nsRange];
    if (a5 > 0x7FFFFFFFFFFFFFFELL) {
      goto LABEL_12;
    }
    char v45 = v6;
    uint64_t v18 = 0;
    uint64_t v15 = 0;
    unint64_t v19 = v16 + v17 - (v17 > 1);
    uint64_t v20 = 2;
    while (1)
    {
      unint64_t v21 = [(SRCSTextEditing *)self provider];
      char v22 = [v21 lastPositionTextMarker];
      unint64_t v23 = [v22 index];

      if (v19 >= v23) {
        break;
      }
      int64_t v24 = [(SRCSTextEditing *)self provider];
      uint64_t v25 = [(SRCSTextEditing *)self provider];
      int64_t v26 = objc_msgSend((id)objc_msgSend(v25, "textMarkerClass"), "markerWithIndex:", v19);
      uint64_t v14 = [v24 markerRangeForLineAtTextMarker:v26];

      uint64_t v27 = [v14 nsRange];
      uint64_t v29 = v28;
      if (!--v20)
      {
        id v30 = v14;

        uint64_t v15 = v30;
      }
      unint64_t v19 = v29 + v27 + 1;
      uint64_t v18 = v14;
      if ((uint64_t)(a5 + v20) <= 1) {
        goto LABEL_25;
      }
    }
    uint64_t v14 = v18;
LABEL_25:
    if (a5 >= 2 && (v45 & 4) != 0 && v15)
    {
      id v12 = [(SRCSTextEditing *)self provider];
      uint64_t v40 = (void *)[v12 textMarkerRangeClass];
      unint64_t v13 = [v15 startMarker];
      id v41 = v14;
      goto LABEL_29;
    }
  }
LABEL_31:

  return v14;
}

- (_NSRange)_findRangeForEnumerationType:(int64_t)a3 atRelativeIncrement:(int64_t)a4 fromPosition:(id)a5 options:(unint64_t)a6
{
  id v9 = a5;
  uint64_t v83 = 0;
  BOOL v84 = &v83;
  uint64_t v85 = 0x3010000000;
  char v86 = "";
  long long v87 = xmmword_23AC2C560;
  uint64_t v78 = 0;
  long long v79 = &v78;
  uint64_t v80 = 0x3010000000;
  uint64_t v81 = "";
  long long v82 = xmmword_23AC2C560;
  uint64_t v10 = [v9 index];
  uint64_t v11 = [(SRCSTextEditing *)self provider];
  id v12 = [v11 lastPositionTextMarker];
  uint64_t v13 = [v12 index];

  uint64_t v14 = v13 - 1;
  if (v10 <= v13) {
    uint64_t v15 = v10;
  }
  else {
    uint64_t v15 = v13 - 1;
  }
  uint64_t v58 = v9;
  switch(a3)
  {
    case 2:
      uint64_t v16 = 10;
      break;
    case 3:
      uint64_t v16 = 25;
      break;
    case 4:
      uint64_t v16 = 750;
      break;
    default:
      uint64_t v18 = 0;
      goto LABEL_16;
  }
  if (a4 >= 0) {
    int64_t v17 = -v16;
  }
  else {
    int64_t v17 = 2 * a4 * v16;
  }
  uint64_t v18 = v17 + v15;
  if (a4 > 0) {
    v16 *= 2 * a4;
  }
  uint64_t v14 = v16 + v15;
LABEL_16:
  if (v14 < v13) {
    uint64_t v19 = v14 + 1;
  }
  else {
    uint64_t v19 = v13;
  }
  uint64_t v20 = [(SRCSTextEditing *)self provider];
  unint64_t v21 = [(SRCSTextEditing *)self provider];
  uint64_t v22 = v18 & ~(v18 >> 63);
  unint64_t v23 = v19 - v22;
  int64_t v24 = objc_msgSend((id)objc_msgSend(v21, "textMarkerRangeClass"), "markerRangeWithNSRange:", v22, v23);
  uint64_t v25 = [v20 stringForTextMarkerRange:v24];

  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  if (a4 >= 0) {
    int64_t v26 = a4;
  }
  else {
    int64_t v26 = -a4;
  }
  v77[3] = v26;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  char v76 = 0;
  uint64_t v71 = 0;
  uint64_t v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 0;
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __102__SRCSTextEditing_Enumeration___findRangeForEnumerationType_atRelativeIncrement_fromPosition_options___block_invoke;
  v59[3] = &unk_264DC9A00;
  int64_t v66 = a4;
  uint64_t v67 = v15 - v22;
  uint64_t v61 = v75;
  unint64_t v62 = v77;
  int64_t v68 = a3;
  id v27 = v25;
  id v60 = v27;
  NSUInteger v63 = &v83;
  char v64 = &v71;
  uint64_t v69 = v22;
  unint64_t v70 = v23;
  int64_t v65 = &v78;
  objc_msgSend(v27, "enumerateSubstringsInRange:options:usingBlock:", 0, v23, a3 | ((unint64_t)a4 >> 63 << 8), v59);
  uint64_t v28 = v84;
  uint64_t v29 = v84[4];
  if (v29 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v30 = v79[4];
    if (v30 != 0x7FFFFFFFFFFFFFFFLL && a3 == 2 && v79[5] + v30 == v13 && a4 >= 1 && !*((unsigned char *)v72 + 24))
    {
      v84[4] = v13;
      v28[5] = 0;
    }
    goto LABEL_63;
  }
  switch(a3)
  {
    case 1:
      if ((v57 & 1) == 0)
      {
        uint64_t v39 = v29 - v22 + v84[5];
        if (v39 >= 0 && v39 < v23)
        {
          uint64_t v40 = [MEMORY[0x263F08708] newlineCharacterSet];
          uint64_t v41 = objc_msgSend(v27, "rangeOfCharacterFromSet:options:range:", v40, 0, v39, 1);
          uint64_t v43 = v42;

          if (v41 != 0x7FFFFFFFFFFFFFFFLL && v41 == v39)
          {
            id v37 = v84;
            uint64_t v38 = v84[5] + v43;
            goto LABEL_49;
          }
        }
      }
      break;
    case 3:
      uint64_t v44 = v29 - v22 + v84[5];
      if (v44 >= 0 && v23 > v44)
      {
        char v45 = [MEMORY[0x263F08708] punctuationCharacterSet];
        uint64_t v46 = objc_msgSend(v27, "rangeOfCharacterFromSet:options:range:", v45, 0, v44, v23 - v44);
        uint64_t v48 = v47;

        if (v46 != 0x7FFFFFFFFFFFFFFFLL && v46 == v44)
        {
          id v37 = v84;
          uint64_t v38 = v84[5] + v48;
          goto LABEL_49;
        }
      }
      break;
    case 4:
      if (v57)
      {
        uint64_t v31 = v84[5];
        if (v31)
        {
          uint64_t v32 = [MEMORY[0x263F08708] newlineCharacterSet];
          uint64_t v33 = v29 - v22;
          uint64_t v34 = objc_msgSend(v27, "rangeOfCharacterFromSet:options:range:", v32, 4, v29 - v22, v31);
          uint64_t v36 = v35;

          if (v34 != 0x7FFFFFFFFFFFFFFFLL && v34 + v36 == v31 + v33)
          {
            id v37 = v84;
            uint64_t v38 = v84[5] - v36;
LABEL_49:
            v37[5] = v38;
          }
        }
      }
      break;
    default:
      if (a3 == 2 && !*((unsigned char *)v72 + 24) && a4 >= 1 && v84[5] + v29 == v13)
      {
        v84[4] = v13;
        v28[5] = 0;
      }
      break;
  }
  if ((v57 & 4) != 0)
  {
    uint64_t v49 = v79[4];
    uint64_t v28 = v84;
    if (v49 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v50 = v84[4];
      if (v50 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a4 < 0)
        {
          v84[5] = v49 - v50 + v79[5];
        }
        else if (a4)
        {
          uint64_t v51 = v50 - v49 + v84[5];
          v84[4] = v49;
          v28[5] = v51;
        }
      }
    }
  }
  else
  {
    uint64_t v28 = v84;
  }
LABEL_63:
  NSUInteger v52 = v28[4];
  NSUInteger v53 = v28[5];

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(v75, 8);
  _Block_object_dispose(v77, 8);

  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v83, 8);

  NSUInteger v54 = v52;
  NSUInteger v55 = v53;
  result.NSUInteger length = v55;
  result.NSUInteger location = v54;
  return result;
}

void __102__SRCSTextEditing_Enumeration___findRangeForEnumerationType_atRelativeIncrement_fromPosition_options___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v11 = a2;
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v12 + 24)) {
    goto LABEL_19;
  }
  uint64_t v14 = *(void *)(a1 + 80);
  unint64_t v13 = *(void *)(a1 + 88);
  if (v14 < 0)
  {
    if (a4 && v13 == a3 + a4)
    {
LABEL_17:
      *(unsigned char *)(v12 + 24) = 1;
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v19 = *(void *)(v18 + 24);
      BOOL v17 = v19 < 1;
      uint64_t v20 = v19 - 1;
      if (!v17) {
        *(void *)(v18 + 24) = v20;
      }
      goto LABEL_19;
    }
  }
  else if (v13 == a3)
  {
    goto LABEL_17;
  }
  if (v13 < a3 || v13 > a3 + a4 || (uint64_t v15 = *(void *)(a1 + 96), v15 == 2))
  {
    BOOL v16 = v14 < 0;
    if (v13 >= a3) {
      BOOL v16 = 1;
    }
    BOOL v17 = v13 > a3 && v14 <= -1;
    if (v17 || !v16) {
      goto LABEL_17;
    }
  }
  else
  {
    if (v14 < 0)
    {
      char v27 = 1;
      if (v13 == a3 + a4 - 1 && v15 == 4 && a4 >= 2)
      {
        id v29 = v11;
        BOOL v28 = objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:") == 10;
        id v11 = v29;
        char v27 = !v28;
        uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
      }
    }
    else
    {
      char v27 = 1;
    }
    *(unsigned char *)(v12 + 24) = v27;
  }
LABEL_19:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    goto LABEL_39;
  }
  uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (!v21)
  {
    uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(void *)(v26 + 32) == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(void *)(v26 + 32) = *(void *)(a1 + 104) + a3;
      *(void *)(v26 + 40) = a4;
      if (!*(void *)(a1 + 80) && *(void *)(a1 + 88) == a3 + a4 && *(void *)(a1 + 96) != 1) {
        goto LABEL_38;
      }
    }
    else if (*(void *)(a1 + 80) || *(void *)(a1 + 88) == a3 || *(void *)(a1 + 96) == 1)
    {
      *(void *)(v26 + 32) = *(void *)(a1 + 104) + a3;
      *(void *)(v26 + 40) = a4;
    }
    *a7 = 1;
LABEL_38:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    goto LABEL_39;
  }
  uint64_t v22 = *(void *)(a1 + 80);
  if (v22 < 0) {
    uint64_t v22 = -v22;
  }
  if (v21 == v22 - 1 && (uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8), *(void *)(v23 + 32) == 0x7FFFFFFFFFFFFFFFLL))
  {
    *(void *)(v23 + 32) = *(void *)(a1 + 104) + a3;
    int64_t v24 = (unint64_t *)(v23 + 40);
  }
  else
  {
    uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
    *(void *)(v25 + 32) = *(void *)(a1 + 104) + a3;
    int64_t v24 = (unint64_t *)(v25 + 40);
  }
  *int64_t v24 = a4;
  --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
LABEL_39:
}

@end