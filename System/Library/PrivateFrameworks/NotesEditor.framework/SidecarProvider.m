@interface SidecarProvider
- (SidecarRequest)activeRequest;
- (void)setActiveRequest:(id)a3;
@end

@implementation SidecarProvider

- (SidecarRequest)activeRequest
{
  return (SidecarRequest *)*(id *)&self->activeRequest[7];
}

- (void)setActiveRequest:(id)a3
{
  id v4 = *(id *)&self->activeRequest[7];
  *(void *)&self->activeRequest[7] = a3;
  id v3 = a3;
}

@end