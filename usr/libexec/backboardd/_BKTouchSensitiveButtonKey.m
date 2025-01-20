@interface _BKTouchSensitiveButtonKey
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (unint64_t)hash;
- (void)appendDescriptionToStream:(id)a3;
@end

@implementation _BKTouchSensitiveButtonKey

- (void)appendDescriptionToStream:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10003BA20;
  v4[3] = &unk_1000F8E50;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [v3 appendProem:0 block:v4];
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
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

  BOOL v9 = v8
    && self->_senderID == v8[2]
    && self->_page == *((unsigned __int16 *)v8 + 4)
    && self->_usage == *((unsigned __int16 *)v8 + 5);

  return v9;
}

- (unint64_t)hash
{
  return self->_usage;
}

@end