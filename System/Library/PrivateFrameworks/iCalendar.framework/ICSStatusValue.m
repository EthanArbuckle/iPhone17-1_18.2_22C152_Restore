@interface ICSStatusValue
+ (id)statusTypeFromCode:(int)a3;
+ (id)statusTypeFromCode:(int)a3 statusString:(id)a4;
+ (id)statusValueFromICSString:(id)a3;
- (Class)classForCoder;
- (NSString)statusString;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)setStatusString:(id)a3;
@end

@implementation ICSStatusValue

+ (id)statusValueFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = +[ICSStatusValue statusTypeFromCode:statusString:](ICSStatusValue, "statusTypeFromCode:statusString:", +[ICSComponent statusFromString:v3], v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)statusTypeFromCode:(int)a3
{
  return (id)[a1 statusTypeFromCode:*(void *)&a3 statusString:0];
}

+ (id)statusTypeFromCode:(int)a3 statusString:(id)a4
{
  id v5 = a4;
  v6 = [(ICSPredefinedValue *)[ICSStatusValue alloc] initWithLong:a3];
  [(ICSStatusValue *)v6 setStatusString:v5];

  return v6;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (NSString)statusString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStatusString:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  char v4 = a3;
  id v10 = a4;
  v6 = [(ICSStatusValue *)self statusString];
  if (v6) {
    [(ICSStatusValue *)self statusString];
  }
  else {
  v7 = +[ICSComponent stringFromStatus:[(ICSPredefinedValue *)self longValue]];
  }

  v8 = @"TENTATIVE";
  if (v7) {
    v8 = v7;
  }
  v9 = v8;

  iCalendarAppendStringToStringWithOptions(v9, v10, v4);
}

@end