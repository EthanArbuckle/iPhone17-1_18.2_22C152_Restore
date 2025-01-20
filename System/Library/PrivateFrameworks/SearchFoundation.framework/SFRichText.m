@interface SFRichText
+ (BOOL)supportsSecureCoding;
- (BOOL)hasStarRating;
- (BOOL)isEqual:(id)a3;
- (NSArray)formattedTextPieces;
- (NSArray)icons;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)contentAdvisory;
- (SFRichText)initWithCoder:(id)a3;
- (SFRichText)initWithProtobuf:(id)a3;
- (double)starRating;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)loadRichTextWithCompletionHandler:(id)a3;
- (void)setContentAdvisory:(id)a3;
- (void)setFormattedTextPieces:(id)a3;
- (void)setIcons:(id)a3;
- (void)setStarRating:(double)a3;
@end

@implementation SFRichText

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedTextPieces, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_contentAdvisory, 0);
}

- (void)setFormattedTextPieces:(id)a3
{
}

- (NSArray)formattedTextPieces
{
  return self->_formattedTextPieces;
}

- (void)setIcons:(id)a3
{
}

- (NSArray)icons
{
  return self->_icons;
}

- (void)setContentAdvisory:(id)a3
{
}

- (NSString)contentAdvisory
{
  return self->_contentAdvisory;
}

- (double)starRating
{
  return self->_starRating;
}

