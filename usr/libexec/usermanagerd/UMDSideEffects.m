@interface UMDSideEffects
@end

@implementation UMDSideEffects

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_security, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_libNotify, 0);
  objc_storeStrong((id *)&self->_kpersona, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_filesystem, 0);
  objc_storeStrong((id *)&self->_darwinDirectory, 0);
  objc_storeStrong((id *)&self->_commPage, 0);

  objc_storeStrong((id *)&self->_aks, 0);
}

@end