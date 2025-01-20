@interface UIDeviceNativeUserInterfaceIdiom
@end

@implementation UIDeviceNativeUserInterfaceIdiom

void ___UIDeviceNativeUserInterfaceIdiom_block_invoke()
{
  qword_1EB260F00 = -1;
  id v5 = +[_UIDeviceInitialDeviceConfigurationLoader sharedLoader];
  v0 = [v5 initialDeviceContext];
  v1 = v0;
  if (!v0)
  {
LABEL_5:
    unint64_t v2 = qword_1EB260F00;
    if (qword_1EB260F00 != -1) {
      goto LABEL_10;
    }
LABEL_8:
    unint64_t v2 = _UIDeviceNativeUserInterfaceIdiomIgnoringClassic();
LABEL_9:
    qword_1EB260F00 = v2;
LABEL_10:
    if (v2 == 4) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  unint64_t v2 = [v0 deviceInfoIntegerValueForKey:*MEMORY[0x1E4FB34E0]] - 1;
  if (v2 < 0xB) {
    goto LABEL_9;
  }
  qword_1EB260F00 = -1;
  int v3 = [v1 deviceInfoIntegerValueForKey:*MEMORY[0x1E4FB34D0]] + 1;
  uint64_t v4 = 1;
  switch(v3)
  {
    case 0:
      qword_1EB260F00 = -1;
      goto LABEL_8;
    case 1:
    case 2:
      uint64_t v4 = 0;
      break;
    case 3:
      break;
    case 4:
      uint64_t v4 = 2;
      break;
    case 5:
      goto LABEL_16;
    default:
      goto LABEL_5;
  }
  qword_1EB260F00 = v4;
LABEL_14:
  if (+[UIDevice _isWatch]
    || +[UIDevice _isWatchCompanion])
  {
LABEL_16:
    qword_1EB260F00 = 4;
  }
LABEL_17:
}

@end