@interface PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1
- (BOOL)hasFavIcon;
- (BOOL)hasImageUrl;
- (BOOL)hasTouchIcon;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)favIcon;
- (NSString)imageUrl;
- (NSString)touchIcon;
- (PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteFavIcon;
- (void)deleteImageUrl;
- (void)deleteTouchIcon;
- (void)setFavIcon:(id)a3;
- (void)setHasFavIcon:(BOOL)a3;
- (void)setHasImageUrl:(BOOL)a3;
- (void)setHasTouchIcon:(BOOL)a3;
- (void)setImageUrl:(id)a3;
- (void)setTouchIcon:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteImageUrl];
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteTouchIcon];
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteFavIcon];
  }
  if ([v4 isConditionSet:4])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteImageUrl];
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteTouchIcon];
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteFavIcon];
  }
  if ([v4 isConditionSet:5])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteImageUrl];
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteTouchIcon];
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteFavIcon];
  }
  if ([v4 isConditionSet:6])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteImageUrl];
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteTouchIcon];
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteFavIcon];
  }
  if ([v4 isConditionSet:7])
  {
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteImageUrl];
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteTouchIcon];
    [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self deleteFavIcon];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favIcon, 0);
  objc_storeStrong((id *)&self->_touchIcon, 0);
  objc_storeStrong((id *)&self->_imageUrl, 0);
}

- (void)setHasFavIcon:(BOOL)a3
{
  self->_hasFavIcon = a3;
}

- (void)setHasTouchIcon:(BOOL)a3
{
  self->_hasTouchIcon = a3;
}

- (void)setHasImageUrl:(BOOL)a3
{
  self->_hasImageUrl = a3;
}

- (void)setFavIcon:(id)a3
{
}

- (NSString)favIcon
{
  return self->_favIcon;
}

- (void)setTouchIcon:(id)a3
{
}

- (NSString)touchIcon
{
  return self->_touchIcon;
}

- (void)setImageUrl:(id)a3
{
}

- (NSString)imageUrl
{
  return self->_imageUrl;
}

- (PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1;
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"imageUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)v5 setImageUrl:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"touchIcon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)v5 setTouchIcon:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"favIcon"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)v5 setFavIcon:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self dictionaryRepresentation];
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
  if (self->_favIcon)
  {
    id v4 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self favIcon];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"favIcon"];
  }
  if (self->_imageUrl)
  {
    v6 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self imageUrl];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"imageUrl"];
  }
  if (self->_touchIcon)
  {
    v8 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self touchIcon];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"touchIcon"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_imageUrl hash];
  NSUInteger v4 = [(NSString *)self->_touchIcon hash] ^ v3;
  return v4 ^ [(NSString *)self->_favIcon hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self imageUrl];
  v6 = [v4 imageUrl];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self imageUrl];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self imageUrl];
    v10 = [v4 imageUrl];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self touchIcon];
  v6 = [v4 touchIcon];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self touchIcon];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self touchIcon];
    v15 = [v4 touchIcon];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self favIcon];
  v6 = [v4 favIcon];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self favIcon];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self favIcon];
    v20 = [v4 favIcon];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self imageUrl];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self touchIcon];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1 *)self favIcon];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSWebAnswerThumbnailTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteFavIcon
{
}

- (BOOL)hasFavIcon
{
  return self->_favIcon != 0;
}

- (void)deleteTouchIcon
{
}

- (BOOL)hasTouchIcon
{
  return self->_touchIcon != 0;
}

- (void)deleteImageUrl
{
}

- (BOOL)hasImageUrl
{
  return self->_imageUrl != 0;
}

@end