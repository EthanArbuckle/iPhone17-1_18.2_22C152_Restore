@interface DMDUserNotification
- (BOOL)displayWhenLocked;
- (DMDUserNotification)init;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)header;
- (NSString)message;
- (NSString)otherButtonTitle;
- (NSUUID)identifier;
- (__CFUserNotification)notificationRef;
- (double)timeout;
- (void)dealloc;
- (void)setAlternateButtonTitle:(id)a3;
- (void)setDefaultButtonTitle:(id)a3;
- (void)setDisplayWhenLocked:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setMessage:(id)a3;
- (void)setNotificationRef:(__CFUserNotification *)a3;
- (void)setOtherButtonTitle:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation DMDUserNotification

- (DMDUserNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)DMDUserNotification;
  v2 = [(DMDUserNotification *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    v2->_displayWhenLocked = 1;
    v2->_timeout = 0.0;
  }
  return v2;
}

- (void)dealloc
{
  notificationRef = self->_notificationRef;
  if (notificationRef) {
    CFRelease(notificationRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)DMDUserNotification;
  [(DMDUserNotification *)&v4 dealloc];
}

- (__CFUserNotification)notificationRef
{
  return self->_notificationRef;
}

- (void)setNotificationRef:(__CFUserNotification *)a3
{
  notificationRef = self->_notificationRef;
  if (notificationRef != a3)
  {
    if (notificationRef) {
      CFRelease(notificationRef);
    }
    if (a3) {
      objc_super v6 = (__CFUserNotification *)CFRetain(a3);
    }
    else {
      objc_super v6 = 0;
    }
    self->_notificationRef = v6;
  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
}

- (NSString)otherButtonTitle
{
  return self->_otherButtonTitle;
}

- (void)setOtherButtonTitle:(id)a3
{
}

- (BOOL)displayWhenLocked
{
  return self->_displayWhenLocked;
}

- (void)setDisplayWhenLocked:(BOOL)a3
{
  self->_displayWhenLocked = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherButtonTitle, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_header, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end