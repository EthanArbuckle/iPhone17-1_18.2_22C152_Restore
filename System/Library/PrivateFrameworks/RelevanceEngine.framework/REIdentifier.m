@interface REIdentifier
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (NSString)dataSource;
- (NSString)identifier;
- (NSString)section;
- (REIdentifier)initWithDataSource:(id)a3 section:(id)a4 identifier:(id)a5;
- (id)description;
- (unint64_t)hash;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
@end

@implementation REIdentifier

- (REIdentifier)initWithDataSource:(id)a3 section:(id)a4 identifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)REIdentifier;
  v11 = [(REIdentifier *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    dataSource = v11->_dataSource;
    v11->_dataSource = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    section = v11->_section;
    v11->_section = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v16;

    uint64_t v18 = [(NSString *)v11->_dataSource hash];
    uint64_t v19 = [(NSString *)v11->_section hash] ^ v18;
    v11->_hash = v19 ^ [(NSString *)v11->_identifier hash];
    uint64_t v20 = [(NSString *)v11->_dataSource length];
    NSUInteger v21 = [(NSString *)v11->_section length] + v20;
    v11->_length = v21 + [(NSString *)v11->_identifier length];
  }

  return v11;
}

- (BOOL)isEqualToString:(id)a3
{
  v4 = (REIdentifier *)a3;
  if (self == v4)
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier == v7)
      {
      }
      else
      {
        id v8 = v7;
        id v9 = identifier;
        int v10 = [(NSString *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_11;
        }
      }
      dataSource = self->_dataSource;
      v13 = v5->_dataSource;
      if (dataSource == v13)
      {
      }
      else
      {
        uint64_t v14 = v13;
        v15 = dataSource;
        int v16 = [(NSString *)v15 isEqual:v14];

        if (!v16)
        {
LABEL_11:
          unsigned __int8 v11 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      section = self->_section;
      uint64_t v18 = v5->_section;
      uint64_t v19 = section;
      uint64_t v20 = v19;
      if (v19 == v18) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = [(NSString *)v19 isEqual:v18];
      }

      goto LABEL_17;
    }
    v22.receiver = self;
    v22.super_class = (Class)REIdentifier;
    unsigned __int8 v11 = [(REIdentifier *)&v22 isEqualToString:v4];
  }
LABEL_18:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (REIdentifier *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(REIdentifier *)self isEqualToString:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (unint64_t)length
{
  return self->_length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSString *)self->_dataSource length];
  dataSource = self->_dataSource;
  if (v5 <= a3
    && (a3 -= [(NSString *)dataSource length],
        unint64_t v7 = [(NSString *)self->_section length],
        dataSource = self->_section,
        a3 >= v7))
  {
    unint64_t v8 = a3 - [(NSString *)dataSource length];
    dataSource = self->_identifier;
  }
  else
  {
    unint64_t v8 = a3;
  }
  return [(NSString *)dataSource characterAtIndex:v8];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@::%@::%@", self->_dataSource, self->_section, self->_identifier];
}

- (NSString)dataSource
{
  return self->_dataSource;
}

- (NSString)section
{
  return self->_section;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end