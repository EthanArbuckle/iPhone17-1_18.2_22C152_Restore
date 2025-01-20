@interface PrefsUILinkLabel
- (NSURL)URL;
- (PrefsUILinkLabel)initWithFrame:(CGRect)a3;
- (SEL)action;
- (id)color:(id)a3 byMultiplyingSubComponentsBy:(float)a4;
- (id)target;
- (void)openURL:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setTarget:(id)a3;
- (void)setURL:(id)a3;
- (void)tappedLink:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PrefsUILinkLabel

- (PrefsUILinkLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PrefsUILinkLabel;
  v3 = -[PrefsUILinkLabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v3 action:sel_tappedLink_];
    [(PrefsUILinkLabel *)v3 addGestureRecognizer:v4];
    [(PrefsUILinkLabel *)v3 setDrawsUnderline:1];
    [(PrefsUILinkLabel *)v3 setTarget:v3];
    [(PrefsUILinkLabel *)v3 setAction:sel_openURL_];
  }
  return v3;
}

- (void)setAction:(SEL)a3
{
  p_action = &self->_action;
  if (self->_action != a3)
  {
    if (a3)
    {
      SEL *p_action = a3;
      id WeakRetained = objc_loadWeakRetained(&self->_target);
      [(PrefsUILinkLabel *)self setUserInteractionEnabled:WeakRetained != 0];
    }
    else
    {
      SEL *p_action = 0;
      [(PrefsUILinkLabel *)self setUserInteractionEnabled:0];
    }
  }
}

- (void)setTarget:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&self->_target, obj);
    if (self->_action)
    {
      id v7 = objc_loadWeakRetained(&self->_target);
      [(PrefsUILinkLabel *)self setUserInteractionEnabled:v7 != 0];
    }
    else
    {
      uint64_t v5 = [(PrefsUILinkLabel *)self setUserInteractionEnabled:0];
    }
    id v6 = obj;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)openURL:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [(PrefsUILinkLabel *)self URL];
  [v5 openURL:v4 options:MEMORY[0x1E4F1CC08] completionHandler:0];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if ([(PrefsUILinkLabel *)self action])
  {
    self->_touchingURL = 1;
    [(PrefsUILinkLabel *)self setHighlighted:1];
    [(PrefsUILinkLabel *)self setNeedsDisplay];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = [a3 anyObject];
  uint64_t v6 = v5;
  if (v5)
  {
    v17 = (void *)v5;
    [(PrefsUILinkLabel *)self bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v17 locationInView:self];
    v19.x = v15;
    v19.y = v16;
    v20.origin.x = v8;
    v20.origin.y = v10;
    v20.size.width = v12;
    v20.size.height = v14;
    uint64_t v5 = CGRectContainsPoint(v20, v19);
    uint64_t v6 = (uint64_t)v17;
    if ((v5 & 1) == 0)
    {
      if (self->_touchingURL)
      {
        uint64_t v5 = [(PrefsUILinkLabel *)self setNeedsDisplay];
        uint64_t v6 = (uint64_t)v17;
      }
      self->_touchingURL = 0;
    }
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[PrefsUILinkLabel setHighlighted:](self, "setHighlighted:", 0, a4);
  self->_touchingURL = 0;
  [(PrefsUILinkLabel *)self setNeedsDisplay];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[PrefsUILinkLabel setHighlighted:](self, "setHighlighted:", 0, a4);
  self->_touchingURL = 0;
  [(PrefsUILinkLabel *)self setNeedsDisplay];
}

- (void)tappedLink:(id)a3
{
  if ([(PrefsUILinkLabel *)self action])
  {
    self->_touchingURL = 0;
    [(PrefsUILinkLabel *)self setHighlighted:0];
    [(PrefsUILinkLabel *)self setNeedsDisplay];
    [(PrefsUILinkLabel *)self action];
    id v5 = [(PrefsUILinkLabel *)self target];
    id v4 = (id)SFPerformSelector();
  }
}

- (id)color:(id)a3 byMultiplyingSubComponentsBy:(float)a4
{
  id v5 = a3;
  double v10 = 0.0;
  double v11 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  uint64_t v6 = v5;
  if ([v5 getRed:&v11 green:&v10 blue:&v9 alpha:&v8])
  {
    uint64_t v6 = [MEMORY[0x1E4F428B8] colorWithRed:v11 * a4 green:v10 * a4 blue:v9 * a4 alpha:v8];
  }
  return v6;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end