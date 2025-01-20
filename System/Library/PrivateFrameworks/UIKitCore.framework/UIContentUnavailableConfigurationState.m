@interface UIContentUnavailableConfigurationState
+ (BOOL)supportsSecureCoding;
+ (UIContentUnavailableConfigurationState)_readonlyContentUnavailableConfigurationState:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)searchControllerText;
- (NSString)searchText;
- (UIContentUnavailableConfigurationState)initWithCoder:(NSCoder *)coder;
- (UIContentUnavailableConfigurationState)initWithTraitCollection:(UITraitCollection *)traitCollection;
- (UITraitCollection)traitCollection;
- (id)_customStatesForSwiftBridging;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customStateForKey:(id)a3;
- (unint64_t)_mutations;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCustomState:(id)a3 forKey:(id)a4;
- (void)setSearchText:(NSString *)searchText;
- (void)setTraitCollection:(UITraitCollection *)traitCollection;
@end

@implementation UIContentUnavailableConfigurationState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_customStates, 0);
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

+ (UIContentUnavailableConfigurationState)_readonlyContentUnavailableConfigurationState:(uint64_t)a1
{
  id v2 = a2;
  self;
  if (!v2)
  {
    if (qword_1EB25F138 != -1) {
      dispatch_once(&qword_1EB25F138, &__block_literal_global_48);
    }
    v3 = (UIContentUnavailableConfigurationState *)(id)_MergedGlobals_958;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = (UIContentUnavailableConfigurationState *)v2;
LABEL_7:
    v4 = v3;
    goto LABEL_9;
  }
  v5 = [UIContentUnavailableConfigurationState alloc];
  v6 = [v2 traitCollection];
  v4 = [(UIContentUnavailableConfigurationState *)v5 initWithTraitCollection:v6];

LABEL_9:
  return v4;
}

- (unint64_t)_mutations
{
  return self->_mutations;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (id)_customStatesForSwiftBridging
{
  return self->_customStates;
}

void __88__UIContentUnavailableConfigurationState__readonlyContentUnavailableConfigurationState___block_invoke()
{
  v0 = [UIContentUnavailableConfigurationState alloc];
  +[UITraitCollection _emptyTraitCollection]();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(UIContentUnavailableConfigurationState *)v0 initWithTraitCollection:v3];
  id v2 = (void *)_MergedGlobals_958;
  _MergedGlobals_958 = v1;
}

