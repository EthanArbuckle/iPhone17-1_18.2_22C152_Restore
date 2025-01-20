@interface PptHyperlinkBlock
- (PptTxInteracInfoAtom)txtInteractiveInfoAtom;
- (id)interactiveInfoContainerHolder;
- (void)setInteractiveInfoContainerHolder:(id)a3;
- (void)setTxInteractiveInfoAtomHolder:(id)a3;
@end

@implementation PptHyperlinkBlock

- (void)setInteractiveInfoContainerHolder:(id)a3
{
}

- (void)setTxInteractiveInfoAtomHolder:(id)a3
{
}

- (PptTxInteracInfoAtom)txtInteractiveInfoAtom
{
  mTxInteractiveInfoAtomHolder = self->mTxInteractiveInfoAtomHolder;
  if (!mTxInteractiveInfoAtomHolder {
    || (v3 = [(ESDObject *)mTxInteractiveInfoAtomHolder eshObject]) == 0
  }
  {
    exception = __cxa_allocate_exception(4uLL);
    _DWORD *exception = 1000;
  }
  return v5;
}

- (id)interactiveInfoContainerHolder
{
  return self->mInteractiveInfoContainerHolder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTxInteractiveInfoAtomHolder, 0);
  objc_storeStrong((id *)&self->mInteractiveInfoContainerHolder, 0);
}

@end