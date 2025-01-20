@interface UITextRangeImpl
+ (id)wrapDOMRange:(id)a3;
+ (id)wrapDOMRange:(id)a3 withAffinity:(int64_t)a4;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (DOMRange)domRange;
- (id)description;
- (id)end;
- (id)start;
- (int64_t)affinity;
- (void)adjustAffinityOfPosition:(id)a3 isStart:(BOOL)a4;
- (void)setAffinity:(int64_t)a3;
- (void)setDomRange:(id)a3;
@end

@implementation UITextRangeImpl

+ (id)wrapDOMRange:(id)a3 withAffinity:(int64_t)a4
{
  if (a3)
  {
    id v5 = a3;
    v6 = objc_alloc_init(UITextRangeImpl);
    [(UITextRangeImpl *)v6 setDomRange:v5];

    [(UITextRangeImpl *)v6 setAffinity:a4];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)wrapDOMRange:(id)a3
{
  return (id)[a1 wrapDOMRange:a3 withAffinity:1];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(UITextRangeImpl *)self start];
  v6 = [(UITextRangeImpl *)self end];
  v7 = [v3 stringWithFormat:@"%@(%p) - start:%@, end:%@", v4, self, v5, v6];

  return v7;
}

- (void)adjustAffinityOfPosition:(id)a3 isStart:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([(UITextRangeImpl *)self isEmpty]) {
    BOOL v4 = [(UITextRangeImpl *)self affinity] == 0;
  }
  v6 = [v7 webVisiblePosition];
  [v6 setAffinity:v4];
}

- (id)start
{
  WebThreadLock();
  v3 = objc_alloc_init(UITextPositionImpl);
  BOOL v4 = [(UITextRangeImpl *)self domRange];
  id v5 = [v4 startPosition];
  [(UITextPositionImpl *)v3 setWebVisiblePosition:v5];

  [(UITextRangeImpl *)self adjustAffinityOfPosition:v3 isStart:1];
  return v3;
}

- (id)end
{
  WebThreadLock();
  v3 = objc_alloc_init(UITextPositionImpl);
  BOOL v4 = [(UITextRangeImpl *)self domRange];
  id v5 = [v4 endPosition];
  [(UITextPositionImpl *)v3 setWebVisiblePosition:v5];

  [(UITextRangeImpl *)self adjustAffinityOfPosition:v3 isStart:0];
  return v3;
}

- (BOOL)isEmpty
{
  WebThreadLock();
  v3 = [(UITextRangeImpl *)self domRange];
  char v4 = [v3 collapsed];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  WebThreadLock();
  id v5 = (UITextRangeImpl *)v4;
  if (self == v5)
  {
    BOOL v10 = 1;
    goto LABEL_6;
  }
  v6 = [(UITextRangeImpl *)self domRange];
  id v7 = [(UITextRangeImpl *)v5 domRange];
  v8 = [v6 startContainer];
  v9 = [v7 startContainer];

  if (v8 != v9) {
    goto LABEL_3;
  }
  if (![v6 collapsed])
  {
    if (v6 != v7)
    {
      if (([v7 collapsed] & 1) == 0
        && ![v6 compareBoundaryPoints:2 sourceRange:v7])
      {
        goto LABEL_15;
      }
      goto LABEL_3;
    }
LABEL_16:
    BOOL v10 = 1;
    goto LABEL_4;
  }
  int64_t v12 = [(UITextRangeImpl *)self affinity];
  if (v12 != [(UITextRangeImpl *)v5 affinity]) {
    goto LABEL_3;
  }
  if (v6 == v7) {
    goto LABEL_16;
  }
  if ([v7 collapsed])
  {
LABEL_15:
    BOOL v10 = [v6 compareBoundaryPoints:0 sourceRange:v7] == 0;
    goto LABEL_4;
  }
LABEL_3:
  BOOL v10 = 0;
LABEL_4:

LABEL_6:
  return v10;
}

- (DOMRange)domRange
{
  return self->_domRange;
}

- (void)setDomRange:(id)a3
{
}

- (int64_t)affinity
{
  return self->_affinityIfCollapsed;
}

- (void)setAffinity:(int64_t)a3
{
  self->_affinityIfCollapsed = a3;
}

- (void).cxx_destruct
{
}

@end