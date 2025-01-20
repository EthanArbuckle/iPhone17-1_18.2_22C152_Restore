@interface BKDisplayRenderOverlayAppleLogo
+ (id)overlayWithLevel:(float)a3 display:(id)a4;
- (BKDisplayRenderOverlayAppleLogo)initWithOverlayDescriptor:(id)a3 level:(float)a4;
- (id)_prepareContentLayerForPresentation:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_cleanUpContentLayer;
@end

@implementation BKDisplayRenderOverlayAppleLogo

- (void).cxx_destruct
{
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKDisplayRenderOverlayAppleLogo;
  v4 = [(BKDisplayBootUIRenderOverlay *)&v9 descriptionBuilderWithMultilinePrefix:a3];
  v5 = v4;
  puiProgressWindow = self->_puiProgressWindow;
  if (puiProgressWindow) {
    id v7 = [v4 appendObject:puiProgressWindow withName:@"puiProgressWindow"];
  }

  return v5;
}

- (void)_cleanUpContentLayer
{
  [(PUIProgressWindow *)self->_puiProgressWindow setVisible:0];
  puiProgressWindow = self->_puiProgressWindow;
  self->_puiProgressWindow = 0;
}

- (id)_prepareContentLayerForPresentation:(id)a3
{
  id v4 = objc_alloc((Class)PUIProgressWindow);
  [(BKDisplayRenderOverlay *)self level];
  v5 = (PUIProgressWindow *)[v4 initWithProgressBarVisibility:0 createContext:0 contextLevel:0 appearance:0];
  puiProgressWindow = self->_puiProgressWindow;
  self->_puiProgressWindow = v5;

  [(PUIProgressWindow *)self->_puiProgressWindow setVisible:1];
  id v7 = [(PUIProgressWindow *)self->_puiProgressWindow layer];
  [v7 setDisableUpdateMask:[v7 disableUpdateMask] | 0x10];
  v8 = [(BKDisplayRenderOverlay *)self display];
  objc_super v9 = [v8 uniqueId];

  sub_1000399F0(v9);

  return v7;
}

- (BKDisplayRenderOverlayAppleLogo)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BKDisplayRenderOverlayAppleLogo;
  id v4 = -[BKDisplayBootUIRenderOverlay initWithOverlayDescriptor:level:](&v7, "initWithOverlayDescriptor:level:", a3);
  v5 = v4;
  if (v4) {
    [(BKDisplayRenderOverlay *)v4 _setType:3];
  }
  return v5;
}

+ (id)overlayWithLevel:(float)a3 display:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)BKSDisplayRenderOverlayDescriptor);
  objc_super v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  id v9 = [v6 initWithName:v8 display:v5];

  [v9 setLockBacklight:0];
  v10 = [BKDisplayRenderOverlayAppleLogo alloc];
  *(float *)&double v11 = a3;
  v12 = [(BKDisplayRenderOverlayAppleLogo *)v10 initWithOverlayDescriptor:v9 level:v11];

  return v12;
}

@end