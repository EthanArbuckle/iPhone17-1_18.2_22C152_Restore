@interface CRCTCCVNLPTextDecoderCandidateIntermediateFeatureInfo
@end

@implementation CRCTCCVNLPTextDecoderCandidateIntermediateFeatureInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenPermutation, 0);
  objc_storeStrong((id *)&self->_ranges, 0);
  objc_storeStrong((id *)&self->_decodedString, 0);
}

@end