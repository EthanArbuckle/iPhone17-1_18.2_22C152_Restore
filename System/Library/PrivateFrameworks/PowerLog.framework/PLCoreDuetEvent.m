@interface PLCoreDuetEvent
- (NSArray)eventIntervals;
- (NSDictionary)childBundleIDToWeight;
- (NSString)bundleID;
- (NSString)processName;
- (id)description;
- (unsigned)updateType;
- (void)setBundleID:(id)a3;
- (void)setChildBundleIDToWeight:(id)a3;
- (void)setEventIntervals:(id)a3;
- (void)setProcessName:(id)a3;
- (void)setUpdateType:(unsigned __int8)a3;
@end

@implementation PLCoreDuetEvent

- (id)description
{
  v3 = NSString;
  v4 = [(PLCoreDuetEvent *)self bundleID];
  v5 = [(PLCoreDuetEvent *)self processName];
  v6 = [(PLCoreDuetEvent *)self eventIntervals];
  v7 = [(PLCoreDuetEvent *)self childBundleIDToWeight];
  v8 = [v3 stringWithFormat:@"bundleID=%@, processName=%@, eventIntervals=%@, childBundleIDToWeight=%@", v4, v5, v6, v7];

  return v8;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
}

- (unsigned)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(unsigned __int8)a3
{
  self->_updateType = a3;
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProcessName:(id)a3
{
}

- (NSDictionary)childBundleIDToWeight
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setChildBundleIDToWeight:(id)a3
{
}

- (NSArray)eventIntervals
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEventIntervals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIntervals, 0);
  objc_storeStrong((id *)&self->_childBundleIDToWeight, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end