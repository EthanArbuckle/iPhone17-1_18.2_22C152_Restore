@interface PXPeopleSuggestionsMediaProvider
- (int)requestImageForPersonSuggestion:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 cropFactor:(int64_t)a6 cornerStyle:(int64_t)a7 resultHandler:(id)a8;
- (void)cancelRequest:(int)a3;
@end

@implementation PXPeopleSuggestionsMediaProvider

- (void)cancelRequest:(int)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *(void *)&a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXPeopleSuggestionsMediaProvider.m", 20, @"Method %s is a responsibility of subclass %@", "-[PXPeopleSuggestionsMediaProvider cancelRequest:]", v7 object file lineNumber description];

  abort();
}

- (int)requestImageForPersonSuggestion:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 cropFactor:(int64_t)a6 cornerStyle:(int64_t)a7 resultHandler:(id)a8
{
  id v11 = a3;
  id v12 = a8;
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  [v13 handleFailureInMethod:a2, self, @"PXPeopleSuggestionsMediaProvider.m", 16, @"Method %s is a responsibility of subclass %@", "-[PXPeopleSuggestionsMediaProvider requestImageForPersonSuggestion:targetSize:displayScale:cropFactor:cornerStyle:resultHandler:]", v15 object file lineNumber description];

  abort();
}

@end