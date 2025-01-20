@interface FakeLogMessageEvent
- (NSDate)timestamp;
- (NSString)category;
- (NSString)eventMessage;
- (NSString)processImagePath;
- (NSString)subsystem;
- (NSTimeZone)timezone;
- (int)processID;
- (unint64_t)eventType;
- (unint64_t)processUniqueID;
- (unint64_t)threadID;
- (unint64_t)traceID;
- (unsigned)messageType;
- (void)setCategory:(id)a3;
- (void)setEventMessage:(id)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setMessageType:(unsigned __int8)a3;
- (void)setProcessID:(int)a3;
- (void)setProcessImagePath:(id)a3;
- (void)setProcessUniqueID:(unint64_t)a3;
- (void)setSubsystem:(id)a3;
- (void)setThreadID:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setTimezone:(id)a3;
- (void)setTraceID:(unint64_t)a3;
@end

@implementation FakeLogMessageEvent

- (NSString)subsystem
{
  return self->subsystem;
}

- (void)setSubsystem:(id)a3
{
}

- (NSString)category
{
  return self->category;
}

- (void)setCategory:(id)a3
{
}

- (unsigned)messageType
{
  return self->messageType;
}

- (void)setMessageType:(unsigned __int8)a3
{
  self->messageType = a3;
}

- (int)processID
{
  return self->processID;
}

- (void)setProcessID:(int)a3
{
  self->processID = a3;
}

- (unint64_t)processUniqueID
{
  return self->processUniqueID;
}

- (void)setProcessUniqueID:(unint64_t)a3
{
  self->processUniqueID = a3;
}

- (NSString)processImagePath
{
  return self->processImagePath;
}

- (void)setProcessImagePath:(id)a3
{
}

- (unint64_t)eventType
{
  return self->eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->eventType = a3;
}

- (unint64_t)traceID
{
  return self->traceID;
}

- (void)setTraceID:(unint64_t)a3
{
  self->traceID = a3;
}

- (unint64_t)threadID
{
  return self->threadID;
}

- (void)setThreadID:(unint64_t)a3
{
  self->threadID = a3;
}

- (NSDate)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSTimeZone)timezone
{
  return self->timezone;
}

- (void)setTimezone:(id)a3
{
}

- (NSString)eventMessage
{
  return self->eventMessage;
}

- (void)setEventMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->eventMessage, 0);
  objc_storeStrong((id *)&self->timezone, 0);
  objc_storeStrong((id *)&self->timestamp, 0);
  objc_storeStrong((id *)&self->processImagePath, 0);
  objc_storeStrong((id *)&self->category, 0);

  objc_storeStrong((id *)&self->subsystem, 0);
}

@end