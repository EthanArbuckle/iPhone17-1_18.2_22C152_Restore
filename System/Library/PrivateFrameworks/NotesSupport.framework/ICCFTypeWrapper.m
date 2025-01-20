@interface ICCFTypeWrapper
- (BOOL)isEqual:(id)a3;
- (ICCFTypeWrapper)initWithCFTypeRef:(void *)a3;
- (unint64_t)hash;
- (void)cfTypeRef;
- (void)dealloc;
- (void)ref;
- (void)setCfTypeRef:(void *)a3;
@end

@implementation ICCFTypeWrapper

- (ICCFTypeWrapper)initWithCFTypeRef:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICCFTypeWrapper;
  v4 = [(ICCFTypeWrapper *)&v6 init];
  if (v4) {
    v4->_cfTypeRef = (void *)CFRetain(a3);
  }
  return v4;
}

- (void)dealloc
{
  cfTypeRef = self->_cfTypeRef;
  if (cfTypeRef) {
    CFRelease(cfTypeRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)ICCFTypeWrapper;
  [(ICCFTypeWrapper *)&v4 dealloc];
}

- (void)ref
{
  return self->_cfTypeRef;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && CFEqual(self->_cfTypeRef, (CFTypeRef)[v4 cfTypeRef]) != 0;

  return v5;
}

- (unint64_t)hash
{
  return CFHash(self->_cfTypeRef);
}

- (void)cfTypeRef
{
  return self->_cfTypeRef;
}

- (void)setCfTypeRef:(void *)a3
{
  self->_cfTypeRef = a3;
}

@end