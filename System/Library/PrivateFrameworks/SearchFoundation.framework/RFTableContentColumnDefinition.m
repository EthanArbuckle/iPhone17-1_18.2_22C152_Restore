@interface RFTableContentColumnDefinition
+ (BOOL)supportsSecureCoding;
- (BOOL)disable_truncation;
- (BOOL)hasDisable_truncation;
- (BOOL)hasHorizontal_alignment;
- (BOOL)hasShould_drop_in_flow_layout;
- (BOOL)isEqual:(id)a3;
- (BOOL)should_drop_in_flow_layout;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)drop_order;
- (NSNumber)equal_size_column_group;
- (NSNumber)size_percent;
- (RFTableContentColumnDefinition)initWithCoder:(id)a3;
- (RFTableContentColumnDefinition)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)horizontal_alignment;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDisable_truncation:(BOOL)a3;
- (void)setDrop_order:(id)a3;
- (void)setEqual_size_column_group:(id)a3;
- (void)setHorizontal_alignment:(int)a3;
- (void)setShould_drop_in_flow_layout:(BOOL)a3;
- (void)setSize_percent:(id)a3;
@end

@implementation RFTableContentColumnDefinition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_equal_size_column_group, 0);
  objc_storeStrong((id *)&self->_drop_order, 0);
  objc_storeStrong((id *)&self->_size_percent, 0);
}

- (BOOL)should_drop_in_flow_layout
{
  return self->_should_drop_in_flow_layout;
}

- (BOOL)disable_truncation
{
  return self->_disable_truncation;
}

- (void)setEqual_size_column_group:(id)a3
{
}

- (NSNumber)equal_size_column_group
{
  return self->_equal_size_column_group;
}

- (void)setDrop_order:(id)a3
{
}

- (NSNumber)drop_order
{
  return self->_drop_order;
}

- (int)horizontal_alignment
{
  return self->_horizontal_alignment;
}

- (void)setSize_percent:(id)a3
{
}

- (NSNumber)size_percent
{
  return self->_size_percent;
}

