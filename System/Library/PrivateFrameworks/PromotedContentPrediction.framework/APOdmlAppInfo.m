@interface APOdmlAppInfo
- (APOdmlAppInfo)initWithBundleID:(id)a3 adamID:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleID;
- (unint64_t)adamID;
- (void)setAdamID:(unint64_t)a3;
- (void)setBundleID:(id)a3;
@end

@implementation APOdmlAppInfo

- (APOdmlAppInfo)initWithBundleID:(id)a3 adamID:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)APOdmlAppInfo;
  v7 = [(APOdmlAppInfo *)&v12 init];
  v9 = v7;
  if (v7)
  {
    objc_msgSend_setBundleID_(v7, v8, (uint64_t)v6);
    objc_msgSend_setAdamID_(v9, v10, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    uint64_t v9 = objc_msgSend_adamID(self, v7, v8);
    BOOL v12 = v9 == objc_msgSend_adamID(v4, v10, v11);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (unint64_t)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(unint64_t)a3
{
  self->_adamID = a3;
}

- (void).cxx_destruct
{
}

@end