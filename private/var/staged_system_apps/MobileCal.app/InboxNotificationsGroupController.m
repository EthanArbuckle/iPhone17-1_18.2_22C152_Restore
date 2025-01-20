@interface InboxNotificationsGroupController
- (BOOL)canSelectRow:(int64_t)a3;
- (BOOL)hasRows;
- (BOOL)needsRefresh;
- (BOOL)visible;
- (EKUIEmailCompositionManager)messageSendingManager;
- (InboxNotificationsGroupController)initWithModel:(id)a3 delegate:(id)a4;
- (InboxTableViewGroupControllerDelegate)delegate;
- (double)estimatedHeightForRow:(int64_t)a3;
- (id)_eventForIndexPath:(id)a3;
- (id)cellForRow:(int64_t)a3 allowAsyncLoading:(BOOL)a4;
- (id)conflictInfoForNotification:(id)a3;
- (id)eventForRow:(int64_t)a3;
- (id)eventStoreForCell:(id)a3;
- (id)filteredNotificationsFromArray:(id)a3;
- (id)noContentStringForInboxTableView:(id)a3;
- (id)tableView;
- (id)titleForHeader;
- (int64_t)numberOfRows;
- (void)_localeChanged:(id)a3;
- (void)_notificationsChanged:(id)a3;
- (void)_performAction:(int64_t)a3 forEventInvitationNotification:(id)a4 avoidUserInteraction:(BOOL)a5 cancelled:(id)a6 cell:(id)a7;
- (void)_performAction:(int64_t)a3 forSuggestionNotification:(id)a4 save:(id)a5;
- (void)_performActionForAllNotifications:(int64_t)a3 save:(id)a4;
- (void)_performActionForAttendeeReplyNotification:(id)a3 save:(id)a4;
- (void)_performActionForInviteReplayNotification:(id)a3;
- (void)_performActionForResourceChangeNotification:(id)a3;
- (void)_savePendingComments;
- (void)_saveStatus:(int64_t)a3 forEventInvitationNotification:(id)a4 commit:(BOOL)a5;
- (void)attemptDisplayReviewPrompt;
- (void)inboxWillDismiss;
- (void)messageCell:(id)a3 committedComment:(id)a4;
- (void)performAction:(int64_t)a3 forCell:(id)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6;
- (void)prefetchConflictInfo;
- (void)prefetchRow:(int64_t)a3;
- (void)refreshIfNeeded;
- (void)rowSelected:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setMessageSendingManager:(id)a3;
- (void)setNeedsRefresh:(BOOL)a3;
- (void)setVisible:(BOOL)a3;
- (void)viewDidDisappear;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation InboxNotificationsGroupController

- (InboxNotificationsGroupController)initWithModel:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)InboxNotificationsGroupController;
  v9 = [(InboxNotificationsGroupController *)&v32 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_model, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v10->_needsRefresh = 1;
    uint64_t v11 = objc_opt_new();
    pendingComments = v10->_pendingComments;
    v10->_pendingComments = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    conflictInfo = v10->_conflictInfo;
    v10->_conflictInfo = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    organizerNames = v10->_organizerNames;
    v10->_organizerNames = (NSMutableDictionary *)v15;

    id v17 = +[CUIKNotificationDescriptionGenerator sharedGenerator];
    v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v19 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v20 = dispatch_queue_create("PrefetchConflictQueue", v18);
    prefetchConflictsQueue = v10->_prefetchConflictsQueue;
    v10->_prefetchConflictsQueue = (OS_dispatch_queue *)v20;

    dispatch_queue_t v22 = dispatch_queue_create("ConflictScanningQ", v19);
    conflictsScanningQueue = v10->_conflictsScanningQueue;
    v10->_conflictsScanningQueue = (OS_dispatch_queue *)v22;

    dispatch_queue_t v24 = dispatch_queue_create("ConflictsQ", v19);
    conflictsQueue = v10->_conflictsQueue;
    v10->_conflictsQueue = (OS_dispatch_queue *)v24;

    dispatch_queue_t v26 = dispatch_queue_create("PrefetchNamesQ", v18);
    prefetchNamesQueue = v10->_prefetchNamesQueue;
    v10->_prefetchNamesQueue = (OS_dispatch_queue *)v26;

    dispatch_queue_t v28 = dispatch_queue_create("NamesQ", v19);
    namesQueue = v10->_namesQueue;
    v10->_namesQueue = (OS_dispatch_queue *)v28;

    v30 = +[NSNotificationCenter defaultCenter];
    [v30 addObserver:v10 selector:"_notificationsChanged:" name:CUIKCalendarModelNotificationsChangedNotification object:v10->_model];
    [v30 addObserver:v10 selector:"_notificationsChanged:" name:EKEventStoreChangedNotification object:0];
    [v30 addObserver:v10 selector:"_localeChanged:" name:CUIKLocaleChangedNotification object:0];
    [v30 addObserver:v10 selector:"_notificationsChanged:" name:CUIKCalendarModelIdentityChangedNotification object:v10->_model];
    [v30 addObserver:v10 selector:"_notificationsChanged:" name:CUIKCalendarModelFocusModeConfigurationChangedNotification object:v10->_model];
    [(InboxNotificationsGroupController *)v10 refreshIfNeeded];
  }
  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  [(InboxNotificationsGroupController *)self setVisible:1];
  [(InboxNotificationsGroupController *)self refreshIfNeeded];
  id v5 = [(InboxNotificationsGroupController *)self tableView];
  v4 = [v5 visibleCells];
  [v4 enumerateObjectsUsingBlock:&stru_1001D3D38];
}

- (void)viewDidDisappear
{
}

- (id)conflictInfoForNotification:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10009F3A0;
  dispatch_queue_t v28 = sub_10009F3B0;
  id v29 = 0;
  if (![v4 type] || objc_msgSend(v4, "type") == (id)1)
  {
    id v5 = v4;
    conflictsQueue = self->_conflictsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009F3B8;
    block[3] = &unk_1001D3A90;
    v23 = &v24;
    block[4] = self;
    id v7 = v5;
    id v22 = v7;
    dispatch_sync(conflictsQueue, block);
    if (!v25[5])
    {
      id v8 = [v7 objectID];

      if (v8)
      {
        v9 = [(CUIKCalendarModel *)self->_model eventStore];
        v10 = [v7 objectID];
        uint64_t v11 = [v7 startDate];
        v12 = [v9 eventForObjectID:v10 occurrenceDate:v11 checkValid:0];
      }
      else
      {
        v12 = 0;
      }
      conflictsScanningQueue = self->_conflictsScanningQueue;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10009F42C;
      v17[3] = &unk_1001D3D60;
      v17[4] = self;
      dispatch_queue_t v20 = &v24;
      id v18 = v7;
      id v19 = v12;
      id v14 = v12;
      dispatch_sync(conflictsScanningQueue, v17);
    }
  }
  id v15 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v15;
}

- (void)prefetchConflictInfo
{
  v3 = +[NSArray arrayWithArray:self->_notificationReferences];
  prefetchConflictsQueue = self->_prefetchConflictsQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009F70C;
  v6[3] = &unk_1001D28A8;
  id v7 = v3;
  id v8 = self;
  id v5 = v3;
  dispatch_async(prefetchConflictsQueue, v6);
}

