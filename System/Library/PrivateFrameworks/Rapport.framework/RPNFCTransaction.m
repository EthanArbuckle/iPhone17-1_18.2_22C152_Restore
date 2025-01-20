@interface RPNFCTransaction
+ (BOOL)supportsSecureCoding;
- (BOOL)isConnected;
- (BOOL)isInitiator;
- (NSDate)connectionDate;
- (NSError)error;
- (NSString)description;
- (NSUUID)identifier;
- (RPIdentity)remoteIdentity;
- (RPNFCTransaction)initWithCoder:(id)a3;
- (RPNFCTransaction)initWithRole:(int64_t)a3;
- (RPNFCTransactionDelegate)delegate;
- (RPNearFieldTapEvent)tapEvent;
- (RPTransportServiceHandoverMessage)localAuthenticationMessage;
- (RPTransportServiceHandoverMessage)localValidationMessage;
- (RPTransportServiceHandoverMessage)remoteAuthenticationMessage;
- (RPTransportServiceHandoverMessage)remoteValidationMessage;
- (int64_t)role;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setLocalAuthenticationMessage:(id)a3;
- (void)setLocalValidationMessage:(id)a3;
- (void)setRemoteAuthenticationMessage:(id)a3;
- (void)setRemoteIdentity:(id)a3;
- (void)setRemoteValidationMessage:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTapEvent:(id)a3;
@end

@implementation RPNFCTransaction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNFCTransaction)initWithRole:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RPNFCTransaction;
  v4 = [(RPNFCTransaction *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
    identifier = v4->_identifier;
    v4->_identifier = (NSUUID *)v5;

    v4->_role = a3;
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
    connectionDate = v4->_connectionDate;
    v4->_connectionDate = (NSDate *)v7;

    v4->_state = 0;
  }
  return v4;
}

- (void)setError:(id)a3
{
  id v12 = a3;
  BOOL v5 = [(RPNFCTransaction *)self state] == 2;
  v6 = v12;
  if (!v5)
  {
    error = self->_error;
    v8 = (NSError *)v12;
    v9 = error;
    if (v9 == v8)
    {
    }
    else
    {
      objc_super v10 = v9;
      if ((v8 == 0) != (v9 != 0))
      {
        char v11 = [(NSError *)v8 isEqual:v9];

        v6 = v12;
        if (v11) {
          goto LABEL_10;
        }
      }
      else
      {
      }
      objc_storeStrong((id *)&self->_error, a3);
      [(RPNFCTransaction *)self setState:1];
    }
    v6 = v12;
  }
LABEL_10:
}

- (void)setTapEvent:(id)a3
{
  id v6 = a3;
  tapEvent = self->_tapEvent;
  v13 = (RPNearFieldTapEvent *)v6;
  v8 = tapEvent;
  if (v8 == v13)
  {

LABEL_12:
    objc_super v10 = v13;
    goto LABEL_13;
  }
  if ((v13 == 0) == (v8 != 0))
  {

    objc_super v10 = v13;
    goto LABEL_7;
  }
  char v9 = [(RPNearFieldTapEvent *)v13 isEqual:v8];

  objc_super v10 = v13;
  if ((v9 & 1) == 0)
  {
LABEL_7:
    if (!v10)
    {
      char v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 65, @"clearing an existing tap event is not permitted:%@", 0 object file lineNumber description];
    }
    if (self->_tapEvent)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 66, @"update an existing tap event is not permitted:%@", self->_tapEvent object file lineNumber description];
    }
    objc_storeStrong((id *)&self->_tapEvent, a3);
    [(RPNFCTransaction *)self setState:2];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)setRemoteAuthenticationMessage:(id)a3
{
  id v5 = a3;
  remoteAuthenticationMessage = self->_remoteAuthenticationMessage;
  v14 = (RPTransportServiceHandoverMessage *)v5;
  uint64_t v7 = remoteAuthenticationMessage;
  if (v7 == v14)
  {

    objc_super v10 = v14;
LABEL_12:

    char v9 = v14;
    goto LABEL_13;
  }
  if ((v14 == 0) == (v7 != 0))
  {

    char v9 = v14;
    goto LABEL_7;
  }
  char v8 = [(RPTransportServiceHandoverMessage *)v14 isEqual:v7];

  char v9 = v14;
  if ((v8 & 1) == 0)
  {
LABEL_7:
    if (!v9)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 75, @"clearing an existing authentication message is not permitted:%@", 0 object file lineNumber description];

      char v9 = v14;
    }
    if (self->_remoteAuthenticationMessage)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 76, @"update an existing authentication message is not permitted:%@", self->_remoteAuthenticationMessage object file lineNumber description];

      char v9 = v14;
    }
    char v11 = v9;
    objc_super v10 = self->_remoteAuthenticationMessage;
    self->_remoteAuthenticationMessage = v11;
    goto LABEL_12;
  }
