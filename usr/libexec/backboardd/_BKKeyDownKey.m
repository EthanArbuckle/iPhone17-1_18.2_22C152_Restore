@interface _BKKeyDownKey
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation _BKKeyDownKey

- (void)appendDescriptionToFormatter:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005279C;
  v5[3] = &unk_1000F8E50;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [v4 appendProem:0 block:v5];
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

  BOOL v9 = v8 && self->_senderID == v8[1] && self->_page == v8[2] && self->_usage == v8[3];
  return v9;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_page ^ self->_senderID ^ self->_usage;
  unint64_t v3 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * (v2 ^ (v2 >> 30))) ^ ((0xBF58476D1CE4E5B9 * (v2 ^ (v2 >> 30))) >> 27));
  return v3 ^ (v3 >> 31);
}

@end