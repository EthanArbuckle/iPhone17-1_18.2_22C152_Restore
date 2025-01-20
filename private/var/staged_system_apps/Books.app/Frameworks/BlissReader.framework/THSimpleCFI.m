@interface THSimpleCFI
+ (id)fragmentFromPathString:(id)a3;
+ (id)p_transcribeWithoutAssertions:(id)a3;
+ (id)pathStringFromFragment:(id)a3;
+ (id)simpleCFIWithString:(id)a3;
- (BOOL)hasParent;
- (BOOL)valid;
- (NSArray)components;
- (NSString)cfiString;
- (NSString)originalCFIString;
- (THSimpleCFI)initWithComponents:(id)a3;
- (THSimpleCFI)initWithString:(id)a3;
- (id)p_parseFromString:(id)a3;
- (id)parent;
- (void)dealloc;
- (void)setCfiString:(id)a3;
- (void)setComponents:(id)a3;
- (void)setOriginalCFIString:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation THSimpleCFI

- (THSimpleCFI)initWithString:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THSimpleCFI;
  v4 = [(THSimpleCFI *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(THSimpleCFI *)v4 setValid:0];
    [(THSimpleCFI *)v5 setOriginalCFIString:a3];
    [(THSimpleCFI *)v5 setComponents:+[NSArray arrayWithArray:[(THSimpleCFI *)v5 p_parseFromString:a3]]];
    [(THSimpleCFI *)v5 setCfiString:[(NSArray *)[(THSimpleCFI *)v5 components] componentsJoinedByString:&stru_46D7E8]];
  }
  return v5;
}

- (THSimpleCFI)initWithComponents:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THSimpleCFI;
  v4 = [(THSimpleCFI *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(THSimpleCFI *)v4 setValid:1];
    [(THSimpleCFI *)v5 setComponents:+[NSArray arrayWithArray:a3]];
    [(THSimpleCFI *)v5 setCfiString:[(NSArray *)[(THSimpleCFI *)v5 components] componentsJoinedByString:&stru_46D7E8]];
    [(THSimpleCFI *)v5 setOriginalCFIString:[(THSimpleCFI *)v5 description]];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THSimpleCFI;
  [(THSimpleCFI *)&v3 dealloc];
}

