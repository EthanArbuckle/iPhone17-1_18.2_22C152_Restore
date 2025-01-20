@interface UISegmentedControlSpringLoadedBehavior
- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4;
@end

@implementation UISegmentedControlSpringLoadedBehavior

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  id v5 = a4;
  v6 = [a3 view];
  v7 = [v5 targetItem];
  if (v7)
  {
    v8 = [v5 targetItem];
    uint64_t v9 = [v8 integerValue];
  }
  else
  {
    uint64_t v9 = -1;
  }

  [v5 locationInView:v6];
  uint64_t v10 = (int)objc_msgSend(v6, "_closestSegmentIndexAtPoint:");
  if (v9 != v10)
  {
    v11 = [NSNumber numberWithInteger:v10];
    [v5 setTargetItem:v11];
LABEL_9:
    LOBYTE(v12) = 0;
    goto LABEL_10;
  }
  if ((v10 & 0x80000000) != 0)
  {
    LOBYTE(v12) = 0;
    goto LABEL_11;
  }
  v11 = objc_msgSend(v6, "_segmentAtIndex:");
  if (![v11 isUserInteractionEnabled]) {
    goto LABEL_9;
  }
  int v12 = [v11 isSelected] ^ 1;
LABEL_10:

LABEL_11:
  return v12;
}

@end