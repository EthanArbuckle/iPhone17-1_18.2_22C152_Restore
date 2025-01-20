@interface ICAttributedStringRippler
+ (BOOL)canAnimateString:(id)a3;
+ (double)refreshInterval;
+ (unint64_t)framesPerSecond;
- (BOOL)finishedForTimeIndex:(unint64_t)a3;
- (BOOL)reduceMotion;
- (ICAttributedStringRippler)initWithAttributedString:(id)a3 animatedRange:(_NSRange)a4;
- (NSArray)colors;
- (NSArray)scales;
- (NSArray)shadowColors;
- (NSAttributedString)string;
- (UIFont)initialFont;
- (_NSRange)animatedRange;
- (double)currentScaleForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5;
- (double)initialFontSize;
- (double)startTime;
- (id)attributedStringForTimeIndex:(unint64_t)a3;
- (id)currentColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5;
- (id)currentShadowColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5;
- (unint64_t)animateFrames;
- (unint64_t)currentIndexForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5 isFinished:(BOOL *)a6;
- (unint64_t)currentTimeIndex;
- (unint64_t)delayFrames;
- (unint64_t)finishedTimeIndex;
- (unint64_t)postFrames;
- (unint64_t)preFrames;
- (void)generateValues;
- (void)setAnimateFrames:(unint64_t)a3;
- (void)setAnimatedRange:(_NSRange)a3;
- (void)setColors:(id)a3;
- (void)setDelayFrames:(unint64_t)a3;
- (void)setInitialFont:(id)a3;
- (void)setInitialFontSize:(double)a3;
- (void)setPostFrames:(unint64_t)a3;
- (void)setPreFrames:(unint64_t)a3;
- (void)setReduceMotion:(BOOL)a3;
- (void)setScales:(id)a3;
- (void)setShadowColors:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setString:(id)a3;
- (void)start;
@end

@implementation ICAttributedStringRippler

- (ICAttributedStringRippler)initWithAttributedString:(id)a3 animatedRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICAttributedStringRippler;
  v8 = [(ICAttributedStringRippler *)&v13 init];
  v9 = v8;
  if (v8)
  {
    [(ICAttributedStringRippler *)v8 setString:v7];
    -[ICAttributedStringRippler setAnimatedRange:](v9, "setAnimatedRange:", location, length);
    [(ICAttributedStringRippler *)v9 setPreFrames:0];
    [(ICAttributedStringRippler *)v9 setAnimateFrames:60];
    [(ICAttributedStringRippler *)v9 setPostFrames:10];
    [(ICAttributedStringRippler *)v9 setDelayFrames:3];
    v10 = [v7 attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];
    [(ICAttributedStringRippler *)v9 setInitialFont:v10];

    v11 = [(ICAttributedStringRippler *)v9 initialFont];
    [v11 pointSize];
    -[ICAttributedStringRippler setInitialFontSize:](v9, "setInitialFontSize:");

    [(ICAttributedStringRippler *)v9 generateValues];
    [(ICAttributedStringRippler *)v9 start];
  }

  return v9;
}

+ (BOOL)canAnimateString:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  v5 = objc_msgSend(v3, "ic_animatableTokenCharacterSet");
  v6 = [v5 invertedSet];
  uint64_t v7 = [v4 rangeOfCharacterFromSet:v6];

  return v7 == 0x7FFFFFFFFFFFFFFFLL;
}

+ (double)refreshInterval
{
  return 1.0 / (double)(unint64_t)[a1 framesPerSecond];
}

+ (unint64_t)framesPerSecond
{
  return 60;
}

