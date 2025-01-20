@interface _ICLLMediaInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLMediaInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playParams, 0);

  objc_storeStrong((id *)&self->_mediaType, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_mediaType hash];
  return [(NSString *)self->_playParams hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((mediaType = self->_mediaType, !((unint64_t)mediaType | v4[1]))
     || -[NSString isEqual:](mediaType, "isEqual:")))
  {
    playParams = self->_playParams;
    if ((unint64_t)playParams | v4[2]) {
      char v7 = -[NSString isEqual:](playParams, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_mediaType copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_playParams copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_mediaType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_playParams)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLMediaInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  mediaType = self->_mediaType;
  if (mediaType) {
    [v3 setObject:mediaType forKey:@"mediaType"];
  }
  playParams = self->_playParams;
  if (playParams) {
    [v4 setObject:playParams forKey:@"playParams"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLMediaInfo;
  id v4 = [(_ICLLMediaInfo *)&v8 description];
  id v5 = [(_ICLLMediaInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end