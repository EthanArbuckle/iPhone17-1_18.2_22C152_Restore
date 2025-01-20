@interface OAXTextFieldIdentity
+ (id)identityWithGuid:(id)a3 type:(id)a4;
@end

@implementation OAXTextFieldIdentity

+ (id)identityWithGuid:(id)a3 type:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(OITSUPair *)[OAXTextFieldIdentity alloc] initWithFirst:v5 second:v6];

  return v7;
}

@end