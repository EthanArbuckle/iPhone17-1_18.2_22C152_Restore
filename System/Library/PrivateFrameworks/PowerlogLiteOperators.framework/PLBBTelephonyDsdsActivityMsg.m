@interface PLBBTelephonyDsdsActivityMsg
- (NSDate)signalStrengthLogTimestamp;
- (NSNumber)signalBars;
- (NSString)callStatus;
- (NSString)campedRAT;
- (NSString)currentRAT;
- (NSString)preferredRAT;
- (NSString)simStatus;
- (PLBBTelephonyDsdsActivityMsg)init;
- (void)setCallStatus:(id)a3;
- (void)setCampedRAT:(id)a3;
- (void)setCurrentRAT:(id)a3;
- (void)setPreferredRAT:(id)a3;
- (void)setSignalBars:(id)a3;
- (void)setSignalStrengthLogTimestamp:(id)a3;
- (void)setSimStatus:(id)a3;
@end

@implementation PLBBTelephonyDsdsActivityMsg

- (NSString)campedRAT
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (PLBBTelephonyDsdsActivityMsg)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLBBTelephonyDsdsActivityMsg;
  v2 = [(PLBBTelephonyDsdsActivityMsg *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    [(PLBBTelephonyDsdsActivityMsg *)v2 setSignalStrengthLogTimestamp:v3];

    [(PLBBTelephonyDsdsActivityMsg *)v2 setSignalBars:0];
    [(PLBBTelephonyDsdsActivityMsg *)v2 setCampedRAT:0];
    [(PLBBTelephonyDsdsActivityMsg *)v2 setSimStatus:0];
    [(PLBBTelephonyDsdsActivityMsg *)v2 setCallStatus:@"Inactive"];
  }
  return v2;
}

- (NSDate)signalStrengthLogTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSignalStrengthLogTimestamp:(id)a3
{
}

- (NSNumber)signalBars
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSignalBars:(id)a3
{
}

- (void)setCampedRAT:(id)a3
{
}

- (NSString)simStatus
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSimStatus:(id)a3
{
}

- (NSString)callStatus
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCallStatus:(id)a3
{
}

- (NSString)currentRAT
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentRAT:(id)a3
{
}

- (NSString)preferredRAT
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPreferredRAT:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredRAT, 0);
  objc_storeStrong((id *)&self->_currentRAT, 0);
  objc_storeStrong((id *)&self->_callStatus, 0);
  objc_storeStrong((id *)&self->_simStatus, 0);
  objc_storeStrong((id *)&self->_campedRAT, 0);
  objc_storeStrong((id *)&self->_signalBars, 0);
  objc_storeStrong((id *)&self->_signalStrengthLogTimestamp, 0);
}

@end