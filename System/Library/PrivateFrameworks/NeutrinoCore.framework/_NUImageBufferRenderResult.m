@interface _NUImageBufferRenderResult
- (NSString)debugDescription;
- (NUStorageImageBuffer)buffer;
- (void)setBuffer:(id)a3;
@end

@implementation _NUImageBufferRenderResult

- (void).cxx_destruct
{
}

- (void)setBuffer:(id)a3
{
}

- (NUStorageImageBuffer)buffer
{
  return (NUStorageImageBuffer *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_NUImageRenderResult *)self region];
  v6 = [(_NUImageBufferRenderResult *)self buffer];
  v7 = [(_NUImageRenderResult *)self geometry];
  v8 = [v3 stringWithFormat:@"<%@: %p> region=%@, buffer=%@, geometry=%@", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

@end