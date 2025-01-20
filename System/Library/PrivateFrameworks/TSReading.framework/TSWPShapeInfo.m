@interface TSWPShapeInfo
+ (void)setDefaultInstructionalText:(id)a3;
- (BOOL)allowsLastLineTruncation;
- (BOOL)autoListRecognition;
- (BOOL)autoListTermination;
- (BOOL)displaysInstructionalText;
- (BOOL)isTextUserEditable;
- (BOOL)p_hasContentForRange:(_NSRange)a3;
- (BOOL)p_hasListLabelOrContentForParagraphIndex:(unint64_t)a3;
- (BOOL)shrinkTextToFit;
- (BOOL)supportsShrinkTextToFit;
- (BOOL)supportsTextInset;
- (BOOL)textIsVertical;
- (CGAffineTransform)autosizedTransformForInfoGeometry:(SEL)a3 size:(id)a4;
- (CGPoint)autosizePositionOffset;
- (CGPoint)autosizePositionOffsetForGeometry:(id)a3 size:(CGSize)a4;
- (CGPoint)transformableObjectAnchorPoint;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (Class)styleClass;
- (NSString)instructionalText;
- (TSWPColumns)columns;
- (TSWPLineHintCollection)lineHints;
- (TSWPPadding)padding;
- (TSWPShapeInfo)initWithContext:(id)a3 geometry:(id)a4;
- (TSWPShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 pathSource:(id)a6;
- (TSWPShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 pathSource:(id)a6 wpStorage:(id)a7;
- (TSWPShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 wpStorage:(id)a6;
- (TSWPShapeStyle)tswpShapeStyle;
- (TSWPStorage)containedStorage;
- (double)pOffsetForParagraphAlignment:(CGSize)a3;
- (double)pOffsetForVerticalAlignment:(CGSize)a3;
- (id)childEnumerator;
- (id)childInfos;
- (id)commandForPasteStyleWithContext:(id)a3 pasteboardStyles:(id)a4;
- (id)commandForTransformingByTransform:(CGAffineTransform *)a3 context:(id)a4 transformedObjects:(id)a5 inBounds:(CGRect)a6;
- (id)copyWithContext:(id)a3;
- (id)presetKind;
- (id)propertyMapForNewPreset;
- (id)styleIdentifierTemplateForNewPreset;
- (id)stylesForCopyStyle;
- (id)textureDeliveryStylesLocalized:(BOOL)a3 animationFilter:(id)a4;
- (int64_t)contentWritingDirection;
- (unint64_t)chunkCountForTextureDeliveryStyle:(unint64_t)a3 byGlyphStyle:(int)a4 animationFilter:(id)a5;
- (unint64_t)p_chunkCountForByBullet;
- (unint64_t)p_chunkCountForByBulletGroup;
- (unsigned)maxLineCount;
- (unsigned)verticalAlignment;
- (void)acceptVisitor:(id)a3;
- (void)adoptStylesheet:(id)a3 withMapper:(id)a4;
- (void)dealloc;
- (void)fixPositionOfImportedAutosizedShape;
- (void)processSelectedStoragesWithStatisticsController:(id)a3;
- (void)setAllowsLastLineTruncation:(BOOL)a3;
- (void)setColumns:(id)a3;
- (void)setContainedStorage:(id)a3;
- (void)setContentWritingDirection:(int64_t)a3;
- (void)setLineHints:(id)a3;
- (void)setMaxLineCount:(unsigned int)a3;
- (void)setPadding:(id)a3;
- (void)setShrinkTextToFit:(BOOL)a3;
- (void)setTextIsVertical:(BOOL)a3;
- (void)setTextUserEditable:(BOOL)a3;
- (void)setVerticalAlignment:(unsigned int)a3;
- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)wasRemovedFromDocumentRoot:(id)a3;
- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)willBeRemovedFromDocumentRoot:(id)a3;
@end

@implementation TSWPShapeInfo

+ (void)setDefaultInstructionalText:(id)a3
{
  TSWPDefaultInstructionalText = (uint64_t)a3;
}

- (BOOL)isTextUserEditable
{
  return self->_textUserEditable;
}

- (void)setTextUserEditable:(BOOL)a3
{
  self->_textUserEditable = a3;
}

- (void)setContainedStorage:(id)a3
{
  if (self->_containedStorage != a3)
  {
    if (!a3)
    {
      v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPShapeInfo setContainedStorage:]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeInfo.mm"), 178, @"invalid nil value for '%s'", "inStorage");
    }
    [(TSPObject *)self willModify];
    [(TSWPStorage *)self->_containedStorage clearBackPointerToParentInfoIfNeeded:self];
    id v7 = a3;

    self->_containedStorage = (TSWPStorage *)a3;
    [a3 setParentInfo:self];
  }
}

