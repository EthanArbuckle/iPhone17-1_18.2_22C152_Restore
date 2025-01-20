@interface PLBBTelephonyDsdsRegMsg
- (NSString)operatorName;
- (NSString)status;
- (PLBBTelephonyDsdsRegMsg)init;
- (int)dataActive;
- (int)dataAttached;
- (int)dataIndicator;
- (int)isHome;
- (int)serviceOpt;
- (void)setDataActive:(int)a3;
- (void)setDataAttached:(int)a3;
- (void)setDataIndicator:(int)a3;
- (void)setIsHome:(int)a3;
- (void)setOperatorName:(id)a3;
- (void)setServiceOpt:(int)a3;
- (void)setStatus:(id)a3;
@end

@implementation PLBBTelephonyDsdsRegMsg

- (PLBBTelephonyDsdsRegMsg)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLBBTelephonyDsdsRegMsg;
  v2 = [(PLBBTelephonyDsdsRegMsg *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PLBBTelephonyDsdsRegMsg *)v2 setDataIndicator:0xFFFFFFFFLL];
    [(PLBBTelephonyDsdsRegMsg *)v3 setDataAttached:0xFFFFFFFFLL];
    [(PLBBTelephonyDsdsRegMsg *)v3 setDataActive:0xFFFFFFFFLL];
    [(PLBBTelephonyDsdsRegMsg *)v3 setOperatorName:0];
    [(PLBBTelephonyDsdsRegMsg *)v3 setIsHome:0xFFFFFFFFLL];
    [(PLBBTelephonyDsdsRegMsg *)v3 setStatus:@"status"];
    [(PLBBTelephonyDsdsRegMsg *)v3 setServiceOpt:0xFFFFFFFFLL];
  }
  return v3;
}

- (int)dataIndicator
{
  return self->_dataIndicator;
}

- (void)setDataIndicator:(int)a3
{
  self->_dataIndicator = a3;
}

- (int)dataAttached
{
  return self->_dataAttached;
}

- (void)setDataAttached:(int)a3
{
  self->_dataAttached = a3;
}

- (int)dataActive
{
  return self->_dataActive;
}

- (void)setDataActive:(int)a3
{
  self->_dataActive = a3;
}

- (NSString)operatorName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOperatorName:(id)a3
{
}

- (int)isHome
{
  return self->_isHome;
}

- (void)setIsHome:(int)a3
{
  self->_isHome = a3;
}

- (NSString)status
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStatus:(id)a3
{
}

- (int)serviceOpt
{
  return self->_serviceOpt;
}

- (void)setServiceOpt:(int)a3
{
  self->_serviceOpt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
}

@end