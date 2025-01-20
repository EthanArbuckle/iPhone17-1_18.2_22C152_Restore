@interface MXStreamingSpeechProfileBegin
- (BOOL)hasLocale;
- (BOOL)hasPhoneSetVersion;
- (BOOL)hasRequestId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)locale;
- (NSString)phoneSetVersion;
- (NSString)requestId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLocale:(id)a3;
- (void)setPhoneSetVersion:(id)a3;
- (void)setRequestId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXStreamingSpeechProfileBegin

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasPhoneSetVersion
{
  return self->_phoneSetVersion != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXStreamingSpeechProfileBegin;
  v4 = [(MXStreamingSpeechProfileBegin *)&v8 description];
  v5 = [(MXStreamingSpeechProfileBegin *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  requestId = self->_requestId;
  if (requestId) {
    [v3 setObject:requestId forKey:@"request_id"];
  }
  locale = self->_locale;
  if (locale) {
    [v4 setObject:locale forKey:@"locale"];
  }
  phoneSetVersion = self->_phoneSetVersion;
  if (phoneSetVersion) {
    [v4 setObject:phoneSetVersion forKey:@"phone_set_version"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXStreamingSpeechProfileBeginReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_locale)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_phoneSetVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_requestId)
  {
    objc_msgSend(v4, "setRequestId:");
    id v4 = v5;
  }
  if (self->_locale)
  {
    objc_msgSend(v5, "setLocale:");
    id v4 = v5;
  }
  if (self->_phoneSetVersion)
  {
    objc_msgSend(v5, "setPhoneSetVersion:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestId copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_locale copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_phoneSetVersion copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[3]))
     || -[NSString isEqual:](requestId, "isEqual:"))
    && ((locale = self->_locale, !((unint64_t)locale | v4[1]))
     || -[NSString isEqual:](locale, "isEqual:")))
  {
    phoneSetVersion = self->_phoneSetVersion;
    if ((unint64_t)phoneSetVersion | v4[2]) {
      char v8 = -[NSString isEqual:](phoneSetVersion, "isEqual:");
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

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestId hash];
  NSUInteger v4 = [(NSString *)self->_locale hash] ^ v3;
  return v4 ^ [(NSString *)self->_phoneSetVersion hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[MXStreamingSpeechProfileBegin setRequestId:](self, "setRequestId:");
  }
  if (v4[1]) {
    -[MXStreamingSpeechProfileBegin setLocale:](self, "setLocale:");
  }
  if (v4[2]) {
    -[MXStreamingSpeechProfileBegin setPhoneSetVersion:](self, "setPhoneSetVersion:");
  }
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)phoneSetVersion
{
  return self->_phoneSetVersion;
}

- (void)setPhoneSetVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_phoneSetVersion, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end