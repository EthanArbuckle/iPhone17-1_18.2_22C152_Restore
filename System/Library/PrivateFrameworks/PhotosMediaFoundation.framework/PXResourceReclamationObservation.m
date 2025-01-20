@interface PXResourceReclamationObservation
+ (id)new;
- (PXAVResourceReclamationController)controller;
- (PXResourceReclamationObservation)init;
- (PXResourceReclamationObservation)initWithController:(id)a3 weakTarget:(id)a4 selector:(SEL)a5;
- (void)resourceReclamationEventDidOccur:(id)a3;
@end

@implementation PXResourceReclamationObservation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_destroyWeak(&self->_target);
  objc_storeStrong(&self->_eventHandler, 0);
}

- (PXAVResourceReclamationController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  return (PXAVResourceReclamationController *)WeakRetained;
}

- (void)resourceReclamationEventDidOccur:(id)a3
{
  p_target = &self->_target;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(p_target);
  if (self->_selector) {
    SEL selector = self->_selector;
  }
  else {
    SEL selector = 0;
  }
  id v8 = WeakRetained;
  [WeakRetained performSelector:selector withObject:v5];
}

- (PXResourceReclamationObservation)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXResourceReclamationObservation.m", 35, @"%s is not available as initializer", "-[PXResourceReclamationObservation init]");

  abort();
}

- (PXResourceReclamationObservation)initWithController:(id)a3 weakTarget:(id)a4 selector:(SEL)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXResourceReclamationObservation;
  v10 = [(PXResourceReclamationObservation *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_controller, v8);
    objc_storeWeak(&v11->_target, v9);
    if (a5) {
      SEL v12 = a5;
    }
    else {
      SEL v12 = 0;
    }
    v11->_SEL selector = v12;
    [v8 registerObserver:v11];
  }

  return v11;
}

+ (id)new
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXResourceReclamationObservation.m", 39, @"%s is not available as initializer", "+[PXResourceReclamationObservation new]");

  abort();
}

@end