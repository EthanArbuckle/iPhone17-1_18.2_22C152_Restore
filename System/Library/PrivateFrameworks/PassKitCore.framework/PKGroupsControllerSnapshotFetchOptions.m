@interface PKGroupsControllerSnapshotFetchOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)includeAnnotations;
- (BOOL)limitResults;
- (PKGroupsControllerSnapshotFetchOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)allowedPassType;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedPassType:(unint64_t)a3;
- (void)setIncludeAnnotations:(BOOL)a3;
- (void)setLimitResults:(BOOL)a3;
@end

@implementation PKGroupsControllerSnapshotFetchOptions

- (BOOL)limitResults
{
  return self->_limitResults;
}

- (BOOL)includeAnnotations
{
  return self->_includeAnnotations;
}

- (unint64_t)allowedPassType
{
  return self->_allowedPassType;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setLimitResults:(BOOL)a3
{
  self->_limitResults = a3;
}

- (void)setIncludeAnnotations:(BOOL)a3
{
  self->_includeAnnotations = a3;
}

- (void)setAllowedPassType:(unint64_t)a3
{
  self->_allowedPassType = a3;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL limitResults = self->_limitResults;
  id v5 = a3;
  [v5 encodeBool:limitResults forKey:@"limitResults"];
  [v5 encodeBool:self->_includeAnnotations forKey:@"includeAnnotations"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_allowedPassType];
  [v5 encodeObject:v6 forKey:@"alowedPassType"];
}

- (PKGroupsControllerSnapshotFetchOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKGroupsControllerSnapshotFetchOptions;
  id v5 = [(PKGroupsControllerSnapshotFetchOptions *)&v8 init];
  if (v5)
  {
    v5->_BOOL limitResults = [v4 decodeBoolForKey:@"limitResults"];
    v5->_includeAnnotations = [v4 decodeBoolForKey:@"includeAnnotations"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alowedPassType"];
    v5->_allowedPassType = [v6 unsignedIntegerValue];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[PKGroupsControllerSnapshotFetchOptions allocWithZone:a3] init];
  *((unsigned char *)result + 8) = self->_limitResults;
  *((unsigned char *)result + 9) = self->_includeAnnotations;
  *((void *)result + 2) = self->_allowedPassType;
  return result;
}

@end