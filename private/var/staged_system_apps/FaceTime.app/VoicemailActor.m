@interface VoicemailActor
+ (OS_dispatch_queue_serial)MPVoicemailSerialDispatchQueue;
@end

@implementation VoicemailActor

+ (OS_dispatch_queue_serial)MPVoicemailSerialDispatchQueue
{
  return (OS_dispatch_queue_serial *)sub_10004CFC4((uint64_t)a1, (uint64_t)a2, &qword_1000BA6E0, (void **)&qword_1000BD4A0);
}

@end