- (BOOL)supportsTextInset
{
  return 1;
}

- (BOOL)supportsShrinkTextToFit
{
  return 1;
}

- (BOOL)allowsLastLineTruncation
{
  return objc_msgSend(-[TSDShapeInfo style](self, "style"), "intValueForProperty:", 154) != 0;
}

- (void)setAllowsLastLineTruncation:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(TSDStyledInfo *)self setBoxedValue:v4 forProperty:154];
}

- (unsigned)maxLineCount
{
  unsigned int result = objc_msgSend(-[TSDShapeInfo style](self, "style"), "definesProperty:", 155);
  if (result)
  {
    id v4 = [(TSDShapeInfo *)self style];
    return [v4 intValueForProperty:155];
  }
  return result;
}

- (void)setMaxLineCount:(unsigned int)a3
{
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];

  [(TSDStyledInfo *)self setBoxedValue:v4 forProperty:155];
}

- (BOOL)shrinkTextToFit
{
  return objc_msgSend(-[TSDShapeInfo style](self, "style"), "intValueForProperty:", 152) != 0;
}

- (void)setShrinkTextToFit:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(TSDStyledInfo *)self setBoxedValue:v4 forProperty:152];
}

- (BOOL)textIsVertical
{
  return objc_msgSend(-[TSDShapeInfo style](self, "style"), "intValueForProperty:", 153) != 0;
}

- (void)setTextIsVertical:(BOOL)a3
{
  uint64_t v4 = [NSNumber numberWithBool:a3];

  [(TSDStyledInfo *)self setBoxedValue:v4 forProperty:153];
}

- (unsigned)verticalAlignment
{
  id v2 = [(TSDShapeInfo *)self style];

  return [v2 intValueForProperty:149];
}

- (void)setVerticalAlignment:(unsigned int)a3
{
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];

  [(TSDStyledInfo *)self setBoxedValue:v4 forProperty:149];
}

- (TSWPColumns)columns
{
  id v2 = [(TSDShapeInfo *)self style];

  return (TSWPColumns *)[v2 valueForProperty:148];
}

- (void)setColumns:(id)a3
{
}

- (TSWPPadding)padding
{
  id v2 = [(TSDShapeInfo *)self style];

  return (TSWPPadding *)[v2 valueForProperty:146];
}

- (void)setPadding:(id)a3
{
}

- (TSWPShapeStyle)tswpShapeStyle
{
  objc_opt_class();
  [(TSDShapeInfo *)self style];

  return (TSWPShapeStyle *)TSUDynamicCast();
}

- (void)setContentWritingDirection:(int64_t)a3
{
  containedStorage = self->_containedStorage;
  uint64_t v6 = [(TSWPStorage *)containedStorage range];

  -[TSWPStorage setParagraphWritingDirection:forCharRange:undoTransaction:](containedStorage, "setParagraphWritingDirection:forCharRange:undoTransaction:", a3, v6, v5, 0);
}

- (int64_t)contentWritingDirection
{
  return [(TSWPStorage *)self->_containedStorage writingDirectionForParagraphAtParIndex:0];
}

- (Class)editorClass
{
  return 0;
}

- (Class)styleClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  [(TSWPStorage *)self->_containedStorage setParentInfo:0];

  self->mLineHints = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPShapeInfo;
  [(TSDShapeInfo *)&v3 dealloc];
}

- (TSWPShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 pathSource:(id)a6 wpStorage:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)TSWPShapeInfo;
  v8 = [(TSDShapeInfo *)&v11 initWithContext:a3 geometry:a4 style:a5 pathSource:a6];
  v9 = v8;
  if (v8)
  {
    [(TSWPShapeInfo *)v8 setContainedStorage:a7];
    [(TSWPShapeInfo *)v9 setTextUserEditable:1];
  }
  return v9;
}

