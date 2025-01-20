@interface RFTextProperty
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIs_safe_for_logging;
- (BOOL)isEqual:(id)a3;
- (BOOL)is_safe_for_logging;
- (NSArray)text_elements;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFTextProperty)initWithCoder:(id)a3;
- (RFTextProperty)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIs_safe_for_logging:(BOOL)a3;
- (void)setText_elements:(id)a3;
@end

@implementation RFTextProperty

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (BOOL)is_safe_for_logging
{
  return self->_is_safe_for_logging;
}

- (void)setText_elements:(id)a3
{
}

- (NSArray)text_elements
{
  return self->_text_elements;
}

- (unint64_t)hash
{
  v3 = [(RFTextProperty *)self text_elements];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(RFTextProperty *)self is_safe_for_logging];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (RFTextProperty *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(RFTextProperty *)v6 isMemberOfClass:objc_opt_class()])
    {
      v7 = v6;
      v8 = [(RFTextProperty *)self text_elements];
      v9 = [(RFTextProperty *)v7 text_elements];
      if ((v8 == 0) == (v9 != 0))
      {
        LOBYTE(v11) = 0;
LABEL_13:

        goto LABEL_14;
      }
      v10 = [(RFTextProperty *)self text_elements];
      if (!v10
        || ([(RFTextProperty *)self text_elements],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(RFTextProperty *)v7 text_elements],
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        BOOL v12 = [(RFTextProperty *)self is_safe_for_logging];
        BOOL v11 = v12 ^ [(RFTextProperty *)v7 is_safe_for_logging] ^ 1;
        if (!v10)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        LOBYTE(v11) = 0;
      }

      goto LABEL_12;
    }
    LOBYTE(v11) = 0;
  }
LABEL_14:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = [(RFTextProperty *)self text_elements];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setText_elements:", v6);

  objc_msgSend(v4, "setIs_safe_for_logging:", -[RFTextProperty is_safe_for_logging](self, "is_safe_for_logging"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFTextProperty alloc] initWithFacade:self];
  v3 = [(_SFPBRFTextProperty *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFTextProperty alloc] initWithFacade:self];
  v3 = [(_SFPBRFTextProperty *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBRFTextProperty alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBRFTextProperty *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFTextProperty)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBRFTextProperty alloc] initWithData:v5];
  v7 = [(RFTextProperty *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasIs_safe_for_logging
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIs_safe_for_logging:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_is_safe_for_logging = a3;
}

- (RFTextProperty)initWithProtobuf:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RFTextProperty;
  unint64_t v5 = [(RFTextProperty *)&v20 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "text_elements");
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = objc_msgSend(v4, "text_elements", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[RFTextElement alloc] initWithProtobuf:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    [(RFTextProperty *)v5 setText_elements:v7];
    if (objc_msgSend(v4, "is_safe_for_logging")) {
      -[RFTextProperty setIs_safe_for_logging:](v5, "setIs_safe_for_logging:", objc_msgSend(v4, "is_safe_for_logging"));
    }
    v14 = v5;
  }
  return v5;
}

@end