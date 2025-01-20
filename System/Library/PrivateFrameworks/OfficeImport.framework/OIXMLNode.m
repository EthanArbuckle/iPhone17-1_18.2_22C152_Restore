@interface OIXMLNode
+ (void)_escapeCharacters:(const unsigned __int16 *)a3 amount:(unsigned int)a4 escapeWhiteSpaces:(BOOL)a5 inString:(id)a6 appendingToString:(__CFString *)a7;
+ (void)_escapeHTMLAttributeCharacters:(id)a3 withQuote:(unsigned __int16)a4 appendingToString:(__CFString *)a5;
- (NSString)XMLString;
- (NSString)closingTagString;
- (NSString)name;
- (NSString)openingTagString;
- (NSString)stringValue;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_appendXMLStringToString:(__CFString *)a3 level:(int)a4;
- (void)setStringValue:(id)a3;
@end

@implementation OIXMLNode

- (void)setStringValue:(id)a3
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, @"OIXMLNode.m", 38, @"Please override -[%@ %@]", v5, v6 object file lineNumber description];
}

- (NSString)name
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"OIXMLNode.m", 26, @"Please override -[%@ %@]", v5, v6 object file lineNumber description];

  return 0;
}

- (NSString)XMLString
{
  v3 = [MEMORY[0x263F089D8] string];
  [(OIXMLNode *)self _appendXMLStringToString:v3 level:0];
  return (NSString *)v3;
}

- (void)_appendXMLStringToString:(__CFString *)a3 level:(int)a4
{
  objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3, *(void *)&a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"OIXMLNode.m", 158, @"Please override -[%@ %@]", v6, v7 object file lineNumber description];
}

- (NSString)stringValue
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"OIXMLNode.m", 32, @"Please override -[%@ %@]", v5, v6 object file lineNumber description];

  return 0;
}

+ (void)_escapeCharacters:(const unsigned __int16 *)a3 amount:(unsigned int)a4 escapeWhiteSpaces:(BOOL)a5 inString:(id)a6 appendingToString:(__CFString *)a7
{
  BOOL v8 = a5;
  theString = (__CFString *)a6;
  if (!theString) {
    goto LABEL_44;
  }
  if (qword_2689BCD60 != -1) {
    dispatch_once(&qword_2689BCD60, &__block_literal_global_110);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v33 = 0u;
  uint64_t v11 = [(__CFString *)theString length];
  CFStringRef v40 = theString;
  uint64_t v43 = 0;
  int64_t v44 = v11;
  CharactersPtr = CFStringGetCharactersPtr(theString);
  CStringPtr = 0;
  v41 = (UniChar *)CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
  }
  int64_t v45 = 0;
  int64_t v46 = 0;
  v42 = CStringPtr;
  if (!v11)
  {
    CFIndex v15 = 0;
    goto LABEL_42;
  }
  int64_t v14 = 0;
  CFIndex v15 = 0;
  char v16 = 0;
  do
  {
    if (v14 < 0 || (int64_t v17 = v44, v44 <= v14))
    {
      UniChar v20 = 0;
      if (!v8) {
        goto LABEL_19;
      }
    }
    else
    {
      v18 = v41;
      if (v41)
      {
        int64_t v19 = v43 + v14;
        goto LABEL_12;
      }
      if (!v42)
      {
        if (v46 <= v14 || (int64_t v27 = v45, v45 > v14))
        {
          int64_t v28 = v14 - 4;
          if ((unint64_t)v14 < 4) {
            int64_t v28 = 0;
          }
          if (v28 + 64 < v44) {
            int64_t v17 = v28 + 64;
          }
          int64_t v45 = v28;
          int64_t v46 = v17;
          v47.location = v43 + v28;
          v47.length = v17 - v28;
          CFStringGetCharacters(v40, v47, buffer);
          int64_t v27 = v45;
        }
        int64_t v19 = v14 - v27;
        v18 = buffer;
LABEL_12:
        UniChar v20 = v18[v19];
        if (!v8) {
          goto LABEL_19;
        }
        goto LABEL_15;
      }
      UniChar v20 = v42[v43 + v14];
      if (!v8) {
        goto LABEL_19;
      }
    }
LABEL_15:
    if (v20 != 32)
    {
      char v16 = 0;
LABEL_19:
      uint64_t v22 = a4;
      v23 = a3;
      if (!a4) {
        goto LABEL_26;
      }
      while (1)
      {
        int v24 = *v23++;
        if (v24 == v20) {
          break;
        }
        if (!--v22) {
          goto LABEL_26;
        }
      }
      v49.length = v14 - v15;
      v49.location = v15;
      CFStringRef v25 = CFStringCreateWithSubstring(0, theString, v49);
      CFStringAppend(a7, v25);
      CFRelease(v25);
      CFStringRef v26 = (const __CFString *)NSMapGet((NSMapTable *)_MergedGlobals_1, (const void *)v20);
      CFStringAppend(a7, v26);
LABEL_24:
      CFIndex v15 = v14 + 1;
      goto LABEL_26;
    }
    if (v16)
    {
      v48.length = v14 - v15;
      v48.location = v15;
      CFStringRef v21 = CFStringCreateWithSubstring(0, theString, v48);
      CFStringAppend(a7, v21);
      CFRelease(v21);
      CFStringAppend(a7, @"&nbsp;");
      char v16 = 0;
      goto LABEL_24;
    }
    char v16 = 1;
LABEL_26:
    ++v14;
  }
  while (v14 != v11);
  if (!v15)
  {
    CFStringAppend(a7, theString);
    goto LABEL_44;
  }
LABEL_42:
  v50.length = v11 - v15;
  v50.location = v15;
  CFStringRef v29 = CFStringCreateWithSubstring(0, theString, v50);
  if (v29)
  {
    CFStringRef v30 = v29;
    CFStringAppend(a7, v29);
    CFRelease(v30);
  }
LABEL_44:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"OIXMLNode.m", 20, @"Please override -[%@ %@]", v6, v7 object file lineNumber description];

  return 0;
}

