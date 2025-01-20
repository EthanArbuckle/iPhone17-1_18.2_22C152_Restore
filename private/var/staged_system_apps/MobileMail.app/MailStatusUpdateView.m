@interface MailStatusUpdateView
+ (id)log;
- (MailStatusUpdateView)initWithFrame:(CGRect)a3;
- (id)_statusUpdateFormatUpdatedMinutesAgoWithCalendar:(id)a3 date:(id)a4 now:(id)a5;
- (id)_updateTimer:(id)a3 fireDate:(id)a4 quotaDate:(id)a5;
- (void)_setQuotaTimerFireDate:(id)a3;
- (void)_setUpdateTimerFireDate:(id)a3;
- (void)_significantTimeChange:(id)a3;
- (void)dealloc;
- (void)tintColorDidChange;
- (void)updateWithStatusInfo:(id)a3;
@end

@implementation MailStatusUpdateView

- (void)updateWithStatusInfo:(id)a3
{
  id v4 = a3;
  v5 = +[MailStatusUpdateView log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(MailStatusLabelView *)self delegate];
    v7 = [(MailStatusLabelView *)self delegate];
    unsigned int v8 = [v7 shouldShowSubtitle];
    v9 = [v4 ef_publicDescription];
    *(_DWORD *)buf = 134218754;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v80) = v8;
    WORD2(v80) = 2112;
    *(void *)((char *)&v80 + 6) = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%p updateWithStatusInfo: delegate:%@ shouldShowSubtitle:%i statusInfo:%@", buf, 0x26u);
  }
  v58 = [v4 lastUpdateTime];
  uint64_t v10 = (uint64_t)[v4 unsentCount];
  id v53 = [v4 badgeCount];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v80 = sub_100126FB8;
  *((void *)&v80 + 1) = sub_100126FC8;
  id v81 = (id)0xAAAAAAAAAAAAAAAALL;
  id v81 = [v4 iCloudQuotaOfferText];
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = sub_100126FB8;
  v69 = sub_100126FC8;
  id v70 = (id)0xAAAAAAAAAAAAAAAALL;
  id v70 = [v4 iCloudQuotaOfferLink];
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2020000000;
  if (!*(void *)(*(void *)&buf[8] + 40))
  {
    BOOL v64 = 0;
    goto LABEL_18;
  }
  uint64_t v11 = v66[5];
  BOOL v64 = v11 != 0;
  if (!v11) {
    goto LABEL_18;
  }
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_100126FD0;
  v60[3] = &unk_100608F08;
  v60[4] = buf;
  v60[5] = &v65;
  v60[6] = &v61;
  v12 = objc_retainBlock(v60);
  v13 = [v4 showQuotaOfferInformationTimestamp];
  if (v13)
  {
    v14 = +[NSDate date];
    unsigned int v15 = [v14 ef_isEarlierThanDate:v13];

    if (v15)
    {
      v16 = +[MailStatusUpdateView log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v75 = 134218242;
        v76 = self;
        __int16 v77 = 2112;
        v78 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "<MailStatusUpdateView: %p> Invalidating quota information - quota date not reached: %@", v75, 0x16u);
      }

      ((void (*)(void *))v12[2])(v12);
      goto LABEL_17;
    }
    v20 = +[MailStatusUpdateView log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v75 = 134217984;
      v76 = self;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "<MailStatusUpdateView: %p> Display quota information", v75, 0xCu);
    }
  }
  else
  {
    v17 = +[MailStatusUpdateView log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v75 = 134217984;
      v76 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<MailStatusUpdateView: %p> Invalidating quota information - quota date is nil", v75, 0xCu);
    }

    ((void (*)(void *))v12[2])(v12);
    v18 = +[NSCalendar currentCalendar];
    v19 = +[NSDate date];
    v20 = [v18 dateByAddingUnit:128 value:3 toDate:v19 options:0];

    [(MailStatusUpdateView *)self _setQuotaTimerFireDate:v20];
  }

