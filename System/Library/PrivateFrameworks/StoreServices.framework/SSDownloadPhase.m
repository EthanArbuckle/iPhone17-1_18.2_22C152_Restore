@interface SSDownloadPhase
- (SSDownloadPhase)init;
- (SSDownloadPhase)initWithOperationProgress:(id)a3;
- (SSDownloadPhase)initWithXPCEncoding:(id)a3;
- (SSOperationProgress)operationProgress;
- (double)estimatedSecondsRemaining;
- (float)progressChangeRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int64_t)phaseType;
- (int64_t)progressUnits;
- (int64_t)progressValue;
- (int64_t)totalProgressValue;
- (void)dealloc;
@end

@implementation SSDownloadPhase

- (SSDownloadPhase)init
{
  return [(SSDownloadPhase *)self initWithOperationProgress:0];
}

- (SSDownloadPhase)initWithOperationProgress:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSDownloadPhase;
  v4 = [(SSDownloadPhase *)&v6 init];
  if (v4) {
    v4->_operationProgress = (SSOperationProgress *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadPhase;
  [(SSDownloadPhase *)&v3 dealloc];
}

- (double)estimatedSecondsRemaining
{
  [(SSOperationProgress *)self->_operationProgress estimatedTimeRemaining];
  return result;
}

- (int64_t)phaseType
{
  int64_t v2 = [(SSOperationProgress *)self->_operationProgress operationType];
  if ((unint64_t)(v2 - 1) > 2) {
    return 2;
  }
  else {
    return qword_1A52F6360[v2 - 1];
  }
}

- (int64_t)progressUnits
{
  return [(SSOperationProgress *)self->_operationProgress units] != 1;
}

- (float)progressChangeRate
{
  [(SSOperationProgress *)self->_operationProgress changeRate];
  return v2;
}

- (int64_t)progressValue
{
  return [(SSOperationProgress *)self->_operationProgress currentValue];
}

- (int64_t)totalProgressValue
{
  return [(SSOperationProgress *)self->_operationProgress maxValue];
}

- (SSOperationProgress)operationProgress
{
  return self->_operationProgress;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = [(SSOperationProgress *)self->_operationProgress copyWithZone:a3];
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_operationProgress);
  return v3;
}

- (SSDownloadPhase)initWithXPCEncoding:(id)a3
{
  if (!a3 || MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {

    return 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SSDownloadPhase;
    v5 = [(SSDownloadPhase *)&v7 init];
    if (v5) {
      v5->_operationProgress = [[SSOperationProgress alloc] initWithXPCEncoding:xpc_dictionary_get_value(a3, "0")];
    }
  }
  return v5;
}

@end