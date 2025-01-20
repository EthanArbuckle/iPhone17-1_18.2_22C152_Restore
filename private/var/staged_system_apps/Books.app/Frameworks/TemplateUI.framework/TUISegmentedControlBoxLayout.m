@interface TUISegmentedControlBoxLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth;
- (double)computeDerivedHeight;
- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6;
@end

@implementation TUISegmentedControlBoxLayout

- (double)computeDerivedHeight
{
  if (qword_2DF610 != -1) {
    dispatch_once(&qword_2DF610, &stru_255138);
  }
  return *(double *)&qword_2DF618;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  [(TUILayout *)self computedTransformedSize];
  if (v3 <= -3.40282347e38)
  {
    uint64_t v6 = 4286578687;
  }
  else
  {
    if (v3 < 3.40282347e38)
    {
      *(float *)&unsigned int v4 = v3;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v4 | 0x7FC0000000000000);
    }
    uint64_t v6 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v6 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)TUISegmentedControlBoxLayout;
  uint64_t v6 = -[TUIStatefulElementBoxLayout axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:](&v8, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:", a3, a4, a6, a5.x, a5.y);
  [v6 setShouldVendControlView:1];

  return v6;
}

@end