- (void)inboxWillDismiss
{
}

- (void)prefetchRow:(int64_t)a3
{
  prefetchNamesQueue = self->_prefetchNamesQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009F8B4;
  v4[3] = &unk_1001D2A40;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(prefetchNamesQueue, v4);
}

- (void)refreshIfNeeded
{
  if (self->_needsRefresh)
  {
    v3 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[INBOX] Refreshing inbox notifications group controller: %{public}@.", buf, 0xCu);
    }
    id v4 = [(CUIKCalendarModel *)self->_model eventNotificationReferencesForCurrentIdentity];
    objc_storeStrong((id *)&self->_allNotificationReferences, v4);
    id v5 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[INBOX] Event notification references for current identity: %{public}@.", buf, 0xCu);
    }
    v6 = [(InboxNotificationsGroupController *)self filteredNotificationsFromArray:v4];
    id v7 = (NSMutableArray *)[v6 mutableCopy];
    notificationReferences = self->_notificationReferences;
    self->_notificationReferences = v7;

    v9 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_notificationReferences;
      *(_DWORD *)buf = 138543362;
      v23 = (InboxNotificationsGroupController *)v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Filtered event notification references for selected identity: %{public}@.", buf, 0xCu);
    }
    id v11 = [(NSMutableArray *)self->_notificationReferences count];
    [(InboxNotificationsGroupController *)self prefetchConflictInfo];
    if ([(NSMutableDictionary *)self->_pendingComments count])
    {
      v12 = [(NSMutableDictionary *)self->_pendingComments allKeys];
      id v13 = [v12 mutableCopy];

      id v14 = self->_notificationReferences;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10009FD08;
      v20[3] = &unk_1001D3D88;
      id v21 = v13;
      id v15 = v13;
      [(NSMutableArray *)v14 enumerateObjectsUsingBlock:v20];
      [(NSMutableDictionary *)self->_pendingComments removeObjectsForKeys:v15];
    }
    v16 = (void *)kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v16;
      id v18 = +[NSNumber numberWithUnsignedInteger:v11];
      *(_DWORD *)buf = 138543362;
      v23 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Number of notifications after refresh: [%{public}@].", buf, 0xCu);
    }
    self->_needsRefresh = 0;
    id v19 = [(InboxNotificationsGroupController *)self delegate];
    [v19 inboxTableViewGroupController:self addedRows:0 removedRows:0 updatedRows:0];
  }
}

- (BOOL)hasRows
{
  return [(NSMutableArray *)self->_notificationReferences count] != 0;
}

- (int64_t)numberOfRows
{
  return (int64_t)[(NSMutableArray *)self->_notificationReferences count];
}

- (id)cellForRow:(int64_t)a3 allowAsyncLoading:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = objc_alloc_init(CalendarMessageCell);
  if ([(NSMutableArray *)self->_notificationReferences count])
  {
    id v8 = [(NSMutableArray *)self->_notificationReferences objectAtIndex:a3];
    v9 = [v8 notification];
    v10 = v9;
    if (v9)
    {
      id v11 = [v9 URL];
      if ([v10 type] != (id)8
        || ([(NSMutableArray *)self->_sharedCalendarInvitationsReplyPending containsObject:v11] & 1) == 0)
      {
        v12 = +[CalendarMessageCell cellClassForNotification:v10];
        v35 = NSStringFromClass(v12);
        id v13 = [(InboxNotificationsGroupController *)self tableView];
        uint64_t v14 = [v13 dequeueReusableCellWithIdentifier:v35];

        id v7 = (CalendarMessageCell *)v14;
        if (!v14) {
          id v7 = (CalendarMessageCell *)[[v12 alloc] initWithStyle:0 reuseIdentifier:v35];
        }
        if (![v10 type] || objc_msgSend(v10, "type") == (id)1)
        {
          id v15 = v10;
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v48 = 0x3032000000;
          v49 = sub_10009F3A0;
          v50 = sub_10009F3B0;
          id v51 = 0;
          conflictsQueue = self->_conflictsQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000A0428;
          block[3] = &unk_1001D3A90;
          p_long long buf = &buf;
          block[4] = self;
          id v17 = v15;
          id v44 = v17;
          dispatch_sync(conflictsQueue, block);
          if (*(void *)(*((void *)&buf + 1) + 40))
          {
            id v18 = objc_opt_new();
            id v19 = +[CUIKNotificationDescriptionGenerator sharedGenerator];
            id v20 = [v19 conflictStringForConflictDetails:*(void *)(*((void *)&buf + 1) + 40) maxTitleLength:20 descriptions:v18];

            [(CalendarMessageCell *)v7 setConflictDict:v18];
          }
          else
          {
            objc_initWeak(location, self);
            prefetchConflictsQueue = self->_prefetchConflictsQueue;
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472;
            v39[2] = sub_1000A049C;
            v39[3] = &unk_1001D3DB0;
            objc_copyWeak(&v42, location);
            id v40 = v8;
            v41 = self;
            dispatch_async(prefetchConflictsQueue, v39);

            objc_destroyWeak(&v42);
            objc_destroyWeak(location);
          }

          _Block_object_dispose(&buf, 8);
        }
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v48 = 0x3032000000;
        v49 = sub_10009F3A0;
        v50 = sub_10009F3B0;
        id v51 = 0;
        namesQueue = self->_namesQueue;
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_1000A0650;
        v36[3] = &unk_1001D3A90;
        v38 = &buf;
        v36[4] = self;
        id v25 = v10;
        id v37 = v25;
        dispatch_sync(namesQueue, v36);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(CalendarMessageCell *)v7 setOrganizerName:*(void *)(*((void *)&buf + 1) + 40)];
        }
        uint64_t v26 = [(CalendarMessageCell *)v7 authorView];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          dispatch_queue_t v28 = [(CalendarMessageCell *)v7 authorView];
          [v28 setLoadContactsAsynchronously:v4];
        }
        [(CalendarMessageCell *)v7 setDelegate:self];
        [(CalendarMessageCell *)v7 setNotification:v25];
        pendingComments = self->_pendingComments;
        v30 = [v25 URL];
        v31 = [(NSMutableDictionary *)pendingComments objectForKeyedSubscript:v30];

        [(CalendarMessageCell *)v7 setShowsCommentPrompt:v31 != 0 animated:0 initialValue:v31];
        objc_super v32 = kCalUILogInboxHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v11;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Generating cell for notification with URI: [%@]", (uint8_t *)location, 0xCu);
        }

        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {
      id v21 = kCalUILogInboxHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = a3;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Notification reference is nil for inbox cell in row %ld.", (uint8_t *)&buf, 0xCu);
      }
      id v22 = kCalUILogInboxHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Notification Reference: %@", (uint8_t *)&buf, 0xCu);
      }
      id v11 = [0 URL];
    }
  }
  v33 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Loading notification cell at row: [%ld]", (uint8_t *)&buf, 0xCu);
  }

  return v7;
}

- (double)estimatedHeightForRow:(int64_t)a3
{
  +[CalendarMessageCell defaultRowHeight];
  return result;
}

