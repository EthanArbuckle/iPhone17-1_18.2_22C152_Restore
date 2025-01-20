@interface CRLWPHyperlinkField
+ (BOOL)schemeIsValidForURL:(id)a3;
+ (BOOL)schemeIsValidForURLReference:(id)a3;
+ (id)defaultFieldStyleIdentifier;
+ (id)defaultFileURL;
+ (id)invalidURLSchemes;
+ (id)newURLFromURLReference:(id)a3;
+ (id)urlWithEmailAddress:(id)a3 subject:(id)a4;
+ (int64_t)schemeFromURL:(id)a3;
- (BOOL)allowsEditing;
- (BOOL)hasDisplayText;
- (BOOL)isEqual:(id)a3;
- (CRLWPHyperlinkField)initWithURL:(id)a3 range:(_NSRange)a4 displayText:(id)a5 uuidString:(id)a6;
- (NSString)displayText;
- (NSString)filePath;
- (NSString)fullPath;
- (NSString)urlPrefix;
- (NSString)urlString;
- (NSURL)url;
- (_NSRange)range;
- (int64_t)scheme;
- (unint64_t)hash;
- (unsigned)smartFieldKind;
@end

@implementation CRLWPHyperlinkField

- (_NSRange)range
{
  p_range = &self->_range;
  NSUInteger location = self->_range.location;
  NSUInteger length = p_range->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

+ (id)defaultFieldStyleIdentifier
{
  return 0;
}

- (NSString)displayText
{
  return self->_displayText;
}

+ (int64_t)schemeFromURL:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 scheme];
    v6 = [v5 lowercaseString];

    if (v6)
    {
      if (([v6 isEqualToString:@"http"] & 1) != 0
        || ([v6 isEqualToString:@"https"] & 1) != 0)
      {
        int64_t v7 = 0;
      }
      else if (([v6 isEqualToString:@"file"] & 1) != 0 {
             || ([v6 isEqualToString:@"keynote"] & 1) != 0)
      }
      {
        int64_t v7 = 1;
      }
      else if ([v6 isEqualToString:@"mailto"])
      {
        int64_t v7 = 2;
      }
      else if ([v6 isEqualToString:@"tel"])
      {
        int64_t v7 = 3;
      }
      else if ([v6 isEqualToString:@"pages"])
      {
        int64_t v7 = 5;
      }
      else if ([v6 isEqualToString:@"rdar"])
      {
        int64_t v7 = 8;
      }
      else
      {
        int64_t v7 = 11;
      }
    }
    else
    {
      v8 = [v4 absoluteString];
      v9 = v8;
      if (v8)
      {
        id v10 = [v8 rangeOfString:@"#"];
        id v11 = [v9 rangeOfString:@"?slide"];
        unsigned int v12 = [v9 hasPrefix:@"?sectionid="];
        id v13 = [v9 rangeOfString:@"?sheetid="];
        id v14 = [v9 rangeOfString:@"?action=retreat"];
        id v15 = [v9 rangeOfString:@"?action=exitpresentation"];
        uint64_t v16 = 11;
        if (!v10) {
          uint64_t v16 = 4;
        }
        if (!v11) {
          uint64_t v16 = 6;
        }
        if (v12) {
          uint64_t v16 = 9;
        }
        if (!v13) {
          uint64_t v16 = 10;
        }
        if (!v14) {
          uint64_t v16 = 6;
        }
        if (v15) {
          int64_t v7 = v16;
        }
        else {
          int64_t v7 = 7;
        }
      }
      else
      {
        int64_t v7 = 11;
      }
    }
  }
  else
  {
    int64_t v7 = 11;
  }

  return v7;
}

+ (id)invalidURLSchemes
{
  if (qword_1016A9498 != -1) {
    dispatch_once(&qword_1016A9498, &stru_1014E5420);
  }
  v2 = (void *)qword_1016A9490;

  return v2;
}

+ (BOOL)schemeIsValidForURL:(id)a3
{
  id v3 = a3;
  v4 = +[CRLWPHyperlinkField invalidURLSchemes];
  v5 = [v3 scheme];
  v6 = [v5 lowercaseString];

  if (v6)
  {
    int64_t v7 = [v4 member:v6];
    BOOL v8 = v7 == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)schemeIsValidForURLReference:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSURL) initWithString:v3];
  if (v4) {
    unsigned __int8 v5 = [(id)objc_opt_class() schemeIsValidForURL:v4];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (id)urlWithEmailAddress:(id)a3 subject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v12 = 0;
    goto LABEL_14;
  }
  int64_t v7 = +[NSCharacterSet URLFragmentAllowedCharacterSet];
  id v8 = [v7 mutableCopy];

  [v8 removeCharactersInString:@"&?"];
  v9 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v8];
  if (![v9 length]) {
    goto LABEL_12;
  }
  if (v6 && [v6 length])
  {
    [v8 addCharactersInString:@"?"];
    id v10 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v8];
    if ([v10 length]) {
      id v11 = [objc_alloc((Class)NSString) initWithFormat:@"mailto:%@?subject=%@", v9, v10];
    }
    else {
      id v11 = 0;
    }

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
    id v11 = [objc_alloc((Class)NSString) initWithFormat:@"mailto:%@", v9];
    if (!v11)
    {
LABEL_12:
      id v12 = 0;
      goto LABEL_13;
    }
  }
  id v12 = [objc_alloc((Class)NSURL) initWithString:v11];

