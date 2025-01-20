@interface CSDMomentsRequest
- (CSDAVCMomentsRequest)avcRequest;
- (CSDMomentsControllerSession)session;
- (CSDMomentsRequest)init;
- (CSDMomentsRequest)initWithAVCRequest:(id)a3 session:(id)a4;
@end

@implementation CSDMomentsRequest

- (CSDAVCMomentsRequest)avcRequest
{
  v2 = (void *)sub_1003A62BC();

  return (CSDAVCMomentsRequest *)v2;
}

- (CSDMomentsControllerSession)session
{
  id v2 = sub_1003A6300();

  return (CSDMomentsControllerSession *)v2;
}

- (CSDMomentsRequest)initWithAVCRequest:(id)a3 session:(id)a4
{
  return (CSDMomentsRequest *)sub_1003A6310((uint64_t)a3, (uint64_t)a4);
}

- (CSDMomentsRequest)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CSDMomentsRequest_session);
}

@end