- (void)rowSelected:(int64_t)a3
{
  id v9 = [(InboxNotificationsGroupController *)self cellForRow:a3 allowAsyncLoading:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v9 proposedTimeAttendee], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    id v7 = [(InboxNotificationsGroupController *)self delegate];
    id v8 = [(InboxNotificationsGroupController *)self eventForRow:a3];
    [v7 inboxTableViewGroupController:self viewProposedTimeForAttendee:v6 onEvent:v8];
  }
  else
  {
    v6 = [(InboxNotificationsGroupController *)self delegate];
    id v7 = [(InboxNotificationsGroupController *)self eventForRow:a3];
    [v6 inboxTableViewGroupController:self inspectEvent:v7];
  }
}

- (BOOL)canSelectRow:(int64_t)a3
{
  v3 = [(InboxNotificationsGroupController *)self eventForRow:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)eventForRow:(int64_t)a3
{
  if ((uint64_t)[(NSMutableArray *)self->_notificationReferences count] <= a3)
  {
    id v13 = 0;
    goto LABEL_21;
  }
  uint64_t v5 = [(NSMutableArray *)self->_notificationReferences objectAtIndex:a3];
  v6 = [v5 notification];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [v7 objectID];

    id v9 = [(CUIKCalendarModel *)self->_model eventStore];
    if (!v8)
    {
      v10 = [v7 URL];
      id v13 = [v9 _eventWithURI:v10 checkValid:1];
      goto LABEL_18;
    }
    v10 = [v7 objectID];
    id v11 = [v7 startDateForNextOccurrence];
    v12 = v11;
    if (!v11)
    {
      v12 = [v7 startDate];
    }
    id v13 = [v9 eventForObjectID:v10 occurrenceDate:v12 checkValid:0];
    if (!v11) {

    }
LABEL_15:
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v6;
    id v15 = [(CUIKCalendarModel *)self->_model eventStore];
    v16 = [v14 eventID];
    id v11 = [v15 eventWithIdentifier:v16];

    if (!v11)
    {
      id v13 = 0;
      goto LABEL_19;
    }
    id v9 = +[NSDate CalSimulatedDateForNow];
    uint64_t v17 = [v11 nextOccurrenceOrDetachmentAfter:v9];
    v10 = (void *)v17;
    if (v17) {
      id v18 = (void *)v17;
    }
    else {
      id v18 = v11;
    }
    id v13 = v18;
    goto LABEL_15;
  }
  id v13 = 0;
LABEL_20:

LABEL_21:

  return v13;
}

- (id)titleForHeader
{
  return 0;
}

- (void)_saveStatus:(int64_t)a3 forEventInvitationNotification:(id)a4 commit:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = (void *)kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    id v11 = +[NSNumber numberWithInteger:a3];
    *(_DWORD *)long long buf = 138543618;
    id v40 = v11;
    __int16 v41 = 2114;
    id v42 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saving participant status: [%{public}@] for event invitation notification: %{public}@.", buf, 0x16u);
  }
  v12 = [(CUIKCalendarModel *)self->_model eventStore];
  id v13 = [v8 eventFromEventStore:v12];

  [v13 setInvitationStatus:0];
  id v14 = [(InboxNotificationsGroupController *)self delegate];
  id v15 = [v14 editorForGroupController:self];

  if ([v8 type] == (id)2)
  {
    [v15 deleteEvent:v13 span:2 error:0];
  }
  else
  {
    v16 = [v13 calendar];
    uint64_t v17 = [v16 source];
    id v18 = [v17 constraints];
    unsigned int v19 = [v18 mustAcknowledgeMasterEvent];

    if (v19)
    {
      if ([v13 hasRecurrenceRules]) {
        uint64_t v20 = 4;
      }
      else {
        uint64_t v20 = 0;
      }
      if (a3) {
        [v13 setParticipationStatus:a3];
      }
    }
    else if (a3)
    {
      [v13 setParticipationStatus:a3];
      uint64_t v20 = 2;
    }
    else
    {
      uint64_t v20 = [v13 hasRecurrenceRules];
    }
    pendingComments = self->_pendingComments;
    id v22 = [v8 URL];
    v23 = [(NSMutableDictionary *)pendingComments objectForKeyedSubscript:v22];

    if (v23)
    {
      uint64_t v24 = self->_pendingComments;
      id v25 = [v8 URL];
      [(NSMutableDictionary *)v24 removeObjectForKey:v25];

      uint64_t v26 = [v13 responseComment];
      v27 = +[CUIKNotificationDescriptionGenerator stringWithAutoCommentRemoved:v26];

      if (!v27) {
        v27 = &stru_1001D6918;
      }
      if (([v23 isEqualToString:v27] & 1) == 0)
      {
        if (![v23 length])
        {

          v23 = 0;
        }
        dispatch_queue_t v28 = [v13 proposedStartDate];
        id v29 = [v13 timeZone];
        v30 = +[CUIKNotificationDescriptionGenerator comment:v23 withInsertedAutoCommentForDate:v28 timeZone:v29];
        [v13 setResponseComment:v30];
      }
    }
    if (v5)
    {
      id v38 = 0;
      unsigned __int8 v31 = [v15 saveEvent:v13 span:v20 error:&v38];
      id v32 = v38;
      if ((v31 & 1) == 0)
      {
        v33 = kCalUILogInboxHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v40 = v32;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Error saving invitation status: %@.", buf, 0xCu);
        }
      }
    }
    else
    {
      v34 = [v13 eventStore];
      id v37 = 0;
      unsigned __int8 v35 = [v34 saveEvent:v13 span:v20 commit:0 error:&v37];
      id v32 = v37;

      if ((v35 & 1) == 0)
      {
        v36 = kCalUILogInboxHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v40 = v32;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Error saving invitation status: %@.", buf, 0xCu);
        }
        [v13 rollback];
      }
    }
  }
}

- (void)_savePendingComments
{
  notificationReferences = self->_notificationReferences;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A0EF8;
  v4[3] = &unk_1001D3D88;
  v4[4] = self;
  [(NSMutableArray *)notificationReferences enumerateObjectsUsingBlock:v4];
  [(NSMutableDictionary *)self->_pendingComments removeAllObjects];
}

- (void)_performAction:(int64_t)a3 forSuggestionNotification:(id)a4 save:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(CUIKCalendarModel *)self->_model eventStore];
  id v11 = [v8 resourceChangeFromEventStore:v10];

  v12 = [v11 calendarItem];
  id v13 = [(CUIKCalendarModel *)self->_model eventStore];
  id v34 = 0;
  unsigned __int8 v14 = [v13 removeResourceChange:v11 error:&v34];
  id v15 = v34;

  if ((v14 & 1) == 0)
  {
    v16 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v36 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error removing resource change: %@", buf, 0xCu);
    }

    id v15 = 0;
  }
  uint64_t v17 = [v8 eventID];
  id v18 = [(CUIKCalendarModel *)self->_model eventStore];
  unsigned int v19 = [v18 eventWithIdentifier:v17];

  if (v19)
  {
    id v20 = v19;

    v12 = v20;
  }
  id v32 = v9;
  if (a3 > 127)
  {
    if (a3 != 128)
    {
      if (a3 == 0x100000) {
        goto LABEL_13;
      }
LABEL_20:
      unsigned __int8 v31 = [v12 suggestionInfo];
      [v31 setChangedFields:0];

      id v25 = v32;
      (*((void (**)(id, void *, void))v32 + 2))(v32, v12, 0);
      goto LABEL_21;
    }
    id v29 = [v12 suggestionInfo];
    v30 = [v29 uniqueKey];
    +[EKSuggestionsServiceLogger logEventRejectedInboxWithUniqueKey:v30];

    v27 = [(CUIKCalendarModel *)self->_model eventStore];
    [v27 deleteSuggestedEvent:v12];
LABEL_19:

    goto LABEL_20;
  }
  if (a3 == 8)
  {
    [(InboxNotificationsGroupController *)self attemptDisplayReviewPrompt];
    uint64_t v26 = [(CUIKCalendarModel *)self->_model eventStore];
    [v26 acceptSuggestedEvent:v12];

    v27 = [v12 suggestionInfo];
    dispatch_queue_t v28 = [v27 uniqueKey];
    +[EKSuggestionsServiceLogger logEventConfirmedInboxWithUniqueKey:v28];

    goto LABEL_19;
  }
  if (a3 != 16) {
    goto LABEL_20;
  }
