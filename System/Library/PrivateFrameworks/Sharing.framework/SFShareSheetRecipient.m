@interface SFShareSheetRecipient
+ (BOOL)supportsSecureCoding;
- (NSSet)formattedHandles;
- (NSString)contactIdentifier;
- (NSString)displayName;
- (NSString)realName;
- (SFShareSheetRecipient)init;
- (SFShareSheetRecipient)initWithAirDropNode:(id)a3;
- (SFShareSheetRecipient)initWithCoder:(id)a3;
- (SFShareSheetRecipient)initWithNode:(id)a3;
- (SFShareSheetRecipient)initWithPerson:(id)a3 handleValidationBlock:(id)a4;
- (SFShareSheetRecipient)initWithRealName:(id)a3 displayName:(id)a4 formattedHandles:(id)a5 contactIdentifier:(id)a6;
- (id)_handleFromPerson:(id)a3 withHandleValidationBlock:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFShareSheetRecipient

- (SFShareSheetRecipient)init
{
  return 0;
}

- (SFShareSheetRecipient)initWithNode:(id)a3
{
  id v4 = a3;
  v5 = [v4 realName];
  v6 = [v4 displayName];
  v7 = [v4 formattedHandles];
  v8 = [v4 contactIdentifier];

  v9 = [(SFShareSheetRecipient *)self initWithRealName:v5 displayName:v6 formattedHandles:v7 contactIdentifier:v8];
  return v9;
}

- (SFShareSheetRecipient)initWithAirDropNode:(id)a3
{
  id v4 = a3;
  v5 = [v4 realName];
  v6 = [v4 displayName];
  v7 = [v4 formattedHandles];
  v8 = [v4 contactIdentifier];

  v9 = [(SFShareSheetRecipient *)self initWithRealName:v5 displayName:v6 formattedHandles:v7 contactIdentifier:v8];
  return v9;
}

- (SFShareSheetRecipient)initWithPerson:(id)a3 handleValidationBlock:(id)a4
{
  id v6 = a3;
  v7 = [(SFShareSheetRecipient *)self _handleFromPerson:v6 withHandleValidationBlock:a4];
  if (v7) {
    [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  }
  else {
  v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  v9 = [v6 customIdentifier];
  v10 = [v6 displayName];
  v11 = [v6 contactIdentifier];

  v12 = [(SFShareSheetRecipient *)self initWithRealName:v9 displayName:v10 formattedHandles:v8 contactIdentifier:v11];
  return v12;
}

- (SFShareSheetRecipient)initWithRealName:(id)a3 displayName:(id)a4 formattedHandles:(id)a5 contactIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SFShareSheetRecipient;
  v14 = [(SFShareSheetRecipient *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    realName = v14->_realName;
    v14->_realName = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    displayName = v14->_displayName;
    v14->_displayName = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    formattedHandles = v14->_formattedHandles;
    v14->_formattedHandles = (NSSet *)v19;

    uint64_t v21 = [v13 copy];
    contactIdentifier = v14->_contactIdentifier;
    v14->_contactIdentifier = (NSString *)v21;
  }
  return v14;
}

- (id)description
{
  if (IsAppleInternalBuild())
  {
    v3 = NSString;
    v8.receiver = self;
    v8.super_class = (Class)SFShareSheetRecipient;
    id v4 = [(SFShareSheetRecipient *)&v8 description];
    v5 = [v3 stringWithFormat:@"<%@ realName:%@ displayName:%@ contactIdentifier:%@ formattedHandles:%@>", v4, self->_realName, self->_displayName, self->_contactIdentifier, self->_formattedHandles];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SFShareSheetRecipient;
    v5 = [(SFShareSheetRecipient *)&v7 description];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFShareSheetRecipient)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFShareSheetRecipient;
  v5 = [(SFShareSheetRecipient *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"realName"];
    realName = v5->_realName;
    v5->_realName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"formattedHandles"];
    formattedHandles = v5->_formattedHandles;
    v5->_formattedHandles = (NSSet *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  realName = self->_realName;
  id v5 = a3;
  [v5 encodeObject:realName forKey:@"realName"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_formattedHandles forKey:@"formattedHandles"];
  [v5 encodeObject:self->_contactIdentifier forKey:@"contactIdentifier"];
}

- (id)_handleFromPerson:(id)a3 withHandleValidationBlock:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (uint64_t (**)(id, void *))a4;
  objc_super v7 = [v5 personHandle];
  uint64_t v8 = [v7 value];

  if (v8
    && (!v6
     || ([v5 personHandle],
         v9 = objc_claimAutoreleasedReturnValue(),
         int v10 = v6[2](v6, v9),
         v9,
         v10)))
  {
    uint64_t v11 = [v5 personHandle];
    id v12 = [v11 value];
  }
  else
  {
    id v12 = 0;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v13 = objc_msgSend(v5, "aliases", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_super v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (!v6 || v6[2](v6, *(void **)(*((void *)&v21 + 1) + 8 * i)))
        {
          uint64_t v19 = [v18 value];

          id v12 = (void *)v19;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  return v12;
}

- (NSString)realName
{
  return self->_realName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSSet)formattedHandles
{
  return self->_formattedHandles;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_formattedHandles, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_realName, 0);
}

@end