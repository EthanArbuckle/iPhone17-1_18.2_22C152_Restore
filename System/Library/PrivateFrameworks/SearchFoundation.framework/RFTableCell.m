@interface RFTableCell
+ (BOOL)supportsSecureCoding;
- (BOOL)applySmallCaps;
- (BOOL)hasApplySmallCaps;
- (BOOL)hasHorizontal_alignment;
- (BOOL)hasText;
- (BOOL)hasVisual;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)column_span;
- (RFTableCell)initWithCoder:(id)a3;
- (RFTableCell)initWithProtobuf:(id)a3;
- (RFTextProperty)text;
- (RFVisualProperty)visual;
- (id)copyWithZone:(_NSZone *)a3;
- (int)horizontal_alignment;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplySmallCaps:(BOOL)a3;
- (void)setColumn_span:(id)a3;
- (void)setHorizontal_alignment:(int)a3;
- (void)setText:(id)a3;
- (void)setVisual:(id)a3;
@end

@implementation RFTableCell

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_column_span, 0);
  objc_storeStrong((id *)&self->_visual, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (BOOL)applySmallCaps
{
  return self->_applySmallCaps;
}

- (int)horizontal_alignment
{
  return self->_horizontal_alignment;
}

- (void)setColumn_span:(id)a3
{
}

- (NSNumber)column_span
{
  return self->_column_span;
}

- (RFVisualProperty)visual
{
  return self->_visual;
}

- (RFTextProperty)text
{
  return self->_text;
}

- (unint64_t)hash
{
  v3 = [(RFTableCell *)self text];
  uint64_t v4 = [v3 hash];
  v5 = [(RFTableCell *)self visual];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RFTableCell *)self column_span];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = v6 ^ v8 ^ [(RFTableCell *)self horizontal_alignment];
  unint64_t v10 = v9 ^ [(RFTableCell *)self applySmallCaps];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RFTableCell *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(RFTableCell *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(RFTableCell *)self text];
      uint64_t v8 = [(RFTableCell *)v6 text];
      if ((v7 == 0) == (v8 != 0))
      {
        LOBYTE(v11) = 0;
LABEL_35:

        goto LABEL_36;
      }
      uint64_t v9 = [(RFTableCell *)self text];
      if (v9)
      {
        unint64_t v10 = [(RFTableCell *)self text];
        v3 = [(RFTableCell *)v6 text];
        if (![v10 isEqual:v3])
        {
          LOBYTE(v11) = 0;
          goto LABEL_33;
        }
        v35 = v10;
      }
      v12 = [(RFTableCell *)self visual];
      v13 = [(RFTableCell *)v6 visual];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        LOBYTE(v11) = 0;
        goto LABEL_32;
      }
      v15 = [(RFTableCell *)self visual];
      if (v15)
      {
        v28 = v14;
        v16 = v12;
        v17 = [(RFTableCell *)self visual];
        v32 = [(RFTableCell *)v6 visual];
        v33 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          LOBYTE(v11) = 0;
          v12 = v16;
          v14 = v28;
          goto LABEL_30;
        }
        v30 = v3;
        v34 = v15;
        v12 = v16;
        v14 = v28;
      }
      else
      {
        v30 = v3;
        v34 = 0;
      }
      v18 = [(RFTableCell *)self column_span];
      v19 = [(RFTableCell *)v6 column_span];
      if ((v18 == 0) == (v19 != 0))
      {

        LOBYTE(v11) = 0;
        v15 = v34;
        v3 = v30;
        if (!v34) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
      v26 = v19;
      v27 = v18;
      [(RFTableCell *)self column_span];
      v29 = v15 = v34;
      if (!v29
        || ([(RFTableCell *)self column_span],
            v20 = objc_claimAutoreleasedReturnValue(),
            [(RFTableCell *)v6 column_span],
            v24 = v20,
            uint64_t v25 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v20, "isEqual:")))
      {
        v3 = v30;
        int v31 = [(RFTableCell *)self horizontal_alignment];
        if (v31 == [(RFTableCell *)v6 horizontal_alignment])
        {
          BOOL v22 = [(RFTableCell *)self applySmallCaps];
          BOOL v11 = v22 ^ [(RFTableCell *)v6 applySmallCaps] ^ 1;
        }
        else
        {
          LOBYTE(v11) = 0;
        }
        v21 = (void *)v25;
        if (!v29)
        {
LABEL_29:

          if (!v34)
          {
LABEL_31:

LABEL_32:
            unint64_t v10 = v35;
            if (!v9)
            {
LABEL_34:

              goto LABEL_35;
            }
LABEL_33:

            goto LABEL_34;
          }
LABEL_30:

          goto LABEL_31;
        }
      }
      else
      {
        LOBYTE(v11) = 0;
        v3 = v30;
        v21 = (void *)v25;
      }

      goto LABEL_29;
    }
    LOBYTE(v11) = 0;
  }
