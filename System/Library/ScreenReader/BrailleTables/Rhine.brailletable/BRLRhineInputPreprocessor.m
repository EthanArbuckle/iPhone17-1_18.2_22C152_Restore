@interface BRLRhineInputPreprocessor
- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6;
@end

@implementation BRLRhineInputPreprocessor

- (id)preprocessPrintString:(id)a3 withLocationMap:(id *)a4 isEightDot:(BOOL)a5 textFormattingRanges:(id)a6
{
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [&off_90FE8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      v10 = 0;
      v11 = v6;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(&off_90FE8);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
        unsigned __int16 v15 = 0;
        unsigned __int16 v15 = (unsigned __int16)[v12 unsignedIntValue];
        v13 = +[NSString stringWithCharacters:&v15 length:1];
        id v6 = [v11 stringByReplacingOccurrencesOfString:v13 withString:@" "];

        v10 = (char *)v10 + 1;
        v11 = v6;
      }
      while (v8 != v10);
      id v8 = [&off_90FE8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v6;
}

@end