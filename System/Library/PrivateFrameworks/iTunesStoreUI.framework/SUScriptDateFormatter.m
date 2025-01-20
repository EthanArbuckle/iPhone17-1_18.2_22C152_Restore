@interface SUScriptDateFormatter
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)dateFormat;
- (NSString)localeIdentifier;
- (SUScriptDateFormatter)init;
- (double)dateFromString:(id)a3;
- (id)_className;
- (id)scriptAttributeKeys;
- (id)stringFromDate:(id)a3;
- (unint64_t)dateFormatterFullStyle;
- (unint64_t)dateFormatterLongStyle;
- (unint64_t)dateFormatterMediumStyle;
- (unint64_t)dateFormatterNoStyle;
- (unint64_t)dateFormatterShortStyle;
- (unint64_t)dateStyle;
- (unint64_t)timeStyle;
- (void)dealloc;
- (void)setDateFormat:(id)a3;
- (void)setDateStyle:(unint64_t)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setTimeStyle:(unint64_t)a3;
@end

@implementation SUScriptDateFormatter

- (SUScriptDateFormatter)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptDateFormatter;
  v2 = [(SUScriptObject *)&v4 init];
  if (v2) {
    v2->_dateFormatter = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptDateFormatter;
  [(SUScriptObject *)&v3 dealloc];
}

- (double)dateFromString:(id)a3
{
  [(SUScriptObject *)self lock];
  [[(NSDateFormatter *)self->_dateFormatter dateFromString:a3] timeIntervalSinceReferenceDate];
  double v6 = v5;
  [(SUScriptObject *)self unlock];
  return v6;
}

- (id)stringFromDate:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [(SUScriptObject *)self lock];
    dateFormatter = self->_dateFormatter;
    double v6 = (void *)MEMORY[0x263EFF910];
    [a3 doubleValue];
    v7 = -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:"));
    [(SUScriptObject *)self unlock];
    return v7;
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    return 0;
  }
}

- (id)_className
{
  return @"iTunesDateFormatter";
}

- (NSString)dateFormat
{
  [(SUScriptObject *)self lock];
  objc_super v3 = [(NSDateFormatter *)self->_dateFormatter dateFormat];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (unint64_t)dateStyle
{
  [(SUScriptObject *)self lock];
  NSDateFormatterStyle v3 = [(NSDateFormatter *)self->_dateFormatter dateStyle];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (NSString)localeIdentifier
{
  [(SUScriptObject *)self lock];
  NSDateFormatterStyle v3 = [(NSLocale *)[(NSDateFormatter *)self->_dateFormatter locale] localeIdentifier];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (void)setDateFormat:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (!a3 || (isKindOfClass & 1) != 0 || (objc_opt_class(), id v5 = a3, (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_6:
    [(SUScriptObject *)self lock];
    [(NSDateFormatter *)self->_dateFormatter setDateFormat:v5];
    [(SUScriptObject *)self unlock];
    return;
  }
  v7 = (void *)MEMORY[0x263F1FA90];

  [v7 throwException:@"Invalid argument"];
}

- (void)setDateStyle:(unint64_t)a3
{
  [(SUScriptObject *)self lock];
  [(NSDateFormatter *)self->_dateFormatter setDateStyle:a3];

  [(SUScriptObject *)self unlock];
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v5 = [objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:a3]) != 0)
  {
    id v7 = (id)v5;
    [(SUScriptObject *)self lock];
    [(NSDateFormatter *)self->_dateFormatter setLocale:v7];
    [(SUScriptObject *)self unlock];
  }
  else
  {
    double v6 = (void *)MEMORY[0x263F1FA90];
    [v6 throwException:@"Invalid argument"];
  }
}

- (void)setTimeStyle:(unint64_t)a3
{
  [(SUScriptObject *)self lock];
  [(NSDateFormatter *)self->_dateFormatter setTimeStyle:a3];

  [(SUScriptObject *)self unlock];
}

- (unint64_t)timeStyle
{
  [(SUScriptObject *)self lock];
  NSDateFormatterStyle v3 = [(NSDateFormatter *)self->_dateFormatter timeStyle];
  [(SUScriptObject *)self unlock];
  return v3;
}

- (unint64_t)dateFormatterFullStyle
{
  return 4;
}

- (unint64_t)dateFormatterLongStyle
{
  return 3;
}

- (unint64_t)dateFormatterMediumStyle
{
  return 2;
}

- (unint64_t)dateFormatterNoStyle
{
  return 0;
}

- (unint64_t)dateFormatterShortStyle
{
  return 1;
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_58, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDateFormatter;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_43, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptDateFormatter;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptDateFormatter;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_58 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_43 = (uint64_t)sel_dateFromString_;
    *(void *)algn_2681B54C8 = @"dateFromString";
    qword_2681B54D0 = (uint64_t)sel_stringFromDate_;
    unk_2681B54D8 = @"stringFromDate";
    __KeyMapping_58 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"dateFormat", @"dateStyle", @"dateStyle", @"localeIdentifier", @"localeIdentifier", @"timeStyle", @"timeStyle", @"DATE_FORMATTER_STYLE_FULL", @"dateFormatterFullStyle", @"DATE_FORMATTER_STYLE_LONG", @"dateFormatterLongStyle", @"DATE_FORMATTER_STYLE_MEDIUM", @"dateFormatterMediumStyle", @"DATE_FORMATTER_STYLE_NONE", @"dateFormatterNoStyle", @"DATE_FORMATTER_STYLE_SHORT", @"dateFormatterShortStyle",
                        0);
  }
}

@end