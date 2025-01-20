@interface CRLAccessibilityBoxedWeakReference
- (CRLAccessibilityBoxedWeakReference)initWithObject:(id)a3;
- (id)reference;
@end

@implementation CRLAccessibilityBoxedWeakReference

- (CRLAccessibilityBoxedWeakReference)initWithObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLAccessibilityBoxedWeakReference;
  v5 = [(CRLAccessibilityBoxedWeakReference *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak(&v5->_reference, v4);
  }

  return v6;
}

- (id)reference
{
  id WeakRetained = objc_loadWeakRetained(&self->_reference);

  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end