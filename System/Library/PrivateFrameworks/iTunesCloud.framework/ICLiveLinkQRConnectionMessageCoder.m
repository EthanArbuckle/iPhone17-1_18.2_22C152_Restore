@interface ICLiveLinkQRConnectionMessageCoder
- (id)dataFromMessage:(id)a3;
- (id)messageFromData:(id)a3;
- (id)traceIdentifierForMessage:(id)a3;
@end

@implementation ICLiveLinkQRConnectionMessageCoder

- (id)traceIdentifierForMessage:(id)a3
{
  if (a3) {
    return (id)*((void *)a3 + 5);
  }
  else {
    return 0;
  }
}

- (id)dataFromMessage:(id)a3
{
  return (id)[a3 data];
}

- (id)messageFromData:(id)a3
{
  id v3 = a3;
  v4 = [[_ICLLProtocolMessage alloc] initWithData:v3];

  return v4;
}

@end