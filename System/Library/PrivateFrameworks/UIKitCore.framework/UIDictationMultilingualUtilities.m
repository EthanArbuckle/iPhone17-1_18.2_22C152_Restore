@interface UIDictationMultilingualUtilities
+ (BOOL)hasMultilingualAttributesForAttributedString:(id)a3;
+ (id)multilingualAttributesForAttributedString:(id)a3;
+ (id)textReplacementFromMultilingualString:(id)a3 replacementRange:(id)a4 stringToReplace:(id)a5;
@end

@implementation UIDictationMultilingualUtilities

+ (BOOL)hasMultilingualAttributesForAttributedString:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = objc_msgSend(a1, "multilingualAttributesForAttributedString:");
  v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"bestAlternatives"];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)multilingualAttributesForAttributedString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 length])
  {
    v5 = [v4 attribute:@"_UITextInputDictationResultMetadata" atIndex:0 effectiveRange:0];
    id v6 = [v5 objectForKey:@"bestText"];
    if (v6)
    {
      if (qword_1EB261A78 != -1) {
        dispatch_once(&qword_1EB261A78, &__block_literal_global_757_0);
      }
      v7 = [v6 stringByTrimmingCharactersInSet:qword_1EB261A70];
    }
    else
    {
      v7 = 0;
    }

    id v9 = [v4 string];
    if (v9)
    {
      if (qword_1EB261A78 != -1) {
        dispatch_once(&qword_1EB261A78, &__block_literal_global_757_0);
      }
      v10 = [v9 stringByTrimmingCharactersInSet:qword_1EB261A70];
    }
    else
    {
      v10 = 0;
    }

    if ([v10 isEqualToString:v7]) {
      id v11 = v5;
    }
    else {
      id v11 = 0;
    }
    id v8 = v11;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)textReplacementFromMultilingualString:(id)a3 replacementRange:(id)a4 stringToReplace:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 text];
  id v11 = [v9 text];
  v12 = +[UITextReplacement replacementWithRange:v8 original:v7 replacement:v10 menuTitle:v11];

  v13 = [v9 dominantLanguage];
  v14 = [v9 correctionIdentifier];
  v15 = [v9 interactionIdentifier];
  v16 = [v9 phrases];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __107__UIDictationMultilingualUtilities_textReplacementFromMultilingualString_replacementRange_stringToReplace___block_invoke;
  v23[3] = &unk_1E52FB5F0;
  id v24 = v13;
  id v25 = v7;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v7;
  id v21 = v13;
  [v12 setReplacementCompletionBlock:v23];

  return v12;
}

void __107__UIDictationMultilingualUtilities_textReplacementFromMultilingualString_replacementRange_stringToReplace___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a2;
  id v9 = +[UIDictationController sharedInstance];
  [v9 logDidAcceptReplacement:v8 replacementLanguageCode:*(void *)(a1 + 32) originalText:*(void *)(a1 + 40) correctionIdentifier:*(void *)(a1 + 48) interactionIdentifier:*(void *)(a1 + 56)];

  if ([*(id *)(a1 + 64) count])
  {
    [v7 replaceRange:v12 withText:&stru_1ED0E84C0];
    v10 = [[UIDictationSerializableResults alloc] initWithPhrases:*(void *)(a1 + 64)];
    id v11 = +[UIDictationController sharedInstance];
    [v11 insertSerializedDictationResult:v10 withCorrectionIdentifier:*(void *)(a1 + 48)];
  }
}

@end