+ (void)_escapeHTMLAttributeCharacters:(id)a3 withQuote:(unsigned __int16)a4 appendingToString:(__CFString *)a5
{
  id v7 = a3;
  CFIndex Length = CFStringGetLength(a5);
  v9[0] = 38;
  v9[1] = a4;
  +[OIXMLNode _escapeCharacters:v9 amount:2 escapeWhiteSpaces:0 inString:v7 appendingToString:a5];

  v10.length = CFStringGetLength(a5) - Length;
  v10.location = Length;
  CFStringFindAndReplace(a5, @"&amp;{", @"&{", v10, 0);
}

void __83__OIXMLNode__escapeCharacters_amount_escapeWhiteSpaces_inString_appendingToString___block_invoke()
{
  memset(&keyCallBacks, 0, 40);
  keyCallBacks.notAKeyMarker = (const void *)0x8000000000000000;
  NSMapTableValueCallBacks v2 = *(NSMapTableValueCallBacks *)*(void *)&MEMORY[0x263F08420];
  v0 = NSCreateMapTable(&keyCallBacks, &v2, 4uLL);
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;

  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0x3C, @"&lt;");
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0x26, @"&amp;");
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0x27, @"&apos;");
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)9, @" &nbsp; &nbsp;");
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0x22, @"&quot;");
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0xA0, @"&nbsp;");
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0x7EC, @"<br>");
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0x7ED, @"<br>");
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0xB, @"<br>");
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0xD, @"<br>");
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0xE, @"<br>");
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0xF0A7, @"&bull;");
  NSMapInsert((NSMapTable *)_MergedGlobals_1, (const void *)0xF0B7, @"&bull;");
}

- (NSString)openingTagString
{
  return (NSString *)&stru_26EBF24D8;
}

- (NSString)closingTagString
{
  return (NSString *)&stru_26EBF24D8;
}

@end