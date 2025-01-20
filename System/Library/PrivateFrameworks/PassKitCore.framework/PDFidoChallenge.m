@interface PDFidoChallenge
- (NSString)challenge;
- (PKFidoProfile)profile;
- (double)createdAt;
- (void)setChallenge:(id)a3;
- (void)setCreatedAt:(double)a3;
- (void)setProfile:(id)a3;
@end

@implementation PDFidoChallenge

- (PKFidoProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSString)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (double)createdAt
{
  return self->_createdAt;
}

- (void)setCreatedAt:(double)a3
{
  self->_createdAt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end