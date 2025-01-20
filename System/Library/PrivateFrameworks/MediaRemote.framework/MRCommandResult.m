@interface MRCommandResult
+ (id)commandResultWithSendError:(unsigned int)a3;
+ (id)commandResultWithSendError:(unsigned int)a3 description:(id)a4;
- (MRCommandResult)initWithData:(id)a3;
- (MRCommandResult)initWithError:(id)a3;
- (MRCommandResult)initWithHandlerStatuses:(id)a3 sendError:(unsigned int)a4;
- (MRCommandResult)initWithProtobuf:(id)a3;
- (MRCommandResult)initWithResultStatuses:(id)a3 sendError:(unsigned int)a4 playerPath:(id)a5;
- (MRCommandResult)initWithWithSendError:(unsigned int)a3 description:(id)a4;
- (MRPlayerPath)playerPath;
- (NSArray)handlerReturnStatuses;
- (NSArray)resultStatuses;
- (NSError)error;
- (NSString)sendErrorDescription;
- (id)copyWithPlayerPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (id)debugDescription;
- (id)description;
- (id)protobuf;
- (unsigned)endQOS;
- (unsigned)sendError;
- (unsigned)startQOS;
- (void)setEndQOS:(unsigned int)a3;
- (void)setError:(id)a3;
- (void)setPlayerPath:(id)a3;
- (void)setResultStatuses:(id)a3;
- (void)setSendError:(unsigned int)a3;
- (void)setSendErrorDescription:(id)a3;
- (void)setStartQOS:(unsigned int)a3;
@end

@implementation MRCommandResult

+ (id)commandResultWithSendError:(unsigned int)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithHandlerStatuses:0 sendError:*(void *)&a3];

  return v3;
}

+ (id)commandResultWithSendError:(unsigned int)a3 description:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithWithSendError:v4 description:v6];

  return v7;
}

- (MRCommandResult)initWithWithSendError:(unsigned int)a3 description:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = [(MRCommandResult *)self initWithHandlerStatuses:0 sendError:v4];
  [(MRCommandResult *)v7 setSendErrorDescription:v6];

  return v7;
}

- (MRCommandResult)initWithHandlerStatuses:(id)a3 sendError:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = objc_msgSend(a3, "msv_map:", &__block_literal_global_61);
  v7 = [(MRCommandResult *)self initWithResultStatuses:v6 sendError:v4 playerPath:0];

  return v7;
}

MRSendCommandResultStatus *__53__MRCommandResult_initWithHandlerStatuses_sendError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 unsignedIntValue];

  return +[MRSendCommandResultStatus statusWithCode:v2 error:0];
}

- (MRCommandResult)initWithResultStatuses:(id)a3 sendError:(unsigned int)a4 playerPath:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MRCommandResult;
  v10 = [(MRCommandResult *)&v14 init];
  if (v10)
  {
    v11 = (void *)[v8 copy];
    [(MRCommandResult *)v10 setResultStatuses:v11];

    [(MRCommandResult *)v10 setSendError:v6];
    v12 = (void *)[v9 copy];
    [(MRCommandResult *)v10 setPlayerPath:v12];
  }
  return v10;
}

- (MRCommandResult)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[_MRSendCommandResultProtobuf alloc] initWithData:v4];

    self = [(MRCommandResult *)self initWithProtobuf:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (MRCommandResult)initWithProtobuf:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 statuses];
    uint64_t v6 = objc_msgSend(v5, "msv_map:", &__block_literal_global_4);
    uint64_t v7 = [v4 sendError];
    id v8 = [MRPlayerPath alloc];
    id v9 = [v4 playerPath];
    v10 = [(MRPlayerPath *)v8 initWithProtobuf:v9];
    v11 = [(MRCommandResult *)self initWithResultStatuses:v6 sendError:v7 playerPath:v10];

    v12 = [v4 sendErrorDescription];

    [(MRCommandResult *)v11 setSendErrorDescription:v12];
    self = v11;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

MRSendCommandResultStatus *__36__MRCommandResult_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRSendCommandResultStatus alloc] initWithProtobuf:v2];

  return v3;
}

- (MRCommandResult)initWithError:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "mr_isMediaRemoteError") && (objc_msgSend(v4, "isInformational") & 1) == 0)
  {
    uint64_t v6 = MRMediaRemoteSendErrorFromError(v4, 0);
    v5 = [v4 localizedFailureReason];
  }
  else
  {
    v5 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(MRCommandResult *)self initWithWithSendError:v6 description:v5];

  return v7;
}

- (id)copyWithPlayerPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(MRCommandResult *)self copy];
  [v5 setPlayerPath:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v6 = [(MRCommandResult *)self resultStatuses];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setResultStatuses:v7];

  objc_msgSend(v5, "setSendError:", -[MRCommandResult sendError](self, "sendError"));
  id v8 = [(MRCommandResult *)self error];
  id v9 = (void *)[v8 copyWithZone:a3];
  [v5 setError:v9];

  v10 = [(MRCommandResult *)self sendErrorDescription];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setSendErrorDescription:v11];

  v12 = [(MRCommandResult *)self playerPath];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setPlayerPath:v13];

  objc_msgSend(v5, "setStartQOS:", -[MRCommandResult startQOS](self, "startQOS"));
  objc_msgSend(v5, "setEndQOS:", -[MRCommandResult endQOS](self, "endQOS"));
  return v5;
}

