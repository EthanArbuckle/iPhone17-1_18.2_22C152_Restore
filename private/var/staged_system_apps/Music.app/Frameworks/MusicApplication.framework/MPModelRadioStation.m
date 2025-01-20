@interface MPModelRadioStation
- (NSString)musicTypeIdentifier;
- (NSString)shortDescription;
@end

@implementation MPModelRadioStation

- (NSString)musicTypeIdentifier
{
  NSString v2 = sub_AB64D0();

  return (NSString *)v2;
}

- (NSString)shortDescription
{
  return (NSString *)sub_7CFD48(self, (uint64_t)a2, (void (*)(void))sub_7CFDB8);
}

@end