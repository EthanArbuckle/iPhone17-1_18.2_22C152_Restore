@interface LockScreenSecureWindow
- (BOOL)_canAffectStatusBarAppearance;
- (LockScreenSecureWindow)initWithCoder:(id)a3;
- (LockScreenSecureWindow)initWithFrame:(CGRect)a3;
- (void)_commonInit;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)registerEventTap:(id)a3;
- (void)sendEvent:(id)a3;
@end

@implementation LockScreenSecureWindow

- (LockScreenSecureWindow)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LockScreenSecureWindow;
  v3 = [(LockScreenSecureWindow *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(LockScreenSecureWindow *)v3 _commonInit];
  }
  return v4;
}

- (LockScreenSecureWindow)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LockScreenSecureWindow;
  v3 = -[LockScreenSecureWindow initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(LockScreenSecureWindow *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = +[MNNavigationService sharedService];
  -[LockScreenSecureWindow setHidden:](self, "setHidden:", [v3 isInNavigatingState] ^ 1);

  [(LockScreenSecureWindow *)self setUserInteractionEnabled:[(LockScreenSecureWindow *)self isHidden] ^ 1];
  id v4 = +[MNNavigationService sharedService];
  [v4 registerObserver:self];
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 1;
}

- (void)registerEventTap:(id)a3
{
  id v4 = a3;
  eventTaps = self->_eventTaps;
  id v8 = v4;
  if (!eventTaps)
  {
    objc_super v6 = +[NSHashTable weakObjectsHashTable];
    v7 = self->_eventTaps;
    self->_eventTaps = v6;

    id v4 = v8;
    eventTaps = self->_eventTaps;
  }
  [(NSHashTable *)eventTaps addObject:v4];
  self->_hasEventTaps = 1;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  if (self->_hasEventTaps)
  {
    if ([(NSHashTable *)self->_eventTaps count])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      v5 = self->_eventTaps;
      id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v12;
        do
        {
          v9 = 0;
          do
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) sendEvent:v4];
            v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v7);
      }
    }
    else
    {
      self->_hasEventTaps = 0;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)LockScreenSecureWindow;
  [(LockScreenSecureWindow *)&v10 sendEvent:v4];
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if ((MNNavigationServiceStateIsNavigating() & 1) == 0)
  {
    [(LockScreenSecureWindow *)self setUserInteractionEnabled:0];
    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100694DAC;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateIsNavigating())
  {
    [(LockScreenSecureWindow *)self setHidden:0];
    [(LockScreenSecureWindow *)self setUserInteractionEnabled:1];
  }
}

- (void).cxx_destruct
{
}

@end