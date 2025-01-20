@interface _NUFlexRangeChannelProperties
- (NSString)description;
- (float)alternateOffset;
- (float)baseOffset;
- (float)gamma;
- (float)max;
- (float)min;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAlternateOffset:(float)a3;
- (void)setBaseOffset:(float)a3;
- (void)setGamma:(float)a3;
- (void)setMax:(float)a3;
- (void)setMin:(float)a3;
@end

@implementation _NUFlexRangeChannelProperties

- (void)setAlternateOffset:(float)a3
{
  self->_alternateOffset = a3;
}

- (float)alternateOffset
{
  return self->_alternateOffset;
}

- (void)setBaseOffset:(float)a3
{
  self->_baseOffset = a3;
}

- (float)baseOffset
{
  return self->_baseOffset;
}

- (void)setGamma:(float)a3
{
  self->_gamma = a3;
}

- (float)gamma
{
  return self->_gamma;
}

- (void)setMax:(float)a3
{
  self->_max = a3;
}

- (float)max
{
  return self->_max;
}

- (void)setMin:(float)a3
{
  self->_min = a3;
}

- (float)min
{
  return self->_min;
}

- (NSString)description
{
  v3 = NSString;
  [(_NUFlexRangeChannelProperties *)self min];
  double v5 = v4;
  [(_NUFlexRangeChannelProperties *)self min];
  double v7 = exp2f(v6);
  [(_NUFlexRangeChannelProperties *)self max];
  double v9 = v8;
  [(_NUFlexRangeChannelProperties *)self max];
  double v11 = exp2f(v10);
  [(_NUFlexRangeChannelProperties *)self gamma];
  double v13 = v12;
  [(_NUFlexRangeChannelProperties *)self alternateOffset];
  double v15 = v14;
  [(_NUFlexRangeChannelProperties *)self baseOffset];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"[min:%0.3f(%0.3f) max:%0.3f(%0.3f) gamma:%0.3f kA:%g kB:%g]", *(void *)&v5, *(void *)&v7, *(void *)&v9, *(void *)&v11, *(void *)&v13, *(void *)&v15, v16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = +[_NUFlexRangeChannelProperties allocWithZone:a3];
  *((_DWORD *)result + 2) = LODWORD(self->_min);
  *((_DWORD *)result + 3) = LODWORD(self->_max);
  *((_DWORD *)result + 4) = LODWORD(self->_gamma);
  *((_DWORD *)result + 5) = LODWORD(self->_baseOffset);
  *((_DWORD *)result + 6) = LODWORD(self->_alternateOffset);
  return result;
}

@end