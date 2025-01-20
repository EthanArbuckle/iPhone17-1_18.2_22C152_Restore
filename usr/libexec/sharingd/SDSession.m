@interface SDSession
- (BOOL)sessionCreated;
- (NSData)dhSecretKey;
- (NSData)readKey;
- (NSData)writeKey;
- (NSMutableArray)sendDataQueue;
- (NSUUID)identifier;
- (NSUUID)peerIdentifier;
- (SFSession)clientSession;
- (id)description;
- (unint64_t)readNonce;
- (unint64_t)writeNonce;
- (void)setClientSession:(id)a3;
- (void)setDhSecretKey:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPeerIdentifier:(id)a3;
- (void)setReadKey:(id)a3;
- (void)setReadNonce:(unint64_t)a3;
- (void)setSendDataQueue:(id)a3;
- (void)setSessionCreated:(BOOL)a3;
- (void)setWriteKey:(id)a3;
- (void)setWriteNonce:(unint64_t)a3;
@end

@implementation SDSession

- (id)description
{
  NSAppendPrintF();
  id v3 = 0;
  v4 = v3;
  if (self->_identifier)
  {
    v13 = v3;
    NSAppendPrintF();
    id v5 = v13;

    v4 = v5;
  }
  if (self->_peerIdentifier)
  {
    NSAppendPrintF();
    id v6 = v4;

    v4 = v6;
  }
  if (self->_clientSession)
  {
    NSAppendPrintF();
    id v7 = v4;

    v4 = v7;
  }
  if (self->_sessionCreated) {
    v8 = "yes";
  }
  else {
    v8 = "no";
  }
  v12 = v8;
  NSAppendPrintF();
  id v9 = v4;

  if ([(NSMutableArray *)self->_sendDataQueue count])
  {
    [(NSMutableArray *)self->_sendDataQueue count];
    NSAppendPrintF();
    id v10 = v9;

    id v9 = v10;
  }

  return v9;
}

- (SFSession)clientSession
{
  return self->_clientSession;
}

- (void)setClientSession:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)dhSecretKey
{
  return self->_dhSecretKey;
}

- (void)setDhSecretKey:(id)a3
{
}

- (NSData)readKey
{
  return self->_readKey;
}

- (void)setReadKey:(id)a3
{
}

- (unint64_t)readNonce
{
  return self->_readNonce;
}

- (void)setReadNonce:(unint64_t)a3
{
  self->_readNonce = a3;
}

- (NSData)writeKey
{
  return self->_writeKey;
}

- (void)setWriteKey:(id)a3
{
}

- (unint64_t)writeNonce
{
  return self->_writeNonce;
}

- (void)setWriteNonce:(unint64_t)a3
{
  self->_writeNonce = a3;
}

- (NSUUID)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)setPeerIdentifier:(id)a3
{
}

- (NSMutableArray)sendDataQueue
{
  return self->_sendDataQueue;
}

- (void)setSendDataQueue:(id)a3
{
}

- (BOOL)sessionCreated
{
  return self->_sessionCreated;
}

- (void)setSessionCreated:(BOOL)a3
{
  self->_sessionCreated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendDataQueue, 0);
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
  objc_storeStrong((id *)&self->_writeKey, 0);
  objc_storeStrong((id *)&self->_readKey, 0);
  objc_storeStrong((id *)&self->_dhSecretKey, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_clientSession, 0);
}

@end