@interface ANCAlert
- (ANCAlert)initWithCategoryID:(unsigned __int8)a3;
- (BOOL)hasExtraContent;
- (BOOL)hasNegativeAction;
- (BOOL)hasPositiveAction;
- (BOOL)isImportant;
- (BOOL)isSilent;
- (BOOL)performNegativeAction;
- (BOOL)performPositiveAction;
- (BOOL)silent;
- (id)_appIdentifierForTUCallProvider:(id)a3;
- (id)appIdentifier;
- (id)date;
- (id)message;
- (id)negativeActionLabel;
- (id)positiveActionLabel;
- (id)subtitle;
- (id)title;
- (id)updateDNDEventDetails:(id)a3;
- (unsigned)categoryID;
- (void)setSilent:(BOOL)a3;
@end

@implementation ANCAlert

- (ANCAlert)initWithCategoryID:(unsigned __int8)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ANCAlert;
  result = [(ANCAlert *)&v5 init];
  if (result) {
    result->_categoryID = a3;
  }
  return result;
}

- (BOOL)isSilent
{
  return self->_silent;
}

- (BOOL)isImportant
{
  return 0;
}

- (id)appIdentifier
{
  return 0;
}

- (id)title
{
  return 0;
}

- (id)subtitle
{
  return 0;
}

- (id)message
{
  return 0;
}

- (id)date
{
  return 0;
}

- (BOOL)hasPositiveAction
{
  return 0;
}

- (BOOL)hasNegativeAction
{
  return 0;
}

- (id)positiveActionLabel
{
  return 0;
}

- (id)negativeActionLabel
{
  return 0;
}

- (BOOL)performPositiveAction
{
  return 0;
}

- (BOOL)performNegativeAction
{
  return 0;
}

- (BOOL)hasExtraContent
{
  return 0;
}

- (id)updateDNDEventDetails:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)_appIdentifierForTUCallProvider:(id)a3
{
  id v3 = a3;
  if ([v3 isTelephonyProvider])
  {
    v4 = @"com.apple.mobilephone";
  }
  else if ([v3 isFaceTimeProvider])
  {
    v4 = @"com.apple.facetime";
  }
  else
  {
    v4 = [v3 bundleIdentifier];
  }

  return v4;
}

- (unsigned)categoryID
{
  return self->_categoryID;
}

- (BOOL)silent
{
  return self->_silent;
}

- (void)setSilent:(BOOL)a3
{
  self->_silent = a3;
}

@end