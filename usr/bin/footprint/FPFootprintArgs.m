@interface FPFootprintArgs
@end

@implementation FPFootprintArgs

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedPidsOrProcesses, 0);
  objc_storeStrong((id *)&self->_potentialTargetProcesses, 0);
  objc_storeStrong((id *)&self->_targetPids, 0);
  objc_storeStrong((id *)&self->_perfdataOutputFile, 0);
  objc_storeStrong((id *)&self->_JSONOutputFile, 0);

  objc_storeStrong((id *)&self->_textSort, 0);
}

@end