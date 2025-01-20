@interface TRIPushChannelId
+ (BOOL)_writeToByte:(char *)a3 fromHexByteString:(id)a4;
+ (id)_base64ChannelIdForIdentifier:(id)a3 populationType:(int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPushChannelId:(id)a3;
- (NSString)identifier;
- (TRIPushChannelId)initWithExperimentId:(id)a3;
- (TRIPushChannelId)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (TRIPushChannelId)initWithPushChannelId:(id)a3;
- (TRIPushChannelId)initWithRolloutDeployment:(id)a3;
- (id)description;
- (int)populationType;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation TRIPushChannelId

- (TRIPushChannelId)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TRIPushChannelId;
  v7 = [(TRIPushChannelId *)&v16 init];
  if (!v7) {
    goto LABEL_10;
  }
  if ([v6 hasPrefix:@"TRI-TEST-"])
  {
    v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Channel generation being skipped for test identifier: %@", buf, 0xCu);
    }

    goto LABEL_6;
  }
  uint64_t v10 = [v6 copy];
  rawIdentifier = v7->_rawIdentifier;
  v7->_rawIdentifier = (NSString *)v10;

  v7->_type = a4;
  if (a4 != 1)
  {
LABEL_10:
    v9 = v7;
    goto LABEL_11;
  }
  v12 = [MEMORY[0x1E4FB0258] sharedInstance];
  v7->_populationType = [v12 populationType];

  uint64_t v13 = objc_msgSend((id)objc_opt_class(), "_base64ChannelIdForIdentifier:populationType:", v7->_rawIdentifier, -[TRIPushChannelId populationType](v7, "populationType"));
  if (v13)
  {
    base64ChannelId = v7->_base64ChannelId;
    v7->_base64ChannelId = (NSString *)v13;

    goto LABEL_10;
  }
LABEL_6:
  v9 = 0;
LABEL_11:

  return v9;
}

- (TRIPushChannelId)initWithRolloutDeployment:(id)a3
{
  v4 = [a3 rolloutId];
  v5 = [(TRIPushChannelId *)self initWithIdentifier:v4 type:1];

  return v5;
}

- (TRIPushChannelId)initWithExperimentId:(id)a3
{
  return [(TRIPushChannelId *)self initWithIdentifier:a3 type:1];
}

- (TRIPushChannelId)initWithPushChannelId:(id)a3
{
  return [(TRIPushChannelId *)self initWithIdentifier:a3 type:0];
}

- (NSString)identifier
{
  uint64_t v2 = 8;
  if (self->_type == 1) {
    uint64_t v2 = 16;
  }
  return (NSString *)*(id *)((char *)&self->super.isa + v2);
}

+ (id)_base64ChannelIdForIdentifier:(id)a3 populationType:(int)a4
{
  char v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (const char *)[v6 UTF8String];
  if (!v7)
  {
    v14 = 0;
    goto LABEL_17;
  }
  size_t v8 = strlen(v7);
  if (v8)
  {
    v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v6;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Received an unexpected odd length identifier: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v9 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:(v8 >> 1) + 1];
    if (v9)
    {
      if (v8 < 2)
      {
LABEL_8:
        char v16 = v4;
        [v9 appendBytes:&v16 length:1];
        if ((unint64_t)[v9 length] < 0x11)
        {
          v14 = [v9 base64EncodedStringWithOptions:0];
          goto LABEL_16;
        }
        uint64_t v13 = TRILogCategory_Server();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v18 = v6;
          _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Unexpectedly long channel id for identifier %{public}@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v10 = 0;
        while (1)
        {
          v11 = objc_msgSend(v6, "substringWithRange:", v10, 2);
          buf[0] = 0;
          if (![a1 _writeToByte:buf fromHexByteString:v11]) {
            break;
          }
          [v9 appendBytes:buf length:1];

          size_t v12 = v10 + 3;
          v10 += 2;
          if (v12 >= v8) {
            goto LABEL_8;
          }
        }
      }
    }
  }
  v14 = 0;
LABEL_16:

LABEL_17:
  return v14;
}

+ (BOOL)_writeToByte:(char *)a3 fromHexByteString:(id)a4
{
  id v7 = a4;
  if ([v7 length] != 2)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"TRIPushChannelId.m" lineNumber:119 description:@"Unexpected byte string length"];
  }
  unint64_t v11 = 0;
  if ([MEMORY[0x1E4FB0198] convertFromString:v7 usingBase:16 toI64:&v11]
    && v11 <= 0xFF)
  {
    *a3 = v11;
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)description
{
  uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIPushChannelId | uncomputed identifier:%@ base64String:%@ type:%lu>", self->_rawIdentifier, self->_base64ChannelId, self->_type];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (TRIPushChannelId *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIPushChannelId *)self isEqualToPushChannelId:v5];

  return v6;
}

- (BOOL)isEqualToPushChannelId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == [(TRIPushChannelId *)self type])
  {
    BOOL v6 = [v4 identifier];
    id v7 = [(TRIPushChannelId *)self identifier];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2 = [(TRIPushChannelId *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int)populationType
{
  return self->_populationType;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base64ChannelId, 0);
  objc_storeStrong((id *)&self->_rawIdentifier, 0);
}

@end