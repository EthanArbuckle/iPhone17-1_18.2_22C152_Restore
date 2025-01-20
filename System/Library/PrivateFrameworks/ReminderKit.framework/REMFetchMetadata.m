@interface REMFetchMetadata
+ (BOOL)supportsSecureCoding;
- (REMFetchMetadata)initWithCoder:(id)a3;
@end

@implementation REMFetchMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFetchMetadata)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)REMFetchMetadata;
  return [(REMFetchMetadata *)&v4 init];
}

@end