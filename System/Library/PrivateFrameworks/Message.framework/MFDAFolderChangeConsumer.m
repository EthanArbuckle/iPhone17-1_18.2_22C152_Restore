@interface MFDAFolderChangeConsumer
- (MFDAFolderChangeConsumer)init;
- (id)waitForResult;
- (void)folderChange:(id)a3 finishedWithStatus:(int64_t)a4 error:(id)a5;
@end

@implementation MFDAFolderChangeConsumer

- (MFDAFolderChangeConsumer)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFDAFolderChangeConsumer;
  v2 = [(MFDAFolderChangeConsumer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F734B0]) initWithName:@"_MFDAFolderChangeConsumer_Lock" condition:0 andDelegate:0];
    conditionLock = v2->_conditionLock;
    v2->_conditionLock = (MFConditionLock *)v3;
  }
  return v2;
}

- (void)folderChange:(id)a3 finishedWithStatus:(int64_t)a4 error:(id)a5
{
  id v9 = a3;
  int64_t v21 = a4;
  id v10 = a5;
  id v20 = v10;
  MFWalkUpDAErrorChain(&v20, &v21);
  id v11 = v20;

  [(MFConditionLock *)self->_conditionLock lock];
  if (self->_result)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = NSStringFromSelector(a2);
    [v18 handleFailureInMethod:a2, self, @"MFDAFolderChangeConsumer.m", 55, @"%@ should not be called twice", v19 object file lineNumber description];
  }
  v12 = [MFDAFolderChangeResult alloc];
  int64_t v13 = v21;
  v14 = [v9 folderId];
  v15 = [v9 displayName];
  v16 = [(MFDAFolderChangeResult *)v12 initWithStatusCode:v13 error:v11 folderID:v14 folderName:v15];
  result = self->_result;
  self->_result = v16;

  [(MFConditionLock *)self->_conditionLock unlockWithCondition:1];
}

- (id)waitForResult
{
  [(MFConditionLock *)self->_conditionLock lockWhenCondition:1];
  uint64_t v3 = self->_result;
  [(MFConditionLock *)self->_conditionLock unlock];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_conditionLock, 0);
}

@end