@interface PKApplyFooterContent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)links;
- (NSString)footerText;
- (PKApplyFooterContent)initWithCoder:(id)a3;
- (PKApplyFooterContent)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)termsIdentifiers;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setLinks:(id)a3;
@end

@implementation PKApplyFooterContent

- (PKApplyFooterContent)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 PKStringForKey:@"footerText"];
  if (v5)
  {
    v26.receiver = self;
    v26.super_class = (Class)PKApplyFooterContent;
    v6 = [(PKApplyFooterContent *)&v26 init];
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_footerText, v5);
      v8 = [v4 PKArrayContaining:objc_opt_class() forKey:@"links"];
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            v16 = [PKApplyFooterContentLink alloc];
            v17 = -[PKApplyFooterContentLink initWithDictionary:](v16, "initWithDictionary:", v15, (void)v22);
            [v9 safelyAddObject:v17];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v12);
      }

      if ([v9 count])
      {
        uint64_t v18 = [v9 copy];
        links = v7->_links;
        v7->_links = (NSArray *)v18;
      }
      else
      {
        links = v7->_links;
        v7->_links = 0;
      }
    }
    self = v7;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_footerText forKeyedSubscript:@"footerText"];
  id v4 = [(NSArray *)self->_links pk_arrayBySafelyApplyingBlock:&__block_literal_global_233];
  [v3 setObject:v4 forKeyedSubscript:@"links"];

  v5 = (void *)[v3 copy];
  return v5;
}

uint64_t __48__PKApplyFooterContent_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (id)termsIdentifiers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_links;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "termsIdentifier", (void)v12);
        objc_msgSend(v3, "pk_safelyAddObject:", v9);
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    id v10 = (void *)[v3 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKApplyFooterContent *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        footerText = v6->_footerText;
        v8 = self->_footerText;
        id v9 = footerText;
        if (v8 == v9)
        {
        }
        else
        {
          id v10 = v9;
          if (!v8 || !v9)
          {

LABEL_16:
            char v12 = 0;
LABEL_18:

            goto LABEL_19;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_16;
          }
        }
        links = self->_links;
        long long v14 = v6->_links;
        if (links && v14) {
          char v12 = -[NSArray isEqual:](links, "isEqual:");
        }
        else {
          char v12 = links == v14;
        }
        goto LABEL_18;
      }
    }
    char v12 = 0;
  }
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_footerText];
  [v3 safelyAddObject:self->_links];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v4 = v3;
  if (self->_footerText) {
    [v3 appendFormat:@"footerText: '%@'; ", self->_footerText];
  }
  if ([(NSArray *)self->_links count]) {
    [v4 appendFormat:@"links: '%@'; ", self->_links];
  }
  [v4 appendFormat:@">"];
  uint64_t v5 = (void *)[v4 copy];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplyFooterContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKApplyFooterContent;
  uint64_t v5 = [(PKApplyFooterContent *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footerText"];
    footerText = v5->_footerText;
    v5->_footerText = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"links"];
    links = v5->_links;
    v5->_links = (NSArray *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  footerText = self->_footerText;
  id v5 = a3;
  [v5 encodeObject:footerText forKey:@"footerText"];
  [v5 encodeObject:self->_links forKey:@"links"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKApplyFooterContent allocWithZone:](PKApplyFooterContent, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_footerText copyWithZone:a3];
  footerText = v5->_footerText;
  v5->_footerText = (NSString *)v6;

  uint64_t v8 = [(NSArray *)self->_links copyWithZone:a3];
  links = v5->_links;
  v5->_links = (NSArray *)v8;

  return v5;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
}

@end