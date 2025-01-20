@interface _UISpringBehavior
- (CGPoint)anchorPoint;
- (_UISpringBehavior)init;
- (_UISpringBehavior)initWithItem:(id)a3 anchorPoint:(CGPoint)a4;
- (double)damping;
- (double)frequency;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setDamping:(double)a3;
- (void)setFrequency:(double)a3;
@end

@implementation _UISpringBehavior

- (_UISpringBehavior)initWithItem:(id)a3 anchorPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a3;
  if (!v8)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"_UISpringBehavior.m", 28, @"Invalid parameter not satisfying: %@", @"item" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)_UISpringBehavior;
  v9 = [(UIDynamicBehavior *)&v27 init];
  if (v9)
  {
    v10 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:]([UIAttachmentBehavior alloc], "initWithItem:attachedToAnchor:", v8, x, y);
    [(UIAttachmentBehavior *)v10 setDamping:0.75];
    [(UIAttachmentBehavior *)v10 setFrequency:4.5];
    [(UIDynamicBehavior *)v9 addChildBehavior:v10];
    topLeft = v9->_topLeft;
    v9->_topLeft = v10;
    v12 = v10;

    v13 = [UIAttachmentBehavior alloc];
    v14 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:](v13, "initWithItem:attachedToAnchor:", v8, x, y);
    [(UIAttachmentBehavior *)v14 setDamping:0.75];
    [(UIAttachmentBehavior *)v14 setFrequency:4.5];
    [(UIDynamicBehavior *)v9 addChildBehavior:v14];
    topRight = v9->_topRight;
    v9->_topRight = v14;
    v16 = v14;

    v17 = [UIAttachmentBehavior alloc];
    v18 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:](v17, "initWithItem:attachedToAnchor:", v8, x, y);
    [(UIAttachmentBehavior *)v18 setDamping:0.75];
    [(UIAttachmentBehavior *)v18 setFrequency:4.5];
    [(UIDynamicBehavior *)v9 addChildBehavior:v18];
    bottomRight = v9->_bottomRight;
    v9->_bottomRight = v18;
    v20 = v18;

    v21 = [UIAttachmentBehavior alloc];
    v22 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:](v21, "initWithItem:attachedToAnchor:", v8, x, y);
    [(UIAttachmentBehavior *)v22 setDamping:0.75];
    [(UIAttachmentBehavior *)v22 setFrequency:4.5];
    [(UIDynamicBehavior *)v9 addChildBehavior:v22];
    bottomLeft = v9->_bottomLeft;
    v9->_bottomLeft = v22;

    -[_UISpringBehavior setAnchorPoint:](v9, "setAnchorPoint:", x, y);
    v24 = v9;
  }

  return v9;
}

- (_UISpringBehavior)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = NSStringFromSelector(sel_initWithItem_anchorPoint_);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v4 handleFailureInMethod:a2, self, @"_UISpringBehavior.m", 66, @"Use %@ to instantiate an instance of %@.", v5, v7 object file lineNumber description];

  return 0;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = a3.x + -100.0;
  CGFloat v7 = a3.y + -100.0;
  -[UIAttachmentBehavior setAnchorPoint:](self->_topLeft, "setAnchorPoint:", a3.x + -100.0, a3.y + -100.0);
  -[UIAttachmentBehavior setAnchorPoint:](self->_topRight, "setAnchorPoint:", x + 100.0, v7);
  -[UIAttachmentBehavior setAnchorPoint:](self->_bottomRight, "setAnchorPoint:", x + 100.0, y + 100.0);
  -[UIAttachmentBehavior setAnchorPoint:](self->_bottomLeft, "setAnchorPoint:", v6, y + 100.0);
  self->_anchorPoint.double x = x;
  self->_anchorPoint.double y = y;
}

- (void)setDamping:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_damping = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(UIDynamicBehavior *)self childBehaviors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setDamping:self->_damping];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setFrequency:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_frequencdouble y = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(UIDynamicBehavior *)self childBehaviors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setFrequency:self->_frequency];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)damping
{
  return self->_damping;
}

- (double)frequency
{
  return self->_frequency;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLeft, 0);
  objc_storeStrong((id *)&self->_bottomRight, 0);
  objc_storeStrong((id *)&self->_topRight, 0);
  objc_storeStrong((id *)&self->_topLeft, 0);
}

@end