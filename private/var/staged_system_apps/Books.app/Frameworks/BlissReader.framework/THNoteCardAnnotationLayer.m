@interface THNoteCardAnnotationLayer
- (THAnnotation)annotation;
- (void)dealloc;
- (void)layoutSublayers;
- (void)p_setupContentLayerForHighlightLine:(id)a3;
- (void)setAnnotation:(id)a3;
@end

@implementation THNoteCardAnnotationLayer

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THNoteCardAnnotationLayer;
  [(THNoteCardStorageLayer *)&v3 dealloc];
}

- (void)layoutSublayers
{
  v13.receiver = self;
  v13.super_class = (Class)THNoteCardAnnotationLayer;
  [(THNoteCardStorageLayer *)&v13 layoutSublayers];
  [(NSMutableArray *)self->_highlightLayers makeObjectsPerformSelector:"removeFromSuperlayer"];
  [(NSMutableArray *)self->_highlightLayers removeAllObjects];
  if (!self->_highlightLayers) {
    self->_highlightLayers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_E7D24;
  v12[3] = &unk_459328;
  v12[4] = self;
  [(THNoteCardStorageLayer *)self i_performWithEachLine:v12];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  highlightLayers = self->_highlightLayers;
  id v4 = [(NSMutableArray *)highlightLayers countByEnumeratingWithState:&v8 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(highlightLayers);
        }
        [(THNoteCardAnnotationLayer *)self insertSublayer:*(void *)(*((void *)&v8 + 1) + 8 * i) atIndex:0];
      }
      id v5 = [(NSMutableArray *)highlightLayers countByEnumeratingWithState:&v8 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)p_setupContentLayerForHighlightLine:(id)a3
{
  id v4 = [(THAnnotation *)self->_annotation annotationStyle];
  id v5 = [[AEAnnotationTheme themeForAnnotationStyle:4 pageTheme:4 isUnderline:4] highlightColor].CGColor;
  [a3 currentLineRect];
  double v9 = v8;
  double v11 = v10;
  if (v4 == 6)
  {
    [a3 baseline];
    double v13 = v12;
    [a3 underlineOffset];
    double v15 = v13 + v14;
    double v16 = 2.0;
  }
  else
  {
    double v15 = v6;
    double v16 = v7;
  }
  v17 = +[CALayer layer];
  [(CALayer *)v17 setContentsGravity:kCAGravityBottom];
  [(CALayer *)v17 setHidden:0];
  -[CALayer setFrame:](v17, "setFrame:", v9, v15, v11, v16);
  LODWORD(v18) = 1.0;
  [(CALayer *)v17 setOpacity:v18];
  [(CALayer *)v17 setBackgroundColor:v5];

  [a3 setContentLayer:v17];
}

- (THAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
}

@end