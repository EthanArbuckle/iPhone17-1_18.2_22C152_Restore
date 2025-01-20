@interface HOActivationManager
+ (id)sharedInstance;
- (HOActivationManager)init;
- (NSDate)lastEnteredForegroundDate;
- (void)_enteredForeground:(id)a3;
- (void)setLastEnteredForegroundDate:(id)a3;
@end

@implementation HOActivationManager

- (HOActivationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HOActivationManager;
  v2 = [(HOActivationManager *)&v6 init];
  if (v2)
  {
    v3 = +[NSDate date];
    [(HOActivationManager *)v2 setLastEnteredForegroundDate:v3];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_enteredForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1000DE948 != -1) {
    dispatch_once(&qword_1000DE948, &stru_1000C3D90);
  }
  v0 = (void *)qword_1000DE950;

  return v0;
}

- (void)setLastEnteredForegroundDate:(id)a3
{
}

- (void)_enteredForeground:(id)a3
{
  id v4 = +[NSDate date];
  [(HOActivationManager *)self setLastEnteredForegroundDate:v4];
}

- (NSDate)lastEnteredForegroundDate
{
  return self->_lastEnteredForegroundDate;
}

- (void).cxx_destruct
{
}

@end