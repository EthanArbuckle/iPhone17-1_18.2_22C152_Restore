@interface THBodyHint
+ (BOOL)supportsSecureCoding;
- ($76C9DF09DF30CB4FBD89D11B5573AD82)firstHint;
- ($76C9DF09DF30CB4FBD89D11B5573AD82)lastHint;
- (CGSize)size;
- (NSDictionary)anchoredAttachmentPositions;
- (THBodyHint)initWithCoder:(id)a3;
- (TSDHint)firstChildHint;
- (TSDHint)lastChildHint;
- (_NSRange)anchoredRange;
- (_NSRange)range;
- (id).cxx_construct;
- (unint64_t)nextWidowPullsDownFromCharIndex;
- (unint64_t)startAnchoredCharIndex;
- (unint64_t)startCharIndex;
- (vector<TSWPTargetHint,)hints;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)offsetStartCharIndexBy:(int64_t)a3;
- (void)setAnchoredAttachmentPositions:(id)a3;
- (void)setFirstChildHint:(id)a3;
- (void)setHints:(const void *)a3;
- (void)setLastChildHint:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)trimToCharIndex:(unint64_t)a3 inTarget:(id)a4 removeAutoNumberFootnoteCount:(unint64_t)a5;
@end

@implementation THBodyHint

- (void)dealloc
{
  [(THBodyHint *)self setAnchoredAttachmentPositions:0];
  [(THBodyHint *)self setFirstChildHint:0];
  [(THBodyHint *)self setLastChildHint:0];
  v3.receiver = self;
  v3.super_class = (Class)THBodyHint;
  [(THBodyHint *)&v3 dealloc];
}

- (void)setHints:(const void *)a3
{
  p_mHints = (char *)&self->mHints;
  if (p_mHints != a3) {
    sub_56D9C(p_mHints, *(char **)a3, *((void *)a3 + 1), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4));
  }
}

- (vector<TSWPTargetHint,)hints
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<TSWPTargetHint, std::allocator<TSWPTargetHint>> *)sub_56F2C(retstr, self->mHints.__begin_, (uint64_t)self->mHints.__end_, 0xCCCCCCCCCCCCCCCDLL* ((self->mHints.__end_ - self->mHints.__begin_) >> 4));
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)firstHint
{
  if (self->mHints.__end_ == self->mHints.__begin_) {
    return 0;
  }
  else {
    return ($76C9DF09DF30CB4FBD89D11B5573AD82 *)self->mHints.__begin_;
  }
}

- ($76C9DF09DF30CB4FBD89D11B5573AD82)lastHint
{
  end = self->mHints.__end_;
  if (end == self->mHints.__begin_) {
    return 0;
  }
  else {
    return ($76C9DF09DF30CB4FBD89D11B5573AD82 *)((char *)end - 80);
  }
}

- (unint64_t)startCharIndex
{
  return *((void *)self->mHints.__begin_ + 4);
}

- (void)offsetStartCharIndexBy:(int64_t)a3
{
  begin = self->mHints.__begin_;
  int64_t v4 = self->mHints.__end_ - begin;
  if (v4)
  {
    unint64_t v5 = v4 / 80;
    if (v5 <= 1) {
      unint64_t v5 = 1;
    }
    int64x2_t v6 = vdupq_n_s64(a3);
    v7 = (int64x2_t *)((char *)begin + 48);
    do
    {
      v7[-1].i64[0] += a3;
      int64x2_t *v7 = vaddq_s64(*v7, v6);
      v7 += 5;
      --v5;
    }
    while (v5);
  }
}

- (_NSRange)range
{
  begin = self->mHints.__begin_;
  end = self->mHints.__end_;
  if (end == begin)
  {
    id location = NSInvalidRange[0];
    id length = NSInvalidRange[1];
  }
  else
  {
    NSRange v6 = NSUnionRange(*((NSRange *)begin + 2), *((NSRange *)end - 3));
    id length = (id)v6.length;
    id location = (id)v6.location;
  }
  result.id length = (NSUInteger)length;
  result.id location = (NSUInteger)location;
  return result;
}

