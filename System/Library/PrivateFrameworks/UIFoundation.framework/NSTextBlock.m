@interface NSTextBlock
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (CGFloat)contentWidth;
- (CGFloat)widthForLayer:(NSTextBlockLayer)layer edge:(NSRectEdge)edge;
- (NSColor)backgroundColor;
- (NSColor)borderColorForEdge:(NSRectEdge)edge;
- (NSRect)boundsRectForContentRect:(NSRect)contentRect inRect:(NSRect)rect textContainer:(NSTextContainer *)textContainer characterRange:(NSRange)charRange;
- (NSRect)rectForLayoutAtPoint:(NSPoint)startingPoint inRect:(NSRect)rect textContainer:(NSTextContainer *)textContainer characterRange:(NSRange)charRange;
- (NSTextBlock)init;
- (NSTextBlock)initWithCoder:(id)a3;
- (NSTextBlockValueType)contentWidthValueType;
- (NSTextBlockValueType)widthValueTypeForLayer:(NSTextBlockLayer)layer edge:(NSRectEdge)edge;
- (NSTextBlockVerticalAlignment)verticalAlignment;
- (double)_valueForParameter:(unint64_t)a3;
- (id)_attributeDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_valueTypeForParameter:(unint64_t)a3;
- (void)_createFloatStorage;
- (void)_destroyFloatStorage;
- (void)_setValue:(double)a3 type:(unint64_t)a4 forParameter:(unint64_t)a5;
- (void)_takeValuesFromTextBlock:(id)a3;
- (void)dealloc;
- (void)drawBackgroundWithFrame:(NSRect)frameRect inView:(NSView *)controlView characterRange:(NSRange)charRange layoutManager:(NSLayoutManager *)layoutManager;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundColor:(NSColor *)backgroundColor;
- (void)setBorderColor:(NSColor *)color;
- (void)setBorderColor:(NSColor *)color forEdge:(NSRectEdge)edge;
- (void)setContentWidth:(CGFloat)val type:(NSTextBlockValueType)type;
- (void)setVerticalAlignment:(NSTextBlockVerticalAlignment)verticalAlignment;
- (void)setWidth:(CGFloat)val type:(NSTextBlockValueType)type forLayer:(NSTextBlockLayer)layer;
- (void)setWidth:(CGFloat)val type:(NSTextBlockValueType)type forLayer:(NSTextBlockLayer)layer edge:(NSRectEdge)edge;
@end

@implementation NSTextBlock

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSTextBlock setVersion:1];
    __NSTextBlockClass = (uint64_t)a1;
  }
}

- (NSTextBlock)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSTextBlock;
  return [(NSTextBlock *)&v3 init];
}

- (void)_createFloatStorage
{
  propVals = self->_propVals;
  if (!propVals)
  {
    propVals = NSZoneMalloc((NSZone *)[(NSTextBlock *)self zone], 0xA0uLL);
    self->_propVals = propVals;
  }
  propVals[8] = 0u;
  propVals[9] = 0u;
  propVals[6] = 0u;
  propVals[7] = 0u;
  propVals[4] = 0u;
  propVals[5] = 0u;
  propVals[2] = 0u;
  propVals[3] = 0u;
  _OWORD *propVals = 0u;
  propVals[1] = 0u;
}

- (void)_destroyFloatStorage
{
  propVals = self->_propVals;
  if (propVals)
  {
    v4 = (NSZone *)MEMORY[0x192FADFB0](propVals, a2);
    v5 = self->_propVals;
    NSZoneFree(v4, v5);
  }
}

