@interface _UIIntelligentTextInsertionAnimatedColor
- (UIColor)resolvedColor;
- (_UIIntelligentTextInsertionAnimatedColor)initWithBounds:(CGRect)a3 invalidationHandler:(id)a4;
- (void)_drawPalette:(id)a3 boundingRect:(CGRect)a4 usingContext:(CGContext *)a5 progress:(double)a6;
- (void)drawRect:(CGRect)a3 usingContext:(CGContext *)a4 progress:(double)a5;
- (void)setResolvedColor:(id)a3;
@end

@implementation _UIIntelligentTextInsertionAnimatedColor

- (_UIIntelligentTextInsertionAnimatedColor)initWithBounds:(CGRect)a3 invalidationHandler:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_UIIntelligentTextInsertionAnimatedColor;
  v4 = -[_UIAnimatedColor initWithBounds:invalidationHandler:](&v11, sel_initWithBounds_invalidationHandler_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    uint64_t v5 = +[_UIColorPalette textAssistantReplacementSheenPalette];
    sheenPalette = v4->_sheenPalette;
    v4->_sheenPalette = (_UIColorPalette *)v5;

    uint64_t v7 = +[_UIColorPalette textAssistantReplacementBuildInPalette];
    foregroundPalette = v4->_foregroundPalette;
    v4->_foregroundPalette = (_UIColorPalette *)v7;

    v9 = +[UIColor labelColor];
    [(_UIIntelligentTextInsertionAnimatedColor *)v4 setResolvedColor:v9];
  }
  return v4;
}

- (void)setResolvedColor:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)&self->_resolvedColor, a3);
  id v5 = a3;
  v6 = [_UIColorPalette alloc];
  v11[0] = v5;
  uint64_t v7 = +[UIColor clearColor];
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v9 = [(_UIColorPalette *)v6 initWithColors:v8 locations:&unk_1ED3F1270 colorSpaceName:0];
  resolvedBackgroundPalette = self->_resolvedBackgroundPalette;
  self->_resolvedBackgroundPalette = v9;
}

- (void)_drawPalette:(id)a3 boundingRect:(CGRect)a4 usingContext:(CGContext *)a5 progress:(double)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  v10 = (CGGradient *)objc_msgSend(a3, "gradientRepresentation", a4.origin.x, a4.origin.y);
  uint64_t v12 = 0;
  double v11 = (width + width) * a6 - width;
  v14.x = width * 4.0 * a6;
  v14.y = height * 4.0 * a6;
  CGContextDrawLinearGradient(a5, v10, *(CGPoint *)(&v12 - 1), v14, 3u);
}

- (void)drawRect:(CGRect)a3 usingContext:(CGContext *)a4 progress:(double)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17[3] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = self->_resolvedBackgroundPalette;
  v16 = v12;
  v17[0] = self->_foregroundPalette;
  v17[1] = self->_sheenPalette;
  v17[2] = 0;
  if (v12)
  {
    v13 = (_UIColorPalette **)v17;
    do
    {
      -[_UIIntelligentTextInsertionAnimatedColor _drawPalette:boundingRect:usingContext:progress:](self, "_drawPalette:boundingRect:usingContext:progress:", v12, a4, x, y, width, height, a5);
      CGPoint v14 = *v13++;
      uint64_t v12 = v14;
    }
    while (v14);
  }
  for (uint64_t i = 3; i != -1; --i)
}

- (UIColor)resolvedColor
{
  return self->_resolvedColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedColor, 0);
  objc_storeStrong((id *)&self->_resolvedBackgroundPalette, 0);
  objc_storeStrong((id *)&self->_foregroundPalette, 0);
  objc_storeStrong((id *)&self->_sheenPalette, 0);
}

@end