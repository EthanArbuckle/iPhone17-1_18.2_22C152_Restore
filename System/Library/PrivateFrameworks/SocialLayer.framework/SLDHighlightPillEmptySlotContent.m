@interface SLDHighlightPillEmptySlotContent
- (SLDHighlightPillEmptySlotContent)initWithStyle:(id)a3 variant:(unint64_t)a4 maxWidth:(double)a5 forRemote:(BOOL)a6;
- (double)maxWidth;
- (unint64_t)variant;
- (void)setMaxWidth:(double)a3;
- (void)setVariant:(unint64_t)a3;
@end

@implementation SLDHighlightPillEmptySlotContent

- (SLDHighlightPillEmptySlotContent)initWithStyle:(id)a3 variant:(unint64_t)a4 maxWidth:(double)a5 forRemote:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SLDHighlightPillEmptySlotContent;
  v11 = [(SLDEmptySlotContent *)&v17 initWithStyle:v10 forRemote:v6];
  v12 = v11;
  if (v11)
  {
    v13 = [(SLDEmptySlotContent *)v11 style];

    if (v13)
    {
      +[SLHighlightPillMetrics pillHeightWithStyle:v10 variant:a4 maxWidth:a5];
      double v15 = v14;
      [(SLDHighlightPillEmptySlotContent *)v12 setVariant:a4];
      [(SLDHighlightPillEmptySlotContent *)v12 setMaxWidth:a5];
      -[SLDEmptySlotContent setContentSize:](v12, "setContentSize:", 0.0, v15);
    }
  }

  return v12;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

@end