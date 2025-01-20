@interface UIColor(NotesColors)
+ (id)ic_notesAppYellowColor;
+ (id)ic_notesDefaultTextColor;
@end

@implementation UIColor(NotesColors)

+ (id)ic_notesAppYellowColor
{
  if (ic_notesAppYellowColor_onceToken != -1) {
    dispatch_once(&ic_notesAppYellowColor_onceToken, &__block_literal_global_91);
  }
  v0 = (void *)ic_notesAppYellowColor_appYellowColor;
  return v0;
}

+ (id)ic_notesDefaultTextColor
{
  if (ic_notesDefaultTextColor_onceToken[0] != -1) {
    dispatch_once(ic_notesDefaultTextColor_onceToken, &__block_literal_global_2_0);
  }
  v0 = (void *)ic_notesDefaultTextColor_defaultTextColor;
  return v0;
}

@end