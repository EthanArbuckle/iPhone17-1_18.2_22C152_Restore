@interface MRSendCommandResultMessage
- (MRCommandResult)commandResult;
- (MRSendCommandResultMessage)initWithCommandID:(id)a3 commandResult:(id)a4;
- (unint64_t)type;
- (unsigned)sendError;
@end

@implementation MRSendCommandResultMessage

- (MRSendCommandResultMessage)initWithCommandID:(id)a3 commandResult:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MRSendCommandResultMessage;
  v8 = [(MRProtocolMessage *)&v21 init];
  if (v8)
  {
    v9 = objc_alloc_init(_MRSendCommandResultMessageProtobuf);
    [(_MRSendCommandResultMessageProtobuf *)v9 setCommandID:v6];
    [(_MRSendCommandResultMessageProtobuf *)v9 setSendError:[(MRCommandResult *)v8->_commandResult sendError]];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v10 = objc_msgSend(v7, "handlerReturnStatuses", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          -[_MRSendCommandResultMessageProtobuf addHandlerReturnStatus:](v9, "addHandlerReturnStatus:", [*(id *)(*((void *)&v17 + 1) + 8 * v14++) unsignedIntValue]);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }

    v15 = [v7 protobuf];
    [(_MRSendCommandResultMessageProtobuf *)v9 setCommandResult:v15];

    [(MRProtocolMessage *)v8 setUnderlyingCodableMessage:v9];
  }

  return v8;
}

- (unint64_t)type
{
  return 2;
}

- (unsigned)sendError
{
  v2 = [(MRSendCommandResultMessage *)self commandResult];
  unsigned int v3 = [v2 sendError];

  return v3;
}

- (MRCommandResult)commandResult
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_commandResult)
  {
    unsigned int v3 = [(MRProtocolMessage *)v2 underlyingCodableMessage];
    int v4 = [v3 hasCommandResult];

    if (v4)
    {
      v5 = [MRCommandResult alloc];
      id v6 = [(MRProtocolMessage *)v2 underlyingCodableMessage];
      id v7 = [v6 commandResult];
      uint64_t v8 = [(MRCommandResult *)v5 initWithProtobuf:v7];
    }
    else
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v10 = [(MRProtocolMessage *)v2 underlyingCodableMessage];
      id v6 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "handlerReturnStatusCount"));

      for (unint64_t i = 0; ; ++i)
      {
        uint64_t v12 = [(MRProtocolMessage *)v2 underlyingCodableMessage];
        unint64_t v13 = [v12 handlerReturnStatusCount];

        if (v13 <= i) {
          break;
        }
        uint64_t v14 = NSNumber;
        v15 = [(MRProtocolMessage *)v2 underlyingCodableMessage];
        v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "handlerReturnStatusAtIndex:", i));
        [v6 addObject:v16];
      }
      long long v17 = [MRCommandResult alloc];
      id v7 = [(MRProtocolMessage *)v2 underlyingCodableMessage];
      uint64_t v8 = -[MRCommandResult initWithHandlerStatuses:sendError:](v17, "initWithHandlerStatuses:sendError:", v6, [v7 sendError]);
    }
    commandResult = v2->_commandResult;
    v2->_commandResult = (MRCommandResult *)v8;
  }
  long long v19 = v2->_commandResult;
  objc_sync_exit(v2);

  return v19;
}

- (void).cxx_destruct
{
}

@end