- (unint64_t)startAnchoredCharIndex
{
  begin = self->mHints.__begin_;
  if (self->mHints.__end_ == begin) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return *((void *)begin + 7);
  }
}

- (_NSRange)anchoredRange
{
  begin = self->mHints.__begin_;
  end = self->mHints.__end_;
  if (end == begin)
  {
    id location = NSInvalidRange[0];
    id length = NSInvalidRange[1];
  }
  else
  {
    NSRange v6 = NSUnionRange(*(NSRange *)((char *)begin + 56), *(NSRange *)((char *)end - 24));
    id length = (id)v6.length;
    id location = (id)v6.location;
  }
  result.id length = (NSUInteger)length;
  result.id location = (NSUInteger)location;
  return result;
}

- (unint64_t)nextWidowPullsDownFromCharIndex
{
  objc_super v3 = [(THBodyHint *)self lastHint];
  if (self->mHints.__end_ == self->mHints.__begin_ || v3 == 0) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v3->var2;
  }
}

- (void)trimToCharIndex:(unint64_t)a3 inTarget:(id)a4 removeAutoNumberFootnoteCount:(unint64_t)a5
{
  begin = self->mHints.__begin_;
  if (*((void *)begin + 4) >= a3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBodyHint trimToCharIndex:inTarget:removeAutoNumberFootnoteCount:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBodyHint.mm") lineNumber:120 description:@"trimming will remove all characters from this page hint"];
    begin = self->mHints.__begin_;
  }
  unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((self->mHints.__end_ - begin) >> 4) - 1;
  v9 = (char *)begin + 80 * v8;
  unint64_t v11 = *((void *)v9 + 6);
  v10 = (unint64_t *)(v9 + 48);
  if (v11 < a3) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THBodyHint trimToCharIndex:inTarget:removeAutoNumberFootnoteCount:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBodyHint.mm"] lineNumber:124 description:@"Bad charIndex"];
  }
  v12 = (char *)begin + 80 * v8;
  unint64_t v15 = *((void *)v12 + 4);
  v14 = (unint64_t *)(v12 + 32);
  unint64_t v13 = v15;
  if (v15 > a3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBodyHint trimToCharIndex:inTarget:removeAutoNumberFootnoteCount:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBodyHint.mm") lineNumber:125 description:@"Bad charIndex"];
    unint64_t v13 = *v14;
  }
  *((void *)begin + 10 * v8 + 5) = a3 - v13;
  unint64_t *v10 = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THBodyHint)initWithCoder:(id)a3
{
  v62.receiver = self;
  v62.super_class = (Class)THBodyHint;
  int64_t v4 = [(THBodyHint *)&v62 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    NSRange v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
    objc_opt_class();
    [a3 decodeObjectOfClasses:v6 forKey:@"anchoredPositionAttachments"];
    v4->mAnchoredAttachmentPositions = (NSDictionary *)(id)TSUDynamicCast();
    id v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"codingSize"];
    id v58 = a3;
    if (v7)
    {
      [v7 CGSizeValue];
    }
    else
    {
      CGFloat width = CGSizeZero.width;
      CGFloat height = CGSizeZero.height;
    }
    v4->mSize.CGFloat width = width;
    v4->mSize.CGFloat height = height;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    unint64_t v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    objc_opt_class();
    [v58 decodeObjectOfClasses:v13 forKey:@"hints"];
    v61 = (void *)TSUDynamicCast();
    v60 = (char *)[v61 count];
    if ((uint64_t)v60 >= 1)
    {
      v14 = 0;
      p_begin = (void **)&v4->mHints.__begin_;
      unint64_t v15 = &isPad_ptr;
      do
      {
        objc_opt_class();
        [v61 objectAtIndexedSubscript:v14];
        v16 = (void *)TSUDynamicCast();
        objc_opt_class();
        [v16 objectForKeyedSubscript:@"frameBounds"];
        v17 = (void *)TSUDynamicCast();
        if (v17)
        {
          [v17 CGRectValue];
          CGFloat x = v18;
          CGFloat y = v20;
          CGFloat v23 = v22;
          CGFloat v25 = v24;
        }
        else
        {
          CGFloat x = CGRectZero.origin.x;
          CGFloat y = CGRectZero.origin.y;
          CGFloat v23 = CGRectZero.size.width;
          CGFloat v25 = CGRectZero.size.height;
        }
        objc_opt_class();
        [v16 objectForKeyedSubscript:@"range"];
        v26 = (void *)TSUDynamicCast();
        if (v26)
        {
          id v27 = [v26 rangeValue];
          uint64_t v29 = v28;
        }
        else
        {
          id v27 = 0;
          uint64_t v29 = 0;
        }
        objc_opt_class();
        [v16 objectForKeyedSubscript:@"nextWidowPullsDownFromCharIndex"];
        v30 = (void *)TSUDynamicCast();
        if (v30) {
          id v31 = [v30 unsignedIntegerValue];
        }
        else {
          id v31 = 0;
        }
        objc_opt_class();
        [v16 objectForKeyedSubscript:@"anchoredRange"];
        v32 = (void *)TSUDynamicCast();
        if (v32)
        {
          id v33 = [v32 rangeValue];
          uint64_t v35 = v34;
        }
        else
        {
          id v33 = 0;
          uint64_t v35 = 0;
        }
        v36 = v15;
        objc_opt_class();
        [v16 objectForKeyedSubscript:@"columnCount"];
        v37 = (void *)TSUDynamicCast();
        if (v37) {
          id v38 = [v37 unsignedIntegerValue];
        }
        else {
          id v38 = 0;
        }
        end = (char *)v4->mHints.__end_;
        unint64_t value = (unint64_t)v4->mHints.__end_cap_.__value_;
        if ((unint64_t)end >= value)
        {
          begin = (char *)*p_begin;
          unint64_t v43 = 0xCCCCCCCCCCCCCCCDLL * ((end - (unsigned char *)*p_begin) >> 4);
          unint64_t v44 = v43 + 1;
          if (v43 + 1 > 0x333333333333333) {
            sub_3D1D0();
          }
          unint64_t v45 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(value - (void)begin) >> 4);
          if (2 * v45 > v44) {
            unint64_t v44 = 2 * v45;
          }
          if (v45 >= 0x199999999999999) {
            unint64_t v46 = 0x333333333333333;
          }
          else {
            unint64_t v46 = v44;
          }
          if (v46)
          {
            v47 = (char *)sub_43484((uint64_t)&v4->mHints.__end_cap_, v46);
            begin = (char *)v4->mHints.__begin_;
            end = (char *)v4->mHints.__end_;
          }
          else
          {
            v47 = 0;
          }
          v48 = (CGFloat *)&v47[80 * v43];
          CGFloat *v48 = x;
          v48[1] = y;
          v48[2] = v23;
          v48[3] = v25;
          *((void *)v48 + 4) = v27;
          *((void *)v48 + 5) = v29;
          *((void *)v48 + 6) = v31;
          *((void *)v48 + 7) = v33;
          *((void *)v48 + 8) = v35;
          *((void *)v48 + 9) = v38;
          v49 = v48;
          unint64_t v15 = v36;
          if (end != begin)
          {
            do
            {
              *((_OWORD *)v49 - 5) = *((_OWORD *)end - 5);
              long long v50 = *((_OWORD *)end - 4);
              long long v51 = *((_OWORD *)end - 3);
              long long v52 = *((_OWORD *)end - 1);
              *((_OWORD *)v49 - 2) = *((_OWORD *)end - 2);
              *((_OWORD *)v49 - 1) = v52;
              *((_OWORD *)v49 - 4) = v50;
              *((_OWORD *)v49 - 3) = v51;
              v49 -= 10;
              end -= 80;
            }
            while (end != begin);
            begin = (char *)*p_begin;
          }
          v41 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v48 + 10);
          v4->mHints.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v49;
          v4->mHints.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v48 + 10);
          v4->mHints.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v47[80 * v46];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *(CGFloat *)end = x;
          *((CGFloat *)end + 1) = y;
          *((CGFloat *)end + 2) = v23;
          *((CGFloat *)end + 3) = v25;
          *((void *)end + 4) = v27;
          *((void *)end + 5) = v29;
          *((void *)end + 6) = v31;
          *((void *)end + 7) = v33;
          v41 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(end + 80);
          *((void *)end + 8) = v35;
          *((void *)end + 9) = v38;
        }
        v4->mHints.__end_ = v41;
        ++v14;
      }
      while (v14 != v60);
    }
    Class v53 = NSClassFromString(@"TSDDefaultHint");
    uint64_t v54 = objc_opt_class();
    uint64_t v55 = objc_opt_class();
    v56 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v53, v54, v55, objc_opt_class(), 0);
    v4->mFirstChildHint = (TSDHint *)[v58 decodeObjectOfClasses:v56 forKey:@"firstChildHint"];
    v4->mLastChildHint = (TSDHint *)[v58 decodeObjectOfClasses:v56 forKey:@"lastChildHint"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:[self anchoredAttachmentPositions] forKey:@"anchoredPositionAttachments"];
  [(THBodyHint *)self size];
  [a3 encodeObject:[NSValue valueWithCGSize:] forKey:@"codingSize"];
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0xCCCCCCCCCCCCCCCDLL * ((self->mHints.__end_ - self->mHints.__begin_) >> 4)];
  begin = self->mHints.__begin_;
  if (self->mHints.__end_ != begin)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      v9 = (void *)((char *)begin + v7);
      v10[0] = @"frameBounds";
      v11[0] = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", *(double *)((char *)begin + v7), *(double *)((char *)begin + v7 + 8), *(double *)((char *)begin + v7 + 16), *(double *)((char *)begin + v7 + 24));
      v10[1] = @"range";
      v11[1] = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v9[4], v9[5]);
      v10[2] = @"nextWidowPullsDownFromCharIndex";
      v11[2] = +[NSNumber numberWithUnsignedInteger:v9[6]];
      v10[3] = @"anchoredRange";
      v11[3] = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v9[7], v9[8]);
      v10[4] = @"columnCount";
      v11[4] = +[NSNumber numberWithUnsignedInteger:v9[9]];
      [v5 addObject:[NSDictionary dictionaryWithObjects:forKeys:count:v11, v10, 5]];
      ++v8;
      begin = self->mHints.__begin_;
      v7 += 80;
    }
    while (v8 < 0xCCCCCCCCCCCCCCCDLL * ((self->mHints.__end_ - begin) >> 4));
  }
  [a3 encodeObject:v5 forKey:@"hints"];

  [a3 encodeObject:self->mFirstChildHint forKey:@"firstChildHint"];
  [a3 encodeObject:self->mLastChildHint forKey:@"lastChildHint"];
}

- (NSDictionary)anchoredAttachmentPositions
{
  return self->mAnchoredAttachmentPositions;
}

- (void)setAnchoredAttachmentPositions:(id)a3
{
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

- (TSDHint)firstChildHint
{
  return self->mFirstChildHint;
}

- (void)setFirstChildHint:(id)a3
{
}

- (TSDHint)lastChildHint
{
  return self->mLastChildHint;
}

- (void)setLastChildHint:(id)a3
{
}

- (void).cxx_destruct
{
  begin = self->mHints.__begin_;
  if (begin)
  {
    self->mHints.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  return self;
}

@end