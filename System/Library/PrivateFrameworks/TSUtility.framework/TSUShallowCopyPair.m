@interface TSUShallowCopyPair
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation TSUShallowCopyPair

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TSUShallowCopyPair allocWithZone:a3];
  id v5 = [(TSUPair *)self first];
  id v6 = [(TSUPair *)self second];
  return [(TSUPair *)v4 initWithFirst:v5 second:v6];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[TSUMutableShallowCopyPair allocWithZone:a3];
  id v5 = [(TSUPair *)self first];
  id v6 = [(TSUPair *)self second];
  return [(TSUPair *)v4 initWithFirst:v5 second:v6];
}

@end