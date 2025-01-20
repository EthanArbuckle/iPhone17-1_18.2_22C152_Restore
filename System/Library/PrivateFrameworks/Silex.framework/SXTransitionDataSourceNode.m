@interface SXTransitionDataSourceNode
- (BOOL)isTransitionable;
- (BOOL)transitionViewIsVisible;
- (BOOL)transitionViewShouldFadeInContent;
- (BOOL)usesThumbnail;
- (CGRect)transitionContainerFrame;
- (CGRect)transitionContentFrame;
- (CGRect)transitionVisibleFrame;
- (SXTransitionDataSourceNode)initWithComponentView:(id)a3 transitionType:(unint64_t)a4 usesThumbnail:(BOOL)a5;
- (SXTransitionableComponentView)componentView;
- (UIView)transitionContainerView;
- (UIView)transitionContentView;
- (unint64_t)transitionType;
@end

@implementation SXTransitionDataSourceNode

- (SXTransitionDataSourceNode)initWithComponentView:(id)a3 transitionType:(unint64_t)a4 usesThumbnail:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXTransitionDataSourceNode;
  v10 = [(SXTransitionDataSourceNode *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_componentView, a3);
    v11->_transitionType = a4;
    v11->_usesThumbnail = a5;
  }

  return v11;
}

- (UIView)transitionContainerView
{
  v2 = [(SXTransitionDataSourceNode *)self componentView];
  v3 = [v2 transitionContainerView];

  return (UIView *)v3;
}

- (UIView)transitionContentView
{
  v2 = [(SXTransitionDataSourceNode *)self componentView];
  v3 = [v2 transitionContentView];

  return (UIView *)v3;
}

- (BOOL)transitionViewIsVisible
{
  v2 = [(SXTransitionDataSourceNode *)self componentView];
  char v3 = [v2 transitionViewIsVisible];

  return v3;
}

- (BOOL)transitionViewShouldFadeInContent
{
  v2 = [(SXTransitionDataSourceNode *)self componentView];
  char v3 = [v2 transitionViewShouldFadeInContent];

  return v3;
}

- (CGRect)transitionVisibleFrame
{
  v2 = [(SXTransitionDataSourceNode *)self componentView];
  [v2 transitionVisibleFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)transitionContainerFrame
{
  v2 = [(SXTransitionDataSourceNode *)self componentView];
  [v2 transitionContainerFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)transitionContentFrame
{
  v2 = [(SXTransitionDataSourceNode *)self componentView];
  [v2 transitionContentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)isTransitionable
{
  v2 = [(SXTransitionDataSourceNode *)self componentView];
  char v3 = [v2 isTransitionable];

  return v3;
}

- (unint64_t)transitionType
{
  return self->_transitionType;
}

- (SXTransitionableComponentView)componentView
{
  return self->_componentView;
}

- (BOOL)usesThumbnail
{
  return self->_usesThumbnail;
}

- (void).cxx_destruct
{
}

@end