@interface GEOCompanionStep
- (id)representativeSignGuidanceEvent;
@end

@implementation GEOCompanionStep

- (id)representativeSignGuidanceEvent
{
  v4 = objc_getAssociatedObject(self, a2);
  if (v4)
  {
LABEL_4:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v4;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;
    goto LABEL_8;
  }
  v5 = [(GEOCompanionStep *)self guidanceEvents];
  v4 = sub_1009338EC(v5);

  if (v4)
  {
    objc_setAssociatedObject(self, a2, v4, (void *)1);
    goto LABEL_4;
  }
  v4 = +[NSNull null];
  objc_setAssociatedObject(self, a2, v4, (void *)1);
  id v7 = 0;
LABEL_8:

  return v7;
}

@end