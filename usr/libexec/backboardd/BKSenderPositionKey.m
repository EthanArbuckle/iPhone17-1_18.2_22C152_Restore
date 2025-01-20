@interface BKSenderPositionKey
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation BKSenderPositionKey

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  id v4 = [v6 appendUInt64:self->_senderID withName:@"senderID" format:1];
  id v5 = [v6 appendInteger:self->_positionID withName:@"positionID"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
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

  BOOL v9 = v8 && self->_senderID == v8[1] && self->_positionID == v8[2];
  return v9;
}

- (unint64_t)hash
{
  return self->_positionID;
}

@end