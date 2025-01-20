@interface CRLAccessibilityGroupButtonElement
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (CGRect)_boundingFrame;
- (CGRect)accessibilityFrame;
- (CGRect)boundingFrameInScreenCoordinates;
- (CRLAccessibilityGroupButtonElement)initWithChildren:(id)a3 andParent:(id)a4;
- (NSArray)children;
- (NSString)hint;
- (NSString)label;
- (id)accessibilityHint;
- (id)childRespondingToPress;
- (unint64_t)accessibilityTraits;
- (void)setChildRespondingToPress:(id)a3;
- (void)setChildren:(id)a3;
- (void)setHint:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CRLAccessibilityGroupButtonElement

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  [(CRLAccessibilityGroupButtonElement *)self boundingFrameInScreenCoordinates];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)accessibilityTraits
{
  v14.receiver = self;
  v14.super_class = (Class)CRLAccessibilityGroupButtonElement;
  unint64_t v3 = [(CRLAccessibilityGroupButtonElement *)&v14 accessibilityTraits];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = [(CRLAccessibilityGroupButtonElement *)self children];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 |= (unint64_t)[*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) accessibilityTraits];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)accessibilityHint
{
  return [(CRLAccessibilityGroupButtonElement *)self hint];
}

- (BOOL)accessibilityActivate
{
  unint64_t v3 = [(CRLAccessibilityGroupButtonElement *)self childRespondingToPress];

  if (v3)
  {
    double v4 = [(CRLAccessibilityGroupButtonElement *)self childRespondingToPress];
    unsigned __int8 v5 = [v4 accessibilityActivate];
  }
  else
  {
    id v6 = [(CRLAccessibilityGroupButtonElement *)self children];
    id v7 = [v6 count];

    if (!v7) {
      return 0;
    }
    double v4 = [(CRLAccessibilityGroupButtonElement *)self children];
    v8 = [v4 objectAtIndexedSubscript:0];
    unsigned __int8 v5 = [v8 accessibilityActivate];
  }
  return v5;
}

- (CRLAccessibilityGroupButtonElement)initWithChildren:(id)a3 andParent:(id)a4
{
  id v6 = a3;
  id v7 = [(CRLAccessibilityElement *)self initWithAccessibilityParent:a4];
  v8 = v7;
  if (v7) {
    [(CRLAccessibilityGroupButtonElement *)v7 setChildren:v6];
  }

  return v8;
}

- (CGRect)boundingFrameInScreenCoordinates
{
  unint64_t v3 = [(CRLAccessibilityElement *)self parent];
  [(CRLAccessibilityGroupButtonElement *)self _boundingFrame];
  [v3 crlaxFrameFromBounds:];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
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
  double v6 = [(CRLAccessibilityGroupButtonElement *)self children];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * (void)v10) crlaxCGRectValueForKey:@"frame"];
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
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
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

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)hint
{
  return self->_hint;
}

- (void)setHint:(id)a3
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
  id WeakRetained = objc_loadWeakRetained(&self->_childRespondingToPress);

  return WeakRetained;
}

- (void)setChildRespondingToPress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_childRespondingToPress);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_hint, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end