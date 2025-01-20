@interface _PUPickerNavigationBarAllowingUnclippedSubviewHitTest
- (id)_unclippedViewPassingHitTest:(id)a3 point:(CGPoint)a4 event:(id)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _PUPickerNavigationBarAllowingUnclippedSubviewHitTest

- (id)_unclippedViewPassingHitTest:(id)a3 point:(CGPoint)a4 event:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        -[_PUPickerNavigationBarAllowingUnclippedSubviewHitTest convertPoint:toView:](self, "convertPoint:toView:", v16, x, y, (void)v22);
        v17 = objc_msgSend(v16, "hitTest:withEvent:", v10);
        v18 = v17;
        if (v17 && ![v17 clipsToBounds])
        {
          v20 = v11;
          goto LABEL_14;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  v19 = [MEMORY[0x1E4F1CA48] array];
  v20 = PXReduce();

  if ([v20 count])
  {
    v18 = -[_PUPickerNavigationBarAllowingUnclippedSubviewHitTest _unclippedViewPassingHitTest:point:event:](self, "_unclippedViewPassingHitTest:point:event:", v20, v10, x, y);
  }
  else
  {
    v18 = 0;
  }
LABEL_14:

  return v18;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PUPickerNavigationBarAllowingUnclippedSubviewHitTest;
  v8 = -[_PUPickerNavigationBarAllowingUnclippedSubviewHitTest hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  if (!v8)
  {
    if (([(_PUPickerNavigationBarAllowingUnclippedSubviewHitTest *)self isHidden] & 1) != 0
      || ([(_PUPickerNavigationBarAllowingUnclippedSubviewHitTest *)self alpha], v9 <= 0.01)
      || ![(_PUPickerNavigationBarAllowingUnclippedSubviewHitTest *)self isUserInteractionEnabled])
    {
      v8 = 0;
    }
    else
    {
      id v10 = [(_PUPickerNavigationBarAllowingUnclippedSubviewHitTest *)self subviews];
      v8 = -[_PUPickerNavigationBarAllowingUnclippedSubviewHitTest _unclippedViewPassingHitTest:point:event:](self, "_unclippedViewPassingHitTest:point:event:", v10, v7, x, y);
    }
  }

  return v8;
}

@end