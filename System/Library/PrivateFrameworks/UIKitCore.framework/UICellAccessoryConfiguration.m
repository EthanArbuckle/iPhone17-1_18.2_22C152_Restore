@interface UICellAccessoryConfiguration
- (BOOL)alwaysNeedsLayout;
- (BOOL)isEqual:(id)a3;
- (NSArray)leadingAccessories;
- (NSArray)trailingAccessories;
- (UICellAccessoryConfiguration)init;
- (id)description;
- (void)setLeadingAccessories:(id)a3;
- (void)setTrailingAccessories:(id)a3;
@end

@implementation UICellAccessoryConfiguration

- (NSArray)leadingAccessories
{
  return self->_leadingAccessories;
}

- (BOOL)alwaysNeedsLayout
{
  return self->_leadingAlwaysNeedsLayout || self->_trailingAlwaysNeedsLayout;
}

- (NSArray)trailingAccessories
{
  return self->_trailingAccessories;
}

- (void)setTrailingAccessories:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (NSArray *)[a3 copy];
  trailingAccessories = self->_trailingAccessories;
  self->_trailingAccessories = v4;

  v6 = self->_trailingAccessories;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = v6;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "alwaysNeedsLayout", (void)v11))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  self->_trailingAlwaysNeedsLayout = v8;
}

- (void)setLeadingAccessories:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (NSArray *)[a3 copy];
  leadingAccessories = self->_leadingAccessories;
  self->_leadingAccessories = v4;

  v6 = self->_leadingAccessories;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = v6;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "alwaysNeedsLayout", (void)v11))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  self->_leadingAlwaysNeedsLayout = v8;
}

- (UICellAccessoryConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)UICellAccessoryConfiguration;
  v2 = [(UICellAccessoryConfiguration *)&v7 init];
  leadingAccessories = v2->_leadingAccessories;
  v4 = (NSArray *)MEMORY[0x1E4F1CBF0];
  v2->_leadingAccessories = (NSArray *)MEMORY[0x1E4F1CBF0];

  trailingAccessories = v2->_trailingAccessories;
  v2->_trailingAccessories = v4;

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(UICellAccessoryConfiguration *)self leadingAccessories];
    objc_super v7 = [v5 leadingAccessories];
    id v8 = v6;
    id v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      long long v12 = v9;
      id v13 = v8;
      if (!v8 || !v9)
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      int v11 = [v8 isEqual:v9];

      if (!v11) {
        goto LABEL_16;
      }
    }
    long long v14 = [(UICellAccessoryConfiguration *)self trailingAccessories];
    v15 = [v5 trailingAccessories];
    id v13 = v14;
    id v16 = v15;
    long long v12 = v16;
    if (v13 == v16)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v13 && v16) {
        LOBYTE(v11) = [v13 isEqual:v16];
      }
    }

    goto LABEL_15;
  }
  LOBYTE(v11) = 0;
LABEL_17:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingAccessories, 0);
  objc_storeStrong((id *)&self->_leadingAccessories, 0);
}

- (id)description
{
  return +[UIDescriptionBuilder descriptionForObject:self keys:&unk_1ED3F12D0];
}

@end