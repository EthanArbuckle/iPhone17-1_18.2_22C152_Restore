@interface PKPGSVSectionHeaderLayoutState
- (PKPGSVSectionHeaderLayoutState)init;
- (void)initWithContext:(void *)a1;
@end

@implementation PKPGSVSectionHeaderLayoutState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subheaderLayoutStates, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithContext:(void *)a1
{
  v4 = a2;
  v5 = v4;
  if (a1 && v4)
  {
    v14.receiver = a1;
    v14.super_class = (Class)PKPGSVSectionHeaderLayoutState;
    id v6 = objc_msgSendSuper2(&v14, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)v6 + 1, a2);
      id v8 = v5[6];
      v9 = v8;
      if (v8 && [v8 count])
      {
        uint64_t v10 = objc_msgSend(v9, "pk_createArrayByApplyingBlock:", &__block_literal_global_60);
        v11 = (void *)v7[3];
        v7[3] = v10;
      }
    }
    a1 = v7;
    v12 = a1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (PKPGSVSectionHeaderLayoutState)init
{
  return 0;
}

PKPGSVSectionSubheaderLayoutState *__50__PKPGSVSectionHeaderLayoutState_initWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [PKPGSVSectionSubheaderLayoutState alloc];
  id v5 = v3;
  id v6 = v5;
  if (v4 && v5)
  {
    v11.receiver = v4;
    v11.super_class = (Class)PKPGSVSectionSubheaderLayoutState;
    v7 = (id *)objc_msgSendSuper2(&v11, sel_init);
    id v8 = v7;
    if (v7) {
      objc_storeStrong(v7 + 1, a2);
    }
    v4 = v8;
    v9 = v4;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end