LABEL_36:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ([(RFTableCell *)self hasText])
  {
    v5 = [(RFTableCell *)self text];
    uint64_t v6 = (void *)[v5 copy];
    [v4 setText:v6];
  }
  if ([(RFTableCell *)self hasVisual])
  {
    v7 = [(RFTableCell *)self visual];
    uint64_t v8 = (void *)[v7 copy];
    [v4 setVisual:v8];
  }
  uint64_t v9 = [(RFTableCell *)self column_span];
  unint64_t v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setColumn_span:", v10);

  objc_msgSend(v4, "setHorizontal_alignment:", -[RFTableCell horizontal_alignment](self, "horizontal_alignment"));
  objc_msgSend(v4, "setApplySmallCaps:", -[RFTableCell applySmallCaps](self, "applySmallCaps"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFTableCell alloc] initWithFacade:self];
  v3 = [(_SFPBRFTableCell *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFTableCell alloc] initWithFacade:self];
  v3 = [(_SFPBRFTableCell *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFTableCell alloc] initWithFacade:self];
  v5 = [(_SFPBRFTableCell *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFTableCell)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFTableCell alloc] initWithData:v5];
  v7 = [(RFTableCell *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasApplySmallCaps
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setApplySmallCaps:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_applySmallCaps = a3;
}

- (BOOL)hasHorizontal_alignment
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHorizontal_alignment:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_horizontal_alignment = a3;
}

- (BOOL)hasVisual
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setVisual:(id)a3
{
  *(unsigned char *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_visual, a3);
  id v6 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  text = self->_text;
  self->_text = 0;
}

- (BOOL)hasText
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setText:(id)a3
{
  *(unsigned char *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_text, a3);
  id v6 = a3;
  *(unsigned char *)&self->_has &= ~2u;
  visual = self->_visual;
  self->_visual = 0;
}

- (RFTableCell)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RFTableCell;
  v5 = [(RFTableCell *)&v17 init];
  if (v5)
  {
    id v6 = [v4 text];

    if (v6)
    {
      v7 = [RFTextProperty alloc];
      uint64_t v8 = [v4 text];
      uint64_t v9 = [(RFTextProperty *)v7 initWithProtobuf:v8];
      [(RFTableCell *)v5 setText:v9];
    }
    unint64_t v10 = [v4 visual];

    if (v10)
    {
      BOOL v11 = [RFVisualProperty alloc];
      v12 = [v4 visual];
      v13 = [(RFVisualProperty *)v11 initWithProtobuf:v12];
      [(RFTableCell *)v5 setVisual:v13];
    }
    if (objc_msgSend(v4, "column_span"))
    {
      v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "column_span"));
      [(RFTableCell *)v5 setColumn_span:v14];
    }
    if (objc_msgSend(v4, "horizontal_alignment")) {
      -[RFTableCell setHorizontal_alignment:](v5, "setHorizontal_alignment:", objc_msgSend(v4, "horizontal_alignment"));
    }
    if ([v4 applySmallCaps]) {
      -[RFTableCell setApplySmallCaps:](v5, "setApplySmallCaps:", [v4 applySmallCaps]);
    }
    v15 = v5;
  }

  return v5;
}

@end