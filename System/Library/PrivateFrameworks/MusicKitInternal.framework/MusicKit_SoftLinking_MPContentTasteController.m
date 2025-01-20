@interface MusicKit_SoftLinking_MPContentTasteController
+ (MusicKit_SoftLinking_MPContentTasteController)sharedContentTasteController;
+ (NSString)contentTasteControllerDidChangeNotificationName;
- (id)_initWithUnderlyingContentTasteController:(id)a3;
- (int64_t)_contentTasteTypeFromUnderlyingTasteType:(int64_t)a3;
- (int64_t)_underlyingTasteTypeFromContentTasteType:(int64_t)a3;
- (int64_t)tasteTypeForModelObject:(id)a3;
- (void)_handleContentTasteControllerDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)setTasteType:(int64_t)a3 forModelObject:(id)a4 completionHandler:(id)a5;
@end

@implementation MusicKit_SoftLinking_MPContentTasteController

+ (MusicKit_SoftLinking_MPContentTasteController)sharedContentTasteController
{
  if (sharedContentTasteController_sOnceToken != -1) {
    dispatch_once(&sharedContentTasteController_sOnceToken, &__block_literal_global_9);
  }
  v2 = (void *)sharedContentTasteController_sSharedContentTasteController;
  return (MusicKit_SoftLinking_MPContentTasteController *)v2;
}

- (id)_initWithUnderlyingContentTasteController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPContentTasteController;
  v6 = [(MusicKit_SoftLinking_MPContentTasteController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingContentTasteController, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = getMPContentTasteControllerDidChangeNotification();
    [v8 addObserver:v7 selector:sel__handleContentTasteControllerDidChangeNotification_ name:v9 object:v7->_underlyingContentTasteController];
  }
  return v7;
}

- (void)_handleContentTasteControllerDidChangeNotification:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  id v7 = [v4 defaultCenter];
  v6 = [v5 userInfo];

  [v7 postNotificationName:@"MusicKit_SoftLinking_MPContentTasteControllerDidChangeNotification" object:self userInfo:v6];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = getMPContentTasteControllerDidChangeNotification();
  [v3 removeObserver:self name:v4 object:self->_underlyingContentTasteController];

  v5.receiver = self;
  v5.super_class = (Class)MusicKit_SoftLinking_MPContentTasteController;
  [(MusicKit_SoftLinking_MPContentTasteController *)&v5 dealloc];
}

- (int64_t)tasteTypeForModelObject:(id)a3
{
  v4 = [a3 _underlyingModelObject];
  int64_t v5 = [(MusicKit_SoftLinking_MPContentTasteController *)self _contentTasteTypeFromUnderlyingTasteType:[(MPContentTasteController *)self->_underlyingContentTasteController tasteTypeForModel:v4]];

  return v5;
}

- (void)setTasteType:(int64_t)a3 forModelObject:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int64_t v10 = [(MusicKit_SoftLinking_MPContentTasteController *)self _underlyingTasteTypeFromContentTasteType:a3];
  id v11 = [v9 _underlyingModelObject];

  [(MPContentTasteController *)self->_underlyingContentTasteController setTasteType:v10 forModel:v11 withCompletionHandler:v8];
}

- (int64_t)_contentTasteTypeFromUnderlyingTasteType:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (int64_t)_underlyingTasteTypeFromContentTasteType:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (NSString)contentTasteControllerDidChangeNotificationName
{
  return (NSString *)@"MusicKit_SoftLinking_MPContentTasteControllerDidChangeNotification";
}

- (void).cxx_destruct
{
}

@end