LABEL_13:
  uint64_t v21 = [(InboxNotificationsGroupController *)self delegate];
  id v22 = [(id)v21 editorForGroupController:self];

  id v33 = v15;
  LOBYTE(v21) = [v22 deleteEvent:v12 span:0 error:&v33];
  id v23 = v33;

  if ((v21 & 1) == 0)
  {
    uint64_t v24 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v36 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error deleting suggested event: %@", buf, 0xCu);
    }
  }

  id v15 = v23;
  id v25 = v32;
LABEL_21:
}

- (void)_performActionForAttendeeReplyNotification:(id)a3 save:(id)a4
{
  id v11 = (void (**)(id, void *, uint64_t))a4;
  model = self->_model;
  id v7 = a3;
  id v8 = [(CUIKCalendarModel *)model eventStore];
  id v9 = [v7 eventFromEventStore:v8];

  if (v9)
  {
    [v9 dismissAttendeeRepliedNotification];
    if ([v9 hasRecurrenceRules]) {
      uint64_t v10 = 4;
    }
    else {
      uint64_t v10 = 0;
    }
    v11[2](v11, v9, v10);
  }
}

- (void)_performActionForInviteReplayNotification:(id)a3
{
  model = self->_model;
  id v5 = a3;
  uint64_t v6 = [(CUIKCalendarModel *)model eventStore];
  id v7 = [v5 inviteReplyNotificationFromEventStore:v6];

  id v8 = [(CUIKCalendarModel *)self->_model eventStore];
  id v11 = 0;
  LOBYTE(v6) = [v8 removeInviteReplyNotification:v7 error:&v11];
  id v9 = v11;

  if ((v6 & 1) == 0)
  {
    uint64_t v10 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error removing invite reply: %@", buf, 0xCu);
    }
  }
}

- (void)_performActionForResourceChangeNotification:(id)a3
{
  model = self->_model;
  id v5 = a3;
  uint64_t v6 = [(CUIKCalendarModel *)model eventStore];
  id v7 = [v5 resourceChangeFromEventStore:v6];

  id v8 = [(CUIKCalendarModel *)self->_model eventStore];
  id v11 = 0;
  LOBYTE(v6) = [v8 removeResourceChange:v7 error:&v11];
  id v9 = v11;

  if ((v6 & 1) == 0)
  {
    uint64_t v10 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error removing resource change: %@", buf, 0xCu);
    }
  }
}

