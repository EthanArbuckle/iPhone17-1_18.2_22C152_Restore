@interface SIRINLUEXTERNALNLU_ROUTERPommesResponse
- (BOOL)hasMetadataDomainName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)metadataDomainName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMetadataDomainName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLU_ROUTERPommesResponse

- (void).cxx_destruct
{
}

- (void)setMetadataDomainName:(id)a3
{
}

- (NSString)metadataDomainName
{
  return self->_metadataDomainName;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[SIRINLUEXTERNALNLU_ROUTERPommesResponse setMetadataDomainName:](self, "setMetadataDomainName:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_metadataDomainName hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    metadataDomainName = self->_metadataDomainName;
    if ((unint64_t)metadataDomainName | v4[1]) {
      char v6 = -[NSString isEqual:](metadataDomainName, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_metadataDomainName copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  metadataDomainName = self->_metadataDomainName;
  if (metadataDomainName) {
    [a3 setMetadataDomainName:metadataDomainName];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_metadataDomainName) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERPommesResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  metadataDomainName = self->_metadataDomainName;
  if (metadataDomainName) {
    [v3 setObject:metadataDomainName forKey:@"metadata_domain_name"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERPommesResponse;
  v4 = [(SIRINLUEXTERNALNLU_ROUTERPommesResponse *)&v8 description];
  v5 = [(SIRINLUEXTERNALNLU_ROUTERPommesResponse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMetadataDomainName
{
  return self->_metadataDomainName != 0;
}

@end