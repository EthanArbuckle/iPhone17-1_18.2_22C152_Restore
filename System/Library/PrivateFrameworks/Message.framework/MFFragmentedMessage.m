@interface MFFragmentedMessage
- ($75E14A590391D0A34F4BF6DF9BD9659D)uidAndSize;
- (NSArray)existingParts;
- (NSURL)mainFile;
- (id)initWithUIDAndSize:(void *)a3 mainFile:(void *)a4 existingParts:;
@end

@implementation MFFragmentedMessage

- (id)initWithUIDAndSize:(void *)a3 mainFile:(void *)a4 existingParts:
{
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)MFFragmentedMessage;
    v10 = (char *)objc_msgSendSuper2(&v16, sel_init);
    a1 = (id *)v10;
    if (v10)
    {
      long long v11 = *a2;
      *((void *)v10 + 5) = *((void *)a2 + 2);
      *(_OWORD *)(v10 + 24) = v11;
      objc_storeStrong((id *)v10 + 1, a3);
      uint64_t v12 = [v9 copy];
      v13 = (void *)v12;
      if (v12) {
        v14 = (void *)v12;
      }
      else {
        v14 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong(a1 + 2, v14);
    }
  }

  return a1;
}

- ($75E14A590391D0A34F4BF6DF9BD9659D)uidAndSize
{
  *($FDA50581DD76B40DE124A940D646EB3C *)retstr = ($FDA50581DD76B40DE124A940D646EB3C)self[1];
  return self;
}

- (NSURL)mainFile
{
  return self->_mainFile;
}

- (NSArray)existingParts
{
  return self->_existingParts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingParts, 0);
  objc_storeStrong((id *)&self->_mainFile, 0);
}

@end