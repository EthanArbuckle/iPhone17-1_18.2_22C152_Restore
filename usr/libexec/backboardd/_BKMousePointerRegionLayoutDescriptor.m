@interface _BKMousePointerRegionLayoutDescriptor
- (BKMousePointerRegion)region;
- (BKMousePointerRegion)relativeRegion;
- (_BKMousePointerRegionLayoutDescriptor)initWithRegion:(id)a3 relativeRegion:(id)a4 edge:(unsigned int)a5 edgePosition:(double)a6;
- (double)edgePosition;
- (unsigned)edge;
@end

@implementation _BKMousePointerRegionLayoutDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeRegion, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

- (double)edgePosition
{
  return self->_edgePosition;
}

- (unsigned)edge
{
  return self->_edge;
}

- (BKMousePointerRegion)relativeRegion
{
  return self->_relativeRegion;
}

- (BKMousePointerRegion)region
{
  return self->_region;
}

- (_BKMousePointerRegionLayoutDescriptor)initWithRegion:(id)a3 relativeRegion:(id)a4 edge:(unsigned int)a5 edgePosition:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_BKMousePointerRegionLayoutDescriptor;
  v13 = [(_BKMousePointerRegionLayoutDescriptor *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_region, a3);
    objc_storeStrong((id *)&v14->_relativeRegion, a4);
    v14->_edge = a5;
    v14->_edgePosition = a6;
  }

  return v14;
}

@end