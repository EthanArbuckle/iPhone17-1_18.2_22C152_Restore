@interface BKTouchContact
- (BKTouchContact)init;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation BKTouchContact

- (BKTouchContact)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKTouchContact;
  v2 = [(BKTouchContact *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    destinations = v2->_destinations;
    v2->_destinations = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostingChain, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_hitTestSecurityAnalysis, 0);
  objc_storeStrong((id *)&self->_hitTestInformationAtDown, 0);

  objc_storeStrong((id *)&self->_routingPolicy, 0);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v5 = [a3 appendInteger:self->_pathIndex withName:@"pathIndex"];
  id v6 = [a3 appendInteger:self->_touchIdentifier withName:@"touchIdentifier"];
  unint64_t presence = self->_presence;
  if (presence > 2) {
    CFStringRef v8 = @"<unknown>";
  }
  else {
    CFStringRef v8 = *(&off_1000F8970 + presence);
  }
  [a3 appendString:v8 withName:0];
  CFStringRef v9 = @"startAvoiding";
  switch(self->_hitTestPolicy)
  {
    case 0:
      goto LABEL_10;
    case 1:
      goto LABEL_9;
    case 2:
      CFStringRef v9 = @"avoid";
      goto LABEL_9;
    case 3:
      CFStringRef v9 = @"avoidThenReset";
      goto LABEL_9;
    case 4:
      CFStringRef v9 = @"locked";
      goto LABEL_9;
    default:
      CFStringRef v9 = @"<unknown>";
LABEL_9:
      [a3 appendString:v9 withName:0];
LABEL_10:
      if (self->_hitTestContextCategory)
      {
        v10 = NSStringFromBKSTouchHitTestContextCategory();
        [a3 appendString:v10 withName:@"hitTestCategory"];
      }
      id v11 = [a3 appendBool:self->_touchDetached withName:@"detached" ifEqualTo:1];
      uint64_t userIdentifier = self->_userIdentifier;
      if (userIdentifier) {
        id v13 = [a3 appendUInt64:userIdentifier withName:@"userIdentifier" format:1];
      }
      uint64_t v14 = objc_opt_class();
      id v15 = a3;
      if (v14)
      {
        if (objc_opt_isKindOfClass()) {
          v16 = v15;
        }
        else {
          v16 = 0;
        }
      }
      else
      {
        v16 = 0;
      }
      id v17 = v16;

      if (v17)
      {
        destinations = self->_destinations;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100091B48;
        v19[3] = &unk_1000F8950;
        id v20 = v17;
        [v20 appendCollection:destinations withName:@"destinations" itemBlock:v19];
      }
      return;
  }
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:self];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  id v6 = a3;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  CFStringRef v8 = v7;

  if (v8) {
    BOOL v9 = v8[1] == self->_pathIndex;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = +[NSNumber numberWithInteger:self->_pathIndex];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

@end