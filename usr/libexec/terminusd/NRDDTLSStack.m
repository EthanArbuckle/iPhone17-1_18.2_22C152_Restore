@interface NRDDTLSStack
- (id)description;
@end

@implementation NRDDTLSStack

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_udpConnection, 0);
  objc_storeStrong((id *)&self->_dtlsConnection, 0);

  objc_storeStrong((id *)&self->_dtlsListener, 0);
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v4 = "client";
  if (self)
  {
    unint64_t identifier = self->_identifier;
    if (self->_server) {
      v4 = "server";
    }
  }
  else
  {
    unint64_t identifier = 0;
  }
  id v6 = [v3 initWithFormat:v5];

  return v6;
}

@end