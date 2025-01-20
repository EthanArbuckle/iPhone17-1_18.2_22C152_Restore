@interface APPrivacyMarker
- (APPrivacyMarker)init;
- (APPrivacyMarker)initWithCoder:(id)a3;
- (APPrivacyMarker)initWithFrame:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (void)sizeCategoryChanged:(id)a3;
- (void)systemColorStatusChanged:(id)a3;
@end

@implementation APPrivacyMarker

- (CGSize)intrinsicContentSize
{
  [(APPrivacyMarker *)self frame];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (APPrivacyMarker)init
{
  return (APPrivacyMarker *)PrivacyMarker.init()();
}

- (APPrivacyMarker)initWithFrame:(CGRect)a3
{
  return (APPrivacyMarker *)PrivacyMarker.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (APPrivacyMarker)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5D9571C();
}

- (void)systemColorStatusChanged:(id)a3
{
  uint64_t v4 = sub_1B5DB9698();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9688();
  v8 = self;
  sub_1B5D94450();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)sizeCategoryChanged:(id)a3
{
  uint64_t v4 = sub_1B5DB9698();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9688();
  v8 = self;
  sub_1B5D94950();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___APPrivacyMarker_markerView);
}

@end