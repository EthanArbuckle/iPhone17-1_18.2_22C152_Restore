@interface THNoteCardBodyLayer
- (BOOL)shouldForceCentered;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)interactiveLayers;
- (THNoteCardLayoutContext)layoutContext;
- (void)dealloc;
- (void)setLayoutContext:(id)a3;
- (void)sizeToFit;
@end

@implementation THNoteCardBodyLayer

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THNoteCardBodyLayer;
  [(THNoteCardBodyLayer *)&v3 dealloc];
}

- (NSArray)interactiveLayers
{
  return 0;
}

- (BOOL)shouldForceCentered
{
  return 0;
}

- (void)sizeToFit
{
  [(THNoteCardBodyLayer *)self bounds];
  -[THNoteCardBodyLayer sizeThatFits:](self, "sizeThatFits:", v3, v4);
  [(THNoteCardBodyLayer *)self frame];
  TSDRectWithOriginAndSize();

  -[THNoteCardBodyLayer setFrame:](self, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(THNoteCardBodyLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setLayoutContext:(id)a3
{
  layoutContext = self->_layoutContext;
  if (layoutContext != a3)
  {

    self->_layoutContext = (THNoteCardLayoutContext *)a3;
    [(THNoteCardBodyLayer *)self setNeedsLayout];
  }
}

- (THNoteCardLayoutContext)layoutContext
{
  return self->_layoutContext;
}

@end