@interface WFVariableAttachment
- (BOOL)isEmphasized;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (BOOL)standalone;
- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6;
- (NSString)overrideVariableName;
- (UIColor)tintColor;
- (UIFont)font;
- (UIFont)surroundingTextFont;
- (WFSlotIdentifier)containingSlotIdentifier;
- (WFVariable)variable;
- (WFVariableAttachment)initWithVariable:(id)a3;
- (id)accessibilityLabel;
- (id)adjustedFont;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fixUpBlock;
- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5;
- (id)variableName;
- (unint64_t)currentControlState;
- (void)dealloc;
- (void)setContainingSlotIdentifier:(id)a3;
- (void)setEmphasized:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFixUpBlock:(id)a3;
- (void)setFont:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOverrideVariableName:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStandalone:(BOOL)a3;
- (void)setSurroundingTextFont:(id)a3;
- (void)setTintColor:(id)a3;
- (void)variableDidChange:(id)a3;
@end

@implementation WFVariableAttachment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containingSlotIdentifier, 0);
  objc_storeStrong((id *)&self->_overrideVariableName, 0);
  objc_storeStrong((id *)&self->_surroundingTextFont, 0);
  objc_storeStrong(&self->_fixUpBlock, 0);
  objc_storeStrong((id *)&self->_variable, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
}

- (void)setStandalone:(BOOL)a3
{
  self->_standalone = a3;
}

- (BOOL)standalone
{
  return self->_standalone;
}

- (void)setContainingSlotIdentifier:(id)a3
{
}

- (WFSlotIdentifier)containingSlotIdentifier
{
  return self->_containingSlotIdentifier;
}

- (void)setOverrideVariableName:(id)a3
{
}

- (NSString)overrideVariableName
{
  return self->_overrideVariableName;
}

- (void)setSurroundingTextFont:(id)a3
{
}

- (UIFont)surroundingTextFont
{
  return self->_surroundingTextFont;
}

- (void)setEmphasized:(BOOL)a3
{
  self->_emphasized = a3;
}

- (BOOL)isEmphasized
{
  return self->_emphasized;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setFixUpBlock:(id)a3
{
}

- (id)fixUpBlock
{
  return self->_fixUpBlock;
}

- (WFVariable)variable
{
  return self->_variable;
}

- (void)setTintColor:(id)a3
{
}

- (void)setFont:(id)a3
{
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  double width = a4.size.width;
  id v9 = a3;
  v10 = [v9 layoutManager];
  v11 = [(WFVariableAttachment *)self surroundingTextFont];
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "wf_lineHeight");
    double v14 = v13 * 0.92;
  }
  else
  {
    v15 = [(WFVariableAttachment *)self adjustedFont];
    objc_msgSend(v15, "wf_lineHeight");
    double v14 = v16 * 1.06;
  }
  double v17 = v14;
  if ([v10 conformsToProtocol:&unk_26E7FF0C8])
  {
    double v17 = v14;
    if (objc_opt_respondsToSelector())
    {
      [v10 preferredHeightForDrawingTextAttachment:self atCharacterIndex:a6 withProposedHeight:v14];
      double v17 = v18;
    }
  }
  [v9 lineFragmentPadding];
  double v20 = v19;
  v21 = [(WFVariableAttachment *)self variable];
  v22 = (void *)MEMORY[0x263F879E0];
  v23 = [(WFVariableAttachment *)self variableName];
  v24 = [v21 icon];
  v25 = [(WFVariableAttachment *)self adjustedFont];
  [v22 widthForVariableViewWithName:v23 icon:v24 font:v25 height:v17];
  double v27 = v26;

  if (v12)
  {
    [v12 capHeight];
    double v29 = v28;
  }
  else
  {
    v30 = [(WFVariableAttachment *)self font];
    [v30 capHeight];
    double v29 = v31;
  }
  double v32 = v14 - v29;
  if (v27 >= width + v20 * -2.0) {
    double v33 = width + v20 * -2.0;
  }
  else {
    double v33 = v27;
  }
  double v34 = v32 * 0.5;
  BOOL v35 = v32 < 0.0;
  double v36 = 0.0;
  if (!v35) {
    double v36 = v34;
  }
  double v37 = -v36;

  double v38 = 0.0;
  double v39 = v37;
  double v40 = v33;
  double v41 = v14;
  result.size.height = v41;
  result.size.double width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__WFVariableAttachment_imageForBounds_textContainer_characterIndex___block_invoke;
  aBlock[3] = &unk_264BFD668;
  aBlock[4] = self;
  CGRect v23 = a3;
  v8 = (void (**)(void))_Block_copy(aBlock);
  id v9 = [(WFVariableAttachment *)self variable];
  v10 = [v9 icon];

  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = (void *)MEMORY[0x263F879D8];
    v12 = [(WFVariableAttachment *)self variableName];
    double v13 = [(WFVariableAttachment *)self adjustedFont];
    double v14 = [(WFVariableAttachment *)self tintColor];
    unint64_t v15 = [(WFVariableAttachment *)self currentControlState];
    double v16 = [(WFVariableAttachment *)self variable];
    uint64_t v17 = [v16 isAvailable];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __68__WFVariableAttachment_imageForBounds_textContainer_characterIndex___block_invoke_2;
    v21[3] = &unk_264BFD690;
    v21[4] = self;
    objc_msgSend(v11, "drawVariableForAppIconNamed:icon:font:tint:size:state:isAvailable:completion:", v12, v10, v13, v14, v15, v17, width, height, v21);

    double v18 = [(WFVariableAttachment *)self image];

    if (v18) {
      [(WFVariableAttachment *)self image];
    }
    else {
    double v19 = v8[2](v8);
    }
  }
  else
  {

    double v19 = v8[2](v8);
  }

  return v19;
}

