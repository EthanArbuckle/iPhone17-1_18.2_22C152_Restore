@interface TSTLayoutContentCachedKey
- (BOOL)cellWraps;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLayoutContentCachedKey:(id)a3;
- (NSString)string;
- (TSTLayoutContentCachedKey)initWithString:(id)a3 width:(double)a4 height:(double)a5 paragraphStyle:(id)a6 cellWraps:(BOOL)a7 valueType:(int)a8 paddingInsets:(UIEdgeInsets)a9 verticalAlignment:(unsigned int)a10 writingDirection:(int)a11;
- (TSWPParagraphStyle)paragraphStyle;
- (UIEdgeInsets)paddingInsets;
- (double)height;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)valueType;
- (int)writingDirection;
- (unint64_t)hash;
- (unsigned)verticalAlignment;
- (void)dealloc;
@end

@implementation TSTLayoutContentCachedKey

- (TSTLayoutContentCachedKey)initWithString:(id)a3 width:(double)a4 height:(double)a5 paragraphStyle:(id)a6 cellWraps:(BOOL)a7 valueType:(int)a8 paddingInsets:(UIEdgeInsets)a9 verticalAlignment:(unsigned int)a10 writingDirection:(int)a11
{
  CGFloat right = a9.right;
  CGFloat bottom = a9.bottom;
  CGFloat left = a9.left;
  CGFloat top = a9.top;
  v25.receiver = self;
  v25.super_class = (Class)TSTLayoutContentCachedKey;
  v23 = [(TSTLayoutContentCachedKey *)&v25 init];
  if (v23)
  {
    v23->mString = (NSString *)[a3 copy];
    v23->mWidth = a4;
    v23->mHeight = a5;
    v23->mParagraphStyle = (TSWPParagraphStyle *)a6;
    v23->mCellWraps = a7;
    v23->mValueType = a8;
    v23->mPaddingInsets.CGFloat top = top;
    v23->mPaddingInsets.CGFloat left = left;
    v23->mPaddingInsets.CGFloat bottom = bottom;
    v23->mPaddingInsets.CGFloat right = right;
    v23->mVerticalAlignment = a10;
    v23->mWritingDirection = a11;
  }
  return v23;
}

- (void)dealloc
{
  self->mString = 0;
  self->mParagraphStyle = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTLayoutContentCachedKey;
  [(TSTLayoutContentCachedKey *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[TSTLayoutContentCachedKey allocWithZone:a3];
  v5 = [(TSTLayoutContentCachedKey *)self string];
  [(TSTLayoutContentCachedKey *)self width];
  double v7 = v6;
  [(TSTLayoutContentCachedKey *)self height];
  double v9 = v8;
  v10 = [(TSTLayoutContentCachedKey *)self paragraphStyle];
  BOOL v11 = [(TSTLayoutContentCachedKey *)self cellWraps];
  uint64_t v12 = [(TSTLayoutContentCachedKey *)self valueType];
  [(TSTLayoutContentCachedKey *)self paddingInsets];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [(TSTLayoutContentCachedKey *)self verticalAlignment];
  uint64_t v22 = [(TSTLayoutContentCachedKey *)self writingDirection];

  return -[TSTLayoutContentCachedKey initWithString:width:height:paragraphStyle:cellWraps:valueType:paddingInsets:verticalAlignment:writingDirection:](v4, "initWithString:width:height:paragraphStyle:cellWraps:valueType:paddingInsets:verticalAlignment:writingDirection:", v5, v10, v11, v12, v21, v22, v7, v9, v14, v16, v18, v20);
}

- (unint64_t)hash
{
  return [(NSString *)self->mString hash] ^ (unint64_t)self->mWidth ^ (unint64_t)self->mHeight ^ (unint64_t)self->mParagraphStyle ^ self->mCellWraps ^ (unint64_t)self->mValueType ^ (unint64_t)self->mPaddingInsets.left;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(TSTLayoutContentCachedKey *)self isEqualToLayoutContentCachedKey:a3];
}

- (BOOL)isEqualToLayoutContentCachedKey:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    double mWidth = self->mWidth;
    [a3 width];
    if (vabdd_f64(mWidth, v6) < 0.00999999978
      && (double mHeight = self->mHeight, [a3 height], vabdd_f64(mHeight, v8) < 0.00999999978)
      && (int mCellWraps = self->mCellWraps, mCellWraps == [a3 cellWraps])
      && (unsigned int mVerticalAlignment = self->mVerticalAlignment,
          mVerticalAlignment == [a3 verticalAlignment])
      && (int mWritingDirection = self->mWritingDirection,
          mWritingDirection == [a3 writingDirection])
      && (int mValueType = self->mValueType, mValueType == [a3 valueType]))
    {
      [a3 paddingInsets];
      LOBYTE(v16) = 0;
      if (self->mPaddingInsets.left == v17
        && self->mPaddingInsets.top == v13
        && self->mPaddingInsets.right == v15
        && self->mPaddingInsets.bottom == v14)
      {
        BOOL v16 = -[TSSStyle isEqual:](self->mParagraphStyle, "isEqual:", [a3 paragraphStyle]);
        if (v16)
        {
          mString = self->mString;
          uint64_t v19 = [a3 string];
          LOBYTE(v16) = [(NSString *)mString isEqualToString:v19];
        }
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  return v16;
}

- (id)description
{
  objc_super v3 = (void *)[MEMORY[0x263F7C828] descriptionWithObject:self class:objc_opt_class()];
  [v3 addField:@"string" value:self->mString];
  objc_msgSend(v3, "addField:format:", @"width", @"%f", *(void *)&self->mWidth);
  objc_msgSend(v3, "addField:format:", @"height", @"%f", *(void *)&self->mHeight);
  [v3 addField:@"vertical" value:TSWPStringFromTSWPVerticalAlignment(self->mVerticalAlignment)];
  [v3 addField:@"direction" value:TSWPStringFromTSWPWritingDirection(self->mWritingDirection)];
  if (self->mCellWraps) {
    v4 = @"Y";
  }
  else {
    v4 = @"N";
  }
  [v3 addField:@"wraps" value:v4];
  objc_msgSend(v3, "addField:format:", @"paragraphStyle", @"%p", self->mParagraphStyle);

  return (id)[v3 descriptionString];
}

- (NSString)string
{
  return self->mString;
}

- (double)width
{
  return self->mWidth;
}

- (double)height
{
  return self->mHeight;
}

- (TSWPParagraphStyle)paragraphStyle
{
  return self->mParagraphStyle;
}

- (BOOL)cellWraps
{
  return self->mCellWraps;
}

- (int)valueType
{
  return self->mValueType;
}

- (UIEdgeInsets)paddingInsets
{
  double top = self->mPaddingInsets.top;
  double left = self->mPaddingInsets.left;
  double bottom = self->mPaddingInsets.bottom;
  double right = self->mPaddingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unsigned)verticalAlignment
{
  return self->mVerticalAlignment;
}

- (int)writingDirection
{
  return self->mWritingDirection;
}

@end