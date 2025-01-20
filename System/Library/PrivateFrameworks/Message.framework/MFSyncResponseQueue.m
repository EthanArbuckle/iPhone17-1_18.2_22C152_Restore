@interface MFSyncResponseQueue
- (BOOL)addItem:(id)a3;
- (BOOL)shouldSyncFlags;
@end

@implementation MFSyncResponseQueue

- (BOOL)addItem:(id)a3
{
  id v4 = a3;
  if ([v4 responseType] == 17)
  {
    v5 = [v4 fetchResults];
    v7.receiver = self;
    v7.super_class = (Class)MFSyncResponseQueue;
    [(MFBufferedQueue *)&v7 addItem:v5];
  }
  return 1;
}

- (BOOL)shouldSyncFlags
{
  return *(&self->super._isSearching + 1);
}

@end