- (id)protobuf
{
  v3 = objc_alloc_init(_MRSendCommandResultProtobuf);
  [(_MRSendCommandResultProtobuf *)v3 setSendError:[(MRCommandResult *)self sendError]];
  id v4 = [(MRCommandResult *)self playerPath];
  id v5 = [v4 protobuf];
  [(_MRSendCommandResultProtobuf *)v3 setPlayerPath:v5];

  uint64_t v6 = [(MRCommandResult *)self resultStatuses];
  uint64_t v7 = objc_msgSend(v6, "msv_map:", &__block_literal_global_8_3);
  id v8 = (void *)[v7 mutableCopy];
  [(_MRSendCommandResultProtobuf *)v3 setStatuses:v8];

  id v9 = [(MRCommandResult *)self sendErrorDescription];
  [(_MRSendCommandResultProtobuf *)v3 setSendErrorDescription:v9];

  return v3;
}

uint64_t __27__MRCommandResult_protobuf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 protobuf];
}

- (id)data
{
  id v2 = [(MRCommandResult *)self protobuf];
  v3 = [v2 data];

  return v3;
}

- (NSArray)resultStatuses
{
  if (self->_resultStatuses) {
    return self->_resultStatuses;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (NSArray)handlerReturnStatuses
{
  id v2 = [(MRCommandResult *)self resultStatuses];
  v3 = objc_msgSend(v2, "msv_map:", &__block_literal_global_10_2);
  id v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

uint64_t __40__MRCommandResult_handlerReturnStatuses__block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [a2 statusCode];

  return [v2 numberWithUnsignedInt:v3];
}

- (NSString)sendErrorDescription
{
  p_sendErrorDescription = &self->_sendErrorDescription;
  if (!self->_sendErrorDescription)
  {
    error = self->_error;
    if (error)
    {
      uint64_t v7 = [(NSError *)error domain];
      int v8 = [v7 isEqualToString:@"kMRMediaRemoteFrameworkErrorDomain"];

      if (v8)
      {
        id v9 = self->_error;
        id obj = 0;
        MRMediaRemoteSendErrorFromError(v9, &obj);
        objc_storeStrong((id *)p_sendErrorDescription, obj);
      }
    }
  }
  uint64_t v3 = *p_sendErrorDescription;

  return v3;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  playerPath = self->_playerPath;
  uint64_t v6 = [(MRCommandResult *)self error];
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@ : %p playerPath=%@, error=%@>", v4, self, playerPath, v6];

  return v7;
}

- (id)debugDescription
{
  id v15 = [NSString alloc];
  uint64_t v14 = objc_opt_class();
  id v3 = [(MRCommandResult *)self playerPath];
  uint64_t v4 = [(MRCommandResult *)self error];
  id v5 = MRCreateIndentedDebugDescriptionFromObject(v4);
  uint64_t startQOS = self->_startQOS;
  uint64_t endQOS = self->_endQOS;
  int v8 = MRMediaRemoteSendCommandErrorDescription([(MRCommandResult *)self sendError]);
  id v9 = [(MRCommandResult *)self sendErrorDescription];
  v10 = [(MRCommandResult *)self resultStatuses];
  v11 = MRCreateIndentedDebugDescriptionFromArray(v10);
  v12 = (void *)[v15 initWithFormat:@"<%@ : %p {\n   playerPath = %@\n   effectiveError = %@\n   qos = %d -> %d\n   sendError = %@ (%@)\n   %@\n}>\n", v14, self, v3, v5, startQOS, endQOS, v8, v9, v11];

  return v12;
}

- (NSError)error
{
  id v3 = self->_error;
  if (!v3)
  {
    uint64_t v5 = MRMediaRemoteErrorFromCommandStatuses([(MRCommandResult *)self sendError], 0);
    if (!v5) {
      goto LABEL_15;
    }
    id v3 = (NSError *)v5;
    uint64_t v6 = [(MRCommandResult *)self sendErrorDescription];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v8 = [(NSError *)v3 code];
      id v9 = [(MRCommandResult *)self sendErrorDescription];
      uint64_t v10 = [v7 initWithMRError:v8 description:v9];

      id v3 = (NSError *)v10;
      if (!v10)
      {
LABEL_15:
        v11 = [(MRCommandResult *)self resultStatuses];
        v12 = objc_msgSend(v11, "msv_firstWhere:", &__block_literal_global_20);
        id v3 = [v12 commandError];

        if (!v3)
        {
          uint64_t v13 = [(MRCommandResult *)self sendError];
          uint64_t v14 = [(MRCommandResult *)self handlerReturnStatuses];
          MRMediaRemoteErrorFromCommandStatuses(v13, v14);
          id v3 = (NSError *)objc_claimAutoreleasedReturnValue();

          if (!v3)
          {
            id v15 = [(MRCommandResult *)self resultStatuses];
            uint64_t v16 = [v15 count];

            if (v16) {
              id v3 = 0;
            }
            else {
              id v3 = (NSError *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:44];
            }
          }
        }
      }
    }
  }

  return v3;
}

BOOL __24__MRCommandResult_error__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 commandError];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setError:(id)a3
{
}

- (void)setResultStatuses:(id)a3
{
}

- (unsigned)sendError
{
  return self->_sendError;
}

- (void)setSendError:(unsigned int)a3
{
  self->_sendError = a3;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (void)setSendErrorDescription:(id)a3
{
}

- (unsigned)startQOS
{
  return self->_startQOS;
}

- (void)setStartQOS:(unsigned int)a3
{
  self->_uint64_t startQOS = a3;
}

- (unsigned)endQOS
{
  return self->_endQOS;
}

- (void)setEndQOS:(unsigned int)a3
{
  self->_uint64_t endQOS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendErrorDescription, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_resultStatuses, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end