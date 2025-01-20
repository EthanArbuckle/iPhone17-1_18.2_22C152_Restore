@interface PhotosSearchBar.LayoutManager
- (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313LayoutManager)init;
- (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313LayoutManager)initWithCoder:(id)a3;
- (void)drawBackgroundForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4;
- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9;
@end

@implementation PhotosSearchBar.LayoutManager

- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9
{
  long long v14 = *(_OWORD *)&a7->c;
  v19[0] = *(_OWORD *)&a7->a;
  v19[1] = v14;
  v19[2] = *(_OWORD *)&a7->tx;
  type metadata accessor for Key(0);
  sub_259B842F4((uint64_t)&qword_26A3D5BA8);
  uint64_t v15 = sub_259C443B8();
  id v16 = a6;
  v17 = a9;
  v18 = self;
  sub_259B7D6EC((uint64_t)a3, (uint64_t)a4, a5, (uint64_t)v16, (uint64_t *)v19, v15, v17);

  swift_bridgeObjectRelease();
}

- (void)drawBackgroundForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6 = self;
  sub_259B7DA8C(location, length);
}

- (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313LayoutManager)init
{
  return (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313LayoutManager *)sub_259B7E0F4();
}

- (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313LayoutManager)initWithCoder:(id)a3
{
  return (_TtCV17PhotosSwiftUICore15PhotosSearchBarP33_C1804BBFE1C0AEF33B5596BB912C852313LayoutManager *)sub_259B7E1F4(a3);
}

- (void).cxx_destruct
{
}

@end