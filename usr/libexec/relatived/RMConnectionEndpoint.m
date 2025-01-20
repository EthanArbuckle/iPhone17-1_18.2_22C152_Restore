@interface RMConnectionEndpoint
@end

@implementation RMConnectionEndpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityBoostReplyMessage, 0);
  objc_storeStrong((id *)&self->_messagingConnection, 0);
  objc_storeStrong((id *)&self->_streamingClientListener, 0);
  objc_storeStrong((id *)&self->_streamingClientConnection, 0);
  objc_storeStrong((id *)&self->_streamingServerConnection, 0);
  objc_destroyWeak((id *)&self->_dataDelegate);
  objc_destroyWeak((id *)&self->_connectionDelegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end