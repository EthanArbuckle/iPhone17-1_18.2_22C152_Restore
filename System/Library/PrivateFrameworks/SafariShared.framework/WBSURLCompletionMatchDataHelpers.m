@interface WBSURLCompletionMatchDataHelpers
+ (BOOL)typedStringMatchesTitleAndURLAutocompleteTriggers:(id)a3 title:(id)a4 urlString:(id)a5 autoCompleteTriggers:(id)a6 isStrengthened:(BOOL)a7;
@end

@implementation WBSURLCompletionMatchDataHelpers

+ (BOOL)typedStringMatchesTitleAndURLAutocompleteTriggers:(id)a3 title:(id)a4 urlString:(id)a5 autoCompleteTriggers:(id)a6 isStrengthened:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v11 = (NSString *)a3;
  v27 = (NSString *)a4;
  v12 = (NSString *)a5;
  id v13 = a6;
  if (+[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::onceToken != -1) {
    dispatch_once(&+[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::onceToken, &__block_literal_global_113);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v15)
  {
    BOOL v25 = 0;
    goto LABEL_25;
  }
  uint64_t v16 = *(void *)v29;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v29 != v16) {
        objc_enumerationMutation(v14);
      }
      v18 = *(__CFString **)(*((void *)&v28 + 1) + 8 * i);
      if ([(__CFString *)v18 safari_hasPrefix:v11]) {
        goto LABEL_24;
      }
      if ([(NSString *)v11 safari_hasPrefix:v18])
      {
        if (!v7
          || (typedStringMatchesTitleOrURLWithAutocompleteTrigger(v11, v27, v12, &v18->isa, (const __CFCharacterSet *)+[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::delimiters) & 1) != 0)
        {
          goto LABEL_24;
        }
      }
      else if (!v7)
      {
        continue;
      }
      CFCharacterSetRef v19 = (const __CFCharacterSet *)+[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::delimiters;
      UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(v18, 0);
      if (!CFCharacterSetIsCharacterMember(v19, CharacterAtIndex))
      {
        CFCharacterSetRef v21 = (const __CFCharacterSet *)+[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::delimiters;
        UniChar v22 = CFStringGetCharacterAtIndex(v18, [(__CFString *)v18 length] - 1);
        if (!CFCharacterSetIsCharacterMember(v21, v22)) {
          continue;
        }
      }
      v23 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v24 = [(__CFString *)v18 safari_stringByRemovingCharactersInSet:v23];

      if ([(NSString *)v11 safari_hasPrefix:v24]
        && (typedStringMatchesTitleOrURLWithAutocompleteTrigger(v11, v27, v12, (NSString *)v24, (const __CFCharacterSet *)+[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::delimiters) & 1) != 0)
      {

LABEL_24:
        BOOL v25 = 1;
        goto LABEL_25;
      }
    }
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    BOOL v25 = 0;
    if (v15) {
      continue;
    }
    break;
  }
LABEL_25:

  return v25;
}

CFCharacterSetRef __138__WBSURLCompletionMatchDataHelpers_typedStringMatchesTitleAndURLAutocompleteTriggers_title_urlString_autoCompleteTriggers_isStrengthened___block_invoke()
{
  CFCharacterSetRef result = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  +[WBSURLCompletionMatchDataHelpers typedStringMatchesTitleAndURLAutocompleteTriggers:title:urlString:autoCompleteTriggers:isStrengthened:]::delimiters = (uint64_t)result;
  return result;
}

@end