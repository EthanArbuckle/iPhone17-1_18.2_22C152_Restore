@interface SiriAnalyticsClient
- (BOOL)clientMessageStream:(id)a3 shouldEmitMessage:(id)a4 timestamp:(unint64_t)a5 isolatedStreamUUID:(id)a6;
- (SiriAnalyticsClientMessageStream)defaultMessageStream;
- (void)setDefaultMessageStream:(id)a3;
@end

@implementation SiriAnalyticsClient

- (void).cxx_destruct
{
}

- (SiriAnalyticsClientMessageStream)defaultMessageStream
{
  return self->_defaultMessageStream;
}

- (BOOL)clientMessageStream:(id)a3 shouldEmitMessage:(id)a4 timestamp:(unint64_t)a5 isolatedStreamUUID:(id)a6
{
  return 1;
}

- (void)setDefaultMessageStream:(id)a3
{
}

@end