@interface iapUUID
- (NSString)connectionUUID;
- (NSString)endpointUUID;
- (void)setConnectionUUID:(id)a3;
- (void)setEndpointUUID:(id)a3;
@end

@implementation iapUUID

- (NSString)connectionUUID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnectionUUID:(id)a3
{
}

- (NSString)endpointUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEndpointUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointUUID, 0);

  objc_storeStrong((id *)&self->_connectionUUID, 0);
}

@end