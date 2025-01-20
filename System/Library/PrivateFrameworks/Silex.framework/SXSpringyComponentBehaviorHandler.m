@interface SXSpringyComponentBehaviorHandler
- (CGPoint)originalCenter;
- (SXSpringyComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4;
- (UIAttachmentBehavior)dynamicBehavior;
- (UIDynamicAnimator)dynamicAnimator;
- (double)damping;
- (double)delta;
- (double)frequency;
- (double)lastYOffset;
- (void)dealloc;
- (void)destroyWithBehaviorController:(id)a3;
- (void)setDynamicAnimator:(id)a3;
- (void)setDynamicBehavior:(id)a3;
- (void)setLastYOffset:(double)a3;
- (void)setOriginalCenter:(CGPoint)a3;
- (void)setupWithBehaviorController:(id)a3;
- (void)updateWithBehaviorController:(id)a3;
@end

@implementation SXSpringyComponentBehaviorHandler

- (SXSpringyComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SXSpringyComponentBehaviorHandler;
  v4 = [(SXComponentBehaviorHandler *)&v13 initWithComponentView:a3 withBehavior:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SXComponentBehaviorHandler *)v4 behavior];
    [v6 frequency];
    v5->_frequency = v7;

    v8 = [(SXComponentBehaviorHandler *)v5 behavior];
    [v8 damping];
    v5->_damping = v9;

    v10 = [(SXComponentBehaviorHandler *)v5 behavior];
    [v10 delta];
    v5->_delta = v11;
  }
  return v5;
}

- (void)setupWithBehaviorController:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SXSpringyComponentBehaviorHandler;
  id v4 = a3;
  [(SXComponentBehaviorHandler *)&v20 setupWithBehaviorController:v4];
  v5 = [(SXComponentBehaviorHandler *)self behaviorView];
  v6 = [v4 animator];

  [(SXSpringyComponentBehaviorHandler *)self setDynamicAnimator:v6];
  [v5 center];
  -[SXSpringyComponentBehaviorHandler setOriginalCenter:](self, "setOriginalCenter:");
  double v7 = [v5 superview];
  [v5 center];
  double v9 = v8;
  double v11 = v10;
  v12 = [(SXSpringyComponentBehaviorHandler *)self dynamicAnimator];
  objc_super v13 = [v12 referenceView];
  objc_msgSend(v7, "convertPoint:toView:", v13, v9, v11);
  double v15 = v14;
  double v17 = v16;

  v18 = objc_msgSend(objc_alloc(MEMORY[0x263F1C448]), "initWithItem:attachedToAnchor:", v5, v15, v17);
  [v18 setLength:0.0];
  [(SXSpringyComponentBehaviorHandler *)self frequency];
  objc_msgSend(v18, "setFrequency:");
  [(SXSpringyComponentBehaviorHandler *)self damping];
  objc_msgSend(v18, "setDamping:");
  v19 = [(SXSpringyComponentBehaviorHandler *)self dynamicAnimator];
  [v19 addBehavior:v18];

  [(SXSpringyComponentBehaviorHandler *)self setDynamicBehavior:v18];
}

- (void)updateWithBehaviorController:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)SXSpringyComponentBehaviorHandler;
  id v4 = a3;
  [(SXComponentBehaviorHandler *)&v19 updateWithBehaviorController:v4];
  v5 = [(SXComponentBehaviorHandler *)self behaviorView];
  v6 = [v4 viewport];

  [v6 dynamicBounds];
  double v8 = v7;

  [(SXSpringyComponentBehaviorHandler *)self lastYOffset];
  double v10 = v8 - v9;
  [v5 center];
  double v12 = v11;
  [(SXSpringyComponentBehaviorHandler *)self originalCenter];
  double v14 = v13;
  [(SXSpringyComponentBehaviorHandler *)self delta];
  double v16 = v10 * v15;
  if (v10 >= v16) {
    double v17 = v10;
  }
  else {
    double v17 = v16;
  }
  if (v10 < v16) {
    double v16 = v10;
  }
  if (v10 < 0.0) {
    double v16 = v17;
  }
  objc_msgSend(v5, "setCenter:", v14, v12 + v16);
  v18 = [(SXSpringyComponentBehaviorHandler *)self dynamicAnimator];
  [v18 updateItemUsingCurrentState:v5];

  [(SXSpringyComponentBehaviorHandler *)self setLastYOffset:v8];
}

- (void)destroyWithBehaviorController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SXSpringyComponentBehaviorHandler;
  [(SXComponentBehaviorHandler *)&v6 destroyWithBehaviorController:a3];
  id v4 = [(SXSpringyComponentBehaviorHandler *)self dynamicAnimator];
  v5 = [(SXSpringyComponentBehaviorHandler *)self dynamicBehavior];
  [v4 removeBehavior:v5];

  [(SXSpringyComponentBehaviorHandler *)self setDynamicBehavior:0];
  [(SXSpringyComponentBehaviorHandler *)self setDynamicAnimator:0];
}

- (void)dealloc
{
  [(SXSpringyComponentBehaviorHandler *)self destroyWithBehaviorController:0];
  v3.receiver = self;
  v3.super_class = (Class)SXSpringyComponentBehaviorHandler;
  [(SXSpringyComponentBehaviorHandler *)&v3 dealloc];
}

- (double)lastYOffset
{
  return self->_lastYOffset;
}

- (void)setLastYOffset:(double)a3
{
  self->_lastYOffset = a3;
}

- (UIAttachmentBehavior)dynamicBehavior
{
  return self->_dynamicBehavior;
}

- (void)setDynamicBehavior:(id)a3
{
}

- (UIDynamicAnimator)dynamicAnimator
{
  return self->_dynamicAnimator;
}

- (void)setDynamicAnimator:(id)a3
{
}

- (CGPoint)originalCenter
{
  double x = self->_originalCenter.x;
  double y = self->_originalCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalCenter:(CGPoint)a3
{
  self->_originalCenter = a3;
}

- (double)frequency
{
  return self->_frequency;
}

- (double)damping
{
  return self->_damping;
}

- (double)delta
{
  return self->_delta;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicAnimator, 0);
  objc_storeStrong((id *)&self->_dynamicBehavior, 0);
}

@end