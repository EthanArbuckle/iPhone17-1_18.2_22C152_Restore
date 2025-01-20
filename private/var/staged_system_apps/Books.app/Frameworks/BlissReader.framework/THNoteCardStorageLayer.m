@interface THNoteCardStorageLayer
- (CGRect)contentFrame;
- (CGRect)textFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (THNoteCardStorageLayer)init;
- (THTemporaryObjectContext)context;
- (double)p_textVerticalCenter;
- (unint64_t)numberOfLines;
- (void)dealloc;
- (void)i_performWithEachLine:(id)a3;
- (void)i_updateStorageImageWithSize:(CGSize)a3;
- (void)layoutSublayers;
- (void)setContext:(id)a3;
- (void)setFontFamily:(id)a3 textColor:(id)a4 underlineColor:(id)a5 characterSpacing:(double)a6 lineSpacingMode:(int)a7 lineSpacingAmount:(double)a8;
- (void)setFontFamily:(id)a3 textColor:(id)a4 underlineColor:(id)a5 characterSpacing:(double)a6 lineSpacingMode:(int)a7 lineSpacingAmount:(double)a8 alignment:(unsigned int)a9;
- (void)setFontSize:(double)a3;
- (void)setFontSize:(double)a3 lineSpacing:(id)a4;
- (void)setFontSize:(double)a3 lineSpacingMode:(int)a4 lineSpacingAmount:(double)a5;
- (void)setLayoutContext:(id)a3;
- (void)setStorage:(id)a3 range:(_NSRange)a4;
- (void)setText:(id)a3 context:(id)a4;
@end

@implementation THNoteCardStorageLayer

- (THNoteCardStorageLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)THNoteCardStorageLayer;
  v2 = [(THNoteCardStorageLayer *)&v5 init];
  if (v2)
  {
    v3 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v2->_imageLayer = v3;
    [(CALayer *)v3 setContentsGravity:kCAGravityResizeAspect];
    [(THNoteCardStorageLayer *)v2 addSublayer:v2->_imageLayer];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THNoteCardStorageLayer;
  [(THNoteCardBodyLayer *)&v3 dealloc];
}

- (void)setStorage:(id)a3 range:(_NSRange)a4
{
  length = (unsigned char *)a4.length;
  location = (char *)a4.location;
  if (a4.location + a4.length > (unint64_t)[a3 length])
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardStorageLayer setStorage:range:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardStorageLayer.mm") lineNumber:111 description:@"Annotation out of range for storage."];
    if ([a3 length] < length) {
      length = [a3 length];
    }
    location = (char *)((unsigned char *)[a3 length] - length);
  }

  -[THNoteCardStorageLayer setContext:](self, "setContext:", +[THTemporaryObjectContext temporaryContextForDocumentContext:](THTemporaryObjectContext, "temporaryContextForDocumentContext:", [a3 context]));
  id v8 = -[THWPStorage initTemporaryWithContext:storage:range:]([THWPStorage alloc], "initTemporaryWithContext:storage:range:", [(THNoteCardStorageLayer *)self context], a3, location, length);
  [v8 setApplyTheme:0];
  self->_storage = (TSWPStorage *)v8;
  self->_hasGraphicalAttachments = 0;
  id v9 = [(TSWPStorage *)self->_storage attachmentCount];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0;
    while ((objc_msgSend(-[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self->_storage, "attachmentAtAttachmentIndex:outCharIndex:", v11, 0), "elementKind") & 0x10000F) == 0)
    {
      if (v10 == (id)++v11) {
        goto LABEL_11;
      }
    }
    self->_hasGraphicalAttachments = 1;
  }
LABEL_11:
  self->_storageImageValid = 0;

  [(THNoteCardStorageLayer *)self setNeedsLayout];
}

- (void)setText:(id)a3 context:(id)a4
{
  id v7 = [[THWPStorage alloc] initTemporaryWithContext:a4 string:a3];
  [v7 setApplyTheme:0];
  self->_storage = (TSWPStorage *)v7;
  self->_hasGraphicalAttachments = 0;
  self->_storageImageValid = 0;

  [(THNoteCardStorageLayer *)self setNeedsLayout];
}

- (void)setFontFamily:(id)a3 textColor:(id)a4 underlineColor:(id)a5 characterSpacing:(double)a6 lineSpacingMode:(int)a7 lineSpacingAmount:(double)a8
{
}

- (void)setFontFamily:(id)a3 textColor:(id)a4 underlineColor:(id)a5 characterSpacing:(double)a6 lineSpacingMode:(int)a7 lineSpacingAmount:(double)a8 alignment:(unsigned int)a9
{
  uint64_t v9 = *(void *)&a9;
  id v15 = [objc_alloc((Class)TSWPLineSpacing) initWithMode:*(void *)&a7 amount:a8];
  [(TSWPStorage *)self->_storage setFontFamily:a3 fontSize:a4 textColor:a5 underlineColor:v15 underlineWidth:v9 lineSpacing:1 characterSpacing:0.0 alignment:0.0 stripOtherAttributes:a6];

  self->_storageImageValid = 0;

  [(THNoteCardStorageLayer *)self setNeedsLayout];
}

