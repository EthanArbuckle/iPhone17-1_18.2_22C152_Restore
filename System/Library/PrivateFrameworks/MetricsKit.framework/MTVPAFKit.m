@interface MTVPAFKit
- (id)trackerWithPlayList:(id)a3;
- (id)trackerWithPlayList:(id)a3 eventData:(id)a4;
@end

@implementation MTVPAFKit

- (id)trackerWithPlayList:(id)a3
{
  return [(MTVPAFKit *)self trackerWithPlayList:a3 eventData:0];
}

- (id)trackerWithPlayList:(id)a3 eventData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[MTMediaActivityTracker alloc] initWithVPAFKit:self playlist:v7 eventData:v6];

  return v8;
}

@end