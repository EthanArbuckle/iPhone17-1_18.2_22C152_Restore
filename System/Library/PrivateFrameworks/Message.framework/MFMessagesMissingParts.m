@interface MFMessagesMissingParts
- (NSArray)fragmentedMessages;
- (NSIndexSet)nonFragmentedMessages;
- (id)initWithFragmentedMessages:(void *)a3 nonFragmentedMessages:(void *)a4 messagesScannedInFilesystemCount:;
- (int64_t)messagesScannedInFilesystemCount;
@end

@implementation MFMessagesMissingParts

- (id)initWithFragmentedMessages:(void *)a3 nonFragmentedMessages:(void *)a4 messagesScannedInFilesystemCount:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)MFMessagesMissingParts;
    a1 = (id *)objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      uint64_t v9 = [v7 copy];
      v10 = (void *)v9;
      if (v9) {
        v11 = (void *)v9;
      }
      else {
        v11 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong(a1 + 1, v11);

      v12 = (void *)[v8 copy];
      v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [MEMORY[0x1E4F28D60] indexSet];
      }
      id v15 = a1[2];
      a1[2] = v14;

      a1[3] = a4;
    }
  }

  return a1;
}

- (NSArray)fragmentedMessages
{
  return self->_fragmentedMessages;
}

- (NSIndexSet)nonFragmentedMessages
{
  return self->_nonFragmentedMessages;
}

- (int64_t)messagesScannedInFilesystemCount
{
  return self->_messagesScannedInFilesystemCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonFragmentedMessages, 0);
  objc_storeStrong((id *)&self->_fragmentedMessages, 0);
}

@end