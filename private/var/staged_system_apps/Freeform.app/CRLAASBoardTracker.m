@interface CRLAASBoardTracker
- (void)boardItemDidInsert:(id)a3;
@end

@implementation CRLAASBoardTracker

- (void)boardItemDidInsert:(id)a3
{
  v3 = (char *)a3;
  swift_retain();
  sub_100698684(v3);

  swift_release();
}

@end