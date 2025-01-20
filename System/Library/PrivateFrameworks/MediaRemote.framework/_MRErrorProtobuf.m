@interface _MRErrorProtobuf
+ (Class)underlyingErrorsType;
- (BOOL)hasCode;
- (BOOL)hasDomain;
- (BOOL)hasLocalizedDescription;
- (BOOL)hasLocalizedFailureReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)underlyingErrors;
- (NSString)domain;
- (NSString)localizedDescription;
- (NSString)localizedFailureReason;
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
- (void)mergeFrom:(id)a3;
- (void)setCode:(int)a3;
- (void)setDomain:(id)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedFailureReason:(id)a3;
- (void)setUnderlyingErrors:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRErrorProtobuf

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

- (BOOL)hasLocalizedDescription
{
  return self->_localizedDescription != 0;
}

- (BOOL)hasLocalizedFailureReason
{
  return self->_localizedFailureReason != 0;
}

- (void)clearUnderlyingErrors
{
}

- (void)addUnderlyingErrors:(id)a3
{
  id v4 = a3;
  underlyingErrors = self->_underlyingErrors;
  id v8 = v4;
  if (!underlyingErrors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_underlyingErrors;
    self->_underlyingErrors = v6;

    id v4 = v8;
    underlyingErrors = self->_underlyingErrors;
  }
  [(NSMutableArray *)underlyingErrors addObject:v4];
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
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRErrorProtobuf;
  id v4 = [(_MRErrorProtobuf *)&v8 description];
  v5 = [(_MRErrorProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithInt:self->_code];
    [v4 setObject:v6 forKey:@"code"];
  }
  localizedDescription = self->_localizedDescription;
  if (localizedDescription) {
    [v4 setObject:localizedDescription forKey:@"localizedDescription"];
  }
  localizedFailureReason = self->_localizedFailureReason;
  if (localizedFailureReason) {
    [v4 setObject:localizedFailureReason forKey:@"localizedFailureReason"];
  }
  if ([(NSMutableArray *)self->_underlyingErrors count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_underlyingErrors, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_underlyingErrors;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"underlyingErrors"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRErrorProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_localizedDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_localizedFailureReason) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_underlyingErrors;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_code;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_localizedDescription) {
    objc_msgSend(v9, "setLocalizedDescription:");
  }
  if (self->_localizedFailureReason) {
    objc_msgSend(v9, "setLocalizedFailureReason:");
  }
  if ([(_MRErrorProtobuf *)self underlyingErrorsCount])
  {
    [v9 clearUnderlyingErrors];
    unint64_t v5 = [(_MRErrorProtobuf *)self underlyingErrorsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(_MRErrorProtobuf *)self underlyingErrorsAtIndex:i];
        [v9 addUnderlyingErrors:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_code;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_localizedDescription copyWithZone:a3];
  id v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_localizedFailureReason copyWithZone:a3];
  long long v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_underlyingErrors;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (void)v19);
        [(id)v5 addUnderlyingErrors:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  domain = self->_domain;
  if ((unint64_t)domain | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](domain, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_code != *((_DWORD *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  localizedDescription = self->_localizedDescription;
  if ((unint64_t)localizedDescription | *((void *)v4 + 3)
    && !-[NSString isEqual:](localizedDescription, "isEqual:"))
  {
    goto LABEL_15;
  }
  localizedFailureReason = self->_localizedFailureReason;
  if ((unint64_t)localizedFailureReason | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](localizedFailureReason, "isEqual:")) {
      goto LABEL_15;
    }
  }
  underlyingErrors = self->_underlyingErrors;
  if ((unint64_t)underlyingErrors | *((void *)v4 + 5)) {
    char v9 = -[NSMutableArray isEqual:](underlyingErrors, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
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
  NSUInteger v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_localizedDescription hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_localizedFailureReason hash];
  return v7 ^ [(NSMutableArray *)self->_underlyingErrors hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[_MRErrorProtobuf setDomain:](self, "setDomain:");
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_code = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[_MRErrorProtobuf setLocalizedDescription:](self, "setLocalizedDescription:");
  }
  if (*((void *)v4 + 4)) {
    -[_MRErrorProtobuf setLocalizedFailureReason:](self, "setLocalizedFailureReason:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 5);
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
        -[_MRErrorProtobuf addUnderlyingErrors:](self, "addUnderlyingErrors:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
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

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)localizedFailureReason
{
  return self->_localizedFailureReason;
}

- (void)setLocalizedFailureReason:(id)a3
{
}

- (NSMutableArray)underlyingErrors
{
  return self->_underlyingErrors;
}

- (void)setUnderlyingErrors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingErrors, 0);
  objc_storeStrong((id *)&self->_localizedFailureReason, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);

  objc_storeStrong((id *)&self->_domain, 0);
}

@end