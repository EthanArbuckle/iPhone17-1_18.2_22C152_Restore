@interface OTCliqueStatusWrapper
- (BOOL)isEqual:(id)a3;
- (OTCliqueStatusWrapper)initWithStatus:(int64_t)a3;
- (id)description;
- (int64_t)status;
@end

@implementation OTCliqueStatusWrapper

- (int64_t)status
{
  return self->_status;
}

- (id)description
{
  [(OTCliqueStatusWrapper *)self status];
  v2 = OTCliqueStatusToString();
  v3 = +[NSString stringWithFormat:@"<CliqueStatus: %@>", v2];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 status];
    BOOL v6 = v5 == (id)[(OTCliqueStatusWrapper *)self status];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (OTCliqueStatusWrapper)initWithStatus:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OTCliqueStatusWrapper;
  result = [(OTCliqueStatusWrapper *)&v5 init];
  if (result) {
    result->_status = a3;
  }
  return result;
}

@end