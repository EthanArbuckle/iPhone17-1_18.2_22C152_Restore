@interface VKResourceManager
- (BOOL)isDevResourceWithName:(id)a3;
- (VKResourceManager)init;
- (id)_localNameForResourceName:(id)a3;
- (id)dataForResourceWithName:(id)a3;
- (id)dataForResourceWithName:(id)a3 fallbackNameHandler:(id)a4;
- (id)pathForResourceWithName:(id)a3;
@end

@implementation VKResourceManager

- (id)_localNameForResourceName:(id)a3
{
  id v3 = a3;
  v4 = [v3 stringByDeletingPathExtension];
  v5 = [v3 pathExtension];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"@%lux", 2);
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"_%lux", 2);
  v8 = [v4 stringByReplacingOccurrencesOfString:v6 withString:v7];

  v9 = objc_msgSend(NSString, "stringWithFormat:", @"@%lux", 3);
  v10 = objc_msgSend(NSString, "stringWithFormat:", @"_%lux", 3);
  v11 = [v8 stringByReplacingOccurrencesOfString:v9 withString:v10];

  v12 = [v11 stringByAppendingPathExtension:v5];

  return v12;
}

- (id)dataForResourceWithName:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F64908] sharedManager];
  vkBundle = self->_vkBundle;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__VKResourceManager_dataForResourceWithName___block_invoke;
  v9[3] = &unk_1E5A932F8;
  v9[4] = self;
  v7 = [v5 dataForResourceWithName:v4 fallbackBundle:vkBundle fallbackNameHandler:v9];

  return v7;
}

id __45__VKResourceManager_dataForResourceWithName___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _localNameForResourceName:a2];
  return v2;
}

- (BOOL)isDevResourceWithName:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F64908] sharedManager];
  vkBundle = self->_vkBundle;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__VKResourceManager_isDevResourceWithName___block_invoke;
  v8[3] = &unk_1E5A932F8;
  v8[4] = self;
  LOBYTE(self) = [v5 isDevResourceWithName:v4 fallbackBundle:vkBundle fallbackNameHandler:v8];

  return (char)self;
}

- (id)dataForResourceWithName:(id)a3 fallbackNameHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F64908] sharedManager];
  v9 = [v8 dataForResourceWithName:v6 fallbackBundle:self->_vkBundle fallbackNameHandler:v7];

  return v9;
}

- (VKResourceManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)VKResourceManager;
  v2 = [(VKResourceManager *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.VectorKit"];
    vkBundle = v2->_vkBundle;
    v2->_vkBundle = (NSBundle *)v3;

    v5 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
}

id __43__VKResourceManager_isDevResourceWithName___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _localNameForResourceName:a2];
  return v2;
}

- (id)pathForResourceWithName:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F64908] sharedManager];
  vkBundle = self->_vkBundle;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__VKResourceManager_pathForResourceWithName___block_invoke;
  v9[3] = &unk_1E5A932F8;
  v9[4] = self;
  objc_super v7 = [v5 pathForResourceWithName:v4 fallbackBundle:vkBundle fallbackNameHandler:v9];

  return v7;
}

id __45__VKResourceManager_pathForResourceWithName___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) _localNameForResourceName:a2];
  return v2;
}

@end