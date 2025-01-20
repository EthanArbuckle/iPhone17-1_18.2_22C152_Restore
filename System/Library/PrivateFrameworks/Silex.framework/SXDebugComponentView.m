@interface SXDebugComponentView
- (SXDebugComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 invalidator:(id)a7;
- (SXLayoutInvalidator)invalidator;
- (void)loadComponent:(id)a3;
- (void)presentComponentWithChanges:(id)a3;
@end

@implementation SXDebugComponentView

- (SXDebugComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 invalidator:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SXDebugComponentView;
  v14 = [(SXComponentView *)&v17 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_invalidator, a7);
  }

  return v15;
}

- (void)loadComponent:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SXDebugComponentView;
  [(SXComponentView *)&v9 loadComponent:a3];
  v4 = [MEMORY[0x263F1C550] redColor];
  [(SXDebugComponentView *)self setBackgroundColor:v4];

  id v5 = [MEMORY[0x263F1C550] blackColor];
  uint64_t v6 = [v5 CGColor];
  v7 = [(SXDebugComponentView *)self layer];
  [v7 setBorderColor:v6];

  v8 = [(SXDebugComponentView *)self layer];
  [v8 setBorderWidth:1.0];
}

- (void)presentComponentWithChanges:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SXDebugComponentView;
  [(SXComponentView *)&v7 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  uint32_t v4 = arc4random_uniform(0xAu);
  dispatch_time_t v5 = dispatch_time(0, 1000000000 * v4);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SXDebugComponentView_presentComponentWithChanges___block_invoke;
  block[3] = &unk_2646511F8;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x263EF83A0], block);
}

void __52__SXDebugComponentView_presentComponentWithChanges___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) invalidator];
  v2 = [*(id *)(a1 + 32) component];
  id v3 = (id)objc_msgSend(v4, "invalidateComponent:suggestedSize:", v2, 0.0, 300.0);
}

- (SXLayoutInvalidator)invalidator
{
  return self->_invalidator;
}

- (void).cxx_destruct
{
}

@end