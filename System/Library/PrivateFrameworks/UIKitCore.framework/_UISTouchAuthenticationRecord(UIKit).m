@interface _UISTouchAuthenticationRecord(UIKit)
+ (id)authenticationRecordForTouch:()UIKit;
@end

@implementation _UISTouchAuthenticationRecord(UIKit)

+ (id)authenticationRecordForTouch:()UIKit
{
  v3 = a3;
  if (qword_1EB261BD0 != -1) {
    dispatch_once(&qword_1EB261BD0, &__block_literal_global_352);
  }
  if (_MergedGlobals_1139)
  {
    if (v3) {
      v4 = (void *)v3[45];
    }
    else {
      v4 = 0;
    }
    id v5 = v4;
    if ([v5 _isHostedInAnotherProcess]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v6 = v5;
      v7 = (void *)MEMORY[0x1E4FB34C0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __69___UISTouchAuthenticationRecord_UIKit__authenticationRecordForTouch___block_invoke;
      v10[3] = &unk_1E52FC500;
      v11 = v3;
      id v12 = v6;
      v8 = [v7 build:v10];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end