- (void)generateValues
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v66 = [MEMORY[0x1E4F1CA48] array];
  id v65 = [MEMORY[0x1E4F1CA48] array];
  id v64 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v3 = [(ICAttributedStringRippler *)self preFrames];
  unint64_t v4 = [(ICAttributedStringRippler *)self animateFrames] + v3;
  unint64_t v5 = [(ICAttributedStringRippler *)self postFrames];
  uint64_t v60 = (uint64_t)&v60;
  unint64_t v67 = v4 + v5;
  size_t v6 = 8 * (v4 + v5);
  uint64_t v7 = MEMORY[0x1F4188790](v5);
  v8 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x1F4188790](v7);
  v11 = (char *)&v60 - v10;
  MEMORY[0x1F4188790](v9);
  objc_super v13 = (char *)&v60 - v12;
  v14 = (void *)MEMORY[0x1E4F1CA48];
  v15 = [(ICAttributedStringRippler *)self string];
  v16 = objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "length"));

  unint64_t v17 = [(ICAttributedStringRippler *)self animatedRange];
  uint64_t v18 = [(ICAttributedStringRippler *)self animatedRange];
  if (v17 < v18 + v19)
  {
    uint64_t v20 = *MEMORY[0x1E4FB0700];
    do
    {
      v21 = [(ICAttributedStringRippler *)self string];
      v22 = [v21 attribute:v20 atIndex:v17 effectiveRange:0];

      [v16 addObject:v22];
      ++v17;
      uint64_t v23 = [(ICAttributedStringRippler *)self animatedRange];
    }
    while (v17 < v23 + v24);
  }
  if (v67)
  {
    bzero(v8, v6);
    bzero(v13, v6);
    memset_pattern16(v11, &unk_1B0B98B10, v6);
  }
  id v63 = v16;
  unint64_t v25 = [(ICAttributedStringRippler *)self preFrames];
  unint64_t v26 = [(ICAttributedStringRippler *)self preFrames];
  if (v25 < [(ICAttributedStringRippler *)self animateFrames] + v26)
  {
    do
    {
      double v27 = (double)(v25 - [(ICAttributedStringRippler *)self preFrames]);
      double v28 = v27 / (double)[(ICAttributedStringRippler *)self animateFrames];
      double v29 = exp(v28 * -4.0);
      __double2 v30 = __sincos_stret(v28 * 13.6);
      double v31 = 1.0 - v29 * (v30.__cosval + v30.__sinval * 0.3);
      *(double *)&v13[8 * v25] = v31;
      *(double *)&v8[8 * v25] = v31;
      *(double *)&v11[8 * v25++] = v29 * 0.3 * v30.__sinval + 1.0;
      unint64_t v32 = [(ICAttributedStringRippler *)self preFrames];
    }
    while (v25 < [(ICAttributedStringRippler *)self animateFrames] + v32);
  }
  unint64_t v33 = [(ICAttributedStringRippler *)self preFrames];
  unint64_t v34 = [(ICAttributedStringRippler *)self animateFrames] + v33;
  unint64_t v35 = [(ICAttributedStringRippler *)self preFrames];
  unint64_t v36 = [(ICAttributedStringRippler *)self animateFrames] + v35;
  if (v34 < v36 + [(ICAttributedStringRippler *)self postFrames])
  {
    do
    {
      *(void *)&v8[8 * v34] = 0x3FF0000000000000;
      *(void *)&v13[8 * v34] = 0x3FF0000000000000;
      *(void *)&v11[8 * v34++] = 0x3FF0000000000000;
      unint64_t v37 = [(ICAttributedStringRippler *)self preFrames];
      unint64_t v38 = [(ICAttributedStringRippler *)self animateFrames] + v37;
    }
    while (v34 < v38 + [(ICAttributedStringRippler *)self postFrames]);
  }
  v62 = v11;
  v61 = self;
  if (v67)
  {
    v39 = v13;
    for (uint64_t i = 0; i != v67; ++i)
    {
      v41 = [MEMORY[0x1E4F1CA48] array];
      v42 = [MEMORY[0x1E4F1CA48] array];
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v68 = v63;
      uint64_t v43 = [v68 countByEnumeratingWithState:&v72 objects:v76 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v73;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v73 != v45) {
              objc_enumerationMutation(v68);
            }
            v47 = *(void **)(*((void *)&v72 + 1) + 8 * j);
            double v71 = 0.0;
            double v70 = 0.0;
            double v69 = 0.0;
            [v47 getRed:&v71 green:&v70 blue:&v69 alpha:0];
            double v48 = *(double *)&v8[8 * i];
            double v49 = v48 * v71;
            double v50 = v48 * v70;
            double v51 = v48 * v69;
            v52 = [MEMORY[0x1E4FB1618] colorWithRed:v48 * v71 green:v48 * v70 blue:v48 * v69 alpha:1.0];
            [v41 addObject:v52];

            v53 = [MEMORY[0x1E4FB1618] colorWithRed:v49 green:v50 blue:v51 alpha:*(double *)&v39[8 * i]];
            [v42 addObject:v53];
          }
          uint64_t v44 = [v68 countByEnumeratingWithState:&v72 objects:v76 count:16];
        }
        while (v44);
      }

      [v66 addObject:v41];
      [v65 addObject:v42];
      v54 = [NSNumber numberWithDouble:*(double *)&v62[8 * i]];
      [v64 addObject:v54];
    }
  }
  v55 = v61;
  id v56 = v66;
  [(ICAttributedStringRippler *)v61 setColors:v66];
  id v57 = v65;
  [(ICAttributedStringRippler *)v55 setShadowColors:v65];
  v58 = v55;
  id v59 = v64;
  [(ICAttributedStringRippler *)v58 setScales:v64];
}

