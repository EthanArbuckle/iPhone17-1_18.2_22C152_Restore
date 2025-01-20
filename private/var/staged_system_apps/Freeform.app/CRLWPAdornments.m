@interface CRLWPAdornments
- ($82EDB067EE6F192B39F18594CC8676AD)attachmentPositions;
- (BOOL)isEmpty;
- (BOOL)shouldRotate;
- (CGColor)color;
- (CGPoint)flippedPositions;
- (CGPoint)positions;
- (CGPoint)textPosition;
- (CGRect)rects;
- (CRLWPAdornments)initWithType:(int)a3 color:(CGColor *)a4 font:(__CTFont *)a5 flippedFont:(__CTFont *)a6;
- (__CTFont)flippedFont;
- (__CTFont)font;
- (double)advance;
- (double)ascent;
- (double)descent;
- (double)verticalAdjustment;
- (id).cxx_construct;
- (int)location;
- (int)type;
- (unint64_t)attachmentPositionCount;
- (unint64_t)charIndexCount;
- (unint64_t)charIndexes;
- (unint64_t)flippedGlyphCount;
- (unint64_t)flippedPositionCount;
- (unint64_t)glyphCount;
- (unint64_t)positionCount;
- (unint64_t)rectCount;
- (unsigned)flippedGlyphs;
- (unsigned)glyphs;
- (void)addAdornmentWithAttachmentPosition:(id)a3;
- (void)addAdornmentWithCharIndex:(unint64_t)a3 point:(CGPoint)a4 glyph:(unsigned __int16)a5 rect:(CGRect)a6;
- (void)addAdornmentWithPoint:(CGPoint)a3 glyph:(unsigned __int16)a4 flipped:(BOOL)a5;
- (void)incrementCharIndexes:(int64_t)a3 startingAt:(unint64_t)a4;
- (void)removeAdornmentAt:(unint64_t)a3;
- (void)setAscent:(double)a3 descent:(double)a4 advance:(double)a5;
- (void)setColor:(CGColor *)a3;
- (void)setFlippedFont:(__CTFont *)a3;
- (void)setFont:(__CTFont *)a3;
- (void)setLocation:(int)a3;
- (void)setShouldRotate:(BOOL)a3;
- (void)setTextPosition:(CGPoint)a3;
- (void)setVerticalAdjustment:(double)a3;
@end

@implementation CRLWPAdornments

