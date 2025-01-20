@interface RefittedFrame
- (BOOL)textFitsEntirely;
- (NSAttributedString)string;
- (RefittedFrame)initWithAttributedString:(id)a3 width:(double)a4 maximumNumberOfLines:(unint64_t)a5 minimumLineHeight:(double)a6;
- (_NSRange)fittedRange;
- (__CTFrame)CTFrame;
- (__CTFrame)newFrameFromFramesetter:(__CTFramesetter *)a3;
- (double)height;
- (double)width;
- (double)widthUsed;
- (id)getLayersForBounds:(CGRect)a3;
- (unint64_t)numberOfLines;
- (void)dealloc;
- (void)measureIfNeeded;
- (void)setString:(id)a3;
@end

@implementation RefittedFrame

- (RefittedFrame)initWithAttributedString:(id)a3 width:(double)a4 maximumNumberOfLines:(unint64_t)a5 minimumLineHeight:(double)a6
{
  id v10 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RefittedFrame;
  v11 = [(RefittedFrame *)&v13 init];
  if (v11)
  {
    if (!v10) {
      id v10 = [objc_alloc((Class)NSAttributedString) initWithString:&stru_101324E70];
    }
    [(RefittedFrame *)v11 setString:v10];
    v11->_width = a4;
    v11->_maximumNumberOfLines = a5;
    v11->_minimumLineHeight = a6;
  }

  return v11;
}

- (void)dealloc
{
  frame = self->_frame;
  if (frame) {
    CFRelease(frame);
  }
  v4.receiver = self;
  v4.super_class = (Class)RefittedFrame;
  [(RefittedFrame *)&v4 dealloc];
}

- (__CTFrame)CTFrame
{
  if (!self->_frame)
  {
    CFAttributedStringRef v3 = [(RefittedFrame *)self string];
    CTFramesetterRef v4 = CTFramesetterCreateWithAttributedString(v3);

    if (v4)
    {
      self->_frame = [(RefittedFrame *)self newFrameFromFramesetter:v4];
      CFRelease(v4);
    }
  }
  return self->_frame;
}

- (__CTFrame)newFrameFromFramesetter:(__CTFramesetter *)a3
{
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 0.0, 0.0, self->_width, 10000.0);
  id v4 = objc_claimAutoreleasedReturnValue();
  v5 = (const CGPath *)[v4 CGPath];
  v8.location = 0;
  v8.length = 0;
  Frame = CTFramesetterCreateFrame(a3, v8, v5, 0);

  return Frame;
}

- (void)measureIfNeeded
{
  if (!self->_measured)
  {
    CFAttributedStringRef v3 = [(RefittedFrame *)self CTFrame];
    CFArrayRef Lines = CTFrameGetLines(v3);
    self->_numberOfCFArrayRef Lines = CFArrayGetCount(Lines);
    self->_fittedRange = (_NSRange)CTFrameGetStringRange(v3);
    if (self->_numberOfLines)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v5 = CTFrameGetLines(v3);
      v6 = (char *)[v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6)
      {
        v7 = v6;
        CFRange v8 = 0;
        uint64_t v9 = *(void *)v20;
        double v10 = 0.0;
        double v11 = 0.0;
LABEL_5:
        uint64_t v12 = 0;
        objc_super v13 = &v8[(void)v7];
        while (1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v5);
          }
          if ((unint64_t)&v8[v12] >= self->_maximumNumberOfLines) {
            break;
          }
          v14 = *(const __CTLine **)(*((void *)&v19 + 1) + 8 * v12);
          CTLineGetDefaultBounds();
          double v15 = ceil(0.0 + 0.0 + 0.0);
          CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v14, 8uLL);
          double v16 = ceil(CGRectGetMaxX(BoundsWithOptions));
          if (v15 > v11) {
            double v11 = v15;
          }
          if (v16 > v10) {
            double v10 = v16;
          }
          if (v7 == (char *)++v12)
          {
            v7 = (char *)[v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
            CFRange v8 = v13;
            if (v7) {
              goto LABEL_5;
            }
            break;
          }
        }
      }
      else
      {
        double v10 = 0.0;
        double v11 = 0.0;
      }

      double minimumLineHeight = self->_minimumLineHeight;
      double v18 = ceil(v11);
      if (minimumLineHeight <= v18) {
        double minimumLineHeight = v18;
      }
      self->_maxLineHeight = minimumLineHeight;
      self->_maxLineWidth = ceil(v10);
    }
    self->_measured = 1;
  }
}

