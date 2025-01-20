@interface UIKBRenderFactory_Composite
- (BOOL)isTallPopup;
- (CGPoint)popupSymbolTextOffset;
- (CGPoint)variantAnnotationTextOffset;
- (CGPoint)variantSymbolTextOffset;
- (Class)_overlayFactoryClass;
- (UIEdgeInsets)variantPaddedFrameInsets;
- (UIEdgeInsets)variantSymbolFrameInsets;
- (UIEdgeInsets)wideShadowPaddleInsets;
- (UIEdgeInsets)wideShadowPopupMenuInsets;
- (UIKBRenderFactory_Composite)initWithRenderingContext:(id)a3 skipLayoutSegments:(BOOL)a4;
- (double)popupFontSize;
@end

@implementation UIKBRenderFactory_Composite

- (Class)_overlayFactoryClass
{
  return 0;
}

- (UIKBRenderFactory_Composite)initWithRenderingContext:(id)a3 skipLayoutSegments:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIKBRenderFactory_Composite;
  v7 = [(UIKBRenderFactory *)&v12 initWithRenderingContext:v6 skipLayoutSegments:v4];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = objc_msgSend(objc_alloc(-[UIKBRenderFactory_Composite _overlayFactoryClass](v7, "_overlayFactoryClass")), "initWithRenderingContext:skipLayoutSegments:", v6, v4);
    overlayFactory = v8->_overlayFactory;
    v8->_overlayFactory = (UIKBRenderFactory *)v9;
  }
  return v8;
}

- (UIEdgeInsets)wideShadowPaddleInsets
{
  IMP MethodImplementation = class_getMethodImplementation([(UIKBRenderFactory_Composite *)self _overlayFactoryClass], a2);
  overlayFactory = self->_overlayFactory;
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(overlayFactory, a2);
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (UIEdgeInsets)wideShadowPopupMenuInsets
{
  IMP MethodImplementation = class_getMethodImplementation([(UIKBRenderFactory_Composite *)self _overlayFactoryClass], a2);
  overlayFactory = self->_overlayFactory;
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(overlayFactory, a2);
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (UIEdgeInsets)variantPaddedFrameInsets
{
  IMP MethodImplementation = class_getMethodImplementation([(UIKBRenderFactory_Composite *)self _overlayFactoryClass], a2);
  overlayFactory = self->_overlayFactory;
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(overlayFactory, a2);
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (UIEdgeInsets)variantSymbolFrameInsets
{
  IMP MethodImplementation = class_getMethodImplementation([(UIKBRenderFactory_Composite *)self _overlayFactoryClass], a2);
  overlayFactory = self->_overlayFactory;
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(overlayFactory, a2);
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (CGPoint)variantSymbolTextOffset
{
  IMP MethodImplementation = class_getMethodImplementation([(UIKBRenderFactory_Composite *)self _overlayFactoryClass], a2);
  overlayFactory = self->_overlayFactory;
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(overlayFactory, a2);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)variantAnnotationTextOffset
{
  IMP MethodImplementation = class_getMethodImplementation([(UIKBRenderFactory_Composite *)self _overlayFactoryClass], a2);
  overlayFactory = self->_overlayFactory;
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(overlayFactory, a2);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)popupSymbolTextOffset
{
  IMP MethodImplementation = class_getMethodImplementation([(UIKBRenderFactory_Composite *)self _overlayFactoryClass], a2);
  overlayFactory = self->_overlayFactory;
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(overlayFactory, a2);
  result.y = v7;
  result.x = v6;
  return result;
}

- (double)popupFontSize
{
  IMP MethodImplementation = class_getMethodImplementation([(UIKBRenderFactory_Composite *)self _overlayFactoryClass], a2);
  overlayFactory = self->_overlayFactory;
  ((void (*)(UIKBRenderFactory *, SEL))MethodImplementation)(overlayFactory, a2);
  return result;
}

- (BOOL)isTallPopup
{
  IMP MethodImplementation = class_getMethodImplementation([(UIKBRenderFactory_Composite *)self _overlayFactoryClass], a2);
  overlayFactory = self->_overlayFactory;
  return ((uint64_t (*)(UIKBRenderFactory *, SEL))MethodImplementation)(overlayFactory, a2);
}

- (void).cxx_destruct
{
}

@end