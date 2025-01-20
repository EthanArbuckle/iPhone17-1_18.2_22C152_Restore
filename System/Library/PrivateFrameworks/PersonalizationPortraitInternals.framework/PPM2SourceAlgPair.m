@interface PPM2SourceAlgPair
- (BOOL)hasAlgorithm;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)algorithm;
- (NSString)source;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlgorithm:(id)a3;
- (void)setSource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2SourceAlgPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_algorithm, 0);
}

- (void)setAlgorithm:(id)a3
{
}

- (NSString)algorithm
{
  return self->_algorithm;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[PPM2SourceAlgPair setSource:](self, "setSource:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[PPM2SourceAlgPair setAlgorithm:](self, "setAlgorithm:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_source hash];
  return [(NSString *)self->_algorithm hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((source = self->_source, !((unint64_t)source | v4[2]))
     || -[NSString isEqual:](source, "isEqual:")))
  {
    algorithm = self->_algorithm;
    if ((unint64_t)algorithm | v4[1]) {
      char v7 = -[NSString isEqual:](algorithm, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_source copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_algorithm copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_source)
  {
    objc_msgSend(v4, "setSource:");
    id v4 = v5;
  }
  if (self->_algorithm)
  {
    objc_msgSend(v5, "setAlgorithm:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_algorithm)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2SourceAlgPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  source = self->_source;
  if (source) {
    [v3 setObject:source forKey:@"source"];
  }
  algorithm = self->_algorithm;
  if (algorithm) {
    [v4 setObject:algorithm forKey:@"algorithm"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2SourceAlgPair;
  id v4 = [(PPM2SourceAlgPair *)&v8 description];
  id v5 = [(PPM2SourceAlgPair *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAlgorithm
{
  return self->_algorithm != 0;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

@end