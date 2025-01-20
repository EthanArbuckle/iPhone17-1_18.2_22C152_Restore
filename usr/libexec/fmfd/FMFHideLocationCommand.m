@interface FMFHideLocationCommand
- (BOOL)hideLocation;
- (BOOL)isUserAction;
- (FMFHideLocationCommand)initWithHideLocation:(BOOL)a3 forSession:(id)a4;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)setHideLocation:(BOOL)a3;
@end

@implementation FMFHideLocationCommand

- (FMFHideLocationCommand)initWithHideLocation:(BOOL)a3 forSession:(id)a4
{
  BOOL v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMFHideLocationCommand;
  v5 = [(FMFBaseCmd *)&v8 initWithClientSession:a4];
  v6 = v5;
  if (v5) {
    [(FMFHideLocationCommand *)v5 setHideLocation:v4];
  }
  return v6;
}

- (id)pathSuffix
{
  return @"hideLocation/savePrefs";
}

- (id)jsonBodyDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)FMFHideLocationCommand;
  v3 = [(FMFBaseCmd *)&v7 jsonBodyDictionary];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  if ([(FMFHideLocationCommand *)self hideLocation]) {
    CFStringRef v5 = @"Yes";
  }
  else {
    CFStringRef v5 = @"No";
  }
  [v4 setObject:v5 forKey:@"hideLocation"];
  [v3 setObject:v4 forKey:@"prefs"];

  return v3;
}

- (BOOL)isUserAction
{
  return 1;
}

- (BOOL)hideLocation
{
  return self->_hideLocation;
}

- (void)setHideLocation:(BOOL)a3
{
  self->_hideLocation = a3;
}

@end