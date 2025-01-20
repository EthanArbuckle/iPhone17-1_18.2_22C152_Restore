@interface WebNodeHighlightView
- (BOOL)isFlipped;
- (WebNodeHighlightView)initWithWebNodeHighlight:(id)a3;
- (id)webNodeHighlight;
- (void)_attach:(id)a3 numLayers:(unint64_t)a4;
- (void)_layoutForNodeHighlight:(void *)a3 parent:(id)a4;
- (void)_layoutForRectsHighlight:(void *)a3 parent:(id)a4;
- (void)_removeAllLayers;
- (void)dealloc;
- (void)detachFromWebNodeHighlight;
- (void)layoutSublayers:(id)a3;
@end

@implementation WebNodeHighlightView

- (void)_removeAllLayers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  layers = self->_layers;
  uint64_t v4 = [(NSMutableArray *)layers countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(layers);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) removeFromSuperlayer];
      }
      uint64_t v5 = [(NSMutableArray *)layers countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->_layers removeAllObjects];
}

- (WebNodeHighlightView)initWithWebNodeHighlight:(id)a3
{
  uint64_t v4 = -[WebNodeHighlightView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24));
  if (v4)
  {
    v4->_webNodeHighlight = (WebNodeHighlight *)a3;
    v4->_layers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v4;
}

- (void)dealloc
{
  [(WebNodeHighlightView *)self detachFromWebNodeHighlight];
  [(WebNodeHighlightView *)self _removeAllLayers];

  v3.receiver = self;
  v3.super_class = (Class)WebNodeHighlightView;
  [(WebNodeHighlightView *)&v3 dealloc];
}

- (void)detachFromWebNodeHighlight
{
  self->_webNodeHighlight = 0;
}

- (BOOL)isFlipped
{
  return 1;
}

- (void)_attach:(id)a3 numLayers:(unint64_t)a4
{
  unint64_t v4 = a4;
  if ([(NSMutableArray *)self->_layers count] != a4
    || (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_layers, "objectAtIndex:", 0), "superlayer") != a3)
  {
    [(WebNodeHighlightView *)self _removeAllLayers];
    for (; v4; --v4)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F39C88]);
      [(NSMutableArray *)self->_layers addObject:v7];
      [a3 addSublayer:v7];
      if (v7) {
        CFRelease(v7);
      }
    }
  }
}

- (void)_layoutForNodeHighlight:(void *)a3 parent:(id)a4
{
  if (*((_DWORD *)a3 + 15))
  {
    [(WebNodeHighlightView *)self _attach:a4 numLayers:4];
    uint64_t v6 = (CAShapeLayer *)[(NSMutableArray *)self->_layers objectAtIndex:0];
    id v7 = (CAShapeLayer *)[(NSMutableArray *)self->_layers objectAtIndex:1];
    long long v8 = (CAShapeLayer *)[(NSMutableArray *)self->_layers objectAtIndex:2];
    uint64_t v9 = [(NSMutableArray *)self->_layers objectAtIndex:3];
    unsigned int v10 = *((_DWORD *)a3 + 15);
    if (!v10) {
      goto LABEL_15;
    }
    long long v11 = (_OWORD *)*((void *)a3 + 6);
    long long v12 = v11[1];
    v21[0] = *v11;
    v21[1] = v12;
    if (v10 == 1)
    {
      __break(0xC471u);
      JUMPOUT(0x1E1455E24);
    }
    long long v13 = v11[3];
    v20[0] = v11[2];
    v20[1] = v13;
    if (v10 <= 2)
    {
      __break(0xC471u);
      JUMPOUT(0x1E1455E2CLL);
    }
    long long v14 = v11[5];
    v19[0] = v11[4];
    v19[1] = v14;
    if (v10 == 3)
    {
LABEL_15:
      __break(0xC471u);
      JUMPOUT(0x1E1455E1CLL);
    }
    v15 = (CAShapeLayer *)v9;
    long long v16 = v11[7];
    v18[0] = v11[6];
    v18[1] = v16;
    WebCore::cachedCGColor();
    [(CAShapeLayer *)v6 setFillColor:cf];
    if (cf) {
      CFRelease(cf);
    }
    WebCore::cachedCGColor();
    [(CAShapeLayer *)v7 setFillColor:0];
    WebCore::cachedCGColor();
    [(CAShapeLayer *)v8 setFillColor:0];
    WebCore::cachedCGColor();
    [(CAShapeLayer *)v15 setFillColor:0];
    layerPathWithHole(v6, (const WebCore::FloatQuad *)v21, (const WebCore::FloatQuad *)v20);
    layerPathWithHole(v7, (const WebCore::FloatQuad *)v20, (const WebCore::FloatQuad *)v19);
    layerPathWithHole(v8, (const WebCore::FloatQuad *)v19, (const WebCore::FloatQuad *)v18);
    layerPath(v15, (const WebCore::FloatQuad *)v18);
  }
  else
  {
    [(WebNodeHighlightView *)self _removeAllLayers];
  }
}

- (void)_layoutForRectsHighlight:(void *)a3 parent:(id)a4
{
  uint64_t v5 = *((unsigned int *)a3 + 15);
  if (v5)
  {
    [(WebNodeHighlightView *)self _attach:a4 numLayers:v5];
    WebCore::cachedCGColor();
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = 32 * v5;
    do
    {
      unsigned int v10 = (CAShapeLayer *)[(NSMutableArray *)self->_layers objectAtIndex:v8];
      [(CAShapeLayer *)v10 setFillColor:cf];
      if (v8 >= *((unsigned int *)a3 + 15))
      {
        __break(0xC471u);
        return;
      }
      layerPath(v10, (const WebCore::FloatQuad *)(*((void *)a3 + 6) + v7));
      ++v8;
      v7 += 32;
    }
    while (v9 != v7);
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    [(WebNodeHighlightView *)self _removeAllLayers];
  }
}

- (void)layoutSublayers:(id)a3
{
  if (self->_webNodeHighlight)
  {
    WebThreadLock();
    webNodeHighlight = self->_webNodeHighlight;
    if (webNodeHighlight)
    {
      [(WebNodeHighlight *)webNodeHighlight inspectorController];
      if (*(void *)&v8[0])
      {
        uint64_t v9 = 0;
        memset(v8, 0, sizeof(v8));
        char v10 = 1;
        long long v11 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
        char v14 = 1;
        uint64_t v6 = self->_webNodeHighlight;
        if (v6) {
          [(WebNodeHighlight *)v6 inspectorController];
        }
        WebCore::InspectorController::getHighlight();
        if (v10 == 3)
        {
          [(WebNodeHighlightView *)self _layoutForRectsHighlight:v8 parent:a3];
        }
        else if (v10 == 1)
        {
          [(WebNodeHighlightView *)self _layoutForNodeHighlight:v8 parent:a3];
        }
        WebCore::InspectorOverlayHighlight::~InspectorOverlayHighlight((WebCore::InspectorOverlayHighlight *)v8, v7);
      }
    }
  }
}

- (id)webNodeHighlight
{
  return self->_webNodeHighlight;
}

@end