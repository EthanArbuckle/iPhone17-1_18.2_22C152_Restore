@interface PXSimpleVideoContentProvider
- (PXSimpleVideoContentProvider)init;
- (PXSimpleVideoContentProvider)initWithPlayerItem:(id)a3 contentIdentifier:(id)a4;
- (double)loadingProgress;
- (id)contentIdentifier;
- (id)description;
- (id)loadingResult;
- (void)setLoadingProgress:(double)a3;
- (void)setLoadingResult:(id)a3;
@end

@implementation PXSimpleVideoContentProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
  objc_storeStrong((id *)&self->_loadingResult, 0);
}

- (void)setLoadingProgress:(double)a3
{
  self->_loadingProgress = a3;
}

- (double)loadingProgress
{
  return self->_loadingProgress;
}

- (id)contentIdentifier
{
  return self->_contentIdentifier;
}

- (void)setLoadingResult:(id)a3
{
}

- (id)loadingResult
{
  return self->_loadingResult;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PXSimpleVideoContentProvider;
  v4 = [(PXSimpleVideoContentProvider *)&v8 description];
  v5 = [(PXSimpleVideoContentProvider *)self loadingResult];
  v6 = [v3 stringWithFormat:@"%@, Result: %@", v4, v5];

  return v6;
}

- (PXSimpleVideoContentProvider)initWithPlayerItem:(id)a3 contentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXSimpleVideoContentProvider;
  objc_super v8 = [(PXSimpleVideoContentProvider *)&v15 init];
  if (v8)
  {
    v9 = [PXVideoContentProviderLoadingResult alloc];
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    v14[0] = *MEMORY[0x1E4F1FA20];
    v14[1] = v10;
    v14[2] = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    uint64_t v11 = [(PXVideoContentProviderLoadingResult *)v9 initWithPlayerItem:v6 url:0 timeRange:v14 timeRangeMapper:0 error:0 priority:3 description:&stru_1F00B0030];
    loadingResult = v8->_loadingResult;
    v8->_loadingResult = (PXVideoContentProviderLoadingResult *)v11;

    objc_storeStrong((id *)&v8->_contentIdentifier, a4);
    v8->_loadingProgress = 1.0;
  }

  return v8;
}

- (PXSimpleVideoContentProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSimpleVideoContentProvider.m", 20, @"%s is not available as initializer", "-[PXSimpleVideoContentProvider init]");

  abort();
}

@end