- (void)dealloc
{
  [(NSTextBlock *)self _destroyFloatStorage];

  v3.receiver = self;
  v3.super_class = (Class)NSTextBlock;
  [(NSTextBlock *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([a3 allowsKeyedCoding])
  {
    unint64_t propMask = self->_propMask;
    if (propMask) {
      [a3 encodeInteger:propMask forKey:@"NSValueTypes"];
    }
    unint64_t typeMask = self->_typeMask;
    if (typeMask) {
      [a3 encodeInteger:typeMask forKey:@"NSFlags"];
    }
    if (self->_propVals)
    {
      for (uint64_t i = 0; i != 20; ++i)
      {
        double v8 = *((double *)self->_propVals + i);
        if (v8 != 0.0) {
          [a3 encodeDouble:objc_msgSend(NSString, "stringWithFormat:", @"NSParam%lu", i), v8 forKey];
        }
      }
    }
    id primParamVal = self->_primParamVal;
    if (primParamVal) {
      [a3 encodeObject:primParamVal forKey:@"NSBackgroundColor"];
    }
    if (self->_otherParamVals)
    {
      objc_msgSend(a3, "encodeObject:forKey:");
    }
  }
  else
  {
    propVals = (double *)self->_propVals;
    int v20 = self->_propMask;
    int v21 = 0;
    int v19 = self->_typeMask;
    if (propVals)
    {
      uint64_t v11 = 0;
      unsigned int v12 = 0;
      int v13 = 0;
      do
      {
        double v14 = propVals[v11];
        if (v14 != 0.0)
        {
          v13 |= 1 << v11;
          float v15 = v14;
          v22[v12++] = v15;
        }
        ++v11;
      }
      while (v11 != 20);
      int v21 = v13;
    }
    else
    {
      int v13 = 0;
      unsigned int v12 = 0;
    }
    p_id primParamVal = &self->_primParamVal;
    if (self->_primParamVal)
    {
      v13 |= 0x10000000u;
      int v21 = v13;
    }
    id otherParamVals = self->_otherParamVals;
    p_id otherParamVals = &self->_otherParamVals;
    if (otherParamVals) {
      int v21 = v13 | 0x20000000;
    }
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "III", &v21, &v20, &v19);
    if (v12) {
      [a3 encodeArrayOfObjCType:"f" count:v12 at:v22];
    }
    if (*p_primParamVal) {
      objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@", p_primParamVal);
    }
    if (*p_otherParamVals) {
      objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@", p_otherParamVals);
    }
  }
}

- (NSTextBlock)initWithCoder:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)NSTextBlock;
  v4 = [(NSTextBlock *)&v33 init];
  if (!v4) {
    return v4;
  }
  if ([a3 allowsKeyedCoding])
  {
    if ([a3 containsValueForKey:@"NSValueTypes"]) {
      v4->_unint64_t propMask = [a3 decodeInt64ForKey:@"NSValueTypes"];
    }
    if ([a3 containsValueForKey:@"NSFlags"]) {
      v4->_unint64_t typeMask = [a3 decodeIntegerForKey:@"NSFlags"];
    }
    for (uint64_t i = 0; i != 20; ++i)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"NSParam%lu", i);
      if ([a3 containsValueForKey:v6])
      {
        if (!v4->_propVals) {
          [(NSTextBlock *)v4 _createFloatStorage];
        }
        [a3 decodeDoubleForKey:v6];
        *((void *)v4->_propVals + i) = v7;
      }
    }
    if ([a3 containsValueForKey:@"NSBackgroundColor"])
    {
      double v8 = (void *)MEMORY[0x1E4F1CAD0];
      if (__NSTextBlockPrimaryColorClass_onceToken != -1) {
        dispatch_once(&__NSTextBlockPrimaryColorClass_onceToken, &__block_literal_global_30);
      }
      uint64_t v9 = __NSTextBlockPrimaryColorClass_colorClass;
      if (__NSTextBlockSecondaryColorClass_onceToken != -1) {
        dispatch_once(&__NSTextBlockSecondaryColorClass_onceToken, &__block_literal_global_307_0);
      }
      v4->_id primParamVal = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, __NSTextBlockSecondaryColorClass_colorClass, 0), @"NSBackgroundColor");
    }
    if ([a3 containsValueForKey:@"NSBorderColors"])
    {
      v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      if (__NSTextBlockPrimaryColorClass_onceToken != -1) {
        dispatch_once(&__NSTextBlockPrimaryColorClass_onceToken, &__block_literal_global_30);
      }
      uint64_t v14 = __NSTextBlockPrimaryColorClass_colorClass;
      if (__NSTextBlockSecondaryColorClass_onceToken != -1) {
        dispatch_once(&__NSTextBlockSecondaryColorClass_onceToken, &__block_literal_global_307_0);
      }
      v4->_id otherParamVals = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, __NSTextBlockSecondaryColorClass_colorClass, 0), @"NSBorderColors");
    }
    return v4;
  }
  uint64_t v15 = [a3 versionForClassName:@"NSTextBlock"];
  if (v15 != 1)
  {
    uint64_t v27 = v15;
    uint64_t v28 = _NSFullMethodName();
    NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v28, 1, v27);

    return 0;
  }
  uint64_t v31 = 0;
  id v32 = 0;
  unsigned int v30 = 0;
  objc_msgSend(a3, "decodeValuesOfObjCTypes:", "III", (char *)&v31 + 4, &v31, &v30);
  unint64_t v16 = v30;
  v4->_unint64_t propMask = v31;
  v4->_unint64_t typeMask = v16;
  unsigned int v17 = HIDWORD(v31);
  if (HIDWORD(v31))
  {
    int32x4_t v18 = (int32x4_t)xmmword_18E5F77A0;
    uint32x4_t v19 = (uint32x4_t)vdupq_n_s32(HIDWORD(v31));
    int32x4_t v20 = 0uLL;
    int v21 = 20;
    v22.i64[0] = 0x100000001;
    v22.i64[1] = 0x100000001;
    v23.i64[0] = 0x400000004;
    v23.i64[1] = 0x400000004;
    do
    {
      int32x4_t v20 = vaddq_s32((int32x4_t)vandq_s8((int8x16_t)vshlq_u32(v19, (uint32x4_t)vnegq_s32(v18)), v22), v20);
      int32x4_t v18 = vaddq_s32(v18, v23);
      v21 -= 4;
    }
    while (v21);
    if (vaddvq_s32(v20))
    {
      objc_msgSend(a3, "decodeArrayOfObjCType:count:at:", "f");
      [(NSTextBlock *)v4 _createFloatStorage];
      uint64_t v24 = 0;
      int v25 = 0;
      unsigned int v17 = HIDWORD(v31);
      do
      {
        if ((v17 >> v24))
        {
          float v26 = v34[v25++];
          *((double *)v4->_propVals + v24) = v26;
        }
        ++v24;
      }
      while (v24 != 20);
    }
    if ((v17 & 0x10000000) != 0)
    {
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "@", &v4->_primParamVal);
      unsigned int v17 = HIDWORD(v31);
      if ((v31 & 0x2000000000000000) == 0)
      {
LABEL_36:
        if ((v17 & 0x40000000) == 0) {
          return v4;
        }
        goto LABEL_41;
      }
    }
    else if ((v17 & 0x20000000) == 0)
    {
      goto LABEL_36;
    }
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "@", &v4->_otherParamVals);
    if ((v31 & 0x4000000000000000) == 0) {
      return v4;
    }
