@interface PXFeedPPTConfiguration
+ (id)configurationsForPreset:(unint64_t)a3 testOptions:(id)a4;
- (NSString)name;
- (PXFeedConfiguration)feedConfiguration;
- (PXFeedPPTConfiguration)init;
- (PXFeedPPTConfiguration)initWithName:(id)a3 feedConfiguration:(id)a4;
- (PXFeedPPTConfiguration)initWithPreset:(unint64_t)a3;
@end

@implementation PXFeedPPTConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedConfiguration, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (PXFeedConfiguration)feedConfiguration
{
  return self->_feedConfiguration;
}

- (NSString)name
{
  return self->_name;
}

- (PXFeedPPTConfiguration)initWithName:(id)a3 feedConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXFeedPPTConfiguration;
  v8 = [(PXFeedPPTConfiguration *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    feedConfiguration = v8->_feedConfiguration;
    v8->_feedConfiguration = (PXFeedConfiguration *)v11;
  }
  return v8;
}

- (PXFeedPPTConfiguration)initWithPreset:(unint64_t)a3
{
  if (a3 > 3) {
    id v6 = @"??";
  }
  else {
    id v6 = off_1E5DD04C0[a3];
  }
  id v7 = v6;
  v8 = [(__CFString *)v7 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  if (a3 == 2)
  {
    v10 = [PXStoryMemoryFeedConfiguration alloc];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    uint64_t v12 = [(PXStoryMemoryFeedConfiguration *)v10 initWithSyntheticSectionCount:5 numberOfItemsPerSection:20 photoLibrary:v11 layoutKind:1];
LABEL_10:
    uint64_t v9 = (void *)v12;

    goto LABEL_11;
  }
  if (a3 == 3)
  {
    v13 = [PXStoryMemoryFeedConfiguration alloc];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    uint64_t v12 = [(PXStoryMemoryFeedConfiguration *)v13 initWithMemoriesInPhotoLibrary:v11 layoutKind:1 viewControllerSetupBlock:0];
    goto LABEL_10;
  }
  if (a3 <= 1)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PXFeedPPTConfiguration.m" lineNumber:55 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v9 = 0;
LABEL_11:
  objc_super v14 = [(PXFeedPPTConfiguration *)self initWithName:v8 feedConfiguration:v9];

  return v14;
}

- (PXFeedPPTConfiguration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedPPTConfiguration.m", 43, @"%s is not available as initializer", "-[PXFeedPPTConfiguration init]");

  abort();
}

+ (id)configurationsForPreset:(unint64_t)a3 testOptions:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PXFeedPPTConfiguration_configurationsForPreset_testOptions___block_invoke;
  aBlock[3] = &unk_1E5DD04A0;
  id v6 = v5;
  id v17 = v6;
  id v7 = _Block_copy(aBlock);
  v8 = v7;
  if (a3 == 1)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __62__PXFeedPPTConfiguration_configurationsForPreset_testOptions___block_invoke_2;
    objc_super v14 = &unk_1E5DCDB20;
    id v15 = v7;
    do
      v13((uint64_t)&v11, a3++);
    while (a3 != 4);
  }
  else
  {
    (*((void (**)(void *, unint64_t))v7 + 2))(v7, a3);
  }
  uint64_t v9 = objc_msgSend(v6, "copy", v11, v12);

  return v9;
}

void __62__PXFeedPPTConfiguration_configurationsForPreset_testOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [[PXFeedPPTConfiguration alloc] initWithPreset:a2];
  [v2 addObject:v3];
}

uint64_t __62__PXFeedPPTConfiguration_configurationsForPreset_testOptions___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2 != 1) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

@end