- (CRLWPAdornments)initWithType:(int)a3 color:(CGColor *)a4 font:(__CTFont *)a5 flippedFont:(__CTFont *)a6
{
  v13.receiver = self;
  v13.super_class = (Class)CRLWPAdornments;
  v10 = [(CRLWPAdornments *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    [(CRLWPAdornments *)v10 setColor:a4];
    [(CRLWPAdornments *)v11 setFont:a5];
    [(CRLWPAdornments *)v11 setFlippedFont:a6];
    v11->_location = 1;
    v11->_verticalAdjustment = 0.0;
    v11->_descent = 0.0;
    v11->_advance = 0.0;
    v11->_ascent = 0.0;
    v11->_textPosition = CGPointZero;
    v11->_shouldRotate = 0;
  }
  return v11;
}

- (unint64_t)charIndexCount
{
  return self->_charIndexes.__end_ - self->_charIndexes.__begin_;
}

- (unint64_t)charIndexes
{
  if (self->_charIndexes.__end_ == self->_charIndexes.__begin_) {
    return 0;
  }
  else {
    return self->_charIndexes.__begin_;
  }
}

- (BOOL)isEmpty
{
  return ![(CRLWPAdornments *)self glyphCount]
      && [(CRLWPAdornments *)self flippedGlyphCount] == 0;
}

- (unint64_t)glyphCount
{
  return self->_glyphs.__end_ - self->_glyphs.__begin_;
}

- (unsigned)glyphs
{
  if (self->_glyphs.__end_ == self->_glyphs.__begin_) {
    return 0;
  }
  else {
    return self->_glyphs.__begin_;
  }
}

- (unint64_t)positionCount
{
  return self->_positions.__end_ - self->_positions.__begin_;
}

- (CGPoint)positions
{
  if (self->_positions.__end_ == self->_positions.__begin_) {
    return 0;
  }
  else {
    return self->_positions.__begin_;
  }
}

- (unint64_t)flippedGlyphCount
{
  return self->_flippedGlyphs.__end_ - self->_flippedGlyphs.__begin_;
}

- (unsigned)flippedGlyphs
{
  if (self->_flippedGlyphs.__end_ == self->_flippedGlyphs.__begin_) {
    return 0;
  }
  else {
    return self->_flippedGlyphs.__begin_;
  }
}

- (unint64_t)flippedPositionCount
{
  return self->_flippedPositions.__end_ - self->_flippedPositions.__begin_;
}

- (CGPoint)flippedPositions
{
  if (self->_flippedPositions.__end_ == self->_flippedPositions.__begin_) {
    return 0;
  }
  else {
    return self->_flippedPositions.__begin_;
  }
}

- (unint64_t)rectCount
{
  return self->_rects.__end_ - self->_rects.__begin_;
}

- (CGRect)rects
{
  if (self->_rects.__end_ == self->_rects.__begin_) {
    return 0;
  }
  else {
    return self->_rects.__begin_;
  }
}

- (unint64_t)attachmentPositionCount
{
  return (self->_attachmentPositions.__end_ - self->_attachmentPositions.__begin_) >> 4;
}

- ($82EDB067EE6F192B39F18594CC8676AD)attachmentPositions
{
  if (self->_attachmentPositions.__end_ == self->_attachmentPositions.__begin_) {
    return 0;
  }
  else {
    return ($82EDB067EE6F192B39F18594CC8676AD *)self->_attachmentPositions.__begin_;
  }
}

- (void)setAscent:(double)a3 descent:(double)a4 advance:(double)a5
{
  self->_ascent = a3;
  self->_descent = a4;
  self->_advance = a5;
}

- (void)addAdornmentWithPoint:(CGPoint)a3 glyph:(unsigned __int16)a4 flipped:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat y = a3.y;
  double x = a3.x;
  CGGlyph glyphs = a4;
  if ((self->_type - 1) >= 2)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7D10);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AFDC4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7D30);
    }
    v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornments addAdornmentWithPoint:glyph:flipped:]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornments.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 118, 0, "bad adornments type (expected kAdornmentsTypeInvisibles or kAdornmentsTypeInvisiblesBreak");
  }
  if (v5)
  {
    CTFontGetAdvancesForGlyphs(self->_flippedFont, kCTFontOrientationDefault, &glyphs, &advances, 1);
    double v12 = x - advances.width;
    value = self->_flippedPositions.__end_cap_.__value_;
    end = self->_flippedPositions.__end_;
    if (end >= value)
    {
      begin = self->_flippedPositions.__begin_;
      uint64_t v26 = end - begin;
      unint64_t v27 = v26 + 1;
      if ((unint64_t)(v26 + 1) >> 60) {
        sub_100004E40();
      }
      uint64_t v28 = (char *)value - (char *)begin;
      if (v28 >> 3 > v27) {
        unint64_t v27 = v28 >> 3;
      }
      if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v29 = v27;
      }
      if (v29)
      {
        v30 = (char *)sub_10001EAB0((uint64_t)&self->_flippedPositions.__end_cap_, v29);
        begin = self->_flippedPositions.__begin_;
        end = self->_flippedPositions.__end_;
      }
      else
      {
        v30 = 0;
      }
      v46 = (CGPoint *)&v30[16 * v26];
      v47 = (CGPoint *)&v30[16 * v29];
      v46->double x = v12;
      v46->CGFloat y = y;
      v15 = v46 + 1;
      if (end != begin)
      {
        do
        {
          v46[-1] = end[-1];
          --v46;
          --end;
        }
        while (end != begin);
        begin = self->_flippedPositions.__begin_;
      }
      self->_flippedPositions.__begin_ = v46;
      self->_flippedPositions.__end_ = v15;
      self->_flippedPositions.__end_cap_.__value_ = v47;
      if (begin) {
        operator delete(begin);
      }
    }
    else
    {
      end->double x = v12;
      end->CGFloat y = y;
      v15 = end + 1;
    }
    v48 = self->_flippedGlyphs.__end_cap_.__value_;
    self->_flippedPositions.__end_ = v15;
    v49 = self->_flippedGlyphs.__end_;
    if (v49 >= v48)
    {
      v51 = self->_flippedGlyphs.__begin_;
      uint64_t v52 = (char *)v49 - (char *)v51;
      if ((char *)v49 - (char *)v51 <= -3) {
        sub_100004E40();
      }
      uint64_t v53 = v52 >> 1;
      unint64_t v54 = (char *)v48 - (char *)v51;
      if (v54 <= (v52 >> 1) + 1) {
        unint64_t v55 = v53 + 1;
      }
      else {
        unint64_t v55 = v54;
      }
      if (v54 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v56 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v56 = v55;
      }
      if (v56)
      {
        v57 = (char *)sub_100147B4C((uint64_t)&self->_flippedGlyphs.__end_cap_, v56);
        v51 = self->_flippedGlyphs.__begin_;
        v49 = self->_flippedGlyphs.__end_;
      }
      else
      {
        v57 = 0;
      }
      v58 = (unsigned __int16 *)&v57[2 * v53];
      v59 = (unsigned __int16 *)&v57[2 * v56];
      unsigned __int16 *v58 = glyphs;
      v50 = v58 + 1;
      while (v49 != v51)
      {
        unsigned __int16 v60 = *--v49;
        *--v58 = v60;
      }
      self->_flippedGlyphs.__begin_ = v58;
      self->_flippedGlyphs.__end_ = v50;
      self->_flippedGlyphs.__end_cap_.__value_ = v59;
      if (v51) {
        operator delete(v51);
      }
    }
    else
    {
      unsigned __int16 *v49 = glyphs;
      v50 = v49 + 1;
    }
    self->_flippedGlyphs.__end_ = v50;
  }
  else
  {
    v16 = self->_positions.__end_cap_.__value_;
    v17 = self->_positions.__end_;
    if (v17 >= v16)
    {
      v19 = self->_positions.__begin_;
      uint64_t v20 = v17 - v19;
      unint64_t v21 = v20 + 1;
      if ((unint64_t)(v20 + 1) >> 60) {
        sub_100004E40();
      }
      uint64_t v22 = (char *)v16 - (char *)v19;
      if (v22 >> 3 > v21) {
        unint64_t v21 = v22 >> 3;
      }
      if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v23 = v21;
      }
      if (v23)
      {
        v24 = (char *)sub_10001EAB0((uint64_t)&self->_positions.__end_cap_, v23);
        v19 = self->_positions.__begin_;
        v17 = self->_positions.__end_;
      }
      else
      {
        v24 = 0;
      }
      v31 = (CGPoint *)&v24[16 * v20];
      v32 = (CGPoint *)&v24[16 * v23];
      v31->double x = x;
      v31->CGFloat y = y;
      v18 = v31 + 1;
      if (v17 != v19)
      {
        do
        {
          v31[-1] = v17[-1];
          --v31;
          --v17;
        }
        while (v17 != v19);
        v19 = self->_positions.__begin_;
      }
      self->_positions.__begin_ = v31;
      self->_positions.__end_ = v18;
      self->_positions.__end_cap_.__value_ = v32;
      if (v19) {
        operator delete(v19);
      }
    }
    else
    {
      v17->double x = x;
      v17->CGFloat y = y;
      v18 = v17 + 1;
    }
    v33 = self->_glyphs.__end_cap_.__value_;
    self->_positions.__end_ = v18;
    v34 = self->_glyphs.__end_;
    if (v34 >= v33)
    {
      v36 = self->_glyphs.__begin_;
      uint64_t v37 = (char *)v34 - (char *)v36;
      if ((char *)v34 - (char *)v36 <= -3) {
        sub_100004E40();
      }
      uint64_t v38 = v37 >> 1;
      unint64_t v39 = (char *)v33 - (char *)v36;
      if (v39 <= (v37 >> 1) + 1) {
        unint64_t v40 = v38 + 1;
      }
      else {
        unint64_t v40 = v39;
      }
      if (v39 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v41 = v40;
      }
      if (v41)
      {
        v42 = (char *)sub_100147B4C((uint64_t)&self->_glyphs.__end_cap_, v41);
        v36 = self->_glyphs.__begin_;
        v34 = self->_glyphs.__end_;
      }
      else
      {
        v42 = 0;
      }
      v43 = (unsigned __int16 *)&v42[2 * v38];
      v44 = (unsigned __int16 *)&v42[2 * v41];
      unsigned __int16 *v43 = glyphs;
      v35 = v43 + 1;
      while (v34 != v36)
      {
        unsigned __int16 v45 = *--v34;
        *--v43 = v45;
      }
      self->_glyphs.__begin_ = v43;
      self->_glyphs.__end_ = v35;
      self->_glyphs.__end_cap_.__value_ = v44;
      if (v36) {
        operator delete(v36);
      }
    }
    else
    {
      unsigned __int16 *v34 = glyphs;
      v35 = v34 + 1;
    }
    self->_glyphs.__end_ = v35;
  }
}

