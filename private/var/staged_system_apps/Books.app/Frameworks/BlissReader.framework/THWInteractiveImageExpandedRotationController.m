@interface THWInteractiveImageExpandedRotationController
- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (THWInteractiveImageExpandedRotationController)initWithRep:(id)a3 canvas:(id)a4 stageCanvasController:(id)a5;
- (THWInteractiveImageWidgetRep)rep;
- (THWOverlayableZoomableCanvasController)stageCanvasController;
- (double)duration;
- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4;
- (int)autoRotationMode;
- (void)dealloc;
- (void)expandedDidTransitionToSize:(CGSize)a3;
- (void)expandedWillAnimateRotationFromSize:(CGSize)a3 toSize:(CGSize)a4 duration:(double)a5;
- (void)setDuration:(double)a3;
@end

@implementation THWInteractiveImageExpandedRotationController

- (THWInteractiveImageExpandedRotationController)initWithRep:(id)a3 canvas:(id)a4 stageCanvasController:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)THWInteractiveImageExpandedRotationController;
  v7 = [(THWInteractiveImageExpandedRotationController *)&v10 init];
  if (v7)
  {
    v7->_rep = (THWInteractiveImageWidgetRep *)a3;
    v8 = (THWOverlayableZoomableCanvasController *)a5;
    v7->_duration = 5.0;
    v7->_stageCanvasController = v8;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageExpandedRotationController;
  [(THWInteractiveImageExpandedRotationController *)&v3 dealloc];
}

- (int)autoRotationMode
{
  return 4;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  return 1.0;
}

- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)expandedWillAnimateRotationFromSize:(CGSize)a3 toSize:(CGSize)a4 duration:(double)a5
{
  -[THWInteractiveImageExpandedRotationController setDuration:](self, "setDuration:", a5, a3.height, a4.width, a4.height);
  [(THWInteractiveImageWidgetRep *)self->_rep setRotationDuration:a5];
  [self->_rep layout][self layout]invalidateFrame;
  [self->_rep.interactiveCanvasController layoutIfNeeded];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self->_rep stageCanvasController] scrollContainerICC] layoutIfNeeded];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self->_rep stageCanvasController] scrollContentICC] layoutIfNeeded];
  v7 = [(THWInteractiveImageWidgetRep *)self->_rep stageCanvasController];
  id v8 = [(THWInteractiveImageWidgetRep *)self->_rep layout];
  [self->_rep layout].stageFrame;
  [v8 rectInRoot:];
  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](v7, "setNaturalFrame:scale:");
  [(THWInteractiveImageWidgetRep *)self->_rep updateDiagramAnimated:1];
  rep = self->_rep;

  [(THWInteractiveImageWidgetRep *)rep setRotationDuration:0.0];
}

- (void)expandedDidTransitionToSize:(CGSize)a3
{
  [self->_rep layout:a3.width height:a3.height];
[self->_rep invalidateForSizeChange];
  [self->_rep layout][self layout];
  [self->_rep interactiveCanvasController].layoutIfNeeded;
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self->_rep stageCanvasController] scrollContainerICC] layoutIfNeeded];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self->_rep stageCanvasController] scrollContentICC] layoutIfNeeded];
  v4 = [(THWInteractiveImageWidgetRep *)self->_rep stageCanvasController];
  id v5 = [(THWInteractiveImageWidgetRep *)self->_rep layout];
  [self->_rep layout].stageFrame
  [v5 rectInRoot:];
  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](v4, "setNaturalFrame:scale:");
  [(THWInteractiveImageWidgetRep *)self->_rep updateDiagramAnimated:0];
  [(THWExpandedRepController *)[(THWInteractiveImageWidgetRep *)self->_rep expandedRepController] expandedRepControllerInvalidateChildrenInPanel:1 invalidateWPAuto:1];
  [(THWExpandedRepController *)[(THWInteractiveImageWidgetRep *)self->_rep expandedRepController] expandedRepControllerInvalidateChildrenInPanel:2 invalidateWPAuto:0];
  [(THWExpandedRepController *)[(THWInteractiveImageWidgetRep *)self->_rep expandedRepController] expandedRepControllerUpdatePanelVisibility];
  v6 = [(THWInteractiveImageWidgetRep *)self->_rep stageCanvasController];

  [(THWOverlayableZoomableCanvasController *)v6 updateContainerInfosToDisplay];
}

- (THWInteractiveImageWidgetRep)rep
{
  return self->_rep;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (THWOverlayableZoomableCanvasController)stageCanvasController
{
  return self->_stageCanvasController;
}

@end