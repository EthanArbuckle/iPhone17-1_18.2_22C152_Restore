@interface PBUISnapshotPreconditionResult
- (BOOL)canSnapshot;
- (BOOL)isSnapshottingForExternalDisplayHostedWallpaper;
- (NSArray)reasonsToNotSnapshot;
- (PBUIExternalDisplayConfiguration)externalDisplayConfiguration;
- (PBUISnapshotPreconditionResult)initWithExternalDisplayConfiguration:(id)a3 variant:(int64_t)a4;
- (PBUISnapshotPreconditionResult)initWithVariant:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)variant;
- (void)appendPreconditionResultFailure:(id)a3;
- (void)appendPreconditionResultFailureWithFormat:(id)a3;
@end

@implementation PBUISnapshotPreconditionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_reasonsToNotSnapshot, 0);
}

- (NSArray)reasonsToNotSnapshot
{
  return &self->_reasonsToNotSnapshot->super;
}

- (BOOL)canSnapshot
{
  return [(NSMutableArray *)self->_reasonsToNotSnapshot count] == 0;
}

- (PBUISnapshotPreconditionResult)initWithExternalDisplayConfiguration:(id)a3 variant:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PBUISnapshotPreconditionResult;
  v8 = [(PBUISnapshotPreconditionResult *)&v12 init];
  if (v8 == self)
  {
    objc_storeStrong((id *)&self->_externalDisplayConfiguration, a3);
    self->_variant = a4;
    v9 = (NSMutableArray *)objc_opt_new();
    reasonsToNotSnapshot = self->_reasonsToNotSnapshot;
    self->_reasonsToNotSnapshot = v9;
  }
  return v8;
}

- (void)appendPreconditionResultFailureWithFormat:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(PBUISnapshotPreconditionResult *)self appendPreconditionResultFailure:v6];
}

- (void)appendPreconditionResultFailure:(id)a3
{
  reasonsToNotSnapshot = self->_reasonsToNotSnapshot;
  id v5 = (__CFString *)a3;
  if ([(__CFString *)v5 length]) {
    v4 = v5;
  }
  else {
    v4 = @"UNSPECIFIED FAILURE REASON!!!!";
  }
  [(NSMutableArray *)reasonsToNotSnapshot addObject:v4];
}

- (BOOL)isSnapshottingForExternalDisplayHostedWallpaper
{
  return self->_externalDisplayConfiguration != 0;
}

- (PBUIExternalDisplayConfiguration)externalDisplayConfiguration
{
  return self->_externalDisplayConfiguration;
}

- (PBUISnapshotPreconditionResult)initWithVariant:(int64_t)a3
{
  return [(PBUISnapshotPreconditionResult *)self initWithExternalDisplayConfiguration:0 variant:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[PBUISnapshotPreconditionResult allocWithZone:a3] initWithExternalDisplayConfiguration:self->_externalDisplayConfiguration variant:self->_variant];
  uint64_t v5 = [(NSMutableArray *)self->_reasonsToNotSnapshot mutableCopy];
  reasonsToNotSnapshot = v4->_reasonsToNotSnapshot;
  v4->_reasonsToNotSnapshot = (NSMutableArray *)v5;

  return v4;
}

- (id)description
{
  BOOL v3 = [(PBUISnapshotPreconditionResult *)self canSnapshot];
  v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = (id)[v4 appendBool:v3 withName:@"canSnapshot"];
  id v6 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[PBUISnapshotPreconditionResult isSnapshottingForExternalDisplayHostedWallpaper](self, "isSnapshottingForExternalDisplayHostedWallpaper"), @"isSnapshottingForExternalDisplayHostedWallpaper", 1);
  if (!v3)
  {
    uint64_t v7 = (void *)[(NSMutableArray *)self->_reasonsToNotSnapshot copy];
    [v4 appendArraySection:v7 withName:@"reasons to not snapshot" skipIfEmpty:0];
  }
  v8 = [v4 build];

  return v8;
}

- (int64_t)variant
{
  return self->_variant;
}

@end