- (void)_performAction:(int64_t)a3 forEventInvitationNotification:(id)a4 avoidUserInteraction:(BOOL)a5 cancelled:(id)a6 cell:(id)a7
{
  BOOL v9 = a5;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v98 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Event invitation notification: %{public}@.", buf, 0xCu);
  }
  v16 = [(CUIKCalendarModel *)self->_model eventStore];
  uint64_t v17 = [v12 eventFromEventStore:v16];

  if (v17)
  {
    v85 = v14;
    v86 = self;
    id v18 = kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v98 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Event for event invitation notification: %@.", buf, 0xCu);
    }
    uint64_t v19 = 3;
    uint64_t v20 = 4;
    if (a3 != 2) {
      uint64_t v20 = 0;
    }
    if (a3 != 4) {
      uint64_t v19 = v20;
    }
    BOOL v21 = a3 != 1 && a3 == 4;
    if (a3 == 1) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = v19;
    }
    id v23 = (void *)kCalUILogInboxHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
    {
      id v83 = v12;
      uint64_t v24 = v17;
      id v25 = v13;
      uint64_t v26 = v23;
      v27 = +[NSNumber numberWithInteger:a3];
      dispatch_queue_t v28 = +[NSNumber numberWithInteger:v22];
      *(_DWORD *)long long buf = 138543618;
      id v98 = v27;
      __int16 v99 = 2114;
      v100 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Translated event status button action: [%{public}@] to participant status: [%{public}@].", buf, 0x16u);

      id v13 = v25;
      uint64_t v17 = v24;
      id v12 = v83;
    }
    if (v9)
    {
      id v29 = v86;
LABEL_37:
      [(InboxNotificationsGroupController *)v29 _saveStatus:v22 forEventInvitationNotification:v12 commit:1];
LABEL_38:
      id v14 = v85;
      goto LABEL_39;
    }
    if (v21)
    {
      if ([v17 allowsResponseCommentModifications])
      {
        v30 = +[CUIKPreferences sharedPreferences];
        id v31 = [v30 promptForCommentWhenDeclining];

        if (v31 == (id)2
          || v31 == (id)1
          && ([v17 calendar],
              id v32 = objc_claimAutoreleasedReturnValue(),
              [v32 source],
              id v33 = objc_claimAutoreleasedReturnValue(),
              unsigned int v34 = [v33 wantsCommentPromptWhenDeclining],
              v33,
              v32,
              v34))
        {
          unsigned __int8 v35 = [v17 responseComment];
          id v36 = +[CUIKNotificationDescriptionGenerator stringWithAutoCommentRemoved:v35];

          if (!v36) {
            id v36 = &stru_1001D6918;
          }
          pendingComments = v86->_pendingComments;
          id v38 = [v12 URL];
          [(NSMutableDictionary *)pendingComments setObject:v36 forKeyedSubscript:v38];

          id v14 = v85;
          [v85 setShowsCommentPrompt:1 animated:1 initialValue:v36];

          goto LABEL_39;
        }
      }
    }
    if (a3 == 1 && [v17 hasRecurrenceRules])
    {
      v39 = [v17 selfAttendee];
      if ([v39 participantType] == (id)2)
      {

LABEL_33:
        id v42 = [(InboxNotificationsGroupController *)v86 conflictInfoForNotification:v12];
        if (v42)
        {
          v43 = +[NSBundle bundleForClass:objc_opt_class()];
          v84 = [v43 localizedStringForKey:@"Are you sure you want to accept this recurring event?" value:&stru_1001D6918 table:0];

          id v44 = +[NSBundle bundleForClass:objc_opt_class()];
          uint64_t v45 = [v44 localizedStringForKey:@"Accept All" value:&stru_1001D6918 table:0];

          v46 = +[NSBundle bundleForClass:objc_opt_class()];
          v80 = [v46 localizedStringForKey:@"Accept Only Available" value:&stru_1001D6918 table:0];

          v47 = +[NSBundle bundleForClass:objc_opt_class()];
          v79 = [v47 localizedStringForKey:@"Cancel" value:&stru_1001D6918 table:0];

          id v48 = [v42 totalOccurrencesInSeries];
          v81 = (void *)v45;
          v82 = v13;
          if (v48 == [v42 totalConflictsInSeries])
          {
            v49 = +[NSBundle bundleForClass:objc_opt_class()];
            v50 = [v49 localizedStringForKey:@"All %d occurrences of the event “%@” conflict with other events on your calendar. If you accept, all occurrences will overlap with other scheduled events.", &stru_1001D6918, 0 value table];

            id v51 = [v42 totalConflictsInSeries];
            v52 = [v17 title];
            uint64_t v53 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v50, v51, v52);

            v54 = v86;
            v55 = (void *)v53;
            v56 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v57 = [v56 localizedStringForKey:@"Accept" value:&stru_1001D6918 table:0];

            v81 = (void *)v57;
          }
          else
          {
            id v58 = [v42 totalConflictsInSeries];
            v59 = +[NSBundle mainBundle];
            v60 = v59;
            if (v58 == (id)1)
            {
              v50 = [v59 localizedStringForKey:@"1 of %d occurrences of the event “%@” conflicts with other events on your calendar. If you accept all occurrences, one will overlap with another scheduled event.", &stru_1001D6918, 0 value table];

              id v61 = [v42 totalConflictsInSeries];
              v56 = [v17 title];
              +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v50, v61, v56, v77);
            }
            else
            {
              v50 = [v59 localizedStringForKey:@"%d of %d occurrences of the event “%@” conflict with other events on your calendar. If you accept all occurrences, some will overlap with other scheduled events. ", &stru_1001D6918, 0 value table];

              id v62 = [v42 totalConflictsInSeries];
              id v63 = [v42 totalOccurrencesInSeries];
              v56 = [v17 title];
              +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v50, v62, v63, v56);
            v55 = };
            v54 = v86;
          }

          v92[0] = _NSConcreteStackBlock;
          v92[1] = 3221225472;
          v92[2] = sub_1000A1FF0;
          v92[3] = &unk_1001D3DD8;
          v92[4] = v54;
          uint64_t v96 = v22;
          id v64 = v12;
          id v93 = v64;
          v78 = v42;
          id v65 = v42;
          id v94 = v65;
          id v95 = v17;
          v66 = objc_retainBlock(v92);
          v89[0] = _NSConcreteStackBlock;
          v89[1] = 3221225472;
          v89[2] = sub_1000A22BC;
          v89[3] = &unk_1001D3E00;
          v89[4] = v54;
          uint64_t v91 = v22;
          id v90 = v64;
          v67 = objc_retainBlock(v89);
          v87[0] = _NSConcreteStackBlock;
          v87[1] = 3221225472;
          v87[2] = sub_1000A22D0;
          v87[3] = &unk_1001D3E28;
          id v88 = v82;
          v68 = objc_retainBlock(v87);
          v69 = +[UIAlertController alertControllerWithTitle:v84 message:v55 preferredStyle:1];
          id v70 = [v65 totalOccurrencesInSeries];
          if (v70 != [v65 totalConflictsInSeries])
          {
            v71 = +[UIAlertAction actionWithTitle:v80 style:0 handler:v66];
            [v69 addAction:v71];
          }
          v72 = +[UIAlertAction actionWithTitle:v81 style:0 handler:v67];
          [v69 addAction:v72];

          v73 = +[UIAlertAction actionWithTitle:v79 style:1 handler:v68];
          [v69 addAction:v73];

          v74 = [(InboxNotificationsGroupController *)v86 delegate];
          [v74 parentTableViewControllerForGroupController:v86];
          v76 = v75 = v66;
          [v76 presentViewController:v69 animated:1 completion:0];

          id v13 = v82;
          id v42 = v78;
        }

        goto LABEL_38;
      }
      id v40 = [v17 selfAttendee];
      id v41 = [v40 participantType];

      if (v41 == (id)3) {
        goto LABEL_33;
      }
    }
    id v29 = v86;
    goto LABEL_37;
  }
LABEL_39:
}

