@interface VFXWeakPointer
- (id)copyWeakRef;
- (id)weakRef;
- (void)setWeakRef:(id)a3;
@end

@implementation VFXWeakPointer

- (id)copyWeakRef
{
  objc_msgSend_weakRef(self, a2, v2, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)weakRef
{
  id WeakRetained = objc_loadWeakRetained(&self->weakRef);

  return WeakRetained;
}

- (void)setWeakRef:(id)a3
{
}

- (void).cxx_destruct
{
}

@end