@interface MBUserNotification
+ (id)notification;
- (NSString)alternateButton;
- (NSString)body;
- (NSString)button;
- (NSString)identifier;
- (NSString)title;
- (__CFUserNotification)cfUserNotification;
- (double)interval;
- (id)completionBlock;
- (id)displayedBlock;
- (void)dealloc;
- (void)setAlternateButton:(id)a3;
- (void)setBody:(id)a3;
- (void)setButton:(id)a3;
- (void)setCFUserNotification:(__CFUserNotification *)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDisplayedBlock:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterval:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation MBUserNotification

- (void)dealloc
{
  cfUserNotification = self->_cfUserNotification;
  if (cfUserNotification) {
    CFRelease(cfUserNotification);
  }
  id displayedBlock = self->_displayedBlock;
  if (displayedBlock) {
    _Block_release(displayedBlock);
  }
  id completionBlock = self->_completionBlock;
  if (completionBlock) {
    _Block_release(completionBlock);
  }

  v6.receiver = self;
  v6.super_class = (Class)MBUserNotification;
  [(MBUserNotification *)&v6 dealloc];
}

+ (id)notification
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (__CFUserNotification)cfUserNotification
{
  return self->_cfUserNotification;
}

- (void)setCFUserNotification:(__CFUserNotification *)a3
{
  cfUserNotification = self->_cfUserNotification;
  self->_cfUserNotification = a3;
  CFRetain(a3);
  if (cfUserNotification)
  {
    CFRelease(cfUserNotification);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (NSString)alternateButton
{
  return self->_alternateButton;
}

- (void)setAlternateButton:(id)a3
{
}

- (id)displayedBlock
{
  return self->_displayedBlock;
}

- (void)setDisplayedBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

@end