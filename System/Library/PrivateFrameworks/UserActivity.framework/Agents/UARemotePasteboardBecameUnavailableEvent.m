@interface UARemotePasteboardBecameUnavailableEvent
- (id)eventName;
- (id)eventPayload;
- (unint64_t)reason;
- (void)setReason:(unint64_t)a3;
@end

@implementation UARemotePasteboardBecameUnavailableEvent

- (id)eventName
{
  return @"com.apple.UserActivity.UniversalClipboard.Unavailable";
}

- (id)eventPayload
{
  CFStringRef v7 = @"reason";
  uint64_t v2 = +[NSNumber numberWithUnsignedInteger:[(UARemotePasteboardBecameUnavailableEvent *)self reason]];
  v3 = (void *)v2;
  CFStringRef v4 = @"-";
  if (v2) {
    CFStringRef v4 = (const __CFString *)v2;
  }
  CFStringRef v8 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

@end