@interface _NUExportResult
- (NSURL)destinationURL;
- (NUImageGeometry)geometry;
- (void)setDestinationURL:(id)a3;
- (void)setGeometry:(id)a3;
@end

@implementation _NUExportResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);

  objc_storeStrong((id *)&self->_destinationURL, 0);
}

- (void)setGeometry:(id)a3
{
}

- (NUImageGeometry)geometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDestinationURL:(id)a3
{
}

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

@end