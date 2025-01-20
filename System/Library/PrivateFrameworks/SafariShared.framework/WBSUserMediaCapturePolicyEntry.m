@interface WBSUserMediaCapturePolicyEntry
- (BOOL)_isValidUserMediaPermission:(unint64_t)a3;
- (BOOL)isValid;
- (BOOL)permissionExpiresWithinOneDay;
- (NSMutableDictionary)ephemeralSalts;
- (NSString)origin;
- (NSString)persistentSalt;
- (NSString)topLevelOrigin;
- (WBSUserMediaCapturePolicyEntry)initWithDictionaryRepresentation:(id)a3;
- (WBSUserMediaCapturePolicyEntry)initWithPermission:(unint64_t)a3 expirationPolicy:(unint64_t)a4 forOrigin:(id)a5 topLevelOrigin:(id)a6;
- (double)permissionExpirationDate;
- (double)permissionGrantDate;
- (id)dictionaryRepresentation;
- (unint64_t)permission;
- (void)setEphemeralSalts:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setPermission:(unint64_t)a3;
- (void)setPermissionExpirationDate:(double)a3;
- (void)setPermissionGrantDate:(double)a3;
- (void)setPersistentSalt:(id)a3;
- (void)setTopLevelOrigin:(id)a3;
- (void)updatePermission:(unint64_t)a3 expirationPolicy:(unint64_t)a4;
@end

@implementation WBSUserMediaCapturePolicyEntry

- (WBSUserMediaCapturePolicyEntry)initWithPermission:(unint64_t)a3 expirationPolicy:(unint64_t)a4 forOrigin:(id)a5 topLevelOrigin:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)WBSUserMediaCapturePolicyEntry;
  v13 = [(WBSUserMediaCapturePolicyEntry *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_origin, a5);
    objc_storeStrong((id *)&v14->_topLevelOrigin, a6);
    v14->_permissionGrantDate = CFAbsoluteTimeGetCurrent();
    [(WBSUserMediaCapturePolicyEntry *)v14 updatePermission:a3 expirationPolicy:a4];
    v15 = v14;
  }

  return v14;
}

