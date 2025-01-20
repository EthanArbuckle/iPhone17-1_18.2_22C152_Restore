@interface ANCBulletinAlert
- (ANCBulletinAlert)initWithBulletin:(id)a3 observer:(id)a4 categoryID:(unsigned __int8)a5;
- (BBBulletin)bulletin;
- (BBObserver)observer;
- (BOOL)hasExtraContent;
- (BOOL)hasNegativeAction;
- (BOOL)isSilent;
- (BOOL)performNegativeAction;
- (id)appIdentifier;
- (id)date;
- (id)message;
- (id)negativeActionLabel;
- (id)subtitle;
- (id)title;
- (id)updateDNDEventDetails:(id)a3;
- (void)setBulletin:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation ANCBulletinAlert

- (ANCBulletinAlert)initWithBulletin:(id)a3 observer:(id)a4 categoryID:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ANCBulletinAlert;
  v11 = [(ANCAlert *)&v14 initWithCategoryID:v5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bulletin, a3);
    objc_storeStrong((id *)&v12->_observer, a4);
  }

  return v12;
}

- (BOOL)isSilent
{
  v2 = self;
  v3 = [(ANCBulletinAlert *)self bulletin];
  unsigned __int8 v4 = [v3 isLoading];
  LOBYTE(v2) = v4 | [(ANCAlert *)v2 silent];

  return (char)v2;
}

- (id)appIdentifier
{
  v2 = [(ANCBulletinAlert *)self bulletin];
  v3 = [v2 sectionID];

  return v3;
}

- (id)title
{
  v3 = [(ANCBulletinAlert *)self bulletin];
  unsigned __int8 v4 = [v3 title];

  uint64_t v5 = [(ANCBulletinAlert *)self bulletin];
  v6 = v5;
  if (v4)
  {
    v7 = [v5 title];
    v8 = [v7 substringWithValidUnicode];

LABEL_5:
    goto LABEL_6;
  }
  id v9 = [v5 sectionID];

  if (v9)
  {
    id v10 = [(ANCBulletinAlert *)self bulletin];
    v11 = [v10 sectionID];
    v6 = +[LSApplicationProxy applicationProxyForIdentifier:v11];

    v8 = [v6 localizedName];
    goto LABEL_5;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (id)subtitle
{
  v2 = [(ANCBulletinAlert *)self bulletin];
  v3 = [v2 subtitle];
  unsigned __int8 v4 = [v3 substringWithValidUnicode];

  return v4;
}

- (id)message
{
  v2 = [(ANCBulletinAlert *)self bulletin];
  v3 = [v2 message];
  unsigned __int8 v4 = [v3 substringWithValidUnicode];

  return v4;
}

- (id)date
{
  v2 = [(ANCBulletinAlert *)self bulletin];
  v3 = [v2 date];

  return v3;
}

- (BOOL)hasNegativeAction
{
  v2 = [(ANCBulletinAlert *)self bulletin];
  unsigned __int8 v3 = [v2 clearable];

  return v3;
}

- (id)negativeActionLabel
{
  v2 = +[NSBundle mobileBluetoothBundle];
  unsigned __int8 v3 = [v2 localizedStringForKey:@"CLEAR" value:@"Clear" table:0];

  return v3;
}

- (BOOL)performNegativeAction
{
  observer = self->_observer;
  unsigned __int8 v4 = [(ANCBulletinAlert *)self bulletin];
  uint64_t v5 = +[NSSet setWithObject:v4];
  v6 = [(ANCBulletinAlert *)self bulletin];
  v7 = [v6 sectionID];
  [(BBObserver *)observer clearBulletins:v5 inSection:v7];

  return 1;
}

- (BOOL)hasExtraContent
{
  v2 = [(ANCBulletinAlert *)self bulletin];
  BOOL v3 = [v2 primaryAttachmentType] != 0;

  return v3;
}

- (id)updateDNDEventDetails:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ANCBulletinAlert *)self bulletin];
  v6 = [v5 sectionID];
  [v4 setBundleIdentifier:v6];

  v7 = [(ANCBulletinAlert *)self bulletin];
  v8 = [v7 threadID];
  id v9 = [v8 length];

  id v10 = [(ANCBulletinAlert *)self bulletin];
  if (v9)
  {
    v11 = [v10 threadID];
    [v4 setThreadIdentifier:v11];
  }
  else
  {
    v11 = [v10 sectionID];
    v12 = +[NSString stringWithFormat:@"req-%@", v11];
    [v4 setThreadIdentifier:v12];
  }
  v13 = [(ANCBulletinAlert *)self bulletin];
  objc_super v14 = [v13 filterCriteria];
  [v4 setFilterCriteria:v14];

  v15 = [(ANCBulletinAlert *)self bulletin];
  v16 = [v15 publisherMatchID];
  [v4 setIdentifier:v16];

  v17 = [(ANCBulletinAlert *)self bulletin];
  v18 = [v17 communicationContext];

  if (v18)
  {
    v19 = [v18 sender];
    id v20 = objc_alloc_init((Class)DNDMutableContactHandle);
    id v21 = [v19 handleType];
    if (v21 == (id)1) {
      uint64_t v22 = 1;
    }
    else {
      uint64_t v22 = 2 * (v21 == (id)2);
    }
    [v20 setType:v22];
    v23 = [v19 handle];
    [v20 setValue:v23];

    [v4 setSender:v20];
  }
  v24 = [(ANCBulletinAlert *)self bulletin];
  if ([v24 ignoresQuietMode])
  {

LABEL_12:
    uint64_t v27 = 2;
LABEL_13:
    [v4 setUrgency:v27];
    goto LABEL_14;
  }
  v25 = [(ANCBulletinAlert *)self bulletin];
  id v26 = [v25 interruptionLevel];

  if (v26 == (id)3) {
    goto LABEL_12;
  }
  v31 = [(ANCBulletinAlert *)self bulletin];
  id v32 = [v31 interruptionLevel];

  if (v32 == (id)2)
  {
    uint64_t v27 = 1;
    goto LABEL_13;
  }
LABEL_14:
  v28 = [(ANCBulletinAlert *)self bulletin];
  v29 = [v28 contentType];

  if ([v29 isEqualToString:BBBulletinContentTypeMessagingDirect])
  {
    uint64_t v30 = 3;
  }
  else if ([v29 isEqualToString:BBBulletinContentTypeMessagingGroup])
  {
    uint64_t v30 = 4;
  }
  else if (([v29 isEqualToString:BBBulletinContentTypeVoicemail] & 1) != 0 {
         || ([v29 isEqualToString:BBBulletinContentTypeMissedCall] & 1) != 0
  }
         || ([v29 isEqualToString:BBBulletinContentTypeCallOther] & 1) != 0)
  {
    uint64_t v30 = 2;
  }
  else
  {
    uint64_t v30 = [v29 isEqualToString:BBBulletinContentTypeIncomingCall];
  }
  [v4 setType:v30];

  return v4;
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
}

- (BBObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);

  objc_storeStrong((id *)&self->_bulletin, 0);
}

@end