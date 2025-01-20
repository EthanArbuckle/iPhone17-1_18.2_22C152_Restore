@interface CNPostalAddress(RTContact)
+ (id)_rt_labelStringWithAddressLabelType:()RTContact;
- (id)_rt_toString;
@end

@implementation CNPostalAddress(RTContact)

+ (id)_rt_labelStringWithAddressLabelType:()RTContact
{
  if (a3 > 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_1E6B99E48 + a3);
  }
  return v4;
}

- (id)_rt_toString
{
  v2 = NSString;
  uint64_t v3 = [a1 street];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
  v5 = [a1 city];
  v6 = [a1 state];
  v7 = [a1 postalCode];
  v8 = [a1 country];
  v9 = [v2 stringWithFormat:@"street, %@, city, %@, state, %@, postalCode, %@, country, %@", v4, v5, v6, v7, v8];

  return v9;
}

@end