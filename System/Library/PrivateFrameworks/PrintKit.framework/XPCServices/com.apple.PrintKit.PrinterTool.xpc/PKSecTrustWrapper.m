@interface PKSecTrustWrapper
- (PKSecTrustWrapper)initWithTrust:(__SecTrust *)a3;
- (__SecTrust)trustRef;
- (id)description;
- (void)dealloc;
@end

@implementation PKSecTrustWrapper

- (PKSecTrustWrapper)initWithTrust:(__SecTrust *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKSecTrustWrapper;
  v4 = [(PKSecTrustWrapper *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_trustRef = a3;
    CFRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  CFRelease(self->_trustRef);
  v3.receiver = self;
  v3.super_class = (Class)PKSecTrustWrapper;
  [(PKSecTrustWrapper *)&v3 dealloc];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  return +[NSString stringWithFormat:@"<%@@%p> { unretained trust %p (%d) }", v3, self, [(PKSecTrustWrapper *)self trustRef], CFGetRetainCount([(PKSecTrustWrapper *)self trustRef])];
}

- (__SecTrust)trustRef
{
  return self->_trustRef;
}

@end