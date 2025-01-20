@interface SLHighlightDisambiguationCell
+ (id)reuseIdentifier;
- (SLAttribution)attribution;
- (SLHighlightDisambiguationCell)initWithFrame:(CGRect)a3;
- (SLHighlightDisambiguationPillView)expandedAttributionView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setExpandedAttributionView:(id)a3;
- (void)updateWithAttribution:(id)a3;
@end

@implementation SLHighlightDisambiguationCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (SLHighlightDisambiguationCell)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SLHighlightDisambiguationCell;
  return -[SLHighlightDisambiguationCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateWithAttribution:(id)a3
{
  v5 = (SLAttribution *)a3;
  p_attribution = &self->_attribution;
  if (self->_attribution != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)p_attribution, a3);
    expandedAttributionView = self->_expandedAttributionView;
    if (expandedAttributionView) {
      [(SLHighlightDisambiguationPillView *)expandedAttributionView removeFromSuperview];
    }
    v8 = [[SLHighlightDisambiguationPillView alloc] initWithAttribution:v11];
    v9 = self->_expandedAttributionView;
    self->_expandedAttributionView = v8;

    v10 = [(SLHighlightDisambiguationCell *)self expandedAttributionView];
    [(SLHighlightDisambiguationCell *)self addSubview:v10];

    p_attribution = (SLAttribution **)[(SLHighlightDisambiguationCell *)self setNeedsLayout];
    v5 = v11;
  }
  MEMORY[0x1F41817F8](p_attribution, v5);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SLHighlightDisambiguationCell;
  [(SLHighlightDisambiguationCell *)&v3 layoutSubviews];
  [(SLHighlightDisambiguationCell *)self bounds];
  -[SLHighlightDisambiguationPillView setFrame:](self->_expandedAttributionView, "setFrame:");
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)SLHighlightDisambiguationCell;
  [(SLHighlightDisambiguationCell *)&v6 prepareForReuse];
  attribution = self->_attribution;
  self->_attribution = 0;

  expandedAttributionView = self->_expandedAttributionView;
  if (expandedAttributionView)
  {
    [(SLHighlightDisambiguationPillView *)expandedAttributionView removeFromSuperview];
    v5 = self->_expandedAttributionView;
    self->_expandedAttributionView = 0;
  }
}

- (SLAttribution)attribution
{
  return self->_attribution;
}

- (SLHighlightDisambiguationPillView)expandedAttributionView
{
  return self->_expandedAttributionView;
}

- (void)setExpandedAttributionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedAttributionView, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

@end