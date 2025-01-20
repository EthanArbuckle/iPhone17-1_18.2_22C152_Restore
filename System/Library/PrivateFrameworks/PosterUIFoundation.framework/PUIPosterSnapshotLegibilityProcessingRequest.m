@interface PUIPosterSnapshotLegibilityProcessingRequest
+ (BOOL)supportsSecureCoding;
+ (id)defaultLegibilityProcessingRequest;
+ (id)defaultLegibilityProcessingRequestWithDesiredLegibilitySettings:(id)a3 determineColorStatistics:(BOOL)a4;
- (BOOL)determineColorStatistics;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSnapshotLegibilityProcessingRequest:(id)a3;
- (PUIPosterLegibilitySettings)desiredLegibilitySettings;
- (PUIPosterSnapshotLegibilityProcessingRequest)initWithCoder:(id)a3;
- (PUIPosterSnapshotLegibilityProcessingRequest)initWithDesiredLegibilitySettings:(id)a3 determineColorStatistics:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUIPosterSnapshotLegibilityProcessingRequest

+ (id)defaultLegibilityProcessingRequest
{
  v2 = [[PUIPosterSnapshotLegibilityProcessingRequest alloc] initWithDesiredLegibilitySettings:0 determineColorStatistics:1];
  return v2;
}

+ (id)defaultLegibilityProcessingRequestWithDesiredLegibilitySettings:(id)a3 determineColorStatistics:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[PUIPosterSnapshotLegibilityProcessingRequest alloc] initWithDesiredLegibilitySettings:v5 determineColorStatistics:v4];

  return v6;
}

- (PUIPosterSnapshotLegibilityProcessingRequest)initWithDesiredLegibilitySettings:(id)a3 determineColorStatistics:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUIPosterSnapshotLegibilityProcessingRequest;
  v7 = [(PUIPosterSnapshotLegibilityProcessingRequest *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    desiredLegibilitySettings = v7->_desiredLegibilitySettings;
    v7->_desiredLegibilitySettings = (PUIPosterLegibilitySettings *)v8;

    v7->_determineColorStatistics = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendObject:self->_desiredLegibilitySettings];
  id v5 = (id)[v3 appendBool:self->_determineColorStatistics];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUIPosterSnapshotLegibilityProcessingRequest *)a3;
  id v5 = v4;
  if (v4) {
    BOOL v6 = v4 == self
  }
      || [(PUIPosterSnapshotLegibilityProcessingRequest *)self isEqualToSnapshotLegibilityProcessingRequest:v4];
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToSnapshotLegibilityProcessingRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F29C58];
  BOOL v6 = self;
  v7 = [v5 builderWithObject:v4 ofExpectedClass:v6];

  BOOL determineColorStatistics = self->_determineColorStatistics;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __93__PUIPosterSnapshotLegibilityProcessingRequest_isEqualToSnapshotLegibilityProcessingRequest___block_invoke;
  v20[3] = &unk_265471428;
  id v9 = v4;
  id v21 = v9;
  id v10 = (id)[v7 appendBool:determineColorStatistics counterpart:v20];
  desiredLegibilitySettings = self->_desiredLegibilitySettings;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __93__PUIPosterSnapshotLegibilityProcessingRequest_isEqualToSnapshotLegibilityProcessingRequest___block_invoke_2;
  v18 = &unk_265471450;
  id v19 = v9;
  id v12 = v9;
  id v13 = (id)[v7 appendObject:desiredLegibilitySettings counterpart:&v15];
  LOBYTE(desiredLegibilitySettings) = objc_msgSend(v7, "isEqual", v15, v16, v17, v18);

  return (char)desiredLegibilitySettings;
}

uint64_t __93__PUIPosterSnapshotLegibilityProcessingRequest_isEqualToSnapshotLegibilityProcessingRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) determineColorStatistics];
}

uint64_t __93__PUIPosterSnapshotLegibilityProcessingRequest_isEqualToSnapshotLegibilityProcessingRequest___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) desiredLegibilitySettings];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[PUIPosterSnapshotLegibilityProcessingRequest allocWithZone:a3];
  desiredLegibilitySettings = self->_desiredLegibilitySettings;
  BOOL determineColorStatistics = self->_determineColorStatistics;
  return [(PUIPosterSnapshotLegibilityProcessingRequest *)v4 initWithDesiredLegibilitySettings:desiredLegibilitySettings determineColorStatistics:determineColorStatistics];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIPosterSnapshotLegibilityProcessingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  BOOL v6 = [v4 decodeObjectOfClass:v5 forKey:@"_desiredLegibilitySettings"];
  uint64_t v7 = [v4 decodeBoolForKey:@"_determineColorStatistics"];

  uint64_t v8 = [(PUIPosterSnapshotLegibilityProcessingRequest *)self initWithDesiredLegibilitySettings:v6 determineColorStatistics:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  desiredLegibilitySettings = self->_desiredLegibilitySettings;
  id v5 = a3;
  [v5 encodeObject:desiredLegibilitySettings forKey:@"_desiredLegibilitySettings"];
  [v5 encodeBool:self->_determineColorStatistics forKey:@"_determineColorStatistics"];
}

- (BOOL)determineColorStatistics
{
  return self->_determineColorStatistics;
}

- (PUIPosterLegibilitySettings)desiredLegibilitySettings
{
  return self->_desiredLegibilitySettings;
}

- (void).cxx_destruct
{
}

@end