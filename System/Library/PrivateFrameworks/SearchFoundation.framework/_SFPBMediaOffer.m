@interface _SFPBMediaOffer
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)offerIdentifier;
- (NSString)sublabel;
- (_SFPBActionItem)actionItem;
- (_SFPBImage)image;
- (_SFPBMediaOffer)initWithDictionary:(id)a3;
- (_SFPBMediaOffer)initWithFacade:(id)a3;
- (_SFPBMediaOffer)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setActionItem:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setOfferIdentifier:(id)a3;
- (void)setSublabel:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBMediaOffer

- (_SFPBMediaOffer)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBMediaOffer *)self init];
  if (v5)
  {
    v6 = [v4 actionItem];

    if (v6)
    {
      v7 = [_SFPBActionItem alloc];
      v8 = [v4 actionItem];
      v9 = [(_SFPBActionItem *)v7 initWithFacade:v8];
      [(_SFPBMediaOffer *)v5 setActionItem:v9];
    }
    v10 = [v4 sublabel];

    if (v10)
    {
      v11 = [v4 sublabel];
      [(_SFPBMediaOffer *)v5 setSublabel:v11];
    }
    v12 = [v4 offerIdentifier];

    if (v12)
    {
      v13 = [v4 offerIdentifier];
      [(_SFPBMediaOffer *)v5 setOfferIdentifier:v13];
    }
    if ([v4 hasIsEnabled]) {
      -[_SFPBMediaOffer setIsEnabled:](v5, "setIsEnabled:", [v4 isEnabled]);
    }
    v14 = [v4 image];

    if (v14)
    {
      v15 = [_SFPBImage alloc];
      v16 = [v4 image];
      v17 = [(_SFPBImage *)v15 initWithFacade:v16];
      [(_SFPBMediaOffer *)v5 setImage:v17];
    }
    v18 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_offerIdentifier, 0);
  objc_storeStrong((id *)&self->_sublabel, 0);
  objc_storeStrong((id *)&self->_actionItem, 0);
}

- (_SFPBImage)image
{
  return self->_image;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (NSString)offerIdentifier
{
  return self->_offerIdentifier;
}

- (NSString)sublabel
{
  return self->_sublabel;
}

- (_SFPBActionItem)actionItem
{
  return self->_actionItem;
}

- (_SFPBMediaOffer)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_SFPBMediaOffer;
  v5 = [(_SFPBMediaOffer *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"actionItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBActionItem alloc] initWithDictionary:v6];
      [(_SFPBMediaOffer *)v5 setActionItem:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"sublabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBMediaOffer *)v5 setSublabel:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"offerIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBMediaOffer *)v5 setOfferIdentifier:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"isEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBMediaOffer setIsEnabled:](v5, "setIsEnabled:", [v12 BOOLValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"image"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [[_SFPBImage alloc] initWithDictionary:v13];
      [(_SFPBMediaOffer *)v5 setImage:v14];
    }
    v15 = v5;
  }
  return v5;
}

- (_SFPBMediaOffer)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBMediaOffer *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBMediaOffer *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_actionItem)
  {
    id v4 = [(_SFPBMediaOffer *)self actionItem];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"actionItem"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"actionItem"];
    }
  }
  if (self->_image)
  {
    uint64_t v7 = [(_SFPBMediaOffer *)self image];
    v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"image"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"image"];
    }
  }
  if (self->_isEnabled)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBMediaOffer isEnabled](self, "isEnabled"));
    [v3 setObject:v10 forKeyedSubscript:@"isEnabled"];
  }
  if (self->_offerIdentifier)
  {
    v11 = [(_SFPBMediaOffer *)self offerIdentifier];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"offerIdentifier"];
  }
  if (self->_sublabel)
  {
    v13 = [(_SFPBMediaOffer *)self sublabel];
    v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"sublabel"];
  }
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_SFPBActionItem *)self->_actionItem hash];
  NSUInteger v4 = [(NSString *)self->_sublabel hash];
  NSUInteger v5 = [(NSString *)self->_offerIdentifier hash];
  if (self->_isEnabled) {
    uint64_t v6 = 2654435761;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(_SFPBImage *)self->_image hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  NSUInteger v5 = [(_SFPBMediaOffer *)self actionItem];
  uint64_t v6 = [v4 actionItem];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_22;
  }
  uint64_t v7 = [(_SFPBMediaOffer *)self actionItem];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBMediaOffer *)self actionItem];
    v10 = [v4 actionItem];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMediaOffer *)self sublabel];
  uint64_t v6 = [v4 sublabel];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_22;
  }
  uint64_t v12 = [(_SFPBMediaOffer *)self sublabel];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBMediaOffer *)self sublabel];
    v15 = [v4 sublabel];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBMediaOffer *)self offerIdentifier];
  uint64_t v6 = [v4 offerIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_22;
  }
  uint64_t v17 = [(_SFPBMediaOffer *)self offerIdentifier];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBMediaOffer *)self offerIdentifier];
    v20 = [v4 offerIdentifier];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  int isEnabled = self->_isEnabled;
  if (isEnabled != [v4 isEnabled]) {
    goto LABEL_23;
  }
  NSUInteger v5 = [(_SFPBMediaOffer *)self image];
  uint64_t v6 = [v4 image];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v23 = [(_SFPBMediaOffer *)self image];
  if (!v23)
  {

LABEL_26:
    BOOL v28 = 1;
    goto LABEL_24;
  }
  v24 = (void *)v23;
  v25 = [(_SFPBMediaOffer *)self image];
  v26 = [v4 image];
  char v27 = [v25 isEqual:v26];

  if (v27) {
    goto LABEL_26;
  }
LABEL_23:
  BOOL v28 = 0;
LABEL_24:

  return v28;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(_SFPBMediaOffer *)self actionItem];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  NSUInteger v5 = [(_SFPBMediaOffer *)self sublabel];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  uint64_t v6 = [(_SFPBMediaOffer *)self offerIdentifier];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBMediaOffer *)self isEnabled]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v7 = [(_SFPBMediaOffer *)self image];
  if (v7) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBMediaOfferReadFrom(self, (uint64_t)a3);
}

- (void)setImage:(id)a3
{
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_int isEnabled = a3;
}

- (void)setOfferIdentifier:(id)a3
{
  self->_offerIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setSublabel:(id)a3
{
  self->_sublabel = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setActionItem:(id)a3
{
}

@end