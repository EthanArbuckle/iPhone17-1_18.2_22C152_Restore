@interface SBWindowDragInteraction
- (CGPoint)_locationInView:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)sceneIdentifier;
- (SBAppPlatterDragSourceViewProviding)sourceViewProvider;
- (SBWindowDragInteraction)initWithDelegate:(id)a3 gestureRecognizer:(id)a4;
- (UIGestureRecognizer)gestureRecognizer;
- (void)setBundleIdentifier:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setSourceViewProvider:(id)a3;
@end

@implementation SBWindowDragInteraction

- (SBWindowDragInteraction)initWithDelegate:(id)a3 gestureRecognizer:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBWindowDragInteraction;
  v7 = [(UIDragInteraction *)&v10 initWithDelegate:a3];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_gestureRecognizer, v6);
  }

  return v8;
}

- (CGPoint)_locationInView:(id)a3
{
  p_gestureRecognizer = &self->_gestureRecognizer;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_gestureRecognizer);
  [WeakRetained locationInView:v4];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (UIGestureRecognizer)gestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gestureRecognizer);
  return (UIGestureRecognizer *)WeakRetained;
}

- (SBAppPlatterDragSourceViewProviding)sourceViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceViewProvider);
  return (SBAppPlatterDragSourceViewProviding *)WeakRetained;
}

- (void)setSourceViewProvider:(id)a3
{
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void)setSceneIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_sourceViewProvider);
  objc_destroyWeak((id *)&self->_gestureRecognizer);
}

@end