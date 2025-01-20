@interface _NUGeometryResult
- (NSString)description;
- (NUImageGeometry)geometry;
- (void)setGeometry:(id)a3;
@end

@implementation _NUGeometryResult

- (void).cxx_destruct
{
}

- (void)setGeometry:(id)a3
{
}

- (NUImageGeometry)geometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_NUGeometryResult *)self geometry];
  uint64_t v6 = [v5 description];
  v7 = (void *)v6;
  v8 = @"NONE";
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v9 = [v3 stringWithFormat:@"<%@:%p> geometry=%@", v4, self, v8];

  return (NSString *)v9;
}

@end