@interface PKCachedAMSMediaLookupItemMusic
- (BOOL)beginContentAccess;
- (BOOL)isContentDiscarded;
- (PKAMSMediaLookupItemMusic)musicItem;
- (PKCachedAMSMediaLookupItemMusic)initWithMusicLookupItem:(id)a3;
- (void)discardContentIfPossible;
- (void)endContentAccess;
@end

@implementation PKCachedAMSMediaLookupItemMusic

- (PKCachedAMSMediaLookupItemMusic)initWithMusicLookupItem:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKCachedAMSMediaLookupItemMusic;
    v6 = [(PKCachedAMSMediaLookupItemMusic *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_musicItem, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)beginContentAccess
{
  BOOL v2 = self->_musicItem != 0;
  self->_contentBeingAcccessed = v2;
  return v2;
}

- (void)discardContentIfPossible
{
  musicItem = self->_musicItem;
  self->_musicItem = 0;
}

- (void)endContentAccess
{
  self->_contentBeingAcccessed = 0;
}

- (BOOL)isContentDiscarded
{
  return self->_musicItem == 0;
}

- (PKAMSMediaLookupItemMusic)musicItem
{
  return self->_musicItem;
}

- (void).cxx_destruct
{
}

@end