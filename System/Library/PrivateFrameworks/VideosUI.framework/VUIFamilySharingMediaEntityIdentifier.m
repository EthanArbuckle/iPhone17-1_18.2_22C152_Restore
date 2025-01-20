@interface VUIFamilySharingMediaEntityIdentifier
- (BOOL)isEqual:(id)a3;
- (NSString)objectIdentifier;
- (VUIFamilySharingMediaEntityIdentifier)init;
- (VUIFamilySharingMediaEntityIdentifier)initWithEntityIdentifier:(id)a3 mediaEntityType:(id)a4;
- (VUIMediaEntityType)mediaEntityType;
- (unint64_t)hash;
- (void)setMediaEntityType:(id)a3;
- (void)setObjectIdentifier:(id)a3;
@end

@implementation VUIFamilySharingMediaEntityIdentifier

- (VUIFamilySharingMediaEntityIdentifier)initWithEntityIdentifier:(id)a3 mediaEntityType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"objectIdentifier" format];
  }
  v14.receiver = self;
  v14.super_class = (Class)VUIFamilySharingMediaEntityIdentifier;
  v9 = [(VUIFamilySharingMediaEntityIdentifier *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_objectIdentifier, a3);
    uint64_t v11 = [v8 copy];
    mediaEntityType = v10->_mediaEntityType;
    v10->_mediaEntityType = (VUIMediaEntityType *)v11;
  }
  return v10;
}

- (VUIFamilySharingMediaEntityIdentifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (unint64_t)hash
{
  v2 = [(VUIFamilySharingMediaEntityIdentifier *)self objectIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIFamilySharingMediaEntityIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [(VUIFamilySharingMediaEntityIdentifier *)self objectIdentifier];
    id v7 = [(VUIFamilySharingMediaEntityIdentifier *)v5 objectIdentifier];
    id v8 = v6;
    id v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      char v11 = 1;
    }
    else
    {
      char v11 = 0;
      if (v8 && v9) {
        char v11 = [v8 isEqual:v9];
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
}

- (VUIMediaEntityType)mediaEntityType
{
  return self->_mediaEntityType;
}

- (void)setMediaEntityType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaEntityType, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end