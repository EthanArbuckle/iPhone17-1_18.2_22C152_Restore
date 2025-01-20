@interface TUConversationUnreliableMessengerConfig
+ (BOOL)supportsSecureCoding;
+ (id)shared;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationUnreliableMessengerConfig:(id)a3;
- (NSData)idsAliasingSalt;
- (TUConversationUnreliableMessengerConfig)initWithCoder:(id)a3;
- (TUConversationUnreliableMessengerConfig)initWithEstablishChannelMaxAttempts:(unint64_t)a3 establishChannelRetryIntervalMillis:(unint64_t)a4 egressMessagePayloadMaxSizeBytes:(unint64_t)a5 channelStreamMaxQueueSize:(unint64_t)a6 channelStreamMaxTries:(unint64_t)a7 channelStreamRetryIntervalMillis:(unint64_t)a8 seqNumBufferSize:(unint64_t)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)channelStreamMaxQueueSize;
- (unint64_t)channelStreamMaxTries;
- (unint64_t)channelStreamRetryIntervalMillis;
- (unint64_t)egressMessagePayloadMaxSizeBytes;
- (unint64_t)establishChannelMaxAttempts;
- (unint64_t)establishChannelRetryIntervalMillis;
- (unint64_t)hash;
- (unint64_t)seqNumBufferSize;
- (void)encodeWithCoder:(id)a3;
- (void)setIdsAliasingSalt:(id)a3;
@end

@implementation TUConversationUnreliableMessengerConfig

- (TUConversationUnreliableMessengerConfig)initWithEstablishChannelMaxAttempts:(unint64_t)a3 establishChannelRetryIntervalMillis:(unint64_t)a4 egressMessagePayloadMaxSizeBytes:(unint64_t)a5 channelStreamMaxQueueSize:(unint64_t)a6 channelStreamMaxTries:(unint64_t)a7 channelStreamRetryIntervalMillis:(unint64_t)a8 seqNumBufferSize:(unint64_t)a9
{
  v16.receiver = self;
  v16.super_class = (Class)TUConversationUnreliableMessengerConfig;
  result = [(TUConversationUnreliableMessengerConfig *)&v16 init];
  if (result)
  {
    result->_establishChannelMaxAttempts = a3;
    result->_establishChannelRetryIntervalMillis = a4;
    result->_egressMessagePayloadMaxSizeBytes = a5;
    result->_channelStreamMaxQueueSize = a6;
    result->_channelStreamMaxTries = a7;
    result->_channelStreamRetryIntervalMillis = a8;
    result->_seqNumBufferSize = a9;
  }
  return result;
}

+ (id)shared
{
  v2 = (void *)[objc_alloc((Class)a1) initWithEstablishChannelMaxAttempts:3 establishChannelRetryIntervalMillis:1000 egressMessagePayloadMaxSizeBytes:1180 channelStreamMaxQueueSize:1000 channelStreamMaxTries:3 channelStreamRetryIntervalMillis:3000 seqNumBufferSize:1024];

  return v2;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" establishChannelMaxAttempts=%lu", -[TUConversationUnreliableMessengerConfig establishChannelMaxAttempts](self, "establishChannelMaxAttempts"));
  objc_msgSend(v3, "appendFormat:", @" establishChannelRetryIntervalMillis=%lu", -[TUConversationUnreliableMessengerConfig establishChannelRetryIntervalMillis](self, "establishChannelRetryIntervalMillis"));
  objc_msgSend(v3, "appendFormat:", @" egressMessagePayloadMaxSizeBytes=%lu", -[TUConversationUnreliableMessengerConfig egressMessagePayloadMaxSizeBytes](self, "egressMessagePayloadMaxSizeBytes"));
  objc_msgSend(v3, "appendFormat:", @" channelStreamMaxQueueSize=%lu", -[TUConversationUnreliableMessengerConfig channelStreamMaxQueueSize](self, "channelStreamMaxQueueSize"));
  objc_msgSend(v3, "appendFormat:", @" channelStreamMaxTries=%lu", -[TUConversationUnreliableMessengerConfig channelStreamMaxTries](self, "channelStreamMaxTries"));
  objc_msgSend(v3, "appendFormat:", @" channelStreamRetryIntervalMillis=%lu", -[TUConversationUnreliableMessengerConfig channelStreamRetryIntervalMillis](self, "channelStreamRetryIntervalMillis"));
  objc_msgSend(v3, "appendFormat:", @" seqNumBufferSize=%lu", -[TUConversationUnreliableMessengerConfig seqNumBufferSize](self, "seqNumBufferSize"));
  [v3 appendString:@">"];
  v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationUnreliableMessengerConfig *)self isEqualToConversationUnreliableMessengerConfig:v4];

  return v5;
}

