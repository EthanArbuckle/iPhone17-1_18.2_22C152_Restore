@interface MPMediaItem(CarDisplay)
- (id)albumImageWithFallbackForSize:()CarDisplay doubleLineRow:;
@end

@implementation MPMediaItem(CarDisplay)

- (id)albumImageWithFallbackForSize:()CarDisplay doubleLineRow:
{
  v5 = [a1 artwork];
  v6 = objc_msgSend(v5, "imageWithSize:", a2, a3);

  if (!v6)
  {
    v6 = [MEMORY[0x263F827E8] _systemImageNamed:@"music.square.stack"];
  }
  return v6;
}

@end