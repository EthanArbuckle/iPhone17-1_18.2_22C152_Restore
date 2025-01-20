@interface ICCollaborationColorManager
+ (UIColor)defaultColor;
+ (id)participantColors;
- (ICCollaborationColorManager)init;
- (NSMutableArray)colorUsageCounts;
- (NSMutableDictionary)userIDToColorsDict;
- (id)baseColorValuesForUserID:(id)a3;
- (id)containerScopedUserRecordNameForAccount:(id)a3;
- (id)highlightColorForUserID:(id)a3 note:(id)a4;
- (id)participantAXDisplayNameForUserID:(id)a3 forNote:(id)a4;
- (unint64_t)colorUsageCountMinimum;
- (void)setColorUsageCountMinimum:(unint64_t)a3;
- (void)setColorUsageCounts:(id)a3;
- (void)setUserIDToColorsDict:(id)a3;
@end

@implementation ICCollaborationColorManager

+ (id)participantColors
{
  if (participantColors_onceToken != -1) {
    dispatch_once(&participantColors_onceToken, &__block_literal_global_79);
  }
  v2 = (void *)participantColors_participantColors;
  return v2;
}

void __48__ICCollaborationColorManager_participantColors__block_invoke()
{
  v17[15] = *MEMORY[0x1E4F143B8];
  v16 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.643137255 green:0.466666667 blue:0.925490196 alpha:1.0];
  v17[0] = v16;
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.984313725 green:0.549019608 blue:0.11372549 alpha:1.0];
  v17[1] = v15;
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.650980392 green:0.741176471 blue:0.843137255 alpha:1.0];
  v17[2] = v14;
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.360784314 green:0.729411765 blue:0.180392157 alpha:1.0];
  v17[3] = v13;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.925490196 green:0.474509804 blue:0.862745098 alpha:1.0];
  v17[4] = v12;
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.290196078 green:0.760784314 blue:0.658823529 alpha:1.0];
  v17[5] = v0;
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.576470588 green:0.666666667 blue:0.0 alpha:1.0];
  v17[6] = v1;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.0196078431 green:0.576470588 blue:0.956862745 alpha:1.0];
  v17[7] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.325490196 green:0.215686275 blue:0.478431373 alpha:1.0];
  v17[8] = v3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.992156863 green:0.137254902 blue:0.345098039 alpha:1.0];
  v17[9] = v4;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:1.0 green:0.478431373 blue:0.360784314 alpha:1.0];
  v17[10] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.945098039 green:0.22745098 blue:0.0745098039 alpha:1.0];
  v17[11] = v6;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.701960784 green:0.156862745 blue:0.317647059 alpha:1.0];
  v17[12] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.670588235 green:0.352941176 blue:0.301960784 alpha:1.0];
  v17[13] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F83468]) initWithRed:0.494117647 green:0.611764706 blue:0.850980392 alpha:1.0];
  v17[14] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:15];
  v11 = (void *)participantColors_participantColors;
  participantColors_participantColors = v10;
}

+ (UIColor)defaultColor
{
  if (defaultColor_onceToken != -1) {
    dispatch_once(&defaultColor_onceToken, &__block_literal_global_10_0);
  }
  v2 = (void *)defaultColor_defaultColor;
  return (UIColor *)v2;
}

uint64_t __43__ICCollaborationColorManager_defaultColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.917647059 green:0.733333333 blue:0.0 alpha:1.0];
  defaultColor_defaultColor = v0;
  return MEMORY[0x1F41817F8](v0);
}