- (unint64_t)hash
{
  v3 = [(RFTableContentColumnDefinition *)self size_percent];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = v4 ^ [(RFTableContentColumnDefinition *)self horizontal_alignment];
  v6 = [(RFTableContentColumnDefinition *)self drop_order];
  uint64_t v7 = [v6 hash];
  v8 = [(RFTableContentColumnDefinition *)self equal_size_column_group];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  uint64_t v10 = [(RFTableContentColumnDefinition *)self disable_truncation];
  unint64_t v11 = v9 ^ v10 ^ [(RFTableContentColumnDefinition *)self should_drop_in_flow_layout];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (RFTableContentColumnDefinition *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(RFTableContentColumnDefinition *)v6 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v7 = v6;
      v8 = [(RFTableContentColumnDefinition *)self size_percent];
      uint64_t v9 = [(RFTableContentColumnDefinition *)v7 size_percent];
      if ((v8 == 0) == (v9 != 0))
      {
        LOBYTE(v11) = 0;
LABEL_19:

        goto LABEL_20;
      }
      uint64_t v10 = [(RFTableContentColumnDefinition *)self size_percent];
      if (v10)
      {
        v3 = [(RFTableContentColumnDefinition *)self size_percent];
        uint64_t v4 = [(RFTableContentColumnDefinition *)v7 size_percent];
        if (![v3 isEqual:v4])
        {
          LOBYTE(v11) = 0;
          goto LABEL_17;
        }
      }
      int v12 = [(RFTableContentColumnDefinition *)self horizontal_alignment];
      if (v12 == [(RFTableContentColumnDefinition *)v7 horizontal_alignment])
      {
        v13 = [(RFTableContentColumnDefinition *)self drop_order];
        v14 = [(RFTableContentColumnDefinition *)v7 drop_order];
        if ((v13 == 0) != (v14 != 0))
        {
          v34 = v14;
          v35 = v13;
          uint64_t v33 = [(RFTableContentColumnDefinition *)self drop_order];
          if (v33)
          {
            v15 = [(RFTableContentColumnDefinition *)self drop_order];
            v31 = [(RFTableContentColumnDefinition *)v7 drop_order];
            v32 = v15;
            if (!objc_msgSend(v15, "isEqual:"))
            {
              LOBYTE(v11) = 0;
              v16 = (void *)v33;
              goto LABEL_26;
            }
          }
          v18 = [(RFTableContentColumnDefinition *)self equal_size_column_group];
          v19 = [(RFTableContentColumnDefinition *)v7 equal_size_column_group];
          if ((v18 == 0) == (v19 != 0))
          {

            LOBYTE(v11) = 0;
            v13 = v35;
            v16 = (void *)v33;
            if (!v33) {
              goto LABEL_27;
            }
            goto LABEL_26;
          }
          v29 = v19;
          v30 = v18;
          v20 = [(RFTableContentColumnDefinition *)self equal_size_column_group];
          if (v20)
          {
            v21 = [(RFTableContentColumnDefinition *)self equal_size_column_group];
            uint64_t v28 = [(RFTableContentColumnDefinition *)v7 equal_size_column_group];
            v27 = v21;
            if (!objc_msgSend(v21, "isEqual:"))
            {
              LOBYTE(v11) = 0;
              v16 = (void *)v33;
              v23 = (void *)v28;
              goto LABEL_35;
            }
            v25 = v20;
          }
          else
          {
            v25 = 0;
          }
          v16 = (void *)v33;
          BOOL v22 = [(RFTableContentColumnDefinition *)self disable_truncation];
          if (v22 == [(RFTableContentColumnDefinition *)v7 disable_truncation])
          {
            BOOL v24 = [(RFTableContentColumnDefinition *)self should_drop_in_flow_layout];
            BOOL v11 = v24 ^ [(RFTableContentColumnDefinition *)v7 should_drop_in_flow_layout] ^ 1;
          }
          else
          {
            LOBYTE(v11) = 0;
          }
          v20 = v26;
          v23 = (void *)v28;
          if (!v26)
          {
LABEL_36:

            v13 = v35;
            if (!v16)
            {
LABEL_27:

              if (!v10) {
                goto LABEL_18;
              }
              goto LABEL_17;
            }
LABEL_26:

            goto LABEL_27;
          }
LABEL_35:

          goto LABEL_36;
        }
      }
      LOBYTE(v11) = 0;
      if (!v10)
      {
LABEL_18:

        goto LABEL_19;
      }
LABEL_17:

      goto LABEL_18;
    }
    LOBYTE(v11) = 0;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(RFTableContentColumnDefinition *)self size_percent];
  v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setSize_percent:", v6);

  objc_msgSend(v4, "setHorizontal_alignment:", -[RFTableContentColumnDefinition horizontal_alignment](self, "horizontal_alignment"));
  uint64_t v7 = [(RFTableContentColumnDefinition *)self drop_order];
  v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setDrop_order:", v8);

  uint64_t v9 = [(RFTableContentColumnDefinition *)self equal_size_column_group];
  uint64_t v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setEqual_size_column_group:", v10);

  objc_msgSend(v4, "setDisable_truncation:", -[RFTableContentColumnDefinition disable_truncation](self, "disable_truncation"));
  objc_msgSend(v4, "setShould_drop_in_flow_layout:", -[RFTableContentColumnDefinition should_drop_in_flow_layout](self, "should_drop_in_flow_layout"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFTableContentColumnDefinition alloc] initWithFacade:self];
  v3 = [(_SFPBRFTableContentColumnDefinition *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFTableContentColumnDefinition alloc] initWithFacade:self];
  v3 = [(_SFPBRFTableContentColumnDefinition *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBRFTableContentColumnDefinition alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBRFTableContentColumnDefinition *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFTableContentColumnDefinition)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBRFTableContentColumnDefinition alloc] initWithData:v5];
  uint64_t v7 = [(RFTableContentColumnDefinition *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasShould_drop_in_flow_layout
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setShould_drop_in_flow_layout:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_should_drop_in_flow_layout = a3;
}

- (BOOL)hasDisable_truncation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDisable_truncation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_disable_truncation = a3;
}

- (BOOL)hasHorizontal_alignment
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHorizontal_alignment:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_horizontal_alignment = a3;
}

- (RFTableContentColumnDefinition)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RFTableContentColumnDefinition;
  uint64_t v5 = [(RFTableContentColumnDefinition *)&v13 init];
  if (v5)
  {
    objc_msgSend(v4, "size_percent");
    if (v6 != 0.0)
    {
      uint64_t v7 = NSNumber;
      objc_msgSend(v4, "size_percent");
      v8 = objc_msgSend(v7, "numberWithFloat:");
      [(RFTableContentColumnDefinition *)v5 setSize_percent:v8];
    }
    if (objc_msgSend(v4, "horizontal_alignment")) {
      -[RFTableContentColumnDefinition setHorizontal_alignment:](v5, "setHorizontal_alignment:", objc_msgSend(v4, "horizontal_alignment"));
    }
    if (objc_msgSend(v4, "drop_order"))
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "drop_order"));
      [(RFTableContentColumnDefinition *)v5 setDrop_order:v9];
    }
    if (objc_msgSend(v4, "equal_size_column_group"))
    {
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "equal_size_column_group"));
      [(RFTableContentColumnDefinition *)v5 setEqual_size_column_group:v10];
    }
    if (objc_msgSend(v4, "disable_truncation")) {
      -[RFTableContentColumnDefinition setDisable_truncation:](v5, "setDisable_truncation:", objc_msgSend(v4, "disable_truncation"));
    }
    if (objc_msgSend(v4, "should_drop_in_flow_layout")) {
      -[RFTableContentColumnDefinition setShould_drop_in_flow_layout:](v5, "setShould_drop_in_flow_layout:", objc_msgSend(v4, "should_drop_in_flow_layout"));
    }
    BOOL v11 = v5;
  }

  return v5;
}

@end