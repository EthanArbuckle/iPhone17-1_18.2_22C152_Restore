@interface STSWifiHandoverConnectionHandle
@end

@implementation STSWifiHandoverConnectionHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpServerHandle, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_session);
}

@end