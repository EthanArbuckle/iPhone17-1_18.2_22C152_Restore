@interface THVisibleColumnProxy
- (THVisibleColumnProxy)initWithPageIndex:(unint64_t)a3 pageController:(id)a4;
- (_NSRange)anchoredRange;
- (_NSRange)range;
- (const)p_targetFirstHint;
- (const)p_targetLastHint;
- (unint64_t)nextWidowPullsDownFromCharIndex;
- (unint64_t)startAnchoredCharIndex;
- (unint64_t)startCharIndex;
- (void)dealloc;
- (void)trimToCharIndex:(unint64_t)a3 inTarget:(id)a4 removeAutoNumberFootnoteCount:(unint64_t)a5;
@end

@implementation THVisibleColumnProxy

- (THVisibleColumnProxy)initWithPageIndex:(unint64_t)a3 pageController:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THVisibleColumnProxy;
  v6 = [(THVisibleColumnProxy *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->mPageIndex = a3;
    v6->mPageController = (THPageController *)a4;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THVisibleColumnProxy;
  [(THVisibleColumnProxy *)&v3 dealloc];
}

- (unint64_t)startCharIndex
{
  return *((void *)[(THVisibleColumnProxy *)self p_targetFirstHint] + 4);
}

- (_NSRange)range
{
  objc_super v3 = [(THVisibleColumnProxy *)self p_targetFirstHint];
  NSUInteger location = v3->var1.location;
  NSUInteger length = v3->var1.length;
  NSRange v6 = (NSRange)*((_OWORD *)[(THVisibleColumnProxy *)self p_targetLastHint] + 2);
  v7.NSUInteger location = location;
  v7.NSUInteger length = length;

  NSRange v10 = NSUnionRange(v7, v6);
  NSUInteger v9 = v10.length;
  NSUInteger v8 = v10.location;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (unint64_t)startAnchoredCharIndex
{
  return *((void *)[(THVisibleColumnProxy *)self p_targetFirstHint] + 7);
}

- (_NSRange)anchoredRange
{
  if (![(THVisibleColumnProxy *)self p_targetFirstHint]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THVisibleColumnProxy anchoredRange]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THVisibleColumnProxy.mm") lineNumber:71 description:@"invalid nil value for '%s'", "self.p_targetFirstHint"];
  }
  if (![(THVisibleColumnProxy *)self p_targetLastHint]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THVisibleColumnProxy anchoredRange]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THVisibleColumnProxy.mm") lineNumber:72 description:@"invalid nil value for '%s'", "self.p_targetLastHint"];
  }
  objc_super v3 = [(THVisibleColumnProxy *)self p_targetFirstHint];
  NSUInteger location = v3->var3.location;
  NSUInteger length = v3->var3.length;
  NSRange v6 = *(NSRange *)((char *)[(THVisibleColumnProxy *)self p_targetLastHint] + 56);
  v7.NSUInteger location = location;
  v7.NSUInteger length = length;

  NSRange v10 = NSUnionRange(v7, v6);
  NSUInteger v9 = v10.length;
  NSUInteger v8 = v10.location;
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (unint64_t)nextWidowPullsDownFromCharIndex
{
  return *((void *)[(THVisibleColumnProxy *)self p_targetLastHint] + 6);
}

- (void)trimToCharIndex:(unint64_t)a3 inTarget:(id)a4 removeAutoNumberFootnoteCount:(unint64_t)a5
{
}

- (const)p_targetFirstHint
{
  id v2 = [(THPageController *)self->mPageController i_pageHintForPageIndex:self->mPageIndex];

  return (const $76C9DF09DF30CB4FBD89D11B5573AD82 *)[v2 firstHint];
}

- (const)p_targetLastHint
{
  id v2 = [(THPageController *)self->mPageController i_pageHintForPageIndex:self->mPageIndex];

  return (const $76C9DF09DF30CB4FBD89D11B5573AD82 *)[v2 lastHint];
}

@end