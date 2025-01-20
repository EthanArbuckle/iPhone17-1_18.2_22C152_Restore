@interface CheckIDSRegistrationMonitor
- (BOOL)isKTKeyDifferent:(id)a3;
- (NSString)reason;
- (void)setReason:(id)a3;
@end

@implementation CheckIDSRegistrationMonitor

- (BOOL)isKTKeyDifferent:(id)a3
{
  return 0;
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
}

@end