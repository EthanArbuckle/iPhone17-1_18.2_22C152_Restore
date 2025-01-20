@interface TUConversationReport
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationReport:(id)a3;
- (NSDate)timebase;
- (NSUUID)conversationID;
- (NSUUID)paddingForHashedValue;
- (TUConversationReport)init;
- (TUConversationReport)initWithCoder:(id)a3;
- (TUConversationReport)initWithConversationID:(id)a3 padding:(id)a4 timebase:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)hashForParticipantIdentifier:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUConversationReport

- (TUConversationReport)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [MEMORY[0x1E4F1C9C8] now];
  v6 = [(TUConversationReport *)self initWithConversationID:v3 padding:v4 timebase:v5];

  return v6;
}

- (TUConversationReport)initWithConversationID:(id)a3 padding:(id)a4 timebase:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUConversationReport;
  v12 = [(TUConversationReport *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_timebase, a5);
    objc_storeStrong((id *)&v13->_conversationID, a3);
    if (v10)
    {
      v14 = (NSUUID *)v10;
    }
    else
    {
      v14 = [MEMORY[0x1E4F29128] UUID];
    }
    paddingForHashedValue = v13->_paddingForHashedValue;
    v13->_paddingForHashedValue = v14;
  }
  return v13;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(TUConversationReport *)self timebase];
  [v3 appendFormat:@" timebase=%@", v4];

  v5 = [(TUConversationReport *)self conversationID];
  [v3 appendFormat:@" conversationID=%@", v5];

  v6 = [(TUConversationReport *)self paddingForHashedValue];
  [v3 appendFormat:@" paddingForHashedValue=%@", v6];

  [v3 appendString:@">"];
  v7 = (void *)[v3 copy];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationReport *)self isEqualToConversationReport:v4];

  return v5;
}

- (BOOL)isEqualToConversationReport:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationReport *)self conversationID];
  v6 = [v4 conversationID];
  if ([v5 isEqual:v6])
  {
    v7 = [(TUConversationReport *)self timebase];
    v8 = [v4 timebase];
    if ([v7 isEqualToDate:v8])
    {
      id v9 = [(TUConversationReport *)self paddingForHashedValue];
      id v10 = [v4 paddingForHashedValue];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(TUConversationReport *)self conversationID];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TUConversationReport *)self timebase];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(TUConversationReport *)self conversationID];
  unint64_t v6 = [(TUConversationReport *)self paddingForHashedValue];
  v7 = [(TUConversationReport *)self timebase];
  v8 = (void *)[v4 initWithConversationID:v5 padding:v6 timebase:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationReport)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = NSStringFromSelector(sel_conversationID);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_paddingForHashedValue);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];
  char v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F29128] UUID];
  }
  v13 = v12;

  uint64_t v14 = objc_opt_class();
  v15 = NSStringFromSelector(sel_timebase);
  v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

  objc_super v17 = [(TUConversationReport *)self initWithConversationID:v7 padding:v13 timebase:v16];
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationReport *)self conversationID];
  unint64_t v6 = NSStringFromSelector(sel_conversationID);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(TUConversationReport *)self paddingForHashedValue];
  uint64_t v8 = NSStringFromSelector(sel_paddingForHashedValue);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(TUConversationReport *)self timebase];
  id v9 = NSStringFromSelector(sel_timebase);
  [v4 encodeObject:v10 forKey:v9];
}

- (unint64_t)hashForParticipantIdentifier:(unint64_t)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v7[0] = 0;
  v7[1] = 0;
  v3 = [(TUConversationReport *)self paddingForHashedValue];
  [v3 getUUIDBytes:v7];

  id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v7 length:16];
  unint64_t v5 = IDSIDAliasHashUInt64();

  return v5;
}

- (NSDate)timebase
{
  return self->_timebase;
}

- (NSUUID)conversationID
{
  return self->_conversationID;
}

- (NSUUID)paddingForHashedValue
{
  return self->_paddingForHashedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddingForHashedValue, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);

  objc_storeStrong((id *)&self->_timebase, 0);
}

@end