- (CGRect)textFrame
{
  uint64_t v12 = 0;
  v13 = (double *)&v12;
  uint64_t v14 = 0x5012000000;
  id v15 = sub_FB7DC;
  v16 = nullsub_22;
  v17 = &unk_41622E;
  CGSize size = CGRectNull.size;
  CGPoint origin = CGRectNull.origin;
  CGSize v19 = size;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_FB7EC;
  v11[3] = &unk_459720;
  v11[4] = &v12;
  [(THNoteCardStorageLayer *)self i_performWithEachLine:v11];
  double v3 = v13[6];
  double v4 = v13[7];
  double v5 = v13[8];
  double v6 = v13[9];
  _Block_object_dispose(&v12, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (unint64_t)numberOfLines
{
  return [(NSArray *)self->_lines count];
}

- (void)setLayoutContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THNoteCardStorageLayer;
  [(THNoteCardBodyLayer *)&v4 setLayoutContext:a3];
  self->_storageImageValid = 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  if (self->_storage)
  {
    -[THNoteCardStorageLayer i_updateStorageImageWithSize:](self, "i_updateStorageImageWithSize:", a3.width, a3.height);
    double height = self->_imageSize.height;
    [(THNoteCardLayoutContext *)[(THNoteCardBodyLayer *)self layoutContext] noteCardBodyHeight];
    if (height <= v6)
    {
      [(THNoteCardLayoutContext *)[(THNoteCardBodyLayer *)self layoutContext] noteCardBodyHeight];
      *(float *)&double v7 = v7;
      double height = floorf(*(float *)&v7);
    }
  }
  double v8 = width;
  double v9 = height;
  result.double height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGRect)contentFrame
{
  [(THNoteCardStorageLayer *)self layoutIfNeeded];
  imageLayer = self->_imageLayer;

  [(CALayer *)imageLayer frame];
  result.size.double height = v7;
  result.size.CGFloat width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)i_performWithEachLine:(id)a3
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  lines = self->_lines;
  id v6 = [(NSArray *)lines countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(lines);
        }
        double v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (v10)
        {
          [*(id *)(*((void *)&v30 + 1) + 8 * i) lineMetrics];
          double v12 = *((double *)&v25 + 1);
          double v11 = *(double *)&v25;
          double v14 = *((double *)&v27 + 1);
          double v13 = *(double *)&v27;
        }
        else
        {
          double v29 = 0.0;
          double v14 = 0.0;
          double v13 = 0.0;
          double v12 = 0.0;
          double v11 = 0.0;
          long long v25 = 0u;
          long long v27 = 0u;
        }
        -[THNoteCardStorageLayer convertRect:fromLayer:](self, "convertRect:fromLayer:", self->_imageLayer, v11, v12, v13, v14, v25, v27);
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        if (v10)
        {
          [v10 lineMetrics];
          double v23 = v29;
        }
        else
        {
          double v29 = 0.0;
          double v23 = 0.0;
          long long v26 = 0u;
          long long v28 = 0u;
        }
        -[THNoteCardStorageLayer convertPoint:fromLayer:](self, "convertPoint:fromLayer:", self->_imageLayer, 0.0, v23, v26, v28);
        (*((void (**)(id, double, double, double, double, double))a3 + 2))(a3, v16, v18, v20, v22, v24);
      }
      id v7 = [(NSArray *)lines countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }
}

- (void)layoutSublayers
{
  v11.receiver = self;
  v11.super_class = (Class)THNoteCardStorageLayer;
  [(THNoteCardStorageLayer *)&v11 layoutSublayers];
  if (self->_storage)
  {
    [(THNoteCardStorageLayer *)self bounds];
    -[THNoteCardStorageLayer i_updateStorageImageWithSize:](self, "i_updateStorageImageWithSize:", v3, v4);
    double v5 = 0.0;
    if (self->_centerVertically)
    {
      double height = self->_imageSize.height;
      [(THNoteCardLayoutContext *)[(THNoteCardBodyLayer *)self layoutContext] noteCardBodyHeight];
      if (height < v7)
      {
        [(THNoteCardStorageLayer *)self bounds];
        double MidY = CGRectGetMidY(v12);
        [(THNoteCardStorageLayer *)self p_textVerticalCenter];
        double v5 = MidY - v9;
      }
    }
    [(THNoteCardStorageLayer *)self bounds];
    double MinX = CGRectGetMinX(v13);
    [(THNoteCardStorageLayer *)self bounds];
    -[CALayer setFrame:](self->_imageLayer, "setFrame:", MinX, v5, CGRectGetWidth(v14), self->_imageSize.height);
  }
}

