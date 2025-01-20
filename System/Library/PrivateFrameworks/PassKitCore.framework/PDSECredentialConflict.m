@interface PDSECredentialConflict
- (BOOL)isEqual:(id)a3;
- (PDSECredentialConflict)init;
- (unint64_t)hash;
@end

@implementation PDSECredentialConflict

- (PDSECredentialConflict)init
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    BOOL v6 = self->_type == v5[1];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t type = self->_type;
  return PKObjectHash(&type, 8uLL);
}

@end