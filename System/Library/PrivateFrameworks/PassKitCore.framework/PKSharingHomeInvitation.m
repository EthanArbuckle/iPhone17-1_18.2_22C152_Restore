@interface PKSharingHomeInvitation
+ (BOOL)supportsSecureCoding;
- (PKSharingHomeInvitation)initWithDisplayInformation:(id)a3 appleSharingDict:(id)a4;
@end

@implementation PKSharingHomeInvitation

- (PKSharingHomeInvitation)initWithDisplayInformation:(id)a3 appleSharingDict:(id)a4
{
  v4 = 0;
  if (a3 && a4)
  {
    self = [(PKSharingGenericMessage *)self initWithFormat:4 type:1 genericSharingDict:MEMORY[0x1E4F1CC08] appleSharingDict:a4 displayInformation:a3];
    v4 = self;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end