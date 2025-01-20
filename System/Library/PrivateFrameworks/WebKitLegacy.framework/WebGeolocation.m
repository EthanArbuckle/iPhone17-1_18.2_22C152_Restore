@interface WebGeolocation
- (id)_initWithWebCoreGeolocation:(void *)a3;
- (void)dealloc;
- (void)setIsAllowed:(BOOL)a3;
@end

@implementation WebGeolocation

- (id)_initWithWebCoreGeolocation:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WebGeolocation;
  id result = [(WebGeolocation *)&v5 init];
  if (result)
  {
    ++*((_DWORD *)a3 + 8);
    *((void *)result + 1) = a3;
  }
  return result;
}

- (void)setIsAllowed:(BOOL)a3
{
  v3 = self->_private;
  v6 = 0;
  WebCore::Geolocation::setIsAllowed(v3, a3, (const WTF::String *)&v6);
  objc_super v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (void)dealloc
{
  v3 = self->_private;
  if (v3)
  {
    if (*((_DWORD *)v3 + 8) == 1)
    {
      uint64_t v4 = MEMORY[0x1E4E448C0]();
      MEMORY[0x1E4E448D0](v4);
    }
    else
    {
      --*((_DWORD *)v3 + 8);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)WebGeolocation;
  [(WebGeolocation *)&v5 dealloc];
}

@end