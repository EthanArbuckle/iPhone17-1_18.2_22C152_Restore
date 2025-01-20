@interface ConnectionData
@end

@implementation ConnectionData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->barrierBlockTimout, 0);

  objc_storeStrong((id *)&self->clientConnection, 0);
}

@end