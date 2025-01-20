@interface _UIContextMenuAsyncConfiguration
+ (id)configurationWithIdentifier:(id)a3 previewProvider:(id)a4 actionProvider:(id)a5;
- (BOOL)fulfillWithConfiguration:(id)a3;
- (_UIContextMenuAsyncConfiguration)init;
- (void)_prepareWithCompletion:(id)a3;
@end

@implementation _UIContextMenuAsyncConfiguration

- (_UIContextMenuAsyncConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIContextMenuAsyncConfiguration;
  return [(UIContextMenuConfiguration *)&v3 init];
}

- (void)_prepareWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [[_UIBurnableBlock alloc] initWithTimeout:v4 block:0 defaultInputProvider:0.5];

  deferredCompletion = self->_deferredCompletion;
  self->_deferredCompletion = v5;
}

- (BOOL)fulfillWithConfiguration:(id)a3
{
  BOOL v4 = [(_UIBurnableBlock *)self->_deferredCompletion performWithInput:a3];
  deferredCompletion = self->_deferredCompletion;
  self->_deferredCompletion = 0;

  return v4;
}

+ (id)configurationWithIdentifier:(id)a3 previewProvider:(id)a4 actionProvider:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:a1 file:@"_UIContextMenuAsyncConfiguration.m" lineNumber:48 description:@"configurationWithIdentifier:previewProvider:actionProvider: is not available; use -init instead."];

  return 0;
}

- (void).cxx_destruct
{
}

@end