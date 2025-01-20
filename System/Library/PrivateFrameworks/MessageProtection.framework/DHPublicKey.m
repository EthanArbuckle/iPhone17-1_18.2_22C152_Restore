@interface DHPublicKey
- (id)description;
@end

@implementation DHPublicKey

- (id)description
{
  v2 = NSString;
  v3 = [(PublicKey *)self dataRepresentation];
  v4 = [v2 stringWithFormat:@"DHPublicKey with data representation: %@", v3];

  return v4;
}

@end