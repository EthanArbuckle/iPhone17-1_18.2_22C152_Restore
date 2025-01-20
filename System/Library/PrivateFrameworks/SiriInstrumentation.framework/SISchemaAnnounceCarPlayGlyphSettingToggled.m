@interface SISchemaAnnounceCarPlayGlyphSettingToggled
- (BOOL)announcementsMuted;
- (BOOL)hasAnnouncementsMuted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaAnnounceCarPlayGlyphSettingToggled)initWithDictionary:(id)a3;
- (SISchemaAnnounceCarPlayGlyphSettingToggled)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAnnouncementsMuted;
- (void)setAnnouncementsMuted:(BOOL)a3;
- (void)setHasAnnouncementsMuted:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaAnnounceCarPlayGlyphSettingToggled

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)announcementsMuted
{
  return self->_announcementsMuted;
}

- (SISchemaAnnounceCarPlayGlyphSettingToggled)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SISchemaAnnounceCarPlayGlyphSettingToggled;
  v5 = [(SISchemaAnnounceCarPlayGlyphSettingToggled *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"announcementsMuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaAnnounceCarPlayGlyphSettingToggled setAnnouncementsMuted:](v5, "setAnnouncementsMuted:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (SISchemaAnnounceCarPlayGlyphSettingToggled)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaAnnounceCarPlayGlyphSettingToggled *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaAnnounceCarPlayGlyphSettingToggled *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(&self->_announcementsMuted + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaAnnounceCarPlayGlyphSettingToggled announcementsMuted](self, "announcementsMuted"));
    [v3 setObject:v4 forKeyedSubscript:@"announcementsMuted"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_announcementsMuted + 1)) {
    return 2654435761 * self->_announcementsMuted;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if (*(&self->_announcementsMuted + 1) == (v4[9] & 1))
    {
      if (!*(&self->_announcementsMuted + 1)
        || (int announcementsMuted = self->_announcementsMuted,
            announcementsMuted == [v4 announcementsMuted]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_announcementsMuted + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaAnnounceCarPlayGlyphSettingToggledReadFrom(self, (uint64_t)a3);
}

- (void)deleteAnnouncementsMuted
{
  *(&self->_announcementsMuted + 1) &= ~1u;
}

- (void)setHasAnnouncementsMuted:(BOOL)a3
{
  *(&self->_announcementsMuted + 1) = *(&self->_announcementsMuted + 1) & 0xFE | a3;
}

- (BOOL)hasAnnouncementsMuted
{
  return *(&self->_announcementsMuted + 1);
}

- (void)setAnnouncementsMuted:(BOOL)a3
{
  *(&self->_announcementsMuted + 1) |= 1u;
  self->_int announcementsMuted = a3;
}

@end