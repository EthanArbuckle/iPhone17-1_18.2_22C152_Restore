@interface NSMutableString
- (BOOL)replaceSubstr:(id)a3 with:(id)a4;
- (BOOL)replaceSubstr:(id)a3 with:(id)a4 range:(_NSRange)a5;
- (void)replaceAllSubstr:(id)a3 with:(id)a4;
- (void)replaceAllSubstr:(id)a3 with:(id)a4 escStr:(id)a5;
- (void)replaceAllSubstr:(id)a3 with:(id)a4 escStr:(id)a5 range:(_NSRange)a6;
- (void)replaceAllSubstr:(id)a3 with:(id)a4 range:(_NSRange)a5;
@end

@implementation NSMutableString

- (BOOL)replaceSubstr:(id)a3 with:(id)a4
{
  id v7 = [(NSMutableString *)self length];

  return -[NSMutableString replaceSubstr:with:range:](self, "replaceSubstr:with:range:", a3, a4, 0, v7);
}

- (BOOL)replaceSubstr:(id)a3 with:(id)a4 range:(_NSRange)a5
{
  id v7 = -[NSMutableString rangeOfString:options:range:](self, "rangeOfString:options:range:", a3, 0, a5.location, a5.length);
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v7;
    if (a4 && [a4 length]) {
      -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", v10, v9, a4);
    }
    else {
      -[NSMutableString deleteCharactersInRange:](self, "deleteCharactersInRange:", v10, v9);
    }
  }
  return v9 != 0;
}

- (void)replaceAllSubstr:(id)a3 with:(id)a4
{
}

- (void)replaceAllSubstr:(id)a3 with:(id)a4 escStr:(id)a5
{
  id v9 = [(NSMutableString *)self length];

  -[NSMutableString replaceAllSubstr:with:escStr:range:](self, "replaceAllSubstr:with:escStr:range:", a3, a4, a5, 0, v9);
}

- (void)replaceAllSubstr:(id)a3 with:(id)a4 range:(_NSRange)a5
{
}

- (void)replaceAllSubstr:(id)a3 with:(id)a4 escStr:(id)a5 range:(_NSRange)a6
{
  id v10 = (char *)-[NSMutableString rangeOfString:options:range:](self, "rangeOfString:options:range:", a3, 0, a6.location, a6.length);
  if (v11)
  {
    v12 = v10;
    uint64_t v13 = v11;
    do
    {
      if (a5
        && [a5 length] <= v12
        && !-[NSMutableString compare:options:range:](self, "compare:options:range:", a5, 0, v12 - (unsigned char *)[a5 length], objc_msgSend(a5, "length")))
      {
        if (!--v13) {
          return;
        }
        ++v12;
        if (!a4)
        {
LABEL_11:
          -[NSMutableString deleteCharactersInRange:](self, "deleteCharactersInRange:", v12, v13);
          goto LABEL_12;
        }
      }
      else if (!a4)
      {
        goto LABEL_11;
      }
      if (![a4 length]) {
        goto LABEL_11;
      }
      -[NSMutableString replaceCharactersInRange:withString:](self, "replaceCharactersInRange:withString:", v12, v13, a4);
      v12 = &v12[(void)[a4 length]];
LABEL_12:
      v12 = (char *)-[NSMutableString rangeOfString:options:range:](self, "rangeOfString:options:range:", a3, 0, v12, (unsigned char *)[(NSMutableString *)self length] - v12);
      uint64_t v13 = v14;
    }
    while (v14);
  }
}

@end