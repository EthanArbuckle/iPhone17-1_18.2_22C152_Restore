@interface PNPersonPromoterProfile
- (PNPersonPromoterProfile)init;
- (double)highlyInterestingPersonFacesCumulativeNormalDistributionUpperTail;
- (double)highlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail;
- (double)highlyInterestingPersonLastSeenCumulativeNormalDistributionUpperTail;
- (double)highlyInterestingPersonMomentsCumulativeNormalDistributionUpperTail;
- (double)highlyInterestingPersonTimeCumulativeNormalDistributionUpperTail;
- (double)interestingPersonFacesCumulativeNormalDistributionUpperTail;
- (double)interestingPersonFacesNormalDistributionSigmaFactor;
- (double)interestingPersonLastSeenCumulativeNormalDistributionLowerTail;
- (double)interestingPersonLastSeenCumulativeNormalDistributionUpperTail;
- (double)interestingPersonLastSeenNormalDistributionSigmaFactor;
- (double)interestingPersonMomentsCumulativeNormalDistributionUpperTail;
- (double)interestingPersonMomentsNormalDistributionSigmaFactor;
- (double)interestingPersonTimeCumulativeNormalDistributionUpperTail;
- (double)interestingPersonTimeNormalDistributionSigmaFactor;
- (unint64_t)highlyInterestingPersonNormalDistributionsToMatch;
- (unint64_t)interestingPersonNormalDistributionsToMatch;
- (void)setHighlyInterestingPersonFacesCumulativeNormalDistributionUpperTail:(double)a3;
- (void)setHighlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail:(double)a3;
- (void)setHighlyInterestingPersonLastSeenCumulativeNormalDistributionUpperTail:(double)a3;
- (void)setHighlyInterestingPersonMomentsCumulativeNormalDistributionUpperTail:(double)a3;
- (void)setHighlyInterestingPersonNormalDistributionsToMatch:(unint64_t)a3;
- (void)setHighlyInterestingPersonTimeCumulativeNormalDistributionUpperTail:(double)a3;
- (void)setInterestingPersonFacesCumulativeNormalDistributionUpperTail:(double)a3;
- (void)setInterestingPersonFacesNormalDistributionSigmaFactor:(double)a3;
- (void)setInterestingPersonLastSeenCumulativeNormalDistributionLowerTail:(double)a3;
- (void)setInterestingPersonLastSeenCumulativeNormalDistributionUpperTail:(double)a3;
- (void)setInterestingPersonLastSeenNormalDistributionSigmaFactor:(double)a3;
- (void)setInterestingPersonMomentsCumulativeNormalDistributionUpperTail:(double)a3;
- (void)setInterestingPersonMomentsNormalDistributionSigmaFactor:(double)a3;
- (void)setInterestingPersonNormalDistributionsToMatch:(unint64_t)a3;
- (void)setInterestingPersonTimeCumulativeNormalDistributionUpperTail:(double)a3;
- (void)setInterestingPersonTimeNormalDistributionSigmaFactor:(double)a3;
@end

@implementation PNPersonPromoterProfile

- (void)setHighlyInterestingPersonNormalDistributionsToMatch:(unint64_t)a3
{
  self->_highlyInterestingPersonNormalDistributionsToMatch = a3;
}

- (unint64_t)highlyInterestingPersonNormalDistributionsToMatch
{
  return self->_highlyInterestingPersonNormalDistributionsToMatch;
}

- (void)setInterestingPersonNormalDistributionsToMatch:(unint64_t)a3
{
  self->_interestingPersonNormalDistributionsToMatch = a3;
}

- (unint64_t)interestingPersonNormalDistributionsToMatch
{
  return self->_interestingPersonNormalDistributionsToMatch;
}

- (void)setHighlyInterestingPersonLastSeenCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_highlyInterestingPersonLastSeenCumulativeNormalDistributionUpperTail = a3;
}

- (double)highlyInterestingPersonLastSeenCumulativeNormalDistributionUpperTail
{
  return self->_highlyInterestingPersonLastSeenCumulativeNormalDistributionUpperTail;
}

- (void)setHighlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail:(double)a3
{
  self->_highlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail = a3;
}

- (double)highlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail
{
  return self->_highlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail;
}

- (void)setHighlyInterestingPersonTimeCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_highlyInterestingPersonTimeCumulativeNormalDistributionUpperTail = a3;
}

- (double)highlyInterestingPersonTimeCumulativeNormalDistributionUpperTail
{
  return self->_highlyInterestingPersonTimeCumulativeNormalDistributionUpperTail;
}

- (void)setHighlyInterestingPersonFacesCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_highlyInterestingPersonFacesCumulativeNormalDistributionUpperTail = a3;
}

