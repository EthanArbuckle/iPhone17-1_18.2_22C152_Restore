@interface TTSApplebetMapperPhonemeInfo
- (NSNumber)endTime;
- (NSNumber)startTime;
- (NSString)phoneme;
- (void)setEndTime:(id)a3;
- (void)setPhoneme:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation TTSApplebetMapperPhonemeInfo

- (NSNumber)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (NSNumber)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
}

- (NSString)phoneme
{
  return self->_phoneme;
}

- (void)setPhoneme:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneme, 0);
  objc_storeStrong((id *)&self->_endTime, 0);

  objc_storeStrong((id *)&self->_startTime, 0);
}

@end