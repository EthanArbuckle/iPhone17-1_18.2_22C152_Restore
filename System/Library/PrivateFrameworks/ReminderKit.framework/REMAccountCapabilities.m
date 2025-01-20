@interface REMAccountCapabilities
- (BOOL)insertsCompletedRecurrentCloneAtTail;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsAssignments;
- (BOOL)supportsAttachments;
- (BOOL)supportsCRDTs;
- (BOOL)supportsCalDAVNotifications;
- (BOOL)supportsCloudKitSync;
- (BOOL)supportsCustomSmartLists;
- (BOOL)supportsDeletionByTTL;
- (BOOL)supportsDueDateDeltaAlerts;
- (BOOL)supportsEventKitSync;
- (BOOL)supportsFlagged;
- (BOOL)supportsGroceriesList;
- (BOOL)supportsGroups;
- (BOOL)supportsHandoff;
- (BOOL)supportsHashtags;
- (BOOL)supportsHourlyRecurrence;
- (BOOL)supportsListAppearance;
- (BOOL)supportsListSharees;
- (BOOL)supportsListShareesMutation;
- (BOOL)supportsLocation;
- (BOOL)supportsMoveAcrossLists;
- (BOOL)supportsMoveAcrossSharedLists;
- (BOOL)supportsMultipleDateAlarmsOnRecurrence;
- (BOOL)supportsPersonTrigger;
- (BOOL)supportsPinnedLists;
- (BOOL)supportsRecentlyDeletedList;
- (BOOL)supportsReminderActions;
- (BOOL)supportsSections;
- (BOOL)supportsSubtasks;
- (BOOL)supportsTemplates;
- (BOOL)supportsTextStyling;
- (REMAccountCapabilities)initWithAccountType:(int64_t)a3;
- (int64_t)defaultReminderPriorityLevel;
- (unint64_t)hash;
@end

@implementation REMAccountCapabilities

- (BOOL)supportsPinnedLists
{
  return self->_supportsPinnedLists;
}

- (BOOL)supportsListAppearance
{
  return self->_supportsListAppearance;
}

- (REMAccountCapabilities)initWithAccountType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMAccountCapabilities;
  result = [(REMAccountCapabilities *)&v5 init];
  if (result)
  {
    switch(a3)
    {
      case 1:
        result->_defaultReminderPriorityLevel = 0;
        *(_WORD *)&result->_supportsReminderActions = 1;
        *(_OWORD *)&result->_supportsSubtasks = xmmword_1B9BF2150;
        *(_DWORD *)&result->_supportsMultipleDateAlarmsOnRecurrence = 0;
        goto LABEL_9;
      case 2:
      case 6:
        *(_WORD *)&result->_supportsSubtasks = 257;
        result->_supportsListAppearance = 1;
        *(_DWORD *)&result->_supportsGroups = 16843009;
        result->_defaultReminderPriorityLevel = 0;
        *(_WORD *)&result->_supportsHashtags = 1;
        *(_OWORD *)&result->_supportsHourlyRecurrence = xmmword_1B9BF2130;
        *(_DWORD *)&result->_supportsCustomSmartLists = 16843009;
        *(_WORD *)&result->_supportsGroceriesList = 257;
        if (a3 == 6)
        {
          result->_supportsTemplates = 0;
          result->_supportsPinnedLists = 0;
        }
        return result;
      case 3:
        result->_defaultReminderPriorityLevel = 0;
        result->_insertsCompletedRecurrentCloneAtTail = 1;
        *(_OWORD *)&result->_supportsSubtasks = xmmword_1B9BF2120;
        *(void *)&result->_supportsMultipleDateAlarmsOnRecurrence = 0x101000001;
        *(_DWORD *)&result->_supportsCustomSmartLists = 0;
        *(_WORD *)&result->_supportsGroceriesList = 0;
        return result;
      case 4:
        *(_WORD *)&result->_supportsSubtasks = 0;
        result->_supportsListAppearance = 0;
        *(_DWORD *)&result->_supportsGroups = 0;
        result->_supportsCRDTs = 0;
        result->_defaultReminderPriorityLevel = 2;
        *(_WORD *)&result->_supportsHandoff = 0;
        *(void *)&result->_supportsHourlyRecurrence = 0x1010000010000;
        *(_DWORD *)&result->_supportsMoveAcrossSharedLists = 256;
        goto LABEL_9;
      case 5:
        result->_defaultReminderPriorityLevel = 0;
        *(_WORD *)&result->_supportsReminderActions = 1;
        *(_OWORD *)&result->_supportsSubtasks = xmmword_1B9BF2140;
        *(_DWORD *)&result->_supportsMultipleDateAlarmsOnRecurrence = 1;
LABEL_9:
        *(void *)&result->_supportsAssignments = 0;
        result->_supportsRecentlyDeletedList = 0;
        break;
      default:
        return result;
    }
  }
  return result;
}

