@interface BYAnalyticsLazyEvent
+ (id)eventWithName:(id)a3 withPayloadBlock:(id)a4 persist:(BOOL)a5;
- (BOOL)persist;
- (NSString)name;
- (id)description;
- (id)payloadBlock;
- (void)setName:(id)a3;
- (void)setPayloadBlock:(id)a3;
- (void)setPersist:(BOOL)a3;
@end

@implementation BYAnalyticsLazyEvent

+ (id)eventWithName:(id)a3 withPayloadBlock:(id)a4 persist:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = objc_alloc_init(BYAnalyticsLazyEvent);
  [(BYAnalyticsLazyEvent *)v9 setName:v8];

  [(BYAnalyticsLazyEvent *)v9 setPayloadBlock:v7];
  [(BYAnalyticsLazyEvent *)v9 setPersist:v5];
  return v9;
}

- (id)description
{
  v3 = [(BYAnalyticsLazyEvent *)self payloadBlock];
  v4 = v3[2]();

  if ([(BYAnalyticsLazyEvent *)self persist]) {
    BOOL v5 = @"persists";
  }
  else {
    BOOL v5 = @"does not persist";
  }
  v6 = NSString;
  id v7 = [(BYAnalyticsLazyEvent *)self name];
  id v8 = [v6 stringWithFormat:@"%@ %@ (%@)", v7, v4, v5];

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (id)payloadBlock
{
  return self->_payloadBlock;
}

- (void)setPayloadBlock:(id)a3
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
  objc_storeStrong(&self->_payloadBlock, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end