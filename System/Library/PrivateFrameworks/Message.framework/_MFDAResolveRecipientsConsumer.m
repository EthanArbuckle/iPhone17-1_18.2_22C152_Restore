@interface _MFDAResolveRecipientsConsumer
- (NSError)error;
- (_MFDAResolveRecipientsConsumer)init;
- (id)waitForResolvedRecipients;
- (void)actionFailed:(int64_t)a3 forTask:(id)a4 error:(id)a5;
- (void)resolvedRecipientsByEmailAddress:(id)a3;
@end

@implementation _MFDAResolveRecipientsConsumer

- (_MFDAResolveRecipientsConsumer)init
{
  v6.receiver = self;
  v6.super_class = (Class)_MFDAResolveRecipientsConsumer;
  v2 = [(_MFDAResolveRecipientsConsumer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F734B0]) initWithName:@"_MFDAResolveRecipientsConsumer_Lock" condition:0 andDelegate:0];
    conditionLock = v2->_conditionLock;
    v2->_conditionLock = (MFConditionLock *)v3;
  }
  return v2;
}

- (NSError)error
{
  [(MFConditionLock *)self->_conditionLock lock];
  uint64_t v3 = self->_error;
  [(MFConditionLock *)self->_conditionLock unlock];
  return v3;
}

- (id)waitForResolvedRecipients
{
  [(MFConditionLock *)self->_conditionLock lockWhenCondition:1];
  uint64_t v3 = self->_resolvedRecipientsByEmailAddress;
  [(MFConditionLock *)self->_conditionLock unlock];
  return v3;
}

- (void)resolvedRecipientsByEmailAddress:(id)a3
{
  id v6 = a3;
  [(MFConditionLock *)self->_conditionLock lock];
  v4 = (NSDictionary *)[v6 copy];
  resolvedRecipientsByEmailAddress = self->_resolvedRecipientsByEmailAddress;
  self->_resolvedRecipientsByEmailAddress = v4;

  [(MFConditionLock *)self->_conditionLock unlockWithCondition:1];
}

- (void)actionFailed:(int64_t)a3 forTask:(id)a4 error:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  [(MFConditionLock *)self->_conditionLock lock];
  v10 = DALoggingwithCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412546;
    id v12 = v8;
    __int16 v13 = 2048;
    int64_t v14 = a3;
    _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_ERROR, "reslove recipients task %@ failed with code %ld", (uint8_t *)&v11, 0x16u);
  }

  objc_storeStrong((id *)&self->_error, a5);
  [(MFConditionLock *)self->_conditionLock unlockWithCondition:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_resolvedRecipientsByEmailAddress, 0);
  objc_storeStrong((id *)&self->_conditionLock, 0);
}

@end