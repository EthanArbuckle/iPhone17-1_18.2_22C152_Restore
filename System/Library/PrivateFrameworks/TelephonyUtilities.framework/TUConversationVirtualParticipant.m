@interface TUConversationVirtualParticipant
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationVirtualParticipant:(id)a3;
- (NSString)pluginName;
- (TUConversationVirtualParticipant)initWithCoder:(id)a3;
- (TUConversationVirtualParticipant)initWithIdentifier:(unint64_t)a3 pluginName:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUConversationVirtualParticipant

- (TUConversationVirtualParticipant)initWithIdentifier:(unint64_t)a3 pluginName:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TUConversationVirtualParticipant;
  v8 = [(TUConversationVirtualParticipant *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_identifier = a3;
    objc_storeStrong((id *)&v8->_pluginName, a4);
  }

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" identifier=%llu", -[TUConversationVirtualParticipant identifier](self, "identifier"));
  v4 = [(TUConversationVirtualParticipant *)self pluginName];
  [v3 appendFormat:@" pluginName=%@", v4];

  [v3 appendString:@">"];
  v5 = (void *)[v3 copy];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationVirtualParticipant *)self isEqualToConversationVirtualParticipant:v4];

  return v5;
}

- (BOOL)isEqualToConversationVirtualParticipant:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUConversationVirtualParticipant *)self identifier];
  if (v5 == [v4 identifier])
  {
    v6 = [(TUConversationVirtualParticipant *)self pluginName];
    id v7 = [v4 pluginName];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TUConversationVirtualParticipant *)self identifier];
  id v4 = [(TUConversationVirtualParticipant *)self pluginName];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = [(TUConversationVirtualParticipant *)self identifier];
  v6 = [(TUConversationVirtualParticipant *)self pluginName];
  id v7 = (void *)[v4 initWithIdentifier:v5 pluginName:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationVirtualParticipant)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_identifier);
  uint64_t v6 = [v4 decodeInt64ForKey:v5];

  uint64_t v7 = objc_opt_class();
  char v8 = NSStringFromSelector(sel_pluginName);
  v9 = [v4 decodeObjectOfClass:v7 forKey:v8];

  v10 = [(TUConversationVirtualParticipant *)self initWithIdentifier:v6 pluginName:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUConversationVirtualParticipant *)self identifier];
  uint64_t v6 = NSStringFromSelector(sel_identifier);
  [v4 encodeInt64:v5 forKey:v6];

  id v8 = [(TUConversationVirtualParticipant *)self pluginName];
  uint64_t v7 = NSStringFromSelector(sel_pluginName);
  [v4 encodeObject:v8 forKey:v7];
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (void).cxx_destruct
{
}

@end