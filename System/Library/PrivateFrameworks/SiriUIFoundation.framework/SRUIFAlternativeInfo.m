@interface SRUIFAlternativeInfo
- (NSNumber)combinedRank;
- (NSNumber)combinedScore;
- (NSNumber)isFromDevice;
- (NSNumber)originalRank;
- (NSNumber)originalScore;
- (void)setCombinedRank:(id)a3;
- (void)setCombinedScore:(id)a3;
- (void)setIsFromDevice:(id)a3;
- (void)setOriginalRank:(id)a3;
- (void)setOriginalScore:(id)a3;
@end

@implementation SRUIFAlternativeInfo

- (NSNumber)combinedRank
{
  return self->_combinedRank;
}

- (void)setCombinedRank:(id)a3
{
}

- (NSNumber)combinedScore
{
  return self->_combinedScore;
}

- (void)setCombinedScore:(id)a3
{
}

- (NSNumber)isFromDevice
{
  return self->_isFromDevice;
}

- (void)setIsFromDevice:(id)a3
{
}

- (NSNumber)originalRank
{
  return self->_originalRank;
}

- (void)setOriginalRank:(id)a3
{
}

- (NSNumber)originalScore
{
  return self->_originalScore;
}

- (void)setOriginalScore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalScore, 0);
  objc_storeStrong((id *)&self->_originalRank, 0);
  objc_storeStrong((id *)&self->_isFromDevice, 0);
  objc_storeStrong((id *)&self->_combinedScore, 0);
  objc_storeStrong((id *)&self->_combinedRank, 0);
}

@end