id __68__WFVariableAttachment_imageForBounds_textContainer_characterIndex___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F879D8];
  v3 = [*(id *)(a1 + 32) variableName];
  v4 = [*(id *)(a1 + 32) variable];
  v5 = [v4 icon];
  v6 = [*(id *)(a1 + 32) adjustedFont];
  v7 = [*(id *)(a1 + 32) tintColor];
  uint64_t v8 = [*(id *)(a1 + 32) currentControlState];
  id v9 = [*(id *)(a1 + 32) variable];
  v10 = objc_msgSend(v2, "drawVariableNamed:icon:font:tint:size:state:isAvailable:", v3, v5, v6, v7, v8, objc_msgSend(v9, "isAvailable"), *(double *)(a1 + 56), *(double *)(a1 + 64));

  return v10;
}

void __68__WFVariableAttachment_imageForBounds_textContainer_characterIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [*(id *)(a1 + 32) image];

  v4 = v7;
  if (v3 != v7)
  {
    [*(id *)(a1 + 32) setImage:v7];
    v5 = [*(id *)(a1 + 32) fixUpBlock];

    v4 = v7;
    if (v5)
    {
      v6 = [*(id *)(a1 + 32) fixUpBlock];
      v6[2]();

      v4 = v7;
    }
  }
}

- (unint64_t)currentControlState
{
  v2 = self;
  if ([(WFVariableAttachment *)v2 isEnabled])
  {
    if ([(WFVariableAttachment *)v2 isSelected])
    {
      unint64_t v3 = 2;
    }
    else if ([(WFVariableAttachment *)v2 isHighlighted])
    {
      unint64_t v3 = 1;
    }
    else if ([(WFVariableAttachment *)v2 isEmphasized])
    {
      unint64_t v3 = 4;
    }
    else
    {
      unint64_t v3 = 0;
    }
  }
  else
  {
    unint64_t v3 = 3;
  }

  return v3;
}

- (UIColor)tintColor
{
  tintColor = self->_tintColor;
  if (!tintColor)
  {
    v4 = [MEMORY[0x263F825C8] systemBlueColor];
    v5 = self->_tintColor;
    self->_tintColor = v4;

    tintColor = self->_tintColor;
  }
  return tintColor;
}

- (id)adjustedFont
{
  BOOL v3 = [(WFVariableAttachment *)self standalone];
  v4 = [(WFVariableAttachment *)self font];
  if (!v3)
  {
    v5 = [(WFVariableAttachment *)self font];
    [v5 pointSize];
    uint64_t v7 = [v4 fontWithSize:v6 * 0.9];

    v4 = (void *)v7;
  }
  return v4;
}

- (UIFont)font
{
  font = self->_font;
  if (!font)
  {
    WFSmallVariableTitleFont();
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    v5 = self->_font;
    self->_font = v4;

    font = self->_font;
  }
  return font;
}

- (id)variableName
{
  BOOL v3 = [(WFVariableAttachment *)self overrideVariableName];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    double v6 = [(WFVariableAttachment *)self variable];
    uint64_t v7 = [v6 propertyName];
    uint64_t v8 = v7;
    if (v7)
    {
      id v5 = v7;
    }
    else
    {
      id v9 = [(WFVariableAttachment *)self variable];
      id v5 = [v9 name];
    }
  }

  return v5;
}

- (id)accessibilityLabel
{
  v2 = [(WFVariableAttachment *)self variable];
  BOOL v3 = [v2 nameIncludingPropertyName];

  return v3;
}

- (void)variableDidChange:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(WFVariableAttachment *)self variable];
  double v6 = (void *)[v4 initWithVariable:v5];

  objc_msgSend(v6, "setEnabled:", -[WFVariableAttachment isEnabled](self, "isEnabled"));
  objc_msgSend(v6, "setSelected:", -[WFVariableAttachment isSelected](self, "isSelected"));
  objc_msgSend(v6, "setHighlighted:", -[WFVariableAttachment isHighlighted](self, "isHighlighted"));
  uint64_t v7 = [(WFVariableAttachment *)self font];
  [v6 setFont:v7];

  uint64_t v8 = [(WFVariableAttachment *)self surroundingTextFont];
  [v6 setSurroundingTextFont:v8];

  id v9 = [(WFVariableAttachment *)self tintColor];
  [v6 setTintColor:v9];

  v10 = [(WFVariableAttachment *)self overrideVariableName];
  [v6 setOverrideVariableName:v10];

  v11 = [(WFVariableAttachment *)self containingSlotIdentifier];
  [v6 setContainingSlotIdentifier:v11];

  objc_msgSend(v6, "setStandalone:", -[WFVariableAttachment standalone](self, "standalone"));
  return v6;
}

- (id)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFVariableAttachment;
  v4 = [(WFVariableAttachment *)&v8 description];
  id v5 = [(WFVariableAttachment *)self variable];
  double v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (void)dealloc
{
  [(WFVariable *)self->_variable removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)WFVariableAttachment;
  [(WFVariableAttachment *)&v3 dealloc];
}

- (WFVariableAttachment)initWithVariable:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFVariableAttachment.m", 26, @"Invalid parameter not satisfying: %@", @"variable" object file lineNumber description];
  }
  uint64_t v7 = objc_opt_new();
  objc_super v8 = [(WFVariableAttachment *)self initWithData:v7 ofType:0];

  if (v8)
  {
    objc_storeStrong((id *)&v8->_variable, a3);
    v8->_enabled = 1;
    v8->_standalone = 0;
    [v6 addDelegate:v8];
    id v9 = v8;
  }

  return v8;
}

@end