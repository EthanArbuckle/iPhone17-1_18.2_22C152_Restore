@interface _UISlidingPopoverLayoutInfo
- (CGSize)_popoverViewSizeForContentSize:(CGSize)a3 arrowDirection:(unint64_t)a4;
- (_UISlidingPopoverLayoutInfo)init;
- (void)_updateOutputs;
@end

@implementation _UISlidingPopoverLayoutInfo

- (_UISlidingPopoverLayoutInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UISlidingPopoverLayoutInfo;
  result = [(_UIPopoverLayoutInfo *)&v3 init];
  if (result)
  {
    result->super._arrowHeight = 0.0;
    *(_OWORD *)&result->super._contentInset.bottom = 0u;
    *(_OWORD *)&result->super._contentInset.top = 0u;
  }
  return result;
}

- (CGSize)_popoverViewSizeForContentSize:(CGSize)a3 arrowDirection:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_UISlidingPopoverLayoutInfo;
  -[_UIPopoverLayoutInfo _popoverViewSizeForContentSize:arrowDirection:](&v6, sel__popoverViewSizeForContentSize_arrowDirection_, 0, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_updateOutputs
{
  [(_UIPopoverLayoutInfo *)self _effectiveViewSourceRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[_UISlidingPopoverLayoutInfo _popoverViewSizeForContentSize:arrowDirection:](self, "_popoverViewSizeForContentSize:arrowDirection:", 0, self->super._preferredContentSize.width, self->super._preferredContentSize.height);
  double v12 = v11;
  double v14 = v13;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  double MidX = CGRectGetMidX(v19);
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  CGFloat MidY = CGRectGetMidY(v20);
  v22.origin.x = floor(MidX - (v12 - self->super._contentInset.left - self->super._contentInset.right) * 0.5);
  v22.origin.y = floor(MidY - (v14 - self->super._contentInset.top - self->super._contentInset.bottom) * 0.5);
  double top = self->super._containingFrameInsets.top;
  double left = self->super._containingFrameInsets.left;
  v21.origin.x = self->super._containingFrame.origin.x + left;
  v21.origin.y = self->super._containingFrame.origin.y + top;
  v21.size.width = self->super._containingFrame.size.width - (left + self->super._containingFrameInsets.right);
  v21.size.height = self->super._containingFrame.size.height - (top + self->super._containingFrameInsets.bottom);
  v22.size.width = v12;
  v22.size.height = v14;
  self->super._frame = CGRectIntersection(v21, v22);
}

@end