- (void)addAdornmentWithCharIndex:(unint64_t)a3 point:(CGPoint)a4 glyph:(unsigned __int16)a5 rect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  CGFloat v11 = a4.y;
  CGFloat v12 = a4.x;
  if ((self->_type | 2) != 6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7D50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AFE4C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7D70);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornments addAdornmentWithCharIndex:point:glyph:rect:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornments.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 137, 0, "bad adornments type (expected kAdornmentsTypeEmphasisMarks or kAdornmentTypeHiddenDeletions");
  }
  value = self->_charIndexes.__end_cap_.__value_;
  end = self->_charIndexes.__end_;
  if (end >= value)
  {
    begin = self->_charIndexes.__begin_;
    uint64_t v22 = end - begin;
    if ((unint64_t)(v22 + 1) >> 61) {
      sub_100004E40();
    }
    unint64_t v23 = (char *)value - (char *)begin;
    unint64_t v24 = ((char *)value - (char *)begin) >> 2;
    if (v24 <= v22 + 1) {
      unint64_t v24 = v22 + 1;
    }
    if (v23 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v25 = v24;
    }
    if (v25)
    {
      uint64_t v26 = (char *)sub_10002B494((uint64_t)&self->_charIndexes.__end_cap_, v25);
      begin = self->_charIndexes.__begin_;
      end = self->_charIndexes.__end_;
    }
    else
    {
      uint64_t v26 = 0;
    }
    unint64_t v27 = (unint64_t *)&v26[8 * v22];
    uint64_t v28 = (unint64_t *)&v26[8 * v25];
    *unint64_t v27 = a3;
    uint64_t v20 = v27 + 1;
    while (end != begin)
    {
      unint64_t v29 = *--end;
      *--unint64_t v27 = v29;
    }
    self->_charIndexes.__begin_ = v27;
    self->_charIndexes.__end_ = v20;
    self->_charIndexes.__end_cap_.__value_ = v28;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    unint64_t *end = a3;
    uint64_t v20 = end + 1;
  }
  v30 = self->_positions.__end_cap_.__value_;
  self->_charIndexes.__end_ = v20;
  v31 = self->_positions.__end_;
  if (v31 >= v30)
  {
    v33 = self->_positions.__begin_;
    uint64_t v34 = v31 - v33;
    unint64_t v35 = v34 + 1;
    if ((unint64_t)(v34 + 1) >> 60) {
      sub_100004E40();
    }
    uint64_t v36 = (char *)v30 - (char *)v33;
    if (v36 >> 3 > v35) {
      unint64_t v35 = v36 >> 3;
    }
    if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v37 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v37 = v35;
    }
    if (v37)
    {
      uint64_t v38 = (char *)sub_10001EAB0((uint64_t)&self->_positions.__end_cap_, v37);
      v33 = self->_positions.__begin_;
      v31 = self->_positions.__end_;
    }
    else
    {
      uint64_t v38 = 0;
    }
    unint64_t v39 = (CGPoint *)&v38[16 * v34];
    unint64_t v40 = (CGPoint *)&v38[16 * v37];
    v39->CGFloat x = v12;
    v39->CGFloat y = v11;
    v32 = v39 + 1;
    if (v31 != v33)
    {
      do
      {
        v39[-1] = v31[-1];
        --v39;
        --v31;
      }
      while (v31 != v33);
      v33 = self->_positions.__begin_;
    }
    self->_positions.__begin_ = v39;
    self->_positions.__end_ = v32;
    self->_positions.__end_cap_.__value_ = v40;
    if (v33) {
      operator delete(v33);
    }
  }
  else
  {
    v31->CGFloat x = v12;
    v31->CGFloat y = v11;
    v32 = v31 + 1;
  }
  uint64_t v41 = self->_glyphs.__end_cap_.__value_;
  self->_positions.__end_ = v32;
  v42 = self->_glyphs.__end_;
  if (v42 >= v41)
  {
    v44 = self->_glyphs.__begin_;
    uint64_t v45 = (char *)v42 - (char *)v44;
    if ((char *)v42 - (char *)v44 <= -3) {
      sub_100004E40();
    }
    uint64_t v46 = v45 >> 1;
    unint64_t v47 = (char *)v41 - (char *)v44;
    if (v47 <= (v45 >> 1) + 1) {
      unint64_t v48 = v46 + 1;
    }
    else {
      unint64_t v48 = v47;
    }
    if (v47 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v49 = v48;
    }
    if (v49)
    {
      v50 = (char *)sub_100147B4C((uint64_t)&self->_glyphs.__end_cap_, v49);
      v44 = self->_glyphs.__begin_;
      v42 = self->_glyphs.__end_;
    }
    else
    {
      v50 = 0;
    }
    v51 = (unsigned __int16 *)&v50[2 * v46];
    uint64_t v52 = (unsigned __int16 *)&v50[2 * v49];
    unsigned __int16 *v51 = a5;
    v43 = v51 + 1;
    while (v42 != v44)
    {
      unsigned __int16 v53 = *--v42;
      *--v51 = v53;
    }
    self->_glyphs.__begin_ = v51;
    self->_glyphs.__end_ = v43;
    self->_glyphs.__end_cap_.__value_ = v52;
    if (v44) {
      operator delete(v44);
    }
  }
  else
  {
    unsigned __int16 *v42 = a5;
    v43 = v42 + 1;
  }
  unint64_t v54 = self->_rects.__end_cap_.__value_;
  self->_glyphs.__end_ = v43;
  unint64_t v55 = self->_rects.__end_;
  if (v55 >= v54)
  {
    v57 = self->_rects.__begin_;
    uint64_t v58 = v55 - v57;
    unint64_t v59 = v58 + 1;
    if ((unint64_t)(v58 + 1) >> 59) {
      sub_100004E40();
    }
    uint64_t v60 = (char *)v54 - (char *)v57;
    if (v60 >> 4 > v59) {
      unint64_t v59 = v60 >> 4;
    }
    if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v61 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v61 = v59;
    }
    if (v61)
    {
      v62 = (char *)sub_100148898((uint64_t)&self->_rects.__end_cap_, v61);
      v57 = self->_rects.__begin_;
      unint64_t v55 = self->_rects.__end_;
    }
    else
    {
      v62 = 0;
    }
    v63 = (CGRect *)&v62[32 * v58];
    v63->origin.CGFloat x = x;
    v63->origin.CGFloat y = y;
    v64 = (CGRect *)&v62[32 * v61];
    v63->size.CGFloat width = width;
    v63->size.CGFloat height = height;
    uint64_t v56 = v63 + 1;
    if (v55 != v57)
    {
      do
      {
        CGSize size = v55[-1].size;
        v63[-1].origin = v55[-1].origin;
        v63[-1].CGSize size = size;
        --v63;
        --v55;
      }
      while (v55 != v57);
      v57 = self->_rects.__begin_;
    }
    self->_rects.__begin_ = v63;
    self->_rects.__end_ = v56;
    self->_rects.__end_cap_.__value_ = v64;
    if (v57) {
      operator delete(v57);
    }
  }
  else
  {
    v55->origin.CGFloat x = x;
    v55->origin.CGFloat y = y;
    uint64_t v56 = v55 + 1;
    v55->size.CGFloat width = width;
    v55->size.CGFloat height = height;
  }
  self->_rects.__end_ = v56;
}

