@interface SCWatchlistMergeHandler
- (id)commandsToMergeRecordWithServer:(id)a3;
@end

@implementation SCWatchlistMergeHandler

- (id)commandsToMergeRecordWithServer:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF980], "array", a3);
}

@end