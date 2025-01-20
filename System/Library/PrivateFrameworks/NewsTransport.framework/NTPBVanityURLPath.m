@interface NTPBVanityURLPath
- (BOOL)hasDestinationParameters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)destinationParameters;
- (NSString)destinationPath;
- (NSString)sourcePath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setDestinationParameters:(id)a3;
- (void)setDestinationPath:(id)a3;
- (void)setSourcePath:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBVanityURLPath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourcePath, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);

  objc_storeStrong((id *)&self->_destinationParameters, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((sourcePath = self->_sourcePath, !((unint64_t)sourcePath | v4[3]))
     || -[NSString isEqual:](sourcePath, "isEqual:"))
    && ((destinationPath = self->_destinationPath, !((unint64_t)destinationPath | v4[2]))
     || -[NSString isEqual:](destinationPath, "isEqual:")))
  {
    destinationParameters = self->_destinationParameters;
    if ((unint64_t)destinationParameters | v4[1]) {
      char v8 = -[NSString isEqual:](destinationParameters, "isEqual:");
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

- (BOOL)hasDestinationParameters
{
  return self->_destinationParameters != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBVanityURLPath;
  v4 = [(NTPBVanityURLPath *)&v8 description];
  v5 = [(NTPBVanityURLPath *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  sourcePath = self->_sourcePath;
  if (sourcePath) {
    [v3 setObject:sourcePath forKey:@"source_path"];
  }
  destinationPath = self->_destinationPath;
  if (destinationPath) {
    [v4 setObject:destinationPath forKey:@"destination_path"];
  }
  destinationParameters = self->_destinationParameters;
  if (destinationParameters) {
    [v4 setObject:destinationParameters forKey:@"destination_parameters"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBVanityURLPathReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteStringField();
  if (self->_destinationParameters) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sourcePath copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_destinationPath copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_destinationParameters copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sourcePath hash];
  NSUInteger v4 = [(NSString *)self->_destinationPath hash] ^ v3;
  return v4 ^ [(NSString *)self->_destinationParameters hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[NTPBVanityURLPath setSourcePath:](self, "setSourcePath:");
  }
  if (v4[2]) {
    -[NTPBVanityURLPath setDestinationPath:](self, "setDestinationPath:");
  }
  if (v4[1]) {
    -[NTPBVanityURLPath setDestinationParameters:](self, "setDestinationParameters:");
  }
}

- (NSString)sourcePath
{
  return self->_sourcePath;
}

- (void)setSourcePath:(id)a3
{
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
}

- (NSString)destinationParameters
{
  return self->_destinationParameters;
}

- (void)setDestinationParameters:(id)a3
{
}

@end