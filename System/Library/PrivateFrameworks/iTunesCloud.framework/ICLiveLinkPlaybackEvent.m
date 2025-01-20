@interface ICLiveLinkPlaybackEvent
- (ICLiveLinkPlaybackEvent)initWithKind:(int64_t)a3;
- (id)description;
- (int64_t)kind;
@end

@implementation ICLiveLinkPlaybackEvent

- (int64_t)kind
{
  return self->_kind;
}

- (id)description
{
  v3 = NSString;
  unint64_t kind = self->_kind;
  if (kind >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown/kind=%ld", self->_kind);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E5ACBAB0[kind];
  }
  v6 = [v3 stringWithFormat:@"<ICLiveLinkPlaybackEvent: %p kind=%@>", self, v5];

  return v6;
}

- (ICLiveLinkPlaybackEvent)initWithKind:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICLiveLinkPlaybackEvent;
  result = [(ICLiveLinkPlaybackEvent *)&v5 init];
  if (result) {
    result->_unint64_t kind = a3;
  }
  return result;
}

@end