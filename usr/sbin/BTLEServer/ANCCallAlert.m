@interface ANCCallAlert
- (ANCCallAlert)initWithCall:(id)a3 callCenter:(id)a4 categoryID:(unsigned __int8)a5;
- (BOOL)hasNegativeAction;
- (BOOL)hasPositiveAction;
- (BOOL)isImportant;
- (BOOL)isPhoneNumber:(__CFString *)a3;
- (BOOL)performNegativeAction;
- (BOOL)performPositiveAction;
- (NSDate)callDate;
- (TUCall)call;
- (TUCallCenter)callCenter;
- (id)appIdentifier;
- (id)date;
- (id)message;
- (id)negativeActionLabel;
- (id)positiveActionLabel;
- (id)subtitle;
- (id)title;
- (unsigned)categoryId;
- (void)setCall:(id)a3;
- (void)setCallCenter:(id)a3;
- (void)setCallDate:(id)a3;
- (void)setCategoryId:(unsigned __int8)a3;
@end

@implementation ANCCallAlert

- (ANCCallAlert)initWithCall:(id)a3 callCenter:(id)a4 categoryID:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ANCCallAlert;
  id v11 = [(ANCAlert *)&v16 initWithCategoryID:v5];
  v12 = (ANCCallAlert *)v11;
  if (v11)
  {
    objc_storeStrong((id *)v11 + 2, a3);
    objc_storeStrong((id *)&v12->_call, a4);
    uint64_t v13 = +[NSDate date];
    callCenter = v12->_callCenter;
    v12->_callCenter = (TUCallCenter *)v13;

    *(&v12->super._silent + 1) = v5;
  }

  return v12;
}

- (BOOL)isPhoneNumber:(__CFString *)a3
{
  return CFStringFind(a3, @"@", 0).location == -1;
}

- (BOOL)isImportant
{
  return 1;
}

- (id)appIdentifier
{
  v3 = [(ANCCallAlert *)self call];
  v4 = [v3 provider];
  uint64_t v5 = [(ANCAlert *)self _appIdentifierForTUCallProvider:v4];

  return v5;
}

- (id)title
{
  v2 = [(ANCCallAlert *)self call];
  v3 = [v2 displayName];

  if ((unint64_t)[v3 length] >= 3
    && [v3 characterAtIndex:0] == 8234
    && objc_msgSend(v3, "characterAtIndex:", (char *)objc_msgSend(v3, "length") - 1) == 8236)
  {
    uint64_t v4 = [v3 substringWithRange:1, [v3 length] - 2];

    v3 = (void *)v4;
  }

  return v3;
}

- (id)subtitle
{
  v2 = [(ANCCallAlert *)self call];
  v3 = [v2 localizedLabel];

  return v3;
}

- (id)message
{
  return 0;
}

- (id)date
{
  return [(ANCCallAlert *)self callDate];
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

- (TUCall)call
{
  return *(TUCall **)&self->_categoryId;
}

- (void)setCall:(id)a3
{
}

- (TUCallCenter)callCenter
{
  return self->_call;
}

- (void)setCallCenter:(id)a3
{
}

- (NSDate)callDate
{
  return (NSDate *)self->_callCenter;
}

- (void)setCallDate:(id)a3
{
}

- (unsigned)categoryId
{
  return *(&self->super._silent + 1);
}

- (void)setCategoryId:(unsigned __int8)a3
{
  *(&self->super._silent + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_call, 0);

  objc_storeStrong((id *)&self->_categoryId, 0);
}

@end