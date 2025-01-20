@interface Tokenizer
+ (id)getAllEmojis:(id)a3;
+ (id)processMessagesWithCFStringTokenizer:(id)a3;
+ (id)processMessagesWithPunctuationAndWhiteSpace:(id)a3;
+ (id)tokenizeMessages:(id)a3 withType:(int64_t)a4;
@end

@implementation Tokenizer

+ (id)tokenizeMessages:(id)a3 withType:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 2) {
      [a1 getAllEmojis:v6];
    }
    else {
    uint64_t v7 = [a1 processMessagesWithCFStringTokenizer:v6];
    }
  }
  else
  {
    uint64_t v7 = [a1 processMessagesWithPunctuationAndWhiteSpace:v6];
  }
  v8 = (void *)v7;

  return v8;
}

+ (id)processMessagesWithPunctuationAndWhiteSpace:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
  v5 = +[NSCharacterSet punctuationCharacterSet];
  [v4 formUnionWithCharacterSet:v5];

  [v4 removeCharactersInString:@"'-&"];
  id v6 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v3;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "componentsSeparatedByCharactersInSet:", v4, (void)v14);
        [v6 addObjectsFromArray:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)processMessagesWithCFStringTokenizer:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(__CFString **)(*((void *)&v17 + 1) + 8 * i);
        v23.length = (CFIndex)[(__CFString *)v10 length];
        v23.location = 0;
        v11 = CFStringTokenizerCreate(0, v10, v23, 4uLL, 0);
        for (j = v11; ; v11 = j)
        {
          CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(v11);
          if (!Token) {
            break;
          }
          if ((Token & 0x10) == 0)
          {
            CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(j);
            long long v15 = -[__CFString substringWithRange:](v10, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
            [v4 addObject:v15];
          }
        }
        CFRelease(j);
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)getAllEmojis:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_10000FB94;
  v21 = sub_10000FBA4;
  id v22 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [v8 length];
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_10000FBAC;
        v12[3] = &unk_100030810;
        v12[4] = &v17;
        objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 2, v12);
      }
      id v5 = [v4 countByEnumeratingWithState:&v13 objects:v23 count:16];
    }
    while (v5);
  }

  id v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

@end