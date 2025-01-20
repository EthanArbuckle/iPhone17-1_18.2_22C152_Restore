@interface _UIPlatterMenuSnapBehavior
- (CGPoint)anchorPoint;
- (_UIPlatterMenuSnapBehavior)initWithItem:(id)a3 attachedToAnchor:(CGPoint)a4;
- (double)damping;
- (double)frequency;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setDamping:(double)a3;
- (void)setFrequency:(double)a3;
@end

@implementation _UIPlatterMenuSnapBehavior

- (_UIPlatterMenuSnapBehavior)initWithItem:(id)a3 attachedToAnchor:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIPlatterMenuSnapBehavior;
  v8 = [(UIDynamicBehavior *)&v14 init];
  if (v8)
  {
    v9 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:]([UIAttachmentBehavior alloc], "initWithItem:attachedToAnchor:", v7, x, y);
    spring1 = v8->_spring1;
    v8->_spring1 = v9;

    v11 = -[UIAttachmentBehavior initWithItem:attachedToAnchor:]([UIAttachmentBehavior alloc], "initWithItem:attachedToAnchor:", v7, x, y);
    spring2 = v8->_spring2;
    v8->_spring2 = v11;

    [(UIAttachmentBehavior *)v8->_spring1 setLength:0.0];
    [(UIAttachmentBehavior *)v8->_spring2 setLength:0.0];
    [(UIDynamicBehavior *)v8 addChildBehavior:v8->_spring1];
    [(UIDynamicBehavior *)v8 addChildBehavior:v8->_spring2];
  }

  return v8;
}

- (double)damping
{
  [(UIAttachmentBehavior *)self->_spring1 damping];
  return result;
}

- (void)setDamping:(double)a3
{
  -[UIAttachmentBehavior setDamping:](self->_spring1, "setDamping:");
  spring2 = self->_spring2;
  [(UIAttachmentBehavior *)spring2 setDamping:a3];
}

- (double)frequency
{
  [(UIAttachmentBehavior *)self->_spring1 frequency];
  return result;
}

- (void)setFrequency:(double)a3
{
  -[UIAttachmentBehavior setFrequency:](self->_spring1, "setFrequency:");
  spring2 = self->_spring2;
  [(UIAttachmentBehavior *)spring2 setFrequency:a3];
}

- (CGPoint)anchorPoint
{
  [(UIAttachmentBehavior *)self->_spring1 anchorPoint];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[UIAttachmentBehavior setAnchorPoint:](self->_spring1, "setAnchorPoint:");
  spring2 = self->_spring2;
  -[UIAttachmentBehavior setAnchorPoint:](spring2, "setAnchorPoint:", x, y);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spring2, 0);
  objc_storeStrong((id *)&self->_spring1, 0);
}

@end