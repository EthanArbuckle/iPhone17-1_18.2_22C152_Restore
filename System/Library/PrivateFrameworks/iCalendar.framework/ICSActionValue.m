@interface ICSActionValue
+ (id)actionParameterFromCode:(int)a3;
+ (id)actionValueFromICSString:(id)a3;
- (Class)classForCoder;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
@end

@implementation ICSActionValue

+ (id)actionValueFromICSString:(id)a3
{
  uint64_t v3 = +[ICSAlarm actionFromICSString:a3];
  if (v3 == 5)
  {
    v4 = 0;
  }
  else
  {
    v4 = +[ICSActionValue actionParameterFromCode:v3];
  }
  return v4;
}

+ (id)actionParameterFromCode:(int)a3
{
  uint64_t v3 = [(ICSPredefinedValue *)[ICSActionValue alloc] initWithLong:a3];
  return v3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  char v4 = a3;
  id v6 = a4;
  id v7 = +[ICSAlarm ICSStringFromAction:[(ICSPredefinedValue *)self longValue]];
  iCalendarAppendStringToStringWithOptions(v7, v6, v4);
}

@end