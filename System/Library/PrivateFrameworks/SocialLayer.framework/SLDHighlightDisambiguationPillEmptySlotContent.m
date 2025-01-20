@interface SLDHighlightDisambiguationPillEmptySlotContent
- (SLDHighlightDisambiguationPillEmptySlotContent)initWithStyle:(id)a3 variant:(unint64_t)a4 forRemote:(BOOL)a5;
@end

@implementation SLDHighlightDisambiguationPillEmptySlotContent

- (SLDHighlightDisambiguationPillEmptySlotContent)initWithStyle:(id)a3 variant:(unint64_t)a4 forRemote:(BOOL)a5
{
  v14.receiver = self;
  v14.super_class = (Class)SLDHighlightDisambiguationPillEmptySlotContent;
  v6 = [(SLDEmptySlotContent *)&v14 initWithStyle:a3 forRemote:a5];
  v7 = v6;
  if (v6)
  {
    v8 = [(SLDEmptySlotContent *)v6 style];

    if (v8)
    {
      v9 = [SLHighlightDisambiguationPillMetrics alloc];
      v10 = [(SLDEmptySlotContent *)v7 style];
      v11 = [(SLHighlightDisambiguationPillMetrics *)v9 initWithSlotStyle:v10 tag:0 variant:a4];

      [(SLHighlightDisambiguationPillMetrics *)v11 pillHeight];
      -[SLDEmptySlotContent setContentSize:](v7, "setContentSize:", 0.0, v12);
    }
  }
  return v7;
}

@end