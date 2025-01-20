@interface WLKStoredConfiguration
- (BOOL)activeUser;
- (NSDate)timestamp;
- (NSDictionary)requiredRequestKeyValuePairs;
- (NSString)utsc;
- (NSString)utsk;
- (NSString)vppaState;
- (id)description;
- (void)setActiveUser:(BOOL)a3;
- (void)setRequiredRequestKeyValuePairs:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setUtsc:(id)a3;
- (void)setVppaState:(id)a3;
@end

@implementation WLKStoredConfiguration

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)WLKStoredConfiguration;
  v4 = [(WLKStoredConfiguration *)&v10 description];
  v5 = [(WLKStoredConfiguration *)self requiredRequestKeyValuePairs];
  if ([(WLKStoredConfiguration *)self activeUser]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [(WLKStoredConfiguration *)self timestamp];
  v8 = [v3 stringWithFormat:@"%@ {rrkvp:%@ activeUser:%@ timestamp:%@}", v4, v5, v6, v7];

  return v8;
}

- (NSString)utsk
{
  v2 = [(WLKStoredConfiguration *)self requiredRequestKeyValuePairs];
  v3 = [v2 objectForKeyedSubscript:@"utsk"];
  v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (NSDictionary)requiredRequestKeyValuePairs
{
  return self->_requiredRequestKeyValuePairs;
}

- (void)setRequiredRequestKeyValuePairs:(id)a3
{
}

- (BOOL)activeUser
{
  return self->_activeUser;
}

- (void)setActiveUser:(BOOL)a3
{
  self->_activeUser = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)utsc
{
  return self->_utsc;
}

- (void)setUtsc:(id)a3
{
}

- (NSString)vppaState
{
  return self->_vppaState;
}

- (void)setVppaState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vppaState, 0);
  objc_storeStrong((id *)&self->_utsc, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_requiredRequestKeyValuePairs, 0);
}

@end