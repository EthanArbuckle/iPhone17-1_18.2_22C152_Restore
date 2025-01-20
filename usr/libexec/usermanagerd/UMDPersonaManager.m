@interface UMDPersonaManager
@end

@implementation UMDPersonaManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userManager);
  objc_storeStrong((id *)&self->_generation, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_volumeHelper, 0);

  objc_storeStrong((id *)&self->_se, 0);
}

@end