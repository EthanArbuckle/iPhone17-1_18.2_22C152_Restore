@interface ActivitySystemImageName
@end

@implementation ActivitySystemImageName

void ___ActivitySystemImageName_block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F442D8] _typeOfCurrentDevice];
  v1 = (void *)MEMORY[0x1E4F6F260];
  v2 = [v0 identifier];
  id v8 = 0;
  v3 = [v1 symbolForTypeIdentifier:v2 withResolutionStrategy:1 variantOptions:1 error:&v8];
  id v4 = v8;

  if (v4)
  {
    v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v10 = v0;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "Error trying to retrieve symbol from device type (type: %{public}@): Error: %@", buf, 0x16u);
    }
  }
  uint64_t v6 = [v3 name];
  v7 = (void *)_ActivitySystemImageName_imageName;
  _ActivitySystemImageName_imageName = v6;
}

@end