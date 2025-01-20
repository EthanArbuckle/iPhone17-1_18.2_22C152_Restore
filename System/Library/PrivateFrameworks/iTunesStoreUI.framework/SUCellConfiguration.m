@interface SUCellConfiguration
+ (double)minimumRowHeight;
+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4;
+ (id)copyDefaultContext;
- (BOOL)getShadowColor:(id *)a3 offset:(CGSize *)a4 forLabelAtIndex:(unint64_t)a5 withModifiers:(unint64_t)a6;
- (BOOL)isDeleteConfirmationVisible;
- (BOOL)needsDisplay;
- (CGRect)frameForImageAtIndex:(unint64_t)a3;
- (CGRect)frameForLabelAtIndex:(unint64_t)a3;
- (CGSize)layoutSize;
- (SUCellConfigurationView)view;
- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)context;
- (id)fontForLabelAtIndex:(unint64_t)a3;
- (id)imageAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4;
- (id)representedObject;
- (id)stringForLabelAtIndex:(unint64_t)a3;
- (int64_t)textAlignmentForLabelAtIndex:(unint64_t)a3;
- (unint64_t)indexOfLabelForPurchaseAnimation;
- (unint64_t)numberOfImages;
- (unint64_t)numberOfLabels;
- (void)dealloc;
- (void)setContext:(id)a3;
- (void)setIsDeleteConfirmationVisible:(BOOL)a3;
- (void)setLayoutSize:(CGSize)a3;
- (void)setNeedsDisplay:(BOOL)a3;
- (void)setRepresentedObject:(id)a3;
- (void)setView:(id)a3;
@end

@implementation SUCellConfiguration

- (void)dealloc
{
  self->_context = 0;
  self->_representedObject = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUCellConfiguration;
  [(SUCellConfiguration *)&v3 dealloc];
}

+ (id)copyDefaultContext
{
  return 0;
}

+ (double)minimumRowHeight
{
  [a1 rowHeightForContext:0 representedObject:0];
  return result;
}

+ (double)rowHeightForContext:(id)a3 representedObject:(id)a4
{
  return 45.0;
}

- (id)colorForLabelAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  return 0;
}

- (id)context
{
  return self->_context;
}

- (CGRect)frameForImageAtIndex:(unint64_t)a3
{
  [(id)objc_msgSend(MEMORY[0x263F08690] currentHandler:a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUCellConfiguration.m", 65, @"-[%@ %@] must be implemented by subclasses.", -[SUCellConfiguration superclass](self, "superclass"), NSStringFromSelector(a2)];
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)frameForLabelAtIndex:(unint64_t)a3
{
  [(id)objc_msgSend(MEMORY[0x263F08690] currentHandler:a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUCellConfiguration.m", 70, @"-[%@ %@] must be implemented by subclasses.", -[SUCellConfiguration superclass](self, "superclass"), NSStringFromSelector(a2)];
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)fontForLabelAtIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)getShadowColor:(id *)a3 offset:(CGSize *)a4 forLabelAtIndex:(unint64_t)a5 withModifiers:(unint64_t)a6
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = *(CGSize *)MEMORY[0x263F001B0];
  }
  return 0;
}

- (id)imageAtIndex:(unint64_t)a3 withModifiers:(unint64_t)a4
{
  return 0;
}

- (unint64_t)indexOfLabelForPurchaseAnimation
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (CGSize)layoutSize
{
  view = self->_view;
  if (view)
  {
    [(SUCellConfigurationView *)view bounds];
    double v4 = v3;
    double v6 = v5;
  }
  else
  {
    double v4 = *MEMORY[0x263F001B0];
    double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  result.height = v6;
  result.width = v4;
  return result;
}

- (BOOL)needsDisplay
{
  return *((unsigned char *)self + 40) & 1;
}

- (unint64_t)numberOfImages
{
  return 0;
}

- (unint64_t)numberOfLabels
{
  return 0;
}

- (BOOL)isDeleteConfirmationVisible
{
  return *((unsigned char *)self + 16) & 1;
}

- (void)setContext:(id)a3
{
  id context = self->_context;
  if (context != a3)
  {

    self->_id context = a3;
    [(SUCellConfiguration *)self setNeedsDisplay:1];
  }
}

- (void)setNeedsDisplay:(BOOL)a3
{
  *((unsigned char *)self + 40) = *((unsigned char *)self + 40) & 0xFE | a3;
}

- (void)setRepresentedObject:(id)a3
{
  id representedObject = self->_representedObject;
  if (representedObject != a3)
  {

    self->_id representedObject = a3;
    [(SUCellConfiguration *)self setNeedsDisplay:1];
  }
}

- (id)stringForLabelAtIndex:(unint64_t)a3
{
  return 0;
}

- (void)setIsDeleteConfirmationVisible:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 16);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0) {
    *((unsigned char *)self + 16) = v3 & 0xFE | a3;
  }
}

- (int64_t)textAlignmentForLabelAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (SUCellConfigurationView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  self->_view = (SUCellConfigurationView *)a3;
}

- (void)setLayoutSize:(CGSize)a3
{
  self->_layoutSize = a3;
}

@end