- (BOOL)hasParent
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(NSArray *)[(THSimpleCFI *)self components] reverseObjectEnumerator];
  id v3 = [(NSEnumerator *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) isAcceptableLeaf])
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v3 = [(NSEnumerator *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return (char)v3;
}

- (id)parent
{
  uint64_t v3 = [(NSArray *)[(THSimpleCFI *)self components] count];
  if (v3 < 2) {
    return 0;
  }
  for (uint64_t i = v3 - 1; ; --i)
  {
    uint64_t v5 = i - 1;
    if ([-[NSArray objectAtIndex:](-[THSimpleCFI components](self, "components"), "objectAtIndex:", i - 1) isAcceptableLeaf])break; {
    if (v5 <= 0)
    }
      return 0;
  }
  objc_super v7 = -[THSimpleCFI initWithComponents:]([THSimpleCFI alloc], "initWithComponents:", -[NSArray subarrayWithRange:]([(THSimpleCFI *)self components], "subarrayWithRange:", 0, i));

  return v7;
}

- (id)p_parseFromString:(id)a3
{
  id v4 = [objc_opt_class() p_transcribeWithoutAssertions:a3];
  id v5 = +[NSMutableArray array];
  v6 = +[NSScanner scannerWithString:v4];
  objc_super v7 = +[NSCharacterSet characterSetWithCharactersInString:@"/:^~@[],"];
  long long v8 = +[NSCharacterSet characterSetWithCharactersInString:@"!"];
  v15 = +[NSString string];
  if ([(NSScanner *)v6 isAtEnd]) {
    goto LABEL_27;
  }
  while (1)
  {
    if ([(NSScanner *)v6 scanCharactersFromSet:v8 intoString:&v15]
      && [(NSString *)v15 length])
    {
      long long v9 = +[THSimpleCFIIndirection indirection];
LABEL_16:
      [v5 addObject:v9];
      goto LABEL_17;
    }
    if (![(NSScanner *)v6 scanCharactersFromSet:v7 intoString:&v15]
      || (char *)[(NSString *)v15 length] != (char *)&dword_0 + 1)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSimpleCFI p_parseFromString:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THSimpleCFI.m") lineNumber:175 description:@"failed to find expected character during scanning of '%@'", v4];
      goto LABEL_27;
    }
    signed __int8 v10 = [(NSString *)v15 characterAtIndex:0];
    uint64_t v14 = 0;
    uint64_t v11 = v10;
    if ((int)v11 > 57) {
      break;
    }
    if (v11 != 47)
    {
      if (v11 == 44) {
        goto LABEL_25;
      }
      goto LABEL_26;
    }
    if ([(NSScanner *)v6 scanInteger:&v14] && (v14 & 0x8000000000000000) == 0)
    {
      long long v9 = +[THSimpleCFIChild childWithIndex:](THSimpleCFIChild, "childWithIndex:");
      goto LABEL_16;
    }
LABEL_17:
    if ([(NSScanner *)v6 isAtEnd]) {
      goto LABEL_27;
    }
  }
  if (v11 == 58)
  {
    if (![(NSScanner *)v6 scanInteger:&v14] || v14 < 0) {
      goto LABEL_17;
    }
    long long v9 = +[THSimpleCFICharacterOffset characterOffsetWithOffset:](THSimpleCFICharacterOffset, "characterOffsetWithOffset:");
    goto LABEL_16;
  }
  char v12 = v10 - 64;
  if ((v11 - 64) <= 0x3E)
  {
    if (((1 << v12) & 0x4000000040000001) != 0)
    {
LABEL_25:
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSimpleCFI p_parseFromString:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THSimpleCFI.m") lineNumber:156 description:@"cfi parsing: refused '%c' because it is complex" v11];
      goto LABEL_27;
    }
    if (((1 << v12) & 0x28000000) != 0)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSimpleCFI p_parseFromString:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THSimpleCFI.m") lineNumber:162 description:@"cfi parsing: refused '%c' because we expected to parse core input"];
      goto LABEL_27;
    }
  }
LABEL_26:
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSimpleCFI p_parseFromString:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Navigator/THSimpleCFI.m") lineNumber:167 description:@"cfi parsing: unexpected: %c" v11];
LABEL_27:
  [(THSimpleCFI *)self setValid:[(NSScanner *)v6 isAtEnd]];
  return v5;
}

+ (id)pathStringFromFragment:(id)a3
{
  if (!objc_msgSend(a3, "hasPrefix:", @"#epubcfi(")
    || ![a3 hasSuffix:@""]))
  {
    return 0;
  }
  id v4 = (char *)[a3 length] - 10;

  return [a3 substringWithRange:9, v4];
}

+ (id)fragmentFromPathString:(id)a3
{
  id v3 = [@"#epubcfi(" stringByAppendingString:a3];

  return [v3 stringByAppendingString:@""]);
}

+ (id)simpleCFIWithString:(id)a3
{
  id v3 = [[THSimpleCFI alloc] initWithString:a3];

  return v3;
}

+ (id)p_transcribeWithoutAssertions:(id)a3
{
  id v3 = +[NSScanner scannerWithString:a3];
  id v4 = +[NSMutableArray array];
  long long v8 = 0;
  if (![(NSScanner *)v3 isAtEnd])
  {
    do
    {
      long long v8 = +[NSString string];
      unsigned int v5 = [(NSScanner *)v3 scanUpToString:@"[" intoString:&v8];
      [v4 addObject:v8];
      if (v5 && [(NSScanner *)v3 scanUpToString:@"]" intoString:&v7]) {
        [(NSScanner *)v3 scanString:@"]" intoString:&v7];
      }
    }
    while (![(NSScanner *)v3 isAtEnd]);
  }
  return [v4 componentsJoinedByString:&stru_46D7E8];
}

- (NSString)originalCFIString
{
  return self->originalCFIString;
}

- (void)setOriginalCFIString:(id)a3
{
}

- (NSArray)components
{
  return self->mComponents;
}

- (void)setComponents:(id)a3
{
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (NSString)cfiString
{
  return self->cfiString;
}

- (void)setCfiString:(id)a3
{
}

@end