- (void)start
{
  [(ICAttributedStringRippler *)self setStartTime:CFAbsoluteTimeGetCurrent()];
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  [(ICAttributedStringRippler *)self setReduceMotion:IsReduceMotionEnabled];
}

- (unint64_t)currentTimeIndex
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(ICAttributedStringRippler *)self startTime];
  return (unint64_t)((Current - v4) * 60.0);
}

- (unint64_t)finishedTimeIndex
{
  unint64_t v3 = [(ICAttributedStringRippler *)self preFrames];
  unint64_t v4 = [(ICAttributedStringRippler *)self animateFrames] + v3;
  return v4 + [(ICAttributedStringRippler *)self postFrames];
}

- (unint64_t)currentIndexForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5 isFinished:(BOOL *)a6
{
  unint64_t v11 = [(ICAttributedStringRippler *)self preFrames];
  unint64_t v12 = [(ICAttributedStringRippler *)self animateFrames] + v11;
  unint64_t v13 = v12 + [(ICAttributedStringRippler *)self postFrames];
  unint64_t v14 = a5 % (2 * (v13 + [(ICAttributedStringRippler *)self delayFrames] * a4));
  unint64_t v15 = a3 + 1;
  if (v14 >= [(ICAttributedStringRippler *)self delayFrames] * (a3 + 1)
    && v14 < v13 + [(ICAttributedStringRippler *)self delayFrames] * v15)
  {
    unint64_t v16 = [(ICAttributedStringRippler *)self delayFrames];
    BOOL v17 = 0;
    unint64_t result = v14 - v16 * v15;
    if (!a6) {
      return result;
    }
LABEL_9:
    *a6 = v17;
    return result;
  }
  unint64_t v19 = [(ICAttributedStringRippler *)self delayFrames];
  BOOL v17 = v14 >= v19 * v15;
  if (v14 < v19 * v15) {
    unint64_t result = 0;
  }
  else {
    unint64_t result = v13 - 1;
  }
  if (a6) {
    goto LABEL_9;
  }
  return result;
}

