@interface MRSendCommandResultStatus
+ (id)statusWithCode:(unsigned int)a3;
+ (id)statusWithCode:(unsigned int)a3 customData:(id)a4 type:(id)a5;
+ (id)statusWithCode:(unsigned int)a3 dialog:(id)a4;
+ (id)statusWithCode:(unsigned int)a3 dialog:(id)a4 error:(id)a5;
+ (id)statusWithCode:(unsigned int)a3 error:(id)a4;
+ (id)successStatus;
- (MRSendCommandHandlerDialog)dialog;
- (MRSendCommandResultStatus)initWithProtobuf:(id)a3;
- (MRSendCommandResultStatus)initWithStatusType:(int64_t)a3 statusCode:(unsigned int)a4 dialog:(id)a5 customData:(id)a6 customDataType:(id)a7 error:(id)a8;
- (NSData)customData;
- (NSError)commandError;
- (NSString)customDataType;
- (_MRSendCommandResultStatusProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)statusType;
- (unsigned)statusCode;
@end

@implementation MRSendCommandResultStatus

+ (id)successStatus
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MRSendCommandResultStatus_successStatus__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (successStatus_onceToken != -1) {
    dispatch_once(&successStatus_onceToken, block);
  }
  v2 = (void *)successStatus_successStatus;

  return v2;
}

uint64_t __42__MRSendCommandResultStatus_successStatus__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithStatusType:1 statusCode:0 dialog:0 customData:0 customDataType:0 error:0];
  uint64_t v2 = successStatus_successStatus;
  successStatus_successStatus = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

+ (id)statusWithCode:(unsigned int)a3
{
  if (a3)
  {
    v3 = (void *)[objc_alloc((Class)a1) initWithStatusType:1 statusCode:*(void *)&a3 dialog:0 customData:0 customDataType:0 error:0];
  }
  else
  {
    v3 = [a1 successStatus];
  }

  return v3;
}

+ (id)statusWithCode:(unsigned int)a3 error:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithStatusType:3 statusCode:v4 dialog:0 customData:0 customDataType:0 error:v6];

  return v7;
}

+ (id)statusWithCode:(unsigned int)a3 dialog:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithStatusType:2 statusCode:v4 dialog:v6 customData:0 customDataType:0 error:0];

  return v7;
}

+ (id)statusWithCode:(unsigned int)a3 dialog:(id)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)[objc_alloc((Class)a1) initWithStatusType:2 statusCode:v6 dialog:v9 customData:0 customDataType:0 error:v8];

  return v10;
}

+ (id)statusWithCode:(unsigned int)a3 customData:(id)a4 type:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  v10 = (void *)[objc_alloc((Class)a1) initWithStatusType:999 statusCode:v6 dialog:0 customData:v9 customDataType:v8 error:0];

  return v10;
}

- (MRSendCommandResultStatus)initWithStatusType:(int64_t)a3 statusCode:(unsigned int)a4 dialog:(id)a5 customData:(id)a6 customDataType:(id)a7 error:(id)a8
{
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)MRSendCommandResultStatus;
  v18 = [(MRSendCommandResultStatus *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_statusType = a3;
    v18->_statusCode = a4;
    objc_storeStrong((id *)&v18->_dialog, a5);
    objc_storeStrong((id *)&v19->_customData, a6);
    objc_storeStrong((id *)&v19->_customDataType, a7);
    objc_storeStrong((id *)&v19->_commandError, a8);
  }

  return v19;
}

