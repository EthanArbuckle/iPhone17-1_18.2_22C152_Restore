@interface SFPatternModel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSData)pattern_parameters;
- (NSDictionary)dictionaryRepresentation;
- (NSString)pattern_bundle_id;
- (NSString)pattern_id;
- (NSString)pattern_template_directory;
- (SFPatternModel)initWithCoder:(id)a3;
- (SFPatternModel)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPattern_bundle_id:(id)a3;
- (void)setPattern_id:(id)a3;
- (void)setPattern_parameters:(id)a3;
- (void)setPattern_template_directory:(id)a3;
@end

@implementation SFPatternModel

- (SFPatternModel)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFPatternModel;
  v5 = [(SFPatternModel *)&v16 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "pattern_id");

    if (v6)
    {
      v7 = objc_msgSend(v4, "pattern_id");
      [(SFPatternModel *)v5 setPattern_id:v7];
    }
    v8 = objc_msgSend(v4, "pattern_parameters");

    if (v8)
    {
      v9 = objc_msgSend(v4, "pattern_parameters");
      [(SFPatternModel *)v5 setPattern_parameters:v9];
    }
    v10 = objc_msgSend(v4, "pattern_bundle_id");

    if (v10)
    {
      v11 = objc_msgSend(v4, "pattern_bundle_id");
      [(SFPatternModel *)v5 setPattern_bundle_id:v11];
    }
    v12 = objc_msgSend(v4, "pattern_template_directory");

    if (v12)
    {
      v13 = objc_msgSend(v4, "pattern_template_directory");
      [(SFPatternModel *)v5 setPattern_template_directory:v13];
    }
    v14 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern_template_directory, 0);
  objc_storeStrong((id *)&self->_pattern_bundle_id, 0);
  objc_storeStrong((id *)&self->_pattern_parameters, 0);
  objc_storeStrong((id *)&self->_pattern_id, 0);
}

- (void)setPattern_template_directory:(id)a3
{
}

- (NSString)pattern_template_directory
{
  return self->_pattern_template_directory;
}

- (void)setPattern_bundle_id:(id)a3
{
}

- (NSString)pattern_bundle_id
{
  return self->_pattern_bundle_id;
}

- (void)setPattern_parameters:(id)a3
{
}

- (NSData)pattern_parameters
{
  return self->_pattern_parameters;
}

- (void)setPattern_id:(id)a3
{
}

- (NSString)pattern_id
{
  return self->_pattern_id;
}

- (unint64_t)hash
{
  v3 = [(SFPatternModel *)self pattern_id];
  uint64_t v4 = [v3 hash];
  v5 = [(SFPatternModel *)self pattern_parameters];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFPatternModel *)self pattern_bundle_id];
  uint64_t v8 = [v7 hash];
  v9 = [(SFPatternModel *)self pattern_template_directory];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFPatternModel *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFPatternModel *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(SFPatternModel *)self pattern_id];
      uint64_t v8 = [(SFPatternModel *)v6 pattern_id];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_37:

        goto LABEL_38;
      }
      v9 = [(SFPatternModel *)self pattern_id];
      if (v9)
      {
        unint64_t v10 = [(SFPatternModel *)self pattern_id];
        v3 = [(SFPatternModel *)v6 pattern_id];
        if (![v10 isEqual:v3])
        {
          char v11 = 0;
          goto LABEL_35;
        }
        v41 = v10;
      }
      v12 = [(SFPatternModel *)self pattern_parameters];
      v13 = [(SFPatternModel *)v6 pattern_parameters];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_34;
      }
      uint64_t v15 = [(SFPatternModel *)self pattern_parameters];
      v40 = (void *)v15;
      if (v15)
      {
        objc_super v16 = (void *)v15;
        v35 = v14;
        v17 = v12;
        v18 = [(SFPatternModel *)self pattern_parameters];
        v37 = [(SFPatternModel *)v6 pattern_parameters];
        v38 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          char v11 = 0;
          v12 = v17;
          v14 = v35;
          goto LABEL_32;
        }
        v39 = v3;
        v12 = v17;
        v14 = v35;
      }
      else
      {
        v39 = v3;
      }
      v19 = [(SFPatternModel *)self pattern_bundle_id];
      v20 = [(SFPatternModel *)v6 pattern_bundle_id];
      if ((v19 == 0) == (v20 != 0))
      {

        char v11 = 0;
        v3 = v39;
        objc_super v16 = v40;
        if (!v40) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      v33 = v20;
      v34 = v19;
      [(SFPatternModel *)self pattern_bundle_id];
      v36 = objc_super v16 = v40;
      if (!v36
        || ([(SFPatternModel *)self pattern_bundle_id],
            v21 = objc_claimAutoreleasedReturnValue(),
            [(SFPatternModel *)v6 pattern_bundle_id],
            v31 = objc_claimAutoreleasedReturnValue(),
            v32 = v21,
            objc_msgSend(v21, "isEqual:")))
      {
        v22 = [(SFPatternModel *)self pattern_template_directory];
        v23 = [(SFPatternModel *)v6 pattern_template_directory];
        if ((v22 == 0) == (v23 != 0))
        {

          char v11 = 0;
          objc_super v16 = v40;
        }
        else
        {
          v29 = v22;
          v30 = v23;
          uint64_t v24 = [(SFPatternModel *)self pattern_template_directory];
          objc_super v16 = v40;
          if (v24)
          {
            v28 = (void *)v24;
            v27 = [(SFPatternModel *)self pattern_template_directory];
            v25 = [(SFPatternModel *)v6 pattern_template_directory];
            char v11 = objc_msgSend(v27, "isEqual:");
          }
          else
          {

            char v11 = 1;
          }
        }
        v3 = v39;
        if (!v36)
        {
LABEL_31:

          if (!v16)
          {
LABEL_33:

LABEL_34:
            unint64_t v10 = v41;
            if (!v9)
            {
LABEL_36:

              goto LABEL_37;
            }
LABEL_35:

            goto LABEL_36;
          }
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        char v11 = 0;
        v3 = v39;
      }

      goto LABEL_31;
    }
    char v11 = 0;
  }
LABEL_38:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFPatternModel *)self pattern_id];
  uint64_t v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setPattern_id:", v6);

  v7 = [(SFPatternModel *)self pattern_parameters];
  uint64_t v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setPattern_parameters:", v8);

  v9 = [(SFPatternModel *)self pattern_bundle_id];
  unint64_t v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setPattern_bundle_id:", v10);

  char v11 = [(SFPatternModel *)self pattern_template_directory];
  v12 = (void *)[v11 copy];
  objc_msgSend(v4, "setPattern_template_directory:", v12);

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBPatternModel alloc] initWithFacade:self];
  v3 = [(_SFPBPatternModel *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBPatternModel alloc] initWithFacade:self];
  v3 = [(_SFPBPatternModel *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBPatternModel alloc] initWithFacade:self];
  v5 = [(_SFPBPatternModel *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFPatternModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBPatternModel alloc] initWithData:v5];
  v7 = [(SFPatternModel *)self initWithProtobuf:v6];

  return v7;
}

@end