@interface UIApplicationIgnoresDefaultSceneForLegacyInterfaceOrientation
@end

@implementation UIApplicationIgnoresDefaultSceneForLegacyInterfaceOrientation

uint64_t ___UIApplicationIgnoresDefaultSceneForLegacyInterfaceOrientation_block_invoke()
{
  if (qword_1EB25B938 != -1) {
    dispatch_once(&qword_1EB25B938, &__block_literal_global_3782);
  }
  if (qword_1EB25B930)
  {
    if ([(id)qword_1EB25B930 isEqualToString:@"com.apple.Home.HomeUIService"])
    {
      char v0 = 1;
      goto LABEL_10;
    }
    if (qword_1EB25B938 != -1) {
      dispatch_once(&qword_1EB25B938, &__block_literal_global_3782);
    }
  }
  if (!qword_1EB25B930)
  {
    byte_1EB25B50D = 0;
    goto LABEL_13;
  }
  char v0 = [(id)qword_1EB25B930 isEqualToString:@"com.apple.ScreenshotServicesService"];
LABEL_10:
  byte_1EB25B50D = v0;
  if (qword_1EB25B938 != -1) {
    dispatch_once(&qword_1EB25B938, &__block_literal_global_3782);
  }
LABEL_13:
  if (qword_1EB25B930)
  {
    char v1 = [(id)qword_1EB25B930 isEqualToString:@"com.apple.WebSheet"];
    byte_1EB25B50D |= v1;
    if (qword_1EB25B938 != -1) {
      dispatch_once(&qword_1EB25B938, &__block_literal_global_3782);
    }
  }
  if (qword_1EB25B930)
  {
    char v2 = [(id)qword_1EB25B930 isEqualToString:@"com.apple.PassbookUIService"];
    byte_1EB25B50D |= v2;
    if (qword_1EB25B938 != -1) {
      dispatch_once(&qword_1EB25B938, &__block_literal_global_3782);
    }
  }
  if (qword_1EB25B930)
  {
    char v3 = [(id)qword_1EB25B930 isEqualToString:@"com.apple.mobilesms.compose"];
    uint64_t v4 = qword_1EB25B938;
    if (v3)
    {
      char v5 = 1;
      goto LABEL_27;
    }
    if (qword_1EB25B938 != -1) {
      dispatch_once(&qword_1EB25B938, &__block_literal_global_3782);
    }
  }
  char v5 = qword_1EB25B930;
  if (qword_1EB25B930)
  {
    char v5 = [(id)qword_1EB25B930 isEqualToString:@"com.apple.gamecenter.GameCenterUIService"];
    uint64_t v4 = qword_1EB25B938;
  }
  else
  {
    uint64_t v4 = -1;
  }
LABEL_27:
  byte_1EB25B50D |= v5;
  if (v4 != -1) {
    dispatch_once(&qword_1EB25B938, &__block_literal_global_3782);
  }
  if (qword_1EB25B930)
  {
    char v6 = [(id)qword_1EB25B930 isEqualToString:@"com.apple.shortcuts.runtime"];
    byte_1EB25B50D |= v6;
    if (qword_1EB25B938 != -1) {
      dispatch_once(&qword_1EB25B938, &__block_literal_global_3782);
    }
  }
  if (qword_1EB25B930)
  {
    char v7 = [(id)qword_1EB25B930 isEqualToString:@"com.apple.ScreenTimeUnlock"];
    byte_1EB25B50D |= v7;
    if (qword_1EB25B938 != -1) {
      dispatch_once(&qword_1EB25B938, &__block_literal_global_3782);
    }
  }
  if (qword_1EB25B930)
  {
    char v8 = [(id)qword_1EB25B930 isEqualToString:@"com.apple.SafariViewService"];
    byte_1EB25B50D |= v8;
    if (qword_1EB25B938 != -1) {
      dispatch_once(&qword_1EB25B938, &__block_literal_global_3782);
    }
  }
  if (qword_1EB25B930)
  {
    char v9 = [(id)qword_1EB25B930 isEqualToString:@"com.apple.datadetectors.DDActionsService"];
    byte_1EB25B50D |= v9;
    if (qword_1EB25B938 != -1) {
      dispatch_once(&qword_1EB25B938, &__block_literal_global_3782);
    }
  }
  uint64_t result = qword_1EB25B930;
  if (qword_1EB25B930) {
    uint64_t result = [(id)qword_1EB25B930 isEqualToString:@"com.apple.Photos.PhotosUIService"];
  }
  byte_1EB25B50D |= result;
  return result;
}

@end