@interface SUScriptNumberFormatter
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)localeIdentifier;
- (NSString)style;
- (SUScriptNumberFormatter)init;
- (id)numberFromString:(id)a3;
- (id)scriptAttributeKeys;
- (id)stringFromNumber:(id)a3;
- (void)dealloc;
- (void)setLocaleIdentifier:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation SUScriptNumberFormatter

- (SUScriptNumberFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptNumberFormatter;
  v2 = [(SUScriptObject *)&v5 init];
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    v2->_numberFormatter = v3;
    [(NSNumberFormatter *)v3 setNumberStyle:1];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNumberFormatter;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)numberFromString:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUScriptObject *)self lock];
    objc_super v5 = [(NSNumberFormatter *)self->_numberFormatter numberFromString:a3];
    [(SUScriptObject *)self unlock];
    if (v5) {
      return v5;
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  v7 = (void *)MEMORY[0x263EFF9D0];

  return (id)[v7 null];
}

- (id)stringFromNumber:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SUScriptObject *)self lock];
    objc_super v5 = [(NSNumberFormatter *)self->_numberFormatter stringFromNumber:a3];
    [(SUScriptObject *)self unlock];
    if (v5) {
      return v5;
    }
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  v7 = (void *)MEMORY[0x263EFF9D0];

  return (id)[v7 null];
}

- (NSString)localeIdentifier
{
  [(SUScriptObject *)self lock];
  objc_super v3 = [(NSLocale *)[(NSNumberFormatter *)self->_numberFormatter locale] localeIdentifier];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:a3];
    if (v5)
    {
      id v8 = (id)v5;
      [(SUScriptObject *)self lock];
      [(NSNumberFormatter *)self->_numberFormatter setLocale:v8];
      [(SUScriptObject *)self unlock];

      return;
    }
    v6 = (void *)MEMORY[0x263F1FA90];
    v7 = @"Unknown locale";
  }
  else
  {
    v6 = (void *)MEMORY[0x263F1FA90];
    v7 = @"Invalid argument";
  }

  [v6 throwException:v7];
}

- (void)setStyle:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v6 = 1;
  if (a3 && (isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) == 0 || ([a3 isEqualToString:@"decimal"])
    {
LABEL_6:
      uint64_t v6 = 1;
      goto LABEL_7;
    }
    if ([a3 isEqualToString:@"none"])
    {
      uint64_t v6 = 0;
    }
    else if ([a3 isEqualToString:@"currency"])
    {
      uint64_t v6 = 2;
    }
    else if ([a3 isEqualToString:@"percent"])
    {
      uint64_t v6 = 3;
    }
    else if ([a3 isEqualToString:@"scientific"])
    {
      uint64_t v6 = 4;
    }
    else if ([a3 isEqualToString:@"spell-out"])
    {
      uint64_t v6 = 5;
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
LABEL_7:
  [(SUScriptObject *)self lock];
  [(NSNumberFormatter *)self->_numberFormatter setNumberStyle:v6];

  [(SUScriptObject *)self unlock];
}

- (NSString)style
{
  [(SUScriptObject *)self lock];
  NSNumberFormatterStyle v3 = [(NSNumberFormatter *)self->_numberFormatter numberStyle];
  [(SUScriptObject *)self unlock];
  if (v3 > NSNumberFormatterSpellOutStyle) {
    return (NSString *)@"decimal";
  }
  else {
    return &off_264813770[v3]->isa;
  }
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_27, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptNumberFormatter;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_22, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptNumberFormatter;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptNumberFormatter;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_27 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_22 = (uint64_t)sel_numberFromString_;
    *(void *)algn_2681B4C88 = @"numberFromString";
    qword_2681B4C90 = (uint64_t)sel_stringFromNumber_;
    unk_2681B4C98 = @"stringFromNumber";
    __KeyMapping_27 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"localeIdentifier", @"style", @"style", 0);
  }
}

@end