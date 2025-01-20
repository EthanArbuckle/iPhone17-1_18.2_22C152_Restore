@interface _UIVectorTextLayout
- (BOOL)hasLayout;
- (CGAffineTransform)coordinateAdjustment;
- (CGRect)boundingRect;
- (CGRect)usedBoundingRect;
- (CGSize)size;
- (_NSRange)textRange;
- (_UIVectorTextLayout)initWithTextParameters:(id)a3;
- (_UIVectorTextLayoutParameters)parameters;
- (double)firstLineBaseline;
- (double)lastLineBaseline;
- (id)description;
- (id)layoutDescription;
- (unint64_t)numberOfLines;
- (unint64_t)numberOfRuns;
- (void)_layoutIfNeeded;
- (void)enumerateRunsUsingBlock:(id)a3;
- (void)resetLayout;
@end

@implementation _UIVectorTextLayout

- (_UIVectorTextLayout)initWithTextParameters:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIVectorTextLayout;
  v5 = [(_UIVectorTextLayout *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    layoutInfo = v5->_layoutInfo;
    v5->_layoutInfo = (_UIVectorTextLayoutInfo *)v6;

    v8 = [[_UIVectorTextLayoutParameters alloc] initWithParameters:v4];
    [(_UIVectorTextLayoutInfo *)v5->_layoutInfo setParameters:v8];
  }
  return v5;
}

- (_UIVectorTextLayoutParameters)parameters
{
  return [(_UIVectorTextLayoutInfo *)self->_layoutInfo parameters];
}

- (BOOL)hasLayout
{
  return self->_runs != 0;
}

- (void)resetLayout
{
  runs = self->_runs;
  self->_runs = 0;
}

- (CGRect)boundingRect
{
  [(_UIVectorTextLayout *)self _layoutIfNeeded];
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)usedBoundingRect
{
  [(_UIVectorTextLayout *)self _layoutIfNeeded];
  double x = self->_usedBoundingRect.origin.x;
  double y = self->_usedBoundingRect.origin.y;
  double width = self->_usedBoundingRect.size.width;
  double height = self->_usedBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (unint64_t)numberOfRuns
{
  [(_UIVectorTextLayout *)self _layoutIfNeeded];
  runs = self->_runs;
  return [(NSArray *)runs count];
}

- (CGSize)size
{
  [(_UIVectorTextLayout *)self _layoutIfNeeded];
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (_NSRange)textRange
{
  [(_UIVectorTextLayout *)self _layoutIfNeeded];
  NSUInteger location = self->_fitRange.location;
  NSUInteger length = self->_fitRange.length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (double)firstLineBaseline
{
  return self->_firstLineBaseline;
}

- (double)lastLineBaseline
{
  return self->_lastLineBaseline;
}

- (void)enumerateRunsUsingBlock:(id)a3
{
  id v4 = a3;
  [(_UIVectorTextLayout *)self _layoutIfNeeded];
  runs = self->_runs;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47___UIVectorTextLayout_enumerateRunsUsingBlock___block_invoke;
  v7[3] = &unk_1E530F158;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)runs enumerateObjectsUsingBlock:v7];
}

- (id)description
{
  BOOL v3 = [(_UIVectorTextLayout *)self hasLayout];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(_UIVectorTextLayoutInfo *)self->_layoutInfo parameters];
  v7 = (void *)v6;
  if (v3) {
    [v4 stringWithFormat:@"<%@:%p params=%@ layout=(%fx%f, %ld lines, %ld runs)>", v5, self, v6, *(void *)&self->_boundingRect.size.width, *(void *)&self->_boundingRect.size.height, self->_numberOfLines, -[NSArray count](self->_runs, "count")];
  }
  else {
  id v8 = [v4 stringWithFormat:@"<%@:%p params=%@ layout=?>", v5, self, v6, v10, v11, v12, v13];
  }

  return v8;
}

