@interface NSMutableString
- (void)AEReplaceTemplatePlaceholder:(id)a3 withString:(id)a4;
- (void)bkMakeSubstitutionsWithDictionary:(id)a3;
- (void)bkReplaceTemplatePlaceholder:(id)a3 withString:(id)a4;
@end

@implementation NSMutableString

- (void)AEReplaceTemplatePlaceholder:(id)a3 withString:(id)a4
{
  v12 = (__CFString *)a4;
  id v6 = a3;
  id v7 = [(__CFString *)v12 length];
  id v8 = [(NSMutableString *)self length];
  if (v7)
  {
    v9 = self;
    id v10 = v6;
    CFStringRef v11 = v12;
  }
  else
  {
    CFStringRef v11 = &stru_2CE418;
    v9 = self;
    id v10 = v6;
  }
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v9, "replaceOccurrencesOfString:withString:options:range:", v10, v11, 0, 0, v8);
}

- (void)bkReplaceTemplatePlaceholder:(id)a3 withString:(id)a4
{
  v12 = (__CFString *)a4;
  id v6 = a3;
  id v7 = [(__CFString *)v12 length];
  id v8 = [(NSMutableString *)self length];
  if (v7)
  {
    v9 = self;
    id v10 = v6;
    CFStringRef v11 = v12;
  }
  else
  {
    CFStringRef v11 = &stru_2CE418;
    v9 = self;
    id v10 = v6;
  }
  -[NSMutableString replaceOccurrencesOfString:withString:options:range:](v9, "replaceOccurrencesOfString:withString:options:range:", v10, v11, 0, 0, v8);
}

- (void)bkMakeSubstitutionsWithDictionary:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_DEF14;
  v3[3] = &unk_2C8D38;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

@end