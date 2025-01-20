@interface ICASBioAuthType
- (ICASBioAuthType)initWithBioAuthType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)bioAuthType;
@end

@implementation ICASBioAuthType

- (ICASBioAuthType)initWithBioAuthType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASBioAuthType;
  result = [(ICASBioAuthType *)&v5 init];
  if (result) {
    result->_bioAuthType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASBioAuthType *)self bioAuthType];
  v4 = @"unknown";
  if (v3 == 1) {
    v4 = @"face";
  }
  if (v3 == 2) {
    return @"finger";
  }
  else {
    return v4;
  }
}

- (int64_t)bioAuthType
{
  return self->_bioAuthType;
}

@end