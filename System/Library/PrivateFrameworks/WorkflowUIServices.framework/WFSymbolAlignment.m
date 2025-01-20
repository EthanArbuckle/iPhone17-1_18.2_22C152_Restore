@interface WFSymbolAlignment
+ (CGSize)absoluteOffsetFor:(id)a3 fontSize:(double)a4;
+ (double)fontSizeFor:(id)a3 containerDimension:(double)a4 scale:(double)a5 circularContainer:(BOOL)a6;
- (WFSymbolAlignment)init;
@end

@implementation WFSymbolAlignment

+ (CGSize)absoluteOffsetFor:(id)a3 fontSize:(double)a4
{
  uint64_t v4 = sub_217858E48();
  static SymbolAlignment.absoluteOffset(for:fontSize:)(v4, v5);
  double v7 = v6;
  double v9 = v8;
  swift_bridgeObjectRelease();
  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (double)fontSizeFor:(id)a3 containerDimension:(double)a4 scale:(double)a5 circularContainer:(BOOL)a6
{
  uint64_t v9 = sub_217858E48();
  static SymbolAlignment.fontSize(for:containerDimension:scale:circularContainer:)(v9, v10, a6, a4, a5);
  double v12 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

- (WFSymbolAlignment)init
{
  return (WFSymbolAlignment *)sub_2178256EC();
}

@end