@interface NSStringFrom
@end

@implementation NSStringFrom

uint64_t __NSStringFrom_PBUIPosterViewControllerUpdateReasons_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 > 15)
  {
    switch(a2)
    {
      case 16:
        v2 = @"CreateHomeScreenController";
        break;
      case 32:
        v2 = @"OrientationUpdate";
        break;
      case 64:
        v2 = @"MaglevDynamicOrientationUpdate";
        break;
      default:
LABEL_13:
        v2 = @"(invalid _PBUIPosterViewControllerUpdateReason specified)";
        break;
    }
  }
  else
  {
    v2 = @"Unknown";
    switch(a2)
    {
      case 0:
        return objc_msgSend(*(id *)(a1 + 32), "bs_safeAddObject:", v2);
      case 1:
        v2 = @"PosterUpdate";
        break;
      case 2:
        v2 = @"UpdateForActiveVariant";
        break;
      case 4:
        v2 = @"SceneDeactivation";
        break;
      case 8:
        v2 = @"SceneActivation";
        break;
      default:
        goto LABEL_13;
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "bs_safeAddObject:", v2);
}

@end