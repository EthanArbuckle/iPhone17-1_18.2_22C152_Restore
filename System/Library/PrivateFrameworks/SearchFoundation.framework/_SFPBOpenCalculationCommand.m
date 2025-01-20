@interface _SFPBOpenCalculationCommand
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldOpenCurrencyConversionProvider;
- (NSData)jsonData;
- (NSString)input;
- (NSString)output;
- (_SFPBOpenCalculationCommand)initWithDictionary:(id)a3;
- (_SFPBOpenCalculationCommand)initWithFacade:(id)a3;
- (_SFPBOpenCalculationCommand)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setInput:(id)a3;
- (void)setOutput:(id)a3;
- (void)setShouldOpenCurrencyConversionProvider:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBOpenCalculationCommand

- (_SFPBOpenCalculationCommand)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBOpenCalculationCommand *)self init];
  if (v5)
  {
    v6 = [v4 input];

    if (v6)
    {
      v7 = [v4 input];
      [(_SFPBOpenCalculationCommand *)v5 setInput:v7];
    }
    v8 = [v4 output];

    if (v8)
    {
      v9 = [v4 output];
      [(_SFPBOpenCalculationCommand *)v5 setOutput:v9];
    }
    if ([v4 hasShouldOpenCurrencyConversionProvider]) {
      -[_SFPBOpenCalculationCommand setShouldOpenCurrencyConversionProvider:](v5, "setShouldOpenCurrencyConversionProvider:", [v4 shouldOpenCurrencyConversionProvider]);
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

- (BOOL)shouldOpenCurrencyConversionProvider
{
  return self->_shouldOpenCurrencyConversionProvider;
}

- (NSString)output
{
  return self->_output;
}

- (NSString)input
{
  return self->_input;
}

- (_SFPBOpenCalculationCommand)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBOpenCalculationCommand;
  v5 = [(_SFPBOpenCalculationCommand *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"input"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBOpenCalculationCommand *)v5 setInput:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"output"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBOpenCalculationCommand *)v5 setOutput:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"shouldOpenCurrencyConversionProvider"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBOpenCalculationCommand setShouldOpenCurrencyConversionProvider:](v5, "setShouldOpenCurrencyConversionProvider:", [v10 BOOLValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (_SFPBOpenCalculationCommand)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBOpenCalculationCommand *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBOpenCalculationCommand *)self dictionaryRepresentation];
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
  if (self->_input)
  {
    id v4 = [(_SFPBOpenCalculationCommand *)self input];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"input"];
  }
  if (self->_output)
  {
    v6 = [(_SFPBOpenCalculationCommand *)self output];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"output"];
  }
  if (self->_shouldOpenCurrencyConversionProvider)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBOpenCalculationCommand shouldOpenCurrencyConversionProvider](self, "shouldOpenCurrencyConversionProvider"));
    [v3 setObject:v8 forKeyedSubscript:@"shouldOpenCurrencyConversionProvider"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_input hash];
  NSUInteger v4 = [(NSString *)self->_output hash];
  uint64_t v5 = 2654435761;
  if (!self->_shouldOpenCurrencyConversionProvider) {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(_SFPBOpenCalculationCommand *)self input];
  v6 = [v4 input];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBOpenCalculationCommand *)self input];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBOpenCalculationCommand *)self input];
    v10 = [v4 input];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_SFPBOpenCalculationCommand *)self output];
  v6 = [v4 output];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(_SFPBOpenCalculationCommand *)self output];
    if (!v12)
    {

LABEL_15:
      int shouldOpenCurrencyConversionProvider = self->_shouldOpenCurrencyConversionProvider;
      BOOL v17 = shouldOpenCurrencyConversionProvider == [v4 shouldOpenCurrencyConversionProvider];
      goto LABEL_13;
    }
    objc_super v13 = (void *)v12;
    v14 = [(_SFPBOpenCalculationCommand *)self output];
    v15 = [v4 output];
    int v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(_SFPBOpenCalculationCommand *)self input];
  if (v4) {
    PBDataWriterWriteStringField();
  }

  uint64_t v5 = [(_SFPBOpenCalculationCommand *)self output];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBOpenCalculationCommand *)self shouldOpenCurrencyConversionProvider]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBOpenCalculationCommandReadFrom(self, (uint64_t)a3);
}

- (void)setShouldOpenCurrencyConversionProvider:(BOOL)a3
{
  self->_int shouldOpenCurrencyConversionProvider = a3;
}

- (void)setOutput:(id)a3
{
  self->_output = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setInput:(id)a3
{
  self->_input = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end