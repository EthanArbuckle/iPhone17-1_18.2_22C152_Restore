@interface ICSStructuredLocation
- (BOOL)shouldObscureParameter:(id)a3;
- (BOOL)shouldObscureValue;
- (NSData)mapKitHandle;
- (NSString)abURLString;
- (NSString)address;
- (NSString)displayName;
- (NSString)fmtype;
- (NSString)loctype;
- (NSString)routing;
- (NSString)title;
- (double)radius;
- (id)propertiesToHide;
- (id)propertiesToObscure;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)setAbURLString:(id)a3;
- (void)setAddress:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setFmtype:(id)a3;
- (void)setLoctype:(id)a3;
- (void)setMapKitHandle:(id)a3;
- (void)setRadius:(double)a3;
- (void)setRouting:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICSStructuredLocation

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v9 = a4;
  v6 = [(ICSProperty *)self value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v6 absoluteString];
  }
  else
  {
    v7 = 0;
  }
  v8 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:@"URI" forKey:@"VALUE"];
  [(ICSProperty *)self _ICSStringWithOptions:a3 appendingToString:v9 additionalParameters:v8];
  [v9 appendString:@":"];
  if ((a3 & 0x10) != 0 && [(ICSStructuredLocation *)self shouldObscureValue]) {
    a3 |= 0x20uLL;
  }
  [v7 _ICSStringWithOptions:a3 appendingToString:v9];
}

- (NSString)fmtype
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"X-FMTTYPE"];
}

- (void)setFmtype:(id)a3
{
}

- (NSString)title
{
  v2 = [(ICSProperty *)self parameterValueForName:@"X-TITLE"];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28E78] stringWithString:v2];
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"\\n", @"\n", 0, 0, objc_msgSend(v3, "length"));
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"\\n", 0, 0, objc_msgSend(v4, "length"));
    [(ICSProperty *)self setParameterValue:v4 forName:@"X-TITLE"];
  }
  else
  {
    [(ICSProperty *)self removeParameterValueForName:@"X-TITLE"];
  }
}

- (NSString)loctype
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"X-TYPE"];
}

- (void)setLoctype:(id)a3
{
}

- (double)radius
{
  v2 = [(ICSProperty *)self parameterValueForName:@"X-APPLE-RADIUS"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setRadius:(double)a3
{
  id v5 = [NSNumber numberWithDouble:a3];
  double v4 = [v5 stringValue];
  [(ICSProperty *)self setParameterValue:v4 forName:@"X-APPLE-RADIUS"];
}

- (NSString)abURLString
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"X-APPLE-ABUID"];
}

- (void)setAbURLString:(id)a3
{
}

- (NSData)mapKitHandle
{
  return (NSData *)[(ICSProperty *)self parameterValueForName:@"X-APPLE-MAPKIT-HANDLE"];
}

- (void)setMapKitHandle:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"X-DISPLAY-NAME"];
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)address
{
  v2 = [(ICSProperty *)self parameterValueForName:@"X-ADDRESS"];
  if (v2)
  {
    double v3 = [MEMORY[0x1E4F28E78] stringWithString:v2];
    objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"\\n", @"\n", 0, 0, objc_msgSend(v3, "length"));
  }
  else
  {
    double v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setAddress:(id)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"\\n", 0, 0, objc_msgSend(v4, "length"));
    [(ICSProperty *)self setParameterValue:v4 forName:@"X-ADDRESS"];
  }
  else
  {
    [(ICSProperty *)self removeParameterValueForName:@"X-ADDRESS"];
  }
}

- (NSString)routing
{
  return (NSString *)[(ICSProperty *)self parameterValueForName:@"ROUTING"];
}

- (void)setRouting:(id)a3
{
}

- (id)propertiesToObscure
{
  return 0;
}

- (id)propertiesToHide
{
  return 0;
}

- (BOOL)shouldObscureParameter:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "setWithObjects:", @"X-FMTTYPE", @"X-TYPE", @"X-APPLE-ABUID", @"X-APPLE-RADIUS", 0);
  char v6 = [v5 containsObject:v4];

  return v6 ^ 1;
}

- (BOOL)shouldObscureValue
{
  return 1;
}

@end