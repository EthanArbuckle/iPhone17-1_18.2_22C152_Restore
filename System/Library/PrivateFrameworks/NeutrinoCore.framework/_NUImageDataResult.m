@interface _NUImageDataResult
- (NSDictionary)data;
- (NSString)description;
- (NUImageGeometry)geometry;
- (void)setData:(id)a3;
- (void)setGeometry:(id)a3;
@end

@implementation _NUImageDataResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setGeometry:(id)a3
{
}

- (NUImageGeometry)geometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 24, 1);
}

- (void)setData:(id)a3
{
}

- (NSDictionary)data
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_NUImageDataResult *)self data];
  v6 = [v3 stringWithFormat:@"<%@:%p> data=%@", v4, self, v5];

  return (NSString *)v6;
}

@end