@interface THNotesAnnotationLayer
- (CGSize)sizeThatFits:(CGSize)result;
- (THNotesAnnotationLayer)initWithAnnotation:(id)a3 maxLines:(unint64_t)a4 showHighlight:(BOOL)a5;
- (double)p_verticalImageViewOffset;
- (id)annotation;
- (void)dealloc;
- (void)i_updateStorageImageWithSize:(CGSize)a3;
- (void)layoutSublayers;
@end

@implementation THNotesAnnotationLayer

- (THNotesAnnotationLayer)initWithAnnotation:(id)a3 maxLines:(unint64_t)a4 showHighlight:(BOOL)a5
{
  BOOL v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)THNotesAnnotationLayer;
  v8 = [(THNoteCardStorageLayer *)&v11 init];
  if (v8)
  {
    if (v5)
    {
      v9 = (AEHighlight *)objc_alloc_init((Class)AEHighlight);
      v8->_highlight = v9;
      [(AEHighlight *)v9 setAnnotation:a3];
      v8->_renderingController = (AEHighlightRenderingController *)objc_alloc_init((Class)AEHighlightRenderingController);
    }
    v8->_annotation = (THAnnotation *)a3;
    v8->_maxLines = a4;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THNotesAnnotationLayer;
  [(THNoteCardStorageLayer *)&v3 dealloc];
}

- (id)annotation
{
  return self->_annotation;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (self->super._storage)
  {
    -[THNotesAnnotationLayer i_updateStorageImageWithSize:](self, "i_updateStorageImageWithSize:", result.width, result.height);
    return self->super._imageSize;
  }
  return result;
}

- (void)layoutSublayers
{
  v18.receiver = self;
  v18.super_class = (Class)THNotesAnnotationLayer;
  [(THNoteCardStorageLayer *)&v18 layoutSublayers];
  if (self->_highlight)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    id v3 = +[NSMutableArray array];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_130980;
    v16[3] = &unk_459D10;
    v16[5] = v3;
    v16[6] = v17;
    v16[4] = self;
    [(THNoteCardStorageLayer *)self i_performWithEachLine:v16];
    [(AEHighlight *)self->_highlight setLines:v3];
    [self->_renderingController.highlightLayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    id v4 = [(AEHighlightRenderingController *)self->_renderingController highlightWithData:[(AEHighlight *)self->_highlight annotation]];
    highlight = self->_highlight;
    if (v4) {
      [(AEHighlightRenderingController *)self->_renderingController updatedHighlight:highlight];
    }
    else {
      [(AEHighlightRenderingController *)self->_renderingController addHighlight:highlight forData:[(AEHighlight *)highlight annotation]];
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(AEHighlightRenderingController *)self->_renderingController highlightLayers];
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v19 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          LODWORD(v8) = 1.0;
          [v11 setOpacity:v8];
          [(THNotesAnnotationLayer *)self insertSublayer:v11 atIndex:0];
        }
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v19 count:16];
      }
      while (v7);
    }
    _Block_object_dispose(v17, 8);
  }
}

- (double)p_verticalImageViewOffset
{
  return 0.0;
}

- (void)i_updateStorageImageWithSize:(CGSize)a3
{
  double width = a3.width;
  if (!self->super._storage) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesAnnotationLayer i_updateStorageImageWithSize:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesAnnotationLayer.mm") lineNumber:140 description:@"invalid nil value for '%s'", "_storage"];
  }
  if (!self->super._storageImageValid)
  {
    id v14 = 0;
    BOOL v5 = (char *)[(TSWPStorage *)self->super._storage characterCount];
    v13[0] = 0;
    v13[1] = v5 - 1;
    id v6 = [(TSWPStorage *)self->super._storage valueForProperty:18 atCharIndex:0 effectiveRange:v13];
    if (!v6) {
      id v6 = +[TSUColor blackColor];
    }
    [self setFontFamily:[TSUFont systemFontOfSize:15.0] textColor:v6 underlineColor:0 characterSpacing:4 lineSpacingMode:3.0 lineSpacingAmount:0.0];
    [(THNoteCardStorageLayer *)self setFontSize:15.0];
    storage = self->super._storage;
    unint64_t maxLines = self->_maxLines;
    [(THNotesAnnotationLayer *)self contentsScale];
    id v10 = [TSDImager imageForStorage:storage maxWidth:&v14 lines:0 layoutRect:0 useCullingRect:0 maxLines:maxLines allowsLastLineTruncation:1 contentsScale:width documentRoot:[self super._storage context] documentRoot];

    self->super._lines = (NSArray *)v14;
    -[CALayer setContents:](self->super._imageLayer, "setContents:", [v10 CGImage]);
    [v10 size];
    self->super._imageSize.double width = v11;
    self->super._imageSize.height = v12;
    self->super._storageImageValid = 1;
  }
}

@end