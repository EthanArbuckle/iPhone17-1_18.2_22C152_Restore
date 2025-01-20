@interface GKRefreshData
- (NSDictionary)userInfo;
- (unsigned)dataType;
- (void)setDataType:(unsigned int)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation GKRefreshData

- (unsigned)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unsigned int)a3
{
  self->_dataType = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end