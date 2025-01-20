@interface ACMDelegate
- (ACMDelegate)init;
- (id)appleConnectParentViewController:(id)a3;
- (id)copyTicketCompletion;
- (unsigned)finished;
- (void)appleConnect:(id)a3 authenticationDidEndWithResponse:(id)a4;
- (void)setCopyTicketCompletion:(id)a3;
- (void)setFinished:(unsigned __int8)a3;
@end

@implementation ACMDelegate

- (ACMDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)ACMDelegate;
  v2 = [(ACMDelegate *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ACMDelegate *)v2 setCopyTicketCompletion:0];
  }
  return v3;
}

- (id)appleConnectParentViewController:(id)a3
{
  return 0;
}

- (void)appleConnect:(id)a3 authenticationDidEndWithResponse:(id)a4
{
  if (objc_msgSend(a4, "error", a3))
  {
    NSLog(&cfstr_Authentication.isa, [a4 error]);
    v6 = 0;
  }
  else
  {
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    uint64_t v9 = [a4 userName];
    CFStringRef v10 = (const __CFString *)[a4 token];
    v6 = CFDataCreateMutable(v7, 0);
    uint64_t v11 = [a4 userName];
    CFIndex Length = CFStringGetLength((CFStringRef)[a4 token]);
    NSLog(&cfstr_Authentication_0.isa, v11, Length, [a4 token]);
    CFStringRef v13 = CFStringCreateWithFormat(v7, 0, @"%@/%d", v9, 1205);
    CFIndex v14 = CFStringGetLength(v13);
    CFDataSetLength(v6, v14 + 1);
    MutableBytePtr = (char *)CFDataGetMutableBytePtr(v6);
    CFIndex v16 = CFDataGetLength(v6);
    CFStringGetCString(v13, MutableBytePtr, v16, 0x8000100u);
    CFIndex v17 = CFStringGetLength(v10);
    CFDataSetLength(Mutable, v17 + 1);
    v18 = (char *)CFDataGetMutableBytePtr(Mutable);
    CFIndex v19 = CFDataGetLength(Mutable);
    CFStringGetCString(v10, v18, v19, 0x8000100u);
    BytePtr = CFDataGetBytePtr(Mutable);
    CFIndex v21 = CFDataGetLength(Mutable);
    CFDataAppendBytes(v6, BytePtr, v21 - 1);
    CFIndex v22 = CFDataGetLength(v6);
    NSLog(&cfstr_SsodataLd.isa, v22, v6);
    CFRelease(v13);
    CFRelease(Mutable);
  }
  v23 = [(ACMDelegate *)self copyTicketCompletion];
  v23[2](v23, v6, [a4 error]);
  if (v6)
  {
    CFRelease(v6);
  }
}

- (id)copyTicketCompletion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCopyTicketCompletion:(id)a3
{
}

- (unsigned)finished
{
  return self->_finished;
}

- (void)setFinished:(unsigned __int8)a3
{
  self->_finished = a3;
}

@end