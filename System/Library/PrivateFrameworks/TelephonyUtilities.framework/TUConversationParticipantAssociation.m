@interface TUConversationParticipantAssociation
+ (BOOL)supportsSecureCoding;
+ (id)avcIdentifierFromURLComponents:(id)a3 namePrefix:(id)a4;
+ (id)identifierFromURLComponents:(id)a3 namePrefix:(id)a4;
+ (id)participantAssociationFromURLComponents:(id)a3 namePrefix:(id)a4;
+ (id)queryItemName:(id)a3 prefix:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToParticipantAssociation:(id)a3;
- (NSString)avcIdentifier;
- (TUConversationParticipantAssociation)initWithCoder:(id)a3;
- (TUConversationParticipantAssociation)initWithParticipantAssociation:(id)a3;
- (id)avcIdentifierQueryItemWithNamePrefix:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)identifierQueryItemWithNamePrefix:(id)a3;
- (id)queryItemsWithNamePrefix:(id)a3;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAvcIdentifier:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
@end

@implementation TUConversationParticipantAssociation

- (TUConversationParticipantAssociation)initWithParticipantAssociation:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUConversationParticipantAssociation;
  v5 = [(TUConversationParticipantAssociation *)&v10 init];
  if (v5)
  {
    v5->_identifier = [v4 identifier];
    v6 = [v4 avcIdentifier];
    uint64_t v7 = [v6 copy];
    avcIdentifier = v5->_avcIdentifier;
    v5->_avcIdentifier = (NSString *)v7;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationParticipantAssociation)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUConversationParticipantAssociation;
  v5 = [(TUConversationParticipantAssociation *)&v12 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_identifier);
    v5->_identifier = [v4 decodeInt64ForKey:v6];

    uint64_t v7 = objc_opt_class();
    v8 = NSStringFromSelector(sel_avcIdentifier);
    uint64_t v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    avcIdentifier = v5->_avcIdentifier;
    v5->_avcIdentifier = (NSString *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUConversationParticipantAssociation *)self identifier];
  v6 = NSStringFromSelector(sel_identifier);
  [v4 encodeInt64:v5 forKey:v6];

  id v8 = [(TUConversationParticipantAssociation *)self avcIdentifier];
  uint64_t v7 = NSStringFromSelector(sel_avcIdentifier);
  [v4 encodeObject:v8 forKey:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[TUConversationParticipantAssociation allocWithZone:a3];

  return [(TUConversationParticipantAssociation *)v4 initWithParticipantAssociation:self];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" identifier=%llu", -[TUConversationParticipantAssociation identifier](self, "identifier"));
  id v4 = [(TUConversationParticipantAssociation *)self avcIdentifier];

  if (v4)
  {
    unint64_t v5 = [(TUConversationParticipantAssociation *)self avcIdentifier];
    [v3 appendFormat:@" avcIdentifier=%@", v5];
  }
  [v3 appendString:@">"];
  v6 = (void *)[v3 copy];

  return v6;
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[TUConversationParticipantAssociation identifier](self, "identifier"));
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(TUConversationParticipantAssociation *)self avcIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUConversationParticipantAssociation *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUConversationParticipantAssociation *)self isEqualToParticipantAssociation:v4];
  }

  return v5;
}

- (BOOL)isEqualToParticipantAssociation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUConversationParticipantAssociation *)self identifier];
  if (v5 == [v4 identifier])
  {
    unint64_t v6 = [(TUConversationParticipantAssociation *)self avcIdentifier];
    uint64_t v7 = [v4 avcIdentifier];
    char v8 = TUStringsAreEqualOrNil((unint64_t)v6, (uint64_t)v7);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)participantAssociationFromURLComponents:(id)a3 namePrefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [a1 identifierFromURLComponents:v6 namePrefix:v7];
  if (v8)
  {
    uint64_t v9 = objc_alloc_init(TUConversationParticipantAssociation);
    -[TUConversationParticipantAssociation setIdentifier:](v9, "setIdentifier:", [v8 unsignedLongLongValue]);
    if (v9)
    {
      objc_super v10 = [a1 avcIdentifierFromURLComponents:v6 namePrefix:v7];
      [(TUConversationParticipantAssociation *)v9 setAvcIdentifier:v10];
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)identifierFromURLComponents:(id)a3 namePrefix:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_class();
  char v8 = NSStringFromSelector(sel_identifier);
  uint64_t v9 = [v7 queryItemName:v8 prefix:v5];

  objc_super v10 = [v6 firstQueryItemWithName:v9];

  v11 = [v10 value];

  if (v11)
  {
    objc_super v12 = [v10 value];
    v11 = objc_msgSend(v12, "tu_unsignedLongLongNumber");
  }

  return v11;
}

+ (id)queryItemName:(id)a3 prefix:(id)a4
{
  id v5 = a3;
  id v6 = v5;
  if (a4)
  {
    id v7 = [NSString stringWithFormat:@"%@_%@", a4, v5];
  }
  else
  {
    id v7 = v5;
  }
  char v8 = v7;

  return v8;
}

+ (id)avcIdentifierFromURLComponents:(id)a3 namePrefix:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_class();
  char v8 = NSStringFromSelector(sel_avcIdentifier);
  uint64_t v9 = [v7 queryItemName:v8 prefix:v5];

  objc_super v10 = [v6 firstQueryItemWithName:v9];

  v11 = [v10 value];

  return v11;
}

- (id)queryItemsWithNamePrefix:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = [(TUConversationParticipantAssociation *)self identifierQueryItemWithNamePrefix:v4];
  v12[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  char v8 = [v5 arrayWithArray:v7];

  uint64_t v9 = [(TUConversationParticipantAssociation *)self avcIdentifier];

  if (v9)
  {
    objc_super v10 = [(TUConversationParticipantAssociation *)self avcIdentifierQueryItemWithNamePrefix:v4];
    [v8 addObject:v10];
  }

  return v8;
}

- (id)identifierQueryItemWithNamePrefix:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_identifier);
  id v7 = [v5 queryItemName:v6 prefix:v4];

  char v8 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", -[TUConversationParticipantAssociation identifier](self, "identifier"));
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:v7 value:v8];

  return v9;
}

- (id)avcIdentifierQueryItemWithNamePrefix:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_avcIdentifier);
  id v7 = [v5 queryItemName:v6 prefix:v4];

  id v8 = objc_alloc(MEMORY[0x1E4F290C8]);
  uint64_t v9 = [(TUConversationParticipantAssociation *)self avcIdentifier];
  objc_super v10 = (void *)[v8 initWithName:v7 value:v9];

  return v10;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (NSString)avcIdentifier
{
  return self->_avcIdentifier;
}

- (void)setAvcIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end