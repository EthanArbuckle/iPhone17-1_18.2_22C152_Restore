@interface SAOriginProcess
@end

@implementation SAOriginProcess

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pids, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end