- (TSWPShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 wpStorage:(id)a6
{
  [a4 size];
  id v13 = +[TSDScalarPathSource roundedRectangleWithScalar:naturalSize:](TSDScalarPathSource, "roundedRectangleWithScalar:naturalSize:", 0.0, v11, v12);

  return [(TSWPShapeInfo *)self initWithContext:a3 geometry:a4 style:a5 pathSource:v13 wpStorage:a6];
}

- (TSWPShapeInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 pathSource:(id)a6
{
  objc_opt_class();
  double v11 = (void *)TSUDynamicCast();
  double v12 = (void *)[a3 documentRoot];
  id v13 = (void *)[v11 defaultParagraphStyle];
  if (!v13)
  {
    v14 = objc_msgSend((id)objc_msgSend(a3, "documentRoot"), "theme");
    objc_opt_class();
    [v14 presetOfKind:String index:0];
    id v13 = (void *)[(id)TSUDynamicCast() defaultParagraphStyle];
  }
  v15 = -[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:]([TSWPStorage alloc], "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", a3, 0, 3, [v12 stylesheet], v13, objc_msgSend(v13, "initialListStyle"), 0, 0);
  v16 = [(TSWPShapeInfo *)self initWithContext:a3 geometry:a4 style:a5 pathSource:a6 wpStorage:v15];

  return v16;
}

- (TSWPShapeInfo)initWithContext:(id)a3 geometry:(id)a4
{
  return 0;
}

- (id)presetKind
{
  objc_super v3 = (void *)String;
  objc_opt_class();
  [(TSDShapeInfo *)self style];
  uint64_t v4 = (void *)TSUDynamicCast();
  if (!v4) {
    return v3;
  }

  return (id)[v4 presetKind];
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  [a4 pushMappingContext:self];
  v7.receiver = self;
  v7.super_class = (Class)TSWPShapeInfo;
  [(TSDStyledInfo *)&v7 adoptStylesheet:a3 withMapper:a4];
  [(TSWPStorage *)self->_containedStorage adoptStylesheet:a3 withMapper:a4];
  [a4 popMappingContext:self];
}

- (BOOL)displaysInstructionalText
{
  id v2 = [(TSWPShapeInfo *)self presetKind];
  objc_super v3 = String;

  return [v2 isEqual:v3];
}

- (NSString)instructionalText
{
  id v2 = [(TSWPShapeInfo *)self presetKind];
  if (![v2 isEqual:String]) {
    return (NSString *)&stru_26D688A48;
  }
  unsigned int result = (NSString *)TSWPDefaultInstructionalText;
  if (!TSWPDefaultInstructionalText)
  {
    uint64_t v4 = (void *)TSWPBundle();
    return (NSString *)[v4 localizedStringForKey:@"Text" value:&stru_26D688A48 table:@"TSText"];
  }
  return result;
}

- (double)pOffsetForParagraphAlignment:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(TSWPShapeInfo *)self containedStorage];
  BOOL v7 = [(TSWPShapeInfo *)self textIsVertical];
  double v8 = 0.0;
  if ([(TSWPStorage *)v6 paragraphCount])
  {
    id v9 = [(TSWPStorage *)v6 paragraphStyleAtParIndex:0 effectiveRange:0];
    if (v9)
    {
      int v10 = [v9 intValueForProperty:86];
      switch(v10)
      {
        case 1:
          if (v7) {
            return height;
          }
          else {
            return width;
          }
        case 2:
          if (v7) {
            double v13 = height;
          }
          else {
            double v13 = width;
          }
          return v13 * 0.5;
        case 4:
          BOOL v11 = [(TSWPStorage *)v6 isWritingDirectionRightToLeftForParagraphAtParIndex:0];
          if (v7) {
            double v12 = height;
          }
          else {
            double v12 = width;
          }
          if (v11) {
            return v12;
          }
          else {
            return 0.0;
          }
      }
    }
  }
  return v8;
}

- (double)pOffsetForVerticalAlignment:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(TSWPShapeInfo *)self textIsVertical];
  objc_opt_class();
  [(TSDShapeInfo *)self style];
  BOOL v7 = (void *)TSUDynamicCast();
  if (!v7)
  {
LABEL_7:
    double result = 0.0;
    if (v6) {
      return width;
    }
    return result;
  }
  int v8 = [v7 intValueForProperty:149];
  if (v8 != 1)
  {
    if (v8 == 2)
    {
      double result = 0.0;
      if (!v6) {
        return height;
      }
      return result;
    }
    goto LABEL_7;
  }
  if (v6) {
    double v10 = width;
  }
  else {
    double v10 = height;
  }
  return v10 * 0.5;
}