- (double)highlyInterestingPersonFacesCumulativeNormalDistributionUpperTail
{
  return self->_highlyInterestingPersonFacesCumulativeNormalDistributionUpperTail;
}

- (void)setHighlyInterestingPersonMomentsCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_highlyInterestingPersonMomentsCumulativeNormalDistributionUpperTail = a3;
}

- (double)highlyInterestingPersonMomentsCumulativeNormalDistributionUpperTail
{
  return self->_highlyInterestingPersonMomentsCumulativeNormalDistributionUpperTail;
}

- (void)setInterestingPersonLastSeenCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_interestingPersonLastSeenCumulativeNormalDistributionUpperTail = a3;
}

- (double)interestingPersonLastSeenCumulativeNormalDistributionUpperTail
{
  return self->_interestingPersonLastSeenCumulativeNormalDistributionUpperTail;
}

- (void)setInterestingPersonLastSeenCumulativeNormalDistributionLowerTail:(double)a3
{
  self->_interestingPersonLastSeenCumulativeNormalDistributionLowerTail = a3;
}

- (double)interestingPersonLastSeenCumulativeNormalDistributionLowerTail
{
  return self->_interestingPersonLastSeenCumulativeNormalDistributionLowerTail;
}

- (void)setInterestingPersonLastSeenNormalDistributionSigmaFactor:(double)a3
{
  self->_interestingPersonLastSeenNormalDistributionSigmaFactor = a3;
}

- (double)interestingPersonLastSeenNormalDistributionSigmaFactor
{
  return self->_interestingPersonLastSeenNormalDistributionSigmaFactor;
}

- (void)setInterestingPersonTimeCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_interestingPersonTimeCumulativeNormalDistributionUpperTail = a3;
}

- (double)interestingPersonTimeCumulativeNormalDistributionUpperTail
{
  return self->_interestingPersonTimeCumulativeNormalDistributionUpperTail;
}

- (void)setInterestingPersonTimeNormalDistributionSigmaFactor:(double)a3
{
  self->_interestingPersonTimeNormalDistributionSigmaFactor = a3;
}

- (double)interestingPersonTimeNormalDistributionSigmaFactor
{
  return self->_interestingPersonTimeNormalDistributionSigmaFactor;
}

- (void)setInterestingPersonFacesCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_interestingPersonFacesCumulativeNormalDistributionUpperTail = a3;
}

- (double)interestingPersonFacesCumulativeNormalDistributionUpperTail
{
  return self->_interestingPersonFacesCumulativeNormalDistributionUpperTail;
}

- (void)setInterestingPersonFacesNormalDistributionSigmaFactor:(double)a3
{
  self->_interestingPersonFacesNormalDistributionSigmaFactor = a3;
}

- (double)interestingPersonFacesNormalDistributionSigmaFactor
{
  return self->_interestingPersonFacesNormalDistributionSigmaFactor;
}

- (void)setInterestingPersonMomentsCumulativeNormalDistributionUpperTail:(double)a3
{
  self->_interestingPersonMomentsCumulativeNormalDistributionUpperTail = a3;
}

- (double)interestingPersonMomentsCumulativeNormalDistributionUpperTail
{
  return self->_interestingPersonMomentsCumulativeNormalDistributionUpperTail;
}

- (void)setInterestingPersonMomentsNormalDistributionSigmaFactor:(double)a3
{
  self->_interestingPersonMomentsNormalDistributionSigmaFactor = a3;
}

- (double)interestingPersonMomentsNormalDistributionSigmaFactor
{
  return self->_interestingPersonMomentsNormalDistributionSigmaFactor;
}

- (PNPersonPromoterProfile)init
{
  v8.receiver = self;
  v8.super_class = (Class)PNPersonPromoterProfile;
  result = [(PNPersonPromoterProfile *)&v8 init];
  if (result)
  {
    *(_OWORD *)&result->_interestingPersonMomentsNormalDistributionSigmaFactor = xmmword_259898380;
    *(_OWORD *)&result->_interestingPersonFacesNormalDistributionSigmaFactor = xmmword_259898380;
    *(_OWORD *)&result->_interestingPersonTimeNormalDistributionSigmaFactor = xmmword_259898380;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_highlyInterestingPersonFacesCumulativeNormalDistributionUpperTail = _Q0;
    *(_OWORD *)&result->_interestingPersonLastSeenNormalDistributionSigmaFactor = xmmword_259898390;
    *(_OWORD *)&result->_interestingPersonLastSeenCumulativeNormalDistributionUpperTail = xmmword_2598983A0;
    *(_OWORD *)&result->_highlyInterestingPersonLastSeenCumulativeNormalDistributionLowerTail = xmmword_2598983B0;
    *(_OWORD *)&result->_interestingPersonNormalDistributionsToMatch = xmmword_259882640;
  }
  return result;
}

@end