@interface MSTriageChangeAction
+ (id)mf_indicatorPreviewChangeWithAction:(int64_t)a3 interaction:(id)a4;
@end

@implementation MSTriageChangeAction

+ (id)mf_indicatorPreviewChangeWithAction:(int64_t)a3 interaction:(id)a4
{
  id v5 = a4;
  v6 = v5;
  id v7 = 0;
  switch(a3)
  {
    case 2:
    case 10:
    case 11:
      id v7 = [objc_alloc((Class)MSTriageChangeAction) initWithChangeAction:a3 flagState:[v5 flagState] ^ [v5 shouldOverrideFlagState]];
      goto LABEL_14;
    case 3:
      id v8 = objc_alloc((Class)MSTriageChangeAction);
      id v9 = [v6 hasReadLater];
      id v10 = [v6 selectedDate];
      id v11 = [v8 initWithChangeAction:3 flagState:v9 readLaterDate:v10];
      goto LABEL_13;
    case 6:
      unsigned int v12 = [v5 flagState];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [v6 flagColor];

        if (v13) {
          char v14 = v12;
        }
        else {
          char v14 = 0;
        }
        if ((v14 & 1) == 0) {
          goto LABEL_9;
        }
      }
      else if (!v12)
      {
LABEL_9:
        id v10 = 0;
        uint64_t v15 = 0;
        goto LABEL_12;
      }
      id v10 = [objc_alloc((Class)NSIndexSet) initWithIndex:[MFFlagTriageInteraction defaultColor]];
      uint64_t v15 = 1;
LABEL_12:
      id v11 = [objc_alloc((Class)MSTriageChangeAction) initWithChangeAction:6 flagState:v15 flagColors:v10];
LABEL_13:
      id v7 = v11;

LABEL_14:
      return v7;
    default:
      goto LABEL_14;
  }
}

@end