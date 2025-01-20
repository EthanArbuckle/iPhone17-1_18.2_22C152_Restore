@interface HUDLineAnimationDelegate
- (HUDLine)hudLine;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setHudLine:(id)a3;
@end

@implementation HUDLineAnimationDelegate

- (void)animationDidStart:(id)a3
{
  id v4 = [(HUDLineAnimationDelegate *)self hudLine];
  v3 = [v4 lineDelegate];
  [v3 animationDidStartOnLine:v4];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5 = [(HUDLineAnimationDelegate *)self hudLine];
  id v4 = [v5 lineDelegate];
  [v4 animationDidStopOnLine:v5];
}

- (HUDLine)hudLine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hudLine);

  return (HUDLine *)WeakRetained;
}

- (void)setHudLine:(id)a3
{
}

- (void).cxx_destruct
{
}

@end