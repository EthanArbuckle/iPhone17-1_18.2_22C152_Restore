@interface PKPassAuxiliaryPassInformation
+ (BOOL)supportsSecureCoding;
- (NSArray)items;
- (NSString)identifier;
- (NSString)title;
- (PKPassAuxiliaryPassInformation)initWithCoder:(id)a3;
- (PKPassAuxiliaryPassInformation)initWithInformation:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setItems:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKPassAuxiliaryPassInformation

- (PKPassAuxiliaryPassInformation)initWithInformation:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v34.receiver = self;
  v34.super_class = (Class)PKPassAuxiliaryPassInformation;
  v13 = [(PKPassAuxiliaryPassInformation *)&v34 init];
  if (v13)
  {
    uint64_t v14 = [v10 PKStringForKey:@"identifier"];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v16 = [v10 PKStringForKey:@"title"];
    uint64_t v17 = PKLocalizedPassStringForPassBundle(v16, v11, v12);
    title = v13->_title;
    v29 = v13;
    v13->_title = (NSString *)v17;

    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v20 = [v10 objectForKey:@"values"];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [[PKPassAuxiliaryPassInformationItem alloc] initWithItemInformation:*(void *)(*((void *)&v30 + 1) + 8 * i) bundle:v11 privateBundle:v12 passType:a6];
          [v19 safelyAddObject:v25];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v22);
    }

    uint64_t v26 = [v19 copy];
    v13 = v29;
    items = v29->_items;
    v29->_items = (NSArray *)v26;
  }
  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_title hash] - v3 + 32 * v3;
  return [(NSArray *)self->_items hash] - v4 + 32 * v4 + 506447;
}

- (PKPassAuxiliaryPassInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPassAuxiliaryPassInformation;
  v5 = [(PKPassAuxiliaryPassInformation *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"values"];
    items = v5->_items;
    v5->_items = (NSArray *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_items forKey:@"values"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPassAuxiliaryPassInformation allocWithZone:](PKPassAuxiliaryPassInformation, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
  title = v5->_title;
  v5->_title = (NSString *)v8;

  uint64_t v10 = [(NSArray *)self->_items copyWithZone:a3];
  items = v5->_items;
  v5->_items = (NSArray *)v10;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  NSUInteger v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"title: '%@'; ", self->_title];
  [v3 appendFormat:@"items: '%@'; ", self->_items];
  [v3 appendFormat:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end