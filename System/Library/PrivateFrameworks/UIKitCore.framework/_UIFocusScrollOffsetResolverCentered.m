@interface _UIFocusScrollOffsetResolverCentered
- (CGPoint)contentOffsetForScrollRequest:(id)a3;
- (unint64_t)scrollOffsetResolverType;
@end

@implementation _UIFocusScrollOffsetResolverCentered

- (unint64_t)scrollOffsetResolverType
{
  return 3;
}

- (CGPoint)contentOffsetForScrollRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 environmentScrollableContainer];
  v5 = [v4 scrollableContainer];

  v6 = [v3 environmentScrollableContainer];
  v7 = [v6 owningEnvironment];

  v8 = [v3 focusItemInfo];
  v9 = [v3 focusMovement];
  unint64_t v10 = [v9 heading];

  [v3 focusItemFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  int CanScrollX = _UIFocusItemScrollableContainerCanScrollX(v5);
  int CanScrollY = _UIFocusItemScrollableContainerCanScrollY(v5);
  [v3 targetContentOffset];
  double v22 = v21;
  double v24 = v23;

  if (CanScrollX)
  {
    if (([v5 visibleSize],
          double v26 = v12 + v16 * 0.5 - v25 * 0.5,
          _UIFocusHeadingIsEffectivelyLeft(v10, v7))
      && v26 < v22
      || _UIFocusHeadingIsEffectivelyRight(v10, v7) && v26 > v22)
    {
      double v22 = v26;
    }
  }
  if (CanScrollY)
  {
    if (([v5 visibleSize], double v27 = v14 + v18 * 0.5, v29 = v27 + v28 * -0.5, (v10)
       || (v10 & 0x20) != 0)
      && v29 < v24
      || ((v10 & 2) != 0 || (v10 & 0x10) != 0) && v29 > v24)
    {
      double v24 = v27 + v28 * -0.5;
    }
  }
  if (v8)
  {
    double v22 = _UIFocusItemScrollableContainerAdjustedContentOffsetToShowFocusItem(v5, v8, v22, v24);
    double v24 = v30;
  }

  double v31 = v22;
  double v32 = v24;
  result.y = v32;
  result.x = v31;
  return result;
}

@end