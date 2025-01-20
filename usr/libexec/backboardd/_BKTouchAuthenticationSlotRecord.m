@interface _BKTouchAuthenticationSlotRecord
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation _BKTouchAuthenticationSlotRecord

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (a3) {
    v5 = (void *)*((void *)a3 + 2);
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  unsigned int v7 = [v6 slotID];
  BOOL v8 = v7 == [(BKSTouchAuthenticationSpecification *)self->_authenticationSpecification slotID];

  return v8;
}

- (unint64_t)hash
{
  v2 = +[NSNumber numberWithUnsignedInt:[(BKSTouchAuthenticationSpecification *)self->_authenticationSpecification slotID]];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

@end