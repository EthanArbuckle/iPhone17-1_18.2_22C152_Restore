@interface SBHomeGestureDismissableCoverSheetViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)shouldDismissForHomeGestureRecognizer:(id)a3;
- (BOOL)wantsHomeGestureOwnership;
- (SBFZStackParticipant)zStackParticipant;
- (SBHomeGesturePanGestureRecognizer)bottomEdgeRecognizer;
- (int64_t)zStackParticipantIdentifier;
- (void)_addOrRemoveGestureForCurrentSettings;
- (void)_handleBottomEdgeGesture:(id)a3;
- (void)_handleBottomEdgeGestureEnded:(id)a3;
- (void)_relinquishHomeGestureOwnership;
- (void)_requestHomeGestureOwnership;
- (void)setBottomEdgeRecognizer:(id)a3;
- (void)setWantsHomeGestureOwnership:(BOOL)a3;
- (void)setZStackParticipant:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4;
- (void)zStackParticipantDidChange:(id)a3;
@end

@implementation SBHomeGestureDismissableCoverSheetViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeGestureDismissableCoverSheetViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidAppear:a3];
  [(SBHomeGestureDismissableCoverSheetViewController *)self _addOrRemoveGestureForCurrentSettings];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBHomeGestureDismissableCoverSheetViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillDisappear:a3];
  [(SBHomeGestureDismissableCoverSheetViewController *)self _addOrRemoveGestureForCurrentSettings];
}

- (BOOL)shouldDismissForHomeGestureRecognizer:(id)a3
{
  return 1;
}

- (int64_t)zStackParticipantIdentifier
{
  return 9;
}

- (void)zStackParticipantDidChange:(id)a3
{
  [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
  id v6 = +[SBSystemGestureManager mainDisplayManager];
  int v4 = [(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture];
  bottomEdgeRecognizer = self->_bottomEdgeRecognizer;
  if (v4) {
    [v6 addGestureRecognizer:bottomEdgeRecognizer withType:93];
  }
  else {
    [v6 removeGestureRecognizer:bottomEdgeRecognizer];
  }
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
}

- (void)setWantsHomeGestureOwnership:(BOOL)a3
{
  if (self->_wantsHomeGestureOwnership != a3)
  {
    self->_wantsHomeGestureOwnership = a3;
    if (a3) {
      [(SBHomeGestureDismissableCoverSheetViewController *)self _requestHomeGestureOwnership];
    }
    else {
      [(SBHomeGestureDismissableCoverSheetViewController *)self _relinquishHomeGestureOwnership];
    }
  }
}

- (void)_requestHomeGestureOwnership
{
  v3 = [(SBHomeGestureDismissableCoverSheetViewController *)self zStackParticipant];
  if (!v3)
  {
    if (![(SBHomeGestureDismissableCoverSheetViewController *)self zStackParticipantIdentifier])return; {
    int v4 = [(SBHomeGestureDismissableCoverSheetViewController *)self view];
    }
    v5 = [v4 _sbWindowScene];
    id v6 = [v5 zStackResolver];
    objc_msgSend(v6, "acquireParticipantWithIdentifier:delegate:", -[SBHomeGestureDismissableCoverSheetViewController zStackParticipantIdentifier](self, "zStackParticipantIdentifier"), self);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    [(SBHomeGestureDismissableCoverSheetViewController *)self setZStackParticipant:v7];
    [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self];
    v3 = v7;
  }
}

- (void)_relinquishHomeGestureOwnership
{
  v3 = [(SBHomeGestureDismissableCoverSheetViewController *)self zStackParticipant];

  if (v3)
  {
    int v4 = [(SBHomeGestureDismissableCoverSheetViewController *)self zStackParticipant];
    [v4 invalidate];

    [(SBHomeGestureDismissableCoverSheetViewController *)self setZStackParticipant:0];
  }
}

- (void)_addOrRemoveGestureForCurrentSettings
{
  id v7 = +[SBSystemGestureManager mainDisplayManager];
  int v3 = [(SBHomeGestureDismissableCoverSheetViewController *)self _appearState];
  if (v3 && v3 != 3 && SBHomeGestureEnabled())
  {
    if (!self->_bottomEdgeRecognizer)
    {
      int v4 = +[SBHomeGesturePanGestureRecognizer homeGesturePanGestureRecognizerWithTarget:self action:sel__handleBottomEdgeGesture_];
      bottomEdgeRecognizer = self->_bottomEdgeRecognizer;
      self->_bottomEdgeRecognizer = v4;

      [(UIScreenEdgePanGestureRecognizer *)self->_bottomEdgeRecognizer setEdges:4];
      [(SBHomeGesturePanGestureRecognizer *)self->_bottomEdgeRecognizer setDelegate:self];
      [(SBHomeGestureDismissableCoverSheetViewController *)self setWantsHomeGestureOwnership:1];
      if ([(SBFZStackParticipant *)self->_zStackParticipant ownsHomeGesture]) {
        [v7 addGestureRecognizer:self->_bottomEdgeRecognizer withType:93];
      }
    }
  }
  else if (self->_bottomEdgeRecognizer)
  {
    objc_msgSend(v7, "removeGestureRecognizer:");
    id v6 = self->_bottomEdgeRecognizer;
    self->_bottomEdgeRecognizer = 0;

    [(SBHomeGestureDismissableCoverSheetViewController *)self setWantsHomeGestureOwnership:0];
  }
}

- (void)_handleBottomEdgeGesture:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    [(SBHomeGestureDismissableCoverSheetViewController *)self _handleBottomEdgeGestureEnded:v7];
LABEL_8:
    id v6 = v7;
    goto LABEL_9;
  }
  if (v4 == 2)
  {
    [(SBHomeGestureDismissableCoverSheetViewController *)self _handleBottomEdgeGestureChanged:v7];
    goto LABEL_8;
  }
  BOOL v5 = v4 == 1;
  id v6 = v7;
  if (v5)
  {
    [(SBHomeGestureDismissableCoverSheetViewController *)self _handleBottomEdgeGestureBegan:v7];
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_handleBottomEdgeGestureEnded:(id)a3
{
  if (self->_bottomEdgeRecognizer == a3
    && -[SBHomeGestureDismissableCoverSheetViewController shouldDismissForHomeGestureRecognizer:](self, "shouldDismissForHomeGestureRecognizer:"))
  {
    [(CSCoverSheetViewControllerBase *)self dismiss];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v4 = [(SBHomeGestureDismissableCoverSheetViewController *)self view];
  BOOL v5 = [v4 _sbWindowScene];
  id v6 = [v5 zStackResolver];

  id v7 = [(SBHomeGestureDismissableCoverSheetViewController *)self zStackParticipant];
  char v8 = [v7 ownsHomeGesture];

  if (v6) {
    return v8;
  }
  else {
    return 1;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_bottomEdgeRecognizer == a3
      && [(CSCoverSheetViewControllerBase *)self participantState] == 2;
}

- (SBHomeGesturePanGestureRecognizer)bottomEdgeRecognizer
{
  return self->_bottomEdgeRecognizer;
}

- (void)setBottomEdgeRecognizer:(id)a3
{
}

- (BOOL)wantsHomeGestureOwnership
{
  return self->_wantsHomeGestureOwnership;
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_bottomEdgeRecognizer, 0);
}

@end