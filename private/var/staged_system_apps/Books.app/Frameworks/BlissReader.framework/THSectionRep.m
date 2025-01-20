@interface THSectionRep
- (BOOL)directlyManagesLayerContent;
- (BOOL)masksToBounds;
- (void)drawInLayerContext:(CGContext *)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
@end

@implementation THSectionRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  if (!CGRectIsEmpty(a3))
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionRep setNeedsDisplayInRect:]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionRep.m"];
    [v3 handleFailureInFunction:v4, v5, 27, @"this method should never be called, and section reps should never get a bitmap allocated" file lineNumber description];
  }
}

- (void)drawInLayerContext:(CGContext *)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionRep drawInLayerContext:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionRep.m"];

  [v3 handleFailureInFunction:v4, v5, 37, @"this method should never be called, and section reps should never get a bitmap allocated" file lineNumber description];
}

- (BOOL)masksToBounds
{
  return 1;
}

@end