- (BOOL)supportsSubtasks
{
  return self->_supportsSubtasks;
}

- (BOOL)supportsSections
{
  return self->_supportsSections;
}

- (BOOL)supportsListSharees
{
  return self->_supportsListSharees;
}

- (BOOL)supportsCustomSmartLists
{
  return self->_supportsCustomSmartLists;
}

- (BOOL)supportsRecentlyDeletedList
{
  return self->_supportsRecentlyDeletedList;
}

- (BOOL)supportsTemplates
{
  return self->_supportsTemplates;
}

- (BOOL)supportsGroups
{
  return self->_supportsGroups;
}

- (BOOL)supportsFlagged
{
  return self->_supportsFlagged;
}

- (BOOL)supportsAssignments
{
  return self->_supportsAssignments;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_33;
  }
  int v5 = [(REMAccountCapabilities *)self supportsSubtasks];
  if (v5 != [v4 supportsSubtasks]) {
    goto LABEL_33;
  }
  int v6 = [(REMAccountCapabilities *)self supportsAttachments];
  if (v6 != [v4 supportsAttachments]) {
    goto LABEL_33;
  }
  int v7 = [(REMAccountCapabilities *)self supportsListAppearance];
  if (v7 != [v4 supportsListAppearance]) {
    goto LABEL_33;
  }
  int v8 = [(REMAccountCapabilities *)self supportsCloudKitSync];
  if (v8 != [v4 supportsCloudKitSync]) {
    goto LABEL_33;
  }
  int v9 = [(REMAccountCapabilities *)self supportsEventKitSync];
  if (v9 != [v4 supportsEventKitSync]) {
    goto LABEL_33;
  }
  int v10 = [(REMAccountCapabilities *)self supportsGroups];
  if (v10 != [v4 supportsGroups]) {
    goto LABEL_33;
  }
  int v11 = [(REMAccountCapabilities *)self supportsFlagged];
  if (v11 != [v4 supportsFlagged]) {
    goto LABEL_33;
  }
  int v12 = [(REMAccountCapabilities *)self supportsLocation];
  if (v12 != [v4 supportsLocation]) {
    goto LABEL_33;
  }
  int v13 = [(REMAccountCapabilities *)self supportsPersonTrigger];
  if (v13 != [v4 supportsPersonTrigger]) {
    goto LABEL_33;
  }
  int v14 = [(REMAccountCapabilities *)self supportsCalDAVNotifications];
  if (v14 != [v4 supportsCalDAVNotifications]) {
    goto LABEL_33;
  }
  int v15 = [(REMAccountCapabilities *)self supportsListSharees];
  if (v15 != [v4 supportsListSharees]) {
    goto LABEL_33;
  }
  int v16 = [(REMAccountCapabilities *)self supportsListShareesMutation];
  if (v16 != [v4 supportsListShareesMutation]) {
    goto LABEL_33;
  }
  int v17 = [(REMAccountCapabilities *)self supportsMoveAcrossLists];
  if (v17 != [v4 supportsMoveAcrossLists]) {
    goto LABEL_33;
  }
  int v18 = [(REMAccountCapabilities *)self supportsMoveAcrossSharedLists];
  if (v18 != [v4 supportsMoveAcrossSharedLists]) {
    goto LABEL_33;
  }
  int v19 = [(REMAccountCapabilities *)self supportsCRDTs];
  if (v19 != [v4 supportsCRDTs]) {
    goto LABEL_33;
  }
  int64_t v20 = [(REMAccountCapabilities *)self defaultReminderPriorityLevel];
  if (v20 != [v4 defaultReminderPriorityLevel]) {
    goto LABEL_33;
  }
  int v21 = [(REMAccountCapabilities *)self supportsHandoff];
  if (v21 != [v4 supportsHandoff]) {
    goto LABEL_33;
  }
  int v22 = [(REMAccountCapabilities *)self supportsReminderActions];
  if (v22 != [v4 supportsReminderActions]) {
    goto LABEL_33;
  }
  int v23 = [(REMAccountCapabilities *)self supportsHourlyRecurrence];
  if (v23 != [v4 supportsHourlyRecurrence]) {
    goto LABEL_33;
  }
  int v24 = [(REMAccountCapabilities *)self supportsMultipleDateAlarmsOnRecurrence];
  if (v24 != [v4 supportsMultipleDateAlarmsOnRecurrence]) {
    goto LABEL_33;
  }
  int v25 = [(REMAccountCapabilities *)self supportsAssignments];
  if (v25 != [v4 supportsAssignments]) {
    goto LABEL_33;
  }
  int v26 = [(REMAccountCapabilities *)self supportsHashtags];
  if (v26 != [v4 supportsHashtags]) {
    goto LABEL_33;
  }
  int v27 = [(REMAccountCapabilities *)self insertsCompletedRecurrentCloneAtTail];
  if (v27 != [v4 insertsCompletedRecurrentCloneAtTail]) {
    goto LABEL_33;
  }
  int v28 = [(REMAccountCapabilities *)self supportsCustomSmartLists];
  if (v28 != [v4 supportsCustomSmartLists]) {
    goto LABEL_33;
  }
  int v29 = [(REMAccountCapabilities *)self supportsGroceriesList];
  if (v29 == [v4 supportsGroceriesList]
    && (int v30 = [(REMAccountCapabilities *)self supportsTemplates],
        v30 == [v4 supportsTemplates])
    && (int v31 = [(REMAccountCapabilities *)self supportsPinnedLists],
        v31 == [v4 supportsPinnedLists])
    && (int v32 = [(REMAccountCapabilities *)self supportsTextStyling],
        v32 == [v4 supportsTextStyling])
    && (int v33 = [(REMAccountCapabilities *)self supportsDeletionByTTL],
        v33 == [v4 supportsDeletionByTTL])
    && (int v34 = [(REMAccountCapabilities *)self supportsSections],
        v34 == [v4 supportsSections])
    && (int v35 = [(REMAccountCapabilities *)self supportsDueDateDeltaAlerts],
        v35 == [v4 supportsDueDateDeltaAlerts]))
  {
    BOOL v38 = [(REMAccountCapabilities *)self supportsRecentlyDeletedList];
    int v36 = v38 ^ [v4 supportsRecentlyDeletedList] ^ 1;
  }
  else
  {
LABEL_33:
    LOBYTE(v36) = 0;
  }

  return v36;
}

