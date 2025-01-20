@interface _TVZoomableTextView
- (CGSize)cachedSizeThatFits;
- (CGSize)previousTargetSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (IKViewElement)viewElement;
- (_TVZoomableTextView)initWithFrame:(CGRect)a3;
- (void)_clearCachedValues;
- (void)dealloc;
- (void)setCachedSizeThatFits:(CGSize)a3;
- (void)setPreviousTargetSize:(CGSize)a3;
- (void)setViewElement:(id)a3;
- (void)updateWithViewElement:(id)a3;
@end

@implementation _TVZoomableTextView

- (_TVZoomableTextView)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  v13.receiver = self;
  v13.super_class = (Class)_TVZoomableTextView;
  v5 = -[TVFocusableTextView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = (_TVZoomableTextView *)v5;
  if (v5)
  {
    *((CGFloat *)v5 + 79) = width;
    *((CGFloat *)v5 + 80) = height;
    *(_OWORD *)(v5 + 648) = *MEMORY[0x263F001B0];
    objc_initWeak(&location, v5);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __37___TVZoomableTextView_initWithFrame___block_invoke;
    v10[3] = &unk_264BA7598;
    objc_copyWeak(&v11, &location);
    [(TVFocusableTextView *)v6 setSelectionHandler:v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37___TVZoomableTextView_initWithFrame___block_invoke_2;
    v8[3] = &unk_264BA7598;
    objc_copyWeak(&v9, &location);
    [(TVFocusableTextView *)v6 setPlayHandler:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_TVZoomableTextView;
  [(_TVZoomableTextView *)&v4 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double maxWidth = self->_maxWidth;
  double v5 = fmin(a3.width, maxWidth);
  if (maxWidth <= 0.0) {
    double width = a3.width;
  }
  else {
    double width = v5;
  }
  double maxHeight = self->_maxHeight;
  double v8 = fmin(a3.height, maxHeight);
  if (maxHeight <= 0.0) {
    double height = a3.height;
  }
  else {
    double height = v8;
  }
  [(_TVZoomableTextView *)self cachedSizeThatFits];
  double v11 = v10;
  double v13 = v12;
  [(_TVZoomableTextView *)self previousTargetSize];
  if (-[UIView tv_shouldReuseCachedSizeThatFits:previousTargetSize:newTargetSize:](self, "tv_shouldReuseCachedSizeThatFits:previousTargetSize:newTargetSize:", v11, v13, v14, v15, width, height))
  {
    v18.receiver = self;
    v18.super_class = (Class)_TVZoomableTextView;
    -[TVFocusableTextView sizeThatFits:](&v18, sel_sizeThatFits_, width, height);
    -[_TVZoomableTextView setCachedSizeThatFits:](self, "setCachedSizeThatFits:");
    -[_TVZoomableTextView setPreviousTargetSize:](self, "setPreviousTargetSize:", width, height);
  }
  [(_TVZoomableTextView *)self cachedSizeThatFits];
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (void)updateWithViewElement:(id)a3
{
  double v5 = (IKViewElement *)a3;
  v52 = v5;
  if (self->_viewElement != v5 || (uint64_t v6 = [(IKViewElement *)v5 updateType], v7 = v52, v6))
  {
    objc_storeStrong((id *)&self->_viewElement, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v8 = [(IKViewElement *)v52 style];
      -[TVFocusableTextView setDescriptionTextAlignment:](self, "setDescriptionTextAlignment:", objc_msgSend(v8, "tv_textAlignment"));

      id v9 = [(IKViewElement *)v52 style];
      double v10 = objc_msgSend(v9, "tv_tintColor");
      double v11 = [v10 color];

      if (v11) {
        [(TVFocusableTextView *)self setMoreLabelTextColor:v11];
      }
      double v12 = v52;
      double v13 = [(IKViewElement *)v12 tv_attributedString];
      [(TVFocusableTextView *)self setDescriptionText:v13];
      double v14 = [(IKViewElement *)v12 style];
      objc_msgSend(v14, "tv_backgroundHighlightStyle");
      double v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v15) {
        double v16 = v15;
      }
      else {
        double v16 = @"show-on-highlight";
      }
      [(TVFocusableTextView *)self setAlwaysShowBackground:[(__CFString *)v16 isEqualToString:@"always"]];
      double v17 = [(IKViewElement *)v12 style];
      objc_super v18 = objc_msgSend(v17, "tv_highlightColor");
      v19 = [v18 color];

      if (v19)
      {
        v20 = [(IKViewElement *)v12 style];
        v21 = objc_msgSend(v20, "tv_color");
        v22 = [v21 color];
        [(TVFocusableTextView *)self setDescriptionTextColor:v22];

        v23 = self;
        v24 = v19;
      }
      else
      {
        v23 = self;
        v24 = 0;
      }
      [(TVFocusableTextView *)v23 setDescriptionTextHighlightColor:v24];
      v25 = [(IKViewElement *)v12 style];
      v26 = objc_msgSend(v25, "tv_backgroundHighlightColor");
      v27 = [v26 color];

      if (v27) {
        [(TVFocusableTextView *)self setHighlightBackgroundColor:v27];
      }
      v28 = [(IKViewElement *)v12 style];
      v29 = objc_msgSend(v28, "tv_backgroundColor");
      v30 = [v29 color];

      if (v30) {
        [(TVFocusableTextView *)self setBackgroundColor:v30];
      }
    }
    v31 = [(IKViewElement *)v52 style];
    -[TVFocusableTextView setMaximumNumberOfLines:](self, "setMaximumNumberOfLines:", objc_msgSend(v31, "tv_maxTextLines"));

    v32 = [(IKViewElement *)v52 style];
    objc_msgSend(v32, "tv_maxWidth");
    self->_double maxWidth = v33;

    v34 = [(IKViewElement *)v52 style];
    objc_msgSend(v34, "tv_maxHeight");
    self->_double maxHeight = v35;

    v36 = [(IKViewElement *)v52 appDocument];
    v37 = [v36 templateElement];
    uint64_t v38 = objc_msgSend(v37, "tv_elementType");

    if (v38 == 69)
    {
      uint64_t v39 = [(IKViewElement *)v52 parent];
      if (v39)
      {
        v40 = (void *)v39;
        while (objc_msgSend(v40, "tv_elementType") != 38)
        {
          uint64_t v41 = [v40 parent];

          v40 = (void *)v41;
          if (!v41) {
            goto LABEL_24;
          }
        }
        [(TVFocusableTextView *)self setMoreLabelOnNewLine:1];
      }
    }
LABEL_24:
    [(_TVZoomableTextView *)self frame];
    double v43 = v42;
    double v45 = v44;
    v46 = [(IKViewElement *)v52 style];
    objc_msgSend(v46, "tv_height");
    double v48 = v47;

    v49 = [(IKViewElement *)v52 style];
    objc_msgSend(v49, "tv_width");
    double v51 = v50;

    -[TVFocusableTextView setFrame:](self, "setFrame:", v43, v45, v51, v48);
    uint64_t v6 = [(_TVZoomableTextView *)self _clearCachedValues];
    v7 = v52;
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (void)_clearCachedValues
{
  CGSize v2 = (CGSize)*MEMORY[0x263F001B0];
  self->_cachedSizeThatFits = (CGSize)*MEMORY[0x263F001B0];
  self->_previousTargetSize = v2;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
}

- (CGSize)cachedSizeThatFits
{
  double width = self->_cachedSizeThatFits.width;
  double height = self->_cachedSizeThatFits.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedSizeThatFits:(CGSize)a3
{
  self->_cachedSizeThatFits = a3;
}

- (CGSize)previousTargetSize
{
  double width = self->_previousTargetSize.width;
  double height = self->_previousTargetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousTargetSize:(CGSize)a3
{
  self->_previousTargetSize = a3;
}

- (void).cxx_destruct
{
}

@end