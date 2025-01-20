@interface MRDestination
+ (BOOL)supportsSecureCoding;
+ (id)localDestination;
+ (id)proactiveDestination;
+ (id)userSelectedDestination;
- (BOOL)isLocal;
- (BOOL)isProactive;
- (BOOL)isUserSelected;
- (MRAVEndpoint)endpoint;
- (MRClient)client;
- (MRDestination)initWithCoder:(id)a3;
- (MRDestination)initWithData:(id)a3;
- (MRDestination)initWithEndpoint:(id)a3;
- (MRDestination)initWithOrigin:(id)a3;
- (MRDestination)initWithOutputContextUID:(id)a3;
- (MRDestination)initWithOutputDeviceUID:(id)a3;
- (MRDestination)initWithPlayerPath:(id)a3;
- (MRDestination)initWithProtobuf:(id)a3;
- (MROrigin)origin;
- (MRPlayer)player;
- (MRPlayerPath)playerPath;
- (NSData)data;
- (NSString)outputContextUID;
- (NSString)outputDeviceUID;
- (_MRDestinationProtobuf)protobuf;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)populatePlayerPathIfNeeded;
- (void)setClient:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setOutputDeviceUID:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerPath:(id)a3;
@end

@implementation MRDestination

+ (id)proactiveDestination
{
  v2 = [[MRDestination alloc] initWithOutputDeviceUID:@"proactiveEndpoint"];

  return v2;
}

+ (id)userSelectedDestination
{
  v2 = [[MRDestination alloc] initWithOutputDeviceUID:@"userSelectedEndpoint"];

  return v2;
}

+ (id)localDestination
{
  v2 = [[MRDestination alloc] initWithEndpoint:MRAVEndpointGetLocalEndpoint(0)];

  return v2;
}

- (MRDestination)initWithPlayerPath:(id)a3
{
  id v4 = a3;
  v5 = [(MRDestination *)self _init];
  if (v5)
  {
    if (v4) {
      v6 = (MRPlayerPath *)[v4 copy];
    }
    else {
      v6 = objc_alloc_init(MRPlayerPath);
    }
    playerPath = v5->_playerPath;
    v5->_playerPath = v6;
  }
  return v5;
}

- (MRDestination)initWithOrigin:(id)a3
{
  id v4 = a3;
  v5 = [(MRDestination *)self _init];
  if (v5)
  {
    v6 = [MRPlayerPath alloc];
    v7 = (void *)[v4 copy];
    uint64_t v8 = [(MRPlayerPath *)v6 initWithOrigin:v7 client:0 player:0];
    playerPath = v5->_playerPath;
    v5->_playerPath = (MRPlayerPath *)v8;
  }
  return v5;
}

- (MRDestination)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v6 = [(MRDestination *)self _init];
  v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v14 = +[MRDestination localDestination];
      goto LABEL_7;
    }
    objc_storeStrong(v6 + 3, a3);
    uint64_t v8 = [v5 origin];

    if (v8)
    {
      v9 = [MRPlayerPath alloc];
      v10 = [v5 origin];
      v11 = (void *)[v10 copy];
      uint64_t v12 = [(MRPlayerPath *)v9 initWithOrigin:v11 client:0 player:0];
      id v13 = v7[4];
      v7[4] = (id)v12;
    }
  }
  v14 = v7;
LABEL_7:
  v15 = v14;

  return v15;
}

- (MRDestination)initWithOutputDeviceUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDestination *)self _init];
  if (v5)
  {
    if (!v4)
    {
      uint64_t v8 = +[MRDestination localDestination];
      goto LABEL_6;
    }
    uint64_t v6 = [v4 copy];
    v7 = (void *)v5[1];
    v5[1] = v6;
  }
  uint64_t v8 = v5;
LABEL_6:
  v9 = v8;

  return v9;
}

- (MRDestination)initWithOutputContextUID:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(MRDestination *)self _init];
  if (v6)
  {
    if (!v5)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, v6, @"MRDestination.m", 71, @"Invalid parameter not satisfying: %@", @"outputContextUID" object file lineNumber description];
    }
    uint64_t v7 = [v5 copy];
    outputContextUID = v6->_outputContextUID;
    v6->_outputContextUID = (NSString *)v7;
  }
  return v6;
}

