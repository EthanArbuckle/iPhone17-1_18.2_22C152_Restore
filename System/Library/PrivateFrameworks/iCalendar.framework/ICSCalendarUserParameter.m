@interface ICSCalendarUserParameter
+ (id)calendarUserTypeParameterFromCode:(int)a3;
+ (id)calendarUserTypeParameterFromICSString:(id)a3;
- (Class)classForCoder;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
@end

@implementation ICSCalendarUserParameter

+ (id)calendarUserTypeParameterFromICSString:(id)a3
{
  uint64_t v3 = +[ICSUserAddress calendarUserFromICSString:a3];
  if (v3)
  {
    v4 = +[ICSCalendarUserParameter calendarUserTypeParameterFromCode:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)calendarUserTypeParameterFromCode:(int)a3
{
  uint64_t v3 = [(ICSPredefinedValue *)[ICSCalendarUserParameter alloc] initWithLong:a3];
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
  id v7 = +[ICSUserAddress ICSStringFromCalendarUser:[(ICSPredefinedValue *)self longValue]];
  iCalendarAppendStringToStringWithOptions(v7, v6, v4);
}

@end