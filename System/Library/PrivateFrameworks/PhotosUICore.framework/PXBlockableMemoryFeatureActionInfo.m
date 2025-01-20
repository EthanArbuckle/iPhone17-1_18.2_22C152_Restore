@interface PXBlockableMemoryFeatureActionInfo
- (NSString)actionType;
- (NSString)localizedTitle;
- (PXBlockableMemoryFeatureActionInfo)init;
- (PXBlockableMemoryFeatureActionInfo)initWithActionType:(id)a3 localizedTitle:(id)a4;
@end

@implementation PXBlockableMemoryFeatureActionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (PXBlockableMemoryFeatureActionInfo)initWithActionType:(id)a3 localizedTitle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXBlockableMemoryFeatureActionInfo;
  v9 = [(PXBlockableMemoryFeatureActionInfo *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionType, a3);
    uint64_t v11 = [v8 copy];
    localizedTitle = v10->_localizedTitle;
    v10->_localizedTitle = (NSString *)v11;
  }
  return v10;
}

- (PXBlockableMemoryFeatureActionInfo)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXBlockableMemoryFeatureActionInfo.m", 14, @"%s is not available as initializer", "-[PXBlockableMemoryFeatureActionInfo init]");

  abort();
}

@end