- (MRDestination)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[_MRDestinationProtobuf alloc] initWithData:v4];

    self = [(MRDestination *)self initWithProtobuf:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (MRDestination)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(MRDestination *)self _init];
    if (v5)
    {
      uint64_t v6 = [v4 outputDeviceUID];
      uint64_t v7 = (void *)v5[1];
      v5[1] = v6;

      uint64_t v8 = [MRPlayerPath alloc];
      v9 = [v4 playerPath];
      uint64_t v10 = [(MRPlayerPath *)v8 initWithProtobuf:v9];
      v11 = (void *)v5[4];
      v5[4] = v10;

      uint64_t v12 = [v4 endpoint];
      if (v12)
      {
        id v13 = [MRAVDistantEndpoint alloc];
        v14 = [v4 endpoint];
        v15 = [(MRAVDistantEndpoint *)v13 initWithDescriptor:v14];
      }
      else
      {
        v15 = 0;
      }

      if ([(MRAVDistantEndpoint *)v15 connectionType] == 1)
      {
        v17 = +[MRAVLocalEndpoint sharedLocalEndpoint];
      }
      else
      {
        v17 = v15;
      }
      v18 = (void *)v5[3];
      v5[3] = v17;

      uint64_t v19 = [v4 outputContextUID];
      v20 = (void *)v5[2];
      v5[2] = v19;
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

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MRDestination;
  return [(MRDestination *)&v3 init];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = v3;
  if (self->_outputDeviceUID) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_outputContextUID)
  {
    id v5 = [NSString stringWithFormat:@"ctx=%@", self->_outputContextUID];
    [v4 addObject:v5];
  }
  endpoint = self->_endpoint;
  if (endpoint)
  {
    uint64_t v7 = [(MRAVEndpoint *)endpoint uniqueIdentifier];
    [v4 addObject:v7];
  }
  if (self->_playerPath) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v8 = NSString;
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v4 componentsJoinedByString:@"/"];
  v11 = [v8 stringWithFormat:@"<%@: %@>", v9, v10];

  return v11;
}

- (MROrigin)origin
{
  v2 = [(MRDestination *)self playerPath];
  id v3 = [v2 origin];

  return (MROrigin *)v3;
}

- (void)setOrigin:(id)a3
{
  id v6 = a3;
  if (v6
    || ([(MRDestination *)self playerPath],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    [(MRDestination *)self populatePlayerPathIfNeeded];
    id v5 = [(MRDestination *)self playerPath];
    [v5 setOrigin:v6];
  }
}

- (MRClient)client
{
  v2 = [(MRDestination *)self playerPath];
  id v3 = [v2 client];

  return (MRClient *)v3;
}

- (void)setClient:(id)a3
{
  id v6 = a3;
  if (v6
    || ([(MRDestination *)self playerPath],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    [(MRDestination *)self populatePlayerPathIfNeeded];
    id v5 = [(MRDestination *)self playerPath];
    [v5 setClient:v6];
  }
}

- (MRPlayer)player
{
  v2 = [(MRDestination *)self playerPath];
  id v3 = [v2 player];

  return (MRPlayer *)v3;
}

- (void)setPlayer:(id)a3
{
  id v6 = a3;
  if (v6
    || ([(MRDestination *)self playerPath],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    [(MRDestination *)self populatePlayerPathIfNeeded];
    id v5 = [(MRDestination *)self playerPath];
    [v5 setPlayer:v6];
  }
}

- (void)populatePlayerPathIfNeeded
{
  id v3 = [(MRDestination *)self playerPath];

  if (!v3)
  {
    id v4 = objc_alloc_init(MRPlayerPath);
    [(MRDestination *)self setPlayerPath:v4];
  }
}

- (BOOL)isLocal
{
  if ([(MRAVEndpoint *)self->_endpoint isEqual:MRAVEndpointGetLocalEndpoint(0)]) {
    return 1;
  }
  outputDeviceUID = self->_outputDeviceUID;
  id v5 = +[MRAVOutputDevice localDeviceUID];
  if ([(NSString *)outputDeviceUID isEqual:v5])
  {
    char v3 = 1;
  }
  else
  {
    id v6 = [(MRPlayerPath *)self->_playerPath origin];
    char v3 = [v6 isLocal];
  }
  return v3;
}

- (BOOL)isProactive
{
  return [(NSString *)self->_outputDeviceUID isEqual:@"proactiveEndpoint"];
}

- (BOOL)isUserSelected
{
  return [(NSString *)self->_outputDeviceUID isEqual:@"userSelectedEndpoint"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_alloc((Class)objc_opt_class()) _init];
  objc_storeStrong((id *)(v5 + 24), self->_endpoint);
  uint64_t v6 = [(NSString *)self->_outputContextUID copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_outputDeviceUID copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  id v10 = [(MRPlayerPath *)self->_playerPath copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  return (id)v5;
}

- (NSData)data
{
  v2 = [(MRDestination *)self protobuf];
  char v3 = [v2 data];

  return (NSData *)v3;
}

- (_MRDestinationProtobuf)protobuf
{
  char v3 = objc_alloc_init(_MRDestinationProtobuf);
  [(_MRDestinationProtobuf *)v3 setOutputDeviceUID:self->_outputDeviceUID];
  id v4 = [(MRAVEndpoint *)self->_endpoint descriptor];
  [(_MRDestinationProtobuf *)v3 setEndpoint:v4];

  uint64_t v5 = [(MRPlayerPath *)self->_playerPath protobuf];
  [(_MRDestinationProtobuf *)v3 setPlayerPath:v5];

  [(_MRDestinationProtobuf *)v3 setOutputContextUID:self->_outputContextUID];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDestination *)self protobuf];
  [v4 encodeObject:v5 forKey:@"protobuf"];
}

- (MRDestination)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [MRDestination alloc];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];

  uint64_t v7 = [(MRDestination *)v5 initWithProtobuf:v6];
  return v7;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
}

- (NSString)outputContextUID
{
  return self->_outputContextUID;
}

- (MRAVEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void)setPlayerPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_outputContextUID, 0);

  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
}

@end