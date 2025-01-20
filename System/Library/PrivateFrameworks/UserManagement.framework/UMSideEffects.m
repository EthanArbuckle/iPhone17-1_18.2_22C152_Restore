@interface UMSideEffects
- (UMLibInfoProviding)libInfo;
- (UMLibNotifyProviding)libNotify;
- (void)setLibInfo:(id)a3;
- (void)setLibNotify:(id)a3;
@end

@implementation UMSideEffects

- (UMLibNotifyProviding)libNotify
{
  return self->_libNotify;
}

- (UMLibInfoProviding)libInfo
{
  return self->_libInfo;
}

- (void)setLibInfo:(id)a3
{
}

- (void)setLibNotify:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libNotify, 0);
  objc_storeStrong((id *)&self->_libInfo, 0);
}

@end