@interface VILogger
+ (BOOL)shouldLogMessage;
+ (BOOL)shouldLogVerboseMessage;
+ (OS_os_log)log;
+ (OS_os_log)verboseLog;
- (_TtC18VisualIntelligence8VILogger)init;
@end

@implementation VILogger

+ (OS_os_log)log
{
  if (qword_1EBE87190 != -1) {
    swift_once();
  }
  if (byte_1EBE87188 == 1)
  {
    if (qword_1EBE85278 != -1) {
      swift_once();
    }
    id v2 = (id)qword_1EBE85268;
  }
  else
  {
    sub_1DCDB4B04();
    id v2 = (id)sub_1DD0489D8();
  }
  return (OS_os_log *)v2;
}

+ (OS_os_log)verboseLog
{
  id v2 = _s18VisualIntelligence8VILoggerC10verboseLogSo9OS_os_logCvgZ_0();
  return (OS_os_log *)v2;
}

+ (BOOL)shouldLogMessage
{
  if (qword_1EBE87190 != -1) {
    swift_once();
  }
  return byte_1EBE87188;
}

+ (BOOL)shouldLogVerboseMessage
{
  return _s18VisualIntelligence8VILoggerC23shouldLogVerboseMessageSbvgZ_0() & 1;
}

- (_TtC18VisualIntelligence8VILogger)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VILogger();
  return [(VILogger *)&v3 init];
}

@end