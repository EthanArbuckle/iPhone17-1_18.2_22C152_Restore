@interface MFMailboxFilter
+ (id)_addressLabelOfType:(int64_t)a3;
+ (id)filterForAccount:(id)a3 iconFromSmartMailbox:(id)a4;
+ (id)filterForCCMeMessages;
+ (id)filterForFlaggedMessages;
+ (id)filterForMessagesWithAttachments;
+ (id)filterForSender:(id)a3;
+ (id)filterForToMeMessages;
+ (id)filterForTodayMessages;
+ (id)filterForUnreadMessages;
+ (id)filterForVIPMessages;
- (BOOL)hasCriterionOfType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFilter:(id)a3;
- (BOOL)isEquivalentToCriterion:(id)a3;
- (MFMailboxFilter)initWithAccount:(id)a3 iconFromSmartMailbox:(id)a4;
- (MFMailboxFilter)initWithType:(int64_t)a3 name:(id)a4 description:(id)a5 criterion:(id)a6;
- (MFMailboxFilter)initWithType:(int64_t)a3 name:(id)a4 description:(id)a5 icon:(id)a6 iconTintColor:(id)a7 criterion:(id)a8;
- (MFMessageCriterion)criterion;
- (id)_blankImage;
- (id)debugDescription;
- (id)initForCCMeMessages;
- (id)initForFlaggedMessages;
- (id)initForMessagesWithAttachments;
- (id)initForSender:(id)a3;
- (id)initForToMeMessages;
- (id)initForTodayMessages;
- (id)initForUnreadMessages;
- (id)initForVIPMessages;
- (unint64_t)hash;
- (void)setCriterion:(id)a3;
@end

@implementation MFMailboxFilter

- (MFMailboxFilter)initWithType:(int64_t)a3 name:(id)a4 description:(id)a5 criterion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(MFMailboxFilter *)self _blankImage];
  v14 = [(MFMailboxFilter *)self initWithType:a3 name:v10 description:v11 icon:v13 iconTintColor:0 criterion:v12];

  return v14;
}

- (MFMailboxFilter)initWithType:(int64_t)a3 name:(id)a4 description:(id)a5 icon:(id)a6 iconTintColor:(id)a7 criterion:(id)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v20 = v19;
  if (v15)
  {
    if (v19) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"MFMailboxFilter.m", 31, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v20) {
      goto LABEL_3;
    }
  }
  v25 = +[NSAssertionHandler currentHandler];
  [v25 handleFailureInMethod:a2, self, @"MFMailboxFilter.m", 32, @"Invalid parameter not satisfying: %@", @"criterion" object file lineNumber description];

LABEL_3:
  v27.receiver = self;
  v27.super_class = (Class)MFMailboxFilter;
  LOBYTE(v26) = [v20 criterionType] == (id)23;
  v21 = [(MFMailboxFilter *)&v27 initWithType:a3 name:v15 description:v16 iconImageName:0 iconTintColor:v18 predicate:0 hasMailboxPredicate:v26];
  if (v21)
  {
    v22 = [v17 imageWithRenderingMode:2];
    [(MFMailboxFilter *)v21 setIcon:v22];

    objc_storeStrong((id *)&v21->_criterion, a8);
  }

  return v21;
}

- (id)_blankImage
{
  if (qword_100699AF0 != -1) {
    dispatch_once(&qword_100699AF0, &stru_10060B980);
  }
  v2 = (void *)qword_100699AE8;

  return v2;
}

- (BOOL)isEquivalentToCriterion:(id)a3
{
  id v4 = a3;
  v5 = [(MFMailboxFilter *)self criterion];
  unsigned __int8 v6 = [v5 isEqual:v4];

  return v6;
}

- (BOOL)hasCriterionOfType:(int64_t)a3
{
  id v4 = [(MFMailboxFilter *)self criterion];
  LOBYTE(a3) = [v4 criterionType] == (id)a3;

  return a3;
}

