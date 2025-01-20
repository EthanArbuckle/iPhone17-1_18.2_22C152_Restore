@interface MRMarimbaLayoutManager
- (CGPoint)shadowOffset;
- (CGRect)currentRectForEditedText;
- (MPText)text;
- (MRMarimbaLayer)marimbaLayer;
- (MRMarimbaLayoutManager)init;
- (id)_renderer;
- (id)textRenderer;
- (int64_t)lineCount;
- (void)dealloc;
- (void)setMarimbaLayer:(id)a3;
- (void)setText:(id)a3;
- (void)updateWithString:(id)a3;
@end

@implementation MRMarimbaLayoutManager

- (MRMarimbaLayoutManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)MRMarimbaLayoutManager;
  v2 = [(MRMarimbaLayoutManager *)&v4 init];
  if (v2) {
    v2->_textRenderer = objc_alloc_init(MRTextRenderer);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MRMarimbaLayoutManager;
  [(MRMarimbaLayoutManager *)&v3 dealloc];
}

- (id)textRenderer
{
  return self->_textRenderer;
}

- (int64_t)lineCount
{
  return [(MRTextRenderer *)self->_textRenderer numberOfLines];
}

- (void)updateWithString:(id)a3
{
  marimbaLayer = self->_marimbaLayer;
  if (marimbaLayer)
  {
    [(MRMarimbaLayer *)marimbaLayer bounds];
    -[MRTextRenderer setResolution:](self->_textRenderer, "setResolution:", v6, v7);
  }
  [(MRTextRenderer *)self->_textRenderer setTruncate:0];
  id v8 = objc_msgSend(-[MRMarimbaLayoutManager _renderer](self, "_renderer"), "_maxLinesForCurrentEditingTextElement");
  if (v8) {
    uint64_t v9 = (uint64_t)(double)(uint64_t)v8;
  }
  else {
    uint64_t v9 = 100000;
  }
  [(MRTextRenderer *)self->_textRenderer setMaxNumberOfLines:v9];
  objc_msgSend(-[MRMarimbaLayoutManager _renderer](self, "_renderer"), "_maxSizeForCurrentEditingTextElement");
  -[MRTextRenderer setDefinedSize:](self->_textRenderer, "setDefinedSize:");
  textRenderer = self->_textRenderer;
  [(MRTextRenderer *)textRenderer setText:a3];
}

- (id)_renderer
{
  return [(MRMarimbaLayer *)self->_marimbaLayer renderer];
}

- (CGRect)currentRectForEditedText
{
  objc_msgSend(-[MRMarimbaLayoutManager _renderer](self, "_renderer"), "requestRendering:", 1);
  long long v24 = 0u;
  *(_OWORD *)v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  objc_msgSend(-[MRMarimbaLayoutManager _renderer](self, "_renderer"), "getVerticesCoordinatesForCurrentlyEditedTextElement:", &v22);
  long long v3 = v22;
  long long v4 = v23;
  long long v5 = *(_OWORD *)v25;
  if (*(double *)&v23 >= *(double *)&v24) {
    double v6 = *(double *)&v23;
  }
  else {
    double v6 = *(double *)&v24;
  }
  if (*(double *)&v22 >= v25[0]) {
    double v7 = v25[0];
  }
  else {
    double v7 = *(double *)&v22;
  }
  if (*((double *)&v24 + 1) >= v25[1]) {
    double v8 = *((double *)&v24 + 1);
  }
  else {
    double v8 = v25[1];
  }
  if (*((double *)&v22 + 1) >= *((double *)&v23 + 1)) {
    double v9 = *((double *)&v23 + 1);
  }
  else {
    double v9 = *((double *)&v22 + 1);
  }
  [(MRMarimbaLayoutManager *)self shadowOffset];
  if (v10 < 0.0) {
    double v10 = -v10;
  }
  float v12 = *(double *)&v4 - *(double *)&v3;
  float v13 = *((double *)&v4 + 1) - *((double *)&v3 + 1);
  double v14 = sqrt((float)((float)(v12 * v12) + (float)(v13 * v13)));
  float v15 = *(double *)&v5 - *(double *)&v3;
  float v16 = *((double *)&v5 + 1) - *((double *)&v3 + 1);
  double v17 = sqrt((float)((float)(v15 * v15) + (float)(v16 * v16)));
  double v18 = v7 + (v21 - v7 - v14) * 0.5 + v10;
  double v19 = v9 + (v20 - v9 - v17) * 0.5 - v11;
  result.size.height = v17;
  result.size.width = v14;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGPoint)shadowOffset
{
  [(MRTextRenderer *)self->_textRenderer shadowOffset];
  result.y = v3;
  result.x = v2;
  return result;
}

- (MRMarimbaLayer)marimbaLayer
{
  return self->_marimbaLayer;
}

- (void)setMarimbaLayer:(id)a3
{
}

- (MPText)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

@end