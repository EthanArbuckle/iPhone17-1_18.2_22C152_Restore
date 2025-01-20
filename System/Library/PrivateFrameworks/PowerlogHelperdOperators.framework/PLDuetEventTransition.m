@interface PLDuetEventTransition
- (BOOL)isStart;
- (NSDate)date;
- (NSString)bundleID;
- (id)description;
- (void)setBundleID:(id)a3;
- (void)setDate:(id)a3;
- (void)setIsStart:(BOOL)a3;
@end

@implementation PLDuetEventTransition

- (id)description
{
  v3 = NSString;
  v4 = [(PLDuetEventTransition *)self bundleID];
  v5 = [(PLDuetEventTransition *)self date];
  [v5 timeIntervalSince1970];
  v7 = [v3 stringWithFormat:@"bundleID=%@, date=%f, isStart=%i", v4, v6, -[PLDuetEventTransition isStart](self, "isStart")];

  return v7;
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDate:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (void)setIsStart:(BOOL)a3
{
  self->_isStart = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end