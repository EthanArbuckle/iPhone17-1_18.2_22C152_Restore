@interface SiriSharedUIStandardVisualEffectView
- (void)layoutSubviews;
@end

@implementation SiriSharedUIStandardVisualEffectView

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SiriSharedUIStandardVisualEffectView;
  [(SiriSharedUIStandardVisualEffectView *)&v4 layoutSubviews];
  backgroundView = self->_backgroundView;
  [(SiriSharedUIStandardVisualEffectView *)self bounds];
  -[UIView setFrame:](backgroundView, "setFrame:");
}

- (void).cxx_destruct
{
}

@end