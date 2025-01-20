@interface ACMTicketVerificationResponseImpl
- (NSNumber)personDSID;
@end

@implementation ACMTicketVerificationResponseImpl

- (NSNumber)personDSID
{
  v2 = (NSNumber *)[[-[ACMMessage rawResponseData](self, "rawResponseData") objectForKey:@"pid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  if (objc_opt_respondsToSelector())
  {
    v4 = NSNumber;
    uint64_t v5 = [(NSNumber *)v2 unsignedLongLongValue];
    v6 = v4;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      return v2;
    }
    uint64_t v7 = [(NSNumber *)v2 longLongValue];
    if (v7 < 0) {
      return v2;
    }
    uint64_t v5 = v7;
    v6 = NSNumber;
  }

  return (NSNumber *)[v6 numberWithUnsignedLongLong:v5];
}

@end