- (WBSUserMediaCapturePolicyEntry)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WBSUserMediaCapturePolicyEntry;
  v5 = [(WBSUserMediaCapturePolicyEntry *)&v25 init];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = objc_msgSend(v4, "safari_numberForKey:", @"permissionExpirationDate");
  [v6 doubleValue];
  double v8 = v7;

  if (CFAbsoluteTimeGetCurrent() > v8) {
    goto LABEL_5;
  }
  v5->_permissionExpirationDate = v8;
  v9 = objc_msgSend(v4, "safari_numberForKey:", @"permissionGrantDateKey");
  [v9 doubleValue];
  double v11 = v10;

  if (v11 != 0.0 && v11 <= CFAbsoluteTimeGetCurrent())
  {
    v5->_permissionGrantDate = v11;
    v14 = objc_msgSend(v4, "safari_stringForKey:", @"origin");
    if ([v14 length])
    {
      uint64_t v15 = [v14 copy];
      origin = v5->_origin;
      v5->_origin = (NSString *)v15;

      objc_super v17 = objc_msgSend(v4, "safari_stringForKey:", @"topLevelOrigin");
      if ([v17 length])
      {
        uint64_t v18 = [v17 copy];
        topLevelOrigin = v5->_topLevelOrigin;
        v5->_topLevelOrigin = (NSString *)v18;

        v20 = objc_msgSend(v4, "safari_stringForKey:", @"salt");
        if ([v20 length])
        {
          uint64_t v21 = [v20 copy];
          persistentSalt = v5->_persistentSalt;
          v5->_persistentSalt = (NSString *)v21;
        }
        v23 = objc_msgSend(v4, "safari_numberForKey:", @"permission");
        uint64_t v24 = [v23 integerValue];

        if ([(WBSUserMediaCapturePolicyEntry *)v5 _isValidUserMediaPermission:v24]) {
          v5->_permission = v24;
        }
        id v12 = v5;
      }
      else
      {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
LABEL_5:
    id v12 = 0;
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  v14[6] = *MEMORY[0x1E4F143B8];
  v13[0] = @"permissionExpirationDate";
  v3 = [NSNumber numberWithDouble:self->_permissionExpirationDate];
  v14[0] = v3;
  v13[1] = @"permissionGrantDateKey";
  uint64_t v4 = [NSNumber numberWithDouble:self->_permissionGrantDate];
  v5 = (void *)v4;
  persistentSalt = &stru_1EFBE3CF8;
  unint64_t permission = self->_permission;
  if (self->_persistentSalt) {
    persistentSalt = (__CFString *)self->_persistentSalt;
  }
  v14[1] = v4;
  v14[2] = persistentSalt;
  v13[2] = @"salt";
  v13[3] = @"permission";
  double v8 = [NSNumber numberWithUnsignedInteger:permission];
  origin = self->_origin;
  topLevelOrigin = self->_topLevelOrigin;
  v14[3] = v8;
  v14[4] = origin;
  v13[4] = @"origin";
  v13[5] = @"topLevelOrigin";
  v14[5] = topLevelOrigin;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:6];

  return v11;
}

- (BOOL)isValid
{
  double permissionExpirationDate = self->_permissionExpirationDate;
  if (permissionExpirationDate == 0.0 || CFAbsoluteTimeGetCurrent() > permissionExpirationDate) {
    return 0;
  }
  unint64_t permission = self->_permission;
  return [(WBSUserMediaCapturePolicyEntry *)self _isValidUserMediaPermission:permission];
}

- (BOOL)permissionExpiresWithinOneDay
{
  CFAbsoluteTime v2 = self->_permissionExpirationDate + -86400.0;
  return CFAbsoluteTimeGetCurrent() > v2;
}

- (void)updatePermission:(unint64_t)a3 expirationPolicy:(unint64_t)a4
{
  if (-[WBSUserMediaCapturePolicyEntry _isValidUserMediaPermission:](self, "_isValidUserMediaPermission:")) {
    unint64_t v7 = a3;
  }
  else {
    unint64_t v7 = 0;
  }
  self->_unint64_t permission = v7;
  if (a4)
  {
    if (a4 == 1)
    {
      double v8 = 86400.0;
    }
    else
    {
      if (a4 != 2) {
        return;
      }
      double v8 = 2592000.0;
    }
    CFAbsoluteTime v9 = CFAbsoluteTimeGetCurrent() + v8;
  }
  else
  {
    CFAbsoluteTime v9 = 0.0;
  }
  self->_double permissionExpirationDate = v9;
}

- (BOOL)_isValidUserMediaPermission:(unint64_t)a3
{
  if ((_BYTE)a3) {
    BOOL v3 = a3 >= 0x100;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (double)permissionExpirationDate
{
  return self->_permissionExpirationDate;
}

- (void)setPermissionExpirationDate:(double)a3
{
  self->_double permissionExpirationDate = a3;
}

- (double)permissionGrantDate
{
  return self->_permissionGrantDate;
}

- (void)setPermissionGrantDate:(double)a3
{
  self->_permissionGrantDate = a3;
}

- (NSString)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (NSString)topLevelOrigin
{
  return self->_topLevelOrigin;
}

- (void)setTopLevelOrigin:(id)a3
{
}

- (NSString)persistentSalt
{
  return self->_persistentSalt;
}

- (void)setPersistentSalt:(id)a3
{
}

- (unint64_t)permission
{
  return self->_permission;
}

- (void)setPermission:(unint64_t)a3
{
  self->_unint64_t permission = a3;
}

- (NSMutableDictionary)ephemeralSalts
{
  return self->_ephemeralSalts;
}

- (void)setEphemeralSalts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralSalts, 0);
  objc_storeStrong((id *)&self->_persistentSalt, 0);
  objc_storeStrong((id *)&self->_topLevelOrigin, 0);
  objc_storeStrong((id *)&self->_origin, 0);
}

@end