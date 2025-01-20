@interface SFTextColumnSection
+ (BOOL)supportsSecureCoding;
- (BOOL)hasTextNoWrap;
- (BOOL)hasTextWeight;
- (BOOL)isEqual:(id)a3;
- (BOOL)textNoWrap;
- (NSArray)textLines;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFTextColumnSection)initWithCoder:(id)a3;
- (SFTextColumnSection)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)textWeight;
- (void)encodeWithCoder:(id)a3;
- (void)setTextLines:(id)a3;
- (void)setTextNoWrap:(BOOL)a3;
- (void)setTextWeight:(unint64_t)a3;
@end

@implementation SFTextColumnSection

- (SFTextColumnSection)initWithProtobuf:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SFTextColumnSection;
  v5 = [(SFTextColumnSection *)&v19 init];
  if (v5)
  {
    v6 = [v4 textLines];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = objc_msgSend(v4, "textLines", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (*(void *)(*((void *)&v15 + 1) + 8 * i)) {
            objc_msgSend(v7, "addObject:");
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }

    [(SFTextColumnSection *)v5 setTextLines:v7];
    if ([v4 textNoWrap]) {
      -[SFTextColumnSection setTextNoWrap:](v5, "setTextNoWrap:", [v4 textNoWrap]);
    }
    if ([v4 textWeight]) {
      -[SFTextColumnSection setTextWeight:](v5, "setTextWeight:", [v4 textWeight]);
    }
    v13 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (unint64_t)textWeight
{
  return self->_textWeight;
}

- (BOOL)textNoWrap
{
  return self->_textNoWrap;
}

- (void)setTextLines:(id)a3
{
}

- (NSArray)textLines
{
  return self->_textLines;
}

- (unint64_t)hash
{
  v3 = [(SFTextColumnSection *)self textLines];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(SFTextColumnSection *)self textNoWrap];
  unint64_t v6 = v4 ^ [(SFTextColumnSection *)self textWeight] ^ v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (SFTextColumnSection *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFTextColumnSection *)v6 isMemberOfClass:objc_opt_class()])
    {
      id v7 = v6;
      v8 = [(SFTextColumnSection *)self textLines];
      uint64_t v9 = [(SFTextColumnSection *)v7 textLines];
      if ((v8 == 0) == (v9 != 0))
      {
        BOOL v11 = 0;
LABEL_16:

        goto LABEL_17;
      }
      uint64_t v10 = [(SFTextColumnSection *)self textLines];
      if (!v10
        || ([(SFTextColumnSection *)self textLines],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(SFTextColumnSection *)v7 textLines],
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        BOOL v12 = [(SFTextColumnSection *)self textNoWrap];
        if (v12 == [(SFTextColumnSection *)v7 textNoWrap])
        {
          unint64_t v13 = [(SFTextColumnSection *)self textWeight];
          BOOL v11 = v13 == [(SFTextColumnSection *)v7 textWeight];
          if (!v10)
          {
LABEL_15:

            goto LABEL_16;
          }
        }
        else
        {
          BOOL v11 = 0;
          if (!v10) {
            goto LABEL_15;
          }
        }
      }
      else
      {
        BOOL v11 = 0;
      }

      goto LABEL_15;
    }
    BOOL v11 = 0;
  }
LABEL_17:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFTextColumnSection *)self textLines];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setTextLines:v6];

  objc_msgSend(v4, "setTextNoWrap:", -[SFTextColumnSection textNoWrap](self, "textNoWrap"));
  objc_msgSend(v4, "setTextWeight:", -[SFTextColumnSection textWeight](self, "textWeight"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBTextColumnSection alloc] initWithFacade:self];
  v3 = [(_SFPBTextColumnSection *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBTextColumnSection alloc] initWithFacade:self];
  v3 = [(_SFPBTextColumnSection *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBTextColumnSection alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBTextColumnSection *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFTextColumnSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBTextColumnSection alloc] initWithData:v5];
  id v7 = [(SFTextColumnSection *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasTextWeight
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTextWeight:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_textWeight = a3;
}

- (BOOL)hasTextNoWrap
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTextNoWrap:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_textNoWrap = a3;
}

@end