@interface PLBackgroundTransferEvent
- (NSDate)startDate;
- (NSMutableSet)taskUUIDs;
- (NSString)bundleID;
- (id)description;
- (void)setBundleID:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTaskUUIDs:(id)a3;
@end

@implementation PLBackgroundTransferEvent

- (id)description
{
  v3 = NSString;
  v4 = [(PLBackgroundTransferEvent *)self startDate];
  v5 = [(PLBackgroundTransferEvent *)self bundleID];
  v6 = [(PLBackgroundTransferEvent *)self taskUUIDs];
  v7 = [v3 stringWithFormat:@"startDate=%@, bundleID=%@, taskUUIDs=%@", v4, v5, v6];

  return v7;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSMutableSet)taskUUIDs
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTaskUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskUUIDs, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end