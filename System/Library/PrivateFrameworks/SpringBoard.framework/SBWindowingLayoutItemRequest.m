@interface SBWindowingLayoutItemRequest
- (BOOL)wantsFocus;
- (NSString)bundleID;
- (SBWindowingLayoutItemRequest)init;
- (int64_t)layoutRole;
- (int64_t)position;
- (int64_t)size;
- (void)setBundleID:(id)a3;
- (void)setLayoutRole:(int64_t)a3;
- (void)setPosition:(int64_t)a3;
- (void)setSize:(int64_t)a3;
- (void)setWantsFocus:(BOOL)a3;
@end

@implementation SBWindowingLayoutItemRequest

- (SBWindowingLayoutItemRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBWindowingLayoutItemRequest;
  result = [(SBWindowingLayoutItemRequest *)&v3 init];
  if (result)
  {
    result->_layoutRole = 0;
    *(_OWORD *)&result->_size = xmmword_1D8FD0E90;
    result->_wantsFocus = 0;
  }
  return result;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (void)setLayoutRole:(int64_t)a3
{
  self->_layoutRole = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)wantsFocus
{
  return self->_wantsFocus;
}

- (void)setWantsFocus:(BOOL)a3
{
  self->_wantsFocus = a3;
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
}

@end