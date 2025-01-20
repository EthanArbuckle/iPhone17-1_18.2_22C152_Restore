@interface UISceneActivationConditions
+ (BOOL)supportsSecureCoding;
- (BOOL)_validateCompileTimeIssues:(id *)a3 runTimeIssues:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSPredicate)canActivateForTargetContentIdentifierPredicate;
- (NSPredicate)prefersToActivateForTargetContentIdentifierPredicate;
- (UIScene)_UIScene;
- (UISceneActivationConditions)init;
- (UISceneActivationConditions)initWithCoder:(NSCoder *)aDecoder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_suitabilityForTargetContentIdentifier:(id)a3 errorString:(id *)a4;
- (unint64_t)hash;
- (void)_setUIScene:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCanActivateForTargetContentIdentifierPredicate:(NSPredicate *)canActivateForTargetContentIdentifierPredicate;
- (void)setPrefersToActivateForTargetContentIdentifierPredicate:(NSPredicate *)prefersToActivateForTargetContentIdentifierPredicate;
@end

@implementation UISceneActivationConditions

- (void)setCanActivateForTargetContentIdentifierPredicate:(NSPredicate *)canActivateForTargetContentIdentifierPredicate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = canActivateForTargetContentIdentifierPredicate;
  if (([(NSPredicate *)self->_canActivatePredicate isEqual:v5] & 1) == 0)
  {
    v6 = objc_alloc_init(_UITargetContentIdentifierPredicateValidator);
    id v15 = 0;
    id v16 = 0;
    BOOL v7 = [(_UITargetContentIdentifierPredicateValidator *)v6 validatePredicate:v5 compileTimeIssues:&v16 runTimeIssues:&v15];
    id v8 = v16;
    id v9 = v15;
    if (v7)
    {
      v10 = (NSPredicate *)[(NSPredicate *)v5 copy];
      canActivatePredicate = self->_canActivatePredicate;
      self->_canActivatePredicate = v10;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_uiScene);
      [WeakRetained _refreshActivationConditions];
    }
    else
    {
      if (v8)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2, self, @"UISceneActivationConditions.m", 170, @"%@", v8 object file lineNumber description];
      }
      v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISceneActivationConditions", &setCanActivateForTargetContentIdentifierPredicate____s_category)+ 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[UISceneActivationConditions setCanActivateForTargetContentIdentifierPredicate:]";
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "%s: %@", buf, 0x16u);
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UISceneActivationConditions *)a3;
  if (v4 == self) {
    goto LABEL_11;
  }
  v5 = objc_opt_class();
  if (![v5 isEqual:objc_opt_class()]) {
    goto LABEL_10;
  }
  unint64_t v6 = [(UISceneActivationConditions *)self hash];
  if (v6 != [(UISceneActivationConditions *)v4 hash]) {
    goto LABEL_10;
  }
  prefersPredicate = self->_prefersPredicate;
  if (prefersPredicate != v4->_prefersPredicate
    && (!prefersPredicate || !-[NSPredicate isEqual:](prefersPredicate, "isEqual:")))
  {
    goto LABEL_10;
  }
  canActivatePredicate = self->_canActivatePredicate;
  if (canActivatePredicate == v4->_canActivatePredicate)
  {
LABEL_11:
    char v9 = 1;
    goto LABEL_12;
  }
  if (!canActivatePredicate)
  {
LABEL_10:
    char v9 = 0;
    goto LABEL_12;
  }
  char v9 = -[NSPredicate isEqual:](canActivatePredicate, "isEqual:");
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  prefersPredicate = self->_prefersPredicate;
  if (prefersPredicate) {
    unint64_t v4 = [(NSPredicate *)prefersPredicate hash] + 113569;
  }
  else {
    unint64_t v4 = 337;
  }
  canActivatePredicate = self->_canActivatePredicate;
  if (canActivatePredicate) {
    return [(NSPredicate *)canActivatePredicate hash] + 337 * v4;
  }
  return v4;
}

- (void)_setUIScene:(id)a3
{
}