- (void)_performActionForAllNotifications:(int64_t)a3 save:(id)a4
{
  id v64 = a4;
  id v65 = self;
  id obj = [(NSArray *)self->_allNotificationReferences CalMap:&stru_1001D3E68];
  if (a3 <= 31)
  {
    if ((unint64_t)(a3 - 1) >= 2 && a3 != 4)
    {
      if (a3 != 16) {
        goto LABEL_5;
      }
LABEL_10:
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v9 = [obj countByEnumeratingWithState:&v67 objects:v85 count:16];
      if (!v9) {
        goto LABEL_71;
      }
      id v10 = v9;
      uint64_t v11 = *(void *)v68;
      p_superclass = CalendarMessageCell.superclass;
LABEL_12:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v68 != v11) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v67 + 1) + 8 * v13);
        id v15 = +[CalendarMessageCell cellClassForNotification:v14];
        if (v15 == (objc_class *)objc_opt_class()) {
          break;
        }
        v16 = +[CalendarMessageCell cellClassForNotification:v14];
        if (v16 == (objc_class *)objc_opt_class())
        {
          id v17 = v14;
          id v18 = +[CalendarMessageEventInvitationCell actionsForNotification:v17];
          uint64_t v19 = +[NSNumber numberWithInteger:a3];
          unsigned int v20 = [v18 containsObject:v19];

          if (v20) {
            [(InboxNotificationsGroupController *)v65 _performAction:a3 forEventInvitationNotification:v17 avoidUserInteraction:1 cancelled:0 cell:0];
          }
LABEL_21:
          p_superclass = (__objc2_class **)(CalendarMessageCell + 8);
        }
        if (v10 == (id)++v13)
        {
          id v10 = [obj countByEnumeratingWithState:&v67 objects:v85 count:16];
          if (!v10) {
            goto LABEL_71;
          }
          goto LABEL_12;
        }
      }
      id v21 = v14;
      id v18 = [p_superclass + 309 actionsForNotification:v21];
      uint64_t v22 = +[NSNumber numberWithInteger:a3];
      unsigned int v23 = [v18 containsObject:v22];

      if (v23) {
        [(InboxNotificationsGroupController *)v65 _performAction:a3 forSuggestionNotification:v21 save:v64];
      }
      goto LABEL_21;
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v24 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v80;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v80 != v26) {
            objc_enumerationMutation(obj);
          }
          dispatch_queue_t v28 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          id v29 = +[CalendarMessageCell cellClassForNotification:v28];
          if (v29 == (objc_class *)objc_opt_class())
          {
            id v30 = v28;
            id v31 = +[CalendarMessageEventInvitationCell actionsForNotification:v30];
            id v32 = +[NSNumber numberWithInteger:a3];
            unsigned int v33 = [v31 containsObject:v32];

            if (v33) {
              [(InboxNotificationsGroupController *)v65 _performAction:a3 forEventInvitationNotification:v30 avoidUserInteraction:1 cancelled:0 cell:0];
            }
          }
        }
        id v25 = [obj countByEnumeratingWithState:&v79 objects:v88 count:16];
      }
      while (v25);
    }
    goto LABEL_71;
  }
  if (a3 == 32)
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v34 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
    if (!v34) {
      goto LABEL_71;
    }
    id v35 = v34;
    uint64_t v36 = *(void *)v76;
    while (1)
    {
      id v37 = 0;
      do
      {
        if (*(void *)v76 != v36) {
          objc_enumerationMutation(obj);
        }
        id v38 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v37);
        v39 = +[CalendarMessageCell cellClassForNotification:v38];
        if (v39 == (objc_class *)objc_opt_class())
        {
          id v44 = v38;
          uint64_t v45 = +[CalendarMessageEventInvitationCell actionsForNotification:v44];
          id v48 = +[NSNumber numberWithInteger:32];
          unsigned int v49 = [v45 containsObject:v48];

          if (v49) {
            [(InboxNotificationsGroupController *)v65 _performAction:32 forEventInvitationNotification:v44 avoidUserInteraction:1 cancelled:0 cell:0];
          }
          goto LABEL_53;
        }
        id v40 = +[CalendarMessageCell cellClassForNotification:v38];
        if (v40 == (objc_class *)objc_opt_class())
        {
          id v44 = v38;
          v50 = [(CUIKCalendarModel *)v65->_model eventStore];
          uint64_t v45 = +[CalendarMessageAttendeeReplyCell actionsForNotification:v44 proposedTimeAttendee:0 eventStore:v50];

          id v51 = +[NSNumber numberWithInteger:32];
          unsigned int v52 = [v45 containsObject:v51];

          if (v52) {
            [(InboxNotificationsGroupController *)v65 _performActionForAttendeeReplyNotification:v44 save:v64];
          }
LABEL_53:

          goto LABEL_54;
        }
        id v41 = +[CalendarMessageCell cellClassForNotification:v38];
        if (v41 == (objc_class *)objc_opt_class())
        {
          [(InboxNotificationsGroupController *)v65 _performActionForInviteReplayNotification:v38];
        }
        else
        {
          id v42 = +[CalendarMessageCell cellClassForNotification:v38];
          if (v42 != (objc_class *)objc_opt_class())
          {
            v43 = +[CalendarMessageCell cellClassForNotification:v38];
            if (v43 != (objc_class *)objc_opt_class()) {
              goto LABEL_54;
            }
            id v44 = v38;
            uint64_t v45 = +[CalendarMessageSuggestionCell actionsForNotification:v44];
            v46 = +[NSNumber numberWithInteger:32];
            unsigned int v47 = [v45 containsObject:v46];

            if (v47) {
              [(InboxNotificationsGroupController *)v65 _performAction:32 forSuggestionNotification:v44 save:v64];
            }
            goto LABEL_53;
          }
          [(InboxNotificationsGroupController *)v65 _performActionForResourceChangeNotification:v38];
        }
LABEL_54:
        id v37 = (char *)v37 + 1;
      }
      while (v35 != v37);
      id v53 = [obj countByEnumeratingWithState:&v75 objects:v87 count:16];
      id v35 = v53;
      if (!v53) {
        goto LABEL_71;
      }
    }
  }
  if (a3 != 128)
  {
    if (a3 != 0x100000)
    {
LABEL_5:
      uint64_t v6 = (void *)kCalUILogInboxHandle;
      if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
      {
        id v7 = v6;
        id v8 = +[NSNumber numberWithInteger:a3];
        *(_DWORD *)long long buf = 138412290;
        v84 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Asked to perform action [%@] for all notifications, but this action is not intended to apply to multiple notifications", buf, 0xCu);
      }
      goto LABEL_71;
    }
    goto LABEL_10;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v54 = [obj countByEnumeratingWithState:&v71 objects:v86 count:16];
  if (v54)
  {
    id v55 = v54;
    uint64_t v56 = *(void *)v72;
    do
    {
      for (j = 0; j != v55; j = (char *)j + 1)
      {
        if (*(void *)v72 != v56) {
          objc_enumerationMutation(obj);
        }
        id v58 = *(void **)(*((void *)&v71 + 1) + 8 * (void)j);
        v59 = +[CalendarMessageCell cellClassForNotification:v58];
        if (v59 == (objc_class *)objc_opt_class())
        {
          id v60 = v58;
          id v61 = +[CalendarMessageSuggestionCell actionsForNotification:v60];
          id v62 = +[NSNumber numberWithInteger:128];
          unsigned int v63 = [v61 containsObject:v62];

          if (v63) {
            [(InboxNotificationsGroupController *)v65 _performAction:128 forSuggestionNotification:v60 save:v64];
          }
        }
      }
      id v55 = [obj countByEnumeratingWithState:&v71 objects:v86 count:16];
    }
    while (v55);
  }
LABEL_71:
}

