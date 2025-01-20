@interface MFConversationPreviewState
+ (OS_os_log)log;
- (BOOL)beingPreviewed;
- (BOOL)didScrollToReferenceMessage;
- (BOOL)isFullyVisible;
- (BOOL)shouldScrollToReferenceMessage;
- (MFConversationPreviewState)initWithBackgroundUpdater:(id)a3;
- (NSString)description;
- (id)backgroundUpdater;
- (int64_t)state;
- (void)previewCancelled;
- (void)previewDidCommit:(BOOL)a3;
- (void)setBackgroundUpdater:(id)a3;
- (void)setBeingPreviewed:(BOOL)a3;
- (void)setDidScrollToReferenceMessage:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)transitionAfterChangingSources;
- (void)transitionAfterScrollingToReferenceMessage;
- (void)transitionAfterViewDidAppear;
- (void)transitionAfterViewDidDisappear;
@end

@implementation MFConversationPreviewState

- (MFConversationPreviewState)initWithBackgroundUpdater:(id)a3
{
  v4 = (Block_layout *)a3;
  v11.receiver = self;
  v11.super_class = (Class)MFConversationPreviewState;
  v5 = [(MFConversationPreviewState *)&v11 init];
  v6 = v5;
  if (v5)
  {
    v5->_state = 0;
    if (v4) {
      v7 = v4;
    }
    else {
      v7 = &stru_10060B428;
    }
    v8 = objc_retainBlock(v7);
    id backgroundUpdater = v6->_backgroundUpdater;
    v6->_id backgroundUpdater = v8;
  }
  return v6;
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)beingPreviewed
{
  unint64_t v2 = [(MFConversationPreviewState *)self state];
  return (v2 > 4) | (6u >> v2) & 1;
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018FE30;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699A80 != -1) {
    dispatch_once(&qword_100699A80, block);
  }
  unint64_t v2 = (void *)qword_100699A78;

  return (OS_os_log *)v2;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    v5 = +[MFConversationPreviewState log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = self->_state - 1;
      if (v6 > 3) {
        CFStringRef v7 = @"_MFConversationPreviewStateInvisible";
      }
      else {
        CFStringRef v7 = *(&off_10060B448 + v6);
      }
      if ((unint64_t)(a3 - 1) > 3) {
        CFStringRef v8 = @"_MFConversationPreviewStateInvisible";
      }
      else {
        CFStringRef v8 = *(&off_10060B448 + a3 - 1);
      }
      int v10 = 138543618;
      CFStringRef v11 = v7;
      __int16 v12 = 2114;
      CFStringRef v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ -> %{public}@", (uint8_t *)&v10, 0x16u);
    }

    self->_state = a3;
    if (a3)
    {
      v9 = [(MFConversationPreviewState *)self backgroundUpdater];
      v9[2]();
    }
  }
}

- (NSString)description
{
  int64_t v2 = [(MFConversationPreviewState *)self state];
  if ((unint64_t)(v2 - 1) > 3) {
    return (NSString *)@"_MFConversationPreviewStateInvisible";
  }
  else {
    return (NSString *)*(&off_10060B448 + v2 - 1);
  }
}

- (void)transitionAfterViewDidAppear
{
  v3 = +[MFConversationPreviewState log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[state transitionAfterViewDidAppear]", v6, 2u);
  }

  int64_t v4 = [(MFConversationPreviewState *)self state];
  uint64_t v5 = 4;
  if (v4 && v4 != 3)
  {
    if (v4 != 1) {
      return;
    }
    uint64_t v5 = 2;
  }
  [(MFConversationPreviewState *)self setState:v5];
}

- (void)transitionAfterViewDidDisappear
{
  v3 = +[MFConversationPreviewState log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[state transitionAfterViewDidDisappear]", v4, 2u);
  }

  [(MFConversationPreviewState *)self setState:0];
  [(MFConversationPreviewState *)self setDidScrollToReferenceMessage:0];
}

- (void)transitionAfterScrollingToReferenceMessage
{
  v3 = +[MFConversationPreviewState log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[state transitionAfterScrollingToReferenceMessage]", v4, 2u);
  }

  [(MFConversationPreviewState *)self setDidScrollToReferenceMessage:1];
}

- (void)transitionAfterChangingSources
{
  v3 = +[MFConversationPreviewState log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[state transitionAfterChangingSources]", v4, 2u);
  }

  [(MFConversationPreviewState *)self setDidScrollToReferenceMessage:0];
}

- (void)setBeingPreviewed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[MFConversationPreviewState log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = NSStringFromBOOL();
    int v7 = 138412290;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[state setBeingPreviewed: %@]", (uint8_t *)&v7, 0xCu);
  }
  if (v3) {
    [(MFConversationPreviewState *)self setState:1];
  }
}

- (void)previewDidCommit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[MFConversationPreviewState log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v6 = NSStringFromBOOL();
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[state previewDidCommit: %@]", (uint8_t *)&v8, 0xCu);
  }
  if (v3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 0;
  }
  [(MFConversationPreviewState *)self setState:v7];
}

- (void)previewCancelled
{
  BOOL v3 = +[MFConversationPreviewState log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[state previewCancelled]", v4, 2u);
  }

  [(MFConversationPreviewState *)self setState:0];
}

- (BOOL)shouldScrollToReferenceMessage
{
  return ![(MFConversationPreviewState *)self didScrollToReferenceMessage];
}

- (BOOL)isFullyVisible
{
  return (id)[(MFConversationPreviewState *)self state] == (id)4;
}

- (BOOL)didScrollToReferenceMessage
{
  return self->_didScrollToReferenceMessage;
}

- (void)setDidScrollToReferenceMessage:(BOOL)a3
{
  self->_didScrollToReferenceMessage = a3;
}

- (id)backgroundUpdater
{
  return self->_backgroundUpdater;
}

- (void)setBackgroundUpdater:(id)a3
{
}

- (void).cxx_destruct
{
}

@end