LABEL_13:
}

- (void)setRemoteValidationMessage:(id)a3
{
  id v5 = a3;
  remoteValidationMessage = self->_remoteValidationMessage;
  v14 = (RPTransportServiceHandoverMessage *)v5;
  uint64_t v7 = remoteValidationMessage;
  if (v7 == v14)
  {

    objc_super v10 = v14;
LABEL_12:

    char v9 = v14;
    goto LABEL_13;
  }
  if ((v14 == 0) == (v7 != 0))
  {

    char v9 = v14;
    goto LABEL_7;
  }
  char v8 = [(RPTransportServiceHandoverMessage *)v14 isEqual:v7];

  char v9 = v14;
  if ((v8 & 1) == 0)
  {
LABEL_7:
    if (!v9)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 84, @"clearing an existing validation message is not permitted:%@", 0 object file lineNumber description];

      char v9 = v14;
    }
    if (self->_remoteValidationMessage)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 85, @"update an existing validation message is not permitted:%@", self->_remoteValidationMessage object file lineNumber description];

      char v9 = v14;
    }
    char v11 = v9;
    objc_super v10 = self->_remoteValidationMessage;
    self->_remoteValidationMessage = v11;
    goto LABEL_12;
  }
LABEL_13:
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    id v4 = [(RPNFCTransaction *)self delegate];
    [v4 didChangeStateForTransaction:self];
  }
}

- (void)setRemoteIdentity:(id)a3
{
  id v5 = a3;
  remoteIdentity = self->_remoteIdentity;
  v14 = (RPIdentity *)v5;
  uint64_t v7 = remoteIdentity;
  if (v7 == v14)
  {

    objc_super v10 = v14;
LABEL_12:

    char v9 = v14;
    goto LABEL_13;
  }
  if ((v14 == 0) == (v7 != 0))
  {

    char v9 = v14;
    goto LABEL_7;
  }
  char v8 = [(RPIdentity *)v14 isEqual:v7];

  char v9 = v14;
  if ((v8 & 1) == 0)
  {
LABEL_7:
    if (!v9)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 100, @"clearing an existing identity is not permitted:%@", 0 object file lineNumber description];

      char v9 = v14;
    }
    if (self->_remoteIdentity)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"RPNFCTransaction.m", 101, @"update an existing identity is not permitted:%@", self->_remoteIdentity object file lineNumber description];

      char v9 = v14;
    }
    char v11 = v9;
    objc_super v10 = self->_remoteIdentity;
    self->_remoteIdentity = v11;
    goto LABEL_12;
  }
LABEL_13:
}

