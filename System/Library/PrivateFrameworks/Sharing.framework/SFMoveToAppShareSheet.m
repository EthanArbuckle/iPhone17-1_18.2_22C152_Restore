@interface SFMoveToAppShareSheet
+ (BOOL)supportsSecureCoding;
- (SFMoveToAppShareSheet)init;
- (SFMoveToAppShareSheet)initWithCoder:(id)a3;
@end

@implementation SFMoveToAppShareSheet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFMoveToAppShareSheet)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(SFXPCInvocation *)&v3 init];
}

- (SFMoveToAppShareSheet)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (SFMoveToAppShareSheet *)sub_1A55B2384(v3);

  return v4;
}

@end