- (_NSRange)fittedRange
{
  [(RefittedFrame *)self measureIfNeeded];
  NSUInteger location = self->_fittedRange.location;
  NSUInteger length = self->_fittedRange.length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (double)height
{
  [(RefittedFrame *)self measureIfNeeded];
  numberOfCFArrayRef Lines = self->_numberOfLines;
  if (numberOfLines >= self->_maximumNumberOfLines) {
    numberOfCFArrayRef Lines = self->_maximumNumberOfLines;
  }
  if (numberOfLines) {
    return self->_maxLineHeight * (double)numberOfLines;
  }
  else {
    return 0.0;
  }
}

- (double)widthUsed
{
  return self->_maxLineWidth;
}

- (BOOL)textFitsEntirely
{
  return self->_numberOfLines <= self->_maximumNumberOfLines;
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (id)getLayersForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(RefittedFrame *)self measureIfNeeded];
  if (self->_numberOfLines >= self->_maximumNumberOfLines) {
    maximumNumberOfCFArrayRef Lines = self->_maximumNumberOfLines;
  }
  else {
    maximumNumberOfCFArrayRef Lines = self->_numberOfLines;
  }
  if (maximumNumberOfLines)
  {
    unint64_t v46 = maximumNumberOfLines;
    CFRange v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:");
    v45 = &v43;
    *(void *)&double v9 = __chkstk_darwin(v8).n128_u64[0];
    double v11 = (CGPoint *)(&v43 - 2 * v10);
    uint64_t v12 = [(RefittedFrame *)self CTFrame];
    v67.NSUInteger length = self->_numberOfLines;
    v67.CFIndex location = 0;
    CTFrameGetLineOrigins(v12, v67, v11);
    long long v64 = 0u;
    long long v63 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    v52 = self;
    objc_super v13 = CTFrameGetLines([(RefittedFrame *)self CTFrame]);
    id v14 = [v13 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v14)
    {
      id v15 = v14;
      unint64_t v47 = 0;
      uint64_t v16 = *(void *)v62;
      CFStringRef v49 = kCTRunDelegateAttributeName;
      double v17 = CGRectZero.origin.y;
      unint64_t v44 = 1 - v46;
      v51 = v8;
      v50 = v13;
      uint64_t v54 = v16;
LABEL_7:
      uint64_t v18 = 0;
      uint64_t v19 = v46 - v47;
      if (v46 < v47) {
        uint64_t v19 = 0;
      }
      uint64_t v57 = v19;
      uint64_t v56 = v44 + v47;
      id v53 = v15;
      while (1)
      {
        if (*(void *)v62 != v16) {
          objc_enumerationMutation(v13);
        }
        if (v57 == v18) {
          break;
        }
        long long v20 = *(const __CTLine **)(*((void *)&v61 + 1) + 8 * v18);
        if (v56 + v18)
        {
          BOOL v21 = 0;
        }
        else
        {
          long long v22 = CTLineGetGlyphRuns(*(CTLineRef *)(*((void *)&v61 + 1) + 8 * v18));
          id v23 = [v22 count];
          BOOL v21 = v23 != 0;
          if (v23)
          {
            id v24 = -[__CFDictionary mutableCopy](CTRunGetAttributes((CTRunRef)[v22 lastObject]), "mutableCopy");
            [v24 removeObjectForKey:v49];
            CFAttributedStringRef v55 = (CFAttributedStringRef)[objc_alloc((Class)NSAttributedString) initWithString:@"…" attributes:v24];
            v25 = CTLineCreateWithAttributedString(v55);
            CFIndex location = CTLineGetStringRange(v20).location;
            v27 = v52;
            v28 = [(RefittedFrame *)v52 string];
            v29 = [(RefittedFrame *)v27 string];
            [v28 attributedSubstringFromRange:location, [v29 length] - location];
            CFAttributedStringRef v30 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();

            v31 = CTLineCreateWithAttributedString(v30);
            CTLineRef TruncatedLine = CTLineCreateTruncatedLine(v31, v27->_width, kCTLineTruncationEnd, v25);
            if (TruncatedLine)
            {
              v33 = TruncatedLine;
              CFRelease(v25);
              v25 = v33;
            }
            else
            {
              v69.origin.CGFloat x = x;
              v69.origin.CGFloat y = y;
              v69.size.CGFloat width = width;
              v69.size.CGFloat height = height;
              v34 = NSStringFromCGRect(v69);
              NSLog(@"We have been asked to draw instruction labels but there wasn't space to draw the truncated last line in the provided rectangle (%@). Will draw just the ellipsis instead.", v34);
            }
            CFRange v8 = v51;
            CFRelease(v31);

            long long v20 = v25;
            objc_super v13 = v50;
            id v15 = v53;
          }

          uint64_t v16 = v54;
        }
        CGFloat ascent = 0.0;
        CGFloat descent = 0.0;
        CGFloat leading = 0.0;
        CTLineGetTypographicBounds(v20, &ascent, &descent, &leading);
        CGFloat v35 = ceil(ascent + descent + leading);
        CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v20, 8uLL);
        CGFloat v36 = ceil(CGRectGetMaxX(BoundsWithOptions));
        CGFloat v37 = descent + leading;
        v68.CGFloat width = v36;
        v68.CGFloat height = v35;
        UIGraphicsBeginImageContextWithOptions(v68, 0, 0.0);
        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextScaleCTM(CurrentContext, 1.0, -1.0);
        CGContextTranslateCTM(CurrentContext, 0.0, -v35);
        CGContextSetTextPosition(CurrentContext, 0.0, v37);
        CTLineDraw(v20, CurrentContext);
        v39 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        v40 = +[CALayer layer];
        [v40 setFrame:CGRectZero.origin.x, v17, v36, v35];
        id v41 = v39;
        [v40 setContents:[v41 CGImage]];
        [v8 addObject:v40];
        if (v21) {
          CFRelease(v20);
        }

        if (v15 == (id)++v18)
        {
          id v15 = [v13 countByEnumeratingWithState:&v61 objects:v65 count:16];
          v47 += v18;
          if (v15) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
  }
  else
  {
    CFRange v8 = 0;
  }

  return v8;
}

- (double)width
{
  return self->_width;
}

- (NSAttributedString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end