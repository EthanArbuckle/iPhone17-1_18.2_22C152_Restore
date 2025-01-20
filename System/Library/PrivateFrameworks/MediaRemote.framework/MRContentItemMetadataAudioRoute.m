@interface MRContentItemMetadataAudioRoute
- (BOOL)hasSpatializationEnabled;
- (BOOL)hasSupportsSpatialization;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSpatializationEnabled;
- (BOOL)supportsSpatialization;
- (MRContentItemMetadataAudioRoute)initWithProtobuf:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (_MRAudioRouteProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (void)setHasSpatializationEnabled:(BOOL)a3;
- (void)setHasSupportsSpatialization:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSpatializationEnabled:(BOOL)a3;
- (void)setSupportsSpatialization:(BOOL)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MRContentItemMetadataAudioRoute

- (MRContentItemMetadataAudioRoute)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v11.receiver = self;
    v11.super_class = (Class)MRContentItemMetadataAudioRoute;
    v5 = [(MRContentItemMetadataAudioRoute *)&v11 init];
    if (v5)
    {
      v5->_type = (int)[v4 type];
      v5->_hasType = [v4 hasType];
      v5->_supportsSpatialization = [v4 supportsSpatialization];
      v5->_hasSupportsSpatialization = [v4 hasSupportsSpatialization];
      v5->_spatializationEnabled = [v4 spatializationEnabled];
      v5->_hasSpatializationEnabled = [v4 hasSpatializationEnabled];
      v6 = [v4 name];
      uint64_t v7 = [v6 copy];
      name = v5->_name;
      v5->_name = (NSString *)v7;
    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_MRAudioRouteProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRAudioRouteProtobuf);
  v3->_type = [(MRContentItemMetadataAudioRoute *)self type];
  *(unsigned char *)&v3->_has = *(unsigned char *)&v3->_has & 0xFE | [(MRContentItemMetadataAudioRoute *)self hasType];
  v3->_supportsSpatialization = [(MRContentItemMetadataAudioRoute *)self supportsSpatialization];
  if ([(MRContentItemMetadataAudioRoute *)self hasSupportsSpatialization]) {
    char v4 = 4;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)&v3->_has = *(unsigned char *)&v3->_has & 0xFB | v4;
  v3->_spatializationEnabled = [(MRContentItemMetadataAudioRoute *)self isSpatializationEnabled];
  if ([(MRContentItemMetadataAudioRoute *)self hasSpatializationEnabled]) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&v3->_has = *(unsigned char *)&v3->_has & 0xFD | v5;
  v6 = [(MRContentItemMetadataAudioRoute *)self name];
  uint64_t v7 = (void *)[v6 copy];
  [(_MRAudioRouteProtobuf *)v3 setName:v7];

  return v3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  self->_hasType = 1;
}

- (void)setSupportsSpatialization:(BOOL)a3
{
  self->_supportsSpatialization = a3;
  self->_hasSupportsSpatialization = 1;
}

