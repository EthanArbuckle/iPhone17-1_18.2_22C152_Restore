@interface THPageHint
+ (BOOL)supportsSecureCoding;
- ($76C9DF09DF30CB4FBD89D11B5573AD82)bodylessStubHint;
- ($76C9DF09DF30CB4FBD89D11B5573AD82)firstHint;
- ($76C9DF09DF30CB4FBD89D11B5573AD82)firstHintForBodyIndex:(unint64_t)a3;
- ($76C9DF09DF30CB4FBD89D11B5573AD82)lastHint;
- ($76C9DF09DF30CB4FBD89D11B5573AD82)lastHintForBodyIndex:(unint64_t)a3;
- (CGSize)size;
- (CGSize)sizeForBodyIndex:(unint64_t)a3;
- (THPageHint)initWithCoder:(id)a3;
- (THPageHint)initWithPageInfo:(id)a3;
- (_NSRange)anchoredRangeForBodyIndex:(unint64_t)a3;
- (_NSRange)range;
- (_NSRange)rangeForBodyIndex:(unint64_t)a3;
- (id).cxx_construct;
- (id)anchoredAttachmentPositionsForBodyChildAtIndex:(unint64_t)a3;
- (id)firstChildHint;
- (id)firstChildHintForBodyIndex:(unint64_t)a3;
- (id)firstColumn;
- (id)firstColumnForBodyIndex:(unint64_t)a3;
- (id)lastChildHint;
- (id)lastChildHintForBodyIndex:(unint64_t)a3;
- (id)lastColumn;
- (id)lastColumnForBodyIndex:(unint64_t)a3;
- (id)p_bodyHintAtIndex:(unint64_t)a3;
- (unint64_t)bodyCount;
- (unint64_t)nonEmptyBodyCount;
- (vector<TSWPTargetHint,)hintsForBodyIndex:(THPageHint *)self;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)offsetStartCharIndicesBy:(int64_t)a3;
- (void)setAnchoredAttachmentPositions:(id)a3 forBodyIndex:(unint64_t)a4;
- (void)setBodyCount:(unint64_t)a3;
- (void)setBodylessStubHint:(id *)a3;
- (void)setFirstChildHint:(id)a3 forBodyIndex:(unint64_t)a4;
- (void)setHints:(const void *)a3 forBodyIndex:(unint64_t)a4;
- (void)setLastChildHint:(id)a3 forBodyIndex:(unint64_t)a4;
- (void)setNonEmptyBodyCount:(unint64_t)a3;
- (void)setSize:(CGSize)a3;
- (void)setSize:(CGSize)a3 forBodyIndex:(unint64_t)a4;
- (void)setTopicNumbers:(void *)a3;
- (void)topicNumbers;
@end

@implementation THPageHint

- (THPageHint)initWithPageInfo:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)THPageHint;
  v4 = [(THPageHint *)&v8 init];
  if (v4)
  {
    -[THPageHint setBodyCount:](v4, "setBodyCount:", objc_msgSend(objc_msgSend(a3, "modelBodyInfos"), "count"));
    objc_msgSend(objc_msgSend(a3, "geometry"), "size");
    -[THPageHint setSize:](v4, "setSize:");
    v4->mBodyHints = (TSUIntegerKeyDictionary *)objc_alloc_init((Class)TSUIntegerKeyDictionary);
    if ([(THPageHint *)v4 bodyCount])
    {
      unint64_t v5 = 0;
      do
      {
        v6 = objc_alloc_init(THBodyHint);
        [(TSUIntegerKeyDictionary *)v4->mBodyHints setObject:v6 forKey:v5];

        ++v5;
      }
      while (v5 < [(THPageHint *)v4 bodyCount]);
    }
    TSWPTopicNumberHints::reset(&v4->_topicNumbers);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THPageHint)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)THPageHint;
  v4 = [(THPageHint *)&v12 init];
  if (v4)
  {
    v4->mNonEmptyBodyCount = (unint64_t)[a3 decodeIntegerForKey:@"nonEmptyBodyCount"];
    id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"size"];
    if (v5)
    {
      [v5 CGSizeValue];
    }
    else
    {
      CGFloat width = CGSizeZero.width;
      CGFloat height = CGSizeZero.height;
    }
    v4->mSize.CGFloat width = width;
    v4->mSize.CGFloat height = height;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    objc_opt_class();
    [a3 decodeObjectOfClasses:v10 forKey:@"bodyHints"];
    v4->mBodyHints = (TSUIntegerKeyDictionary *)(id)TSUDynamicCast();
    v4->mBodyCount = (unint64_t)[a3 decodeIntegerForKey:@"bodyCount"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->mBodyHints forKey:@"bodyHints"];
  [a3 encodeInteger:self->mBodyCount forKey:@"bodyCount"];
  [a3 encodeInteger:self->mNonEmptyBodyCount forKey:@"nonEmptyBodyCount"];
  id v5 = +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->mSize.width, self->mSize.height);

  [a3 encodeObject:v5 forKey:@"size"];
}

