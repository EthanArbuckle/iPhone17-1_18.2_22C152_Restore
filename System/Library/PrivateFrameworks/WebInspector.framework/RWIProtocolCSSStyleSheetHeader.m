@interface RWIProtocolCSSStyleSheetHeader
- (BOOL)disabled;
- (BOOL)isInline;
- (NSString)frameId;
- (NSString)sourceURL;
- (NSString)styleSheetId;
- (NSString)title;
- (RWIProtocolCSSStyleSheetHeader)initWithStyleSheetId:(id)a3 frameId:(id)a4 sourceURL:(id)a5 origin:(int64_t)a6 title:(id)a7 disabled:(BOOL)a8 isInline:(BOOL)a9 startLine:(double)a10 startColumn:(double)a11;
- (double)startColumn;
- (double)startLine;
- (int64_t)origin;
- (void)setDisabled:(BOOL)a3;
- (void)setFrameId:(id)a3;
- (void)setIsInline:(BOOL)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setSourceURL:(id)a3;
- (void)setStartColumn:(double)a3;
- (void)setStartLine:(double)a3;
- (void)setStyleSheetId:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RWIProtocolCSSStyleSheetHeader

- (RWIProtocolCSSStyleSheetHeader)initWithStyleSheetId:(id)a3 frameId:(id)a4 sourceURL:(id)a5 origin:(int64_t)a6 title:(id)a7 disabled:(BOOL)a8 isInline:(BOOL)a9 startLine:(double)a10 startColumn:(double)a11
{
  BOOL v13 = a8;
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a7;
  v26.receiver = self;
  v26.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  v23 = [(RWIProtocolJSONObject *)&v26 init];
  if (v23)
  {
    if (!v19) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"styleSheetId" format];
    }
    if (!v20) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"frameId" format];
    }
    if (!v21) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"sourceURL" format];
    }
    if (!v22) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"required property '%@' cannot be nil", @"title" format];
    }
    [(RWIProtocolCSSStyleSheetHeader *)v23 setStyleSheetId:v19];
    [(RWIProtocolCSSStyleSheetHeader *)v23 setFrameId:v20];
    [(RWIProtocolCSSStyleSheetHeader *)v23 setSourceURL:v21];
    [(RWIProtocolCSSStyleSheetHeader *)v23 setOrigin:a6];
    [(RWIProtocolCSSStyleSheetHeader *)v23 setTitle:v22];
    [(RWIProtocolCSSStyleSheetHeader *)v23 setDisabled:v13];
    [(RWIProtocolCSSStyleSheetHeader *)v23 setIsInline:a9];
    [(RWIProtocolCSSStyleSheetHeader *)v23 setStartLine:a10];
    [(RWIProtocolCSSStyleSheetHeader *)v23 setStartColumn:a11];
    v24 = v23;
  }

  return v23;
}

- (void)setStyleSheetId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"styleSheetId"];
}

- (NSString)styleSheetId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"styleSheetId"];
  return (NSString *)v2;
}

- (void)setFrameId:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"frameId"];
}

- (NSString)frameId
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"frameId"];
  return (NSString *)v2;
}

- (void)setSourceURL:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"sourceURL"];
}

- (NSString)sourceURL
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"sourceURL"];
  return (NSString *)v2;
}

- (void)setOrigin:(int64_t)a3
{
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  objc_super v4 = v7;
  if (v7) {
    v5 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  }
  else {
    v5 = &stru_26DB29208;
  }
  v6.receiver = self;
  v6.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  [(RWIProtocolJSONObject *)&v6 setString:v5 forKey:@"origin"];

  if (v4)
  {
    if (*v4 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v4 -= 2;
    }
  }
}

- (int64_t)origin
{
  v9.receiver = self;
  v9.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  id v2 = [(RWIProtocolJSONObject *)&v9 stringForKey:@"origin"];
  MEMORY[0x22A6705C0](&v10, v2);
  if (v10)
  {
    objc_super v3 = *(unsigned __int8 **)(v10 + 8);
    unint64_t v4 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
  }
  else
  {
    objc_super v3 = 0;
    unint64_t v4 = 0x100000000;
  }
  for (uint64_t i = 0; i != 12; i += 3)
  {
    if (WTF::operator==(v3, v4, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolCSSStyleSheetOrigin>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolCSSStyleSheetOrigin>(WTF::String const&)::mappings)[i + 1]))
    {
      goto LABEL_8;
    }
  }
  do
  {
    std::__throw_bad_optional_access[abi:sn180100]();
    __break(1u);
LABEL_8:
    ;
  }
  while (i == 12);
  objc_super v6 = (&Inspector::fromProtocolString<RWIProtocolCSSStyleSheetOrigin>(WTF::String const&)::mappings)[i + 2];
  v7 = (_DWORD *)v10;
  uint64_t v10 = 0;
  if (v7)
  {
    if (*v7 == 2) {
      WTF::StringImpl::destroy();
    }
    else {
      *v7 -= 2;
    }
  }
  return (int64_t)v6;
}

- (void)setTitle:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  [(RWIProtocolJSONObject *)&v3 setString:a3 forKey:@"title"];
}

- (NSString)title
{
  v4.receiver = self;
  v4.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  id v2 = [(RWIProtocolJSONObject *)&v4 stringForKey:@"title"];
  return (NSString *)v2;
}

- (void)setDisabled:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"disabled"];
}

- (BOOL)disabled
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"disabled"];
}

- (void)setIsInline:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  [(RWIProtocolJSONObject *)&v3 setBool:a3 forKey:@"isInline"];
}

- (BOOL)isInline
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  return [(RWIProtocolJSONObject *)&v3 BOOLForKey:@"isInline"];
}

- (void)setStartLine:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"startLine" forKey:a3];
}

- (double)startLine
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"startLine"];
  return result;
}

- (void)setStartColumn:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  [(RWIProtocolJSONObject *)&v3 setDouble:@"startColumn" forKey:a3];
}

- (double)startColumn
{
  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  [(RWIProtocolJSONObject *)&v3 doubleForKey:@"startColumn"];
  return result;
}

@end