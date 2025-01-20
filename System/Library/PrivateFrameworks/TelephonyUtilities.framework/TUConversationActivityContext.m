@interface TUConversationActivityContext
+ (BOOL)supportsSecureCoding;
+ (id)mediaContextIdentifiers;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToActivityContext:(id)a3;
- (BOOL)isMedia;
- (NSString)actionDescription;
- (NSString)analyticsIdentifier;
- (NSString)completedDescription;
- (NSString)ongoingDescription;
- (NSString)typedIdentifier;
- (TUConversationActivityContext)initWithCoder:(id)a3;
- (TUConversationActivityContext)initWithContextIdentifier:(id)a3 actionDescription:(id)a4 ongoingDescription:(id)a5 completedDescription:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionDescription:(id)a3;
- (void)setCompletedDescription:(id)a3;
- (void)setOngoingDescription:(id)a3;
- (void)setTypedIdentifier:(id)a3;
@end

@implementation TUConversationActivityContext

- (TUConversationActivityContext)initWithContextIdentifier:(id)a3 actionDescription:(id)a4 ongoingDescription:(id)a5 completedDescription:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TUConversationActivityContext;
  v15 = [(TUConversationActivityContext *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_typedIdentifier, a3);
    objc_storeStrong((id *)&v16->_actionDescription, a4);
    objc_storeStrong((id *)&v16->_ongoingDescription, a5);
    objc_storeStrong((id *)&v16->_completedDescription, a6);
  }

  return v16;
}

- (id)description
{
  v2 = [(TUConversationActivityContext *)self typedIdentifier];
  v3 = (void *)[v2 copy];

  return v3;
}

- (NSString)analyticsIdentifier
{
  v3 = [(TUConversationActivityContext *)self typedIdentifier];
  char v4 = [v3 isEqualToString:@"CPGroupActivityListenTogetherContext"];

  if (v4) {
    return (NSString *)@"listenTogether";
  }
  v6 = [(TUConversationActivityContext *)self typedIdentifier];
  char v7 = [v6 isEqualToString:@"CPGroupActivityWatchTogetherContext"];

  if (v7) {
    return (NSString *)@"watchTogether";
  }
  v8 = [(TUConversationActivityContext *)self typedIdentifier];
  char v9 = [v8 isEqualToString:@"CPGroupActivityWorkoutTogetherContext"];

  if (v9) {
    return (NSString *)@"workoutTogether";
  }
  v10 = [(TUConversationActivityContext *)self typedIdentifier];
  char v11 = [v10 isEqualToString:@"CPGroupActivityPlayTogetherContext"];

  if (v11) {
    return (NSString *)@"playTogether";
  }
  id v12 = [(TUConversationActivityContext *)self typedIdentifier];
  char v13 = [v12 isEqualToString:@"CPGroupActivityShopTogetherContext"];

  if (v13) {
    return (NSString *)@"shopTogether";
  }
  id v14 = [(TUConversationActivityContext *)self typedIdentifier];
  char v15 = [v14 isEqualToString:@"CPGroupActivityReadTogetherContext"];

  if (v15) {
    return (NSString *)@"readTogether";
  }
  v16 = [(TUConversationActivityContext *)self typedIdentifier];
  char v17 = [v16 isEqualToString:@"CPGroupActivityExploreTogetherContext"];

  if (v17) {
    return (NSString *)@"exploreTogether";
  }
  objc_super v18 = [(TUConversationActivityContext *)self typedIdentifier];
  char v19 = [v18 isEqualToString:@"CPGroupActivityLearnTogetherContext"];

  if (v19) {
    return (NSString *)@"learnTogether";
  }
  v20 = [(TUConversationActivityContext *)self typedIdentifier];
  int v21 = [v20 isEqualToString:@"CPGroupActivityCreateTogetherContext"];

  if (v21) {
    return (NSString *)@"createTogether";
  }
  else {
    return (NSString *)@"generic";
  }
}

- (BOOL)isMedia
{
  v3 = [(id)objc_opt_class() mediaContextIdentifiers];
  char v4 = [(TUConversationActivityContext *)self typedIdentifier];
  char v5 = [v3 containsObject:v4];

  return v5;
}