- (CGPoint)autosizePositionOffsetForGeometry:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v8 = *MEMORY[0x263F00148];
  double v9 = *(double *)(MEMORY[0x263F00148] + 8);
  BOOL v10 = [(TSWPShapeInfo *)self textIsVertical];
  if ([a3 widthValid])
  {
    if (([a3 heightValid] & 1) == 0)
    {
      if (!v10) {
        goto LABEL_9;
      }
LABEL_7:
      -[TSWPShapeInfo pOffsetForParagraphAlignment:](self, "pOffsetForParagraphAlignment:", width, height);
LABEL_10:
      double v9 = v12;
    }
  }
  else if (v10)
  {
    -[TSWPShapeInfo pOffsetForVerticalAlignment:](self, "pOffsetForVerticalAlignment:", width, height);
    double v8 = v11;
    if (([a3 heightValid] & 1) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    -[TSWPShapeInfo pOffsetForParagraphAlignment:](self, "pOffsetForParagraphAlignment:", width, height);
    double v8 = v13;
    if (([a3 heightValid] & 1) == 0)
    {
LABEL_9:
      -[TSWPShapeInfo pOffsetForVerticalAlignment:](self, "pOffsetForVerticalAlignment:", width, height);
      goto LABEL_10;
    }
  }
  double v14 = v8;
  double v15 = v9;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGAffineTransform)autosizedTransformForInfoGeometry:(SEL)a3 size:(id)a4
{
  double height = a5.height;
  double width = a5.width;
  double v10 = *MEMORY[0x263F00148];
  double v11 = *(double *)(MEMORY[0x263F00148] + 8);
  int v12 = [a4 widthValid];
  int v13 = [a4 heightValid];
  memset(&v19[1], 0, sizeof(CGAffineTransform));
  if (a4)
  {
    if (v13) {
      double v14 = height;
    }
    else {
      double v14 = 0.0;
    }
    if (v12) {
      double v15 = width;
    }
    else {
      double v15 = 0.0;
    }
    objc_msgSend(a4, "transformBasedOnRect:", v10, v11, v15, v14);
  }
  -[TSWPShapeInfo autosizePositionOffsetForGeometry:size:](self, "autosizePositionOffsetForGeometry:size:", a4, width, height);
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v19[0] = v19[1];
  return CGAffineTransformTranslate(retstr, v19, -v16, -v17);
}

