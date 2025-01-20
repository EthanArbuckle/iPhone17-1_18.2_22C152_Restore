@interface SUSubtitledButtonContent
- (NSString)subtitle;
- (UIColor)subtitleColor;
- (UIColor)subtitleShadowColor;
- (void)dealloc;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleColor:(id)a3;
- (void)setSubtitleShadowColor:(id)a3;
@end

@implementation SUSubtitledButtonContent

- (void)dealloc
{
  self->_subtitle = 0;
  self->_subtitleColor = 0;

  self->_subtitleShadowColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUSubtitledButtonContent;
  [(SUSubtitledButtonContent *)&v3 dealloc];
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (void)setSubtitleColor:(id)a3
{
}

- (UIColor)subtitleShadowColor
{
  return self->_subtitleShadowColor;
}

- (void)setSubtitleShadowColor:(id)a3
{
}

@end