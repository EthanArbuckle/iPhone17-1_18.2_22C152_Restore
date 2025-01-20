@interface POWSTrustMexResponse
- (NSString)bindingName;
- (NSString)endpointURLString;
- (NSString)policyName;
- (NSString)portName;
- (NSString)transport;
- (unint64_t)version;
- (void)setBindingName:(id)a3;
- (void)setEndpointURLString:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setPortName:(id)a3;
- (void)setTransport:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation POWSTrustMexResponse

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSString)endpointURLString
{
  return self->_endpointURLString;
}

- (void)setEndpointURLString:(id)a3
{
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSString)bindingName
{
  return self->_bindingName;
}

- (void)setBindingName:(id)a3
{
}

- (NSString)portName
{
  return self->_portName;
}

- (void)setPortName:(id)a3
{
}

- (NSString)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_portName, 0);
  objc_storeStrong((id *)&self->_bindingName, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
  objc_storeStrong((id *)&self->_endpointURLString, 0);
}

@end