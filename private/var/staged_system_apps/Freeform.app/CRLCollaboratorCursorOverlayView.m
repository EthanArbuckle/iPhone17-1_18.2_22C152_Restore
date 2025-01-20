@interface CRLCollaboratorCursorOverlayView
- (BOOL)interactionInView;
- (CRLCollaboratorCursorOverlayViewDelegate)interactionDelegate;
- (void)setInteractionDelegate:(id)a3;
- (void)setInteractionInView:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation CRLCollaboratorCursorOverlayView

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (![(CRLCollaboratorCursorOverlayView *)self interactionInView])
  {
    v5 = [(CRLCollaboratorCursorOverlayView *)self interactionDelegate];
    [v5 userInteractionBeganForView:self];

    [(CRLCollaboratorCursorOverlayView *)self setInteractionInView:1];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(CRLCollaboratorCursorOverlayView *)self interactionInView])
  {
    v5 = [(CRLCollaboratorCursorOverlayView *)self interactionDelegate];
    [v5 userInteractionEndedForView:self];

    [(CRLCollaboratorCursorOverlayView *)self setInteractionInView:0];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if ([(CRLCollaboratorCursorOverlayView *)self interactionInView])
  {
    v5 = [(CRLCollaboratorCursorOverlayView *)self interactionDelegate];
    [v5 userInteractionCancelledForView:self];

    [(CRLCollaboratorCursorOverlayView *)self setInteractionInView:0];
  }
}

- (CRLCollaboratorCursorOverlayViewDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);

  return (CRLCollaboratorCursorOverlayViewDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (BOOL)interactionInView
{
  return self->_interactionInView;
}

- (void)setInteractionInView:(BOOL)a3
{
  self->_interactionInView = a3;
}

- (void).cxx_destruct
{
}

@end