@interface SXTextLinkAccessibilityElement
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (NSString)displayText;
- (NSURL)url;
- (SXTextLinkAccessibilityElement)initWithHyperlinkField:(id)a3 parentRep:(id)a4;
- (SXTextTangierFlowRep)parentRep;
- (_NSRange)rangeInParentRep;
- (id)description;
- (unint64_t)accessibilityTraits;
- (void)setParentRep:(id)a3;
@end

@implementation SXTextLinkAccessibilityElement

- (SXTextLinkAccessibilityElement)initWithHyperlinkField:(id)a3 parentRep:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SXTextLinkAccessibilityElement;
  v8 = [(SXTextLinkAccessibilityElement *)&v20 initWithAccessibilityContainer:v7];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_parentRep, v7);
    uint64_t v10 = [v6 range];
    v9->_rangeInParentRep.location = objc_msgSend(v7, "sxaxRepRelativeRangeFromStorageRelativeRange:", v10, v11);
    v9->_rangeInParentRep.length = v12;
    v13 = [v6 url];
    uint64_t v14 = [v13 copy];
    url = v9->_url;
    v9->_url = (NSURL *)v14;

    v16 = [v6 displayText];
    uint64_t v17 = [v16 copy];
    displayText = v9->_displayText;
    v9->_displayText = (NSString *)v17;
  }
  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF10];
}

- (CGRect)accessibilityFrame
{
  v3 = [(SXTextLinkAccessibilityElement *)self parentRep];
  uint64_t v4 = [(SXTextLinkAccessibilityElement *)self rangeInParentRep];
  objc_msgSend(v3, "_accessibilityBoundsForRange:", v4, v5);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(SXTextLinkAccessibilityElement *)self displayText];
  v12.location = [(SXTextLinkAccessibilityElement *)self rangeInParentRep];
  double v6 = NSStringFromRange(v12);
  [(SXTextLinkAccessibilityElement *)self accessibilityFrame];
  double v7 = NSStringFromCGRect(v13);
  double v8 = [(SXTextLinkAccessibilityElement *)self parentRep];
  double v9 = [v3 stringWithFormat:@"<%@ %p text=\"%@\" range=%@ frame=%@ parent=%@>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (SXTextTangierFlowRep)parentRep
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentRep);
  return (SXTextTangierFlowRep *)WeakRetained;
}

- (void)setParentRep:(id)a3
{
}

- (_NSRange)rangeInParentRep
{
  p_rangeInParentRep = &self->_rangeInParentRep;
  NSUInteger location = self->_rangeInParentRep.location;
  NSUInteger length = p_rangeInParentRep->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)displayText
{
  return self->_displayText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_parentRep);
}

@end