- (ICCollaborationColorManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ICCollaborationColorManager;
  v2 = [(ICCollaborationColorManager *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    userIDToColorsDict = v2->_userIDToColorsDict;
    v2->_userIDToColorsDict = v3;

    v5 = [(id)objc_opt_class() participantColors];
    uint64_t v6 = [v5 count];

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
    colorUsageCounts = v2->_colorUsageCounts;
    v2->_colorUsageCounts = (NSMutableArray *)v7;

    for (; v6; --v6)
      [(NSMutableArray *)v2->_colorUsageCounts addObject:&unk_1F09A4568];
    v2->_colorUsageCountMinimum = 0;
  }
  return v2;
}

- (id)highlightColorForUserID:(id)a3 note:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:*MEMORY[0x1E4F19C08]])
  {
    v8 = [v7 account];
    uint64_t v9 = [(ICCollaborationColorManager *)self containerScopedUserRecordNameForAccount:v8];

    id v6 = (id)v9;
  }
  if (!v6
    || (objc_msgSend(MEMORY[0x1E4F29128], "CR_unknown"),
        objc_super v10 = objc_claimAutoreleasedReturnValue(),
        [v10 UUIDString],
        v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v6 isEqual:v11],
        v11,
        v10,
        v12))
  {
    uint64_t v13 = [MEMORY[0x1E4FB1618] clearColor];
LABEL_6:
    v14 = (void *)v13;
    goto LABEL_7;
  }
  if (([v7 isSharedViaICloud] & 1) == 0)
  {
    uint64_t v13 = [(id)objc_opt_class() defaultColor];
    goto LABEL_6;
  }
  v16 = [(ICCollaborationColorManager *)self baseColorValuesForUserID:v6];
  v17 = (void *)MEMORY[0x1E4FB1618];
  [v16 redValue];
  double v19 = v18;
  [v16 greenValue];
  double v21 = v20;
  [v16 blueValue];
  double v23 = v22;
  [v16 alphaValue];
  v14 = [v17 colorWithRed:v19 green:v21 blue:v23 alpha:v24];

LABEL_7:
  return v14;
}

- (id)baseColorValuesForUserID:(id)a3
{
  id v4 = a3;
  v5 = [(ICCollaborationColorManager *)self userIDToColorsDict];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    id v7 = [(ICCollaborationColorManager *)self userIDToColorsDict];
    v8 = [v7 objectForKeyedSubscript:v4];
  }
  else
  {
    id v7 = [(id)objc_opt_class() participantColors];
    uint64_t v9 = [(ICCollaborationColorManager *)self colorUsageCounts];
    unint64_t v10 = [v4 hash];
    unint64_t v11 = v10 % [v7 count];
    [v9 count];
    unint64_t v12 = 0;
    while (1)
    {
      if (v11 >= [v9 count]) {
        unint64_t v11 = 0;
      }
      if (v12 >= [v9 count]) {
        [(ICCollaborationColorManager *)self setColorUsageCountMinimum:[(ICCollaborationColorManager *)self colorUsageCountMinimum] + 1];
      }
      uint64_t v13 = [v9 objectAtIndexedSubscript:v11];
      unint64_t v14 = [v13 unsignedIntegerValue];

      if (v14 <= [(ICCollaborationColorManager *)self colorUsageCountMinimum]) {
        break;
      }
      ++v11;
      if (++v12 > [v9 count])
      {
        v8 = 0;
        goto LABEL_12;
      }
    }
    v8 = [v7 objectAtIndexedSubscript:v11];
    v15 = [(ICCollaborationColorManager *)self userIDToColorsDict];
    [v15 setObject:v8 forKey:v4];

    v16 = [NSNumber numberWithUnsignedInteger:v14 + 1];
    [v9 setObject:v16 atIndexedSubscript:v11];

LABEL_12:
  }

  return v8;
}

