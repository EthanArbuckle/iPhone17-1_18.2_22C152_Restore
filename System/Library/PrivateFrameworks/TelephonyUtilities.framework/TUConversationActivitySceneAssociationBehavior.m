@interface TUConversationActivitySceneAssociationBehavior
+ (BOOL)supportsSecureCoding;
+ (TUConversationActivitySceneAssociationBehavior)defaultBehavior;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToSceneAssociationBehavior:(id)a3;
- (BOOL)shouldAssociateScene;
- (NSString)preferredSceneSessionRole;
- (NSString)targetContentIdentifier;
- (TUConversationActivitySceneAssociationBehavior)initWithCoder:(id)a3;
- (TUConversationActivitySceneAssociationBehavior)initWithTargetContentIdentifier:(id)a3 shouldAssociateScene:(BOOL)a4 preferredSceneSessionRole:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUConversationActivitySceneAssociationBehavior

+ (TUConversationActivitySceneAssociationBehavior)defaultBehavior
{
  v2 = [[TUConversationActivitySceneAssociationBehavior alloc] initWithTargetContentIdentifier:0 shouldAssociateScene:1 preferredSceneSessionRole:0];

  return v2;
}

- (TUConversationActivitySceneAssociationBehavior)initWithTargetContentIdentifier:(id)a3 shouldAssociateScene:(BOOL)a4 preferredSceneSessionRole:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TUConversationActivitySceneAssociationBehavior;
  v10 = [(TUConversationActivitySceneAssociationBehavior *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    targetContentIdentifier = v10->_targetContentIdentifier;
    v10->_targetContentIdentifier = (NSString *)v11;

    v10->_shouldAssociateScene = a4;
    uint64_t v13 = [v9 copy];
    preferredSceneSessionRole = v10->_preferredSceneSessionRole;
    v10->_preferredSceneSessionRole = (NSString *)v13;
  }
  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(TUConversationActivitySceneAssociationBehavior *)self targetContentIdentifier];
  [v3 appendFormat:@" targetContentIdentifier=%@", v4];

  objc_msgSend(v3, "appendFormat:", @" shouldAssociateScene=%d", -[TUConversationActivitySceneAssociationBehavior shouldAssociateScene](self, "shouldAssociateScene"));
  v5 = [(TUConversationActivitySceneAssociationBehavior *)self preferredSceneSessionRole];
  [v3 appendFormat:@" preferredSceneSessionRole=%@", v5];

  [v3 appendString:@">"];
  v6 = (void *)[v3 copy];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationActivitySceneAssociationBehavior *)self isEquivalentToSceneAssociationBehavior:v4];

  return v5;
}

- (BOOL)isEquivalentToSceneAssociationBehavior:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationActivitySceneAssociationBehavior *)self targetContentIdentifier];
  v6 = [v4 targetContentIdentifier];
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6)
    && (int v7 = [(TUConversationActivitySceneAssociationBehavior *)self shouldAssociateScene],
        v7 == [v4 shouldAssociateScene]))
  {
    id v9 = [(TUConversationActivitySceneAssociationBehavior *)self preferredSceneSessionRole];
    v10 = [v4 preferredSceneSessionRole];
    char v8 = TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10);
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [(TUConversationActivitySceneAssociationBehavior *)self targetContentIdentifier];
  uint64_t v4 = [v3 hash];
  if ([(TUConversationActivitySceneAssociationBehavior *)self shouldAssociateScene]) {
    uint64_t v5 = 1231;
  }
  else {
    uint64_t v5 = 1237;
  }
  v6 = [(TUConversationActivitySceneAssociationBehavior *)self preferredSceneSessionRole];
  unint64_t v7 = v5 ^ v4 ^ [v6 hash];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(TUConversationActivitySceneAssociationBehavior *)self targetContentIdentifier];
  BOOL v6 = [(TUConversationActivitySceneAssociationBehavior *)self shouldAssociateScene];
  unint64_t v7 = [(TUConversationActivitySceneAssociationBehavior *)self preferredSceneSessionRole];
  char v8 = (void *)[v4 initWithTargetContentIdentifier:v5 shouldAssociateScene:v6 preferredSceneSessionRole:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationActivitySceneAssociationBehavior)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = NSStringFromSelector(sel_targetContentIdentifier);
  unint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  char v8 = NSStringFromSelector(sel_shouldAssociateScene);
  uint64_t v9 = [v4 decodeBoolForKey:v8];

  uint64_t v10 = objc_opt_class();
  uint64_t v11 = NSStringFromSelector(sel_preferredSceneSessionRole);
  v12 = [v4 decodeObjectOfClass:v10 forKey:v11];

  uint64_t v13 = [(TUConversationActivitySceneAssociationBehavior *)self initWithTargetContentIdentifier:v7 shouldAssociateScene:v9 preferredSceneSessionRole:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationActivitySceneAssociationBehavior *)self targetContentIdentifier];
  BOOL v6 = NSStringFromSelector(sel_targetContentIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  BOOL v7 = [(TUConversationActivitySceneAssociationBehavior *)self shouldAssociateScene];
  char v8 = NSStringFromSelector(sel_shouldAssociateScene);
  [v4 encodeBool:v7 forKey:v8];

  id v10 = [(TUConversationActivitySceneAssociationBehavior *)self preferredSceneSessionRole];
  uint64_t v9 = NSStringFromSelector(sel_preferredSceneSessionRole);
  [v4 encodeObject:v10 forKey:v9];
}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (BOOL)shouldAssociateScene
{
  return self->_shouldAssociateScene;
}

- (NSString)preferredSceneSessionRole
{
  return self->_preferredSceneSessionRole;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSceneSessionRole, 0);

  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
}

@end