+ (id)mediaContextIdentifiers
{
  if (mediaContextIdentifiers_onceToken != -1) {
    dispatch_once(&mediaContextIdentifiers_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)mediaContextIdentifiers_mediaContextIdentifiers;

  return v2;
}

uint64_t __56__TUConversationActivityContext_mediaContextIdentifiers__block_invoke()
{
  mediaContextIdentifiers_mediaContextIdentifiers = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"CPGroupActivityWatchTogetherContext", @"CPGroupActivityListenTogetherContext", 0);

  return MEMORY[0x1F41817F8]();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationActivityContext *)self isEqualToActivityContext:v4];

  return v5;
}

- (BOOL)isEqualToActivityContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationActivityContext *)self typedIdentifier];
  v6 = [v4 typedIdentifier];
  if ([v5 isEqual:v6])
  {
    char v7 = [(TUConversationActivityContext *)self actionDescription];
    v8 = [v4 actionDescription];
    if ([v7 isEqual:v8])
    {
      char v9 = [(TUConversationActivityContext *)self ongoingDescription];
      v10 = [v4 ongoingDescription];
      if ([v9 isEqual:v10])
      {
        char v11 = [(TUConversationActivityContext *)self completedDescription];
        id v12 = [v4 completedDescription];
        char v13 = [v11 isEqual:v12];
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(TUConversationActivityContext *)self typedIdentifier];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TUConversationActivityContext *)self actionDescription];
  uint64_t v6 = [v5 hash] ^ v4;
  char v7 = [(TUConversationActivityContext *)self ongoingDescription];
  uint64_t v8 = [v7 hash];
  char v9 = [(TUConversationActivityContext *)self completedDescription];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(TUConversationActivityContext *)self typedIdentifier];
  uint64_t v6 = [(TUConversationActivityContext *)self actionDescription];
  char v7 = [(TUConversationActivityContext *)self ongoingDescription];
  uint64_t v8 = [(TUConversationActivityContext *)self completedDescription];
  char v9 = (void *)[v4 initWithContextIdentifier:v5 actionDescription:v6 ongoingDescription:v7 completedDescription:v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationActivityContext)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_typedIdentifier);
  char v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    char v9 = NSStringFromSelector(sel_actionDescription);
    unint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

    if (v10)
    {
      uint64_t v11 = objc_opt_class();
      id v12 = NSStringFromSelector(sel_ongoingDescription);
      char v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

      if (v13)
      {
        uint64_t v14 = objc_opt_class();
        char v15 = NSStringFromSelector(sel_completedDescription);
        v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

        if (v16)
        {
          self = [(TUConversationActivityContext *)self initWithContextIdentifier:v7 actionDescription:v10 ongoingDescription:v13 completedDescription:v16];
          char v17 = self;
        }
        else
        {
          char v17 = 0;
        }
      }
      else
      {
        char v17 = 0;
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUConversationActivityContext *)self typedIdentifier];
  uint64_t v6 = NSStringFromSelector(sel_typedIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  char v7 = [(TUConversationActivityContext *)self actionDescription];
  uint64_t v8 = NSStringFromSelector(sel_actionDescription);
  [v4 encodeObject:v7 forKey:v8];

  char v9 = [(TUConversationActivityContext *)self ongoingDescription];
  unint64_t v10 = NSStringFromSelector(sel_ongoingDescription);
  [v4 encodeObject:v9 forKey:v10];

  id v12 = [(TUConversationActivityContext *)self completedDescription];
  uint64_t v11 = NSStringFromSelector(sel_completedDescription);
  [v4 encodeObject:v12 forKey:v11];
}

- (NSString)typedIdentifier
{
  return self->_typedIdentifier;
}

- (void)setTypedIdentifier:(id)a3
{
}

- (NSString)actionDescription
{
  return self->_actionDescription;
}

- (void)setActionDescription:(id)a3
{
}

- (NSString)ongoingDescription
{
  return self->_ongoingDescription;
}

- (void)setOngoingDescription:(id)a3
{
}

- (NSString)completedDescription
{
  return self->_completedDescription;
}

- (void)setCompletedDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedDescription, 0);
  objc_storeStrong((id *)&self->_ongoingDescription, 0);
  objc_storeStrong((id *)&self->_actionDescription, 0);

  objc_storeStrong((id *)&self->_typedIdentifier, 0);
}

@end