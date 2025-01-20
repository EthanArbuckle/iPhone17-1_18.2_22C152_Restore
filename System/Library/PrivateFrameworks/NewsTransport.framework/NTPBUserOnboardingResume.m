@interface NTPBUserOnboardingResume
- (BOOL)hasOnboardResumeStage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)onboardResumeStage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setOnboardResumeStage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBUserOnboardingResume

- (BOOL)hasOnboardResumeStage
{
  return self->_onboardResumeStage != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBUserOnboardingResume;
  v4 = [(NTPBUserOnboardingResume *)&v8 description];
  v5 = [(NTPBUserOnboardingResume *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  onboardResumeStage = self->_onboardResumeStage;
  if (onboardResumeStage) {
    [v3 setObject:onboardResumeStage forKey:@"onboard_resume_stage"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserOnboardingResumeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_onboardResumeStage) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_onboardResumeStage copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    onboardResumeStage = self->_onboardResumeStage;
    if ((unint64_t)onboardResumeStage | v4[1]) {
      char v6 = -[NSString isEqual:](onboardResumeStage, "isEqual:");
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

- (unint64_t)hash
{
  return [(NSString *)self->_onboardResumeStage hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NTPBUserOnboardingResume setOnboardResumeStage:](self, "setOnboardResumeStage:");
  }
}

- (NSString)onboardResumeStage
{
  return self->_onboardResumeStage;
}

- (void)setOnboardResumeStage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end