- (id)layoutDescription
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  [(_UIVectorTextLayout *)self _layoutIfNeeded];
  id v4 = objc_opt_new();
  [v4 appendString:@"Parameters:\n"];
  uint64_t v5 = [(_UIVectorTextLayoutInfo *)self->_layoutInfo parameters];
  uint64_t v6 = [v5 attributedText];
  [v4 appendFormat:@"- text: %@\n", v6];

  v7 = [(_UIVectorTextLayoutInfo *)self->_layoutInfo parameters];
  [v7 withinSize];
  double v9 = v8;
  if (v8 >= 1.79769313e308)
  {
    uint64_t v11 = @"(max)";
  }
  else
  {
    uint64_t v10 = NSNumber;
    v2 = [(_UIVectorTextLayoutInfo *)self->_layoutInfo parameters];
    [v2 withinSize];
    objc_msgSend(v10, "numberWithDouble:");
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v12 = [(_UIVectorTextLayoutInfo *)self->_layoutInfo parameters];
  [v12 withinSize];
  if (v13 >= 1.79769313e308)
  {
    [v4 appendFormat:@"- withinSize: {%@,%@}\n", v11, @"(max)"];
  }
  else
  {
    v14 = NSNumber;
    v15 = [(_UIVectorTextLayoutInfo *)self->_layoutInfo parameters];
    [v15 withinSize];
    v17 = [v14 numberWithDouble:v16];
    [v4 appendFormat:@"- withinSize: {%@,%@}\n", v11, v17];
  }
  if (v9 < 1.79769313e308)
  {
  }
  v18 = [(_UIVectorTextLayoutInfo *)self->_layoutInfo parameters];
  objc_msgSend(v4, "appendFormat:", @"- numberOfLines: %ld\n", objc_msgSend(v18, "numberOfLines"));

  v19 = [(_UIVectorTextLayoutInfo *)self->_layoutInfo parameters];
  v20 = [v19 traitCollection];
  [v4 appendFormat:@"- traitCollection: %@\n", v20];

  [v4 appendString:@"\n"];
  if ([(_UIVectorTextLayout *)self hasLayout])
  {
    [v4 appendString:@"Layout:\n"];
    objc_msgSend(v4, "appendFormat:", @"- size: {%f,%f}\n", *(void *)&self->_boundingRect.size.width, *(void *)&self->_boundingRect.size.height);
    v21 = NSStringFromCGRect(self->_boundingRect);
    [v4 appendFormat:@"- bounding rect: %@\n", v21];

    v22 = NSStringFromCGRect(self->_usedBoundingRect);
    [v4 appendFormat:@"- used bounding rect: %@\n", v22];

    objc_msgSend(v4, "appendFormat:", @"- first line baseline: %f\n", *(void *)&self->_firstLineBaseline);
    objc_msgSend(v4, "appendFormat:", @"- last line baseline: %f\n", *(void *)&self->_lastLineBaseline);
    objc_msgSend(v4, "appendFormat:", @"- lines (%ld):\n", self->_numberOfLines);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v40 = self;
    obj = self->_runs;
    uint64_t v41 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v41)
    {
      uint64_t v42 = 0;
      uint64_t v43 = -1;
      uint64_t v39 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v50 != v39) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          if ([v24 lineIndex] != v43)
          {
            uint64_t v25 = [v24 lineIndex];
            [v24 lineRect];
            v26 = NSStringFromCGRect(v56);
            [v24 usedLineRect];
            v27 = NSStringFromCGRect(v57);
            uint64_t v43 = v25;
            [v4 appendFormat:@"  > Line %ld: rect=%@ usedRect=%@\n", v25, v26, v27];
          }
          uint64_t v44 = [v24 stringRange];
          uint64_t v29 = v28;
          uint64_t v48 = [v24 glyphCount];
          id v30 = v24;
          CFIndex GlyphCount = CTRunGetGlyphCount((CTRunRef)[v30 _CTRun]);
          [v30 usedRunRect];
          v45 = NSStringFromCGRect(v58);
          v47 = [(_UIVectorTextLayoutInfo *)v40->_layoutInfo parameters];
          v31 = [v47 attributedText];
          v32 = [v31 string];
          v33 = objc_msgSend(v32, "substringWithRange:", v44, v29);
          v34 = [v33 stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"];
          v35 = [v34 stringByReplacingOccurrencesOfString:@"\r" withString:@"\\r"];
          v36 = [v35 stringByReplacingOccurrencesOfString:@"\t" withString:@"\\t"];

          [v4 appendFormat:@"    [Run %ld: glyphCount=%ld/%ld usedRect=%@ string={%ld,%ld} \"%@\" (ref=%p)]\n", v42 + i, v48, GlyphCount, v45, v44, v29, v36, objc_msgSend(objc_retainAutorelease(v30), "_CTRun")];
        }
        uint64_t v41 = [(NSArray *)obj countByEnumeratingWithState:&v49 objects:v53 count:16];
        v42 += i;
      }
      while (v41);
    }
  }
  else
  {
    [v4 appendString:@"Layout: *not layouted*\n"];
  }
  return v4;
}

