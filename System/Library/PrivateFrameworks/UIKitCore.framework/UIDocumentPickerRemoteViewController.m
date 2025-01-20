@interface UIDocumentPickerRemoteViewController
@end

@implementation UIDocumentPickerRemoteViewController

void __63___UIDocumentPickerRemoteViewController__didSelectURLBookmark___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v6 = _UIDocumentLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)v11 = 138412802;
      *(void *)&v11[4] = v8;
      *(_WORD *)&v11[12] = 2112;
      *(void *)&v11[14] = v9;
      *(_WORD *)&v11[22] = 2112;
      uint64_t v12 = a3;
      id v10 = v8;
      _os_log_error_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "%@: Error while resolving selected bookmark %@: %@", v11, 0x20u);
    }
  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "publicController", *(_OWORD *)v11, *(void *)&v11[16], v12);
  [v7 _didSelectURL:a2];
}

@end