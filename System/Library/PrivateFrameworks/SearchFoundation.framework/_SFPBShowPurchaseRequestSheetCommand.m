@interface _SFPBShowPurchaseRequestSheetCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)requestIdentifier;
- (_SFPBShowPurchaseRequestSheetCommand)initWithDictionary:(id)a3;
- (_SFPBShowPurchaseRequestSheetCommand)initWithFacade:(id)a3;
- (_SFPBShowPurchaseRequestSheetCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBShowPurchaseRequestSheetCommand

- (_SFPBShowPurchaseRequestSheetCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBShowPurchaseRequestSheetCommand *)self init];
  if (v5)
  {
    v6 = [v4 requestIdentifier];

    if (v6)
    {
      v7 = [v4 requestIdentifier];
      [(_SFPBShowPurchaseRequestSheetCommand *)v5 setRequestIdentifier:v7];
    }
    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (_SFPBShowPurchaseRequestSheetCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBShowPurchaseRequestSheetCommand;
  v5 = [(_SFPBShowPurchaseRequestSheetCommand *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"requestIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBShowPurchaseRequestSheetCommand *)v5 setRequestIdentifier:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (_SFPBShowPurchaseRequestSheetCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBShowPurchaseRequestSheetCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBShowPurchaseRequestSheetCommand *)self dictionaryRepresentation];
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
  if (self->_requestIdentifier)
  {
    id v4 = [(_SFPBShowPurchaseRequestSheetCommand *)self requestIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"requestIdentifier"];
  }
  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_requestIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBShowPurchaseRequestSheetCommand *)self requestIdentifier];
    v6 = [v4 requestIdentifier];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBShowPurchaseRequestSheetCommand *)self requestIdentifier];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(_SFPBShowPurchaseRequestSheetCommand *)self requestIdentifier];
      v11 = [v4 requestIdentifier];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(_SFPBShowPurchaseRequestSheetCommand *)self requestIdentifier];
  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBShowPurchaseRequestSheetCommandReadFrom(self, (uint64_t)a3);
}

- (void)setRequestIdentifier:(id)a3
{
  self->_requestIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end