- (void)addAdornmentWithAttachmentPosition:(id)a3
{
  double var1 = a3.var1;
  unint64_t var0 = a3.var0;
  if (self->_type != 3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7D90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010AFED4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F7DB0);
    }
    v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPAdornments addAdornmentWithAttachmentPosition:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPAdornments.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 149, 0, "bad adornments type (expected kAdornmentsTypeAttachments");
  }
  value = self->_attachmentPositions.__end_cap_.__value_;
  end = self->_attachmentPositions.__end_;
  if (end >= value)
  {
    begin = self->_attachmentPositions.__begin_;
    uint64_t v13 = (end - begin) >> 4;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 60) {
      sub_100004E40();
    }
    uint64_t v15 = value - begin;
    if (v15 >> 3 > v14) {
      unint64_t v14 = v15 >> 3;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      v17 = (char *)sub_10001EAB0((uint64_t)&self->_attachmentPositions.__end_cap_, v16);
      begin = self->_attachmentPositions.__begin_;
      end = self->_attachmentPositions.__end_;
    }
    else
    {
      v17 = 0;
    }
    v18 = &v17[16 * v13];
    v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v17[16 * v16];
    *(void *)v18 = var0;
    *((double *)v18 + 1) = var1;
    CGFloat v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v18 + 16);
    if (end != begin)
    {
      do
      {
        *((_OWORD *)v18 - 1) = *((_OWORD *)end - 1);
        v18 -= 16;
        end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end - 16);
      }
      while (end != begin);
      begin = self->_attachmentPositions.__begin_;
    }
    self->_attachmentPositions.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v18;
    self->_attachmentPositions.__end_ = v11;
    self->_attachmentPositions.__end_cap_.__value_ = v19;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    *(void *)end = var0;
    *((double *)end + 1) = var1;
    CGFloat v11 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 16);
  }
  self->_attachmentPositions.__end_ = v11;
}

