@interface PFXDrawablePlacement
+ (CGRect)boundsWithProperties:(id)a3 readerState:(id)a4;
+ (CGRect)boundsWithStackEntry:(id)a3 readerState:(id)a4;
+ (id)affineGeometryWithAffineTransform:(CGAffineTransform *)a3 appliedToBounds:(CGRect)a4;
+ (id)exteriorTextWrapWithCssValue:(id)a3 readerState:(id)a4;
- (BOOL)mapStartElementWithState:(id)a3;
- (CGAffineTransform)affineTransform;
- (CGRect)bounds;
- (NSString)attachmentId;
- (PFXDrawablePlacement)initWithDrawable:(id)a3;
- (TSDExteriorTextWrap)exteriorTextWrap;
- (TSDInfoGeometry)infoGeometry;
- (id)wrapPropertyValueWithState:(id)a3;
- (int)mode;
- (void)dealloc;
- (void)mapAffineTransformWithState:(id)a3;
- (void)mapBoundsWithState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
- (void)mapPlacementModeWithState:(id)a3;
- (void)setAffineTransform:(CGAffineTransform *)a3;
- (void)setAttachmentId:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setExteriorTextWrap:(id)a3;
- (void)setInfoGeometry:(id)a3;
- (void)setMode:(int)a3;
@end

@implementation PFXDrawablePlacement

- (PFXDrawablePlacement)initWithDrawable:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PFXDrawablePlacement;
  result = [(PFXDrawablePlacement *)&v5 init];
  if (result) {
    result->mDrawable = (PFXDrawablePlacementVendor *)a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXDrawablePlacement;
  [(PFXDrawablePlacement *)&v3 dealloc];
}

