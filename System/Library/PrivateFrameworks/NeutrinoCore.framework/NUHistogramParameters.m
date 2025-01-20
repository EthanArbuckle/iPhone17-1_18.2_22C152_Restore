@interface NUHistogramParameters
- ($6DEFAE59D8B0B490C28D581BBA01C329)colorMatrix;
- (NUHistogramParameters)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setColorMatrix:(id *)a3;
@end

@implementation NUHistogramParameters

- (void)setColorMatrix:(id *)a3
{
}

- ($6DEFAE59D8B0B490C28D581BBA01C329)colorMatrix
{
  objc_copyStruct(retstr, &self->_colorMatrix, 64, 1, 0);
  return result;
}

- (id)description
{
  v3 = [NSString stringWithFormat:@" [0] = {%.3f, %f, %.3f, %.3f} [1] = {%.3f, %f, %.3f, %.3f} [2] = {%.3f, %f, %.3f, %.3f} [3] = {%.3f, %f, %.3f, %.3f}", self->_colorMatrix.r.r, self->_colorMatrix.r.g, self->_colorMatrix.r.b, self->_colorMatrix.r.a, self->_colorMatrix.g.r, self->_colorMatrix.g.g, self->_colorMatrix.g.b, self->_colorMatrix.g.a, self->_colorMatrix.b.r, self->_colorMatrix.b.g, self->_colorMatrix.b.b, self->_colorMatrix.b.a, self->_colorMatrix.a.r, self->_colorMatrix.a.g, self->_colorMatrix.a.b, self->_colorMatrix.a.a];
  v4 = [NSString stringWithFormat:@"<%@:%p colorMatrix:%@ >", objc_opt_class(), self, v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  $43F634250C0E94E2A09AB0840E4770D1 g = self->_colorMatrix.g;
  $43F634250C0E94E2A09AB0840E4770D1 b = self->_colorMatrix.b;
  $43F634250C0E94E2A09AB0840E4770D1 a = self->_colorMatrix.a;
  *($43F634250C0E94E2A09AB0840E4770D1 *)((char *)result + 8) = self->_colorMatrix.r;
  *($43F634250C0E94E2A09AB0840E4770D1 *)((char *)result + 56) = a;
  *($43F634250C0E94E2A09AB0840E4770D1 *)((char *)result + 40) = b;
  *($43F634250C0E94E2A09AB0840E4770D1 *)((char *)result + 24) = g;
  return result;
}

- (NUHistogramParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)NUHistogramParameters;
  id result = [(NUHistogramParameters *)&v3 init];
  result->_colorMatrix.r = ($43F634250C0E94E2A09AB0840E4770D1)NUStandardLuminanceColorMatrix;
  result->_colorMatrix.$43F634250C0E94E2A09AB0840E4770D1 g = ($43F634250C0E94E2A09AB0840E4770D1)unk_1A9A746E0;
  result->_colorMatrix.$43F634250C0E94E2A09AB0840E4770D1 b = ($43F634250C0E94E2A09AB0840E4770D1)xmmword_1A9A746F0;
  result->_colorMatrix.$43F634250C0E94E2A09AB0840E4770D1 a = ($43F634250C0E94E2A09AB0840E4770D1)unk_1A9A74700;
  return result;
}

@end