- (void)removeAdornmentAt:(unint64_t)a3
{
  begin = self->_charIndexes.__begin_;
  end = self->_charIndexes.__end_;
  if (a3 < end - begin)
  {
    v7 = &begin[a3];
    v8 = (char *)((char *)end - (char *)(v7 + 1));
    if (end != v7 + 1) {
      memmove(&begin[a3], v7 + 1, (char *)end - (char *)(v7 + 1));
    }
    self->_charIndexes.__end_ = (unint64_t *)&v8[(void)v7];
  }
  v10 = self->_glyphs.__begin_;
  v9 = self->_glyphs.__end_;
  if (a3 < v9 - v10)
  {
    CGFloat v11 = &v10[a3];
    CGFloat v12 = (char *)((char *)v9 - (char *)(v11 + 1));
    if (v9 != v11 + 1) {
      memmove(&v10[a3], v11 + 1, (char *)v9 - (char *)(v11 + 1));
    }
    self->_glyphs.__end_ = (unsigned __int16 *)&v12[(void)v11];
  }
  unint64_t v14 = self->_rects.__begin_;
  uint64_t v13 = self->_rects.__end_;
  if (a3 < v13 - v14)
  {
    uint64_t v15 = &v14[a3];
    unint64_t v16 = (char *)((char *)v13 - (char *)&v15[1]);
    if (v13 != &v15[1]) {
      memmove(&v14[a3], &v15[1], (char *)v13 - (char *)&v15[1]);
    }
    self->_rects.__end_ = (CGRect *)&v16[(void)v15];
  }
  v18 = self->_positions.__begin_;
  v17 = self->_positions.__end_;
  if (a3 < v17 - v18)
  {
    v19 = &v18[a3];
    uint64_t v20 = (char *)((char *)v17 - (char *)&v19[1]);
    if (v17 != &v19[1]) {
      memmove(v19, &v19[1], (char *)v17 - (char *)&v19[1]);
    }
    self->_positions.__end_ = (CGPoint *)&v20[(void)v19];
  }
}

