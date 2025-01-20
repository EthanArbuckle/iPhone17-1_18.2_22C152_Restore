@interface UAPingUserActivityInfo
- (UAPingUserActivityInfo)initWithPayloadSize:(unint64_t)a3;
- (id)initFromPing:(id)a3;
- (id)statusString;
- (id)wasContinuedBlock;
- (void)setWasContinuedBlock:(id)a3;
@end

@implementation UAPingUserActivityInfo

- (UAPingUserActivityInfo)initWithPayloadSize:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UAPingUserActivityInfo;
  v4 = [(UAPingUserActivityInfo *)&v8 initWithUUID:0 type:21 options:0];
  v5 = v4;
  if (v4)
  {
    [(UAPingUserActivityInfo *)v4 setActivityType:@"com.apple.private.handoff.ping"];
    [(UAPingUserActivityInfo *)v5 setTitle:@"PING!"];
    [(UAPingUserActivityInfo *)v5 setEligibleForHandoff:1];
    if (a3)
    {
      id v6 = +[NSMutableData dataWithLength:a3];
      arc4random_buf([v6 mutableBytes], (size_t)objc_msgSend(v6, "length"));
      [(UAPingUserActivityInfo *)v5 setPayload:v6 identifier:UAUserActivityUserInfoPayload];
    }
  }
  return v5;
}

- (id)initFromPing:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UAPingUserActivityInfo;
  v3 = [(UAPingUserActivityInfo *)&v6 initWithUserActivityInfo:a3];
  v4 = v3;
  if (v3)
  {
    [(UAPingUserActivityInfo *)v3 setType:22];
    [(UAPingUserActivityInfo *)v4 setActivityType:@"com.apple.private.handoff.pong"];
    [(UAPingUserActivityInfo *)v4 setTitle:@"PONG!"];
    [(UAPingUserActivityInfo *)v4 setEligibleForHandoff:1];
  }
  return v4;
}

- (id)statusString
{
  v3 = [(UAPingUserActivityInfo *)self uuid];
  v4 = [v3 UUIDString];
  v5 = [(UAPingUserActivityInfo *)self payloadForIdentifier:UAUserActivityUserInfoPayload];
  objc_super v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: payloadSize=%ld", v4, [v5 length]);

  return v6;
}

- (id)wasContinuedBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setWasContinuedBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end