- (void)performAction:(int64_t)a3 forCell:(id)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
  BOOL v7 = a5;
  id v114 = a4;
  id v112 = a6;
  id v10 = (void *)kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    id v12 = +[NSNumber numberWithInteger:a3];
    uint64_t v13 = +[NSNumber numberWithBool:v7];
    *(_DWORD *)long long buf = 138543874;
    id v149 = v12;
    __int16 v150 = 2114;
    id v151 = v114;
    __int16 v152 = 2114;
    v153 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Perform action [%{public}@] for cell: %{public}@, appliesToAll: %{public}@.", buf, 0x20u);
  }
  id v14 = [(InboxNotificationsGroupController *)self delegate];
  id v15 = [v14 editorForGroupController:self];

  v143[0] = _NSConcreteStackBlock;
  v143[1] = 3221225472;
  v143[2] = sub_1000A3AE8;
  v143[3] = &unk_1001D3E90;
  id v111 = v15;
  id v144 = v111;
  v113 = objc_retainBlock(v143);
  if (v7)
  {
    [(InboxNotificationsGroupController *)self _performActionForAllNotifications:a3 save:v113];
    goto LABEL_90;
  }
  if ((a3 & 0x700) == 0)
  {
    v142[0] = _NSConcreteStackBlock;
    v142[1] = 3221225472;
    v142[2] = sub_1000A3BB8;
    v142[3] = &unk_1001D3EE0;
    v142[4] = self;
    v110 = objc_retainBlock(v142);
    if ((a3 & 0x10000) != 0)
    {
      dispatch_queue_t v28 = [v114 notification];
      BOOL v29 = [v28 type] == (id)8;

      id v115 = [v114 notification];
      id v30 = [(CUIKCalendarModel *)self->_model eventStore];
      if (!v29)
      {
        id v60 = [v115 eventFromEventStore:v30];

        id v61 = [(InboxNotificationsGroupController *)self delegate];
        id v62 = [v61 parentTableViewControllerForGroupController:self];
        PresentJunkAlertControllerForEvent();

LABEL_89:
        goto LABEL_90;
      }
      id v31 = [v115 calendarFromEventStore:v30];

      if (v31)
      {
        id v32 = [(InboxNotificationsGroupController *)self delegate];
        unsigned int v33 = [v32 parentTableViewControllerForGroupController:self];
        v135 = _NSConcreteStackBlock;
        uint64_t v136 = 3221225472;
        v137 = sub_1000A3D58;
        v138 = &unk_1001D3F08;
        id v139 = v31;
        v141 = v110;
        id v140 = v115;
        PresentJunkAlertControllerWithHandler();
      }
      else
      {
        v66 = kCalUILogInboxHandle;
        if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v149 = v115;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "Error reading shared calendar invitation: could not get a calendar for shared calendar notification: %@", buf, 0xCu);
        }
      }

      goto LABEL_88;
    }
    if ((a3 & 0x1000) == 0)
    {
      if ((a3 & 0x2000) != 0)
      {
        unsigned int v63 = [v114 notification];
        id v64 = [(CUIKCalendarModel *)self->_model eventStore];
        id v115 = [v63 eventFromEventStore:v64];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v65 = [v114 proposedTimeAttendee];
        }
        else
        {
          id v65 = 0;
        }
        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        v86 = [v115 attendees];
        id v87 = [v86 countByEnumeratingWithState:&v124 objects:v146 count:16];
        if (v87)
        {
          uint64_t v88 = *(void *)v125;
          do
          {
            for (i = 0; i != v87; i = (char *)i + 1)
            {
              if (*(void *)v125 != v88) {
                objc_enumerationMutation(v86);
              }
              id v90 = *(void **)(*((void *)&v124 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v91 = v90;
                v92 = [v91 URL];
                id v93 = [v65 URL];
                unsigned int v94 = [v92 isEqual:v93];

                if (v94)
                {
                  [v91 setCommentChanged:0];
                  [v91 setStatusChanged:0];
                  [v91 setProposedStartDateChanged:0];
                  [v91 setProposedStartDateStatus:3];
                }
              }
            }
            id v87 = [v86 countByEnumeratingWithState:&v124 objects:v146 count:16];
          }
          while (v87);
        }

        ((void (*)(void *, id, void))v113[2])(v113, v115, 0);
        goto LABEL_88;
      }
      id v21 = [v114 notification];
      if ((a3 & 0x4000) != 0)
      {
        long long v67 = [(CUIKCalendarModel *)self->_model eventStore];
        id v115 = [v21 eventFromEventStore:v67];

        long long v68 = objc_opt_new();
        long long v123 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        long long v120 = 0u;
        long long v69 = [v115 attendees];
        id v70 = [v69 countByEnumeratingWithState:&v120 objects:v145 count:16];
        if (v70)
        {
          uint64_t v71 = *(void *)v121;
          do
          {
            for (j = 0; j != v70; j = (char *)j + 1)
            {
              if (*(void *)v121 != v71) {
                objc_enumerationMutation(v69);
              }
              long long v73 = *(void **)(*((void *)&v120 + 1) + 8 * (void)j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v74 = v73;
                if ([v74 proposedStartDateChanged]) {
                  [v68 addObject:v74];
                }
              }
            }
            id v70 = [v69 countByEnumeratingWithState:&v120 objects:v145 count:16];
          }
          while (v70);
        }

        long long v75 = +[NSBundle bundleForClass:objc_opt_class()];
        long long v76 = [v75 localizedStringForKey:@"RE:" value:&stru_1001D6918 table:0];

        id v77 = [objc_alloc((Class)EKUIEmailCompositionManager) initWithEvent:v115 participantRecipients:v68 subjectPrefix:v76 bodyPrefix:0];
        [(InboxNotificationsGroupController *)self setMessageSendingManager:v77];

        long long v78 = [(InboxNotificationsGroupController *)self messageSendingManager];
        objc_initWeak((id *)buf, v78);

        v118[0] = _NSConcreteStackBlock;
        v118[1] = 3221225472;
        v118[2] = sub_1000A3E08;
        v118[3] = &unk_1001D3F58;
        objc_copyWeak(&v119, (id *)buf);
        long long v79 = [(InboxNotificationsGroupController *)self messageSendingManager];
        [v79 setMessageSendingComplete:v118];

        long long v80 = [(InboxNotificationsGroupController *)self messageSendingManager];
        long long v81 = [v80 viewController];
        [v81 setModalPresentationStyle:2];

        long long v82 = [(InboxNotificationsGroupController *)self delegate];
        id v83 = [v82 parentTableViewControllerForGroupController:self];
        v84 = [(InboxNotificationsGroupController *)self messageSendingManager];
        v85 = [v84 viewController];
        [v83 presentViewController:v85 animated:1 completion:0];

        objc_destroyWeak(&v119);
        objc_destroyWeak((id *)buf);

        goto LABEL_88;
      }
      uint64_t v22 = +[CalendarMessageCell cellClassForNotification:v21];
      if (v22 == (objc_class *)objc_opt_class())
      {
        [(InboxNotificationsGroupController *)self _performAction:a3 forEventInvitationNotification:v21 avoidUserInteraction:0 cancelled:v112 cell:v114];
      }
      else
      {
        unsigned int v23 = +[CalendarMessageCell cellClassForNotification:v21];
        if (v23 == (objc_class *)objc_opt_class())
        {
          [(InboxNotificationsGroupController *)self _performActionForAttendeeReplyNotification:v21 save:v113];
        }
        else
        {
          id v24 = +[CalendarMessageCell cellClassForNotification:v21];
          if (v24 == (objc_class *)objc_opt_class())
          {
            id v115 = v21;
            id v95 = [(CUIKCalendarModel *)self->_model eventStore];
            uint64_t v96 = [v115 calendarFromEventStore:v95];

            if (v96)
            {
              if (a3 == 0x20000 || a3 == 64)
              {
                [v96 setInvitationStatus:0];
                v97 = [v96 calendarIdentifier];
                if (v97)
                {
                  BOOL v98 = a3 == 64;
                  __int16 v99 = [v115 URL];
                  ((void (*)(void *, id))v110[2])(v110, v115);
                  v100 = +[DADConnection sharedConnection];
                  if (v98) {
                    uint64_t v101 = 1;
                  }
                  else {
                    uint64_t v101 = 2;
                  }
                  v102 = [v96 source];
                  v103 = [v102 externalID];
                  v116[0] = _NSConcreteStackBlock;
                  v116[1] = 3221225472;
                  v116[2] = sub_1000A3E7C;
                  v116[3] = &unk_1001D3F80;
                  v116[4] = self;
                  id v104 = v99;
                  id v117 = v104;
                  [v100 respondToSharedCalendarInvite:v101 forCalendarWithID:v97 accountID:v103 queue:&_dispatch_main_q completionBlock:v116];

                  if (v98)
                  {
                    v105 = [v96 sharedOwnerName];
                    v106 = [v96 sharedOwnerEmail];
                    v107 = [v96 sharedOwnerPhoneNumber];
                    +[EKRecents recordRecentForContactWithName:v105 emailAddress:v106 phoneNumber:v107];
                  }
                }
                else
                {
                  v109 = kCalUILogInboxHandle;
                  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    id v149 = v96;
                    _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "Error reading shared calendar invitation: calendar %@ had no calendar identifier", buf, 0xCu);
                  }
                }
              }
            }
            else
            {
              v108 = kCalUILogInboxHandle;
              if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                id v149 = v115;
                _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "Error reading shared calendar invitation: could not get a calendar for shared calendar notification: %@", buf, 0xCu);
              }
            }

            goto LABEL_88;
          }
          id v25 = +[CalendarMessageCell cellClassForNotification:v21];
          if (v25 == (objc_class *)objc_opt_class())
          {
            [(InboxNotificationsGroupController *)self _performActionForInviteReplayNotification:v21];
          }
          else
          {
            uint64_t v26 = +[CalendarMessageCell cellClassForNotification:v21];
            if (v26 == (objc_class *)objc_opt_class())
            {
              [(InboxNotificationsGroupController *)self _performActionForResourceChangeNotification:v21];
            }
            else
            {
              v27 = +[CalendarMessageCell cellClassForNotification:v21];
              if (v27 == (objc_class *)objc_opt_class()) {
                [(InboxNotificationsGroupController *)self _performAction:a3 forSuggestionNotification:v21 save:v113];
              }
            }
          }
        }
      }
      id v115 = v21;
