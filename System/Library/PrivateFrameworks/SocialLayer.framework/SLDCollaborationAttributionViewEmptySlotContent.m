@interface SLDCollaborationAttributionViewEmptySlotContent
- (SLDCollaborationAttributionViewEmptySlotContent)initWithStyle:(id)a3 variant:(int64_t)a4 maxWidth:(double)a5 placeholderGlyphConfig:(id)a6 forRemote:(BOOL)a7;
@end

@implementation SLDCollaborationAttributionViewEmptySlotContent

- (SLDCollaborationAttributionViewEmptySlotContent)initWithStyle:(id)a3 variant:(int64_t)a4 maxWidth:(double)a5 placeholderGlyphConfig:(id)a6 forRemote:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SLDCollaborationAttributionViewEmptySlotContent;
  v14 = [(SLDEmptySlotContent *)&v19 initWithStyle:v12 forRemote:v7];
  v15 = v14;
  if (v14)
  {
    v16 = [(SLDEmptySlotContent *)v14 style];

    if (v16)
    {
      v17 = [[SLCollaborationAttributionViewMetricsProvider alloc] initWithVariant:a4 slotStyle:v12 maxWidth:v13 placeholderGlyphConfig:a5];
      [(SLCollaborationAttributionViewMetricsProvider *)v17 drawingSize];
      -[SLDEmptySlotContent setContentSize:](v15, "setContentSize:");
    }
  }

  return v15;
}

@end