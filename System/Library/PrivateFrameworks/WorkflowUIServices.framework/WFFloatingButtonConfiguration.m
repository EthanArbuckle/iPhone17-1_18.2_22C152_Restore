@interface WFFloatingButtonConfiguration
- (BOOL)boldTitle;
- (WFFloatingButtonConfiguration)init;
- (double)titleFontSize;
- (void)setBoldTitle:(BOOL)a3;
- (void)setTitleFontSize:(double)a3;
@end

@implementation WFFloatingButtonConfiguration

- (void)setTitleFontSize:(double)a3
{
  self->_titleFontSize = a3;
}

- (double)titleFontSize
{
  return self->_titleFontSize;
}

- (void)setBoldTitle:(BOOL)a3
{
  self->_boldTitle = a3;
}

- (BOOL)boldTitle
{
  return self->_boldTitle;
}

- (WFFloatingButtonConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFFloatingButtonConfiguration;
  v2 = [(WFFloatingViewConfiguration *)&v7 init];
  v3 = v2;
  if (v2)
  {
    -[WFFloatingViewConfiguration setShadowOffset:](v2, "setShadowOffset:", 0.0, 3.0);
    LODWORD(v4) = 1045220557;
    [(WFFloatingViewConfiguration *)v3 setShadowOpacity:v4];
    [(WFFloatingViewConfiguration *)v3 setShadowRadius:5.0];
    [(WFFloatingViewConfiguration *)v3 setCornerRadius:6.0];
    v5 = v3;
  }

  return v3;
}

@end