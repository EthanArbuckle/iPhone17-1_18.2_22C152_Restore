@interface VSTextPreProcessorRule
- (VSTextPreProcessorRule)initWithDictionaryRepresentation:(id)a3;
- (id)matchedString:(id)a3 forTokenInRange:(id *)a4;
- (void)dealloc;
@end

@implementation VSTextPreProcessorRule

- (id)matchedString:(id)a3 forTokenInRange:(id *)a4
{
  if (!a3) {
    return 0;
  }
  CFStringRef matchPattern = (const __CFString *)self->_matchPattern;
  if (!matchPattern || CFStringCompareWithOptions((CFStringRef)a3, matchPattern, *(CFRange *)a4, !self->_caseSensitive)) {
    return 0;
  }
  replacement = self->_replacement;
  if (self->_eatPunctuation)
  {
    v14.location = 0;
    v14.CFIndex length = 0;
    CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
    CFIndex v11 = a4->var1 + a4->var0;
    for (CFIndex i = objc_msgSend(a3, "length", 0) - v11; ; i -= length)
    {
      v15.location = v11;
      v15.CFIndex length = i;
      if (!CFStringFindCharacterFromSet((CFStringRef)a3, Predefined, v15, 8uLL, &v14)) {
        break;
      }
      CFIndex length = v14.length;
      a4->var1 += v14.length;
      v11 += length;
    }
  }
  return replacement;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VSTextPreProcessorRule;
  [(VSTextPreProcessorRule *)&v3 dealloc];
}

- (VSTextPreProcessorRule)initWithDictionaryRepresentation:(id)a3
{
  v5 = (void *)[a3 objectForKey:@"match"];
  v6 = (void *)[a3 objectForKey:@"replace"];
  v7 = (void *)[a3 objectForKey:@"case-sensitive"];
  v8 = (void *)[a3 objectForKey:@"eat-punct"];
  if ([v5 length])
  {
    v9 = [(VSTextPreProcessorRule *)self init];
    if (v9)
    {
      v9->_CFStringRef matchPattern = (NSString *)v5;
      v9->_replacement = (NSString *)v6;
      if (v7) {
        char v10 = [v7 BOOLValue];
      }
      else {
        char v10 = 1;
      }
      v9->_caseSensitive = v10;
      v9->_eatPunctuation = [v8 BOOLValue];
    }
  }
  else
  {

    return 0;
  }
  return v9;
}

@end