LABEL_13:
LABEL_14:

  return v12;
}

+ (id)defaultFileURL
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"DefaultFileURL"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 length])
  {
    id v4 = +[NSURL crl_fileURLWithPath:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)newURLFromURLReference:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_13;
  }
  id v4 = [objc_alloc((Class)NSURL) initWithString:v3];
  if (!v4)
  {
    int v5 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5440);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101090BB8((uint64_t)v3, v5, v6);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E5460);
    }
    int64_t v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = +[CRLAssertionHandler packedBacktraceString];
      sub_10106CDAC(v8, buf, v5, (os_log_t)v7);
    }

    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPHyperlinkField newURLFromURLReference:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPHyperlinkField.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v9, v10, 171, 0, "Failed to create an NSURL from \"%@\"", v3 file lineNumber isFatal description];

    if ([v3 hasPrefix:@"mailto:"])
    {
      id v11 = +[NSBundle mainBundle];
      id v12 = [v11 localizedStringForKey:@"mailto:no_reply@apple.com" value:0 table:0];
      id v4 = +[NSURL URLWithString:v12];

      goto LABEL_14;
    }
LABEL_13:
    id v4 = 0;
  }
LABEL_14:

  return v4;
}

- (CRLWPHyperlinkField)initWithURL:(id)a3 range:(_NSRange)a4 displayText:(id)a5 uuidString:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CRLWPHyperlinkField;
  id v15 = [(CRLWPHyperlinkField *)&v18 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_url, a3);
    v16->_range.NSUInteger location = location;
    v16->_range.NSUInteger length = length;
    objc_storeStrong((id *)&v16->_displayText, a5);
    [(CRLWPSmartField *)v16 setTextAttributeUUIDString:v14];
  }

  return v16;
}

- (unsigned)smartFieldKind
{
  return 32;
}

- (BOOL)allowsEditing
{
  return 0;
}

- (NSURL)url
{
  id v3 = self->_url;
  if (!v3)
  {
    id v4 = [(CRLWPHyperlinkField *)self range];
    if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v3 = 0;
    }
    else
    {
      id v6 = v4;
      uint64_t v7 = v5;
      id v8 = objc_opt_class();
      v9 = [(CRLWPSmartField *)self parentStorage];
      id v10 = [v9 substringWithRange:v6, v7];
      id v3 = (NSURL *)[v8 newURLFromURLReference:v10];
    }
  }

  return v3;
}

- (int64_t)scheme
{
  id v3 = objc_opt_class();
  id v4 = [(CRLWPHyperlinkField *)self url];
  id v5 = [v3 schemeFromURL:v4];

  return (int64_t)v5;
}

- (NSString)urlPrefix
{
  v2 = [(NSURL *)self->_url absoluteString];
  id v3 = v2;
  if (!v2
    || ((id v4 = [v2 length],
         id v5 = objc_msgSend(v3, "crlwp_findIndexOfCharacter:range:", 58, 0, v4),
         (unint64_t v6 = (unint64_t)v5) != 0)
      ? (BOOL v7 = v5 == (id)0x7FFFFFFFFFFFFFFFLL)
      : (BOOL v7 = 1),
        v7
     || v5 >= objc_msgSend(v3, "crlwp_findIndexOfCharacter:range:", 47, 0, v4)
     || v6 >= (unint64_t)objc_msgSend(v3, "crlwp_findIndexOfCharacter:range:", 63, 0, v4)
     || v6 >= (unint64_t)objc_msgSend(v3, "crlwp_findIndexOfCharacter:range:", 35, 0, v4)))
  {
    id v8 = &stru_101538650;
  }
  else
  {
    [v3 substringWithRange:0, v6];
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (BOOL)hasDisplayText
{
  return self->_url != 0;
}

- (NSString)filePath
{
  CFURLRef v2 = [(CRLWPHyperlinkField *)self url];
  if ([(__CFURL *)v2 isFileURL]) {
    id v3 = (__CFString *)CFURLCopyFileSystemPath(v2, kCFURLPOSIXPathStyle);
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)fullPath
{
  CFURLRef v2 = [(CRLWPHyperlinkField *)self filePath];
  id v3 = v2;
  if (v2 && ([v2 isAbsolutePath] & 1) == 0)
  {
    id v4 = [@"~" stringByExpandingTildeInPath];
    id v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 stringByAppendingPathComponent:v3];

      id v3 = (void *)v6;
    }
  }

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CRLWPHyperlinkField *)a3;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = sub_1002469D0(v5, v4);
    if (v6 && [(NSString *)self->_urlString isEqual:v6[10]])
    {
      BOOL v7 = [(CRLWPSmartField *)self textAttributeUUIDString];
      id v8 = [v6 textAttributeUUIDString];
      if ([v7 isEqualToString:v8]
        && (self->_range.location == v6[6] ? (BOOL v9 = self->_range.length == v6[7]) : (BOOL v9 = 0), v9))
      {
        id v11 = [(CRLWPHyperlinkField *)self displayText];
        id v12 = [v6 displayText];
        unsigned __int8 v10 = [v11 isEqual:v12];
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(CRLHasher);
  [(CRLHasher *)v3 addObject:self->_urlString];
  id v4 = [(CRLWPHyperlinkField *)self displayText];
  [(CRLHasher *)v3 addObject:v4];

  unint64_t v5 = [(CRLHasher *)v3 hashValue];
  return v5;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_displayText, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end