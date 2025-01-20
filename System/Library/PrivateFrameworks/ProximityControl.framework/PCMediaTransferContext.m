@interface PCMediaTransferContext
+ (BOOL)supportsSecureCoding;
- (PCMediaTransferContext)initWithCoder:(id)a3;
@end

@implementation PCMediaTransferContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCMediaTransferContext)initWithCoder:(id)a3
{
  v3 = [(PCMediaTransferContext *)self init];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

@end