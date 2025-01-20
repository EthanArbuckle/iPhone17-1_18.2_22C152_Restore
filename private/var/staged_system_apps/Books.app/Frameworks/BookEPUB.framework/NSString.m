@interface NSString
- (BOOL)be_isNotWhitespace;
- (BOOL)be_isWhitespace;
- (id)be_redactedCFIString;
- (id)be_sanitizedFontFamilyName;
- (id)be_stringByRemovingPercentEscapes;
- (int64_t)be_compareToJSVersionString:(id)a3;
@end

@implementation NSString

- (int64_t)be_compareToJSVersionString:(id)a3
{
  id v4 = a3;
  v5 = [(NSString *)self componentsSeparatedByString:@"."];
  v6 = [v4 componentsSeparatedByString:@"."];
  if (![v5 count]) {
    goto LABEL_7;
  }
  unint64_t v7 = 0;
  int64_t v8 = 0;
  do
  {
    if (v7 >= (unint64_t)[v6 count]) {
      break;
    }
    if (v8) {
      break;
    }
    v9 = [v5 objectAtIndexedSubscript:v7];
    v10 = [v6 objectAtIndexedSubscript:v7];
    int64_t v8 = (int64_t)[v9 compare:v10 options:64];

    ++v7;
  }
  while (v7 < (unint64_t)[v5 count]);
  if (!v8)
  {
LABEL_7:
    id v11 = [v5 count];
    if (v11 <= [v6 count])
    {
      id v12 = [v5 count];
      if (v12 >= [v6 count]) {
        int64_t v8 = 0;
      }
      else {
        int64_t v8 = -1;
      }
    }
    else
    {
      int64_t v8 = 1;
    }
  }

  return v8;
}

- (id)be_sanitizedFontFamilyName
{
  v2 = [(NSString *)self stringByReplacingOccurrencesOfString:@" " withString:@"_"];
  v3 = [v2 stringByReplacingOccurrencesOfString:@"." withString:@"_"];

  return v3;
}

- (id)be_stringByRemovingPercentEscapes
{
  v2 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, &stru_3D7B70);

  return v2;
}

- (BOOL)be_isWhitespace
{
  v3 = +[NSCharacterSet whitespaceCharacterSet];
  id v4 = [(NSString *)self stringByTrimmingCharactersInSet:v3];
  BOOL v5 = [v4 length] == 0;

  return v5;
}

- (BOOL)be_isNotWhitespace
{
  return ![(NSString *)self be_isWhitespace];
}

- (id)be_redactedCFIString
{
  v2 = self;
  if ([(NSString *)v2 hasPrefix:@"epubcfi(")]
  {
    id v10 = 0;
    v3 = +[NSRegularExpression regularExpressionWithPattern:@"\\[\\w+\\]" options:1 error:&v10];
    id v4 = v10;
    if (!v3)
    {
      BOOL v5 = _BookEPUBLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v12 = v4;
        _os_log_impl(&def_7BFC0, v5, OS_LOG_TYPE_ERROR, "Failed to create redaction regular expression: %{public}@", buf, 0xCu);
      }
    }
    [v3 stringByReplacingMatchesInString:v2 options:0 range:[NSString length]:[redacted] length];
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = v2;
  }
  int64_t v8 = v7;

  return v8;
}

@end