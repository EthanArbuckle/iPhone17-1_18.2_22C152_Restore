@interface TPECPublicKeyFactory
- (id)keyFromSPKI:(id)a3;
@end

@implementation TPECPublicKeyFactory

- (id)keyFromSPKI:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = [MEMORY[0x263F67CC8] keyWithSubjectPublicKeyInfo:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end