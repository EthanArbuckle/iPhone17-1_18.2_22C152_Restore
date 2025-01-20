@interface ICCloudSyncingObject(UI)
+ (uint64_t)isInlineAttachment:()UI;
- (__CFString)shareViaICloudSystemImageName;
- (id)participantsInfoDescription;
- (id)shareViaICloudAddPeopleActionTitle;
- (id)shareViaICloudManageActionTitle;
@end

@implementation ICCloudSyncingObject(UI)

+ (uint64_t)isInlineAttachment:()UI
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1F09A5DB0])
  {
    v4 = (void *)MEMORY[0x1E4F834B0];
    v5 = [v3 attachmentUTI];
    uint64_t v6 = [v4 typeUTIIsInlineAttachment:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)shareViaICloudManageActionTitle
{
  if (([a1 canBeSharedViaICloud] & 1) == 0 && !objc_msgSend(a1, "isSharedViaICloud")) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = [a1 isSharedViaICloud];
      id v3 = (void *)MEMORY[0x1E4F83770];
      if (v5) {
        v4 = @"Manage Shared Folder";
      }
      else {
        v4 = @"Share Folder";
      }
      goto LABEL_12;
    }
LABEL_9:
    uint64_t v6 = 0;
    goto LABEL_13;
  }
  char v2 = [a1 isSharedViaICloud];
  id v3 = (void *)MEMORY[0x1E4F83770];
  if (v2) {
    v4 = @"Manage Shared Note";
  }
  else {
    v4 = @"Share Note";
  }
LABEL_12:
  uint64_t v6 = [v3 localizedFrameworkStringForKey:v4 value:v4 table:0 allowSiri:1];
LABEL_13:
  return v6;
}

- (id)shareViaICloudAddPeopleActionTitle
{
  if ([a1 canBeSharedViaICloud])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v1 = (void *)MEMORY[0x1E4F83770];
      char v2 = @"Share Note";
LABEL_6:
      id v3 = [v1 localizedFrameworkStringForKey:v2 value:v2 table:0 allowSiri:1];
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v1 = (void *)MEMORY[0x1E4F83770];
      char v2 = @"Share Folder";
      goto LABEL_6;
    }
  }
  id v3 = 0;
LABEL_8:
  return v3;
}

- (__CFString)shareViaICloudSystemImageName
{
  if (([a1 canBeSharedViaICloud] & 1) != 0 || objc_msgSend(a1, "isSharedViaICloud"))
  {
    int v2 = [a1 isSharedViaICloud];
    id v3 = @"person.crop.circle.badge.plus";
    if (v2) {
      id v3 = @"person.crop.circle.badge.checkmark";
    }
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)participantsInfoDescription
{
  v1 = [a1 serverShareCheckingParent];
  int v2 = objc_msgSend(v1, "ic_nonCurrentUserAcceptedParticipants");

  id v3 = objc_msgSend(v2, "ic_compactMap:", &__block_literal_global_42);
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      uint64_t v4 = [v2 count];
      char v5 = NSString;
      uint64_t v6 = (void *)MEMORY[0x1E4F83770];
      if (v4 == 1)
      {
        v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"With %@" value:@"With %@" table:0 allowSiri:1];
        v8 = [v3 objectAtIndexedSubscript:0];
        objc_msgSend(v5, "localizedStringWithFormat:", v7, v8, v14);
        v10 = LABEL_10:;
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v11 = [v3 count];
      char v5 = NSString;
      uint64_t v6 = (void *)MEMORY[0x1E4F83770];
      if (v11 == 2)
      {
        v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"With %@ and %@" value:@"With %@ and %@" table:0 allowSiri:1];
        v8 = [v3 objectAtIndexedSubscript:0];
        v12 = [v3 objectAtIndexedSubscript:1];
        v10 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v8, v12);

LABEL_11:
        goto LABEL_12;
      }
    }
    v7 = [v6 localizedFrameworkStringForKey:@"With %@ and %lu others" value:@"With %@ and %lu others" table:0 allowSiri:1];
    v8 = [v3 objectAtIndexedSubscript:0];
    objc_msgSend(v5, "localizedStringWithFormat:", v7, v8, objc_msgSend(v2, "count") - 1);
    goto LABEL_10;
  }
  if ([v2 count])
  {
    v9 = NSString;
    v7 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"With %lu people" value:@"With %lu people" table:0 allowSiri:1];
    v10 = objc_msgSend(v9, "localizedStringWithFormat:", v7, objc_msgSend(v2, "count"));
LABEL_12:

    goto LABEL_13;
  }
  v10 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Shared" value:@"Shared" table:0 allowSiri:1];
LABEL_13:

  return v10;
}

@end