@interface NSURL(REMPaths_Additions)
- (uint64_t)rem_URLByAppendingReminderDataContainerPathComponent;
@end

@implementation NSURL(REMPaths_Additions)

- (uint64_t)rem_URLByAppendingReminderDataContainerPathComponent
{
  return [a1 URLByAppendingPathComponent:@"Container_v1/"];
}

@end