- (unint64_t)hash
{
  v3 = [(MFMailboxFilter *)self predicate];
  if (v3) {
    [(MFMailboxFilter *)self predicate];
  }
  else {
  id v4 = [(MFMailboxFilter *)self criterion];
  }
  id v5 = [v4 hash];

  unsigned __int8 v6 = [(MFMailboxFilter *)self name];
  id v7 = [v6 hash];

  v8 = [(MFMailboxFilter *)self filterDescription];
  v9 = (char *)[v8 hash] + 33 * ((void)v7 + 33 * (void)v5) + 35937;

  return (unint64_t)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MFMailboxFilter *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(MFMailboxFilter *)self isEqualToFilter:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToFilter:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(MFMailboxFilter *)self predicate];

    if (v5)
    {
      unsigned __int8 v6 = [(MFMailboxFilter *)self predicate];
      unsigned int v7 = [v4 isEquivalentToPredicate:v6];
    }
    else
    {
      unsigned __int8 v6 = [(MFMailboxFilter *)self criterion];
      v9 = [v4 criterion];
      unsigned int v7 = [v6 isEqual:v9];
    }
    id v10 = [(MFMailboxFilter *)self name];
    id v11 = [v4 name];
    if ([v10 isEqualToString:v11])
    {
      id v12 = [(MFMailboxFilter *)self filterDescription];
      v13 = [v4 filterDescription];
      unsigned int v8 = [v12 isEqualToString:v13] & v7;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  BOOL v5 = [(MFMailboxFilter *)self name];
  unsigned __int8 v6 = [(MFMailboxFilter *)self filterDescription];
  unsigned int v7 = [(MFMailboxFilter *)self criterion];
  unsigned int v8 = [(MFMailboxFilter *)self predicate];
  v9 = +[NSString stringWithFormat:@"<%@: %p\nName: %@\nDescription:  %@\nCriterion: \n%@\nPredicate: \n%@", v4, self, v5, v6, v7, v8];

  return v9;
}

- (id)initForFlaggedMessages
{
  v6.receiver = self;
  v6.super_class = (Class)MFMailboxFilter;
  v2 = [(MFMailboxFilter *)&v6 initForFlaggedMessages];
  if (v2)
  {
    uint64_t v3 = +[MFMessageCriterion flaggedMessageCriterion];
    id v4 = (void *)v2[1];
    v2[1] = v3;
  }
  return v2;
}

- (id)initForUnreadMessages
{
  v6.receiver = self;
  v6.super_class = (Class)MFMailboxFilter;
  v2 = [(MFMailboxFilter *)&v6 initForUnreadMessages];
  if (v2)
  {
    uint64_t v3 = +[MFMessageCriterion unreadMessageCriterion];
    id v4 = (void *)v2[1];
    v2[1] = v3;
  }
  return v2;
}

- (id)initForToMeMessages
{
  v7.receiver = self;
  v7.super_class = (Class)MFMailboxFilter;
  v2 = [(MFMailboxFilter *)&v7 initForToMeMessages];
  if (v2)
  {
    uint64_t v3 = +[MFMessageCriterion toMeCriterion];
    id v4 = (void *)v2[1];
    v2[1] = v3;

    BOOL v5 = +[MFMailboxFilter _addressLabelOfType:2];
    [v2 setIcon:v5];
  }
  return v2;
}

- (id)initForCCMeMessages
{
  v7.receiver = self;
  v7.super_class = (Class)MFMailboxFilter;
  v2 = [(MFMailboxFilter *)&v7 initForCCMeMessages];
  if (v2)
  {
    uint64_t v3 = +[MFMessageCriterion ccMeCriterion];
    id v4 = (void *)v2[1];
    v2[1] = v3;

    BOOL v5 = +[MFMailboxFilter _addressLabelOfType:3];
    [v2 setIcon:v5];
  }
  return v2;
}