- (unint64_t)hash
{
  if ([(REMAccountCapabilities *)self supportsSubtasks]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = v3 | [(REMAccountCapabilities *)self supportsAttachments];
  if ([(REMAccountCapabilities *)self supportsListAppearance]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | (4 * v4) | [(REMAccountCapabilities *)self supportsCloudKitSync];
  if ([(REMAccountCapabilities *)self supportsEventKitSync]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v7 | (4 * v6) | [(REMAccountCapabilities *)self supportsGroups];
  if ([(REMAccountCapabilities *)self supportsFlagged]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v9 | (4 * v8) | [(REMAccountCapabilities *)self supportsLocation];
  if ([(REMAccountCapabilities *)self supportsPersonTrigger]) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v11 | (4 * v10) | [(REMAccountCapabilities *)self supportsCalDAVNotifications];
  if ([(REMAccountCapabilities *)self supportsListSharees]) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v13 | (4 * v12) | [(REMAccountCapabilities *)self supportsListShareesMutation];
  if ([(REMAccountCapabilities *)self supportsMoveAcrossLists]) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = v15 | (4 * v14) | [(REMAccountCapabilities *)self supportsMoveAcrossSharedLists];
  if ([(REMAccountCapabilities *)self supportsCRDTs]) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = v17 | (4 * v16) | ([(REMAccountCapabilities *)self defaultReminderPriorityLevel] != 0);
  if ([(REMAccountCapabilities *)self supportsHandoff]) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = v19 | (4 * v18) | [(REMAccountCapabilities *)self supportsReminderActions];
  if ([(REMAccountCapabilities *)self supportsHourlyRecurrence]) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = v21 | (4 * v20) | [(REMAccountCapabilities *)self supportsMultipleDateAlarmsOnRecurrence];
  if ([(REMAccountCapabilities *)self supportsAssignments]) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t v24 = v23 | (4 * v22) | [(REMAccountCapabilities *)self supportsHashtags];
  if ([(REMAccountCapabilities *)self insertsCompletedRecurrentCloneAtTail]) {
    uint64_t v25 = 2;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v26 = v25 | (4 * v24) | [(REMAccountCapabilities *)self supportsCustomSmartLists];
  if ([(REMAccountCapabilities *)self supportsGroceriesList]) {
    uint64_t v27 = 2;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v28 = v27 | (4 * v26) | [(REMAccountCapabilities *)self supportsTemplates];
  if ([(REMAccountCapabilities *)self supportsPinnedLists]) {
    uint64_t v29 = 2;
  }
  else {
    uint64_t v29 = 0;
  }
  uint64_t v30 = v29 | (4 * v28) | [(REMAccountCapabilities *)self supportsTextStyling];
  if ([(REMAccountCapabilities *)self supportsDeletionByTTL]) {
    uint64_t v31 = 2;
  }
  else {
    uint64_t v31 = 0;
  }
  uint64_t v32 = v31 | (4 * v30) | [(REMAccountCapabilities *)self supportsSections];
  if ([(REMAccountCapabilities *)self supportsDueDateDeltaAlerts]) {
    uint64_t v33 = 2;
  }
  else {
    uint64_t v33 = 0;
  }
  return v33 | (4 * v32) | [(REMAccountCapabilities *)self supportsRecentlyDeletedList];
}

- (BOOL)supportsAttachments
{
  return self->_supportsAttachments;
}

- (BOOL)supportsPersonTrigger
{
  return self->_supportsPersonTrigger;
}

- (BOOL)supportsLocation
{
  return self->_supportsLocation;
}

- (BOOL)supportsHourlyRecurrence
{
  return self->_supportsHourlyRecurrence;
}

- (BOOL)supportsEventKitSync
{
  return self->_supportsEventKitSync;
}

- (BOOL)supportsCloudKitSync
{
  return self->_supportsCloudKitSync;
}

- (BOOL)supportsCalDAVNotifications
{
  return self->_supportsCalDAVNotifications;
}

- (BOOL)supportsListShareesMutation
{
  return self->_supportsListShareesMutation;
}

- (BOOL)supportsMoveAcrossLists
{
  return self->_supportsMoveAcrossLists;
}

- (BOOL)supportsMoveAcrossSharedLists
{
  return self->_supportsMoveAcrossSharedLists;
}

- (BOOL)supportsMultipleDateAlarmsOnRecurrence
{
  return self->_supportsMultipleDateAlarmsOnRecurrence;
}

- (BOOL)supportsDueDateDeltaAlerts
{
  return self->_supportsDueDateDeltaAlerts;
}

- (int64_t)defaultReminderPriorityLevel
{
  return self->_defaultReminderPriorityLevel;
}

- (BOOL)supportsHandoff
{
  return self->_supportsHandoff;
}

- (BOOL)supportsReminderActions
{
  return self->_supportsReminderActions;
}

- (BOOL)supportsCRDTs
{
  return self->_supportsCRDTs;
}

- (BOOL)supportsHashtags
{
  return self->_supportsHashtags;
}

- (BOOL)insertsCompletedRecurrentCloneAtTail
{
  return self->_insertsCompletedRecurrentCloneAtTail;
}

- (BOOL)supportsTextStyling
{
  return self->_supportsTextStyling;
}

- (BOOL)supportsDeletionByTTL
{
  return self->_supportsDeletionByTTL;
}

- (BOOL)supportsGroceriesList
{
  return self->_supportsGroceriesList;
}

@end