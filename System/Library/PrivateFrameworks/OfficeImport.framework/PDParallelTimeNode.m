@interface PDParallelTimeNode
- (PDParallelTimeNodeBuildInfo)buildInfo;
- (void)setBuildInfo:(id)a3;
@end

@implementation PDParallelTimeNode

- (PDParallelTimeNodeBuildInfo)buildInfo
{
  return (PDParallelTimeNodeBuildInfo *)objc_getProperty(self, a2, 176, 1);
}

- (void)setBuildInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end