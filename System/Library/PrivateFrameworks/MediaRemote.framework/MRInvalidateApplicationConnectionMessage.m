@interface MRInvalidateApplicationConnectionMessage
- (MRApplicationConnectionContext)context;
- (MRInvalidateApplicationConnectionMessage)initWithConnectionContext:(id)a3 error:(id)a4;
- (unint64_t)type;
@end

@implementation MRInvalidateApplicationConnectionMessage

- (MRInvalidateApplicationConnectionMessage)initWithConnectionContext:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MRInvalidateApplicationConnectionMessage;
  v8 = [(MRProtocolMessage *)&v11 init];
  if (v8)
  {
    v9 = [v6 protobuf];
    [(MRProtocolMessage *)v8 setError:v7];
    [(MRProtocolMessage *)v8 setUnderlyingCodableMessage:v9];
  }
  return v8;
}

- (unint64_t)type
{
  return 136;
}

- (MRApplicationConnectionContext)context
{
  v3 = [MRApplicationConnectionContext alloc];
  v4 = [(MRProtocolMessage *)self underlyingCodableMessage];
  v5 = [(MRApplicationConnectionContext *)v3 initWithProtobuf:v4];

  return v5;
}

@end