LABEL_41:
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "@", &v32);
  }
  return v4;
}

- (void)_setValue:(double)a3 type:(unint64_t)a4 forParameter:(unint64_t)a5
{
  if (a5 > 0x13) {
    goto LABEL_7;
  }
  propVals = (double *)self->_propVals;
  if (a3 == 0.0)
  {
    if (!propVals) {
      goto LABEL_7;
    }
  }
  else if (!propVals)
  {
    [(NSTextBlock *)self _createFloatStorage];
    propVals = (double *)self->_propVals;
  }
  propVals[a5] = a3;
LABEL_7:
  int v10 = 1 << a5;
  if (a4 == 1) {
    unint64_t v11 = self->_propMask | v10;
  }
  else {
    unint64_t v11 = self->_propMask & ~v10;
  }
  self->_unint64_t propMask = v11;
}

- (double)_valueForParameter:(unint64_t)a3
{
  double result = 0.0;
  if (a3 <= 0x13)
  {
    propVals = (double *)self->_propVals;
    if (propVals) {
      return propVals[a3];
    }
  }
  return result;
}

- (unint64_t)_valueTypeForParameter:(unint64_t)a3
{
  return (self->_propMask & (1 << a3)) != 0;
}

- (void)_takeValuesFromTextBlock:(id)a3
{
  if (*((void *)a3 + 1))
  {
    [(NSTextBlock *)self _createFloatStorage];
    uint64_t v5 = 0;
    uint64_t v6 = *((void *)a3 + 1);
    propVals = (char *)self->_propVals;
    do
    {
      *(void *)&propVals[v5] = *(void *)(v6 + v5);
      v5 += 8;
    }
    while (v5 != 160);
  }
  self->_unint64_t propMask = *((void *)a3 + 2);
  self->_unint64_t typeMask = *((void *)a3 + 3);
  double v8 = (void *)*((void *)a3 + 4);
  if (v8) {
    self->_id primParamVal = (id)[v8 copy];
  }
  uint64_t v9 = (void *)*((void *)a3 + 5);
  if (v9) {
    self->_id otherParamVals = (id)[v9 mutableCopy];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 _takeValuesFromTextBlock:self];
  return v4;
}

