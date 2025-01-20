@interface ICSTransparencyValue
+ (id)transparencyTypeFromCode:(int)a3;
+ (id)transparencyValueFromICSString:(id)a3;
- (Class)classForCoder;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
@end

@implementation ICSTransparencyValue

+ (id)transparencyValueFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRANSPARENT"])
  {
    uint64_t v4 = 2;
LABEL_5:
    v5 = +[ICSTransparencyValue transparencyTypeFromCode:v4];
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"OPAQUE"])
  {
    uint64_t v4 = 1;
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

+ (id)transparencyTypeFromCode:(int)a3
{
  id v3 = [(ICSPredefinedValue *)[ICSTransparencyValue alloc] initWithLong:a3];
  return v3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  char v4 = a3;
  id v7 = a4;
  if ([(ICSPredefinedValue *)self longValue] == 2) {
    v6 = @"TRANSPARENT";
  }
  else {
    v6 = @"OPAQUE";
  }
  iCalendarAppendStringToStringWithOptions(v6, v7, v4);
}

@end