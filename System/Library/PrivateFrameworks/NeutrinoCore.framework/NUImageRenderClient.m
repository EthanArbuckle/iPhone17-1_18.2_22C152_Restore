@interface NUImageRenderClient
- (id)description;
@end

@implementation NUImageRenderClient

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NURenderClient *)self name];
  v6 = [v3 stringWithFormat:@"<%@:%p '%@'>", v4, self, v5];

  return v6;
}

@end