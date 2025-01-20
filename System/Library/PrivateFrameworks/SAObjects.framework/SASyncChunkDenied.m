@interface SASyncChunkDenied
+ (id)chunkDenied;
+ (id)chunkDeniedWithErrorCode:(int64_t)a3;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (SASyncAnchor)current;
- (SASyncChunkDenied)initWithErrorCode:(int64_t)a3;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)errorCode;
- (void)setCurrent:(id)a3;
- (void)setErrorCode:(int64_t)a3;
@end

@implementation SASyncChunkDenied

- (id)groupIdentifier
{
  return @"com.apple.ace.sync";
}

- (id)encodedClassName
{
  return @"ChunkDenied";
}

+ (id)chunkDenied
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)chunkDeniedWithErrorCode:(int64_t)a3
{
  v3 = [[SASyncChunkDenied alloc] initWithErrorCode:a3];
  return v3;
}

- (SASyncChunkDenied)initWithErrorCode:(int64_t)a3
{
  v4 = [(AceObject *)self init];
  v5 = v4;
  if (v4) {
    [(SASyncChunkDenied *)v4 setErrorCode:a3];
  }
  return v5;
}

- (SASyncAnchor)current
{
  return (SASyncAnchor *)AceObjectAceObjectForProperty(self, @"current");
}

- (void)setCurrent:(id)a3
{
}

- (int64_t)errorCode
{
  return AceObjectIntegerForProperty(self, @"errorCode");
}

- (void)setErrorCode:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end