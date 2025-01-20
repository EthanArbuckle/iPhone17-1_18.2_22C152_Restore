@interface PKPassDetailSection
+ (BOOL)supportsSecureCoding;
- (BOOL)isHidden;
- (NSArray)rows;
- (NSString)footer;
- (NSString)header;
- (NSString)identifier;
- (NSString)insertAfterSection;
- (PKPassDetailSection)initWithCoder:(id)a3;
- (PKPassDetailSection)initWithDictionary:(id)a3 allowedRows:(id)a4 bundle:(id)a5 privateBundle:(id)a6;
- (PKPassDetailSection)initWithRows:(id)a3;
- (id)asDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFooter:(id)a3;
- (void)setHeader:(id)a3;
- (void)setInsertAfterSection:(id)a3;
- (void)setRows:(id)a3;
@end

@implementation PKPassDetailSection

- (PKPassDetailSection)initWithRows:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassDetailSection;
  v6 = [(PKPassDetailSection *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rows, a3);
    uint64_t v8 = [(NSArray *)v7->_rows componentsJoinedByString:@"|"];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;
  }
  return v7;
}

- (PKPassDetailSection)initWithDictionary:(id)a3 allowedRows:(id)a4 bundle:(id)a5 privateBundle:(id)a6
{
  unint64_t v11 = (unint64_t)a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [(id)v11 PKStringForKey:@"identifier"];
  uint64_t v16 = [(id)v11 PKArrayContaining:objc_opt_class() forKey:@"rows"];
  if (v12)
  {
    v17 = (void *)MEMORY[0x1E4F28F60];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __75__PKPassDetailSection_initWithDictionary_allowedRows_bundle_privateBundle___block_invoke;
    v35[3] = &unk_1E56EAA40;
    v6 = (id *)v36;
    v36[0] = v12;
    v36[1] = v15;
    v18 = [v17 predicateWithBlock:v35];
    uint64_t v19 = [(id)v16 filteredArrayUsingPredicate:v18];

    uint64_t v16 = v19;
  }
  if (!(v11 | v16))
  {
    uint64_t v16 = 0;
    v32 = 0;
    if (!v12) {
      goto LABEL_11;
    }
LABEL_10:

    goto LABEL_11;
  }
  v34.receiver = self;
  v34.super_class = (Class)PKPassDetailSection;
  v20 = [(PKPassDetailSection *)&v34 init];
  if (v20)
  {
    v21 = [(id)v11 PKStringForKey:@"header"];
    uint64_t v22 = PKLocalizedPassStringForPassBundle(v21, v13, v14);
    header = v20->_header;
    v20->_header = (NSString *)v22;

    v24 = [(id)v11 PKStringForKey:@"footer"];
    uint64_t v25 = PKLocalizedPassStringForPassBundle(v24, v13, v14);
    footer = v20->_footer;
    v20->_footer = (NSString *)v25;

    uint64_t v27 = [(id)v11 PKStringForKey:@"insertAfterSection"];
    insertAfterSection = v20->_insertAfterSection;
    v20->_insertAfterSection = (NSString *)v27;

    objc_storeStrong((id *)&v20->_rows, (id)v16);
    v20->_hidden = [(id)v11 PKBoolForKey:@"hidden"];
    p_identifier = (void **)&v20->_identifier;
    objc_storeStrong((id *)&v20->_identifier, v15);
    if (!v20->_identifier)
    {
      uint64_t v30 = [(NSArray *)v20->_rows componentsJoinedByString:@"|"];
      v31 = *p_identifier;
      *p_identifier = (void *)v30;
    }
  }
  self = v20;
  v32 = self;
  if (v12) {
    goto LABEL_10;
  }
LABEL_11:

  return v32;
}

uint64_t __75__PKPassDetailSection_initWithDictionary_allowedRows_bundle_privateBundle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];
  if ((v4 & 1) == 0)
  {
    id v5 = PKLogFacilityTypeGetObject(5uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Dropping row in section %@: %@ is not expected/allowed.", (uint8_t *)&v8, 0x16u);
    }
  }
  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_header hash];
  NSUInteger v4 = [(NSString *)self->_footer hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_insertAfterSection hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSArray *)self->_rows hash] - v5 + 32 * v5;
  NSUInteger v7 = [(NSString *)self->_identifier hash];
  return self->_hidden - (v7 - v6 + 32 * v6) + 32 * (v7 - v6 + 32 * v6) + 0x38349EF51;
}

- (PKPassDetailSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPassDetailSection;
  NSUInteger v5 = [(PKPassDetailSection *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"header"];
    header = v5->_header;
    v5->_header = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"footer"];
    footer = v5->_footer;
    v5->_footer = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"insertAfterSection"];
    insertAfterSection = v5->_insertAfterSection;
    v5->_insertAfterSection = (NSString *)v10;

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"rows"];
    rows = v5->_rows;
    v5->_rows = (NSArray *)v15;

    v5->_hidden = [v4 decodeBoolForKey:@"hidden"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  header = self->_header;
  id v5 = a3;
  [v5 encodeObject:header forKey:@"header"];
  [v5 encodeObject:self->_footer forKey:@"footer"];
  [v5 encodeObject:self->_insertAfterSection forKey:@"insertAfterSection"];
  [v5 encodeObject:self->_rows forKey:@"rows"];
  [v5 encodeBool:self->_hidden forKey:@"hidden"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPassDetailSection allocWithZone:](PKPassDetailSection, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_header copyWithZone:a3];
  header = v5->_header;
  v5->_header = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_footer copyWithZone:a3];
  footer = v5->_footer;
  v5->_footer = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_insertAfterSection copyWithZone:a3];
  insertAfterSection = v5->_insertAfterSection;
  v5->_insertAfterSection = (NSString *)v10;

  uint64_t v12 = [(NSArray *)self->_rows copyWithZone:a3];
  rows = v5->_rows;
  v5->_rows = (NSArray *)v12;

  v5->_hidden = self->_hidden;
  uint64_t v14 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v14;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  NSUInteger v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"header: '%@'; ", self->_header];
  [v3 appendFormat:@"footer: '%@'; ", self->_footer];
  [v3 appendFormat:@"insertAfterSection: '%@'; ", self->_insertAfterSection];
  [v3 appendFormat:@"rows: '%@'; ", self->_rows];
  if (self->_hidden) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  [v3 appendFormat:@"hidden: '%@'; ", v4];
  [v3 appendFormat:@"identifier: '%@';", self->_identifier];
  [v3 appendFormat:@">"];
  id v5 = (void *)[v3 copy];

  return v5;
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_header forKeyedSubscript:@"header"];
  [v3 setObject:self->_footer forKeyedSubscript:@"footer"];
  [v3 setObject:self->_insertAfterSection forKeyedSubscript:@"insertAfterSection"];
  [v3 setObject:self->_rows forKeyedSubscript:@"rows"];
  id v4 = [NSNumber numberWithBool:self->_hidden];
  [v3 setObject:v4 forKeyedSubscript:@"hidden"];

  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  id v5 = (void *)[v3 copy];

  return v5;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSString)insertAfterSection
{
  return self->_insertAfterSection;
}

- (void)setInsertAfterSection:(id)a3
{
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_insertAfterSection, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end