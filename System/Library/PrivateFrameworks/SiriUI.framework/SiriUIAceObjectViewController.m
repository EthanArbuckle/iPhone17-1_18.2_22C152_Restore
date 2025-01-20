@interface SiriUIAceObjectViewController
- (AceObject)aceObject;
- (BOOL)_shouldSkipAnimationsInAlternateSpeeds;
- (BOOL)isUtteranceUserInteractionEnabled;
- (BOOL)isVirgin;
- (BOOL)removedAfterDialogProgresses;
- (NSUUID)instrumentationTurnIdentifier;
- (SiriUIAceObjectViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SiriUIAceObjectViewControllerDelegate)delegate;
- (double)_insertionAnimatedZPosition;
- (double)desiredHeight;
- (id)_privateDelegate;
- (int64_t)_insertionAnimation;
- (int64_t)_pinAnimationType;
- (int64_t)_replacementAnimation;
- (void)_setVirgin:(BOOL)a3;
- (void)setAceObject:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInstrumentationTurnIdentifier:(id)a3;
- (void)setUtteranceUserInteractionEnabled:(BOOL)a3;
@end

@implementation SiriUIAceObjectViewController

- (SiriUIAceObjectViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SiriUIAceObjectViewController;
  return [(SiriUIAceObjectViewController *)&v5 initWithNibName:a3 bundle:a4];
}

- (BOOL)removedAfterDialogProgresses
{
  return 0;
}

- (double)desiredHeight
{
  return 0.0;
}

- (BOOL)isUtteranceUserInteractionEnabled
{
  return self->_utteranceUserInteractionEnabled;
}

- (void)setUtteranceUserInteractionEnabled:(BOOL)a3
{
  self->_utteranceUserInteractionEnabled = a3;
}

- (AceObject)aceObject
{
  return self->_aceObject;
}

- (void)setAceObject:(id)a3
{
}

- (BOOL)isVirgin
{
  return self->_virgin;
}

- (SiriUIAceObjectViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUIAceObjectViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)instrumentationTurnIdentifier
{
  return self->_instrumentationTurnIdentifier;
}

- (void)setInstrumentationTurnIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentationTurnIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_aceObject, 0);
}

- (id)_privateDelegate
{
  v3 = [(SiriUIAceObjectViewController *)self delegate];
  int v4 = [(id)objc_opt_class() conformsToProtocol:&unk_26D6B1D98];

  if (v4)
  {
    objc_super v5 = [(SiriUIAceObjectViewController *)self delegate];
  }
  else
  {
    objc_super v5 = 0;
  }
  return v5;
}

- (void)_setVirgin:(BOOL)a3
{
  self->_virgin = a3;
}

- (int64_t)_pinAnimationType
{
  return 0;
}

- (int64_t)_insertionAnimation
{
  return 3;
}

- (int64_t)_replacementAnimation
{
  return 0;
}

- (double)_insertionAnimatedZPosition
{
  return 0.0;
}

- (BOOL)_shouldSkipAnimationsInAlternateSpeeds
{
  return 0;
}

@end