- (CGPoint)autosizePositionOffset
{
  objc_super v3 = [(TSDDrawableInfo *)self geometry];
  float64x2_t v13 = 0u;
  float64x2_t v14 = 0u;
  float64x2_t v12 = 0u;
  [(TSDInfoGeometry *)v3 size];
  if (self)
  {
    -[TSWPShapeInfo autosizedTransformForInfoGeometry:size:](self, "autosizedTransformForInfoGeometry:size:", v3);
  }
  else
  {
    float64x2_t v13 = 0u;
    float64x2_t v14 = 0u;
    float64x2_t v12 = 0u;
  }
  uint64_t v4 = (void *)[(TSDInfoGeometry *)v3 mutableCopy];
  [v4 setWidthValid:1];
  [v4 setHeightValid:1];
  float64x2_t v10 = 0u;
  float64x2_t v11 = 0u;
  float64x2_t v9 = 0u;
  [v4 size];
  if (self)
  {
    -[TSWPShapeInfo autosizedTransformForInfoGeometry:size:](self, "autosizedTransformForInfoGeometry:size:", v4);
  }
  else
  {
    float64x2_t v10 = 0u;
    float64x2_t v11 = 0u;
    float64x2_t v9 = 0u;
  }

  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  float64x2_t v6 = vaddq_f64(v11, vmlaq_n_f64(vmulq_n_f64(v10, v5), v9, *MEMORY[0x263F00148]));
  double v7 = TSDSubtractPoints(v6.f64[0], v6.f64[1], vaddq_f64(v14, vmlaq_n_f64(vmulq_n_f64(v13, v5), v12, *MEMORY[0x263F00148])).f64[0]);
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)fixPositionOfImportedAutosizedShape
{
  objc_super v3 = [(TSDDrawableInfo *)self geometry];
  if (![(TSDInfoGeometry *)v3 widthValid] || ![(TSDInfoGeometry *)v3 heightValid])
  {
    [(TSWPShapeInfo *)self autosizePositionOffset];
    double v5 = v4;
    id v8 = (id)[(TSDInfoGeometry *)v3 mutableCopy];
    [v8 position];
    objc_msgSend(v8, "setPosition:", TSDAddPoints(v6, v7, v5));
    [(TSDShapeInfo *)self setGeometry:v8];
  }
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPShapeInfo;
  -[TSDDrawableInfo willBeAddedToDocumentRoot:context:](&v7, sel_willBeAddedToDocumentRoot_context_);
  [(TSWPStorage *)[(TSWPShapeInfo *)self containedStorage] willBeAddedToDocumentRoot:a3 dolcContext:a4];
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPShapeInfo;
  -[TSDDrawableInfo wasAddedToDocumentRoot:context:](&v7, sel_wasAddedToDocumentRoot_context_);
  [(TSWPStorage *)[(TSWPShapeInfo *)self containedStorage] wasAddedToDocumentRoot:a3 dolcContext:a4];
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeInfo;
  -[TSDDrawableInfo willBeRemovedFromDocumentRoot:](&v5, sel_willBeRemovedFromDocumentRoot_);
  [(TSWPStorage *)[(TSWPShapeInfo *)self containedStorage] willBeRemovedFromDocumentRoot:a3];
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeInfo;
  -[TSDDrawableInfo wasRemovedFromDocumentRoot:](&v5, sel_wasRemovedFromDocumentRoot_);
  [(TSWPStorage *)[(TSWPShapeInfo *)self containedStorage] wasRemovedFromDocumentRoot:a3];
}

- (id)childEnumerator
{
  v5[1] = *MEMORY[0x263EF8340];
  if ([(TSWPShapeInfo *)self containedStorage])
  {
    v5[0] = [(TSWPShapeInfo *)self containedStorage];
    objc_super v3 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  }
  else
  {
    objc_super v3 = (void *)MEMORY[0x263EFFA68];
  }
  return (id)[v3 objectEnumerator];
}

- (void)acceptVisitor:(id)a3
{
}

- (Class)layoutClass
{
  if (self->_containedStorage)
  {
    return (Class)objc_opt_class();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)TSWPShapeInfo;
    return [(TSDShapeInfo *)&v3 layoutClass];
  }
}

- (Class)repClass
{
  if (self->_containedStorage)
  {
    return (Class)objc_opt_class();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)TSWPShapeInfo;
    return [(TSDShapeInfo *)&v3 repClass];
  }
}

- (id)copyWithContext:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSWPShapeInfo;
  objc_super v5 = -[TSDShapeInfo copyWithContext:](&v8, sel_copyWithContext_);
  if (v5)
  {
    id v6 = [(TSWPStorage *)self->_containedStorage copyWithContext:a3];
    v5[22] = v6;
    [v6 setParentInfo:v5];
    v5[24] = self->mLineHints;
  }
  return v5;
}

- (id)childInfos
{
  v3[1] = *MEMORY[0x263EF8340];
  if (!self->_containedStorage) {
    return 0;
  }
  v3[0] = self->_containedStorage;
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:1];
}