- (unint64_t)hash
{
  v15.receiver = self;
  v15.super_class = (Class)SFRichText;
  unint64_t v3 = [(SFText *)&v15 hash];
  [(SFRichText *)self starRating];
  double v5 = -v4;
  if (v4 >= 0.0) {
    double v5 = v4;
  }
  long double v6 = round(v5);
  unint64_t v7 = (unint64_t)(fmod(v6, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v5 - v6, 0x40uLL);
  v8 = [(SFRichText *)self contentAdvisory];
  uint64_t v9 = [v8 hash];
  v10 = [(SFRichText *)self icons];
  uint64_t v11 = [v10 hash];
  v12 = [(SFRichText *)self formattedTextPieces];
  unint64_t v13 = v9 ^ v11 ^ v3 ^ [v12 hash] ^ v7;

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  double v5 = (SFRichText *)a3;
  if (self == v5)
  {
    char v14 = 1;
  }
  else
  {
    if ([(SFRichText *)v5 isMemberOfClass:objc_opt_class()])
    {
      v35.receiver = self;
      v35.super_class = (Class)SFRichText;
      if ([(SFText *)&v35 isEqual:v5])
      {
        long double v6 = v5;
        [(SFRichText *)self starRating];
        double v8 = v7;
        [(SFRichText *)v6 starRating];
        if (vabdd_f64(v8, v9) >= 2.22044605e-16)
        {
          char v14 = 0;
LABEL_34:

          goto LABEL_35;
        }
        v10 = [(SFRichText *)self contentAdvisory];
        uint64_t v11 = [(SFRichText *)v6 contentAdvisory];
        if ((v10 == 0) == (v11 != 0))
        {
          char v14 = 0;
LABEL_33:

          goto LABEL_34;
        }
        v12 = [(SFRichText *)self contentAdvisory];
        if (v12)
        {
          unint64_t v3 = [(SFRichText *)self contentAdvisory];
          unint64_t v13 = [(SFRichText *)v6 contentAdvisory];
          if (![v3 isEqual:v13])
          {
            char v14 = 0;
            goto LABEL_31;
          }
          v34 = v13;
        }
        objc_super v15 = [(SFRichText *)self icons];
        v16 = [(SFRichText *)v6 icons];
        v17 = v16;
        if ((v15 == 0) == (v16 != 0))
        {

          char v14 = 0;
          goto LABEL_30;
        }
        v18 = [(SFRichText *)self icons];
        if (v18)
        {
          v28 = v15;
          v19 = [(SFRichText *)self icons];
          v31 = [(SFRichText *)v6 icons];
          v32 = v19;
          if (!objc_msgSend(v19, "isEqual:"))
          {
            char v14 = 0;
            objc_super v15 = v28;
            goto LABEL_28;
          }
          v30 = v18;
          v33 = v3;
          objc_super v15 = v28;
        }
        else
        {
          v30 = 0;
          v33 = v3;
        }
        v20 = [(SFRichText *)self formattedTextPieces];
        v21 = [(SFRichText *)v6 formattedTextPieces];
        if ((v20 == 0) == (v21 != 0))
        {

          char v14 = 0;
          unint64_t v3 = v33;
          v18 = v30;
          if (!v30) {
            goto LABEL_29;
          }
        }
        else
        {
          v27 = v20;
          v29 = v21;
          uint64_t v22 = [(SFRichText *)self formattedTextPieces];
          v18 = v30;
          if (v22)
          {
            v26 = (void *)v22;
            v25 = [(SFRichText *)self formattedTextPieces];
            v23 = [(SFRichText *)v6 formattedTextPieces];
            char v14 = objc_msgSend(v25, "isEqual:");
          }
          else
          {

            char v14 = 1;
          }
          unint64_t v3 = v33;
          if (!v30) {
            goto LABEL_29;
          }
        }
LABEL_28:

LABEL_29:
LABEL_30:
        unint64_t v13 = v34;
        if (!v12)
        {
LABEL_32:

          goto LABEL_33;
        }
LABEL_31:

        goto LABEL_32;
      }
    }
    char v14 = 0;
  }
LABEL_35:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFRichText;
  id v4 = [(SFText *)&v12 copyWithZone:a3];
  [(SFRichText *)self starRating];
  objc_msgSend(v4, "setStarRating:");
  double v5 = [(SFRichText *)self contentAdvisory];
  long double v6 = (void *)[v5 copy];
  [v4 setContentAdvisory:v6];

  double v7 = [(SFRichText *)self icons];
  double v8 = (void *)[v7 copy];
  [v4 setIcons:v8];

  double v9 = [(SFRichText *)self formattedTextPieces];
  v10 = (void *)[v9 copy];
  [v4 setFormattedTextPieces:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBRichText alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRichText *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBRichText alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBRichText *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  long double v6 = [[_SFPBRichText alloc] initWithFacade:self];
  double v5 = [(_SFPBRichText *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFRichText)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  long double v6 = [[_SFPBRichText alloc] initWithData:v5];
  double v7 = [(SFRichText *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasStarRating
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setStarRating:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_starRating = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRichText)initWithProtobuf:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 text];
  v37.receiver = self;
  v37.super_class = (Class)SFRichText;
  long double v6 = [(SFText *)&v37 initWithProtobuf:v5];

  if (v6)
  {
    double v7 = [v4 starRating];

    if (v7)
    {
      double v8 = [v4 starRating];
      [v8 doubleValue];
      -[SFRichText setStarRating:](v6, "setStarRating:");
    }
    double v9 = [v4 contentAdvisory];

    if (v9)
    {
      v10 = [v4 contentAdvisory];
      [(SFRichText *)v6 setContentAdvisory:v10];
    }
    uint64_t v11 = [v4 icons];
    if (v11) {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v12 = 0;
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    unint64_t v13 = [v4 icons];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [[SFImage alloc] initWithProtobuf:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          if (v18) {
            [v12 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v15);
    }

    [(SFRichText *)v6 setIcons:v12];
    v19 = [v4 formattedTextPieces];
    if (v19) {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v20 = 0;
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v21 = objc_msgSend(v4, "formattedTextPieces", 0);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [[SFFormattedText alloc] initWithProtobuf:*(void *)(*((void *)&v29 + 1) + 8 * j)];
          if (v26) {
            [v20 addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v23);
    }

    [(SFRichText *)v6 setFormattedTextPieces:v20];
    v27 = v6;
  }
  return v6;
}

- (void)loadRichTextWithCompletionHandler:(id)a3
{
}

@end