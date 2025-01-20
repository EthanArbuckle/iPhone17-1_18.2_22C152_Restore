@interface NTPBScoreProfiles
- (BOOL)hasDefaultScoreProfile;
- (BOOL)hasForYouGroupScoreProfile;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NTPBScoreProfile)defaultScoreProfile;
- (NTPBScoreProfile)forYouGroupScoreProfile;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDefaultScoreProfile:(id)a3;
- (void)setForYouGroupScoreProfile:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBScoreProfiles

- (void)dealloc
{
  [(NTPBScoreProfiles *)self setDefaultScoreProfile:0];
  [(NTPBScoreProfiles *)self setForYouGroupScoreProfile:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBScoreProfiles;
  [(NTPBScoreProfiles *)&v3 dealloc];
}

- (BOOL)hasDefaultScoreProfile
{
  return self->_defaultScoreProfile != 0;
}

- (BOOL)hasForYouGroupScoreProfile
{
  return self->_forYouGroupScoreProfile != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBScoreProfiles;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBScoreProfiles description](&v3, sel_description), -[NTPBScoreProfiles dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  defaultScoreProfile = self->_defaultScoreProfile;
  if (defaultScoreProfile) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBScoreProfile dictionaryRepresentation](defaultScoreProfile, "dictionaryRepresentation"), @"defaultScoreProfile");
  }
  forYouGroupScoreProfile = self->_forYouGroupScoreProfile;
  if (forYouGroupScoreProfile) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBScoreProfile dictionaryRepresentation](forYouGroupScoreProfile, "dictionaryRepresentation"), @"forYouGroupScoreProfile");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBScoreProfilesReadFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_defaultScoreProfile) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_forYouGroupScoreProfile)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = [(NTPBScoreProfile *)self->_defaultScoreProfile copyWithZone:a3];
  v5[2] = [(NTPBScoreProfile *)self->_forYouGroupScoreProfile copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    defaultScoreProfile = self->_defaultScoreProfile;
    if (!((unint64_t)defaultScoreProfile | *((void *)a3 + 1))
      || (int v5 = -[NTPBScoreProfile isEqual:](defaultScoreProfile, "isEqual:")) != 0)
    {
      forYouGroupScoreProfile = self->_forYouGroupScoreProfile;
      if ((unint64_t)forYouGroupScoreProfile | *((void *)a3 + 2))
      {
        LOBYTE(v5) = -[NTPBScoreProfile isEqual:](forYouGroupScoreProfile, "isEqual:");
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
  unint64_t v3 = [(NTPBScoreProfile *)self->_defaultScoreProfile hash];
  return [(NTPBScoreProfile *)self->_forYouGroupScoreProfile hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  defaultScoreProfile = self->_defaultScoreProfile;
  uint64_t v6 = *((void *)a3 + 1);
  if (defaultScoreProfile)
  {
    if (v6) {
      -[NTPBScoreProfile mergeFrom:](defaultScoreProfile, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBScoreProfiles setDefaultScoreProfile:](self, "setDefaultScoreProfile:");
  }
  forYouGroupScoreProfile = self->_forYouGroupScoreProfile;
  uint64_t v8 = *((void *)a3 + 2);
  if (forYouGroupScoreProfile)
  {
    if (v8)
    {
      -[NTPBScoreProfile mergeFrom:](forYouGroupScoreProfile, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBScoreProfiles setForYouGroupScoreProfile:](self, "setForYouGroupScoreProfile:");
  }
}

- (NTPBScoreProfile)defaultScoreProfile
{
  return self->_defaultScoreProfile;
}

- (void)setDefaultScoreProfile:(id)a3
{
}

- (NTPBScoreProfile)forYouGroupScoreProfile
{
  return self->_forYouGroupScoreProfile;
}

- (void)setForYouGroupScoreProfile:(id)a3
{
}

@end