- (void)incrementCharIndexes:(int64_t)a3 startingAt:(unint64_t)a4
{
  begin = self->_charIndexes.__begin_;
  end = self->_charIndexes.__end_;
  while (begin != end)
  {
    if (*begin >= a4) {
      *begin += a3;
    }
    ++begin;
  }
  v6 = self->_attachmentPositions.__begin_;
  v7 = self->_attachmentPositions.__end_;
  while (v6 != v7)
  {
    if (*(void *)v6 >= a4) {
      *(void *)v6 += a3;
    }
    v6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v6 + 16);
  }
}

- (int)type
{
  return self->_type;
}

- (double)ascent
{
  return self->_ascent;
}

- (double)descent
{
  return self->_descent;
}

- (double)advance
{
  return self->_advance;
}

- (CGColor)color
{
  return self->_color;
}

- (void)setColor:(CGColor *)a3
{
}

- (__CTFont)font
{
  return self->_font;
}

- (void)setFont:(__CTFont *)a3
{
}

- (__CTFont)flippedFont
{
  return self->_flippedFont;
}

- (void)setFlippedFont:(__CTFont *)a3
{
}

- (int)location
{
  return self->_location;
}

- (void)setLocation:(int)a3
{
  self->_location = a3;
}

- (double)verticalAdjustment
{
  return self->_verticalAdjustment;
}

