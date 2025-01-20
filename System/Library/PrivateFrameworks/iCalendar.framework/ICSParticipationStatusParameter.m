@interface ICSParticipationStatusParameter
+ (id)participationStatusParameterFromCode:(int)a3;
+ (id)participationStatusParameterFromICSString:(id)a3;
- (Class)classForCoder;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
@end

@implementation ICSParticipationStatusParameter

+ (id)participationStatusParameterFromICSString:(id)a3
{
  uint64_t v3 = +[ICSUserAddress participationStatusFromICSString:a3];
  if (v3)
  {
    v4 = +[ICSParticipationStatusParameter participationStatusParameterFromCode:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)participationStatusParameterFromCode:(int)a3
{
  uint64_t v3 = [(ICSPredefinedValue *)[ICSParticipationStatusParameter alloc] initWithLong:a3];
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
  id v7 = +[ICSUserAddress ICSStringFromParticipationStatus:[(ICSPredefinedValue *)self longValue]];
  iCalendarAppendStringToStringWithOptions(v7, v6, v4);
}

@end