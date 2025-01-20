@interface THWControlContainerRep
- (BOOL)allowTrackingContainedRep:(id)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)masksToBounds;
- (BOOL)repIsBeingRemoved;
- (THWControlContainerRepDelegate)delegate;
- (id)controlHostRep;
- (id)viewControllerForView:(id)a3;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)addChildViewsToArray:(id)a3;
- (void)setDelegate:(id)a3;
- (void)wasAddedToParent;
- (void)willBeRemoved;
- (void)willBeRemovedFromParent;
@end

@implementation THWControlContainerRep

- (void)willBeRemoved
{
  v3.receiver = self;
  v3.super_class = (Class)THWControlContainerRep;
  [(THWControlContainerRep *)&v3 willBeRemoved];
  self->_repIsBeingRemoved = 1;
  if (objc_msgSend(-[THWControlContainerRep canvas](self, "canvas"), "isCanvasInteractive")) {
    objc_msgSend(objc_msgSend(-[THWControlContainerRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWControlHosting), "control:repWillBeRemoved:", -[THWControlContainerRep layout](self, "layout"), self);
  }
}

- (void)willBeRemovedFromParent
{
  v3.receiver = self;
  v3.super_class = (Class)THWControlContainerRep;
  [(THWControlContainerRep *)&v3 willBeRemovedFromParent];
  if (!self->_repIsBeingRemoved)
  {
    if (objc_msgSend(-[THWControlContainerRep canvas](self, "canvas"), "isCanvasInteractive")) {
      objc_msgSend(objc_msgSend(-[THWControlContainerRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWControlHosting), "control:repWillBeRemoved:", -[THWControlContainerRep layout](self, "layout"), self);
    }
  }
}

- (void)wasAddedToParent
{
  v3.receiver = self;
  v3.super_class = (Class)THWControlContainerRep;
  [(THWControlContainerRep *)&v3 wasAddedToParent];
  if (objc_msgSend(-[THWControlContainerRep canvas](self, "canvas"), "isCanvasInteractive")) {
    objc_msgSend(objc_msgSend(-[THWControlContainerRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWControlHosting), "control:repWasAdded:", -[THWControlContainerRep layout](self, "layout"), self);
  }
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (BOOL)masksToBounds
{
  objc_super v3 = [(THWControlContainerRep *)self delegate];
  v6.receiver = self;
  v6.super_class = (Class)THWControlContainerRep;
  BOOL v4 = [(THWControlContainerRep *)&v6 masksToBounds];
  if (objc_opt_respondsToSelector()) {
    return [(THWControlContainerRepDelegate *)v3 controlContainerMasksToBounds:self];
  }
  return v4;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  v5 = [(THWControlContainerRep *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(THWControlContainerRepDelegate *)v5 controlContainer:self addChildLayersToArray:a3];
  }
}

- (void)addChildViewsToArray:(id)a3
{
  v5 = [(THWControlContainerRep *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(THWControlContainerRepDelegate *)v5 controlContainer:self addChildViewsToArray:a3];
  }
}

- (id)viewControllerForView:(id)a3
{
  v5 = [(THWControlContainerRep *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(THWControlContainerRepDelegate *)v5 controlContainer:self viewControllerForView:a3];
}

- (BOOL)allowTrackingContainedRep:(id)a3
{
  v5 = [(THWControlContainerRep *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }

  return [(THWControlContainerRepDelegate *)v5 controlContainer:self allowTrackingContainedRep:a3];
}

- (id)controlHostRep
{
  id v3 = [(THWControlContainerRep *)self interactiveCanvasController];

  return [v3 ancestorRepOfRep:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THWControlHosting];
}

- (THWControlContainerRepDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWControlContainerRepDelegate *)a3;
}

- (BOOL)repIsBeingRemoved
{
  return self->_repIsBeingRemoved;
}

@end