@interface UIInputViewSetPlacementWrapper
+ (BOOL)supportsSecureCoding;
+ (id)placementWithPlacement:(id)a3;
- (BOOL)accessoryViewWillAppear;
- (BOOL)inputViewWillAppear;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInteractive;
- (BOOL)isUndocked;
- (BOOL)isVisible;
- (BOOL)showsEditItems;
- (BOOL)showsInputOrAssistantViews;
- (BOOL)showsInputViews;
- (BOOL)showsKeyboard;
- (CGAffineTransform)transform;
- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4;
- (Class)applicatorClassForKeyboard:(BOOL)a3;
- (UIInputViewSetPlacementWrapper)initWithCoder:(id)a3;
- (double)alpha;
- (double)inputAssistantViewHeightForInputViewSet:(id)a3;
- (id)applicatorInfoForOwner:(id)a3;
- (id)description;
- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
- (id)subPlacements;
- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
- (id)widthConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
- (unint64_t)computeComparisonMask;
- (unint64_t)indexForPurpose:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDirty;
@end

@implementation UIInputViewSetPlacementWrapper

+ (id)placementWithPlacement:(id)a3
{
  id v5 = a3;
  v6 = (id *)objc_alloc_init((Class)a1);
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 5, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIInputViewSetPlacementWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIInputViewSetPlacementWrapper;
  id v5 = [(UIInputViewSetPlacement *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Actual"];
    actualPlacement = v5->_actualPlacement;
    v5->_actualPlacement = (UIInputViewSetPlacement *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIInputViewSetPlacementWrapper;
  id v4 = a3;
  [(UIInputViewSetPlacement *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_actualPlacement, @"Actual", v5.receiver, v5.super_class);
}

- (void)setDirty
{
  v3.receiver = self;
  v3.super_class = (Class)UIInputViewSetPlacementWrapper;
  [(UIInputViewSetPlacement *)&v3 setDirty];
  [(UIInputViewSetPlacement *)self->_actualPlacement setDirty];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIInputViewSetPlacementWrapper;
  if ([(UIInputViewSetPlacement *)&v7 isEqual:v4]) {
    BOOL v5 = [(UIInputViewSetPlacement *)self->_actualPlacement isEqual:v4[5]];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isUndocked
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement isUndocked];
}

- (BOOL)isVisible
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement isVisible];
}

- (BOOL)showsInputViews
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement showsInputViews];
}

- (BOOL)showsKeyboard
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement showsKeyboard];
}

- (BOOL)showsInputOrAssistantViews
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement showsInputOrAssistantViews];
}

- (BOOL)showsEditItems
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement showsEditItems];
}

- (BOOL)isInteractive
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement isInteractive];
}

- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement horizontalConstraintForInputViewSet:a3 hostView:a4 containerView:a5];
}

- (id)verticalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement verticalConstraintForInputViewSet:a3 hostView:a4 containerView:a5];
}

- (id)widthConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement widthConstraintForInputViewSet:a3 hostView:a4 containerView:a5];
}

- (double)inputAssistantViewHeightForInputViewSet:(id)a3
{
  [(UIInputViewSetPlacement *)self->_actualPlacement inputAssistantViewHeightForInputViewSet:a3];
  return result;
}

- (BOOL)inputViewWillAppear
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement inputViewWillAppear];
}

- (BOOL)accessoryViewWillAppear
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement accessoryViewWillAppear];
}

- (CGRect)remoteIntrinsicContentSizeForInputViewInSet:(id)a3 includingIAV:(BOOL)a4
{
  [(UIInputViewSetPlacement *)self->_actualPlacement remoteIntrinsicContentSizeForInputViewInSet:a3 includingIAV:a4];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)alpha
{
  [(UIInputViewSetPlacement *)self->_actualPlacement alpha];
  return result;
}

- (CGAffineTransform)transform
{
  double result = (CGAffineTransform *)self->_actualPlacement;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result transform];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (Class)applicatorClassForKeyboard:(BOOL)a3
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement applicatorClassForKeyboard:a3];
}

- (id)applicatorInfoForOwner:(id)a3
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement applicatorInfoForOwner:a3];
}

- (id)subPlacements
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement subPlacements];
}

- (unint64_t)indexForPurpose:(unint64_t)a3
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement indexForPurpose:a3];
}

- (unint64_t)computeComparisonMask
{
  return [(UIInputViewSetPlacement *)self->_actualPlacement computeComparisonMask];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ actual:%@>", objc_opt_class(), self->_actualPlacement];
}

- (void).cxx_destruct
{
}

@end