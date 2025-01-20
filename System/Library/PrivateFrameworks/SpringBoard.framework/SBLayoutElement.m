@interface SBLayoutElement
+ (SBLayoutElement)elementWithDescriptor:(id)a3;
+ (SBLayoutElement)elementWithDescriptor:(id)a3 layoutRole:(int64_t)a4;
- (BOOL)hasLayoutAttributes:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)representsSameLayoutElementAsDescriptor:(id)a3;
- (BOOL)supportsLayoutRole:(int64_t)a3;
- (Class)viewControllerClass;
- (NSString)description;
- (NSString)uniqueIdentifier;
- (SBLayoutElement)initWithIdentifier:(id)a3 layoutRole:(int64_t)a4 supportedLayoutRoles:(unint64_t)a5 layoutAttributes:(unint64_t)a6 viewControllerClass:(Class)a7 entityGenerator:(id)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)entityGenerator;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)workspaceEntity;
- (int64_t)layoutRole;
- (unint64_t)hash;
- (unint64_t)layoutAttributes;
- (unint64_t)supportedLayoutRoles;
- (void)setEntityGenerator:(id)a3;
@end

@implementation SBLayoutElement

- (id)workspaceEntity
{
  uint64_t v3 = [(SBLayoutElement *)self entityGenerator];
  v4 = (void *)v3;
  if (v3)
  {
    v5 = (*(void (**)(uint64_t))(v3 + 16))(v3);
    objc_msgSend(v5, "setLayoutRole:", -[SBLayoutElement layoutRole](self, "layoutRole"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)entityGenerator
{
  return self->_entityGenerator;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

+ (SBLayoutElement)elementWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "elementWithDescriptor:layoutRole:", v4, objc_msgSend(v4, "layoutRole"));

  return (SBLayoutElement *)v5;
}

+ (SBLayoutElement)elementWithDescriptor:(id)a3 layoutRole:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = [v6 uniqueIdentifier];
  uint64_t v9 = [v6 supportedLayoutRoles];
  uint64_t v10 = [v6 layoutAttributes];
  uint64_t v11 = [v6 viewControllerClass];
  v12 = [v6 entityGenerator];

  v13 = (void *)[v7 initWithIdentifier:v8 layoutRole:a4 supportedLayoutRoles:v9 layoutAttributes:v10 viewControllerClass:v11 entityGenerator:v12];
  return (SBLayoutElement *)v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(SBLayoutElement *)self uniqueIdentifier];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = (id)objc_msgSend(v3, "appendInteger:", -[SBLayoutElement layoutRole](self, "layoutRole"));
  id v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[SBLayoutElement supportedLayoutRoles](self, "supportedLayoutRoles"));
  id v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[SBLayoutElement layoutAttributes](self, "layoutAttributes"));
  uint64_t v9 = NSStringFromClass([(SBLayoutElement *)self viewControllerClass]);
  id v10 = (id)[v3 appendObject:v9];

  unint64_t v11 = [v3 hash];
  return v11;
}

- (BOOL)hasLayoutAttributes:(unint64_t)a3
{
  return (a3 & ~[(SBLayoutElement *)self layoutAttributes]) == 0;
}

- (unint64_t)layoutAttributes
{
  return self->_layoutAttributes;
}

- (Class)viewControllerClass
{
  return self->_viewControllerClass;
}

- (unint64_t)supportedLayoutRoles
{
  return self->_supportedLayoutRoles;
}

- (SBLayoutElement)initWithIdentifier:(id)a3 layoutRole:(int64_t)a4 supportedLayoutRoles:(unint64_t)a5 layoutAttributes:(unint64_t)a6 viewControllerClass:(Class)a7 entityGenerator:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  v22.receiver = self;
  v22.super_class = (Class)SBLayoutElement;
  v16 = [(SBLayoutElement *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    uniqueIdentifier = v16->_uniqueIdentifier;
    v16->_uniqueIdentifier = (NSString *)v17;

    v16->_layoutRole = a4;
    v16->_supportedLayoutRoles = a5;
    v16->_layoutAttributes = a6;
    v16->_viewControllerClass = a7;
    uint64_t v19 = [v15 copy];
    id entityGenerator = v16->_entityGenerator;
    v16->_id entityGenerator = (id)v19;
  }
  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_entityGenerator, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (id)succinctDescription
{
  v2 = [(SBLayoutElement *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(SBLayoutElement *)self uniqueIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"uniqueIdentifier"];

  id v6 = SBLayoutRoleDescription([(SBLayoutElement *)self layoutRole]);
  id v7 = (id)[v3 appendObject:v6 withName:@"layoutRole"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBLayoutElement *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBLayoutElement *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__SBLayoutElement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  unint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __57__SBLayoutElement_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = SBLayoutRoleMaskDescription([*(id *)(a1 + 40) supportedLayoutRoles]);
  id v4 = (id)[v2 appendObject:v3 withName:@"supportedLayoutRoles"];

  id v5 = *(void **)(a1 + 32);
  id v6 = SBLayoutAttributesDescription([*(id *)(a1 + 40) layoutAttributes]);
  id v7 = (id)[v5 appendObject:v6 withName:@"layoutAttributes"];

  id v8 = *(void **)(a1 + 32);
  NSStringFromClass((Class)[*(id *)(a1 + 40) viewControllerClass]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = (id)[v8 appendObject:v10 withName:@"viewControllerClass"];
}

- (BOOL)supportsLayoutRole:(int64_t)a3
{
  uint64_t v4 = [(SBLayoutElement *)self supportedLayoutRoles];
  return SBLayoutRoleMaskContainsRole(v4, a3);
}

- (BOOL)representsSameLayoutElementAsDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(SBLayoutElement *)self uniqueIdentifier];
  id v6 = [v4 uniqueIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_uniqueIdentifier copy];
    id v6 = (void *)v4[1];
    v4[1] = v5;

    v4[2] = self->_layoutRole;
    v4[3] = self->_supportedLayoutRoles;
    v4[4] = self->_layoutAttributes;
    v4[5] = self->_viewControllerClass;
    uint64_t v7 = [self->_entityGenerator copy];
    id v8 = (void *)v4[6];
    v4[6] = v7;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBLayoutElement *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(SBLayoutElement *)self uniqueIdentifier];
      id v6 = [(SBLayoutElement *)v4 uniqueIdentifier];
      if ([v5 isEqualToString:v6]
        && (int64_t v7 = [(SBLayoutElement *)self layoutRole], v7 == [(SBLayoutElement *)v4 layoutRole])&& (v8 = [(SBLayoutElement *)self supportedLayoutRoles], v8 == [(SBLayoutElement *)v4 supportedLayoutRoles])&& (v9 = [(SBLayoutElement *)self layoutAttributes], v9 == [(SBLayoutElement *)v4 layoutAttributes]))
      {
        id v10 = [(SBLayoutElement *)self viewControllerClass];
        BOOL v11 = v10 == [(SBLayoutElement *)v4 viewControllerClass];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)[(SBLayoutElement *)self descriptionWithMultilinePrefix:0];
}

- (void)setEntityGenerator:(id)a3
{
}

@end