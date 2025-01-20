@interface PLCrowdSourcedThemesAssetEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (NSString)uuid;
- (PLCrowdSourcedThemesAssetEvent)initWithUUID:(id)a3;
- (id)serialize;
- (unsigned)dataVersion;
@end

@implementation PLCrowdSourcedThemesAssetEvent

- (void).cxx_destruct
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (unsigned)dataVersion
{
  return self->dataVersion;
}

- (id)serialize
{
  v2 = [(PLCrowdSourcedThemesAssetEvent *)self uuid];
  v3 = [v2 dataUsingEncoding:4];

  return v3;
}

- (PLCrowdSourcedThemesAssetEvent)initWithUUID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLCrowdSourcedThemesAssetEvent;
  v5 = [(PLCrowdSourcedThemesAssetEvent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;
  }
  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v7 = a3;
  if (a4)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PLCrowdSourcedThemesAssetEvent.m", 29, @"Invalid parameter not satisfying: %@", @"dataVersion == 0" object file lineNumber description];
  }
  id v8 = objc_alloc((Class)a1);
  objc_super v9 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
  v10 = (void *)[v8 initWithUUID:v9];

  return v10;
}

@end