- (void)mapPlacementModeWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  [a3 drawableReaderForCurrentMediaStateWithStackEntry:[v5 parentHtmlStackEntry]];
  self->mMode = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || [a3 isInsideWidget])
  {
    self->mMode = 4;
  }
  else
  {
    id v6 = [v5 valueForAttribute:"data-attachment-ref"];
    if (v6)
    {
      self->mMode = 3;
      [(PFXDrawablePlacement *)self setAttachmentId:v6];
    }
    else
    {
      [(PFXDrawablePlacement *)self mapNonChildPlacementModeWithState:a3];
    }
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  -[PFXDrawablePlacement mapPlacementModeWithState:](self, "mapPlacementModeWithState:");
  [(PFXDrawablePlacement *)self setExteriorTextWrap:+[PFXDrawablePlacement exteriorTextWrapWithCssValue:[(PFXDrawablePlacement *)self wrapPropertyValueWithState:a3] readerState:a3]];
  [(PFXDrawablePlacement *)self mapBoundsWithState:a3];
  [(PFXDrawablePlacement *)self mapAffineTransformWithState:a3];
  if (self->mBounds.size.width * self->mBounds.size.height != 0.0)
  {
    long long v5 = *(_OWORD *)&self->mAffineTransform.c;
    v7[0] = *(_OWORD *)&self->mAffineTransform.a;
    v7[1] = v5;
    v7[2] = *(_OWORD *)&self->mAffineTransform.tx;
    [(PFXDrawablePlacement *)self setInfoGeometry:+[PFXDrawablePlacement affineGeometryWithAffineTransform:appliedToBounds:](PFXDrawablePlacement, "affineGeometryWithAffineTransform:appliedToBounds:", v7, self->mBounds.origin.x, self->mBounds.origin.y)];
  }
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = [v5 currentEntryMediaState];
  id v7 = [v6 result];
  objc_opt_class();
  v8 = (NSArray *)TSUDynamicCast();
  if (!v8)
  {
    uint64_t v9 = TSUProtocolCast();
    if (v9) {
      v8 = +[NSArray arrayWithObject:v9];
    }
    else {
      v8 = 0;
    }
  }
  if ([(NSArray *)v8 count])
  {
    id v26 = a3;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v14 performSelector:"setExteriorTextWrap:" withObject:self->mExteriorTextWrap];
          }
        }
        id v11 = [(NSArray *)v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);
    }
    if ((self->mMode & 0xFFFFFFFE) == 2)
    {
      id v15 = [(NSArray *)v8 lastObject];
      v16 = v26;
      if ([(NSArray *)v8 count] >= 2)
      {
        id v17 = objc_msgSend(objc_alloc((Class)TSDGroupInfo), "initWithContext:geometry:", objc_msgSend(v26, "tspContext"), self->mInfoGeometry);
        NSUInteger v18 = [(NSArray *)v8 count];
        if (v18)
        {
          NSUInteger v19 = v18;
          for (uint64_t j = 0; j != v19; ++j)
          {
            id v21 = [(NSArray *)v8 objectAtIndex:j];
            if ([v21 conformsToProtocol:&OBJC_PROTOCOL___TSDInfo]) {
              [v17 addChildInfo:v21];
            }
          }
        }
        [v17 ensureGeometryFitsChildren];
        [v17 setExteriorTextWrap:self->mExteriorTextWrap];
        id v15 = v17;
        v16 = v26;
      }
      if (self->mMode == 2)
      {
        id v22 = [v6 storage];
        id v23 = objc_msgSend(objc_alloc((Class)TSWPDrawableAttachment), "initWithContext:drawable:", objc_msgSend(v16, "tspContext"), v15);
        [v23 setHOffsetType:0];
        [v23 setHOffset:0.0];
        [v23 setVOffsetType:0];
        [v23 setVOffset:0.0];
        v24 = (char *)[v22 length];
        [v22 insertAttachmentOrFootnote:v23 range:v24];

        objc_msgSend(v22, "setCharacterStyle:range:undoTransaction:", objc_msgSend(objc_msgSend(objc_msgSend(v5, "parentHtmlStackEntry"), "currentEntryMediaState"), "characterStyle"), v24, 1, 0);
        if (!+[PFXBlock isEntryInline:v5])
        {
          [v16 readerForCurrentMediaStateWithStackEntry:[v5 parentHtmlStackEntry]];
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            if (v24) {
              id v25 = [v22 characterAtIndex:v24 - 1];
            }
            else {
              id v25 = &dword_8 + 2;
            }
            if (+[PFXCharacterRun isCharForcesLineBreak:v25])
            {
              uint64_t v27 = 0;
              +[PFXParagraphStyle map:&v27 stackEntry:v5];
              [v22 setParagraphStyle:v27 forCharRange:v24 undoTransaction:1];
            }
          }
        }
      }
      else
      {
        objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v16, "currentHtmlDocMediaState"), "drawableAttachmentCache"), "objectForKey:", -[PFXDrawablePlacement attachmentId](self, "attachmentId")), "attachDrawable:", v15);
      }
    }
    else
    {
      v16 = v26;
      [(PFXDrawablePlacement *)self mapNonChildResults:v8 withState:v26];
    }
    [v16 drawableReaderForCurrentMediaStateWithStackEntry:[v5 parentHtmlStackEntry]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 addChildAttributesToParentForResult:v7];
    }
  }
}

