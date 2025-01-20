@interface _SFPBScene
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBScene)initWithDictionary:(id)a3;
- (_SFPBScene)initWithFacade:(id)a3;
- (_SFPBScene)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)sceneType;
- (unint64_t)hash;
- (unint64_t)sceneIdentifier;
- (void)setSceneIdentifier:(unint64_t)a3;
- (void)setSceneType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBScene

- (_SFPBScene)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBScene *)self init];
  if (v5)
  {
    if ([v4 hasSceneIdentifier]) {
      -[_SFPBScene setSceneIdentifier:](v5, "setSceneIdentifier:", [v4 sceneIdentifier]);
    }
    if ([v4 hasSceneType]) {
      -[_SFPBScene setSceneType:](v5, "setSceneType:", [v4 sceneType]);
    }
    v6 = v5;
  }

  return v5;
}

- (int)sceneType
{
  return self->_sceneType;
}

- (unint64_t)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (_SFPBScene)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBScene;
  v5 = [(_SFPBScene *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sceneIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBScene setSceneIdentifier:](v5, "setSceneIdentifier:", [v6 unsignedLongLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"sceneType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBScene setSceneType:](v5, "setSceneType:", [v7 intValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (_SFPBScene)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBScene *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBScene *)self dictionaryRepresentation];
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
  if (self->_sceneIdentifier)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_SFPBScene sceneIdentifier](self, "sceneIdentifier"));
    [v3 setObject:v4 forKeyedSubscript:@"sceneIdentifier"];
  }
  if (self->_sceneType)
  {
    uint64_t v5 = [(_SFPBScene *)self sceneType];
    if (v5 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E5A2F070[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"sceneType"];
  }
  return v3;
}

- (unint64_t)hash
{
  return (2654435761 * self->_sceneType) ^ (2654435761u * self->_sceneIdentifier);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (unint64_t sceneIdentifier = self->_sceneIdentifier, sceneIdentifier == [v4 sceneIdentifier]))
  {
    int sceneType = self->_sceneType;
    BOOL v7 = sceneType == [v4 sceneType];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_SFPBScene *)self sceneIdentifier]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_SFPBScene *)self sceneType]) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBSceneReadFrom(self, (uint64_t)a3);
}

- (void)setSceneType:(int)a3
{
  self->_int sceneType = a3;
}

- (void)setSceneIdentifier:(unint64_t)a3
{
  self->_unint64_t sceneIdentifier = a3;
}

@end