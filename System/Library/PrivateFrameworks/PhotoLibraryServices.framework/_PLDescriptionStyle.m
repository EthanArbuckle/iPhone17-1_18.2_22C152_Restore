@interface _PLDescriptionStyle
+ (id)styleForEnum:(int64_t)a3;
- (BOOL)prettyPrint;
- (NSString)fieldSeparator;
- (NSString)initialFieldSeparator;
- (NSString)nameValueSeparator;
- (NSString)suffix;
- (_PLDescriptionStyle)initWithIntialFieldSeparator:(id)a3 fieldSeparator:(id)a4 nameValueSeparator:(id)a5 suffix:(id)a6 extraIndent:(int64_t)a7 prettyPrint:(BOOL)a8;
- (id)descriptionForObject:(id)a3 withIndent:(int64_t)a4;
- (int64_t)extraIndent;
@end

@implementation _PLDescriptionStyle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_nameValueSeparator, 0);
  objc_storeStrong((id *)&self->_fieldSeparator, 0);
  objc_storeStrong((id *)&self->_initialFieldSeparator, 0);
}

- (BOOL)prettyPrint
{
  return self->_prettyPrint;
}

- (int64_t)extraIndent
{
  return self->_extraIndent;
}

- (NSString)suffix
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)nameValueSeparator
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)fieldSeparator
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)initialFieldSeparator
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)descriptionForObject:(id)a3 withIndent:(int64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (self->_prettyPrint)
  {
    uint64_t v8 = objc_msgSend(v6, "_pl_prettyDescriptionWithIndent:", a4);
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      v9 = NSString;
      v10 = [v7 descriptionWithLocale:0 indent:a4 - 1];
      v11 = [v9 stringWithFormat:@"\n%@", v10];

      goto LABEL_7;
    }
    uint64_t v8 = [v7 description];
  }
  v11 = (void *)v8;
LABEL_7:

  return v11;
}

- (_PLDescriptionStyle)initWithIntialFieldSeparator:(id)a3 fieldSeparator:(id)a4 nameValueSeparator:(id)a5 suffix:(id)a6 extraIndent:(int64_t)a7 prettyPrint:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v29.receiver = self;
  v29.super_class = (Class)_PLDescriptionStyle;
  v18 = [(_PLDescriptionStyle *)&v29 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    initialFieldSeparator = v18->_initialFieldSeparator;
    v18->_initialFieldSeparator = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    fieldSeparator = v18->_fieldSeparator;
    v18->_fieldSeparator = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    nameValueSeparator = v18->_nameValueSeparator;
    v18->_nameValueSeparator = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    suffix = v18->_suffix;
    v18->_suffix = (NSString *)v25;

    v18->_extraIndent = a7;
    v18->_prettyPrint = a8;
    v27 = v18;
  }

  return v18;
}

+ (id)styleForEnum:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      pl_dispatch_once();
      v4 = &styleForEnum__pl_once_object_17;
      goto LABEL_9;
    case 1:
      pl_dispatch_once();
      v4 = &styleForEnum__pl_once_object_18;
      goto LABEL_9;
    case 2:
      pl_dispatch_once();
      v4 = &styleForEnum__pl_once_object_19;
      goto LABEL_9;
    case 3:
      pl_dispatch_once();
      v4 = &styleForEnum__pl_once_object_20;
LABEL_9:
      a1 = (id)*v4;
      break;
    default:
      break;
  }
  return a1;
}

@end