LABEL_88:

      goto LABEL_89;
    }
    id v34 = [v114 notification];
    id v35 = [(CUIKCalendarModel *)self->_model eventStore];
    id v115 = [v34 eventFromEventStore:v35];

    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    uint64_t v36 = [v115 attendees];
    id v37 = 0;
    id v38 = [v36 countByEnumeratingWithState:&v131 objects:v147 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v132;
      do
      {
        for (k = 0; k != v38; k = (char *)k + 1)
        {
          if (*(void *)v132 != v39) {
            objc_enumerationMutation(v36);
          }
          id v41 = *(void **)(*((void *)&v131 + 1) + 8 * (void)k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v42 = v41;
            [v42 setCommentChanged:0];
            [v42 setStatusChanged:0];
            if ([v42 proposedStartDateChanged])
            {
              uint64_t v43 = [v42 proposedStartDateForEvent:v115];

              [v42 setProposedStartDateChanged:0];
              id v37 = (void *)v43;
            }
          }
        }
        id v38 = [v36 countByEnumeratingWithState:&v131 objects:v147 count:16];
      }
      while (v38);

      if (!v37) {
        goto LABEL_38;
      }
      id v44 = [v115 endDate];
      uint64_t v45 = [v115 startDate];
      [v44 timeIntervalSinceDate:v45];
      double v47 = v46;

      [v115 setStartDate:v37];
      uint64_t v36 = [v37 dateByAddingTimeInterval:v47];
      [v115 setEndDate:v36];
    }

LABEL_38:
    [v115 dismissAcceptedProposeNewTimeNotification];
    if ([v115 hasRecurrenceRules])
    {
      id v48 = [(InboxNotificationsGroupController *)self delegate];
      unsigned int v49 = [v48 parentTableViewControllerForGroupController:self];
      [v114 bounds];
      double v51 = v50;
      double v53 = v52;
      double v55 = v54;
      double v57 = v56;
      v128[0] = _NSConcreteStackBlock;
      v128[1] = 3221225472;
      v128[2] = sub_1000A3DA0;
      v128[3] = &unk_1001D3F30;
      v128[4] = self;
      v130 = v113;
      id v129 = v115;
      +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v49, v114, v129, v128, v51, v53, v55, v57);
      id v58 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
      recurrenceAlertController = self->_recurrenceAlertController;
      self->_recurrenceAlertController = v58;
    }
    else
    {
      ((void (*)(void *, id, void))v113[2])(v113, v115, 0);
    }

    goto LABEL_88;
  }
  BOOL v16 = a3 == 1024;
  id v17 = [(InboxNotificationsGroupController *)self delegate];
  id v18 = [(InboxNotificationsGroupController *)self tableView];
  uint64_t v19 = [v18 indexPathForCell:v114];
  unsigned int v20 = -[InboxNotificationsGroupController eventForRow:](self, "eventForRow:", [v19 row]);
  if (v16) {
    [v17 inboxTableViewGroupController:self inspectEvent:v20];
  }
  else {
    [v17 inboxTableViewGroupController:self viewCommentsForEvent:v20];
  }

LABEL_90:
}

- (id)eventStoreForCell:(id)a3
{
  return [(CUIKCalendarModel *)self->_model eventStore];
}

- (void)messageCell:(id)a3 committedComment:(id)a4
{
  pendingComments = self->_pendingComments;
  id v6 = a4;
  id v8 = [a3 notification];
  BOOL v7 = [v8 URL];
  [(NSMutableDictionary *)pendingComments setObject:v6 forKeyedSubscript:v7];
}

- (void)attemptDisplayReviewPrompt
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 attemptDisplayReviewPrompt];
  }
}

- (id)noContentStringForInboxTableView:(id)a3
{
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  char v4 = [v3 localizedStringForKey:@"No Invitations" value:&stru_1001D6918 table:0];

  return v4;
}

- (void)_localeChanged:(id)a3
{
  id v4 = a3;
  id v5 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%@] received the following notification: [%@]", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A41E4;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_notificationsChanged:(id)a3
{
  id v4 = a3;
  id v5 = kCalUILogInboxHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogInboxHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Received notifications changed notification: %{public}@.", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A434C;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)tableView
{
  v3 = [(InboxNotificationsGroupController *)self delegate];
  id v4 = [v3 parentTableViewControllerForGroupController:self];
  id v5 = [v4 tableView];

  return v5;
}

- (id)filteredNotificationsFromArray:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)_eventForIndexPath:(id)a3
{
  id v4 = [a3 row];
  if ((uint64_t)v4 >= (uint64_t)[(NSMutableArray *)self->_notificationReferences count])
  {
    id v12 = 0;
    goto LABEL_13;
  }
  id v5 = [(NSMutableArray *)self->_notificationReferences objectAtIndex:v4];
  id v6 = [v5 notification];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    id v8 = [v7 objectID];

    __int16 v9 = [(CUIKCalendarModel *)self->_model eventStore];
    if (v8)
    {
      id v10 = [v7 objectID];
      uint64_t v11 = [v7 startDate];
      id v12 = [v9 eventForObjectID:v10 occurrenceDate:v11 checkValid:0];
    }
    else
    {
      id v10 = [v7 URL];
      id v12 = [v9 _eventWithURI:v10 checkValid:1];
    }

    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    model = self->_model;
    id v14 = v6;
    id v7 = [(CUIKCalendarModel *)model eventStore];
    __int16 v9 = [v14 eventID];

    id v12 = [v7 eventWithIdentifier:v9];
LABEL_11:

    goto LABEL_12;
  }
  id v12 = 0;
LABEL_12:

LABEL_13:

  return v12;
}

- (BOOL)needsRefresh
{
  return self->_needsRefresh;
}

- (void)setNeedsRefresh:(BOOL)a3
{
  self->_needsRefresh = a3;
}

- (InboxTableViewGroupControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (InboxTableViewGroupControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (EKUIEmailCompositionManager)messageSendingManager
{
  return self->_messageSendingManager;
}

- (void)setMessageSendingManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendingManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_namesQueue, 0);
  objc_storeStrong((id *)&self->_prefetchNamesQueue, 0);
  objc_storeStrong((id *)&self->_conflictsScanningQueue, 0);
  objc_storeStrong((id *)&self->_conflictsQueue, 0);
  objc_storeStrong((id *)&self->_prefetchConflictsQueue, 0);
  objc_storeStrong((id *)&self->_organizerNames, 0);
  objc_storeStrong((id *)&self->_conflictInfo, 0);
  objc_storeStrong((id *)&self->_pendingComments, 0);
  objc_storeStrong((id *)&self->_sharedCalendarInvitationsReplyPending, 0);
  objc_storeStrong((id *)&self->_notificationReferences, 0);
  objc_storeStrong((id *)&self->_allNotificationReferences, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

@end