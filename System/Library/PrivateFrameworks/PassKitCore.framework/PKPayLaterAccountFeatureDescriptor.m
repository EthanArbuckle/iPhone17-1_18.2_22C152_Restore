@interface PKPayLaterAccountFeatureDescriptor
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation PKPayLaterAccountFeatureDescriptor

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  v4 = [(PKAccountFeatureDescriptor *)self identifier];
  [v3 appendFormat:@"identifier: '%@'; ", v4];

  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPayLaterAccountFeatureDescriptor *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountFeatureDescriptor *)self isEqualToAccountFeatureDescriptor:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterAccountFeatureDescriptor;
  return [(PKAccountFeatureDescriptor *)&v4 copyWithZone:a3];
}

@end