- (BOOL)isEqualToConversationUnreliableMessengerConfig:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUConversationUnreliableMessengerConfig *)self establishChannelMaxAttempts];
  if (v5 == [v4 establishChannelMaxAttempts]
    && (unint64_t v6 = -[TUConversationUnreliableMessengerConfig establishChannelRetryIntervalMillis](self, "establishChannelRetryIntervalMillis"), v6 == [v4 establishChannelRetryIntervalMillis])&& (v7 = -[TUConversationUnreliableMessengerConfig egressMessagePayloadMaxSizeBytes](self, "egressMessagePayloadMaxSizeBytes"), v7 == objc_msgSend(v4, "egressMessagePayloadMaxSizeBytes"))&& (v8 = -[TUConversationUnreliableMessengerConfig channelStreamMaxQueueSize](self, "channelStreamMaxQueueSize"), v8 == objc_msgSend(v4, "channelStreamMaxQueueSize"))&& (v9 = -[TUConversationUnreliableMessengerConfig channelStreamMaxTries](self, "channelStreamMaxTries"), v9 == objc_msgSend(v4, "channelStreamMaxTries"))&& (v10 = -[TUConversationUnreliableMessengerConfig channelStreamRetryIntervalMillis](self, "channelStreamRetryIntervalMillis"), v10 == objc_msgSend(v4, "channelStreamRetryIntervalMillis"))&& (v11 = -[TUConversationUnreliableMessengerConfig seqNumBufferSize](self, "seqNumBufferSize"), v11 == objc_msgSend(v4, "seqNumBufferSize")))
  {
    v12 = [(TUConversationUnreliableMessengerConfig *)self idsAliasingSalt];
    v13 = [v4 idsAliasingSalt];
    if (v12 == v13)
    {
      char v16 = 1;
    }
    else
    {
      v14 = [(TUConversationUnreliableMessengerConfig *)self idsAliasingSalt];
      v15 = [v4 idsAliasingSalt];
      char v16 = [v14 isEqualToData:v15];
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TUConversationUnreliableMessengerConfig *)self establishChannelMaxAttempts];
  unint64_t v4 = [(TUConversationUnreliableMessengerConfig *)self establishChannelRetryIntervalMillis] ^ v3;
  unint64_t v5 = [(TUConversationUnreliableMessengerConfig *)self egressMessagePayloadMaxSizeBytes];
  unint64_t v6 = v4 ^ v5 ^ [(TUConversationUnreliableMessengerConfig *)self channelStreamMaxQueueSize];
  unint64_t v7 = [(TUConversationUnreliableMessengerConfig *)self channelStreamMaxTries];
  unint64_t v8 = v7 ^ [(TUConversationUnreliableMessengerConfig *)self channelStreamRetryIntervalMillis];
  unint64_t v9 = v6 ^ v8 ^ [(TUConversationUnreliableMessengerConfig *)self seqNumBufferSize];
  unint64_t v10 = [(TUConversationUnreliableMessengerConfig *)self idsAliasingSalt];
  unint64_t v11 = v9 ^ [v10 hash];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithEstablishChannelMaxAttempts:establishChannelRetryIntervalMillis:egressMessagePayloadMaxSizeBytes:channelStreamMaxQueueSize:channelStreamMaxTries:channelStreamRetryIntervalMillis:seqNumBufferSize:", -[TUConversationUnreliableMessengerConfig establishChannelMaxAttempts](self, "establishChannelMaxAttempts"), -[TUConversationUnreliableMessengerConfig establishChannelRetryIntervalMillis](self, "establishChannelRetryIntervalMillis"), -[TUConversationUnreliableMessengerConfig egressMessagePayloadMaxSizeBytes](self, "egressMessagePayloadMaxSizeBytes"), -[TUConversationUnreliableMessengerConfig channelStreamMaxQueueSize](self, "channelStreamMaxQueueSize"), -[TUConversationUnreliableMessengerConfig channelStreamMaxTries](self, "channelStreamMaxTries"), -[TUConversationUnreliableMessengerConfig channelStreamRetryIntervalMillis](self, "channelStreamRetryIntervalMillis"), -[TUConversationUnreliableMessengerConfig seqNumBufferSize](self, "seqNumBufferSize"));
  unint64_t v5 = [(TUConversationUnreliableMessengerConfig *)self idsAliasingSalt];
  [v4 setIdsAliasingSalt:v5];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationUnreliableMessengerConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_establishChannelMaxAttempts);
  uint64_t v6 = [v4 decodeIntegerForKey:v5];

  unint64_t v7 = NSStringFromSelector(sel_establishChannelRetryIntervalMillis);
  uint64_t v8 = [v4 decodeIntegerForKey:v7];

  unint64_t v9 = NSStringFromSelector(sel_egressMessagePayloadMaxSizeBytes);
  uint64_t v10 = [v4 decodeIntegerForKey:v9];

  unint64_t v11 = NSStringFromSelector(sel_channelStreamMaxQueueSize);
  uint64_t v12 = [v4 decodeIntegerForKey:v11];

  v13 = NSStringFromSelector(sel_channelStreamMaxTries);
  uint64_t v14 = [v4 decodeIntegerForKey:v13];

  v15 = NSStringFromSelector(sel_channelStreamRetryIntervalMillis);
  uint64_t v16 = [v4 decodeIntegerForKey:v15];

  v17 = NSStringFromSelector(sel_seqNumBufferSize);
  uint64_t v18 = [v4 decodeIntegerForKey:v17];

  v19 = [(TUConversationUnreliableMessengerConfig *)self initWithEstablishChannelMaxAttempts:v6 establishChannelRetryIntervalMillis:v8 egressMessagePayloadMaxSizeBytes:v10 channelStreamMaxQueueSize:v12 channelStreamMaxTries:v14 channelStreamRetryIntervalMillis:v16 seqNumBufferSize:v18];
  if (v19)
  {
    uint64_t v20 = objc_opt_class();
    v21 = NSStringFromSelector(sel_idsAliasingSalt);
    v22 = [v4 decodeObjectOfClass:v20 forKey:v21];
    [(TUConversationUnreliableMessengerConfig *)v19 setIdsAliasingSalt:v22];
  }
  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUConversationUnreliableMessengerConfig *)self establishChannelMaxAttempts];
  uint64_t v6 = NSStringFromSelector(sel_establishChannelMaxAttempts);
  [v4 encodeInteger:v5 forKey:v6];

  unint64_t v7 = [(TUConversationUnreliableMessengerConfig *)self establishChannelRetryIntervalMillis];
  uint64_t v8 = NSStringFromSelector(sel_establishChannelRetryIntervalMillis);
  [v4 encodeInteger:v7 forKey:v8];

  unint64_t v9 = [(TUConversationUnreliableMessengerConfig *)self egressMessagePayloadMaxSizeBytes];
  uint64_t v10 = NSStringFromSelector(sel_egressMessagePayloadMaxSizeBytes);
  [v4 encodeInteger:v9 forKey:v10];

  unint64_t v11 = [(TUConversationUnreliableMessengerConfig *)self channelStreamMaxQueueSize];
  uint64_t v12 = NSStringFromSelector(sel_channelStreamMaxQueueSize);
  [v4 encodeInteger:v11 forKey:v12];

  unint64_t v13 = [(TUConversationUnreliableMessengerConfig *)self channelStreamMaxTries];
  uint64_t v14 = NSStringFromSelector(sel_channelStreamMaxTries);
  [v4 encodeInteger:v13 forKey:v14];

  unint64_t v15 = [(TUConversationUnreliableMessengerConfig *)self channelStreamRetryIntervalMillis];
  uint64_t v16 = NSStringFromSelector(sel_channelStreamRetryIntervalMillis);
  [v4 encodeInteger:v15 forKey:v16];

  unint64_t v17 = [(TUConversationUnreliableMessengerConfig *)self seqNumBufferSize];
  uint64_t v18 = NSStringFromSelector(sel_seqNumBufferSize);
  [v4 encodeInteger:v17 forKey:v18];

  id v20 = [(TUConversationUnreliableMessengerConfig *)self idsAliasingSalt];
  v19 = NSStringFromSelector(sel_idsAliasingSalt);
  [v4 encodeObject:v20 forKey:v19];
}

- (unint64_t)establishChannelMaxAttempts
{
  return self->_establishChannelMaxAttempts;
}

- (unint64_t)establishChannelRetryIntervalMillis
{
  return self->_establishChannelRetryIntervalMillis;
}

- (unint64_t)egressMessagePayloadMaxSizeBytes
{
  return self->_egressMessagePayloadMaxSizeBytes;
}

- (unint64_t)channelStreamMaxQueueSize
{
  return self->_channelStreamMaxQueueSize;
}

- (unint64_t)channelStreamMaxTries
{
  return self->_channelStreamMaxTries;
}

- (unint64_t)channelStreamRetryIntervalMillis
{
  return self->_channelStreamRetryIntervalMillis;
}

- (unint64_t)seqNumBufferSize
{
  return self->_seqNumBufferSize;
}

- (NSData)idsAliasingSalt
{
  return self->_idsAliasingSalt;
}

- (void)setIdsAliasingSalt:(id)a3
{
}

- (void).cxx_destruct
{
}

@end