- (id)currentColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  uint64_t v9 = [(ICAttributedStringRippler *)self colors];
  uint64_t v10 = objc_msgSend(v9, "objectAtIndex:", -[ICAttributedStringRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
  unint64_t v11 = [v10 objectAtIndex:a3];

  return v11;
}

- (id)currentShadowColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  uint64_t v9 = [(ICAttributedStringRippler *)self shadowColors];
  uint64_t v10 = objc_msgSend(v9, "objectAtIndex:", -[ICAttributedStringRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
  unint64_t v11 = [v10 objectAtIndex:a3];

  return v11;
}

- (double)currentScaleForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  if ([(ICAttributedStringRippler *)self reduceMotion]) {
    return 1.0;
  }
  uint64_t v10 = [(ICAttributedStringRippler *)self scales];
  unint64_t v11 = objc_msgSend(v10, "objectAtIndex:", -[ICAttributedStringRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));
  [v11 doubleValue];
  double v13 = v12;

  return v13;
}

- (id)attributedStringForTimeIndex:(unint64_t)a3
{
  uint64_t v13 = 0;
  unint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  unint64_t v16 = __Block_byref_object_copy__42;
  BOOL v17 = __Block_byref_object_dispose__42;
  unint64_t v5 = [(ICAttributedStringRippler *)self string];
  id v18 = (id)[v5 mutableCopy];

  size_t v6 = [(ICAttributedStringRippler *)self string];
  uint64_t v7 = [v6 string];
  uint64_t v8 = [(ICAttributedStringRippler *)self animatedRange];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__ICAttributedStringRippler_attributedStringForTimeIndex___block_invoke;
  v12[3] = &unk_1E5FDBC78;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = a3;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", v8, v9, 2, v12);

  uint64_t v10 = (void *)[(id)v14[5] copy];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __58__ICAttributedStringRippler_attributedStringForTimeIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a3 - [*(id *)(a1 + 32) animatedRange];
  uint64_t v8 = *(void **)(a1 + 32);
  [v8 animatedRange];
  id v21 = [v8 currentColorForGlyphIndex:v7 numberOfGlyphs:v9 timeIndex:*(void *)(a1 + 48)];
  uint64_t v10 = *(void **)(a1 + 32);
  [v10 animatedRange];
  [v10 currentScaleForGlyphIndex:v7 numberOfGlyphs:v11 timeIndex:*(void *)(a1 + 48)];
  double v13 = v12;
  [*(id *)(a1 + 32) initialFontSize];
  double v15 = v13 * v14;
  unint64_t v16 = (void *)MEMORY[0x1E4FB08E0];
  BOOL v17 = [*(id *)(a1 + 32) initialFont];
  id v18 = [v17 fontDescriptor];
  unint64_t v19 = [v16 fontWithDescriptor:v18 size:v15];

  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  objc_msgSend(v20, "ic_setNonNilObject:forKey:", v21, *MEMORY[0x1E4FB0700]);
  objc_msgSend(v20, "ic_setNonNilObject:forKey:", 0, *MEMORY[0x1E4FB0758]);
  objc_msgSend(v20, "ic_setNonNilObject:forKey:", v19, *MEMORY[0x1E4FB06F8]);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setAttributes:range:", v20, a3, a4);
}

- (BOOL)finishedForTimeIndex:(unint64_t)a3
{
  BOOL v10 = 0;
  uint64_t v5 = [(ICAttributedStringRippler *)self animatedRange];
  uint64_t v7 = v5 + v6;
  [(ICAttributedStringRippler *)self animatedRange];
  [(ICAttributedStringRippler *)self currentIndexForGlyphIndex:v7 numberOfGlyphs:v8 timeIndex:a3 isFinished:&v10];
  return v10;
}

- (NSAttributedString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (_NSRange)animatedRange
{
  NSUInteger length = self->_animatedRange.length;
  NSUInteger location = self->_animatedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setAnimatedRange:(_NSRange)a3
{
  self->_animatedRange = a3;
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
}

- (NSArray)shadowColors
{
  return self->_shadowColors;
}

- (void)setShadowColors:(id)a3
{
}

- (NSArray)scales
{
  return self->_scales;
}

- (void)setScales:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (unint64_t)preFrames
{
  return self->_preFrames;
}

- (void)setPreFrames:(unint64_t)a3
{
  self->_preFrames = a3;
}

- (unint64_t)animateFrames
{
  return self->_animateFrames;
}

- (void)setAnimateFrames:(unint64_t)a3
{
  self->_animateFrames = a3;
}

- (unint64_t)postFrames
{
  return self->_postFrames;
}

- (void)setPostFrames:(unint64_t)a3
{
  self->_postFrames = a3;
}

- (unint64_t)delayFrames
{
  return self->_delayFrames;
}

- (void)setDelayFrames:(unint64_t)a3
{
  self->_delayFrames = a3;
}

- (BOOL)reduceMotion
{
  return self->_reduceMotion;
}

- (void)setReduceMotion:(BOOL)a3
{
  self->_reduceMotion = a3;
}

- (UIFont)initialFont
{
  return self->_initialFont;
}

- (void)setInitialFont:(id)a3
{
}

- (double)initialFontSize
{
  return self->_initialFontSize;
}

- (void)setInitialFontSize:(double)a3
{
  self->_initialFontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialFont, 0);
  objc_storeStrong((id *)&self->_scales, 0);
  objc_storeStrong((id *)&self->_shadowColors, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end