@interface THGlossaryEntryFloatingRep
- (BOOL)directlyManagesLayerContent;
- (void)dealloc;
- (void)drawInLayerContext:(CGContext *)a3;
@end

@implementation THGlossaryEntryFloatingRep

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)THGlossaryEntryFloatingRep;
  [(THGlossaryEntryFloatingRep *)&v2 dealloc];
}

- (void)drawInLayerContext:(CGContext *)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryFloatingRep drawInLayerContext:]");
  v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryFloatingRep.m"];

  [v3 handleFailureInFunction:v4, v5, 34, @"this method should never be called, and entry reps should never get a bitmap allocated" file lineNumber description];
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

@end