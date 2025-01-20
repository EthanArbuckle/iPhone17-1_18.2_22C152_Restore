@interface TUIInputAssistantBackdropView
- (TUIInputAssistantBackdropView)initWithFrame:(CGRect)a3;
- (double)contentCornerRadius;
- (id)effectsFor:(id)a3;
- (void)_setRenderConfig:(id)a3;
- (void)layoutSubviews;
- (void)setContentCornerRadius:(double)a3;
- (void)updateVisualStyle:(id)a3;
@end

@implementation TUIInputAssistantBackdropView

- (void).cxx_destruct
{
}

- (void)updateVisualStyle:(id)a3
{
  id v4 = a3;
  v5 = [(TUIInputAssistantBackdropView *)self effectsFor:v4];
  [(UIVisualEffectView *)self->_contentView setBackgroundEffects:v5];

  id v9 = [(TUIInputAssistantBackdropView *)self layer];
  LODWORD(self) = [v4 lightKeyboard];

  if (self)
  {
    id v6 = [MEMORY[0x1E4FB1618] blackColor];
    objc_msgSend(v9, "setShadowColor:", objc_msgSend(v6, "CGColor"));

    [v9 setShadowRadius:15.0];
    LODWORD(v7) = 1045220557;
    [v9 setShadowOpacity:v7];
    objc_msgSend(v9, "setShadowOffset:", 0.0, 4.0);
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v9, "setShadowColor:", objc_msgSend(v8, "CGColor"));
  }
}

- (void)_setRenderConfig:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUIInputAssistantBackdropView;
  id v4 = a3;
  [(TUIInputAssistantBackdropView *)&v5 _setRenderConfig:v4];
  -[TUIInputAssistantBackdropView updateVisualStyle:](self, "updateVisualStyle:", v4, v5.receiver, v5.super_class);
}

- (id)effectsFor:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 animatedBackground])
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB2198]);
    objc_super v5 = [MEMORY[0x1E4FB21A8] sharedLight];
    id v6 = (void *)[v4 initWithLightSource:v5];
    v14[0] = v6;
    double v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    v14[1] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  }
  else
  {
    if ([v3 lightKeyboard])
    {
      objc_super v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:13];
      v13 = v5;
      id v9 = (void *)MEMORY[0x1E4F1C978];
      v10 = &v13;
    }
    else
    {
      objc_super v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:18];
      v12 = v5;
      id v9 = (void *)MEMORY[0x1E4F1C978];
      v10 = &v12;
    }
    id v8 = [v9 arrayWithObjects:v10 count:1];
  }

  return v8;
}

- (double)contentCornerRadius
{
  v2 = [(UIVisualEffectView *)self->_contentView layer];
  [v2 cornerRadius];
  double v4 = v3;

  return v4;
}

- (void)setContentCornerRadius:(double)a3
{
  id v7 = [(TUIInputAssistantBackdropView *)self layer];
  uint64_t v5 = *MEMORY[0x1E4F39EA8];
  [v7 setCornerCurve:*MEMORY[0x1E4F39EA8]];
  [v7 setCornerRadius:a3];
  id v6 = [(UIVisualEffectView *)self->_contentView layer];
  [v6 setCornerCurve:v5];
  [v6 setCornerRadius:a3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TUIInputAssistantBackdropView;
  [(TUIInputAssistantBackdropView *)&v3 layoutSubviews];
  [(TUIInputAssistantBackdropView *)self bounds];
  -[UIVisualEffectView setFrame:](self->_contentView, "setFrame:");
}

- (TUIInputAssistantBackdropView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)TUIInputAssistantBackdropView;
  id v7 = -[TUIInputAssistantBackdropView initWithFrame:](&v14, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1F00]), "initWithFrame:", x, y, width, height);
    contentView = v7->_contentView;
    v7->_contentView = (UIVisualEffectView *)v8;

    v10 = [(UIVisualEffectView *)v7->_contentView layer];
    [v10 setBorderWidth:1.0 / TUIScreenScaleForView(v7)];
    id v11 = [MEMORY[0x1E4FB1618] systemFillColor];
    objc_msgSend(v10, "setBorderColor:", objc_msgSend(v11, "CGColor"));

    [v10 setMasksToBounds:1];
    [(TUIInputAssistantBackdropView *)v7 addSubview:v7->_contentView];
    v12 = [(TUIInputAssistantBackdropView *)v7 _inheritedRenderConfig];
    [(TUIInputAssistantBackdropView *)v7 updateVisualStyle:v12];
    [(TUIInputAssistantBackdropView *)v7 setUserInteractionEnabled:0];
    [(TUIInputAssistantBackdropView *)v7 setAccessibilityIdentifier:@"InputAssistantBackdrop"];
  }
  return v7;
}

@end