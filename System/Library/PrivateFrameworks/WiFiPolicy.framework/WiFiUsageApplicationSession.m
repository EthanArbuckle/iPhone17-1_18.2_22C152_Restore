@interface WiFiUsageApplicationSession
- (WiFiUsageApplicationSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4;
- (id)metricName;
- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4;
@end

@implementation WiFiUsageApplicationSession

- (void)applicationStateDidChange:(id)a3 withAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WiFiUsageSession *)self activeApplications];
  uint64_t v9 = [v8 count];

  if (!v6 || [v6 isEqualToString:@"com.apple.springboard"])
  {
    if ([(WiFiUsageSession *)self isSessionActive])
    {
      NSLog(&cfstr_SApplicationSe.isa, "-[WiFiUsageApplicationSession applicationStateDidChange:withAttributes:]");
      [(WiFiUsageSession *)self sessionDidEnd];
    }
    goto LABEL_7;
  }
  if (v9)
  {
    v10 = [(WiFiUsageSession *)self activeApplications];
    NSLog(&cfstr_SApplicationSe_1.isa, "-[WiFiUsageApplicationSession applicationStateDidChange:withAttributes:]", v10);

LABEL_7:
    v11.receiver = self;
    v11.super_class = (Class)WiFiUsageApplicationSession;
    [(WiFiUsageSession *)&v11 applicationStateDidChange:v6 withAttributes:v7];
    goto LABEL_8;
  }
  if ([v6 rangeOfString:@"spotlight" options:1] == 0x7FFFFFFFFFFFFFFFLL
    && [v6 rangeOfString:@".extension" options:1] == 0x7FFFFFFFFFFFFFFFLL
    && [v6 rangeOfString:@".widget" options:1] == 0x7FFFFFFFFFFFFFFFLL
    && [v6 rangeOfString:@"preferences" options:1] == 0x7FFFFFFFFFFFFFFFLL
    && +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:3])
  {
    NSLog(&cfstr_SApplicationSe_0.isa, "-[WiFiUsageApplicationSession applicationStateDidChange:withAttributes:]", v6);
    [(WiFiUsageSession *)self sessionDidStart];
    goto LABEL_7;
  }
LABEL_8:
}

- (WiFiUsageApplicationSession)initWithInterfaceName:(id)a3 andCapabilities:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageApplicationSession;
  return [(WiFiUsageSession *)&v5 initWithSessionType:5 andInterfaceName:a3 andCapabilities:a4];
}

- (id)metricName
{
  return @"com.apple.wifi.applicationsession";
}

@end