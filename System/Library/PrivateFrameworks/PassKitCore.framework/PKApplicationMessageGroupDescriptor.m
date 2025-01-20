@interface PKApplicationMessageGroupDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)createForIdentifier:(id)a3 withSingularSummary:(id)a4 pluralSummary:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)pluralSummary;
- (NSString)singularSummary;
- (PKApplicationMessageGroupDescriptor)init;
- (PKApplicationMessageGroupDescriptor)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplicationMessageGroupDescriptor

+ (id)createForIdentifier:(id)a3 withSingularSummary:(id)a4 pluralSummary:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [PKApplicationMessageGroupDescriptor alloc];
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  v14 = v13;
  v15 = 0;
  if (v10 && v11 && v12 && v13)
  {
    v24.receiver = v10;
    v24.super_class = (Class)PKApplicationMessageGroupDescriptor;
    v16 = objc_msgSendSuper2(&v24, sel_init);
    if (v16)
    {
      uint64_t v17 = [v11 copy];
      v18 = (void *)v16[1];
      v16[1] = v17;

      uint64_t v19 = [v12 copy];
      v20 = (void *)v16[2];
      v16[2] = v19;

      uint64_t v21 = [v14 copy];
      v22 = (void *)v16[3];
      v16[3] = v21;
    }
    v10 = v16;
    v15 = v10;
  }

  return v15;
}

- (PKApplicationMessageGroupDescriptor)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageGroupDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKApplicationMessageGroupDescriptor;
  v5 = [(PKApplicationMessageGroupDescriptor *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    if (!v5->_identifier)
    {
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKApplicationMessageGroupDescriptor" code:0 userInfo:0];
      [v4 failWithError:v14];

      id v13 = 0;
      goto LABEL_6;
    }
    uint64_t v9 = [v4 decodeObjectOfClass:v6 forKey:@"singular"];
    singularSummary = v5->_singularSummary;
    v5->_singularSummary = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:v6 forKey:@"plural"];
    pluralSummary = v5->_pluralSummary;
    v5->_pluralSummary = (NSString *)v11;
  }
  id v13 = v5;
LABEL_6:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_singularSummary forKey:@"singular"];
  [v5 encodeObject:self->_pluralSummary forKey:@"plural"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    id v7 = v4;
    id v8 = v7;
    if (self)
    {
      uint64_t v9 = (void *)*((void *)v7 + 1);
      v10 = self->_identifier;
      uint64_t v11 = v9;
      id v12 = v11;
      if (v10 == v11)
      {
        char v6 = 1;
      }
      else
      {
        char v6 = 0;
        if (v10 && v11) {
          char v6 = [(NSString *)v10 isEqualToString:v11];
        }
      }
    }
    else
    {
      char v6 = 0;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)singularSummary
{
  return self->_singularSummary;
}

- (NSString)pluralSummary
{
  return self->_pluralSummary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluralSummary, 0);
  objc_storeStrong((id *)&self->_singularSummary, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end