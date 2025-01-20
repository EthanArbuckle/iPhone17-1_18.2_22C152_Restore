@interface BKHitTestResultKey
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation BKHitTestResultKey

- (unint64_t)hash
{
  return [(BKCAContextDestination *)self->_destination hash];
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  id v6 = a3;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  BOOL v9 = v6 && BSEqualObjects() && self->_userIdentifier == v8[2];
  return v9;
}

@end