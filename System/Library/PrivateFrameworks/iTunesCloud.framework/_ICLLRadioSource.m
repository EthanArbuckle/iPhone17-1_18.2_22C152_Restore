@interface _ICLLRadioSource
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLRadioSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationId, 0);
  objc_storeStrong((id *)&self->_seed, 0);

  objc_storeStrong((id *)&self->_featureName, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_stationId hash];
  unint64_t v4 = [(_ICLLRadioSeed *)self->_seed hash] ^ v3;
  return v4 ^ [(NSString *)self->_featureName hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((stationId = self->_stationId, !((unint64_t)stationId | v4[3]))
     || -[NSString isEqual:](stationId, "isEqual:"))
    && ((seed = self->_seed, !((unint64_t)seed | v4[2])) || -[_ICLLRadioSeed isEqual:](seed, "isEqual:")))
  {
    featureName = self->_featureName;
    if ((unint64_t)featureName | v4[1]) {
      char v8 = -[NSString isEqual:](featureName, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_stationId copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(_ICLLRadioSeed *)self->_seed copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_featureName copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_stationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_seed)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_featureName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLRadioSourceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  stationId = self->_stationId;
  if (stationId) {
    [v3 setObject:stationId forKey:@"stationId"];
  }
  seed = self->_seed;
  if (seed)
  {
    v7 = [(_ICLLRadioSeed *)seed dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"seed"];
  }
  featureName = self->_featureName;
  if (featureName) {
    [v4 setObject:featureName forKey:@"featureName"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLRadioSource;
  id v4 = [(_ICLLRadioSource *)&v8 description];
  id v5 = [(_ICLLRadioSource *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end