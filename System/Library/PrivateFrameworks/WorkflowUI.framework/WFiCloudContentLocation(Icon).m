@interface WFiCloudContentLocation(Icon)
- (id)icon;
@end

@implementation WFiCloudContentLocation(Icon)

- (id)icon
{
  id v0 = objc_alloc(MEMORY[0x263F85310]);
  v1 = (void *)MEMORY[0x263F85308];
  v2 = [MEMORY[0x263F086E0] workflowUI];
  v3 = [v1 imageNamed:@"iCloudIcon" inBundle:v2];
  v4 = (void *)[v0 initWithImage:v3];

  return v4;
}

@end