- (id)initForTodayMessages
{
  v6.receiver = self;
  v6.super_class = (Class)MFMailboxFilter;
  v2 = [(MFMailboxFilter *)&v6 initForTodayMessages];
  if (v2)
  {
    uint64_t v3 = +[MFMessageCriterion todayMessageCriterion];
    id v4 = (void *)v2[1];
    v2[1] = v3;
  }
  return v2;
}

- (id)initForMessagesWithAttachments
{
  v6.receiver = self;
  v6.super_class = (Class)MFMailboxFilter;
  v2 = [(MFMailboxFilter *)&v6 initForMessagesWithAttachments];
  if (v2)
  {
    uint64_t v3 = +[MFMessageCriterion hasAttachmentsCriterion];
    id v4 = (void *)v2[1];
    v2[1] = v3;
  }
  return v2;
}

- (id)initForVIPMessages
{
  v6.receiver = self;
  v6.super_class = (Class)MFMailboxFilter;
  v2 = [(MFMailboxFilter *)&v6 initForVIPMessages];
  if (v2)
  {
    uint64_t v3 = +[MFMessageCriterion senderIsVIPCriterion:1];
    id v4 = (void *)v2[1];
    v2[1] = v3;
  }
  return v2;
}

- (MFMailboxFilter)initWithAccount:(id)a3 iconFromSmartMailbox:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MFMailboxFilter;
  objc_super v7 = [(MFMailboxFilter *)&v14 initWithAccount:v6 iconFromSmartMailbox:a4];
  if (v7)
  {
    unsigned int v8 = [v6 objectID];
    v9 = [v8 representedObjectID];

    id v10 = +[MailAccount accountWithUniqueId:v9];
    uint64_t v11 = +[MFMessageCriterion criterionForAccount:v10];
    criterion = v7->_criterion;
    v7->_criterion = (MFMessageCriterion *)v11;
  }
  return v7;
}

- (id)initForSender:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MFMailboxFilter;
  uint64_t v3 = [(MFMailboxFilter *)&v7 initForSender:a3];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = (void *)v3[1];
    v3[1] = 0;
  }
  return v4;
}

+ (id)filterForFlaggedMessages
{
  id v2 = [[MFMailboxFilter alloc] initForFlaggedMessages];

  return v2;
}

+ (id)filterForUnreadMessages
{
  id v2 = [[MFMailboxFilter alloc] initForUnreadMessages];

  return v2;
}

+ (id)filterForToMeMessages
{
  id v2 = [[MFMailboxFilter alloc] initForToMeMessages];

  return v2;
}

+ (id)filterForCCMeMessages
{
  id v2 = [[MFMailboxFilter alloc] initForCCMeMessages];

  return v2;
}

+ (id)filterForTodayMessages
{
  id v2 = [[MFMailboxFilter alloc] initForTodayMessages];

  return v2;
}

+ (id)filterForMessagesWithAttachments
{
  id v2 = [[MFMailboxFilter alloc] initForMessagesWithAttachments];

  return v2;
}

+ (id)filterForVIPMessages
{
  id v2 = [[MFMailboxFilter alloc] initForVIPMessages];

  return v2;
}

+ (id)filterForAccount:(id)a3 iconFromSmartMailbox:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [[MFMailboxFilter alloc] initWithAccount:v5 iconFromSmartMailbox:v6];

  return v7;
}

+ (id)filterForSender:(id)a3
{
  id v3 = a3;
  id v4 = [[MFMailboxFilter alloc] initForSender:v3];

  return v4;
}

+ (id)_addressLabelOfType:(int64_t)a3
{
  id v4 = +[UIApplication sharedApplication];
  id v5 = [v4 preferredContentSizeCategory];

  double v6 = sub_10013634C(a3, v5, 36.0);
  objc_super v7 = +[NSBundle mainBundle];
  unsigned int v8 = +[UIColor systemGrayColor];
  v9 = sub_100135D98(a3, v5, v7, v8, 0, v6);

  return v9;
}

- (MFMessageCriterion)criterion
{
  return self->_criterion;
}

- (void)setCriterion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end