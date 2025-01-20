@interface _PSAutocompleteSearchUtilities
+ (BOOL)searchString:(id)a3 containsOnlyCharactersInSet:(id)a4;
+ (_NSRange)rangeForSearchTerm:(id)a3 inTarget:(id)a4 tokenizedByCharacterSet:(id)a5;
+ (id)emojiCharacterSet;
@end

@implementation _PSAutocompleteSearchUtilities

+ (_NSRange)rangeForSearchTerm:(id)a3 inTarget:(id)a4 tokenizedByCharacterSet:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v7 = a4;
  [v7 componentsSeparatedByCharactersInSet:a5];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9)
  {
    uint64_t v11 = v9;
    id v28 = v8;
    NSUInteger v29 = 0;
    uint64_t v12 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v8);
        }
        v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v15 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        v16 = [v14 stringByTrimmingCharactersInSet:v15];

        uint64_t v17 = [v7 rangeOfString:v16];
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v19 = v17;
          if (v17 + v18 <= (unint64_t)[v7 length])
          {
            v20 = objc_msgSend(v7, "substringWithRange:", v19, objc_msgSend(v7, "length") - v19);
            v21 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
            v22 = [v20 stringByTrimmingCharactersInSet:v21];
            uint64_t v23 = [v22 rangeOfString:v30 options:393];
            NSUInteger v29 = v24;

            if (v23 != 0x7FFFFFFFFFFFFFFFLL)
            {

              uint64_t v10 = v23;
              id v8 = v28;
              goto LABEL_14;
            }
            id v8 = v28;
          }
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:
    NSUInteger v25 = v29;
  }
  else
  {
    NSUInteger v25 = 0;
  }

  NSUInteger v26 = v10;
  NSUInteger v27 = v25;
  result.length = v27;
  result.location = v26;
  return result;
}

+ (id)emojiCharacterSet
{
  v2 = (void *)CEMCreateEmojiCharacterSet();

  return v2;
}

+ (BOOL)searchString:(id)a3 containsOnlyCharactersInSet:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    unint64_t v7 = 0;
    do
    {
      char v8 = objc_msgSend(v6, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", v7));
      if ((v8 & 1) == 0) {
        break;
      }
      ++v7;
    }
    while ([v5 length] > v7);
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

@end