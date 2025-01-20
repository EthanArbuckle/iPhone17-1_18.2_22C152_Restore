@interface MRMusicHandoffSession
+ (BOOL)supportsSecureCoding;
+ (void)setHandoffSessionHandlerForPlayerPath:(id)a3 handler:(id)a4;
- (MRMusicHandoffSession)initWithCoder:(id)a3;
- (MRMusicHandoffSession)initWithIdentifier:(id)a3 sourcePlayerPath:(id)a4 destinationPlayerPath:(id)a5;
- (MRMusicHandoffSession)initWithProtobuf:(id)a3;
- (MRMusicHandoffSession)initWithProtobufData:(id)a3;
- (MRPlayerPath)destinationPlayerPath;
- (MRPlayerPath)sourcePlayerPath;
- (NSData)protobufData;
- (NSString)identifier;
- (OS_dispatch_queue)queue;
- (_MRMusicHandoffSessionProtobuf)protobuf;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithEvent:(id)a3;
@end

@implementation MRMusicHandoffSession

- (MRMusicHandoffSession)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)MRMusicHandoffSession;
    v5 = [(MRMusicHandoffSession *)&v18 init];
    if (v5)
    {
      uint64_t v6 = [v4 identifier];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v6;

      v8 = [MRPlayerPath alloc];
      v9 = [v4 sourcePlayerPath];
      uint64_t v10 = [(MRPlayerPath *)v8 initWithProtobuf:v9];
      sourcePlayerPath = v5->_sourcePlayerPath;
      v5->_sourcePlayerPath = (MRPlayerPath *)v10;

      v12 = [MRPlayerPath alloc];
      v13 = [v4 destinationPlayerPath];
      uint64_t v14 = [(MRPlayerPath *)v12 initWithProtobuf:v13];
      destinationPlayerPath = v5->_destinationPlayerPath;
      v5->_destinationPlayerPath = (MRPlayerPath *)v14;
    }
    self = v5;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (void)setHandoffSessionHandlerForPlayerPath:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[MRClientApplicationConnectionManager sharedManager];
  [v7 registerHandoffSessionHandlerForPlayerPath:v6 handler:v5];
}

- (MRMusicHandoffSession)initWithIdentifier:(id)a3 sourcePlayerPath:(id)a4 destinationPlayerPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MRMusicHandoffSession;
  v11 = [(MRMusicHandoffSession *)&v25 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    sourcePlayerPath = v11->_sourcePlayerPath;
    v11->_sourcePlayerPath = (MRPlayerPath *)v14;

    uint64_t v16 = [v10 copy];
    destinationPlayerPath = v11->_destinationPlayerPath;
    v11->_destinationPlayerPath = (MRPlayerPath *)v16;

    id v18 = [NSString stringWithFormat:@"com.apple.MediaRemote.MRMusicHandoffSession-%@", v8];
    v19 = (const char *)[v18 UTF8String];
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = MRMusicHandoffSessionGetQueue();
    dispatch_queue_t v22 = dispatch_queue_create_with_target_V2(v19, v20, v21);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v22;
  }
  return v11;
}

- (void)updateWithEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(MRMusicHandoffSession *)self identifier];
  [v4 setSessionIdentifier:v5];

  MRGetSharedService();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(MRMusicHandoffSession *)self queue];
  [v7 sendMusicHandoffEvent:v4 queue:v6 completion:&__block_literal_global_6_1];
}

- (MRMusicHandoffSession)initWithProtobufData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[_MRMusicHandoffSessionProtobuf alloc] initWithData:v4];

    self = [(MRMusicHandoffSession *)self initWithProtobuf:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(MRMusicHandoffSession *)self identifier];
  id v5 = [(MRMusicHandoffSession *)self sourcePlayerPath];
  id v6 = [(MRMusicHandoffSession *)self destinationPlayerPath];
  id v7 = [v3 stringWithFormat:@"<MRMusicHandoffSession<%@> - source: %@, dest: %@>", v4, v5, v6];

  return v7;
}

- (_MRMusicHandoffSessionProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRMusicHandoffSessionProtobuf);
  id v4 = [(MRMusicHandoffSession *)self identifier];
  [(_MRMusicHandoffSessionProtobuf *)v3 setIdentifier:v4];

  id v5 = [(MRMusicHandoffSession *)self sourcePlayerPath];
  id v6 = [v5 protobuf];
  [(_MRMusicHandoffSessionProtobuf *)v3 setSourcePlayerPath:v6];

  id v7 = [(MRMusicHandoffSession *)self destinationPlayerPath];
  id v8 = [v7 protobuf];
  [(_MRMusicHandoffSessionProtobuf *)v3 setDestinationPlayerPath:v8];

  return v3;
}

- (NSData)protobufData
{
  v2 = [(MRMusicHandoffSession *)self protobuf];
  v3 = [v2 data];

  return (NSData *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MRMusicHandoffSession *)self protobufData];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (MRMusicHandoffSession)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  id v6 = [(MRMusicHandoffSession *)self initWithProtobufData:v5];
  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MRPlayerPath)sourcePlayerPath
{
  return self->_sourcePlayerPath;
}

- (MRPlayerPath)destinationPlayerPath
{
  return self->_destinationPlayerPath;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_destinationPlayerPath, 0);
  objc_storeStrong((id *)&self->_sourcePlayerPath, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end