@interface TUIHScrollBox
- (BOOL)acceptsDrop;
- (Class)layoutClass;
- (TUIElementActionTriggerHandler)dropHandler;
- (TUIIdentifier)modelIdentifierForScrollable;
- (double)anchorOffset;
- (double)decelerationRate;
- (void)setAcceptsDrop:(BOOL)a3;
- (void)setAnchorOffset:(double)a3;
- (void)setDecelerationRate:(double)a3;
- (void)setDropHandler:(id)a3;
- (void)setModelIdentifierForScrollable:(id)a3;
@end

@implementation TUIHScrollBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (TUIIdentifier)modelIdentifierForScrollable
{
  return self->_modelIdentifierForScrollable;
}

- (void)setModelIdentifierForScrollable:(id)a3
{
}

- (double)anchorOffset
{
  return self->_anchorOffset;
}

- (void)setAnchorOffset:(double)a3
{
  self->_anchorOffset = a3;
}

- (BOOL)acceptsDrop
{
  return self->_acceptsDrop;
}

- (void)setAcceptsDrop:(BOOL)a3
{
  self->_acceptsDrop = a3;
}

- (TUIElementActionTriggerHandler)dropHandler
{
  return self->_dropHandler;
}

- (void)setDropHandler:(id)a3
{
}

- (double)decelerationRate
{
  return self->_decelerationRate;
}

- (void)setDecelerationRate:(double)a3
{
  self->_decelerationRate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropHandler, 0);

  objc_storeStrong((id *)&self->_modelIdentifierForScrollable, 0);
}

@end