- (void)dealloc
{
  self->mBodyHints = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPageHint;
  [(THPageHint *)&v3 dealloc];
}

- (id)p_bodyHintAtIndex:(unint64_t)a3
{
  return [(TSUIntegerKeyDictionary *)self->mBodyHints objectForKey:a3];
}

- (_NSRange)range
{
  id v4 = NSInvalidRange[0];
  id v3 = NSInvalidRange[1];
  if ([(THPageHint *)self nonEmptyBodyCount])
  {
    unint64_t v5 = 0;
    do
    {
      id location = [(THPageHint *)self rangeForBodyIndex:v5];
      NSUInteger length = v7;
      if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v12.id location = (NSUInteger)v4;
        v12.NSUInteger length = (NSUInteger)v3;
        v14.id location = (NSUInteger)location;
        v14.NSUInteger length = length;
        NSRange v9 = NSUnionRange(v12, v14);
        id location = (id)v9.location;
        NSUInteger length = v9.length;
      }
      ++v5;
      id v3 = (id)length;
      id v4 = location;
    }
    while (v5 < [(THPageHint *)self nonEmptyBodyCount]);
  }
  else
  {
    id location = v4;
    NSUInteger length = (NSUInteger)v3;
  }
  NSUInteger v10 = (NSUInteger)location;
  NSUInteger v11 = length;
  result.NSUInteger length = v11;
  result.id location = v10;
  return result;
}

- (_NSRange)rangeForBodyIndex:(unint64_t)a3
{
  id v3 = [(THPageHint *)self p_bodyHintAtIndex:a3];

  id v4 = [v3 range];
  result.NSUInteger length = v5;
  result.id location = (NSUInteger)v4;
  return result;
}

- (_NSRange)anchoredRangeForBodyIndex:(unint64_t)a3
{
  id v3 = [(THPageHint *)self p_bodyHintAtIndex:a3];

  id v4 = [v3 anchoredRange];
  result.NSUInteger length = v5;
  result.id location = (NSUInteger)v4;
  return result;
}

- (void)offsetStartCharIndicesBy:(int64_t)a3
{
  if ([(THPageHint *)self nonEmptyBodyCount])
  {
    unint64_t v5 = 0;
    do
      [self p_bodyHintAtIndex:v5++].offsetStartCharIndexBy:a3];
    while (v5 < [(THPageHint *)self nonEmptyBodyCount]);
  }
}

- (void)setHints:(const void *)a3 forBodyIndex:(unint64_t)a4
{
  id v5 = [(THPageHint *)self p_bodyHintAtIndex:a4];

  [v5 setHints:a3];
}

- (vector<TSWPTargetHint,)hintsForBodyIndex:(THPageHint *)self
{
  _NSRange result = [(THPageHint *)self p_bodyHintAtIndex:a4];
  if (result)
  {
    return (vector<TSWPTargetHint, std::allocator<TSWPTargetHint>> *)unk_578398(result, "hints");
  }
  else
  {
    retstr->__begin_ = 0;
    retstr->__end_ = 0;
    retstr->__end_cap_.__value_ = 0;
  }
  return result;
}

- (void)setSize:(CGSize)a3 forBodyIndex:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(THPageHint *)self p_bodyHintAtIndex:a4];

  [v6 setSize:width height:height];
}

- (CGSize)sizeForBodyIndex:(unint64_t)a3
{
  id v3 = [(THPageHint *)self p_bodyHintAtIndex:a3];

  [v3 size];
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)setFirstChildHint:(id)a3 forBodyIndex:(unint64_t)a4
{
  id v5 = [(THPageHint *)self p_bodyHintAtIndex:a4];

  [v5 setFirstChildHint:a3];
}

- (id)firstChildHintForBodyIndex:(unint64_t)a3
{
  id v3 = [(THPageHint *)self p_bodyHintAtIndex:a3];

  return [v3 firstChildHint];
}

- (void)setLastChildHint:(id)a3 forBodyIndex:(unint64_t)a4
{
  id v5 = [(THPageHint *)self p_bodyHintAtIndex:a4];

  [v5 setLastChildHint:a3];
}

- (id)lastChildHintForBodyIndex:(unint64_t)a3
{
  id v3 = [(THPageHint *)self p_bodyHintAtIndex:a3];

  return [v3 lastChildHint];
}

- (id)firstColumn
{
  id result = [(THPageHint *)self nonEmptyBodyCount];
  if (result)
  {
    return [(THPageHint *)self firstColumnForBodyIndex:0];
  }
  return result;
}

