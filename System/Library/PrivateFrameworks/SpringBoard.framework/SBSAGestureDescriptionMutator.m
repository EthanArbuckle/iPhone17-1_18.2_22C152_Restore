@interface SBSAGestureDescriptionMutator
- (NSUUID)associatedInterfaceElementIdentifier;
- (NSUUID)gestureIdentifier;
- (SBSAGestureDescription)gestureDescription;
- (SBSAGestureDescriptionMutator)initWithGestureDescription:(id)a3;
- (id)description;
- (int64_t)gestureRecognizerState;
- (void)setAssociatedInterfaceElementIdentifier:(id)a3;
- (void)setGestureIdentifier:(id)a3;
- (void)setGestureRecognizerState:(int64_t)a3;
@end

@implementation SBSAGestureDescriptionMutator

- (SBSAGestureDescriptionMutator)initWithGestureDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAGestureDescriptionMutator;
  v6 = [(SBSAGestureDescriptionMutator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_gestureDescription, a3);
  }

  return v7;
}

- (NSUUID)gestureIdentifier
{
  return [(SBSAGestureDescription *)self->_gestureDescription gestureIdentifier];
}

- (void)setGestureIdentifier:(id)a3
{
}

- (NSUUID)associatedInterfaceElementIdentifier
{
  return [(SBSAGestureDescription *)self->_gestureDescription associatedInterfaceElementIdentifier];
}

- (void)setAssociatedInterfaceElementIdentifier:(id)a3
{
}

- (int64_t)gestureRecognizerState
{
  return [(SBSAGestureDescription *)self->_gestureDescription gestureRecognizerState];
}

- (void)setGestureRecognizerState:(int64_t)a3
{
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; gestureDescription: %@>",
               objc_opt_class(),
               self,
               self->_gestureDescription);
}

- (SBSAGestureDescription)gestureDescription
{
  return self->_gestureDescription;
}

- (void).cxx_destruct
{
}

@end