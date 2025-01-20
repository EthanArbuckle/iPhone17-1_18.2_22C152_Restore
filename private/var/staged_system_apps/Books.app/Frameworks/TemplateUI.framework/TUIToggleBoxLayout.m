@interface TUIToggleBoxLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6;
@end

@implementation TUIToggleBoxLayout

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  if (*(double *)&qword_2DF360 <= -3.40282347e38)
  {
    uint64_t v5 = 4286578687;
  }
  else
  {
    if (*(double *)&qword_2DF360 < 3.40282347e38)
    {
      *(float *)&unsigned int v3 = *(double *)&qword_2DF360;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v3 | 0x7FC0000000000000);
    }
    uint64_t v5 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  if (*(double *)&qword_2DF358 <= -3.40282347e38)
  {
    uint64_t v5 = 4286578687;
  }
  else
  {
    if (*(double *)&qword_2DF358 < 3.40282347e38)
    {
      *(float *)&unsigned int v3 = *(double *)&qword_2DF358;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v3 | 0x7FC0000000000000);
    }
    uint64_t v5 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- (id)axModelTreeWithCustomActionsCollector:(id)a3 scrollAncestorLayout:(id)a4 scrollAncestorTranslation:(CGPoint)a5 liveTransformAncestorLayout:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)TUIToggleBoxLayout;
  v6 = -[TUIStatefulElementBoxLayout axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:](&v8, "axModelTreeWithCustomActionsCollector:scrollAncestorLayout:scrollAncestorTranslation:liveTransformAncestorLayout:", a3, a4, a6, a5.x, a5.y);
  [v6 setShouldVendControlView:1];

  return v6;
}

@end