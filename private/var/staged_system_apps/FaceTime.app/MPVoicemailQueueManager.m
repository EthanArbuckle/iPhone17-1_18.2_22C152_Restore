@interface MPVoicemailQueueManager
+ (OS_dispatch_queue_serial)serialQueue;
- (MPVoicemailQueueManager)init;
@end

@implementation MPVoicemailQueueManager

- (MPVoicemailQueueManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VoicemailQueueManager();
  return [(MPVoicemailQueueManager *)&v3 init];
}

+ (OS_dispatch_queue_serial)serialQueue
{
  return (OS_dispatch_queue_serial *)sub_10004CFC4((uint64_t)a1, (uint64_t)a2, &qword_1000BA6E8, (void **)&qword_1000BD4A8);
}

@end