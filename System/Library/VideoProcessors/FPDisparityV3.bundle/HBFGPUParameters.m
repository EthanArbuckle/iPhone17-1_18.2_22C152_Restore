@interface HBFGPUParameters
- (float)conf_max;
- (float)conf_min;
- (float)occ_thres;
- (float)sigma_0;
- (float)sigma_1;
- (float)sigma_2;
- (float)sigma_w;
- (int)iterations;
- (int)padding;
- (int)radius;
- (int)scales;
- (void)setConf_max:(float)a3;
- (void)setConf_min:(float)a3;
- (void)setIterations:(int)a3;
- (void)setOcc_thres:(float)a3;
- (void)setPadding:(int)a3;
- (void)setRadius:(int)a3;
- (void)setScales:(int)a3;
- (void)setSigma_0:(float)a3;
- (void)setSigma_1:(float)a3;
- (void)setSigma_2:(float)a3;
- (void)setSigma_w:(float)a3;
@end

@implementation HBFGPUParameters

- (int)iterations
{
  return self->_iterations;
}

- (void)setIterations:(int)a3
{
  self->_iterations = a3;
}

- (int)scales
{
  return self->_scales;
}

- (void)setScales:(int)a3
{
  self->_scales = a3;
}

- (int)radius
{
  return self->_radius;
}

- (void)setRadius:(int)a3
{
  self->_radius = a3;
}

- (int)padding
{
  return self->_padding;
}

- (void)setPadding:(int)a3
{
  self->_padding = a3;
}

- (float)sigma_0
{
  return self->_sigma_0;
}

- (void)setSigma_0:(float)a3
{
  self->_sigma_0 = a3;
}

- (float)sigma_1
{
  return self->_sigma_1;
}

- (void)setSigma_1:(float)a3
{
  self->_sigma_1 = a3;
}

- (float)sigma_2
{
  return self->_sigma_2;
}

- (void)setSigma_2:(float)a3
{
  self->_sigma_2 = a3;
}

- (float)sigma_w
{
  return self->_sigma_w;
}

- (void)setSigma_w:(float)a3
{
  self->_sigma_w = a3;
}

- (float)conf_min
{
  return self->_conf_min;
}

- (void)setConf_min:(float)a3
{
  self->_conf_min = a3;
}

- (float)conf_max
{
  return self->_conf_max;
}

- (void)setConf_max:(float)a3
{
  self->_conf_max = a3;
}

- (float)occ_thres
{
  return self->_occ_thres;
}

- (void)setOcc_thres:(float)a3
{
  self->_occ_thres = a3;
}

@end