@interface MPModelRequest
- (NSString)filterString;
@end

@implementation MPModelRequest

- (NSString)filterString
{
  v2 = self;
  sub_425160();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

@end