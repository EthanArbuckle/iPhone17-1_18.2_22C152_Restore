@interface MFAvatarView
+ (OS_os_log)log;
- (BOOL)showsContactOnTap;
- (CNAvatarView)contactAvatarView;
- (CNAvatarViewDelegate)delegate;
- (EFCancelable)token;
- (EFFuture)displayedContact;
- (MFAvatarView)initWithFrame:(CGRect)a3;
- (MUIAvatarImageContext)context;
- (UIImageView)avatarView;
- (id)displayPersonForContext:(id)a3 avatarGenerator:(id)a4;
- (id)displayPersonForEmailAddress:(id)a3 brandIndicatorFuture:(id)a4 usingContactStore:(id)a5;
- (void)dealloc;
- (void)setAvatarView:(id)a3;
- (void)setContactAvatarView:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayedContact:(id)a3;
- (void)setShowsContactOnTap:(BOOL)a3;
- (void)setToken:(id)a3;
@end

@implementation MFAvatarView

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000076E0;
  block[3] = &unk_10003C9E0;
  block[4] = a1;
  if (qword_100048590 != -1) {
    dispatch_once(&qword_100048590, block);
  }
  v2 = (void *)qword_100048588;

  return (OS_os_log *)v2;
}

- (MFAvatarView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)MFAvatarView;
  v7 = -[MFAvatarView initWithFrame:](&v14, "initWithFrame:");
  v8 = v7;
  if (v7)
  {
    if (EMBlackPearlIsFeatureEnabled())
    {
      id v9 = [objc_alloc((Class)UIImageView) initWithFrame:x, y, width, height];
      uint64_t v10 = 8;
    }
    else
    {
      id v9 = [objc_alloc((Class)CNAvatarView) initWithFrame:x, y, width, height];
      uint64_t v10 = 16;
    }
    v11 = (Class *)((char *)&v7->super.super.super.isa + v10);
    v12 = (void *)*v11;
    void *v11 = v9;

    [(MFAvatarView *)v8 addSubview:*v11];
  }
  return v8;
}

- (id)displayPersonForContext:(id)a3 avatarGenerator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    v12 = +[MFAvatarView log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_100021010((uint64_t)v6, (uint64_t)v8, v12);
    }

    id v11 = objc_alloc_init((Class)EFCancelationToken);
    goto LABEL_8;
  }
  id v9 = [(MFAvatarView *)self context];
  unsigned int v10 = [v6 isEqual:v9];

  if (v10)
  {
    id v11 = [(MFAvatarView *)self token];
LABEL_8:
    v13 = v11;
    goto LABEL_10;
  }
  [(MFAvatarView *)self setContext:v6];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007A5C;
  v15[3] = &unk_10003CA30;
  objc_copyWeak(&v17, &location);
  id v16 = v6;
  v13 = [v8 avatarImageForContext:v16 handler:v15];
  [(MFAvatarView *)self setToken:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
LABEL_10:

  return v13;
}

- (id)displayPersonForEmailAddress:(id)a3 brandIndicatorFuture:(id)a4 usingContactStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MFAvatarView *)self displayedContact];
  [v11 cancel];

  if (v8)
  {
    v12 = +[EFScheduler globalAsyncSchedulerWithQualityOfService:25];
    v13 = [(MFAvatarView *)self contactAvatarView];
    objc_super v14 = [v13 descriptorForRequiredKeys];
    if (v9)
    {
      v35[0] = v14;
      v35[1] = CNContactImageDataKey;
      uint64_t v15 = +[NSArray arrayWithObjects:v35 count:2];
    }
    else
    {
      v34 = v14;
      uint64_t v15 = +[NSArray arrayWithObjects:&v34 count:1];
    }
    v18 = (void *)v15;

    v19 = [v10 em_onScheduler:v12 contactFutureForEmailAddress:v8 keysToFetch:v18];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10000827C;
    v32[3] = &unk_10003CA80;
    id v33 = v9;
    v20 = [v19 then:v32];
    [(MFAvatarView *)self setDisplayedContact:v20];
  }
  else
  {
    id v16 = +[NSError ef_cancelledError];
    id v17 = +[EFFuture futureWithError:v16];
    [(MFAvatarView *)self setDisplayedContact:v17];
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v21 = [(MFAvatarView *)self displayedContact];
  v22 = +[EFScheduler mainThreadScheduler];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100008514;
  v29[3] = &unk_10003CAA8;
  objc_copyWeak(&v30, &location);
  [v21 onScheduler:v22 addSuccessBlock:v29];

  v23 = [(MFAvatarView *)self displayedContact];
  v24 = +[EFScheduler mainThreadScheduler];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100008610;
  v27[3] = &unk_10003CAD0;
  objc_copyWeak(&v28, &location);
  [v23 onScheduler:v24 addFailureBlock:v27];

  v25 = [(MFAvatarView *)self displayedContact];
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v25;
}

- (void)setShowsContactOnTap:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MFAvatarView *)self contactAvatarView];
  [v4 setShowsContactOnTap:v3];
}

- (BOOL)showsContactOnTap
{
  v2 = [(MFAvatarView *)self contactAvatarView];
  unsigned __int8 v3 = [v2 showsContactOnTap];

  return v3;
}

- (void)setDelegate:(id)a3
{
  id v5 = a3;
  id v4 = [(MFAvatarView *)self contactAvatarView];
  [v4 setDelegate:v5];
}

- (CNAvatarViewDelegate)delegate
{
  v2 = [(MFAvatarView *)self contactAvatarView];
  unsigned __int8 v3 = [v2 delegate];

  return (CNAvatarViewDelegate *)v3;
}

- (void)dealloc
{
  unsigned __int8 v3 = [(MFAvatarView *)self displayedContact];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)MFAvatarView;
  [(MFAvatarView *)&v4 dealloc];
}

- (UIImageView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (CNAvatarView)contactAvatarView
{
  return self->_contactAvatarView;
}

- (void)setContactAvatarView:(id)a3
{
}

- (EFFuture)displayedContact
{
  return self->_displayedContact;
}

- (void)setDisplayedContact:(id)a3
{
}

- (EFCancelable)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (MUIAvatarImageContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_displayedContact, 0);
  objc_storeStrong((id *)&self->_contactAvatarView, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end