@interface CAPresentationModifier
- (BOOL)supportsNewValue:(BOOL)a1;
@end

@implementation CAPresentationModifier

- (BOOL)supportsNewValue:(BOOL)a1
{
  BOOL v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [(id)v2 value];
    uint64_t v5 = objc_msgSend(v4, "CA_numericValueCount");
    uint64_t v6 = objc_msgSend(v3, "CA_numericValueCount");

    BOOL v2 = v5 == v6;
  }
  return v2;
}

@end