LABEL_17:
LABEL_18:
  unsigned int v21 = [v4 shouldShowSubtitle];
  if (v58)
  {
    statusUpdateProvider = self->_statusUpdateProvider;
    v23 = +[NSDate date];
    id v59 = 0;
    v56 = [(EMStatusUpdateProvider *)statusUpdateProvider statusUpdateStringWithDate:v58 now:v23 nextTransition:&v59];
    id v24 = v59;

    [(MailStatusUpdateView *)self _setUpdateTimerFireDate:v24];
  }
  else
  {
    v56 = 0;
  }
  v25 = [(MailStatusLabelView *)self delegate];
  v55 = [v25 mailboxQualifier];

  v26 = [v4 networkingAccountErrorString];

  if (v26)
  {
    id v57 = [v4 networkingAccountErrorString];
  }
  else if (![v4 hasAccountError] {
         || ([v4 accountErrorString],
  }
             v27 = objc_claimAutoreleasedReturnValue(),
             BOOL v28 = v27 == 0,
             v27,
             v28))
  {
    if (*((unsigned char *)v62 + 24)) {
      id v57 = (id)v66[5];
    }
    else {
      id v57 = 0;
    }
  }
  else
  {
    id v57 = [v4 accountErrorString];
  }
  NSAttributedStringKey v73 = NSForegroundColorAttributeName;
  v29 = +[UIColor systemGrayColor];
  v74 = v29;
  v54 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];

  if (v10)
  {
    v30 = +[NSBundle mainBundle];
    v31 = v30;
    if (v10 <= 1) {
      CFStringRef v32 = @"UNSENT_MESSAGE_FORMAT";
    }
    else {
      CFStringRef v32 = @"UNSENT_MESSAGES_FORMAT";
    }
    v33 = [v30 localizedStringForKey:v32 value:&stru_100619928 table:@"Main"];

    v34 = +[NSNumberFormatter ef_formatUnsignedInteger:v10 withGrouping:1];
    id v35 = objc_alloc((Class)NSAttributedString);
    v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v33, v34);
    uint64_t v10 = (uint64_t)[v35 initWithString:v36];

    goto LABEL_40;
  }
  if ((uint64_t)v53 > 0) {
    unsigned int v37 = v21;
  }
  else {
    unsigned int v37 = 0;
  }
  if (v37 == 1 && v55)
  {
    v33 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v55, v53);
    uint64_t v10 = (uint64_t)[objc_alloc((Class)NSAttributedString) initWithString:v33 attributes:v54];
LABEL_40:
  }
  if (*((unsigned char *)v62 + 24))
  {
    v38 = *(void **)(*(void *)&buf[8] + 40);
LABEL_43:
    id v39 = v38;
    char v40 = 1;
    goto LABEL_46;
  }
  if (!v56)
  {
    v38 = (void *)v10;
    if (!v10)
    {
      id v39 = 0;
      v52 = 0;
      if (!v57) {
        goto LABEL_60;
      }
      goto LABEL_55;
    }
    goto LABEL_43;
  }
  id v41 = [objc_alloc((Class)NSAttributedString) initWithString:v56];
  char v40 = 0;
  id v39 = v41;
LABEL_46:
  if (v57)
  {
    if (v39) {
      BOOL v42 = v10 == 0;
    }
    else {
      BOOL v42 = 1;
    }
    if (v42) {
      char v40 = 1;
    }
    if ((v40 & 1) == 0)
    {
      id v43 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v39];
      NSAttributedStringKey v71 = NSForegroundColorAttributeName;
      v44 = +[UIColor systemGrayColor];
      v72 = v44;
      v45 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];

      id v46 = objc_alloc((Class)NSAttributedString);
      v47 = +[NSBundle mainBundle];
      v48 = [v47 localizedStringForKey:@"STATUS_TEXT_SEPARATOR" value:&stru_100619928 table:@"Main"];
      id v49 = [v46 initWithString:v48 attributes:v45];

      [v43 appendAttributedString:v49];
      [v43 appendAttributedString:v10];
      id v50 = [objc_alloc((Class)NSAttributedString) initWithAttributedString:v43];

      id v39 = v50;
    }
