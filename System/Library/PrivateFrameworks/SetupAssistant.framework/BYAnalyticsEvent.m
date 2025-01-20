@interface BYAnalyticsEvent
+ (id)eventWithName:(id)a3 withPayload:(id)a4 persist:(BOOL)a5;
- (BOOL)persist;
- (NSDictionary)payload;
- (NSString)name;
- (id)description;
- (void)setName:(id)a3;
- (void)setPayload:(id)a3;
- (void)setPersist:(BOOL)a3;
@end

@implementation BYAnalyticsEvent

+ (id)eventWithName:(id)a3 withPayload:(id)a4 persist:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(BYAnalyticsEvent);
  [(BYAnalyticsEvent *)v9 setName:v8];

  [(BYAnalyticsEvent *)v9 setPayload:v7];
  [(BYAnalyticsEvent *)v9 setPersist:v5];
  return v9;
}

- (id)description
{
  if ([(BYAnalyticsEvent *)self persist]) {
    v3 = @"persists";
  }
  else {
    v3 = @"does not persist";
  }
  v4 = NSString;
  BOOL v5 = [(BYAnalyticsEvent *)self name];
  v6 = [(BYAnalyticsEvent *)self payload];
  id v7 = [v4 stringWithFormat:@"%@ %@ (%@)", v5, v6, v3];

  return v7;
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

- (BOOL)persist
{
  return self->_persist;
}

- (void)setPersist:(BOOL)a3
{
  self->_persist = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end