- (id)textureDeliveryStylesLocalized:(BOOL)a3 animationFilter:(id)a4
{
  BOOL v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TSWPShapeInfo;
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[TSDDrawableInfo textureDeliveryStylesLocalized:animationFilter:](&v19, sel_textureDeliveryStylesLocalized_animationFilter_, a3, a4));
  objc_super v7 = v6;
  if (v4)
  {
    long long v18 = xmmword_223838000;
    containedStorage = self->_containedStorage;
    if (containedStorage)
    {
      id v9 = [(TSWPStorage *)containedStorage listStyleAtCharIndex:0 effectiveRange:&v18];
      containedStorage = self->_containedStorage;
    }
    else
    {
      id v9 = 0;
    }
    int v11 = objc_msgSend(v9, "effectiveTypeForLevel:", -[TSWPStorage paragraphLevelAtParIndex:](containedStorage, "paragraphLevelAtParIndex:", 0, v18));
    float64x2_t v12 = (void *)TSWPBundle();
    BOOL v13 = v11 == 0;
    if (v11) {
      float64x2_t v14 = @"By Bullet";
    }
    else {
      float64x2_t v14 = @"By Paragraph";
    }
    if (v11) {
      double v15 = @"By Bullet Group";
    }
    else {
      double v15 = @"By Paragraph Group";
    }
    if (v13) {
      double v16 = @"By Highlighted Paragraph";
    }
    else {
      double v16 = @"By Highlighted Bullet";
    }
    objc_msgSend(v7, "addObject:", objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_26D688A48, @"TSText"));
    objc_msgSend(v7, "addObject:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", v15, &stru_26D688A48, @"TSText"));
    float64x2_t v10 = (__CFString *)[(id)TSWPBundle() localizedStringForKey:v16 value:&stru_26D688A48 table:@"TSText"];
  }
  else
  {
    [v6 addObject:@"By Paragraph"];
    [v7 addObject:@"By Bullet Group"];
    float64x2_t v10 = @"By Highlighted Bullet";
  }
  [v7 addObject:v10];
  return v7;
}

- (CGPoint)transformableObjectAnchorPoint
{
  v12.receiver = self;
  v12.super_class = (Class)TSWPShapeInfo;
  [(TSDDrawableInfo *)&v12 transformableObjectAnchorPoint];
  double v4 = v3;
  double v6 = v5;
  objc_super v7 = [(TSDDrawableInfo *)self geometry];
  if (![(TSDInfoGeometry *)v7 widthValid])
  {
    [(TSDInfoGeometry *)v7 position];
    double v4 = v8;
  }
  if (![(TSDInfoGeometry *)v7 heightValid])
  {
    [(TSDInfoGeometry *)v7 position];
    double v6 = v9;
  }
  double v10 = v4;
  double v11 = v6;
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)propertyMapForNewPreset
{
  double v3 = objc_msgSend(-[TSDShapeInfo style](self, "style"), "fullPropertyMap");
  double v4 = objc_msgSend((id)objc_msgSend(-[TSPObjectContext documentRoot](-[TSPObject context](self, "context"), "documentRoot"), "theme"), "stylesheet");
  [v4 setIsLocked:0];
  id v5 = [(TSWPStorage *)[(TSWPShapeInfo *)self containedStorage] listStyleAtParIndex:0 effectiveRange:0];
  uint64_t v6 = objc_msgSend(v4, "variationOfStyleMatchingStyle:withNewParentStyle:", v5, objc_msgSend(v5, "firstIdentifiedAncestor"));
  id v7 = [(TSWPStorage *)[(TSWPShapeInfo *)self containedStorage] paragraphStyleAtParIndex:0 effectiveRange:0];
  double v8 = (void *)[v7 fullPropertyMap];
  [v8 setObject:v6 forProperty:108];
  uint64_t v9 = objc_msgSend(v4, "variationOfStyle:propertyMap:", objc_msgSend(v7, "firstIdentifiedAncestor"), v8);
  [v4 setIsLocked:1];
  [v3 setObject:v9 forProperty:212];
  return v3;
}

- (id)styleIdentifierTemplateForNewPreset
{
  objc_opt_class();
  [(TSDShapeInfo *)self pathSource];
  double v3 = (void *)TSUDynamicCast();
  double v4 = [(TSWPShapeInfo *)self presetKind];
  if (v4 != String)
  {
    if (!v3)
    {
      v7.receiver = self;
      v7.super_class = (Class)TSWPShapeInfo;
      return [(TSDStyledInfo *)&v7 styleIdentifierTemplateForNewPreset];
    }
    if ([v3 isClosed]) {
      id v5 = &String;
    }
    else {
      id v5 = &String;
    }
    double v4 = *v5;
  }

  return (id)TSWPShapeStyleIdentifierString((uint64_t)v4, 0);
}

- (id)stylesForCopyStyle
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeInfo;
  double v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[TSDStyledInfo stylesForCopyStyle](&v5, sel_stylesForCopyStyle));
  objc_msgSend(v3, "tsu_addObjects:", -[TSWPStorage paragraphStyleAtParIndex:effectiveRange:](-[TSWPShapeInfo containedStorage](self, "containedStorage"), "paragraphStyleAtParIndex:effectiveRange:", 0, 0), -[TSWPStorage listStyleAtParIndex:effectiveRange:](-[TSWPShapeInfo containedStorage](self, "containedStorage"), "listStyleAtParIndex:effectiveRange:", 0, 0), 0);
  return v3;
}

