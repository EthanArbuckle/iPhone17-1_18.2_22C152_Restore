@interface AWDMMCSError
+ (Class)underlyingErrorsType;
- (BOOL)hasCode;
- (BOOL)hasDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)underlyingErrors;
- (NSString)domain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)underlyingErrorsAtIndex:(unint64_t)a3;
- (int)code;
- (unint64_t)hash;
- (unint64_t)underlyingErrorsCount;
- (void)addUnderlyingErrors:(id)a3;
- (void)clearUnderlyingErrors;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int)a3;
- (void)setDomain:(id)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setUnderlyingErrors:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMMCSError

- (void)dealloc
{
  [(AWDMMCSError *)self setDomain:0];
  [(AWDMMCSError *)self setUnderlyingErrors:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSError;
  [(AWDMMCSError *)&v3 dealloc];
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (void)setCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearUnderlyingErrors
{
}

- (void)addUnderlyingErrors:(id)a3
{
  underlyingErrors = self->_underlyingErrors;
  if (!underlyingErrors)
  {
    underlyingErrors = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_underlyingErrors = underlyingErrors;
  }

  [(NSMutableArray *)underlyingErrors addObject:a3];
}

- (unint64_t)underlyingErrorsCount
{
  return [(NSMutableArray *)self->_underlyingErrors count];
}

- (id)underlyingErrorsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_underlyingErrors objectAtIndex:a3];
}

+ (Class)underlyingErrorsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSError;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMMCSError description](&v3, sel_description), -[AWDMMCSError dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  if (*(unsigned char *)&self->_has) {
    [v4 setObject:[NSNumber numberWithInt:self->_code] forKey:@"code"];
  }
  if ([(NSMutableArray *)self->_underlyingErrors count])
  {
    v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_underlyingErrors, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    underlyingErrors = self->_underlyingErrors;
    uint64_t v8 = [(NSMutableArray *)underlyingErrors countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(underlyingErrors);
          }
          [v6 addObject:[*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v9 = [(NSMutableArray *)underlyingErrors countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    [v4 setObject:v6 forKey:@"underlyingErrors"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMMCSErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  underlyingErrors = self->_underlyingErrors;
  uint64_t v5 = [(NSMutableArray *)underlyingErrors countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(underlyingErrors);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)underlyingErrors countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (self->_domain) {
    [a3 setDomain:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_code;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  if ([(AWDMMCSError *)self underlyingErrorsCount])
  {
    [a3 clearUnderlyingErrors];
    unint64_t v5 = [(AWDMMCSError *)self underlyingErrorsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addUnderlyingErrors:-[AWDMMCSError underlyingErrorsAtIndex:](self, "underlyingErrorsAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 16) = [(NSString *)self->_domain copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_code;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  underlyingErrors = self->_underlyingErrors;
  uint64_t v7 = [(NSMutableArray *)underlyingErrors countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(underlyingErrors);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [(id)v5 addUnderlyingErrors:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)underlyingErrors countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    domain = self->_domain;
    if (!((unint64_t)domain | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](domain, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_code != *((_DWORD *)a3 + 2)) {
          goto LABEL_11;
        }
      }
      else if (*((unsigned char *)a3 + 32))
      {
LABEL_11:
        LOBYTE(v5) = 0;
        return v5;
      }
      underlyingErrors = self->_underlyingErrors;
      if ((unint64_t)underlyingErrors | *((void *)a3 + 3))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](underlyingErrors, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_code;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSMutableArray *)self->_underlyingErrors hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*((void *)a3 + 2)) {
    -[AWDMMCSError setDomain:](self, "setDomain:");
  }
  if (*((unsigned char *)a3 + 32))
  {
    self->_code = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v5 = (void *)*((void *)a3 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDMMCSError *)self addUnderlyingErrors:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (int)code
{
  return self->_code;
}

- (NSMutableArray)underlyingErrors
{
  return self->_underlyingErrors;
}

- (void)setUnderlyingErrors:(id)a3
{
}

@end