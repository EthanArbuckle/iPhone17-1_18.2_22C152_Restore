@interface RFTextElement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)formatted_text;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)line_limit;
- (RFShowMoreOnTap)show_more_on_tap;
- (RFTextElement)initWithCoder:(id)a3;
- (RFTextElement)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFormatted_text:(id)a3;
- (void)setLine_limit:(id)a3;
- (void)setShow_more_on_tap:(id)a3;
@end

@implementation RFTextElement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_show_more_on_tap, 0);
  objc_storeStrong((id *)&self->_line_limit, 0);
  objc_storeStrong((id *)&self->_formatted_text, 0);
}

- (void)setShow_more_on_tap:(id)a3
{
}

- (RFShowMoreOnTap)show_more_on_tap
{
  return self->_show_more_on_tap;
}

- (void)setLine_limit:(id)a3
{
}

- (NSNumber)line_limit
{
  return self->_line_limit;
}

- (void)setFormatted_text:(id)a3
{
}

- (NSArray)formatted_text
{
  return self->_formatted_text;
}

- (unint64_t)hash
{
  v3 = [(RFTextElement *)self formatted_text];
  uint64_t v4 = [v3 hash];
  v5 = [(RFTextElement *)self line_limit];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(RFTextElement *)self show_more_on_tap];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (RFTextElement *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(RFTextElement *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(RFTextElement *)self formatted_text];
      unint64_t v8 = [(RFTextElement *)v6 formatted_text];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v9 = [(RFTextElement *)self formatted_text];
      if (v9)
      {
        v3 = [(RFTextElement *)self formatted_text];
        v10 = [(RFTextElement *)v6 formatted_text];
        if (![v3 isEqual:v10])
        {
          char v11 = 0;
          goto LABEL_28;
        }
        v31 = v10;
      }
      v12 = [(RFTextElement *)self line_limit];
      v13 = [(RFTextElement *)v6 line_limit];
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        char v11 = 0;
        goto LABEL_27;
      }
      v15 = [(RFTextElement *)self line_limit];
      if (v15)
      {
        v25 = v12;
        v16 = [(RFTextElement *)self line_limit];
        v28 = [(RFTextElement *)v6 line_limit];
        v29 = v16;
        if (!objc_msgSend(v16, "isEqual:"))
        {
          char v11 = 0;
          v12 = v25;
          goto LABEL_25;
        }
        v30 = v15;
        v27 = v3;
        v12 = v25;
      }
      else
      {
        v30 = 0;
        v27 = v3;
      }
      v17 = [(RFTextElement *)self show_more_on_tap];
      v18 = [(RFTextElement *)v6 show_more_on_tap];
      if ((v17 == 0) == (v18 != 0))
      {

        char v11 = 0;
        v3 = v27;
        v15 = v30;
        if (!v30) {
          goto LABEL_26;
        }
      }
      else
      {
        v24 = v17;
        v26 = v18;
        uint64_t v19 = [(RFTextElement *)self show_more_on_tap];
        v15 = v30;
        if (v19)
        {
          v23 = (void *)v19;
          v22 = [(RFTextElement *)self show_more_on_tap];
          v20 = [(RFTextElement *)v6 show_more_on_tap];
          char v11 = objc_msgSend(v22, "isEqual:");
        }
        else
        {

          char v11 = 1;
        }
        v3 = v27;
        if (!v30) {
          goto LABEL_26;
        }
      }
LABEL_25:

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
    char v11 = 0;
  }
LABEL_31:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(RFTextElement *)self formatted_text];
  uint64_t v6 = (void *)[v5 copy];
  objc_msgSend(v4, "setFormatted_text:", v6);

  v7 = [(RFTextElement *)self line_limit];
  unint64_t v8 = (void *)[v7 copy];
  objc_msgSend(v4, "setLine_limit:", v8);

  v9 = [(RFTextElement *)self show_more_on_tap];
  v10 = (void *)[v9 copy];
  objc_msgSend(v4, "setShow_more_on_tap:", v10);

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRFTextElement alloc] initWithFacade:self];
  v3 = [(_SFPBRFTextElement *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRFTextElement alloc] initWithFacade:self];
  v3 = [(_SFPBRFTextElement *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBRFTextElement alloc] initWithFacade:self];
  v5 = [(_SFPBRFTextElement *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (RFTextElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBRFTextElement alloc] initWithData:v5];
  v7 = [(RFTextElement *)self initWithProtobuf:v6];

  return v7;
}

- (RFTextElement)initWithProtobuf:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RFTextElement;
  v5 = [(RFTextElement *)&v25 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "formatted_texts");
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    unint64_t v8 = objc_msgSend(v4, "formatted_texts", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [[RFFormattedText alloc] initWithProtobuf:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v10);
    }

    [(RFTextElement *)v5 setFormatted_text:v7];
    if (objc_msgSend(v4, "line_limit"))
    {
      v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "line_limit"));
      [(RFTextElement *)v5 setLine_limit:v14];
    }
    v15 = objc_msgSend(v4, "show_more_on_tap");

    if (v15)
    {
      v16 = [RFShowMoreOnTap alloc];
      v17 = objc_msgSend(v4, "show_more_on_tap");
      v18 = [(RFShowMoreOnTap *)v16 initWithProtobuf:v17];
      [(RFTextElement *)v5 setShow_more_on_tap:v18];
    }
    uint64_t v19 = v5;
  }
  return v5;
}

@end