LABEL_55:
    id v51 = v57;
    goto LABEL_57;
  }
  id v51 = (id)v10;
  if (!v10)
  {
LABEL_59:
    v52 = 0;
    goto LABEL_60;
  }
LABEL_57:
  v52 = v51;
  if ([v51 isEqualToAttributedString:v39])
  {

    goto LABEL_59;
  }
LABEL_60:
  [(MailStatusLabelView *)self setPrimaryLabelText:v39];
  [(MailStatusLabelView *)self setSecondaryLabelText:v52];

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(buf, 8);
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A804;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699770 != -1) {
    dispatch_once(&qword_100699770, block);
  }
  v2 = (void *)qword_100699768;

  return v2;
}

- (void)_setUpdateTimerFireDate:(id)a3
{
  id v4 = a3;
  v5 = +[MailStatusUpdateView log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 134218242;
    v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "<MailStatusUpdateView: %p> Kick off new update timer to fire at: %@", (uint8_t *)&v8, 0x16u);
  }

  v6 = [(MailStatusUpdateView *)self _updateTimer:self->_updateTimer fireDate:v4 quotaDate:0];
  updateTimer = self->_updateTimer;
  self->_updateTimer = v6;
}

- (id)_updateTimer:(id)a3 fireDate:(id)a4 quotaDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 invalidate];

  if (v9)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    id v11 = objc_alloc((Class)NSTimer);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100126AF0;
    v15[3] = &unk_100608EE0;
    objc_copyWeak(&v17, &location);
    id v16 = v10;
    id v12 = [v11 initWithFireDate:v9 interval:0 repeats:v15 block:0.0];
    v13 = +[NSRunLoop currentRunLoop];
    [v13 addTimer:v12 forMode:NSDefaultRunLoopMode];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (MailStatusUpdateView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MailStatusUpdateView;
  v3 = -[MailStatusLabelView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (EMStatusUpdateProvider *)objc_alloc_init((Class)EMStatusUpdateProvider);
    statusUpdateProvider = v3->_statusUpdateProvider;
    v3->_statusUpdateProvider = v4;

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v3 selector:"_significantTimeChange:" name:UIApplicationSignificantTimeChangeNotification object:0];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(MailStatusUpdateView *)self _setUpdateTimerFireDate:0];
  [(MailStatusUpdateView *)self _setQuotaTimerFireDate:0];
  v4.receiver = self;
  v4.super_class = (Class)MailStatusUpdateView;
  [(MailStatusUpdateView *)&v4 dealloc];
}

- (void)_significantTimeChange:(id)a3
{
  objc_super v4 = (EMStatusUpdateProvider *)objc_alloc_init((Class)EMStatusUpdateProvider);
  statusUpdateProvider = self->_statusUpdateProvider;
  self->_statusUpdateProvider = v4;
}

- (void)_setQuotaTimerFireDate:(id)a3
{
  id v4 = a3;
  v5 = +[MailStatusUpdateView log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 134218242;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "<MailStatusUpdateView: %p> Kick off new quota timer to fire at: %@", (uint8_t *)&v8, 0x16u);
  }

  v6 = [(MailStatusUpdateView *)self _updateTimer:self->_quotaTimer fireDate:v4 quotaDate:v4];
  quotaTimer = self->_quotaTimer;
  self->_quotaTimer = v6;
}

- (id)_statusUpdateFormatUpdatedMinutesAgoWithCalendar:(id)a3 date:(id)a4 now:(id)a5
{
  v5 = [a3 components:64 fromDate:a4 toDate:a5 options:0];
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"UPDATED_N_MINUTES_AGO_FORMAT%1$ld" value:&stru_100619928 table:@"Main"];
  int v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, [v5 minute]);

  return v8;
}

- (void)tintColorDidChange
{
  id v2 = [(MailStatusLabelView *)self delegate];
  [v2 tintColorDidChange];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusUpdateProvider, 0);
  objc_storeStrong((id *)&self->_quotaTimer, 0);

  objc_storeStrong((id *)&self->_updateTimer, 0);
}

@end