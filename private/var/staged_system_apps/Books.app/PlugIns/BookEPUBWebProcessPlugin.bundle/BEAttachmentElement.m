@interface BEAttachmentElement
- (BAXObjectWrapper)objectWrapper;
- (BEAttachmentElement)initWithObjectWrapperElement:(id)a3;
- (CGRect)accessibilityFrame;
- (id)accessibilityAttributedLabel;
- (id)accessibilityAttributedValue;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)setObjectWrapper:(id)a3;
@end

@implementation BEAttachmentElement

- (BEAttachmentElement)initWithObjectWrapperElement:(id)a3
{
  id v4 = a3;
  v5 = [v4 baxBookContentElement];
  v8.receiver = self;
  v8.super_class = (Class)BEAttachmentElement;
  v6 = [(BEAttachmentElement *)&v8 initWithAccessibilityContainer:v5];

  if (v6) {
    [(BEAttachmentElement *)v6 setObjectWrapper:v4];
  }

  return v6;
}

- (id)accessibilityLabel
{
  v2 = [(BEAttachmentElement *)self objectWrapper];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityAttributedLabel
{
  v2 = [(BEAttachmentElement *)self objectWrapper];
  v3 = [v2 accessibilityAttributedValue];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(BEAttachmentElement *)self objectWrapper];
  v3 = [v2 accessibilityValue];

  return v3;
}

- (id)accessibilityAttributedValue
{
  v2 = [(BEAttachmentElement *)self objectWrapper];
  v3 = [v2 accessibilityAttributedValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(BEAttachmentElement *)self objectWrapper];
  id v3 = [v2 accessibilityTraits];

  return (unint64_t)v3;
}

- (CGRect)accessibilityFrame
{
  v2 = [(BEAttachmentElement *)self objectWrapper];
  [v2 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BAXObjectWrapper)objectWrapper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_objectWrapper);

  return (BAXObjectWrapper *)WeakRetained;
}

- (void)setObjectWrapper:(id)a3
{
}

- (void).cxx_destruct
{
}

@end