- (void)setContentWidth:(CGFloat)val type:(NSTextBlockValueType)type
{
}

- (CGFloat)contentWidth
{
  [(NSTextBlock *)self valueForDimension:0];
  return result;
}

- (NSTextBlockValueType)contentWidthValueType
{
  return [(NSTextBlock *)self valueTypeForDimension:0];
}

- (void)setWidth:(CGFloat)val type:(NSTextBlockValueType)type forLayer:(NSTextBlockLayer)layer edge:(NSRectEdge)edge
{
}

- (CGFloat)widthForLayer:(NSTextBlockLayer)layer edge:(NSRectEdge)edge
{
  [(NSTextBlock *)self _valueForParameter:edge + 4 * layer + 12];
  return result;
}

- (NSTextBlockValueType)widthValueTypeForLayer:(NSTextBlockLayer)layer edge:(NSRectEdge)edge
{
  return [(NSTextBlock *)self _valueTypeForParameter:edge + 4 * layer + 12];
}

- (void)setWidth:(CGFloat)val type:(NSTextBlockValueType)type forLayer:(NSTextBlockLayer)layer
{
  -[NSTextBlock setWidth:type:forLayer:edge:](self, "setWidth:type:forLayer:edge:", type, layer, 0);
  [(NSTextBlock *)self setWidth:type type:layer forLayer:1 edge:val];
  [(NSTextBlock *)self setWidth:type type:layer forLayer:2 edge:val];

  [(NSTextBlock *)self setWidth:type type:layer forLayer:3 edge:val];
}

- (void)setVerticalAlignment:(NSTextBlockVerticalAlignment)verticalAlignment
{
  self->_unint64_t propMask = (verticalAlignment << 30) | self->_propMask & 0x3FFFFFFF;
}

- (NSTextBlockVerticalAlignment)verticalAlignment
{
  return (unint64_t)(self->_propMask >> 30);
}

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
  id primParamVal = (NSColor *)self->_primParamVal;
  if (primParamVal != backgroundColor)
  {

    self->_id primParamVal = (id)[(NSColor *)backgroundColor copy];
  }
}

- (NSColor)backgroundColor
{
  return (NSColor *)self->_primParamVal;
}

