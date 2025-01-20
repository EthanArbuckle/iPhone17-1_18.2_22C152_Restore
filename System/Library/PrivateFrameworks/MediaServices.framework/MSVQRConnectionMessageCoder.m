@interface MSVQRConnectionMessageCoder
- (id)dataFromMessage:(id)a3;
- (id)messageFromData:(id)a3;
- (id)traceIdentifierForMessage:(id)a3;
@end

@implementation MSVQRConnectionMessageCoder

- (id)traceIdentifierForMessage:(id)a3
{
  return 0;
}

- (id)dataFromMessage:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3);
}

- (id)messageFromData:(id)a3
{
  return 0;
}

@end