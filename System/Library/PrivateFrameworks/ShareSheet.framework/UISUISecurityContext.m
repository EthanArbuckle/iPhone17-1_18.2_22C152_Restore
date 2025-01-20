@interface UISUISecurityContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (NSArray)securityScopedResources;
- (UISUISecurityContext)initWithCoder:(id)a3;
- (UISUISecurityContext)initWithSecurityScopedResources:(id)a3;
- (id)accessibleURLs;
- (id)description;
- (id)securityScopedResourcesMatchingPredicate:(id)a3;
- (void)activate;
- (void)deactivate;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UISUISecurityContext

- (UISUISecurityContext)initWithSecurityScopedResources:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISUISecurityContext;
  v6 = [(UISUISecurityContext *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_securityScopedResources, a3);
    v7->_activationCount = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(UISUISecurityContext *)self isActive];
  v6 = @"NO";
  if (v5) {
    v6 = @"YES";
  }
  return (id)[v3 stringWithFormat:@"<%@: %p> active = %@, resources = %@", v4, self, v6, self->_securityScopedResources];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)securityScopedResourcesMatchingPredicate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F1CA48] array];
    v6 = [(UISUISecurityContext *)self securityScopedResources];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__UISUISecurityContext_securityScopedResourcesMatchingPredicate___block_invoke;
    v11[3] = &unk_1E5A23298;
    id v13 = v4;
    id v7 = v5;
    id v12 = v7;
    [v6 enumerateObjectsUsingBlock:v11];

    v8 = v12;
    id v9 = v7;
  }
  else
  {
    id v9 = [(UISUISecurityContext *)self securityScopedResources];
  }

  return v9;
}

void __65__UISUISecurityContext_securityScopedResourcesMatchingPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (UISUISecurityContext)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = NSStringFromSelector(sel_securityScopedResources);
  id v9 = [v5 decodeObjectOfClasses:v7 forKey:v8];

  v10 = [(UISUISecurityContext *)self initWithSecurityScopedResources:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  securityScopedResources = self->_securityScopedResources;
  id v4 = a3;
  NSStringFromSelector(sel_securityScopedResources);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:securityScopedResources forKey:v5];
}

- (BOOL)isActive
{
  return self->_activationCount > 0;
}

- (void)activate
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int64_t activationCount = self->_activationCount;
  self->_int64_t activationCount = activationCount + 1;
  if (!activationCount)
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    URLsBeingAccessed = self->_URLsBeingAccessed;
    self->_URLsBeingAccessed = v4;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = self->_securityScopedResources;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v11, "startAccessing", (void)v13))
          {
            id v12 = [v11 url];
            if (v12) {
              [(NSMutableArray *)self->_URLsBeingAccessed addObject:v12];
            }
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
}

- (void)deactivate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v2 = self->_activationCount - 1;
  self->_int64_t activationCount = v2;
  if (!v2)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = self->_securityScopedResources;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "stopAccessing", (void)v10);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    URLsBeingAccessed = self->_URLsBeingAccessed;
    self->_URLsBeingAccessed = 0;
  }
}

- (id)accessibleURLs
{
  int64_t v2 = (void *)[(NSMutableArray *)self->_URLsBeingAccessed copy];
  return v2;
}

- (NSArray)securityScopedResources
{
  return self->_securityScopedResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityScopedResources, 0);
  objc_storeStrong((id *)&self->_URLsBeingAccessed, 0);
}

@end