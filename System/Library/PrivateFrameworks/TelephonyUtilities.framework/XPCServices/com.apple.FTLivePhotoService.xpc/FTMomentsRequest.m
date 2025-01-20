@interface FTMomentsRequest
- (FTAVCMomentsRequest)avcRequest;
- (FTMomentsControllerSession)session;
- (FTMomentsRequest)init;
- (FTMomentsRequest)initWithAVCRequest:(id)a3 session:(id)a4;
@end

@implementation FTMomentsRequest

- (FTAVCMomentsRequest)avcRequest
{
  id v2 = sub_100010420();

  return (FTAVCMomentsRequest *)v2;
}

- (FTMomentsControllerSession)session
{
  id v2 = sub_100010460();

  return (FTMomentsControllerSession *)v2;
}

- (FTMomentsRequest)initWithAVCRequest:(id)a3 session:(id)a4
{
  return (FTMomentsRequest *)sub_10001046C((uint64_t)a3, (uint64_t)a4);
}

- (FTMomentsRequest)init
{
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FTMomentsRequest_session);
}

@end