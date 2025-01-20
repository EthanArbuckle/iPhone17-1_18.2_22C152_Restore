@interface NSObject
+ (id)ic_loggingDescriptionFromLoggable:(id)a3 isPretty:(BOOL)a4;
- (id)ic_loggingDescription;
- (id)ic_loggingIdentifier;
- (id)ic_prettyLoggingDescription;
- (id)jsonify;
@end

@implementation NSObject

- (id)ic_loggingDescription
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v3 = [objc_opt_class() ic_loggingDescriptionFromLoggable:self isPretty:0];
  }
  else
  {
    v3 = [self description];
  }

  return v3;
}

- (id)ic_prettyLoggingDescription
{
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v3 = [objc_opt_class() ic_loggingDescriptionFromLoggable:self isPretty:1];
  }
  else
  {
    v3 = [self description];
  }

  return v3;
}

- (id)ic_loggingIdentifier
{
  return +[NSString stringWithFormat:@"%@", self];
}

+ (id)ic_loggingDescriptionFromLoggable:(id)a3 isPretty:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = +[NSMutableString stringWithFormat:@"<%@ ", v7];

  v9 = [v5 ic_loggingIdentifier];
  if (!v9)
  {
    [v8 appendFormat:@"UNKNOWN_IDENTIFIER"];
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    CFStringRef v10 = @" %@=%@";
    goto LABEL_6;
  }
  [v8 appendString:v9];
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  [v8 appendString:@"\n"];
  CFStringRef v10 = @"\t%@ = %@\n";
LABEL_6:
  v11 = [v5 ic_loggingValues];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005DFAC;
  v16[3] = &unk_1008B00F0;
  BOOL v19 = v4;
  id v12 = v8;
  id v17 = v12;
  CFStringRef v18 = v10;
  [v11 enumerateKeysAndObjectsUsingBlock:v16];
  [v12 appendString:@">"];
  v13 = (__CFString *)v18;
  id v14 = v12;

  return v14;
}

- (id)jsonify
{
  v2 = self;
  id result = [v2 description];
  if (result)
  {
    id v4 = result;

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end