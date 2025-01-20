@interface HomeDeselectionReason
- (HomeDeselectionReason)initWithAction:(int64_t)a3;
- (id)description;
- (int64_t)action;
@end

@implementation HomeDeselectionReason

- (HomeDeselectionReason)initWithAction:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HomeDeselectionReason;
  result = [(HomeDeselectionReason *)&v5 init];
  if (result) {
    result->_action = a3;
  }
  return result;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = self->_action - 1;
  if (v4 > 2) {
    CFStringRef v5 = @"HomeDeselectionActionUnknown";
  }
  else {
    CFStringRef v5 = off_10131B838[v4];
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; action = %@>",
           v3,
           self,
           v5);
}

- (int64_t)action
{
  return self->_action;
}

@end