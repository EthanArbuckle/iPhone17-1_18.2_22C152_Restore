@interface TSAccessibilityGroupButtonElement
- (CGRect)_boundingFrame;
- (CGRect)boundingFrameInScreenCoordinates;
- (NSArray)children;
- (NSString)accessibilityDescription;
- (NSString)accessibilityHelp;
- (TSAccessibilityGroupButtonElement)initWithChildren:(id)a3 andParent:(id)a4;
- (id)childRespondingToPress;
- (void)dealloc;
- (void)setAccessibilityDescription:(id)a3;
- (void)setAccessibilityHelp:(id)a3;
- (void)setChildRespondingToPress:(id)a3;
- (void)setChildren:(id)a3;
@end

@implementation TSAccessibilityGroupButtonElement

- (TSAccessibilityGroupButtonElement)initWithChildren:(id)a3 andParent:(id)a4
{
  v5 = [(TSAccessibilityElement *)self initWithAccessibilityParent:a4];
  v6 = v5;
  if (v5) {
    [(TSAccessibilityGroupButtonElement *)v5 setChildren:a3];
  }
  return v6;
}

- (void)dealloc
{
  [(TSAccessibilityGroupButtonElement *)self setChildren:0];
  [(TSAccessibilityGroupButtonElement *)self setAccessibilityDescription:0];
  [(TSAccessibilityGroupButtonElement *)self setAccessibilityHelp:0];
  v3.receiver = self;
  v3.super_class = (Class)TSAccessibilityGroupButtonElement;
  [(TSAccessibilityGroupButtonElement *)&v3 dealloc];
}

- (CGRect)boundingFrameInScreenCoordinates
{
  id v3 = [(TSAccessibilityElement *)self parent];
  [(TSAccessibilityGroupButtonElement *)self _boundingFrame];

  [v3 tsaxFrameFromBounds:];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_boundingFrame
{
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  double v6 = [(TSAccessibilityGroupButtonElement *)self children];
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v10) tsaxCGRectValueForKey:@"frame"];
        v27.origin.CGFloat x = v11;
        v27.origin.CGFloat y = v12;
        v27.size.CGFloat width = v13;
        v27.size.CGFloat height = v14;
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        CGRect v25 = CGRectUnion(v24, v27);
        CGFloat x = v25.origin.x;
        CGFloat y = v25.origin.y;
        CGFloat width = v25.size.width;
        CGFloat height = v25.size.height;
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (NSString)accessibilityHelp
{
  return self->_accessibilityHelp;
}

- (void)setAccessibilityHelp:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (id)childRespondingToPress
{
  return self->_childRespondingToPress;
}

- (void)setChildRespondingToPress:(id)a3
{
  self->_childRespondingToPress = a3;
}

@end