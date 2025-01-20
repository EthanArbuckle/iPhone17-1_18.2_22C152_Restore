@interface NPNotePreviewProvider
+ (NPNotePreviewProvider)shared;
- (NPNotePreviewProvider)initWithNotePreviewProvider:(id)a3;
- (NPNotePreviewProviderInternal)notePreviewProvider;
- (id)previewForUserActivity:(id)a3 error:(id *)a4;
- (void)setNotePreviewProvider:(id)a3;
@end

@implementation NPNotePreviewProvider

+ (NPNotePreviewProvider)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global);
  }
  v2 = (void *)shared_shared;

  return (NPNotePreviewProvider *)v2;
}

void __31__NPNotePreviewProvider_shared__block_invoke()
{
  v0 = [NPNotePreviewProvider alloc];
  id v3 = +[NPNotePreviewProviderInternal shared];
  uint64_t v1 = [(NPNotePreviewProvider *)v0 initWithNotePreviewProvider:v3];
  v2 = (void *)shared_shared;
  shared_shared = v1;
}

- (NPNotePreviewProvider)initWithNotePreviewProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPNotePreviewProvider;
  v6 = [(NPNotePreviewProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_notePreviewProvider, a3);
  }

  return v7;
}

- (id)previewForUserActivity:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(NPNotePreviewProvider *)self notePreviewProvider];
  v8 = [v7 previewForUserActivity:v6 error:a4];

  return v8;
}

- (NPNotePreviewProviderInternal)notePreviewProvider
{
  return self->_notePreviewProvider;
}

- (void)setNotePreviewProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end