+ (id)exteriorTextWrapWithCssValue:(id)a3 readerState:(id)a4
{
  id v6 = (id)qword_5737C0;
  if (!qword_5737C0)
  {
    id v6 = [objc_alloc((Class)TSDExteriorTextWrap) initWithIsHTMLWrap:0 type:0 direction:2 fitType:0 margin:0.0 alphaThreshold:0.5];
    qword_5737C0 = (uint64_t)v6;
  }
  if (!qword_5737C8) {
    qword_5737C8 = (uint64_t)v6;
  }
  if (![a3 count]) {
    return (id)qword_5737C8;
  }
  id v7 = +[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", [a3 objectAtIndex:0]);
  if (![v7 isEqualToString:@"disabled"])
  {
    if ([a3 count] != (char *)&dword_4 + 2) {
      +[NSException raise:NSGenericException format:@"Bad wrap"];
    }
    id v9 = +[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", [a3 objectAtIndex:1]);
    id v10 = +[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", [a3 objectAtIndex:2]);
    +[PFXStyleUtilities pointLengthInPair:readerState:](PFXStyleUtilities, "pointLengthInPair:readerState:", [a3 objectAtIndex:3], a4);
    double v12 = v11;
    [+[PFXStyleUtilities numberStringInPair:](PFXStyleUtilities, "numberStringInPair:", [a3 objectAtIndex:4]) doubleValue];
    double v14 = v13;
    BOOL v15 = +[PFXStyleUtilities BOOLValueInPair:](PFXStyleUtilities, "BOOLValueInPair:", [a3 objectAtIndex:5]);
    if ([v7 isEqualToString:@"directional"])
    {
      uint64_t v16 = 1;
    }
    else if ([v7 isEqualToString:@"neither"])
    {
      uint64_t v16 = 2;
    }
    else if ([v7 isEqualToString:@"largest"])
    {
      uint64_t v16 = 3;
    }
    else if ([v7 isEqualToString:@"automatic"])
    {
      uint64_t v16 = 4;
    }
    else
    {
      +[NSException raise:NSGenericException format:@"Bad wrap type"];
      uint64_t v16 = 0;
    }
    if (([v9 isEqualToString:@"rectangular"] & 1) == 0)
    {
      if ([v9 isEqualToString:@"contour"])
      {
        uint64_t v17 = 1;
        goto LABEL_27;
      }
      +[NSException raise:NSGenericException format:@"Bad wrap fit"];
    }
    uint64_t v17 = 0;
LABEL_27:
    if (([v10 isEqualToString:@"left"] & 1) == 0)
    {
      if ([v10 isEqualToString:@"right"])
      {
        uint64_t v18 = 1;
        return +[TSDExteriorTextWrap exteriorTextWrapWithIsHTMLWrap:v15 type:v16 direction:v18 fitType:v17 margin:v12 alphaThreshold:v14];
      }
      if ([v10 isEqualToString:@"both"])
      {
        uint64_t v18 = 2;
        return +[TSDExteriorTextWrap exteriorTextWrapWithIsHTMLWrap:v15 type:v16 direction:v18 fitType:v17 margin:v12 alphaThreshold:v14];
      }
      +[NSException raise:NSGenericException format:@"Bad wrap direction"];
    }
    uint64_t v18 = 0;
    return +[TSDExteriorTextWrap exteriorTextWrapWithIsHTMLWrap:v15 type:v16 direction:v18 fitType:v17 margin:v12 alphaThreshold:v14];
  }
  if ([a3 count] != (char *)&dword_0 + 1) {
    +[NSException raise:NSGenericException format:@"Bad wrap"];
  }
  return (id)qword_5737C0;
}

+ (CGRect)boundsWithProperties:(id)a3 readerState:(id)a4
{
  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", [a3 valueForProperty:"left"], a4);
  double v7 = v6;
  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", [a3 valueForProperty:"top"], a4);
  double v9 = v8;
  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", [a3 valueForProperty:"width"], a4);
  double v11 = v10;
  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", [a3 valueForProperty:"height"], a4);
  double v13 = v12;
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (CGRect)boundsWithStackEntry:(id)a3 readerState:(id)a4
{
  objc_msgSend(objc_msgSend(a3, "valueForAttribute:", "x", a4), "doubleValue");
  double v6 = v5;
  objc_msgSend(objc_msgSend(a3, "valueForAttribute:", "y"), "doubleValue");
  double v8 = v7;
  objc_msgSend(objc_msgSend(a3, "valueForAttribute:", "width"), "doubleValue");
  double v10 = v9;
  objc_msgSend(objc_msgSend(a3, "valueForAttribute:", "height"), "doubleValue");
  double v12 = v11;
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (id)affineGeometryWithAffineTransform:(CGAffineTransform *)a3 appliedToBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  long long v9 = *(_OWORD *)&a3->c;
  v33[0] = *(_OWORD *)&a3->a;
  v33[1] = v9;
  v33[2] = *(_OWORD *)&a3->tx;
  id v10 = [[TSDInfoGeometry geometryFromFullTransform:v33] mutableCopy];
  double v11 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", x, y, width, height);
  long long v12 = *(_OWORD *)&a3->c;
  v32[0] = *(_OWORD *)&a3->a;
  v32[1] = v12;
  v32[2] = *(_OWORD *)&a3->tx;
  [(TSDBezierPath *)v11 transformUsingAffineTransform:v32];
  [(TSDBezierPath *)v11 bounds];
  CGFloat v13 = v34.origin.x;
  CGFloat v14 = v34.origin.y;
  CGFloat v15 = v34.size.width;
  CGFloat v16 = v34.size.height;
  double MidX = CGRectGetMidX(v34);
  v35.origin.double x = v13;
  v35.origin.double y = v14;
  v35.size.double width = v15;
  v35.size.double height = v16;
  double MidY = CGRectGetMidY(v35);
  double b = a3->b;
  double c = a3->c;
  double d = a3->d;
  tdouble x = a3->tx;
  tdouble y = a3->ty;
  double v24 = tx + c * 0.0 + a3->a * 0.0;
  double v25 = ty + d * 0.0 + b * 0.0;
  double v26 = tx + c * 0.0 + a3->a * width;
  double v27 = ty + d * 0.0 + b * width;
  double v28 = tx + height * c + a3->a * 0.0;
  double v29 = ty + height * d + b * 0.0;
  double v30 = hypot(v26 - v24, v27 - v25);
  [v10 setSize:v30, (double)hypot(v28 - v24, v29 - v25)];
  [v10 setCenter:MidX, MidY];
  return v10;
}

- (int)mode
{
  return self->mMode;
}

- (void)setMode:(int)a3
{
  self->mMode = a3;
}

- (CGRect)bounds
{
  double x = self->mBounds.origin.x;
  double y = self->mBounds.origin.y;
  double width = self->mBounds.size.width;
  double height = self->mBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->mBounds = a3;
}

- (CGAffineTransform)affineTransform
{
  long long v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->double c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setAffineTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mAffineTransform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mAffineTransform.double c = v4;
  *(_OWORD *)&self->mAffineTransform.a = v3;
}

- (TSDInfoGeometry)infoGeometry
{
  return self->mInfoGeometry;
}

- (void)setInfoGeometry:(id)a3
{
}

- (TSDExteriorTextWrap)exteriorTextWrap
{
  return self->mExteriorTextWrap;
}

- (void)setExteriorTextWrap:(id)a3
{
}

- (NSString)attachmentId
{
  return self->_attachmentId;
}

- (void)setAttachmentId:(id)a3
{
}

- (id)wrapPropertyValueWithState:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState"), "propertySet");
  long long v4 = PFXPropNmApplePubBoxWrapExteriorPath[0];

  return [v3 valueForProperty:v4];
}

- (void)mapBoundsWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  v14.origin.CGFloat x = CGRectZero.origin.x;
  v14.origin.CGFloat y = CGRectZero.origin.y;
  v14.size.CGFloat width = CGRectZero.size.width;
  v14.size.CGFloat height = CGRectZero.size.height;
  if (CGRectEqualToRect(self->mBounds, v14))
  {
    +[PFXDrawablePlacement boundsWithProperties:readerState:](PFXDrawablePlacement, "boundsWithProperties:readerState:", objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "propertySet"), a3);
    self->mBounds.origin.CGFloat x = x;
    self->mBounds.origin.CGFloat y = y;
    self->mBounds.size.CGFloat width = width;
    self->mBounds.size.CGFloat height = height;
  }
  else
  {
    CGFloat x = self->mBounds.origin.x;
    CGFloat y = self->mBounds.origin.y;
    CGFloat width = self->mBounds.size.width;
    CGFloat height = self->mBounds.size.height;
  }
  v15.origin.CGFloat x = CGRectZero.origin.x;
  v15.origin.CGFloat y = CGRectZero.origin.y;
  v15.size.CGFloat width = CGRectZero.size.width;
  v15.size.CGFloat height = CGRectZero.size.height;
  if (CGRectEqualToRect(*(CGRect *)&x, v15))
  {
    +[PFXDrawablePlacement boundsWithStackEntry:v5 readerState:a3];
    self->mBounds.origin.CGFloat x = v10;
    self->mBounds.origin.CGFloat y = v11;
    self->mBounds.size.CGFloat width = v12;
    self->mBounds.size.CGFloat height = v13;
  }
}

- (void)mapAffineTransformWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  id v6 = objc_msgSend(objc_msgSend(v5, "currentEntryMediaState"), "propertySet");
  id v7 = [v5 parentHtmlStackEntry];
  id v8 = [a3 drawableReaderForCurrentMediaStateWithStackEntry:v7];
  p_mAffineTransform = &self->mAffineTransform;
  long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&self->mAffineTransform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&self->mAffineTransform.double c = v10;
  *(_OWORD *)&self->mAffineTransform.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  if ([a3 ancestorEntryWithElementName:"svg"]) {
    PFXAffineTransformWithSvgTransform((const char *)[v5 xmlValueForAttribute:"transform"], &v46);
  }
  else {
    PFXAffineTransformWithCssTransformValue((NSArray *)[v6 valueForProperty:"transform"], self->mBounds, (PFXHtmlReaderState *)a3, (uint64_t)&v46);
  }
  long long v11 = *(_OWORD *)&v46.c;
  *(_OWORD *)&p_mAffineTransform->a = *(_OWORD *)&v46.a;
  *(_OWORD *)&self->mAffineTransform.double c = v11;
  *(_OWORD *)&self->mAffineTransform.tCGFloat x = *(_OWORD *)&v46.tx;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    objc_msgSend(objc_msgSend(v8, "placement"), "bounds");
    long long v25 = *(_OWORD *)&self->mAffineTransform.c;
    *(_OWORD *)&v37.a = *(_OWORD *)&p_mAffineTransform->a;
    *(_OWORD *)&v37.double c = v25;
    *(_OWORD *)&v37.tCGFloat x = *(_OWORD *)&self->mAffineTransform.tx;
    CGAffineTransformMakeTranslation(&v36, v26, v27);
    CGAffineTransformConcat(&v46, &v37, &v36);
    long long v28 = *(_OWORD *)&v46.c;
    *(_OWORD *)&p_mAffineTransform->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&self->mAffineTransform.double c = v28;
    *(_OWORD *)&self->mAffineTransform.tCGFloat x = *(_OWORD *)&v46.tx;
    long long v29 = *(_OWORD *)&self->mAffineTransform.c;
    v35[0] = *(_OWORD *)&p_mAffineTransform->a;
    v35[1] = v29;
    v35[2] = *(_OWORD *)&self->mAffineTransform.tx;
    id v30 = [v8 placement];
    if (v30) {
      [v30 affineTransform];
    }
    else {
      memset(v34, 0, sizeof(v34));
    }
    long long v31 = (CGAffineTransform *)v35;
    v32 = (CGAffineTransform *)v34;
    goto LABEL_16;
  }
  id v12 = [v7 valueForAttribute:"viewBox"];
  if ([v12 length])
  {
    double v44 = 0.0;
    double v45 = 0.0;
    double v42 = 0.0;
    double v43 = 0.0;
    if (sscanf((const char *)[v12 UTF8String], "%lg %lg %lg %lg", &v45, &v44, &v43, &v42) == 4)
    {
      CGFloat v14 = v44;
      CGFloat v13 = v45;
      CGFloat v16 = v42;
      CGFloat v15 = v43;
      long long v17 = *(_OWORD *)&self->mAffineTransform.c;
      *(_OWORD *)&t1.a = *(_OWORD *)&p_mAffineTransform->a;
      *(_OWORD *)&t1.double c = v17;
      *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->mAffineTransform.tx;
      objc_msgSend(objc_msgSend(v8, "placement"), "bounds");
      mapSrcRectOntoDstRect((uint64_t)&t2, v13, v14, v15, v16, v18, v19, v20, v21);
      CGAffineTransformConcat(&v46, &t1, &t2);
      long long v22 = *(_OWORD *)&v46.c;
      *(_OWORD *)&p_mAffineTransform->a = *(_OWORD *)&v46.a;
      *(_OWORD *)&self->mAffineTransform.double c = v22;
      *(_OWORD *)&self->mAffineTransform.tCGFloat x = *(_OWORD *)&v46.tx;
      long long v23 = *(_OWORD *)&self->mAffineTransform.c;
      *(_OWORD *)&v39.a = *(_OWORD *)&p_mAffineTransform->a;
      *(_OWORD *)&v39.double c = v23;
      *(_OWORD *)&v39.tCGFloat x = *(_OWORD *)&self->mAffineTransform.tx;
      id v24 = [v8 placement];
      if (v24) {
        [v24 affineTransform];
      }
      else {
        memset(&v38, 0, sizeof(v38));
      }
      long long v31 = &v39;
      v32 = &v38;
LABEL_16:
      CGAffineTransformConcat(&v46, v31, v32);
      long long v33 = *(_OWORD *)&v46.c;
      *(_OWORD *)&p_mAffineTransform->a = *(_OWORD *)&v46.a;
      *(_OWORD *)&self->mAffineTransform.double c = v33;
      *(_OWORD *)&self->mAffineTransform.tCGFloat x = *(_OWORD *)&v46.tx;
    }
  }
}

@end