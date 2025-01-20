@interface SBSApplicationShortcutSystemIcon(SBHAdditions)
+ (id)sbh_defaultImage;
- (id)sbh_image;
- (id)sbh_systemImage;
@end

@implementation SBSApplicationShortcutSystemIcon(SBHAdditions)

+ (id)sbh_defaultImage
{
  if (sbh_defaultImage_onceToken != -1) {
    dispatch_once(&sbh_defaultImage_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)sbh_defaultImage___defaultImage;
  return v0;
}

- (id)sbh_systemImage
{
  unint64_t v1 = [a1 type];
  if (v1 > 0x1C)
  {
    v4 = 0;
  }
  else
  {
    unint64_t v2 = [*(&off_1E6AACBE0 + v1) unsignedIntegerValue];
    if (v2 > 0x1C) {
      v3 = 0;
    }
    else {
      v3 = off_1E6AACCC8[v2];
    }
    v4 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];
  }
  return v4;
}

- (id)sbh_image
{
  unint64_t v1 = @"ComposeNew";
  switch([a1 type])
  {
    case 0:
      break;
    case 1:
      unint64_t v1 = @"Play";
      break;
    case 2:
      unint64_t v1 = @"Pause";
      break;
    case 3:
      unint64_t v1 = @"Add";
      break;
    case 4:
      unint64_t v1 = @"Location";
      break;
    case 5:
      unint64_t v1 = @"Search";
      break;
    case 6:
      unint64_t v1 = @"Share";
      break;
    case 7:
      unint64_t v1 = @"Prohibit";
      break;
    case 8:
      unint64_t v1 = @"Contact";
      break;
    case 9:
      unint64_t v1 = @"Home";
      break;
    case 10:
      unint64_t v1 = @"MarkLocation";
      break;
    case 11:
      unint64_t v1 = @"Favorite";
      break;
    case 12:
      unint64_t v1 = @"Love";
      break;
    case 13:
      unint64_t v1 = @"Cloud";
      break;
    case 14:
      unint64_t v1 = @"Invitation";
      break;
    case 15:
      unint64_t v1 = @"Confirmation";
      break;
    case 16:
      unint64_t v1 = @"Mail";
      break;
    case 17:
      unint64_t v1 = @"Message";
      break;
    case 18:
      unint64_t v1 = @"Date";
      break;
    case 19:
      unint64_t v1 = @"Time";
      break;
    case 20:
      unint64_t v1 = @"CapturePhoto";
      break;
    case 21:
      unint64_t v1 = @"CaptureVideo";
      break;
    case 22:
      unint64_t v1 = @"Task";
      break;
    case 23:
      unint64_t v1 = @"TaskCompleted";
      break;
    case 24:
      unint64_t v1 = @"Alarm";
      break;
    case 25:
      unint64_t v1 = @"Bookmark";
      break;
    case 26:
      unint64_t v1 = @"Shuffle";
      break;
    case 27:
      unint64_t v1 = @"Audio";
      break;
    case 28:
      unint64_t v1 = @"Update";
      break;
    case 29:
      unint64_t v1 = @"rectangle.grid.2x2";
      break;
    case 30:
      unint64_t v2 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v3 = [v2 userInterfaceIdiom];

      if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        unint64_t v1 = @"apps.ipad.landscape";
      }
      else {
        unint64_t v1 = @"apps.iphone";
      }
      break;
    case 31:
      unint64_t v1 = @"trash";
      break;
    case 32:
      unint64_t v1 = @"minus.circle";
      break;
    case 33:
      unint64_t v1 = @"text.insert";
      break;
    default:
      unint64_t v1 = @"UnreadDot";
      break;
  }
  v4 = (void *)MEMORY[0x1E4FB1818];
  v5 = [NSString stringWithFormat:@"SBSApplicationShortcutSystemIcon_%@", v1];
  v6 = SBHBundle();
  v7 = [v4 imageNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  if (!v7)
  {
    v7 = [MEMORY[0x1E4FB1818] systemImageNamed:v1];
    if (!v7)
    {
      v7 = [MEMORY[0x1E4FB1818] _systemImageNamed:v1];
      if (!v7)
      {
        v8 = (void *)MEMORY[0x1E4FB1818];
        v9 = SBHBundle();
        v7 = [v8 imageNamed:v1 inBundle:v9 compatibleWithTraitCollection:0];

        if (!v7)
        {
          v10 = (void *)MEMORY[0x1E4FB1818];
          v11 = [NSString stringWithFormat:@"SBSApplicationShortcutSystemIcon_%@", @"UnreadDot"];
          v12 = SBHBundle();
          v7 = [v10 imageNamed:v11 inBundle:v12 compatibleWithTraitCollection:0];
        }
      }
    }
  }
  return v7;
}

@end