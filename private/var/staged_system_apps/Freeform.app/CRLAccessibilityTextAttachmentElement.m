@interface CRLAccessibilityTextAttachmentElement
- (CRLAccessibilityTextAttachmentElement)initWithAccessibilityParent:(id)a3 textEquivalent:(id)a4;
- (NSString)textEquivalent;
- (id)accessibilityLabel;
- (void)setTextEquivalent:(id)a3;
@end

@implementation CRLAccessibilityTextAttachmentElement

- (CRLAccessibilityTextAttachmentElement)initWithAccessibilityParent:(id)a3 textEquivalent:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLAccessibilityTextAttachmentElement;
  v8 = [(CRLAccessibilityElement *)&v11 initWithAccessibilityParent:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_textEquivalent, a4);
  }

  return v9;
}

- (id)accessibilityLabel
{
  return [(CRLAccessibilityTextAttachmentElement *)self textEquivalent];
}

- (NSString)textEquivalent
{
  return self->_textEquivalent;
}

- (void)setTextEquivalent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end