@interface ICSTravelAdvisoryBehavior
- (ICSDateTimeUTCValue)acknowledged;
- (ICSTravelAdvisoryBehavior)initWithString:(id)a3;
- (void)setAcknowledged:(id)a3;
@end

@implementation ICSTravelAdvisoryBehavior

- (ICSTravelAdvisoryBehavior)initWithString:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICSTravelAdvisoryBehavior;
  return [(ICSProperty *)&v4 initWithValue:a3 type:5007];
}

- (ICSDateTimeUTCValue)acknowledged
{
  return (ICSDateTimeUTCValue *)[(ICSProperty *)self parameterValueForName:@"ACKNOWLEDGED"];
}

- (void)setAcknowledged:(id)a3
{
}

@end