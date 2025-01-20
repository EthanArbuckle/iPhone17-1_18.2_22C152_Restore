@interface _LookAroundViewState
- (BOOL)compassHidden;
- (BOOL)navigatingEnabled;
- (BOOL)panningEnabled;
- (BOOL)showsPointLabels;
- (BOOL)showsRoadLabels;
- (BOOL)zoomingEnabled;
- (MKLookAroundView)lookAroundView;
- (UIView)superview;
- (_LookAroundViewState)initWithLookAroundView:(id)a3;
- (void)restoreStateToLookAroundView:(id)a3;
@end

@implementation _LookAroundViewState

- (_LookAroundViewState)initWithLookAroundView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_LookAroundViewState;
  v6 = [(_LookAroundViewState *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lookAroundView, a3);
    uint64_t v8 = [v5 superview];
    superview = v7->_superview;
    v7->_superview = (UIView *)v8;

    v7->_compassHidden = [v5 isCompassHidden];
    v7->_navigatingEnabled = [v5 navigatingEnabled];
    v7->_panningEnabled = [v5 panningEnabled];
    v7->_zoomingEnabled = [v5 zoomingEnabled];
    v7->_showsPointLabels = [v5 showsPointLabels];
    v7->_showsRoadLabels = [v5 showsRoadLabels];
  }

  return v7;
}

- (void)restoreStateToLookAroundView:(id)a3
{
  superview = self->_superview;
  id v5 = a3;
  [(UIView *)superview insertSubview:v5 atIndex:0];
  [v5 setCompassHidden:self->_compassHidden];
  [v5 setNavigatingEnabled:self->_navigatingEnabled];
  [v5 setPanningEnabled:self->_panningEnabled];
  [v5 setZoomingEnabled:self->_zoomingEnabled];
  [v5 setShowsRoadLabels:self->_showsRoadLabels];
  [v5 setShowsPointLabels:self->_showsPointLabels];
}

- (MKLookAroundView)lookAroundView
{
  return self->_lookAroundView;
}

- (UIView)superview
{
  return self->_superview;
}

- (BOOL)compassHidden
{
  return self->_compassHidden;
}

- (BOOL)navigatingEnabled
{
  return self->_navigatingEnabled;
}

- (BOOL)panningEnabled
{
  return self->_panningEnabled;
}

- (BOOL)zoomingEnabled
{
  return self->_zoomingEnabled;
}

- (BOOL)showsPointLabels
{
  return self->_showsPointLabels;
}

- (BOOL)showsRoadLabels
{
  return self->_showsRoadLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_superview, 0);

  objc_storeStrong((id *)&self->_lookAroundView, 0);
}

@end