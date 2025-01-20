@interface _NUImageRenderResult
- (NUImageGeometry)geometry;
- (NURegion)region;
- (void)setGeometry:(id)a3;
- (void)setRegion:(id)a3;
@end

@implementation _NUImageRenderResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);

  objc_storeStrong((id *)&self->_region, 0);
}

- (void)setGeometry:(id)a3
{
}

- (NUImageGeometry)geometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegion:(id)a3
{
}

- (NURegion)region
{
  return (NURegion *)objc_getProperty(self, a2, 16, 1);
}

@end