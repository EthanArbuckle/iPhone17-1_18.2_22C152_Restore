@interface SXPlaceholderArticleThumbnailComponentView
- (SXPlaceholderArticleThumbnailComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6;
- (UILabel)label;
- (void)layoutSubviews;
- (void)loadComponent:(id)a3;
@end

@implementation SXPlaceholderArticleThumbnailComponentView

- (SXPlaceholderArticleThumbnailComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)SXPlaceholderArticleThumbnailComponentView;
  v6 = [(SXComponentView *)&v11 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6];
  if (v6)
  {
    v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    label = v6->_label;
    v6->_label = v7;

    [(UILabel *)v6->_label setNumberOfLines:0];
    [(UILabel *)v6->_label setTextAlignment:1];
    v9 = [(SXComponentView *)v6 contentView];
    [v9 addSubview:v6->_label];
  }
  return v6;
}

- (void)loadComponent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SXPlaceholderArticleThumbnailComponentView;
  id v4 = a3;
  [(SXComponentView *)&v7 loadComponent:v4];
  label = self->_label;
  v6 = objc_msgSend(v4, "identifier", v7.receiver, v7.super_class);

  [(UILabel *)label setText:v6];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SXPlaceholderArticleThumbnailComponentView;
  [(SXPlaceholderArticleThumbnailComponentView *)&v4 layoutSubviews];
  label = self->_label;
  [(SXPlaceholderArticleThumbnailComponentView *)self bounds];
  -[UILabel setFrame:](label, "setFrame:");
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
}

@end