- (UISceneActivationConditions)init
{
  v8.receiver = self;
  v8.super_class = (Class)UISceneActivationConditions;
  v2 = [(UISceneActivationConditions *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    canActivatePredicate = v2->_canActivatePredicate;
    v2->_canActivatePredicate = (NSPredicate *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
    prefersPredicate = v2->_prefersPredicate;
    v2->_prefersPredicate = (NSPredicate *)v5;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_uiScene);
  objc_storeStrong((id *)&self->_prefersPredicate, 0);
  objc_storeStrong((id *)&self->_canActivatePredicate, 0);
}

- (void)encodeWithCoder:(id)a3
{
  canActivatePredicate = self->_canActivatePredicate;
  id v5 = a3;
  [v5 encodeObject:canActivatePredicate forKey:@"_UISceneActivationConditionsCanActivatePredicate"];
  [v5 encodeObject:self->_prefersPredicate forKey:@"_UISceneActivationConditionsPrefersPredicate"];
}

- (void)setPrefersToActivateForTargetContentIdentifierPredicate:(NSPredicate *)prefersToActivateForTargetContentIdentifierPredicate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = prefersToActivateForTargetContentIdentifierPredicate;
  if (([(NSPredicate *)self->_prefersPredicate isEqual:v5] & 1) == 0)
  {
    unint64_t v6 = objc_alloc_init(_UITargetContentIdentifierPredicateValidator);
    id v15 = 0;
    id v16 = 0;
    BOOL v7 = [(_UITargetContentIdentifierPredicateValidator *)v6 validatePredicate:v5 compileTimeIssues:&v16 runTimeIssues:&v15];
    id v8 = v16;
    id v9 = v15;
    if (v7)
    {
      v10 = (NSPredicate *)[(NSPredicate *)v5 copy];
      prefersPredicate = self->_prefersPredicate;
      self->_prefersPredicate = v10;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_uiScene);
      [WeakRetained _refreshActivationConditions];
    }
    else
    {
      if (v8)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2, self, @"UISceneActivationConditions.m", 189, @"%@", v8 object file lineNumber description];
      }
      v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("UISceneActivationConditions", &setPrefersToActivateForTargetContentIdentifierPredicate____s_category)+ 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[UISceneActivationConditions setPrefersToActivateForTargetContentIdentifierPredicate:]";
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "%s: %@", buf, 0x16u);
      }
    }
  }
}

- (NSPredicate)canActivateForTargetContentIdentifierPredicate
{
  v2 = (void *)[(NSPredicate *)self->_canActivatePredicate copy];
  return (NSPredicate *)v2;
}

- (NSPredicate)prefersToActivateForTargetContentIdentifierPredicate
{
  v2 = (void *)[(NSPredicate *)self->_prefersPredicate copy];
  return (NSPredicate *)v2;
}

- (id)description
{
  uint64_t v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t v6 = [v3 stringWithFormat:@"<%@: %p can=%@, prefers=%@>", v5, self, self->_canActivatePredicate, self->_prefersPredicate];

  return v6;
}

- (BOOL)_validateCompileTimeIssues:(id *)a3 runTimeIssues:(id *)a4
{
  BOOL v7 = objc_alloc_init(_UITargetContentIdentifierPredicateValidator);
  id v8 = [(UISceneActivationConditions *)self canActivateForTargetContentIdentifierPredicate];
  BOOL v9 = [(_UITargetContentIdentifierPredicateValidator *)v7 validatePredicate:v8 compileTimeIssues:a3 runTimeIssues:a4];

  if (v9)
  {
    v10 = [(UISceneActivationConditions *)self prefersToActivateForTargetContentIdentifierPredicate];
    BOOL v11 = [(_UITargetContentIdentifierPredicateValidator *)v7 validatePredicate:v10 compileTimeIssues:a3 runTimeIssues:a4];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (int64_t)_suitabilityForTargetContentIdentifier:(id)a3 errorString:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = [(UISceneActivationConditions *)self prefersToActivateForTargetContentIdentifierPredicate];
  if ([v6 evaluateWithObject:v5])
  {
    int64_t v7 = 2;
  }
  else
  {
    id v8 = [(UISceneActivationConditions *)self canActivateForTargetContentIdentifierPredicate];
    int64_t v7 = [v8 evaluateWithObject:v5];
  }
  return v7;
}

- (UISceneActivationConditions)initWithCoder:(NSCoder *)aDecoder
{
  unint64_t v4 = aDecoder;
  v13.receiver = self;
  v13.super_class = (Class)UISceneActivationConditions;
  id v5 = [(UISceneActivationConditions *)&v13 init];
  if (v5)
  {
    unint64_t v6 = self;
    uint64_t v7 = [(NSCoder *)v4 decodeObjectOfClass:v6 forKey:@"_UISceneActivationConditionsCanActivatePredicate"];
    canActivatePredicate = v5->_canActivatePredicate;
    v5->_canActivatePredicate = (NSPredicate *)v7;

    BOOL v9 = self;
    uint64_t v10 = [(NSCoder *)v4 decodeObjectOfClass:v9 forKey:@"_UISceneActivationConditionsPrefersPredicate"];
    prefersPredicate = v5->_prefersPredicate;
    v5->_prefersPredicate = (NSPredicate *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [+[UISceneActivationConditions allocWithZone:a3] init];
  [(UISceneActivationConditions *)v4 setCanActivateForTargetContentIdentifierPredicate:self->_canActivatePredicate];
  [(UISceneActivationConditions *)v4 setPrefersToActivateForTargetContentIdentifierPredicate:self->_prefersPredicate];
  return v4;
}

- (UIScene)_UIScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiScene);
  return (UIScene *)WeakRetained;
}

@end