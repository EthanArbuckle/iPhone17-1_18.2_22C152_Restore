@interface TCMPSInstanceNormDataLoaderProps
- (MPSCNNNormalizationGammaAndBetaState)state;
- (MPSVector)betaMomentumVector;
- (MPSVector)betaVector;
- (MPSVector)betaVelocityVector;
- (MPSVector)gammaMomentumVector;
- (MPSVector)gammaVector;
- (MPSVector)gammaVelocityVector;
- (MTLBuffer)betaBuffer;
- (MTLBuffer)betaMomentumBuffer;
- (MTLBuffer)betaVelocityBuffer;
- (MTLBuffer)gammaBuffer;
- (MTLBuffer)gammaMomentumBuffer;
- (MTLBuffer)gammaVelocityBuffer;
- (MTLBuffer)movingMeanBuffer;
- (MTLBuffer)movingVarianceBuffer;
- (void)setBetaBuffer:(id)a3;
- (void)setBetaMomentumBuffer:(id)a3;
- (void)setBetaMomentumVector:(id)a3;
- (void)setBetaVector:(id)a3;
- (void)setBetaVelocityBuffer:(id)a3;
- (void)setBetaVelocityVector:(id)a3;
- (void)setGammaBuffer:(id)a3;
- (void)setGammaMomentumBuffer:(id)a3;
- (void)setGammaMomentumVector:(id)a3;
- (void)setGammaVector:(id)a3;
- (void)setGammaVelocityBuffer:(id)a3;
- (void)setGammaVelocityVector:(id)a3;
- (void)setMovingMeanBuffer:(id)a3;
- (void)setMovingVarianceBuffer:(id)a3;
- (void)setState:(id)a3;
@end

@implementation TCMPSInstanceNormDataLoaderProps

- (MPSVector)gammaVector
{
  return self->_gammaVector;
}

- (void)setGammaVector:(id)a3
{
}

- (MPSVector)betaVector
{
  return self->_betaVector;
}

- (void)setBetaVector:(id)a3
{
}

- (MPSVector)gammaMomentumVector
{
  return self->_gammaMomentumVector;
}

- (void)setGammaMomentumVector:(id)a3
{
}

- (MPSVector)gammaVelocityVector
{
  return self->_gammaVelocityVector;
}

- (void)setGammaVelocityVector:(id)a3
{
}

- (MPSVector)betaMomentumVector
{
  return self->_betaMomentumVector;
}

- (void)setBetaMomentumVector:(id)a3
{
}

- (MPSVector)betaVelocityVector
{
  return self->_betaVelocityVector;
}

- (void)setBetaVelocityVector:(id)a3
{
}

- (MTLBuffer)movingMeanBuffer
{
  return self->_movingMeanBuffer;
}

- (void)setMovingMeanBuffer:(id)a3
{
}

- (MTLBuffer)movingVarianceBuffer
{
  return self->_movingVarianceBuffer;
}

- (void)setMovingVarianceBuffer:(id)a3
{
}

- (MTLBuffer)gammaMomentumBuffer
{
  return self->_gammaMomentumBuffer;
}

- (void)setGammaMomentumBuffer:(id)a3
{
}

- (MTLBuffer)gammaVelocityBuffer
{
  return self->_gammaVelocityBuffer;
}

- (void)setGammaVelocityBuffer:(id)a3
{
}

- (MTLBuffer)betaMomentumBuffer
{
  return self->_betaMomentumBuffer;
}

- (void)setBetaMomentumBuffer:(id)a3
{
}

- (MTLBuffer)betaVelocityBuffer
{
  return self->_betaVelocityBuffer;
}

- (void)setBetaVelocityBuffer:(id)a3
{
}

- (MTLBuffer)gammaBuffer
{
  return self->_gammaBuffer;
}

- (void)setGammaBuffer:(id)a3
{
}

- (MTLBuffer)betaBuffer
{
  return self->_betaBuffer;
}

- (void)setBetaBuffer:(id)a3
{
}

- (MPSCNNNormalizationGammaAndBetaState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_betaBuffer, 0);
  objc_storeStrong((id *)&self->_gammaBuffer, 0);
  objc_storeStrong((id *)&self->_betaVelocityBuffer, 0);
  objc_storeStrong((id *)&self->_betaMomentumBuffer, 0);
  objc_storeStrong((id *)&self->_gammaVelocityBuffer, 0);
  objc_storeStrong((id *)&self->_gammaMomentumBuffer, 0);
  objc_storeStrong((id *)&self->_movingVarianceBuffer, 0);
  objc_storeStrong((id *)&self->_movingMeanBuffer, 0);
  objc_storeStrong((id *)&self->_betaVelocityVector, 0);
  objc_storeStrong((id *)&self->_betaMomentumVector, 0);
  objc_storeStrong((id *)&self->_gammaVelocityVector, 0);
  objc_storeStrong((id *)&self->_gammaMomentumVector, 0);
  objc_storeStrong((id *)&self->_betaVector, 0);
  objc_storeStrong((id *)&self->_gammaVector, 0);
}

@end