- (id)lastColumn
{
  id result = [(THPageHint *)self nonEmptyBodyCount];
  if (result)
  {
    double v4 = (char *)[(THPageHint *)self nonEmptyBodyCount] - 1;
    return [(THPageHint *)self lastColumnForBodyIndex:v4];
  }
  return result;
}

- (id)firstColumnForBodyIndex:(unint64_t)a3
{
  id v3 = [(THPageHint *)self p_bodyHintAtIndex:a3];

  return [v3 firstColumn];
}

- (id)lastColumnForBodyIndex:(unint64_t)a3
{
  id v3 = [(THPageHint *)self p_bodyHintAtIndex:a3];

  return [v3 lastColumn];
}

- (id)firstChildHint
{
  id result = [(THPageHint *)self nonEmptyBodyCount];
  if (result)
  {
    return [(THPageHint *)self firstChildHintForBodyIndex:0];
  }
  return result;
}

- (id)lastChildHint
{
  id result = [(THPageHint *)self nonEmptyBodyCount];
  if (result)
  {
    double v4 = (char *)[(THPageHint *)self nonEmptyBodyCount] - 1;
    return [(THPageHint *)self lastChildHintForBodyIndex:v4];
  }
  return result;
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)firstHint
{
  if (![(THPageHint *)self nonEmptyBodyCount]) {
    return ($76C9DF09DF30CB4FBD89D11B5573AD82 *)&self->mBodylessStubHint;
  }

  return [(THPageHint *)self firstHintForBodyIndex:0];
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)lastHint
{
  if (![(THPageHint *)self nonEmptyBodyCount]) {
    return ($76C9DF09DF30CB4FBD89D11B5573AD82 *)&self->mBodylessStubHint;
  }
  id v3 = (char *)[(THPageHint *)self nonEmptyBodyCount] - 1;

  return [(THPageHint *)self lastHintForBodyIndex:v3];
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)firstHintForBodyIndex:(unint64_t)a3
{
  id v3 = [(THPageHint *)self p_bodyHintAtIndex:a3];

  return ($76C9DF09DF30CB4FBD89D11B5573AD82 *)[v3 firstHint];
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)lastHintForBodyIndex:(unint64_t)a3
{
  id v3 = [(THPageHint *)self p_bodyHintAtIndex:a3];

  return ($76C9DF09DF30CB4FBD89D11B5573AD82 *)[v3 lastHint];
}

- (id)anchoredAttachmentPositionsForBodyChildAtIndex:(unint64_t)a3
{
  id v3 = [(THPageHint *)self p_bodyHintAtIndex:a3];

  return [v3 anchoredAttachmentPositions];
}

- (void)setAnchoredAttachmentPositions:(id)a3 forBodyIndex:(unint64_t)a4
{
  id v5 = [(THPageHint *)self p_bodyHintAtIndex:a4];

  [v5 setAnchoredAttachmentPositions:a3];
}

- (void)setTopicNumbers:(void *)a3
{
  NSUInteger v3 = *((void *)a3 + 3);
  double v4 = [(THPageHint *)self firstHint];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL && v3 >= v4->var1.location) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THPageHint setTopicNumbers:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageHint.mm"] lineNumber:254 description:@"topicNumbers is out of sync with target hints"];
  }

  TSWPTopicNumberHints::operator=();
}

- (unint64_t)bodyCount
{
  return self->mBodyCount;
}

- (void)setBodyCount:(unint64_t)a3
{
  self->mBodyCount = a3;
}

- (unint64_t)nonEmptyBodyCount
{
  return self->mNonEmptyBodyCount;
}

- (void)setNonEmptyBodyCount:(unint64_t)a3
{
  self->mNonEmptyBodyCount = a3;
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)bodylessStubHint
{
  CGSize size = self[1].var0.size;
  retstr->var1 = (_NSRange)self[1].var0.origin;
  *(CGSize *)&retstr->var2 = size;
  *(_NSRange *)&retstr->var3.NSUInteger length = self[1].var1;
  CGSize v4 = *(CGSize *)&self->var3.length;
  retstr->var0.origin = *(CGPoint *)&self->var2;
  retstr->var0.CGSize size = v4;
  return self;
}

- (void)setBodylessStubHint:(id *)a3
{
  self->mBodylessStubHint._frameBounds.origin = a3->var0.origin;
  CGSize size = a3->var0.size;
  _NSRange var1 = a3->var1;
  long long v5 = *(_OWORD *)&a3->var3.length;
  *(_OWORD *)&self->mBodylessStubHint._nextWidowPullsDownFromCharIndex = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->mBodylessStubHint._anchoredRange.NSUInteger length = v5;
  self->mBodylessStubHint._frameBounds.CGSize size = size;
  self->mBodylessStubHint._range = var1;
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

- (void)topicNumbers
{
  return &self->_topicNumbers;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end