- (void)setSpatializationEnabled:(BOOL)a3
{
  self->_spatializationEnabled = a3;
  self->_hasSpatializationEnabled = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  if ([(MRContentItemMetadataAudioRoute *)self hasType]) {
    objc_msgSend(v5, "setType:", -[MRContentItemMetadataAudioRoute type](self, "type"));
  }
  v6 = [(MRContentItemMetadataAudioRoute *)self name];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  [v5 setName:v7];

  if ([(MRContentItemMetadataAudioRoute *)self hasSupportsSpatialization]) {
    objc_msgSend(v5, "setSupportsSpatialization:", -[MRContentItemMetadataAudioRoute supportsSpatialization](self, "supportsSpatialization"));
  }
  if ([(MRContentItemMetadataAudioRoute *)self hasSpatializationEnabled]) {
    objc_msgSend(v5, "setSpatializationEnabled:", -[MRContentItemMetadataAudioRoute isSpatializationEnabled](self, "isSpatializationEnabled"));
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (MRContentItemMetadataAudioRoute *)a3;
  if (v4 == self) {
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  BOOL v5 = [(MRContentItemMetadataAudioRoute *)v4 hasType];
  if (v5 != [(MRContentItemMetadataAudioRoute *)self hasType]) {
    goto LABEL_16;
  }
  if ([(MRContentItemMetadataAudioRoute *)v4 hasType])
  {
    if ([(MRContentItemMetadataAudioRoute *)self hasType])
    {
      uint64_t v6 = [(MRContentItemMetadataAudioRoute *)v4 type];
      if (v6 != [(MRContentItemMetadataAudioRoute *)self type]) {
        goto LABEL_16;
      }
    }
  }
  uint64_t v7 = [(MRContentItemMetadataAudioRoute *)v4 name];
  uint64_t v8 = [(MRContentItemMetadataAudioRoute *)self name];
  if (v7 == (void *)v8)
  {

LABEL_11:
    BOOL v13 = [(MRContentItemMetadataAudioRoute *)v4 hasSupportsSpatialization];
    if (v13 != [(MRContentItemMetadataAudioRoute *)self hasSupportsSpatialization]) {
      goto LABEL_16;
    }
    if ([(MRContentItemMetadataAudioRoute *)v4 hasSupportsSpatialization])
    {
      if ([(MRContentItemMetadataAudioRoute *)self hasSupportsSpatialization])
      {
        BOOL v14 = [(MRContentItemMetadataAudioRoute *)v4 supportsSpatialization];
        if (v14 != [(MRContentItemMetadataAudioRoute *)self supportsSpatialization]) {
          goto LABEL_16;
        }
      }
    }
    BOOL v15 = [(MRContentItemMetadataAudioRoute *)v4 hasSpatializationEnabled];
    if (v15 != [(MRContentItemMetadataAudioRoute *)self hasSpatializationEnabled]) {
      goto LABEL_16;
    }
    if ([(MRContentItemMetadataAudioRoute *)v4 hasSpatializationEnabled])
    {
      if ([(MRContentItemMetadataAudioRoute *)self hasSpatializationEnabled])
      {
        BOOL v17 = [(MRContentItemMetadataAudioRoute *)v4 isSpatializationEnabled];
        if (v17 != [(MRContentItemMetadataAudioRoute *)self isSpatializationEnabled]) {
          goto LABEL_16;
        }
      }
    }
LABEL_20:
    BOOL v16 = 1;
    goto LABEL_21;
  }
  v9 = (void *)v8;
  v10 = [(MRContentItemMetadataAudioRoute *)v4 name];
  objc_super v11 = [(MRContentItemMetadataAudioRoute *)self name];
  int v12 = [v10 isEqual:v11];

  if (v12) {
    goto LABEL_11;
  }
LABEL_16:
  BOOL v16 = 0;
LABEL_21:

  return v16;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(MRContentItemMetadataAudioRoute *)self hasType])
  {
    char v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadataAudioRoute type](self, "type"));
    [v3 setObject:v4 forKeyedSubscript:@"type"];
  }
  BOOL v5 = [(MRContentItemMetadataAudioRoute *)self name];
  [v3 setObject:v5 forKeyedSubscript:@"name"];

  if ([(MRContentItemMetadataAudioRoute *)self hasSupportsSpatialization])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadataAudioRoute supportsSpatialization](self, "supportsSpatialization"));
    [v3 setObject:v6 forKeyedSubscript:@"supportsSpatialization"];

    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadataAudioRoute isSpatializationEnabled](self, "isSpatializationEnabled"));
    [v3 setObject:v7 forKeyedSubscript:@"isSpatializationEnabled"];
  }

  return (NSDictionary *)v3;
}

- (BOOL)hasType
{
  return self->_hasType;
}

- (void)setHasType:(BOOL)a3
{
  self->_hasType = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)hasSupportsSpatialization
{
  return self->_hasSupportsSpatialization;
}

- (void)setHasSupportsSpatialization:(BOOL)a3
{
  self->_hasSupportsSpatialization = a3;
}

- (BOOL)supportsSpatialization
{
  return self->_supportsSpatialization;
}

- (BOOL)hasSpatializationEnabled
{
  return self->_hasSpatializationEnabled;
}

- (void)setHasSpatializationEnabled:(BOOL)a3
{
  self->_hasSpatializationEnabled = a3;
}

- (BOOL)isSpatializationEnabled
{
  return self->_spatializationEnabled;
}

- (void).cxx_destruct
{
}

@end