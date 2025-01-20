@interface PXStoryTransitionCut
+ (id)cut;
@end

@implementation PXStoryTransitionCut

+ (id)cut
{
  id v2 = objc_alloc((Class)a1);
  CMTimeMakeWithSeconds(&v5, 0.0, 600);
  v3 = (void *)[v2 initWithIdentifier:0 kind:1 duration:&v5 event:0];
  return v3;
}

@end