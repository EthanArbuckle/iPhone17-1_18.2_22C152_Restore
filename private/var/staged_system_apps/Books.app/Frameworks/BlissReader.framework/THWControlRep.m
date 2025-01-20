@interface THWControlRep
- (BOOL)directlyManagesLayerContent;
- (BOOL)repIsBeingRemoved;
- (id)controlHostRep;
- (void)invalidateLayers;
- (void)wasAddedToParent;
- (void)willBeRemoved;
- (void)willBeRemovedFromParent;
@end

@implementation THWControlRep

- (void)willBeRemoved
{
  self->_repIsBeingRemoved = 1;
  id v3 = [(THWControlRep *)self controlHostRep];
  id v4 = [(THWControlRep *)self layout];

  [v3 control:v4 repWillBeRemoved:self];
}

- (id)controlHostRep
{
  id v3 = [(THWControlRep *)self interactiveCanvasController];

  return [v3 ancestorRepOfRep:self orDelegateConformingToProtocol:&OBJC_PROTOCOL___THWControlHosting];
}

- (void)willBeRemovedFromParent
{
  v3.receiver = self;
  v3.super_class = (Class)THWControlRep;
  [(THWControlRep *)&v3 willBeRemovedFromParent];
  if (!self->_repIsBeingRemoved) {
    [(-[THWControlRep controlHostRep](self, "controlHostRep")) control:repWillBeRemoved:(-[THWControlRep layout](self, "layout")) self];
  }
}

- (void)wasAddedToParent
{
  v3.receiver = self;
  v3.super_class = (Class)THWControlRep;
  [(THWControlRep *)&v3 wasAddedToParent];
  [(-[THWControlRep controlHostRep](self, "controlHostRep")) control:repWasAdded:(-[THWControlRep layout](self, "layout")) self];
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)invalidateLayers
{
  id v2 = [(THWControlRep *)self canvas];

  [v2 invalidateLayers];
}

- (BOOL)repIsBeingRemoved
{
  return self->_repIsBeingRemoved;
}

@end