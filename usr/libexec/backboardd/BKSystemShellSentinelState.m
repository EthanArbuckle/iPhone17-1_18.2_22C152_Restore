@interface BKSystemShellSentinelState
@end

@implementation BKSystemShellSentinelState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shellsFinishedStartup, 0);
  objc_storeStrong((id *)&self->_systemShells, 0);

  objc_storeStrong((id *)&self->_primarySystemShell, 0);
}

@end