- (void)_layoutIfNeeded
{
  v112[16] = *MEMORY[0x1E4F143B8];
  if (!self->_runs)
  {
    p_layoutInfo = &self->_layoutInfo;
    [(_UIVectorTextLayoutInfo *)self->_layoutInfo scale];
    double v84 = v4;
    uint64_t v5 = [(_UIVectorTextLayout *)self parameters];
    uint64_t v79 = [v5 numberOfLines];

    if (![(_UIVectorTextLayoutInfo *)*p_layoutInfo frame])
    {
      uint64_t v6 = [(_UIVectorTextLayout *)self parameters];
      v7 = [v6 attributedText];

      CFIndex v8 = [v7 length];
      CTFramesetterRef v9 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)v7);
      uint64_t v10 = (const __CTFramesetter *)CFAutorelease(v9);
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = [(_UIVectorTextLayout *)self parameters];
        [v12 withinSize];
        v113.NSUInteger location = 0;
        v113.NSUInteger length = v8;
        CGSize v13 = CTFramesetterSuggestFrameSizeWithConstraints(v11, v113, 0, v117, 0);

        UICeilToScale(v13.width, v84);
        CGFloat v15 = v14;
        UICeilToScale(v13.height, v84);
        CGFloat v17 = v16;
        v118.origin.double x = 0.0;
        v118.origin.double y = 0.0;
        v118.size.double width = v15;
        v118.size.double height = v17;
        CGPathRef v18 = CGPathCreateWithRect(v118, 0);
        v19 = (const CGPath *)CFAutorelease(v18);
        v114.NSUInteger location = 0;
        v114.NSUInteger length = v8;
        CTFrameRef Frame = CTFramesetterCreateFrame(v11, v114, v19, 0);
        CFTypeRef v21 = CFAutorelease(Frame);
        if (v21) {
          [(_UIVectorTextLayoutInfo *)self->_layoutInfo setFrame:v21];
        }
        v109[1] = 0;
        v109[2] = 0;
        layoutInfo = self->_layoutInfo;
        v109[0] = 0x3FF0000000000000;
        long long v110 = xmmword_186B9C3F0;
        CGFloat v111 = v17;
        [(_UIVectorTextLayoutInfo *)layoutInfo setCoordinateAdjustment:v109];
      }
      else
      {
        v23 = self->_layoutInfo;
        long long v24 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v108[0] = *MEMORY[0x1E4F1DAB8];
        v108[1] = v24;
        v108[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        [(_UIVectorTextLayoutInfo *)v23 setCoordinateAdjustment:v108];
      }
    }
    uint64_t v25 = MEMORY[0x1E4F1DB28];
    self->_firstLineBaseline = 0.0;
    CGPoint v26 = *(CGPoint *)v25;
    CGSize v27 = *(CGSize *)(v25 + 16);
    self->_boundingRect.origin = *(CGPoint *)v25;
    self->_boundingRect.size = v27;
    self->_fitRange.NSUInteger location = 0;
    self->_fitRange.NSUInteger length = 0;
    self->_usedBoundingRect.origin = v26;
    self->_usedBoundingRect.size = v27;
    self->_lastLineBaseline = 0.0;
    p_firstLineBaseline = &self->_firstLineBaseline;
    if ([(_UIVectorTextLayoutInfo *)self->_layoutInfo frame])
    {
      CFArrayRef Lines = CTFrameGetLines([(_UIVectorTextLayoutInfo *)self->_layoutInfo frame]);
      CFIndex Count = CFArrayGetCount(Lines);
      v82 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
      uint64_t v77 = (uint64_t)&v77;
      double v28 = MEMORY[0x1F4188790](v82);
      v80 = (CGPoint *)(&v77 - 2 * v29);
      id v30 = [(_UIVectorTextLayoutInfo *)self->_layoutInfo frame];
      v115.NSUInteger location = 0;
      v115.NSUInteger length = 0;
      CTFrameGetLineOrigins(v30, v115, v80);
      if (Count < 1)
      {
        int64_t v31 = 0;
      }
      else
      {
        int64_t v31 = 0;
        v88 = v94;
        uint64_t v87 = 0x4010000000;
        v32 = (long long *)MEMORY[0x1E4F1DB20];
        uint64_t v86 = 3221225472;
        while (!v79 || v31 < v79)
        {
          ValueAtIndedouble x = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v31);
          CGFloat v106 = 0.0;
          CGFloat v107 = 0.0;
          CGFloat v105 = 0.0;
          double TypographicBounds = CTLineGetTypographicBounds(ValueAtIndex, &v107, &v106, &v105);
          v35 = &v80[v31];
          double x = v35->x;
          double y = v35->y;
          double v38 = UIRectIntegralWithScale(v35->x, y - v106, TypographicBounds, v107 + v106 + v105, v84);
          CGFloat v40 = v39;
          CGFloat v42 = v41;
          CGFloat v44 = v43;
          v45 = self->_layoutInfo;
          if (v45) {
            [(_UIVectorTextLayoutInfo *)v45 coordinateAdjustment];
          }
          else {
            memset(&v104, 0, sizeof(v104));
          }
          v119.origin.double x = v38;
          v119.origin.double y = v40;
          v119.size.double width = v42;
          v119.size.double height = v44;
          CGRect v120 = CGRectApplyAffineTransform(v119, &v104);
          v125.origin.double x = v120.origin.x;
          double v46 = v120.origin.y;
          double width = v120.size.width;
          double height = v120.size.height;
          CGRect boundingRect = self->_boundingRect;
          CGFloat v85 = v125.origin.x;
          v125.origin.double y = v46;
          v125.size.double width = width;
          v125.size.double height = height;
          CGRect v122 = CGRectUnion(boundingRect, v125);
          self->_boundingRect.size.double width = v122.size.width;
          self->_boundingRect.size.double height = v122.size.height;
          double v49 = UIPointRoundToScale(x, y, v84);
          double v51 = v50;
          long long v52 = self->_layoutInfo;
          if (v52)
          {
            [(_UIVectorTextLayoutInfo *)v52 coordinateAdjustment];
            double v53 = *((double *)&v101 + 1);
            double v54 = *((double *)&v102 + 1);
            double v55 = *((double *)&v103 + 1);
          }
          else
          {
            long long v102 = 0u;
            long long v103 = 0u;
            double v55 = 0.0;
            double v54 = 0.0;
            double v53 = 0.0;
            long long v101 = 0u;
          }
          double v56 = v55 + v51 * v54 + v49 * v53;
          if (!v31) {
            double *p_firstLineBaseline = v56;
          }
          double v57 = v56;
          self->_lastLineBaseline = v56;
          CFArrayRef GlyphRuns = CTLineGetGlyphRuns(ValueAtIndex);
          CFIndex v59 = CFArrayGetCount(GlyphRuns);
          v60 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v59];
          if (v59 < 1)
          {
            double v65 = height;
            double v64 = width;
            double v63 = v46;
            double v62 = v85;
          }
          else
          {
            CFIndex v61 = 0;
            double v62 = v85;
            double v63 = v46;
            double v64 = width;
            double v65 = height;
            do
            {
              v66 = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v61);
              if (CTRunGetGlyphCount(v66) >= 1)
              {
                v67 = [[_UIVectorTextLayoutRun alloc] initWithCTRun:v66 lineIndex:v31 layoutInfo:self->_layoutInfo];
                uint64_t v95 = 0;
                v96 = (CGRect *)&v95;
                uint64_t v97 = v87;
                v98 = &unk_186D7DBA7;
                long long v68 = v32[1];
                long long v99 = *v32;
                long long v100 = v68;
                v93[0] = MEMORY[0x1E4F143A8];
                v93[1] = v86;
                v94[0] = __38___UIVectorTextLayout__layoutIfNeeded__block_invoke;
                v94[1] = &unk_1E530F180;
                v94[2] = &v95;
                [(_UIVectorTextLayoutRun *)v67 _enumerateGlyphsUsingBlock:v93];
                if (!CGRectIsEmpty(v96[1]))
                {
                  [(_UIVectorTextLayoutRun *)v67 setBaseline:v57];
                  -[_UIVectorTextLayoutRun setLineRect:](v67, "setLineRect:", v85, v46, width, height);
                  -[_UIVectorTextLayoutRun setUsedRunRect:](v67, "setUsedRunRect:", v96[1].origin.x, v96[1].origin.y, v96[1].size.width, v96[1].size.height);
                  [v60 addObject:v67];
                  v116.NSUInteger location = [(_UIVectorTextLayoutRun *)v67 stringRange];
                  v116.NSUInteger length = v69;
                  self->_fitRange = NSUnionRange(self->_fitRange, v116);
                  v123.origin.double x = v62;
                  v123.origin.double y = v63;
                  v123.size.double width = v64;
                  v123.size.double height = v65;
                  CGRect v124 = CGRectUnion(v123, v96[1]);
                  double v62 = v124.origin.x;
                  double v63 = v124.origin.y;
                  double v64 = v124.size.width;
                  double v65 = v124.size.height;
                  self->_usedBoundingRect = CGRectUnion(self->_usedBoundingRect, v96[1]);
                }
                _Block_object_dispose(&v95, 8);
              }
              ++v61;
            }
            while (v59 != v61);
          }
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          id v70 = v60;
          uint64_t v71 = [v70 countByEnumeratingWithState:&v89 objects:v112 count:16];
          if (v71)
          {
            uint64_t v72 = *(void *)v90;
            do
            {
              for (uint64_t i = 0; i != v71; ++i)
              {
                if (*(void *)v90 != v72) {
                  objc_enumerationMutation(v70);
                }
                objc_msgSend(*(id *)(*((void *)&v89 + 1) + 8 * i), "setUsedLineRect:", v62, v63, v64, v65);
              }
              uint64_t v71 = [v70 countByEnumeratingWithState:&v89 objects:v112 count:16];
            }
            while (v71);
          }

          [(NSArray *)v82 addObjectsFromArray:v70];
          if (++v31 == Count)
          {
            int64_t v31 = Count;
            break;
          }
        }
      }
      v75 = (NSArray *)[(NSArray *)v82 copy];
      runs = self->_runs;
      self->_runs = v75;

      v74 = v82;
    }
    else
    {
      int64_t v31 = 0;
      v74 = self->_runs;
      self->_runs = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    self->_usedBoundingRect = CGRectUnion(self->_boundingRect, self->_usedBoundingRect);
    self->_numberOfCFArrayRef Lines = v31;
  }
}

- (CGAffineTransform)coordinateAdjustment
{
  long long v3 = *(_OWORD *)&self[3].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].c;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_storeStrong((id *)&self->_runs, 0);
}

@end