- (id)containerScopedUserRecordNameForAccount:(id)a3
{
  id v3 = a3;
  if (containerScopedUserRecordNameForAccount__onceToken != -1) {
    dispatch_once(&containerScopedUserRecordNameForAccount__onceToken, &__block_literal_global_18);
  }
  id v4 = [v3 identifier];
  if ([v4 length])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&containerScopedUserRecordNameForAccount__accountIDToRecordNameLock);
    v5 = [(id)containerScopedUserRecordNameForAccount__accountIDToRecordName objectForKeyedSubscript:v4];
    os_unfair_lock_unlock((os_unfair_lock_t)&containerScopedUserRecordNameForAccount__accountIDToRecordNameLock);
    if (v5)
    {
      v5 = v5;
      id v6 = v5;
    }
    else
    {
      uint64_t v19 = 0;
      double v20 = &v19;
      uint64_t v21 = 0x3032000000;
      double v22 = __Block_byref_object_copy__65;
      double v23 = __Block_byref_object_dispose__65;
      id v24 = 0;
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      v8 = [MEMORY[0x1E4F83318] sharedContext];
      uint64_t v9 = [v8 containerForAccountID:v4];

      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __71__ICCollaborationColorManager_containerScopedUserRecordNameForAccount___block_invoke_22;
      v16 = &unk_1E5FDDCE8;
      double v18 = &v19;
      unint64_t v10 = v7;
      v17 = v10;
      [v9 fetchUserRecordIDWithCompletionHandler:&v13];
      dispatch_time_t v11 = dispatch_time(0, 120000000000);
      dispatch_semaphore_wait(v10, v11);
      os_unfair_lock_lock((os_unfair_lock_t)&containerScopedUserRecordNameForAccount__accountIDToRecordNameLock);
      objc_msgSend((id)containerScopedUserRecordNameForAccount__accountIDToRecordName, "setObject:forKeyedSubscript:", v20[5], v4, v13, v14, v15, v16);
      os_unfair_lock_unlock((os_unfair_lock_t)&containerScopedUserRecordNameForAccount__accountIDToRecordNameLock);
      id v6 = (id)v20[5];

      _Block_object_dispose(&v19, 8);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICCollaborationColorManager containerScopedUserRecordNameForAccount:](v5);
    }
    id v6 = 0;
  }

  return v6;
}

uint64_t __71__ICCollaborationColorManager_containerScopedUserRecordNameForAccount___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  containerScopedUserRecordNameForAccount__accountIDToRecordName = v0;
  return MEMORY[0x1F41817F8](v0);
}

void __71__ICCollaborationColorManager_containerScopedUserRecordNameForAccount___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __71__ICCollaborationColorManager_containerScopedUserRecordNameForAccount___block_invoke_22_cold_1((uint64_t)v5, v6);
    }
  }
  else
  {
    uint64_t v7 = [a2 recordName];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)participantAXDisplayNameForUserID:(id)a3 forNote:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToString:*MEMORY[0x1E4F19C08]] & 1) != 0
    || ([v7 account],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        -[ICCollaborationColorManager containerScopedUserRecordNameForAccount:](self, "containerScopedUserRecordNameForAccount:", v8), v9 = objc_claimAutoreleasedReturnValue(), int v10 = [v6 isEqualToString:v9], v9, v8, v10))
  {
    dispatch_time_t v11 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Me" value:@"Me" table:0 allowSiri:1];
  }
  else
  {
    unint64_t v12 = [v7 serverShare];
    uint64_t v13 = [v12 participants];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v13;
    dispatch_time_t v11 = (void *)[v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      id v25 = v7;
      uint64_t v15 = *(void *)v27;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v14);
          }
          v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          double v18 = [v17 userIdentity];
          uint64_t v19 = [v18 userRecordID];
          double v20 = [v19 recordName];
          int v21 = [v20 isEqualToString:v6];

          if (v21)
          {
            double v22 = [v17 userIdentity];
            double v23 = [v22 nameComponents];
            dispatch_time_t v11 = objc_msgSend(v23, "ic_localizedNameWithDefaultFormattingStyle");

            goto LABEL_14;
          }
        }
        dispatch_time_t v11 = (void *)[v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_14:
      id v7 = v25;
    }
  }
  return v11;
}

- (NSMutableDictionary)userIDToColorsDict
{
  return self->_userIDToColorsDict;
}

- (void)setUserIDToColorsDict:(id)a3
{
}

- (NSMutableArray)colorUsageCounts
{
  return self->_colorUsageCounts;
}

- (void)setColorUsageCounts:(id)a3
{
}

- (unint64_t)colorUsageCountMinimum
{
  return self->_colorUsageCountMinimum;
}

- (void)setColorUsageCountMinimum:(unint64_t)a3
{
  self->_colorUsageCountMinimum = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorUsageCounts, 0);
  objc_storeStrong((id *)&self->_userIDToColorsDict, 0);
}

- (void)containerScopedUserRecordNameForAccount:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Trying to fetch containerScopedUserRecordNameForAccount with empty accountID", v1, 2u);
}

void __71__ICCollaborationColorManager_containerScopedUserRecordNameForAccount___block_invoke_22_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Error fetching container scoped user recordID: %@", (uint8_t *)&v2, 0xCu);
}

@end