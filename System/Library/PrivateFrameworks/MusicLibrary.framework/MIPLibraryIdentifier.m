@interface MIPLibraryIdentifier
- (BOOL)hasLibraryId;
- (BOOL)hasLibraryName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)libraryName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)libraryId;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLibraryId:(BOOL)a3;
- (void)setLibraryId:(int64_t)a3;
- (void)setLibraryName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MIPLibraryIdentifier

- (void).cxx_destruct
{
}

- (int64_t)libraryId
{
  return self->_libraryId;
}

- (void)setLibraryName:(id)a3
{
}

- (NSString)libraryName
{
  return self->_libraryName;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int64_t *)a3;
  if (v4[2])
  {
    v5 = v4;
    -[MIPLibraryIdentifier setLibraryName:](self, "setLibraryName:");
    v4 = v5;
  }
  if (v4[3])
  {
    self->_libraryId = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_libraryName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_libraryId;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  libraryName = self->_libraryName;
  if ((unint64_t)libraryName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](libraryName, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_libraryId == *((void *)v4 + 1))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_libraryName copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_libraryId;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_libraryName)
  {
    id v5 = v4;
    objc_msgSend(v4, "setLibraryName:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_libraryId;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_libraryName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MIPLibraryIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  libraryName = self->_libraryName;
  if (libraryName) {
    [v3 setObject:libraryName forKey:@"libraryName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = [NSNumber numberWithLongLong:self->_libraryId];
    [v4 setObject:v6 forKey:@"libraryId"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MIPLibraryIdentifier;
  id v4 = [(MIPLibraryIdentifier *)&v8 description];
  id v5 = [(MIPLibraryIdentifier *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasLibraryId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasLibraryId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setLibraryId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_libraryId = a3;
}

- (BOOL)hasLibraryName
{
  return self->_libraryName != 0;
}

@end