- (double)p_textVerticalCenter
{
  id v3 = [(NSArray *)self->_lines firstObject];
  double v4 = v3;
  if (v3)
  {
    [v3 lineMetrics];
    [v4 lineMetrics];
    double v5 = v16 - v15;
  }
  else
  {
    double v5 = 0.0;
  }
  id v6 = [(NSArray *)self->_lines lastObject];
  double v7 = v6;
  if (v6)
  {
    [v6 lineMetrics];
    double v8 = v16;
  }
  else
  {
    double v8 = 0.0;
  }
  [(THNoteCardLayoutContext *)[(THNoteCardBodyLayer *)self layoutContext] textScale];
  double v10 = v9;
  if (v4)
  {
    [v4 lineMetrics];
    [v4 lineMetrics];
    if (v16 > v15 + v15) {
      return self->_imageSize.height * 0.5;
    }
  }
  double v11 = (v5 + (v8 - v5) * 0.5) * v10;
  if (v7)
  {
    [v7 lineMetrics];
    [v7 lineMetrics];
    if (v14 > v13 + v13) {
      return self->_imageSize.height * 0.5;
    }
  }
  return v11;
}

- (void)setFontSize:(double)a3
{
}

- (void)setFontSize:(double)a3 lineSpacingMode:(int)a4 lineSpacingAmount:(double)a5
{
  id v7 = [objc_alloc((Class)TSWPLineSpacing) initWithMode:*(void *)&a4 amount:a5];
  [(THNoteCardStorageLayer *)self setFontSize:v7 lineSpacing:a3];
}

- (void)setFontSize:(double)a3 lineSpacing:(id)a4
{
  storage = self->_storage;
  if (storage)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_FBF18;
    v9[3] = &unk_459748;
    *(double *)&v9[5] = a3;
    v9[4] = a4;
    [(TSWPStorage *)storage modifyEachParagraphStyleWithBlock:v9];
    id v7 = self->_storage;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_FBFBC;
    v8[3] = &unk_459768;
    *(double *)&v8[4] = a3;
    [(TSWPStorage *)v7 modifyEachCharacterStyleWithBlock:v8];
    [(TSWPStorage *)self->_storage replaceListLabelTypeNumberWithBullet];
  }
}

- (void)i_updateStorageImageWithSize:(CGSize)a3
{
  double width = a3.width;
  if (!self->_storage) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3.width, a3.height) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardStorageLayer i_updateStorageImageWithSize:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardStorageLayer.mm") lineNumber:352 description:@"invalid nil value for '%s'", "_storage"];
  }
  if (!self->_storageImageValid)
  {
    TSUScreenScale();
    double v6 = v5;
    id v7 = [(TSWPStorage *)self->_storage context];
    id v8 = +[TSWPShapeStyle defaultStyleWithContext:v7];
    [v8 setValue:[TSDStroke emptyStroke] forProperty:517];
    [(THNoteCardLayoutContext *)[(THNoteCardBodyLayer *)self layoutContext] textScale];
    id v10 = [objc_alloc((Class)TSDInfoGeometry) initWithWidth:width / v9];
    double v11 = [[THNoteCardShapeInfo alloc] initWithContext:v7 geometry:v10 style:v8 wpStorage:self->_storage];
    [(THNoteCardShapeInfo *)v11 setIgnoreEquationAlignment:[(TSWPStorage *)self->_storage paragraphCount] == (char *)&dword_0 + 1];
    uint64_t v12 = 0;
    id v21 = 0;
    do
    {
      unint64_t v13 = *(void *)&byte_3448F0[v12 + 8];
      [(THNoteCardStorageLayer *)self setFontSize:1 lineSpacingMode:*(double *)&byte_3448F0[v12] lineSpacingAmount:*(double *)&byte_3448F0[v12 + 24]];
      [(THNoteCardLayoutContext *)[(THNoteCardBodyLayer *)self layoutContext] textScale];
      id v15 = +[TSDImager imageForShapeInfo:viewScale:screenScale:lines:documentRoot:](TSDImager, "imageForShapeInfo:viewScale:screenScale:lines:documentRoot:", v11, &v21, [v7 documentRoot], v14, v6);
      id v16 = [v21 count];
      uint64_t v17 = v12 + 32;
      if ((unint64_t)v16 >= v13) {
        break;
      }
      BOOL v18 = v12 == 128;
      v12 += 32;
    }
    while (!v18);
    self->_centerVertically = byte_3448F0[v17 - 16] & 1;

    self->_lines = (NSArray *)v21;
    -[CALayer setContents:](self->_imageLayer, "setContents:", [v15 CGImage]);
    [v15 size];
    self->_imageSize.double width = v19;
    self->_imageSize.double height = v20;

    self->_storageImageValid = 1;
  }
}

- (THTemporaryObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

@end