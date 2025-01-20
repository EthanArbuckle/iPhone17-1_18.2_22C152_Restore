@interface _SFPBRFTableSpacerColumnDefinition
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFTableSpacerColumnDefinition)initWithDictionary:(id)a3;
- (_SFPBRFTableSpacerColumnDefinition)initWithFacade:(id)a3;
- (_SFPBRFTableSpacerColumnDefinition)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation _SFPBRFTableSpacerColumnDefinition

- (_SFPBRFTableSpacerColumnDefinition)initWithFacade:(id)a3
{
  v3 = [(_SFPBRFTableSpacerColumnDefinition *)self init];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (_SFPBRFTableSpacerColumnDefinition)initWithDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SFPBRFTableSpacerColumnDefinition;
  v3 = [(_SFPBRFTableSpacerColumnDefinition *)&v7 init];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (_SFPBRFTableSpacerColumnDefinition)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFTableSpacerColumnDefinition *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFTableSpacerColumnDefinition *)self dictionaryRepresentation];
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
  return (id)[MEMORY[0x1E4F1CA60] dictionary];
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFTableSpacerColumnDefinitionReadFrom((uint64_t)self, (uint64_t)a3);
}

@end