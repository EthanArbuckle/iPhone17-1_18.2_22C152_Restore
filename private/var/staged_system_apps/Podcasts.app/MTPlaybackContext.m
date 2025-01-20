@interface MTPlaybackContext
+ (id)contextWithReason:(unint64_t)a3;
+ (id)defaultContext;
- (BOOL)interruptEvent;
- (BOOL)isInteractive;
- (BOOL)playbackIsUserRequested;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)presentationType;
- (unint64_t)source;
- (unint64_t)upNextQueueIntent;
- (void)setInteractive:(BOOL)a3;
- (void)setInterruptEvent:(BOOL)a3;
- (void)setPresentationType:(unint64_t)a3;
- (void)setSource:(unint64_t)a3;
- (void)setUpNextQueueIntent:(unint64_t)a3;
@end

@implementation MTPlaybackContext

+ (id)defaultContext
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setSource:0];
  [v2 setInteractive:1];
  if (isTV()) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [v2 setPresentationType:v3];

  return v2;
}

+ (id)contextWithReason:(unint64_t)a3
{
  v4 = [a1 defaultContext];
  [v4 setSource:a3];

  return v4;
}

- (BOOL)playbackIsUserRequested
{
  return (id)[(MTPlaybackContext *)self source] != (id)1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  [v4 setSource:[self source]];
  [v4 setInteractive:[self isInteractive]];
  [v4 setPresentationType:[self presentationType]];
  [v4 setUpNextQueueIntent:[self upNextQueueIntent]];
  return v4;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (BOOL)interruptEvent
{
  return self->_interruptEvent;
}

- (void)setInterruptEvent:(BOOL)a3
{
  self->_interruptEvent = a3;
}

- (unint64_t)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(unint64_t)a3
{
  self->_presentationType = a3;
}

- (unint64_t)upNextQueueIntent
{
  return self->_upNextQueueIntent;
}

- (void)setUpNextQueueIntent:(unint64_t)a3
{
  self->_upNextQueueIntent = a3;
}

@end