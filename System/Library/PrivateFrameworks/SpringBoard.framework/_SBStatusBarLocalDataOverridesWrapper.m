@interface _SBStatusBarLocalDataOverridesWrapper
- ($7B0DBDADF0F0FA7A0BD491CE494BD971)overrides;
- (void)dealloc;
- (void)setOverrides:(id *)a3;
@end

@implementation _SBStatusBarLocalDataOverridesWrapper

- (void)dealloc
{
  overrides = self->_overrides;
  if (overrides) {
    free(overrides);
  }
  v4.receiver = self;
  v4.super_class = (Class)_SBStatusBarLocalDataOverridesWrapper;
  [(_SBStatusBarLocalDataOverridesWrapper *)&v4 dealloc];
}

- (void)setOverrides:(id *)a3
{
  overrides = self->_overrides;
  if (overrides != a3)
  {
    if (a3)
    {
      if (!overrides)
      {
        overrides = ($7B0DBDADF0F0FA7A0BD491CE494BD971 *)malloc_type_malloc(0xF68uLL, 0x100004064C31AF5uLL);
        self->_overrides = overrides;
      }
      memcpy(overrides, a3, sizeof($7B0DBDADF0F0FA7A0BD491CE494BD971));
    }
    else if (overrides)
    {
      free(overrides);
      self->_overrides = 0;
    }
  }
}

- ($7B0DBDADF0F0FA7A0BD491CE494BD971)overrides
{
  return self->_overrides;
}

@end