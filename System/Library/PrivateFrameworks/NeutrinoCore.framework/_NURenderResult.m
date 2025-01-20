@interface _NURenderResult
- (NURenderStatistics)statistics;
- (void)setStatistics:(id)a3;
@end

@implementation _NURenderResult

- (void).cxx_destruct
{
}

- (void)setStatistics:(id)a3
{
}

- (NURenderStatistics)statistics
{
  return (NURenderStatistics *)objc_getProperty(self, a2, 8, 1);
}

@end