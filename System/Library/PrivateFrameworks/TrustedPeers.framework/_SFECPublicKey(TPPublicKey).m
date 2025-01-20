@interface _SFECPublicKey(TPPublicKey)
- (BOOL)checkSignature:()TPPublicKey matchesData:;
@end

@implementation _SFECPublicKey(TPPublicKey)

- (BOOL)checkSignature:()TPPublicKey matchesData:
{
  id v6 = a4;
  id v7 = a3;
  v8 = signingOperation();
  v9 = (void *)[objc_alloc(MEMORY[0x263F67CE0]) initWithData:v6 signature:v7];

  v10 = [v8 verify:v9 withKey:a1 error:0];
  BOOL v11 = v10 != 0;

  return v11;
}

@end