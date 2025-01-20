@interface OBAnalyticsEvent
+ (id)eventWithName:(id)a3 withPayload:(id)a4;
- (NSDictionary)payload;
- (NSString)name;
- (id)description;
- (void)setName:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation OBAnalyticsEvent

+ (id)eventWithName:(id)a3 withPayload:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(OBAnalyticsEvent);
  [(OBAnalyticsEvent *)v7 setName:v6];

  [(OBAnalyticsEvent *)v7 setPayload:v5];
  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(OBAnalyticsEvent *)self name];
  id v5 = [(OBAnalyticsEvent *)self payload];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end