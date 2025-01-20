@interface PBContextMenuPasteButtonDrawing
+ (id)drawingWithStyle:(id)a3 tag:(id)a4 size:(int64_t)a5;
- (CGSize)drawingSize;
- (PBContextMenuPasteButtonDrawing)initWithTitleDrawing:(id)a3 titleOffset:(CGPoint)a4 glyph:(id)a5 glyphOffset:(CGPoint)a6 size:(CGSize)a7;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation PBContextMenuPasteButtonDrawing

+ (id)drawingWithStyle:(id)a3 tag:(id)a4 size:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = (Class *)&off_1000308B8;
  v10 = off_1000308B0;
  if (a5 != 1) {
    v10 = off_1000308A8;
  }
  if (a5) {
    v9 = (Class *)v10;
  }
  id v11 = [objc_alloc(*v9) initWithStyle:v7 tag:v8];

  return v11;
}

- (PBContextMenuPasteButtonDrawing)initWithTitleDrawing:(id)a3 titleOffset:(CGPoint)a4 glyph:(id)a5 glyphOffset:(CGPoint)a6 size:(CGSize)a7
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v12 = a4.y;
  CGFloat v13 = a4.x;
  id v16 = a3;
  id v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PBContextMenuPasteButtonDrawing;
  v18 = [(PBContextMenuPasteButtonDrawing *)&v21 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_titleDrawing, a3);
    v19->_titleOffset.CGFloat x = v13;
    v19->_titleOffset.CGFloat y = v12;
    objc_storeStrong((id *)&v19->_glyph, a5);
    v19->_glyphOffset.CGFloat x = x;
    v19->_glyphOffset.CGFloat y = y;
    v19->_size.CGFloat width = width;
    v19->_size.CGFloat height = height;
  }

  return v19;
}

- (void)dealloc
{
  titleDrawing = self->_titleDrawing;
  self->_titleDrawing = 0;

  CTFontRemoveFromCaches();
  CGFontCacheGetLocalCache();
  CGFontCacheReset();
  v4.receiver = self;
  v4.super_class = (Class)PBContextMenuPasteButtonDrawing;
  [(PBContextMenuPasteButtonDrawing *)&v4 dealloc];
}

- (CGSize)drawingSize
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  CGContextSaveGState(a3);
  -[UISTextParagraphDrawing drawInContext:atPoint:](self->_titleDrawing, "drawInContext:atPoint:", a3, x + self->_titleOffset.x, y + self->_titleOffset.y);
  CGContextRestoreGState(a3);
  CGContextSaveGState(a3);
  -[UISVectorGlyphDrawing drawInContext:atPoint:](self->_glyph, "drawInContext:atPoint:", a3, x + self->_glyphOffset.x, y + self->_glyphOffset.y);
  CGContextRestoreGState(a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_titleDrawing, 0);
}

@end