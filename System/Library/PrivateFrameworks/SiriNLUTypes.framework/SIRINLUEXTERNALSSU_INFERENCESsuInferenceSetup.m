@interface SIRINLUEXTERNALSSU_INFERENCESsuInferenceSetup
- (BOOL)hasLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)locale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLocale:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALSSU_INFERENCESsuInferenceSetup

- (void).cxx_destruct
{
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[SIRINLUEXTERNALSSU_INFERENCESsuInferenceSetup setLocale:](self, "setLocale:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_locale hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    locale = self->_locale;
    if ((unint64_t)locale | v4[1]) {
      char v6 = -[NSString isEqual:](locale, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_locale copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  locale = self->_locale;
  if (locale) {
    [a3 setLocale:locale];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSSU_INFERENCESsuInferenceSetupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  locale = self->_locale;
  if (locale) {
    [v3 setObject:locale forKey:@"locale"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALSSU_INFERENCESsuInferenceSetup;
  v4 = [(SIRINLUEXTERNALSSU_INFERENCESsuInferenceSetup *)&v8 description];
  v5 = [(SIRINLUEXTERNALSSU_INFERENCESsuInferenceSetup *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

@end