- (id)commandForPasteStyleWithContext:(id)a3 pasteboardStyles:(id)a4
{
  return 0;
}

- (BOOL)autoListRecognition
{
  return 1;
}

- (BOOL)autoListTermination
{
  return 1;
}

- (BOOL)p_hasContentForRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  objc_super v5 = [(TSWPShapeInfo *)self containedStorage];
  NSUInteger v6 = location + length;
  if (location >= location + length) {
    return 0;
  }
  objc_super v7 = v5;
  if (!IsWhitespaceCharacter([(TSWPStorage *)v5 characterAtIndex:location])) {
    return 1;
  }
  NSUInteger v8 = location + 1;
  NSUInteger v9 = length - 1;
  do
  {
    NSUInteger v10 = v8;
    if (!v9) {
      break;
    }
    char v11 = IsWhitespaceCharacter([(TSWPStorage *)v7 characterAtIndex:v8]);
    NSUInteger v8 = v10 + 1;
    --v9;
  }
  while ((v11 & 1) != 0);
  return v10 < v6;
}

- (BOOL)p_hasListLabelOrContentForParagraphIndex:(unint64_t)a3
{
  objc_super v5 = [(TSWPShapeInfo *)self containedStorage];
  uint64_t v6 = [(TSWPStorage *)v5 textRangeIgnoringTrailingLineBreaksForParagraphAtIndex:a3];
  uint64_t v8 = v7;
  BOOL v9 = 0;
  if ([(TSWPStorage *)v5 paragraphHasListLabelAtCharIndex:v6] && !v8) {
    BOOL v9 = [(TSWPStorage *)v5 paragraphCount] - 1 == a3;
  }
  return v9 | -[TSWPShapeInfo p_hasContentForRange:](self, "p_hasContentForRange:", v6, v8);
}

- (unint64_t)p_chunkCountForByBullet
{
  id v2 = [(TSWPShapeInfo *)self containedStorage];

  return [(TSWPStorage *)v2 paragraphCount];
}

- (unint64_t)p_chunkCountForByBulletGroup
{
  id v2 = [(TSWPShapeInfo *)self containedStorage];
  unint64_t v3 = 0;
  if ([(TSWPStorage *)v2 paragraphCount])
  {
    unint64_t v4 = 0;
    do
    {
      if ([(TSWPStorage *)v2 paragraphLevelAtParIndex:v4]) {
        BOOL v5 = v4 == 0;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5) {
        ++v3;
      }
      ++v4;
    }
    while (v4 < [(TSWPStorage *)v2 paragraphCount]);
  }
  return v3;
}

- (unint64_t)chunkCountForTextureDeliveryStyle:(unint64_t)a3 byGlyphStyle:(int)a4 animationFilter:(id)a5
{
  uint64_t v8 = [(TSWPShapeInfo *)self containedStorage];
  if (a4 == 2)
  {
    unint64_t result = [(TSWPStorage *)v8 wordCount];
  }
  else if (a4 == 1)
  {
    [(TSWPStorage *)v8 range];
    unint64_t result = v9;
  }
  else if (a3 == 2)
  {
    unint64_t result = [(TSWPShapeInfo *)self p_chunkCountForByBulletGroup];
  }
  else if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    unint64_t result = [(TSWPShapeInfo *)self p_chunkCountForByBullet];
  }
  else
  {
    unint64_t result = 0;
  }
  if (result <= 1) {
    return 1;
  }
  return result;
}

- (id)commandForTransformingByTransform:(CGAffineTransform *)a3 context:(id)a4 transformedObjects:(id)a5 inBounds:(CGRect)a6
{
  return 0;
}

- (void)processSelectedStoragesWithStatisticsController:(id)a3
{
  unint64_t v4 = [(TSWPShapeInfo *)self containedStorage];
  if (v4)
  {
    [a3 processStorageForStatistics:v4 processSelection:0];
  }
}

- (TSWPStorage)containedStorage
{
  return self->_containedStorage;
}

- (TSWPLineHintCollection)lineHints
{
  return self->mLineHints;
}

- (void)setLineHints:(id)a3
{
}

@end