- (void)setBorderColor:(NSColor *)color forEdge:(NSRectEdge)edge
{
  uint64_t v5 = color;
  id otherParamVals = self->_otherParamVals;
  if (otherParamVals)
  {
    if (color) {
      goto LABEL_3;
    }
    goto LABEL_9;
  }
  self->_id otherParamVals = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", -[NSTextBlock zone](self, "zone")), "init");
  uint64_t v8 = 4;
  do
  {
    objc_msgSend(self->_otherParamVals, "addObject:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
    --v8;
  }
  while (v8);
  id otherParamVals = self->_otherParamVals;
  if (!v5) {
LABEL_9:
  }
    uint64_t v5 = (NSColor *)[MEMORY[0x1E4F1CA98] null];
LABEL_3:

  [otherParamVals replaceObjectAtIndex:edge withObject:v5];
}

- (NSColor)borderColorForEdge:(NSRectEdge)edge
{
  id otherParamVals = self->_otherParamVals;
  if (otherParamVals) {
    v4 = (NSColor *)[otherParamVals objectAtIndex:edge];
  }
  else {
    v4 = 0;
  }
  if (__NSTextBlockSecondaryColorClass_onceToken == -1)
  {
    if (!v4) {
      return v4;
    }
  }
  else
  {
    dispatch_once(&__NSTextBlockSecondaryColorClass_onceToken, &__block_literal_global_307_0);
    if (!v4) {
      return v4;
    }
  }
  uint64_t v5 = __NSTextBlockSecondaryColorClass_colorClass;
  if (__NSTextBlockPrimaryColorClass_onceToken != -1) {
    dispatch_once(&__NSTextBlockPrimaryColorClass_onceToken, &__block_literal_global_30);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0 && (!v5 || (objc_opt_isKindOfClass() & 1) == 0)) {
    return 0;
  }
  return v4;
}

- (void)setBorderColor:(NSColor *)color
{
  [(NSTextBlock *)self setBorderColor:color forEdge:0];
  [(NSTextBlock *)self setBorderColor:color forEdge:1];
  [(NSTextBlock *)self setBorderColor:color forEdge:2];

  [(NSTextBlock *)self setBorderColor:color forEdge:3];
}

- (NSRect)rectForLayoutAtPoint:(NSPoint)startingPoint inRect:(NSRect)rect textContainer:(NSTextContainer *)textContainer characterRange:(NSRange)charRange
{
  NSUInteger length = charRange.length;
  NSUInteger location = charRange.location;
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  double v12 = startingPoint.y;
  uint64_t v14 = [(NSTextContainer *)textContainer layoutManager];
  uint64_t v15 = [NSTextBlockLayoutHelper alloc];
  [(NSLayoutManager *)v14 textStorage];
  unsigned int v17 = (double *)[(NSTextBlockLayoutHelper *)(char *)v15 initWithTextBlock:location charRange:length text:width layoutManager:v16 containerWidth:v14 collapseBorders:0];
  double v18 = v17[20];
  double v19 = v17[14] + v17[15] + v17[16];
  double v20 = v19 + v17[22] + v17[23] + v17[24];
  if (v20 <= width && v18 + v20 > width) {
    double v18 = v18 * ((width - v20) / v18);
  }
  double v22 = x + v19;
  double v23 = v12 + v17[17] + v17[18] + v17[19];

  double v24 = v22;
  double v25 = v23;
  double v26 = v18;
  double v27 = y + height - v23;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (NSRect)boundsRectForContentRect:(NSRect)contentRect inRect:(NSRect)rect textContainer:(NSTextContainer *)textContainer characterRange:(NSRange)charRange
{
  NSUInteger length = charRange.length;
  NSUInteger location = charRange.location;
  double width = rect.size.width;
  double height = contentRect.size.height;
  double v10 = contentRect.size.width;
  double y = contentRect.origin.y;
  double x = contentRect.origin.x;
  uint64_t v14 = [(NSTextContainer *)textContainer layoutManager];
  uint64_t v15 = [NSTextBlockLayoutHelper alloc];
  [(NSLayoutManager *)v14 textStorage];
  unsigned int v17 = [(NSTextBlockLayoutHelper *)(char *)v15 initWithTextBlock:location charRange:length text:width layoutManager:v16 containerWidth:v14 collapseBorders:0];
  NSTextBlockVerticalAlignment v18 = [(NSTextBlock *)self verticalAlignment];
  double v19 = *((double *)v17 + 21) - height;
  if (v19 > 0.0)
  {
    double height = height + v19;
    if (v18 == NSTextBlockBottomAlignment)
    {
LABEL_5:
      _moveLinesInLayoutManager(v14, *((void *)v17 + 4), *((void *)v17 + 5), 0, v19);
      goto LABEL_6;
    }
    if (v18 == NSTextBlockMiddleAlignment)
    {
      double v19 = v19 * 0.5;
      goto LABEL_5;
    }
  }
LABEL_6:
  double v20 = *((double *)v17 + 14) + *((double *)v17 + 15) + *((double *)v17 + 16);
  double v21 = x - v20;
  double v22 = *((double *)v17 + 17) + *((double *)v17 + 18) + *((double *)v17 + 19);
  double v23 = y - v22;
  double v24 = v10 + v20 + *((double *)v17 + 24) + *((double *)v17 + 23) + *((double *)v17 + 22);
  double v25 = height + v22 + *((double *)v17 + 27) + *((double *)v17 + 26) + *((double *)v17 + 25);

  double v26 = v21;
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  result.size.double height = v29;
  result.size.double width = v28;
  result.origin.double y = v27;
  result.origin.double x = v26;
  return result;
}

- (void)drawBackgroundWithFrame:(NSRect)frameRect inView:(NSView *)controlView characterRange:(NSRange)charRange layoutManager:(NSLayoutManager *)layoutManager
{
  NSUInteger length = charRange.length;
  NSUInteger location = charRange.location;
  double height = frameRect.size.height;
  double width = frameRect.size.width;
  double y = frameRect.origin.y;
  double x = frameRect.origin.x;
  uint64_t v14 = [NSTextBlockLayoutHelper alloc];
  [(NSLayoutManager *)layoutManager textStorage];
  uint64_t v16 = [(NSTextBlockLayoutHelper *)(char *)v14 initWithTextBlock:location charRange:length text:0.0 layoutManager:v15 containerWidth:layoutManager collapseBorders:0];
  unsigned int v17 = [(NSTextBlock *)self backgroundColor];
  NSTextBlockVerticalAlignment v18 = [(NSTextBlock *)self borderColorForEdge:0];
  double v19 = [(NSTextBlock *)self borderColorForEdge:1];
  double v20 = [(NSTextBlock *)self borderColorForEdge:2];
  double v21 = [(NSTextBlock *)self borderColorForEdge:3];
  double v49 = x;
  double v50 = y;
  double v51 = width;
  double v52 = height;
  double v23 = *((double *)v16 + 14);
  double v22 = *((double *)v16 + 15);
  double v24 = *((double *)v16 + 17);
  uint64_t v25 = *((void *)v16 + 18);
  double v45 = x + v23;
  double v46 = v24 + y;
  double v26 = v23 + v22;
  double v27 = *((double *)v16 + 23);
  double v28 = *((double *)v16 + 24);
  double v43 = width - (v26 + v27 + v28);
  uint64_t v44 = v25;
  double v30 = *((double *)v16 + 26);
  double v29 = *((double *)v16 + 27);
  double v47 = v22;
  double v48 = height - (v24 + v29);
  double v41 = x + v26;
  double v42 = v24 + y;
  double v37 = x + width - v28 - v27;
  double v38 = v24 + y;
  double v39 = v27;
  double v40 = v48;
  double v33 = x + v26;
  double v34 = y + height - v29 - v30;
  double v35 = v43;
  double v36 = v30;
  if (v17)
  {
    -[NSColor set](v17, "set", *(void *)&v33, *(void *)&v34, *(void *)&v35, *(void *)&v36, *(void *)&v37, *(void *)&v38, *(void *)&v39, *(void *)&v40, *(void *)&v41, *(void *)&v42, *(void *)&v43, v44, *(void *)&v45, *(void *)&v46, *(void *)&v47, *(void *)&v48, *(void *)&v49,
      *(void *)&v50,
      *(void *)&v51,
      *(void *)&v52);
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](layoutManager, "fillBackgroundRectArray:count:forCharacterRange:color:", &v49, 1, location, length, v17);
    double v22 = *((double *)v16 + 15);
  }
  if (v22 > 0.0 && v18 != 0)
  {
    [(NSColor *)v18 set];
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](layoutManager, "fillBackgroundRectArray:count:forCharacterRange:color:", &v45, 1, location, length, v18);
  }
  if (*((double *)v16 + 18) > 0.0 && v19 != 0)
  {
    [(NSColor *)v19 set];
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](layoutManager, "fillBackgroundRectArray:count:forCharacterRange:color:", &v41, 1, location, length, v19);
  }
  if (*((double *)v16 + 23) > 0.0 && v20)
  {
    [(NSColor *)v20 set];
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](layoutManager, "fillBackgroundRectArray:count:forCharacterRange:color:", &v37, 1, location, length, v20);
  }
  if (*((double *)v16 + 26) > 0.0 && v21)
  {
    [(NSColor *)v21 set];
    -[NSLayoutManager fillBackgroundRectArray:count:forCharacterRange:color:](layoutManager, "fillBackgroundRectArray:count:forCharacterRange:color:", &v33, 1, location, length, v21);
  }
}

