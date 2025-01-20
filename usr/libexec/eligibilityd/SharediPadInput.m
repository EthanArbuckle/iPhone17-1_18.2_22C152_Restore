@interface SharediPadInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSharediPad;
- (SharediPadInput)init;
- (SharediPadInput)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SharediPadInput

- (id)description
{
  if ([(SharediPadInput *)self isSharediPad]) {
    CFStringRef v3 = @"Y";
  }
  else {
    CFStringRef v3 = @"N";
  }
  v7.receiver = self;
  v7.super_class = (Class)SharediPadInput;
  v4 = [(EligibilityInput *)&v7 description];
  v5 = +[NSString stringWithFormat:@"[SharediPadInput isSharediPad:%@ %@]", v3, v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SharediPadInput *)a3;
  v7.receiver = self;
  v7.super_class = (Class)SharediPadInput;
  if ([(EligibilityInput *)&v7 isEqual:v4])
  {
    if (v4 == self)
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)SharediPadInput;
  return [(EligibilityInput *)&v3 hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SharediPadInput;
  return [(EligibilityInput *)&v4 copyWithZone:a3];
}

- (SharediPadInput)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SharediPadInput;
  return [(EligibilityInput *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SharediPadInput;
  [(EligibilityInput *)&v3 encodeWithCoder:a3];
}

- (SharediPadInput)init
{
  v3.receiver = self;
  v3.super_class = (Class)SharediPadInput;
  return [(EligibilityInput *)&v3 initWithInputType:12 status:0 process:@"eligibilityd"];
}

- (BOOL)isSharediPad
{
  v2 = +[UMUserManager sharedManager];
  unsigned __int8 v3 = [v2 isSharedIPad];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end