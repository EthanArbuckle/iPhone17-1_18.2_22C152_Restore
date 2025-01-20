@interface ICSAlternateTimeProposalStatusParameter
+ (id)statusParameterFromCode:(int)a3;
+ (id)statusParameterFromICSString:(id)a3;
- (Class)classForCoder;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
@end

@implementation ICSAlternateTimeProposalStatusParameter

+ (id)statusParameterFromICSString:(id)a3
{
  uint64_t v3 = +[ICSAlternateTimeProposal statusFromICSString:a3];
  if (v3)
  {
    v4 = +[ICSAlternateTimeProposalStatusParameter statusParameterFromCode:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)statusParameterFromCode:(int)a3
{
  uint64_t v3 = [(ICSPredefinedValue *)[ICSAlternateTimeProposalStatusParameter alloc] initWithLong:a3];
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
  id v7 = +[ICSAlternateTimeProposal ICSStringFromAlternateTimeProposalStatus:[(ICSPredefinedValue *)self longValue]];
  iCalendarAppendStringToStringWithOptions(v7, v6, v4);
}

@end