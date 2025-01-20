@interface PCSCurrentIdentity
- (NSDate)currentItemPointerModificationTime;
- (PCSCurrentIdentity)initWithIdentity:(_PCSIdentityData *)a3 currentItemPointerModificationTime:(id)a4;
- (_PCSIdentityData)identity;
- (void)dealloc;
- (void)setCurrentItemPointerModificationTime:(id)a3;
@end

@implementation PCSCurrentIdentity

- (PCSCurrentIdentity)initWithIdentity:(_PCSIdentityData *)a3 currentItemPointerModificationTime:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PCSCurrentIdentity;
  v7 = [(PCSCurrentIdentity *)&v10 init];
  if (v7)
  {
    v7->_identity = (_PCSIdentityData *)CFRetain(a3);
    [(PCSCurrentIdentity *)v7 setCurrentItemPointerModificationTime:v6];
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  identity = self->_identity;
  if (identity)
  {
    self->_identity = 0;
    CFRelease(identity);
  }
  v4.receiver = self;
  v4.super_class = (Class)PCSCurrentIdentity;
  [(PCSCurrentIdentity *)&v4 dealloc];
}

- (_PCSIdentityData)identity
{
  return self->_identity;
}

- (NSDate)currentItemPointerModificationTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCurrentItemPointerModificationTime:(id)a3
{
}

- (void).cxx_destruct
{
}

@end