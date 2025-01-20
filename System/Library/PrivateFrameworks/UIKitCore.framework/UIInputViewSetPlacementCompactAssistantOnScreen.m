@interface UIInputViewSetPlacementCompactAssistantOnScreen
+ (BOOL)supportsSecureCoding;
- (CGPoint)offset;
- (double)verticalOffset;
- (id)applicatorInfoForOwner:(id)a3;
- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
- (id)widthConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5;
- (void)setOffset:(CGPoint)a3;
@end

@implementation UIInputViewSetPlacementCompactAssistantOnScreen

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)applicatorInfoForOwner:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  v7.receiver = self;
  v7.super_class = (Class)UIInputViewSetPlacementCompactAssistantOnScreen;
  v4 = [(UIInputViewSetPlacement *)&v7 applicatorInfoForOwner:a3];
  v5 = [v3 dictionaryWithDictionary:v4];

  [v5 setValue:MEMORY[0x1E4F1CC38] forKey:@"IsCompact"];
  return v5;
}

- (id)widthConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (a4)
  {
    v6 = [MEMORY[0x1E4F5B268] constraintWithItem:a4 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:75.0];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)horizontalConstraintForInputViewSet:(id)a3 hostView:(id)a4 containerView:(id)a5
{
  if (a4)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F5B268];
    id v8 = a5;
    id v9 = a4;
    [(UIInputViewSetPlacementCompactAssistantOnScreen *)self offset];
    v11 = [v7 constraintWithItem:v9 attribute:9 relatedBy:0 toItem:v8 attribute:9 multiplier:1.0 constant:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (double)verticalOffset
{
  [(UIInputViewSetPlacementCompactAssistantOnScreen *)self offset];
  return v2;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

@end