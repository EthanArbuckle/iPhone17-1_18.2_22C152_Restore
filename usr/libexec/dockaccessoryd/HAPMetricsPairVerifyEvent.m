@interface HAPMetricsPairVerifyEvent
- (HAPMetricsPairVerifyEvent)initWithAccessory:(id)a3 forLinkType:(id)a4 durationInMS:(unint64_t)a5 reason:(id)a6 pvError:(id)a7;
- (NSNumber)linkType;
- (NSString)accessoryIdentifier;
- (NSString)reason;
- (id)description;
- (id)eventName;
- (id)serializedEvent;
- (unint64_t)durationInMS;
@end

@implementation HAPMetricsPairVerifyEvent

- (HAPMetricsPairVerifyEvent)initWithAccessory:(id)a3 forLinkType:(id)a4 durationInMS:(unint64_t)a5 reason:(id)a6 pvError:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HAPMetricsPairVerifyEvent;
  v16 = [(DKMLogEvent *)&v20 init];
  if (v16)
  {
    uint64_t v17 = [v12 identifier];
    accessoryIdentifier = v16->_accessoryIdentifier;
    v16->_accessoryIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v16->_linkType, a4);
    v16->_durationInMS = a5;
    objc_storeStrong((id *)&v16->_reason, a6);
    [(DKMLogEvent *)v16 setError:v15];
  }

  return v16;
}

- (id)description
{
  v3 = [(HAPMetricsPairVerifyEvent *)self accessoryIdentifier];
  v4 = [(HAPMetricsPairVerifyEvent *)self linkType];
  unint64_t v5 = [(HAPMetricsPairVerifyEvent *)self durationInMS];
  v6 = [(HAPMetricsPairVerifyEvent *)self reason];
  v7 = [(DKMLogEvent *)self error];
  v8 = +[NSString stringWithFormat:@"HAPMetricsPairVerifyEvent - Accessory Identifier: %@, linkType: %@, duration: %lu ms, reason: %@, error: %@", v3, v4, v5, v6, v7];

  return v8;
}

- (id)eventName
{
  return @"com.apple.dockaccessoryd.pairverify";
}

- (id)serializedEvent
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = +[NSNumber numberWithUnsignedInteger:[(HAPMetricsPairVerifyEvent *)self durationInMS] / 0x3E8];
  [v3 setObject:v4 forKeyedSubscript:@"duration"];

  unint64_t v5 = +[NSNumber numberWithUnsignedInteger:[(HAPMetricsPairVerifyEvent *)self durationInMS]];
  [v3 setObject:v5 forKeyedSubscript:@"durationInMS"];

  v6 = [(HAPMetricsPairVerifyEvent *)self linkType];
  [v3 setObject:v6 forKeyedSubscript:@"linkType"];

  v7 = [(HAPMetricsPairVerifyEvent *)self reason];
  [v3 setObject:v7 forKeyedSubscript:@"reason"];

  id v8 = [v3 copy];

  return v8;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (NSNumber)linkType
{
  return self->_linkType;
}

- (unint64_t)durationInMS
{
  return self->_durationInMS;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_linkType, 0);

  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end