@interface _BKMouseEventGlobalRoute
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation _BKMouseEventGlobalRoute

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = objc_opt_class();
  id v5 = a3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    char v8 = BSEqualObjects();
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return [(BKCAContextDestination *)self->_destination hash];
}

@end