- (RPNFCTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RPNFCTransaction *)self init];
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v6 = v4;
    if ([v6 containsValueForKey:@"state"]) {
      v5->_state = [v6 decodeIntegerForKey:@"state"];
    }

    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v7 = v6;
    if ([v7 containsValueForKey:@"role"]) {
      v5->_role = [v7 decodeIntegerForKey:@"role"];
    }

    char v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  identifier = self->_identifier;
  id v11 = v4;
  if (identifier)
  {
    [v4 encodeObject:identifier forKey:@"identifier"];
    id v4 = v11;
  }
  int64_t state = self->_state;
  if (state)
  {
    [v11 encodeInteger:state forKey:@"state"];
    id v4 = v11;
  }
  connectionDate = self->_connectionDate;
  if (connectionDate)
  {
    [v11 encodeObject:connectionDate forKey:@"connectionDate"];
    id v4 = v11;
  }
  tapEvent = self->_tapEvent;
  if (tapEvent)
  {
    [v11 encodeObject:tapEvent forKey:@"tapEvent"];
    id v4 = v11;
  }
  error = self->_error;
  if (error)
  {
    [v11 encodeObject:error forKey:@"error"];
    id v4 = v11;
  }
  int64_t role = self->_role;
  if (role)
  {
    [v11 encodeInteger:role forKey:@"role"];
    id v4 = v11;
  }
}

- (BOOL)isInitiator
{
  return self->_role == 1;
}

- (NSString)description
{
  NSAppendPrintF();
  id v3 = 0;
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier)
  {
    v30 = v3;
    v22 = identifier;
    NSAppendPrintF();
    id v6 = v30;

    id v4 = v6;
  }
  v23 = RPNearFieldTransactionStateDescription(self->_state);
  NSAppendPrintF();
  id v7 = v4;

  connectionDate = self->_connectionDate;
  if (connectionDate)
  {
    v24 = connectionDate;
    NSAppendPrintF();
    id v9 = v7;

    id v7 = v9;
  }
  tapEvent = self->_tapEvent;
  if (tapEvent)
  {
    v25 = tapEvent;
    NSAppendPrintF();
    id v11 = v7;

    id v7 = v11;
  }
  remoteIdentity = self->_remoteIdentity;
  if (remoteIdentity)
  {
    v26 = remoteIdentity;
    NSAppendPrintF();
    id v13 = v7;

    id v7 = v13;
  }
  remoteAuthenticationMessage = self->_remoteAuthenticationMessage;
  if (remoteAuthenticationMessage)
  {
    v27 = remoteAuthenticationMessage;
    NSAppendPrintF();
    id v15 = v7;

    id v7 = v15;
  }
  remoteValidationMessage = self->_remoteValidationMessage;
  if (remoteValidationMessage)
  {
    v28 = remoteValidationMessage;
    NSAppendPrintF();
    id v17 = v7;

    id v7 = v17;
  }
  error = self->_error;
  if (error)
  {
    v29 = error;
    NSAppendPrintF();
    id v19 = v7;

    id v7 = v19;
  }
  NSAppendPrintF();
  id v20 = v7;

  return (NSString *)v20;
}

- (RPNFCTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RPNFCTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)connectionDate
{
  return self->_connectionDate;
}

- (int64_t)state
{
  return self->_state;
}

- (RPNearFieldTapEvent)tapEvent
{
  return self->_tapEvent;
}

- (RPIdentity)remoteIdentity
{
  return self->_remoteIdentity;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)role
{
  return self->_role;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (RPTransportServiceHandoverMessage)localAuthenticationMessage
{
  return self->_localAuthenticationMessage;
}

- (void)setLocalAuthenticationMessage:(id)a3
{
}

- (RPTransportServiceHandoverMessage)localValidationMessage
{
  return self->_localValidationMessage;
}

- (void)setLocalValidationMessage:(id)a3
{
}

- (RPTransportServiceHandoverMessage)remoteAuthenticationMessage
{
  return self->_remoteAuthenticationMessage;
}

- (RPTransportServiceHandoverMessage)remoteValidationMessage
{
  return self->_remoteValidationMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteValidationMessage, 0);
  objc_storeStrong((id *)&self->_remoteAuthenticationMessage, 0);
  objc_storeStrong((id *)&self->_localValidationMessage, 0);
  objc_storeStrong((id *)&self->_localAuthenticationMessage, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_remoteIdentity, 0);
  objc_storeStrong((id *)&self->_tapEvent, 0);
  objc_storeStrong((id *)&self->_connectionDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end