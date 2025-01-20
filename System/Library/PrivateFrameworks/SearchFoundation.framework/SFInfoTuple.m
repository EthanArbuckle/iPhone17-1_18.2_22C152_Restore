@interface SFInfoTuple
+ (BOOL)supportsSecureCoding;
- (BOOL)hasInitiallyVisibleValues;
- (BOOL)isEqual:(id)a3;
- (NSArray)values;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)key;
- (NSString)showMoreString;
- (SFInfoTuple)initWithCoder:(id)a3;
- (SFInfoTuple)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)initiallyVisibleValues;
- (void)encodeWithCoder:(id)a3;
- (void)setInitiallyVisibleValues:(unint64_t)a3;
- (void)setKey:(id)a3;
- (void)setShowMoreString:(id)a3;
- (void)setValues:(id)a3;
@end

@implementation SFInfoTuple

- (SFInfoTuple)initWithProtobuf:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SFInfoTuple;
  v5 = [(SFInfoTuple *)&v24 init];
  if (v5)
  {
    v6 = [v4 key];

    if (v6)
    {
      v7 = [v4 key];
      [(SFInfoTuple *)v5 setKey:v7];
    }
    v8 = [v4 values];
    if (v8) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v9 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v10 = objc_msgSend(v4, "values", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [[SFCommandButtonItem alloc] initWithProtobuf:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          if (v15) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v12);
    }

    [(SFInfoTuple *)v5 setValues:v9];
    if ([v4 initiallyVisibleValues]) {
      -[SFInfoTuple setInitiallyVisibleValues:](v5, "setInitiallyVisibleValues:", [v4 initiallyVisibleValues]);
    }
    v16 = [v4 showMoreString];

    if (v16)
    {
      v17 = [v4 showMoreString];
      [(SFInfoTuple *)v5 setShowMoreString:v17];
    }
    v18 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showMoreString, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setShowMoreString:(id)a3
{
}

- (NSString)showMoreString
{
  return self->_showMoreString;
}

- (unint64_t)initiallyVisibleValues
{
  return self->_initiallyVisibleValues;
}

- (void)setValues:(id)a3
{
}

- (NSArray)values
{
  return self->_values;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (unint64_t)hash
{
  v3 = [(SFInfoTuple *)self key];
  uint64_t v4 = [v3 hash];
  v5 = [(SFInfoTuple *)self values];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(SFInfoTuple *)self initiallyVisibleValues];
  v8 = [(SFInfoTuple *)self showMoreString];
  unint64_t v9 = v6 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFInfoTuple *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFInfoTuple *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      unint64_t v7 = [(SFInfoTuple *)self key];
      v8 = [(SFInfoTuple *)v6 key];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      unint64_t v9 = [(SFInfoTuple *)self key];
      if (v9)
      {
        v10 = [(SFInfoTuple *)self key];
        v3 = [(SFInfoTuple *)v6 key];
        if (![v10 isEqual:v3])
        {
          char v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      uint64_t v12 = [(SFInfoTuple *)self values];
      uint64_t v13 = [(SFInfoTuple *)v6 values];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_27;
      }
      v15 = [(SFInfoTuple *)self values];
      if (v15)
      {
        uint64_t v26 = v3;
        v16 = [(SFInfoTuple *)self values];
        v29 = [(SFInfoTuple *)v6 values];
        v30 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          char v11 = 0;
          v3 = v26;
          goto LABEL_25;
        }
        v28 = v15;
        v3 = v26;
      }
      else
      {
        v28 = 0;
      }
      unint64_t v17 = [(SFInfoTuple *)self initiallyVisibleValues];
      if (v17 == [(SFInfoTuple *)v6 initiallyVisibleValues])
      {
        v18 = [(SFInfoTuple *)self showMoreString];
        v19 = [(SFInfoTuple *)v6 showMoreString];
        if ((v18 == 0) != (v19 != 0))
        {
          v25 = v19;
          v27 = v18;
          uint64_t v20 = [(SFInfoTuple *)self showMoreString];
          if (v20)
          {
            objc_super v24 = (void *)v20;
            long long v23 = [(SFInfoTuple *)self showMoreString];
            long long v21 = [(SFInfoTuple *)v6 showMoreString];
            char v11 = [v23 isEqual:v21];
          }
          else
          {

            char v11 = 1;
          }
LABEL_24:
          v15 = v28;
          if (!v28)
          {
LABEL_26:

LABEL_27:
            v10 = v31;
            if (!v9)
            {
LABEL_29:

              goto LABEL_30;
            }
LABEL_28:

            goto LABEL_29;
          }
LABEL_25:

          goto LABEL_26;
        }
      }
      char v11 = 0;
      goto LABEL_24;
    }
    char v11 = 0;
  }
LABEL_31:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFInfoTuple *)self key];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setKey:v6];

  unint64_t v7 = [(SFInfoTuple *)self values];
  v8 = (void *)[v7 copy];
  [v4 setValues:v8];

  objc_msgSend(v4, "setInitiallyVisibleValues:", -[SFInfoTuple initiallyVisibleValues](self, "initiallyVisibleValues"));
  unint64_t v9 = [(SFInfoTuple *)self showMoreString];
  v10 = (void *)[v9 copy];
  [v4 setShowMoreString:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBInfoTuple alloc] initWithFacade:self];
  v3 = [(_SFPBInfoTuple *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBInfoTuple alloc] initWithFacade:self];
  v3 = [(_SFPBInfoTuple *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBInfoTuple alloc] initWithFacade:self];
  v5 = [(_SFPBInfoTuple *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFInfoTuple)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBInfoTuple alloc] initWithData:v5];
  unint64_t v7 = [(SFInfoTuple *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasInitiallyVisibleValues
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInitiallyVisibleValues:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_initiallyVisibleValues = a3;
}

@end