- (void)setVerticalAdjustment:(double)a3
{
  self->_verticalAdjustment = a3;
}

- (CGPoint)textPosition
{
  double x = self->_textPosition.x;
  double y = self->_textPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTextPosition:(CGPoint)a3
{
  self->_textPosition = a3;
}

- (BOOL)shouldRotate
{
  return self->_shouldRotate;
}

- (void)setShouldRotate:(BOOL)a3
{
  self->_shouldRotate = a3;
}

- (void).cxx_destruct
{
  begin = self->_attachmentPositions.__begin_;
  if (begin)
  {
    self->_attachmentPositions.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_rects.__begin_;
  if (v4)
  {
    self->_rects.__end_ = v4;
    operator delete(v4);
  }
  BOOL v5 = self->_flippedPositions.__begin_;
  if (v5)
  {
    self->_flippedPositions.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_positions.__begin_;
  if (v6)
  {
    self->_positions.__end_ = v6;
    operator delete(v6);
  }
  v7 = self->_flippedGlyphs.__begin_;
  if (v7)
  {
    self->_flippedGlyphs.__end_ = v7;
    operator delete(v7);
  }
  v8 = self->_glyphs.__begin_;
  if (v8)
  {
    self->_glyphs.__end_ = v8;
    operator delete(v8);
  }
  v9 = self->_charIndexes.__begin_;
  if (v9)
  {
    self->_charIndexes.__end_ = v9;
    operator delete(v9);
  }
}

- (id).cxx_construct
{
  *((void *)self + 21) = 0;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end