- (id)_attributeDescription
{
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] string];
  [(NSTextBlock *)self valueForDimension:0];
  uint64_t v77 = v4;
  [(NSTextBlock *)self valueForDimension:1];
  double v6 = v5;
  [(NSTextBlock *)self valueForDimension:2];
  double v76 = v7;
  [(NSTextBlock *)self valueForDimension:4];
  uint64_t v79 = v8;
  [(NSTextBlock *)self valueForDimension:5];
  double v10 = v9;
  [(NSTextBlock *)self valueForDimension:6];
  double v81 = v11;
  NSTextBlockValueType v12 = [(NSTextBlock *)self valueTypeForDimension:0];
  NSTextBlockValueType v64 = [(NSTextBlock *)self valueTypeForDimension:1];
  NSTextBlockValueType v62 = [(NSTextBlock *)self valueTypeForDimension:2];
  NSTextBlockValueType v13 = [(NSTextBlock *)self valueTypeForDimension:4];
  NSTextBlockValueType v71 = [(NSTextBlock *)self valueTypeForDimension:5];
  NSTextBlockValueType v69 = [(NSTextBlock *)self valueTypeForDimension:6];
  uint64_t v14 = _colorValForColor([(NSTextBlock *)self backgroundColor]);
  [(NSTextBlock *)self widthForLayer:1 edge:1];
  double v16 = v15;
  [(NSTextBlock *)self widthForLayer:1 edge:2];
  double v80 = v17;
  [(NSTextBlock *)self widthForLayer:1 edge:3];
  double v78 = v18;
  [(NSTextBlock *)self widthForLayer:1 edge:0];
  double v20 = v19;
  NSTextBlockValueType v70 = [(NSTextBlock *)self widthValueTypeForLayer:1 edge:1];
  NSTextBlockValueType v68 = [(NSTextBlock *)self widthValueTypeForLayer:1 edge:2];
  NSTextBlockValueType v67 = [(NSTextBlock *)self widthValueTypeForLayer:1 edge:3];
  NSTextBlockValueType v65 = [(NSTextBlock *)self widthValueTypeForLayer:1 edge:0];
  [(NSTextBlock *)self widthForLayer:0 edge:1];
  double v22 = v21;
  [(NSTextBlock *)self widthForLayer:0 edge:2];
  double v24 = v23;
  [(NSTextBlock *)self widthForLayer:0 edge:3];
  double v26 = v25;
  [(NSTextBlock *)self widthForLayer:0 edge:0];
  double v28 = v27;
  NSTextBlockValueType v66 = [(NSTextBlock *)self widthValueTypeForLayer:0 edge:1];
  NSTextBlockValueType v63 = [(NSTextBlock *)self widthValueTypeForLayer:0 edge:2];
  NSTextBlockValueType v61 = [(NSTextBlock *)self widthValueTypeForLayer:0 edge:3];
  NSTextBlockValueType v60 = [(NSTextBlock *)self widthValueTypeForLayer:0 edge:0];
  double v29 = [(NSTextBlock *)self borderColorForEdge:1];
  double v30 = [(NSTextBlock *)self borderColorForEdge:2];
  uint64_t v31 = [(NSTextBlock *)self borderColorForEdge:3];
  id v32 = [(NSTextBlock *)self borderColorForEdge:0];
  uint64_t v33 = _colorValForColor(v29);
  uint64_t v34 = _colorValForColor(v30);
  uint64_t v75 = _colorValForColor(v31);
  uint64_t v35 = _colorValForColor(v32);
  [(NSTextBlock *)self widthForLayer:-1 edge:1];
  double v85 = v36;
  [(NSTextBlock *)self widthForLayer:-1 edge:2];
  double v84 = v37;
  [(NSTextBlock *)self widthForLayer:-1 edge:3];
  double v83 = v38;
  [(NSTextBlock *)self widthForLayer:-1 edge:0];
  double v82 = v39;
  NSTextBlockValueType v74 = [(NSTextBlock *)self widthValueTypeForLayer:-1 edge:1];
  NSTextBlockValueType v73 = [(NSTextBlock *)self widthValueTypeForLayer:-1 edge:2];
  NSTextBlockValueType v72 = [(NSTextBlock *)self widthValueTypeForLayer:-1 edge:3];
  NSTextBlockValueType v40 = [(NSTextBlock *)self widthValueTypeForLayer:-1 edge:0];
  if (v12 == NSTextBlockPercentageValueType) {
    double v41 = @"%";
  }
  else {
    double v41 = &stru_1EDD49F70;
  }
  [v3 appendFormat:@"w %g%@ ", v77, v41];
  if (v6 > 0.0 || v76 > 0.0)
  {
    if (v64 == NSTextBlockPercentageValueType) {
      double v42 = @"%";
    }
    else {
      double v42 = &stru_1EDD49F70;
    }
    if (v62 == NSTextBlockPercentageValueType) {
      double v43 = @"%";
    }
    else {
      double v43 = &stru_1EDD49F70;
    }
    [v3 appendFormat:@"%g%@-%g%@ ", *(void *)&v6, v42, *(void *)&v76, v43];
  }
  if (v13 == NSTextBlockPercentageValueType) {
    uint64_t v44 = @"%";
  }
  else {
    uint64_t v44 = &stru_1EDD49F70;
  }
  [v3 appendFormat:@"h %g%@ ", v79, v44];
  if (v10 > 0.0 || v81 > 0.0)
  {
    if (v71 == NSTextBlockPercentageValueType) {
      double v45 = @"%";
    }
    else {
      double v45 = &stru_1EDD49F70;
    }
    if (v69 == NSTextBlockPercentageValueType) {
      double v46 = @"%";
    }
    else {
      double v46 = &stru_1EDD49F70;
    }
    [v3 appendFormat:@"%g%@-%g%@ ", *(void *)&v10, v45, *(void *)&v81, v46];
  }
  if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v3, "appendFormat:", @"bgc #%.6x ", v14);
  }
  if (v20 > 0.0 || v16 > 0.0 || v80 > 0.0 || v78 > 0.0)
  {
    if (v70 == NSTextBlockPercentageValueType) {
      double v47 = @"%";
    }
    else {
      double v47 = &stru_1EDD49F70;
    }
    if (v68 == NSTextBlockPercentageValueType) {
      double v48 = @"%";
    }
    else {
      double v48 = &stru_1EDD49F70;
    }
    if (v67 == NSTextBlockPercentageValueType) {
      double v49 = @"%";
    }
    else {
      double v49 = &stru_1EDD49F70;
    }
    if (v65 == NSTextBlockPercentageValueType) {
      double v50 = @"%";
    }
    else {
      double v50 = &stru_1EDD49F70;
    }
    [v3 appendFormat:@"m %g%@ %g%@ %g%@ %g%@ ", *(void *)&v16, v47, *(void *)&v80, v48, *(void *)&v78, v49, *(void *)&v20, v50];
  }
  if (v28 > 0.0 || v22 > 0.0 || v24 > 0.0 || v26 > 0.0)
  {
    double v51 = v66 == NSTextBlockPercentageValueType ? @"%" : &stru_1EDD49F70;
    double v52 = v63 == NSTextBlockPercentageValueType ? @"%" : &stru_1EDD49F70;
    v53 = v61 == NSTextBlockPercentageValueType ? @"%" : &stru_1EDD49F70;
    v54 = v60 == NSTextBlockPercentageValueType ? @"%" : &stru_1EDD49F70;
    [v3 appendFormat:@"b %g%@ %g%@ %g%@ %g%@ ", *(void *)&v22, v51, *(void *)&v24, v52, *(void *)&v26, v53, *(void *)&v28, v54];
    if (v35 != 0x7FFFFFFFFFFFFFFFLL
      || v33 != 0x7FFFFFFFFFFFFFFFLL
      || v34 != 0x7FFFFFFFFFFFFFFFLL
      || v75 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v3 appendFormat:@"boc"];
      if (v33 == 0x7FFFFFFFFFFFFFFFLL) {
        [v3 appendString:@" transparent"];
      }
      else {
        objc_msgSend(v3, "appendFormat:", @" #%.6x", v33);
      }
      if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
        [v3 appendString:@" transparent"];
      }
      else {
        objc_msgSend(v3, "appendFormat:", @" #%.6x", v34);
      }
      if (v75 == 0x7FFFFFFFFFFFFFFFLL) {
        [v3 appendString:@" transparent"];
      }
      else {
        objc_msgSend(v3, "appendFormat:", @" #%.6x", v75);
      }
      if (v35 == 0x7FFFFFFFFFFFFFFFLL) {
        [v3 appendString:@" transparent "];
      }
      else {
        objc_msgSend(v3, "appendFormat:", @" #%.6x ", v35);
      }
    }
  }
  if (v82 > 0.0 || v85 > 0.0 || v84 > 0.0 || v83 > 0.0)
  {
    if (v74 == NSTextBlockPercentageValueType) {
      v55 = @"%";
    }
    else {
      v55 = &stru_1EDD49F70;
    }
    if (v73 == NSTextBlockPercentageValueType) {
      v56 = @"%";
    }
    else {
      v56 = &stru_1EDD49F70;
    }
    if (v72 == NSTextBlockPercentageValueType) {
      v57 = @"%";
    }
    else {
      v57 = &stru_1EDD49F70;
    }
    if (v40 == NSTextBlockPercentageValueType) {
      v58 = @"%";
    }
    else {
      v58 = &stru_1EDD49F70;
    }
    [v3 appendFormat:@"p %g%@ %g%@ %g%@ %g%@ ", *(void *)&v85, v55, *(void *)&v84, v56, *(void *)&v83, v57, *(void *)&v82, v58];
  }
  return v3;
}

@end