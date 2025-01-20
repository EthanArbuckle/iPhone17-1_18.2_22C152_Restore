@interface TSWPDropCapSpacing
+ (id)dropCapSpacingWithLineCount:(unint64_t)a3 elevatedLineCount:(unint64_t)a4;
- (BOOL)allowSpanParagraphs;
- (BOOL)isEqual:(id)a3;
- (TSWPDropCapSpacing)init;
- (double)maxWidthFactor;
- (double)padding;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)computedFlagsWithPropertyMap:(id)a3;
- (unint64_t)elevatedLineCount;
- (unint64_t)flags;
- (unint64_t)followingLineCount;
- (unint64_t)hash;
- (unint64_t)lineCount;
- (void)dealloc;
- (void)setAllowSpanParagraphs:(BOOL)a3;
- (void)setElevatedLineCount:(unint64_t)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setFollowingLineCount:(unint64_t)a3;
- (void)setLineCount:(unint64_t)a3;
- (void)setMaxWidthFactor:(double)a3;
- (void)setPadding:(double)a3;
@end

@implementation TSWPDropCapSpacing

- (TSWPDropCapSpacing)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPDropCapSpacing;
  result = [(TSWPDropCapSpacing *)&v3 init];
  if (result)
  {
    result->_lineCount = 0;
    result->_elevatedLineCount = 0;
    result->_followingLineCount = 0x7FFFFFFFFFFFFFFFLL;
    result->_padding = 0.0;
    result->_allowSpanParagraphs = 1;
    result->_flags = 0;
    result->_maxWidthFactor = 1.0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TSWPDropCapSpacing;
  [(TSWPDropCapSpacing *)&v2 dealloc];
}

+ (id)dropCapSpacingWithLineCount:(unint64_t)a3 elevatedLineCount:(unint64_t)a4
{
  id v6 = objc_alloc_init((Class)a1);
  [v6 setLineCount:a3];
  [v6 setElevatedLineCount:a4];
  return v6;
}

- (unint64_t)computedFlagsWithPropertyMap:(id)a3
{
  unint64_t result = self->_flags;
  if (!result)
  {
    [(TSWPDropCapSpacing *)self padding];
    if (v6 == 0.0 && ![a3 containsProperty:38]) {
      return 102;
    }
    else {
      return 121;
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setLineCount:self->_lineCount];
  [v4 setElevatedLineCount:self->_elevatedLineCount];
  [v4 setPadding:self->_padding];
  [v4 setFollowingLineCount:self->_followingLineCount];
  [v4 setAllowSpanParagraphs:self->_allowSpanParagraphs];
  [v4 setFlags:self->_flags];
  [v4 setMaxWidthFactor:self->_maxWidthFactor];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4)
  {
    v5 = (void *)v4;
    int v6 = [(TSWPDropCapSpacing *)self allowSpanParagraphs];
    if (v6 == [v5 allowSpanParagraphs]
      && (unint64_t v7 = -[TSWPDropCapSpacing lineCount](self, "lineCount"), v7 == [v5 lineCount])
      && (unint64_t v8 = [(TSWPDropCapSpacing *)self elevatedLineCount],
          v8 == [v5 elevatedLineCount])
      && (-[TSWPDropCapSpacing padding](self, "padding"), double v10 = v9, [v5 padding], v10 == v11)
      && (unint64_t v12 = [(TSWPDropCapSpacing *)self followingLineCount],
          v12 == [v5 followingLineCount]))
    {
      unint64_t v13 = [(TSWPDropCapSpacing *)self flags];
      LOBYTE(v4) = v13 == [v5 flags];
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TSWPDropCapSpacing *)self allowSpanParagraphs];
  unint64_t v4 = v3 | (2 * [(TSWPDropCapSpacing *)self lineCount]);
  unint64_t v5 = v4 ^ (8 * [(TSWPDropCapSpacing *)self elevatedLineCount]);
  [(TSWPDropCapSpacing *)self padding];
  return v5 ^ ((unint64_t)v6 << 6) ^ ([(TSWPDropCapSpacing *)self followingLineCount] << 10) ^ self->_flags;
}

- (id)description
{
  uint64_t v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [(TSWPDropCapSpacing *)self lineCount];
  unint64_t v7 = [(TSWPDropCapSpacing *)self elevatedLineCount];
  double padding = self->_padding;
  unint64_t v9 = [(TSWPDropCapSpacing *)self followingLineCount];
  if ([(TSWPDropCapSpacing *)self allowSpanParagraphs]) {
    double v10 = @"YES";
  }
  else {
    double v10 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<%@: lineCount=%lu elevatedLineCount=%lu padding=%f followingLineCount=%lu allowSpanParagraphs=%@ flags=%lu>", v5, v6, v7, *(void *)&padding, v9, v10, -[TSWPDropCapSpacing flags](self, "flags")];
}

- (unint64_t)lineCount
{
  return self->_lineCount;
}

- (void)setLineCount:(unint64_t)a3
{
  self->_lineCount = a3;
}

- (unint64_t)elevatedLineCount
{
  return self->_elevatedLineCount;
}

- (void)setElevatedLineCount:(unint64_t)a3
{
  self->_elevatedLineCount = a3;
}

- (unint64_t)followingLineCount
{
  return self->_followingLineCount;
}

- (void)setFollowingLineCount:(unint64_t)a3
{
  self->_followingLineCount = a3;
}

- (double)padding
{
  return self->_padding;
}

- (void)setPadding:(double)a3
{
  self->_double padding = a3;
}

- (BOOL)allowSpanParagraphs
{
  return self->_allowSpanParagraphs;
}

- (void)setAllowSpanParagraphs:(BOOL)a3
{
  self->_allowSpanParagraphs = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (double)maxWidthFactor
{
  return self->_maxWidthFactor;
}

- (void)setMaxWidthFactor:(double)a3
{
  self->_maxWidthFactor = a3;
}

@end