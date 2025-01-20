@interface SSDownloadStatus
- (BOOL)isContentRestricted;
- (BOOL)isFailed;
- (BOOL)isFailedTransient;
- (BOOL)isPausable;
- (BOOL)isPaused;
- (NSError)error;
- (SSDownloadPhase)activePhase;
- (SSDownloadStatus)initWithXPCEncoding:(id)a3;
- (float)percentComplete;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (void)dealloc;
- (void)setContentRestricted:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setFailed:(BOOL)a3;
- (void)setOperationProgress:(id)a3;
- (void)setOperationType:(int64_t)a3;
- (void)setPausable:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPercentComplete:(float)a3;
@end

@implementation SSDownloadStatus

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadStatus;
  [(SSDownloadStatus *)&v3 dealloc];
}

- (BOOL)isFailedTransient
{
  return ![(SSDownloadStatus *)self isFailed] && [(SSDownloadStatus *)self error] != 0;
}

- (BOOL)isPausable
{
  v2 = [(SSDownloadPhase *)self->_activePhase operationProgress];
  return [(SSOperationProgress *)v2 canPause];
}

- (float)percentComplete
{
  v2 = [(SSDownloadPhase *)self->_activePhase operationProgress];
  float v3 = 0.0;
  if (v2)
  {
    v4 = v2;
    uint64_t v5 = [(SSOperationProgress *)v2 normalizedCurrentValue];
    uint64_t v6 = [(SSOperationProgress *)v4 normalizedMaxValue];
    if (v6 >= 1) {
      return (float)v5 / (float)v6;
    }
  }
  return v3;
}

- (void)setOperationProgress:(id)a3
{
  if (a3) {
    uint64_t v5 = [[SSDownloadPhase alloc] initWithOperationProgress:a3];
  }
  else {
    uint64_t v5 = 0;
  }
  self->_activePhase = v5;
}

- (void)setOperationType:(int64_t)a3
{
  v4 = [(SSDownloadPhase *)self->_activePhase operationProgress];
  [(SSOperationProgress *)v4 setOperationType:a3];
}

- (void)setPausable:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(SSDownloadPhase *)self->_activePhase operationProgress];
  [(SSOperationProgress *)v4 setCanPause:v3];
}

- (void)setPercentComplete:(float)a3
{
  v4 = [(SSDownloadPhase *)self->_activePhase operationProgress];
  uint64_t v5 = (uint64_t)(float)((float)[(SSOperationProgress *)v4 normalizedMaxValue] * a3);
  [(SSOperationProgress *)v4 setNormalizedCurrentValue:v5];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = [(SSDownloadPhase *)self->_activePhase copyWithZone:a3];
  *(unsigned char *)(v5 + 16) = self->_contentRestricted;
  *(void *)(v5 + 24) = [(NSError *)self->_error copyWithZone:a3];
  *(unsigned char *)(v5 + 32) = self->_failed;
  *(unsigned char *)(v5 + 33) = self->_paused;
  return (id)v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_activePhase);
  SSXPCDictionarySetCFObject(v3, "1", (__CFString *)self->_error);
  xpc_dictionary_set_BOOL(v3, "4", self->_contentRestricted);
  xpc_dictionary_set_BOOL(v3, "2", self->_failed);
  xpc_dictionary_set_BOOL(v3, "3", self->_paused);
  return v3;
}

- (SSDownloadStatus)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v7.receiver = self;
    v7.super_class = (Class)SSDownloadStatus;
    uint64_t v5 = [(SSDownloadStatus *)&v7 init];
    if (v5)
    {
      v5->_activePhase = [[SSDownloadPhase alloc] initWithXPCEncoding:xpc_dictionary_get_value(a3, "0")];
      v5->_error = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "1"));
      v5->_contentRestricted = xpc_dictionary_get_BOOL(a3, "4");
      v5->_failed = xpc_dictionary_get_BOOL(a3, "2");
      v5->_paused = xpc_dictionary_get_BOOL(a3, "3");
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (SSDownloadPhase)activePhase
{
  return self->_activePhase;
}

- (BOOL)isContentRestricted
{
  return self->_contentRestricted;
}

- (void)setContentRestricted:(BOOL)a3
{
  self->_contentRestricted = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)isFailed
{
  return self->_failed;
}

- (void)setFailed:(BOOL)a3
{
  self->_failed = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

@end