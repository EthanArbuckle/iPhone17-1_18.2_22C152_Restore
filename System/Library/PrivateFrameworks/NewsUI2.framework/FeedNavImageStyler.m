@interface FeedNavImageStyler
- (UIFont)tagTitleFont;
- (double)cornerRadius;
- (double)padding;
- (id)tagColorFor:(id)a3;
@end

@implementation FeedNavImageStyler

- (UIFont)tagTitleFont
{
  id v2 = objc_msgSend(self, sel_systemFontOfSize_weight_, 14.0, *MEMORY[0x1E4FB09E0]);
  return (UIFont *)v2;
}

- (id)tagColorFor:(id)a3
{
  sub_1DFDFDD20();
  v3 = self;
  swift_retain();
  v4 = (void *)sub_1DFDFDCE0();
  id v5 = objc_msgSend(v3, sel_nu_safeColorForIdentifier_, v4);
  swift_release();
  swift_bridgeObjectRelease();

  return v5;
}

- (double)cornerRadius
{
  return 3.0;
}

- (double)padding
{
  return 5.0;
}

@end