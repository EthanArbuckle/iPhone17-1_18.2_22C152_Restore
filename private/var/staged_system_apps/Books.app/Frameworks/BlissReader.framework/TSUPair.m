@interface TSUPair
- (int64_t)sortInteractiveImageChildren:(id)a3;
@end

@implementation TSUPair

- (int64_t)sortInteractiveImageChildren:(id)a3
{
  id v4 = [(TSUPair *)self second];
  id v5 = [a3 second];

  return (int64_t)[v4 compare:v5];
}

@end