- (void)setSearchText:(NSString *)searchText
{
  v4 = searchText;
  v5 = self->_searchText;
  v6 = v4;
  v11 = v6;
  if (v5 == v6)
  {

    v9 = v11;
LABEL_9:

    v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    v8 = v11;
    goto LABEL_8;
  }
  char v7 = [(NSString *)v5 isEqual:v6];

  v8 = v11;
  if ((v7 & 1) == 0)
  {
LABEL_8:
    ++self->_mutations;
    v10 = v8;
    v9 = self->_searchText;
    self->_searchText = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (UIContentUnavailableConfigurationState)initWithTraitCollection:(UITraitCollection *)traitCollection
{
  v6 = traitCollection;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UIContentUnavailableConfigurationState.m", 21, @"Invalid parameter not satisfying: %@", @"traitCollection != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)UIContentUnavailableConfigurationState;
  char v7 = [(UIContentUnavailableConfigurationState *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_traitCollection, traitCollection);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIContentUnavailableConfigurationState)initWithCoder:(NSCoder *)coder
{
  v4 = coder;
  v5 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"traitCollection"];
  if (v5)
  {
    v13.receiver = self;
    v13.super_class = (Class)UIContentUnavailableConfigurationState;
    v6 = [(UIContentUnavailableConfigurationState *)&v13 init];
    char v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_traitCollection, v5);
      uint64_t v8 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchText"];
      searchText = v7->_searchText;
      v7->_searchText = (NSString *)v8;

      if (![(NSCoder *)v4 requiresSecureCoding])
      {
        uint64_t v10 = [(NSCoder *)v4 decodeObjectForKey:@"customStates"];
        customStates = v7->_customStates;
        v7->_customStates = (NSMutableDictionary *)v10;
      }
    }
  }
  else
  {

    char v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_traitCollection forKey:@"traitCollection"];
  [v4 encodeObject:self->_searchText forKey:@"searchText"];
  if (([v4 requiresSecureCoding] & 1) == 0) {
    [v4 encodeObject:self->_customStates forKey:@"customStates"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  v5 = self;
  v6 = v5;
  if (v4)
  {
    if (!v5)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel__initWithState_, v4, @"UIContentUnavailableConfigurationState.m", 30, @"Invalid parameter not satisfying: %@", @"state != nil" object file lineNumber description];
    }
    uint64_t v4 = [(id)v4 initWithTraitCollection:v6->_traitCollection];
    if (v4)
    {
      uint64_t v7 = [(NSMutableDictionary *)v6->_customStates mutableCopy];
      uint64_t v8 = *(void **)(v4 + 16);
      *(void *)(v4 + 16) = v7;

      objc_storeStrong((id *)(v4 + 32), v6->_searchText);
    }
  }

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (UIContentUnavailableConfigurationState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        traitCollection = v6->_traitCollection;
        uint64_t v8 = self->_traitCollection;
        v9 = traitCollection;
        if (v8 == v9)
        {
        }
        else
        {
          uint64_t v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9) {
            goto LABEL_23;
          }
          BOOL v11 = [(UITraitCollection *)v8 isEqual:v9];

          if (!v11) {
            goto LABEL_24;
          }
        }
        customStates = v6->_customStates;
        uint64_t v8 = self->_customStates;
        objc_super v13 = customStates;
        if (v8 == v13)
        {

LABEL_18:
          searchText = self->_searchText;
          v15 = v6->_searchText;
          uint64_t v8 = searchText;
          v16 = v15;
          if (v8 == v16)
          {
            LOBYTE(v11) = 1;
            uint64_t v10 = v8;
          }
          else
          {
            uint64_t v10 = v16;
            LOBYTE(v11) = 0;
            if (v8 && v16) {
              LOBYTE(v11) = [(UITraitCollection *)v8 isEqual:v16];
            }
          }
          goto LABEL_23;
        }
        uint64_t v10 = v13;
        LOBYTE(v11) = 0;
        if (v8 && v13)
        {
          BOOL v11 = [(UITraitCollection *)v8 isEqual:v13];

          if (!v11) {
            goto LABEL_24;
          }
          goto LABEL_18;
        }
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(UITraitCollection *)self->_traitCollection hash];
  uint64_t v4 = [(NSMutableDictionary *)self->_customStates hash] ^ v3;
  return v4 ^ [(NSString *)self->_searchText hash];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self)
  {
    uint64_t v4 = [NSString stringWithFormat:@"traitCollection = %@", self->_traitCollection];
    [v3 addObject:v4];

    if (self->_searchText)
    {
      v5 = [NSString stringWithFormat:@"searchText = %@", self->_searchText];
      [v3 addObject:v5];
    }
  }

  if (self->_customStates)
  {
    v6 = [NSString stringWithFormat:@"Custom = %@", self->_customStates];
    [v3 addObject:v6];
  }
  uint64_t v7 = NSString;
  uint64_t v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  uint64_t v10 = [v3 componentsJoinedByString:@"; "];
  BOOL v11 = [v7 stringWithFormat:@"<%@: %p; %@>", v9, self, v10];

  return (NSString *)v11;
}

- (void)setTraitCollection:(UITraitCollection *)traitCollection
{
  v6 = traitCollection;
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"UIContentUnavailableConfigurationState.m", 123, @"Invalid parameter not satisfying: %@", @"traitCollection != nil" object file lineNumber description];

    v6 = 0;
  }
  if (self->_traitCollection != v6)
  {
    ++self->_mutations;
    uint64_t v8 = v6;
    objc_storeStrong((id *)&self->_traitCollection, traitCollection);
    v6 = v8;
  }
}

- (id)customStateForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_customStates objectForKeyedSubscript:a3];
}

- (void)setCustomState:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self) {
    ++self->_mutations;
  }
  customStates = self->_customStates;
  if (!customStates)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v9 = self->_customStates;
    self->_customStates = v8;

    customStates = self->_customStates;
  }
  [(NSMutableDictionary *)customStates setObject:v10 forKeyedSubscript:v6];
}

- (NSString)searchControllerText
{
  return self->_searchText;
}

@end