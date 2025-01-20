@interface _SVDMutableSpeakerCapability
- (int64_t)qualityScore;
- (int64_t)status;
- (void)setQualityScore:(int64_t)a3;
- (void)setStatus:(int64_t)a3;
- (void)setSupportStatus:(int64_t)a3;
@end

@implementation _SVDMutableSpeakerCapability

- (int64_t)qualityScore
{
  return self->_qualityScore;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setQualityScore:(int64_t)a3
{
  self->_qualityScore = a3;
}

- (void)setSupportStatus:(int64_t)a3
{
  self->_status = a3;
}

@end