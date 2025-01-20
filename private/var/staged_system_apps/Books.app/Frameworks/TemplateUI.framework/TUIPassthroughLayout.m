@interface TUIPassthroughLayout
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight;
- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth;
- (BOOL)groupedContainingIsGrouped;
- (UIEdgeInsets)groupedContainingInsets;
- (unint64_t)groupedContainingContentMode;
- (unint64_t)groupedContainingInsetsMode;
- (void)computeLayout;
@end

@implementation TUIPassthroughLayout

- (UIEdgeInsets)groupedContainingInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unint64_t)groupedContainingInsetsMode
{
  return 0;
}

- (unint64_t)groupedContainingContentMode
{
  return 0;
}

- (BOOL)groupedContainingIsGrouped
{
  v2 = [(TUILayout *)self box];
  unsigned __int8 v3 = [v2 grouped];

  return v3;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  unsigned __int8 v3 = [(TUILayout *)self children];
  v4 = [v3 firstObject];

  v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v4 computeIntrinsicWidth];
  return v5;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  unsigned __int8 v3 = [(TUILayout *)self children];
  v4 = [v3 firstObject];

  v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v4 computeIntrinsicHeight];
  return v5;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentWidth
{
  unsigned __int8 v3 = [(TUILayout *)self children];
  v4 = [v3 firstObject];

  v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v4 computedWidth];
  return v5;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computedContentHeight
{
  unsigned __int8 v3 = [(TUILayout *)self children];
  v4 = [v3 firstObject];

  v5 = ($881BB7C90C7D0DFCC1492E3DC022A30F *)[v4 computedHeight];
  return v5;
}

- (void)computeLayout
{
  unsigned __int8 v3 = [(TUILayout *)self children];
  id v4 = [v3 firstObject];

  [(TUILayout *)self containingWidth];
  [v4 setContainingWidth:];
  [(TUILayout *)self containingHeight];
  [v4 setContainingHeight:];
  [(TUILayout *)self flexedWidth];
  [v4 setFlexedWidth:];
  [(TUILayout *)self flexedHeight];
  [v4 setFlexedHeight:];
  [v4 validateLayout];
  [v4 setComputedOrigin:CGPointZero.x, CGPointZero.y];
  [v4 computedTransformedSize];
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");
}

@end