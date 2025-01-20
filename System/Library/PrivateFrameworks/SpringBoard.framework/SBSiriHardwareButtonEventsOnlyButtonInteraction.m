@interface SBSiriHardwareButtonEventsOnlyButtonInteraction
+ (id)hardwareButtonInteractionForHomeButtonForwardingToInteraction:(id)a3;
- (BOOL)consumeSinglePressUp;
- (SBSiriHardwareButtonInteraction)parentSiriInteraction;
- (int64_t)siriButtonIdentifier;
- (void)setParentSiriInteraction:(id)a3;
- (void)setSiriButtonIdentifier:(int64_t)a3;
@end

@implementation SBSiriHardwareButtonEventsOnlyButtonInteraction

+ (id)hardwareButtonInteractionForHomeButtonForwardingToInteraction:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SBSiriHardwareButtonEventsOnlyButtonInteraction);
  [(SBSiriHardwareButtonEventsOnlyButtonInteraction *)v4 setSiriButtonIdentifier:1];
  [(SBSiriHardwareButtonEventsOnlyButtonInteraction *)v4 setParentSiriInteraction:v3];

  return v4;
}

- (BOOL)consumeSinglePressUp
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSiriInteraction);
  char v3 = [WeakRetained consumeSinglePressUp];

  return v3;
}

- (int64_t)siriButtonIdentifier
{
  return self->_siriButtonIdentifier;
}

- (void)setSiriButtonIdentifier:(int64_t)a3
{
  self->_siriButtonIdentifier = a3;
}

- (SBSiriHardwareButtonInteraction)parentSiriInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSiriInteraction);
  return (SBSiriHardwareButtonInteraction *)WeakRetained;
}

- (void)setParentSiriInteraction:(id)a3
{
}

- (void).cxx_destruct
{
}

@end