@interface SportsTagStyler
- (UIFont)tagTitleFont;
- (double)cornerRadius;
- (double)padding;
- (id)tagColorFor:(id)a3;
@end

@implementation SportsTagStyler

- (double)padding
{
  objc_msgSend(*(id *)self->feedNavImageStyler, sel_padding);
  return result;
}

- (double)cornerRadius
{
  uint64_t v2 = sub_1DFDE81B0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DFDF9E80();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E4FAB820], v2);
  swift_retain();
  sub_1DFDF9E70();
  double v7 = v6;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_release();
  return v7 * 0.5;
}

- (UIFont)tagTitleFont
{
  id v2 = objc_msgSend(*(id *)self->feedNavImageStyler, sel_tagTitleFont);
  return (UIFont *)v2;
}

- (id)tagColorFor:(id)a3
{
  sub_1DFDFDD20();
  uint64_t v4 = *(void **)self->feedNavImageStyler;
  swift_retain();
  v5 = (void *)sub_1DFDFDCE0();
  id v6 = objc_msgSend(v4, sel_tagColorFor_, v5);
  swift_release();
  swift_bridgeObjectRelease();

  return v6;
}

@end