@interface PRPosterDescriptorGalleryAssetLookupInfo
@end

@implementation PRPosterDescriptorGalleryAssetLookupInfo

id __94__PRPosterDescriptorGalleryAssetLookupInfo_Project__pbf_imageFromBundle_displayContext_error___block_invoke(void *a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1E20], "pbf_traitCollectionForDisplayContext:", a1[4]);
  v3 = [(id)objc_opt_class() _assetManagerCache];
  v4 = [v3 objectForKey:a1[6]];
  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1FD8]);
    uint64_t v6 = a1[6];
    uint64_t v7 = [v2 userInterfaceIdiom];
    uint64_t v8 = *(void *)(a1[8] + 8);
    id obj = *(id *)(v8 + 40);
    v4 = (void *)[v5 initWithURL:v6 idiom:v7 error:&obj];
    objc_storeStrong((id *)(v8 + 40), obj);
    [v3 setObject:v4 forKey:a1[6]];
  }
  v9 = [v4 imageNamed:a1[7] withTrait:v2];

  return v9;
}

@end