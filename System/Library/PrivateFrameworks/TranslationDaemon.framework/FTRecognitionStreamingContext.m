@interface FTRecognitionStreamingContext
- (FTRecognitionStreamingContext)initWithGRPCStreamingCallContext:(id)a3;
- (void)closeStream;
- (void)sendRecognitionStreamingRequest:(id)a3;
@end

@implementation FTRecognitionStreamingContext

- (FTRecognitionStreamingContext)initWithGRPCStreamingCallContext:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FTRecognitionStreamingContext;
  v6 = [(FTRecognitionStreamingContext *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_grpcContext, a3);
    v8 = v7;
  }

  return v7;
}

- (void)sendRecognitionStreamingRequest:(id)a3
{
  id v4 = [a3 flatbuffData];
  -[OspreyClientStreamingContext writeFrame:](self->_grpcContext, "writeFrame:");
}

- (void)closeStream
{
}

- (void).cxx_destruct
{
}

@end