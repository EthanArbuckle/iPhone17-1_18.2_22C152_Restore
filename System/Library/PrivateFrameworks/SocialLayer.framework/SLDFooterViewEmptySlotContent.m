@interface SLDFooterViewEmptySlotContent
- (SLDFooterViewEmptySlotContent)initWithStyle:(id)a3 maxWidth:(double)a4 forRemote:(BOOL)a5;
@end

@implementation SLDFooterViewEmptySlotContent

- (SLDFooterViewEmptySlotContent)initWithStyle:(id)a3 maxWidth:(double)a4 forRemote:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SLDFooterViewEmptySlotContent;
  v5 = -[SLDEmptySlotContent initWithStyle:forRemote:](&v9, sel_initWithStyle_forRemote_, a3, a5, a4);
  v6 = v5;
  if (v5)
  {
    v7 = [(SLDEmptySlotContent *)v5 style];

    if (v7) {
      -[SLDEmptySlotContent setContentSize:](v6, "setContentSize:", 0.0, 40.0);
    }
  }
  return v6;
}

@end