- (MRSendCommandResultStatus)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    int v6 = [v4 type];
    uint64_t v7 = [v5 statusCode];
    uint64_t v8 = v7;
    if (v6 != 1 || v7)
    {
      uint64_t v19 = v6;
      v10 = [MRSendCommandHandlerDialog alloc];
      v11 = [v5 dialog];
      v12 = [(MRSendCommandHandlerDialog *)v10 initWithProtobuf:v11];
      v13 = [v5 customData];
      v14 = [v5 customDataType];
      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v16 = [v5 error];
      id v17 = objc_msgSend(v15, "mr_initWithProtobuf:", v16);
      self = [(MRSendCommandResultStatus *)self initWithStatusType:v19 statusCode:v8 dialog:v12 customData:v13 customDataType:v14 error:v17];

      id v9 = self;
    }
    else
    {
      id v9 = [(id)objc_opt_class() successStatus];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (_MRSendCommandResultStatusProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRSendCommandResultStatusProtobuf);
  [(_MRSendCommandResultStatusProtobuf *)v3 setType:[(MRSendCommandResultStatus *)self statusType]];
  [(_MRSendCommandResultStatusProtobuf *)v3 setStatusCode:[(MRSendCommandResultStatus *)self statusCode]];
  id v4 = [(MRSendCommandResultStatus *)self dialog];
  v5 = [v4 protobuf];
  [(_MRSendCommandResultStatusProtobuf *)v3 setDialog:v5];

  int v6 = [(MRSendCommandResultStatus *)self customData];
  [(_MRSendCommandResultStatusProtobuf *)v3 setCustomData:v6];

  uint64_t v7 = [(MRSendCommandResultStatus *)self customDataType];
  [(_MRSendCommandResultStatusProtobuf *)v3 setCustomDataType:v7];

  uint64_t v8 = [(MRSendCommandResultStatus *)self commandError];
  id v9 = objc_msgSend(v8, "mr_protobuf");
  [(_MRSendCommandResultStatusProtobuf *)v3 setError:v9];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() successStatus];

  if (v4 == self)
  {
    return self;
  }
  else
  {
    id v17 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    int64_t v5 = [(MRSendCommandResultStatus *)self statusType];
    uint64_t v6 = [(MRSendCommandResultStatus *)self statusCode];
    uint64_t v7 = [(MRSendCommandResultStatus *)self dialog];
    uint64_t v8 = (void *)[v7 copyWithZone:a3];
    id v9 = [(MRSendCommandResultStatus *)self customData];
    v10 = (void *)[v9 copyWithZone:a3];
    v11 = [(MRSendCommandResultStatus *)self customDataType];
    v12 = (void *)[v11 copyWithZone:a3];
    v13 = [(MRSendCommandResultStatus *)self commandError];
    v14 = (void *)[v13 copyWithZone:a3];
    id v15 = (void *)[v17 initWithStatusType:v5 statusCode:v6 dialog:v8 customData:v10 customDataType:v12 error:v14];

    return v15;
  }
}

- (id)description
{
  v3 = (__CFString *)MRMediaRemoteCopyCommandHandlerStatusDescription([(MRSendCommandResultStatus *)self statusCode]);
  int64_t v4 = [(MRSendCommandResultStatus *)self statusType];
  switch(v4)
  {
    case 0:
      int64_t v5 = @"StatusTypeUnknown";
      goto LABEL_11;
    case 1:
      int64_t v5 = @"StatusTypeCode";
      goto LABEL_11;
    case 2:
      uint64_t v7 = [(MRSendCommandResultStatus *)self dialog];
      id v9 = [v7 description];
      int64_t v5 = @"StatusTypeDialog";
      goto LABEL_8;
    case 3:
      uint64_t v7 = [(MRSendCommandResultStatus *)self commandError];
      id v9 = [v7 description];
      int64_t v5 = @"StatusTypeError";
      goto LABEL_8;
    default:
      if (v4 == 999)
      {
        uint64_t v6 = NSString;
        uint64_t v7 = [(MRSendCommandResultStatus *)self customDataType];
        uint64_t v8 = [(MRSendCommandResultStatus *)self customData];
        id v9 = [v6 stringWithFormat:@"%@ - %@", v7, v8];

        int64_t v5 = @"StatusTypeCustom";
LABEL_8:

        v10 = NSString;
        uint64_t v11 = objc_opt_class();
        if (v9)
        {
          v12 = MRCreateIndentedDebugDescriptionFromObject(v9);
          v13 = [v10 stringWithFormat:@"<%@ %p {\n   code=%@\n   type=%@\n   %@%@}>", v11, self, v3, v5, v12, @"\n"];

          goto LABEL_13;
        }
      }
      else
      {
        int64_t v5 = 0;
LABEL_11:
        v10 = NSString;
        uint64_t v11 = objc_opt_class();
      }
      v13 = [v10 stringWithFormat:@"<%@ %p {\n   code=%@\n   type=%@\n   %@%@}>", v11, self, v3, v5, &stru_1EE60E7D8, &stru_1EE60E7D8];
LABEL_13:

      return v13;
  }
}

- (unsigned)statusCode
{
  return self->_statusCode;
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (MRSendCommandHandlerDialog)dialog
{
  return self->_dialog;
}

- (NSError)commandError
{
  return self->_commandError;
}

- (NSData)customData
{
  return self->_customData;
}

- (NSString)customDataType
{
  return self->_customDataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDataType, 0);
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_commandError, 0);

  objc_storeStrong((id *)&self->_dialog, 0);
}

@end