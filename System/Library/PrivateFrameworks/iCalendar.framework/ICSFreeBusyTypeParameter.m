@interface ICSFreeBusyTypeParameter
+ (id)freeBusyTypeParameterFromCode:(unint64_t)a3;
+ (id)freeBusyTypeParameterFromICSString:(id)a3;
- (Class)classForCoder;
@end

@implementation ICSFreeBusyTypeParameter

+ (id)freeBusyTypeParameterFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FREE"])
  {
    uint64_t v4 = 4;
LABEL_9:
    v5 = +[ICSFreeBusyTypeParameter freeBusyTypeParameterFromCode:v4];
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"BUSY-UNAVAILABLE"])
  {
    uint64_t v4 = 2;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"BUSY-TENTATIVE"])
  {
    uint64_t v4 = 3;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"BUSY"])
  {
    uint64_t v4 = 1;
    goto LABEL_9;
  }
  v5 = 0;
LABEL_10:

  return v5;
}

+ (id)freeBusyTypeParameterFromCode:(unint64_t)a3
{
  id v3 = [(ICSPredefinedValue *)[ICSFreeBusyTypeParameter alloc] initWithLong:a3];
  return v3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

@end