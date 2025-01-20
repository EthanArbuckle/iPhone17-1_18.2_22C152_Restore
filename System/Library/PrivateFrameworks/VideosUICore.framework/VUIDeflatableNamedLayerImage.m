@interface VUIDeflatableNamedLayerImage
- (void)_deflateLayerStack;
- (void)_inflateLayerStack;
@end

@implementation VUIDeflatableNamedLayerImage

- (void)_inflateLayerStack
{
  v3 = [(VUINamedLayerStack *)self originalImage];
  v4 = [v3 imageAsset];
  v5 = [v4 _layerStack];

  v6 = [v5 layers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__VUIDeflatableNamedLayerImage__inflateLayerStack__block_invoke;
  v7[3] = &unk_1E6DDCFC8;
  v7[4] = self;
  [v6 enumerateObjectsUsingBlock:v7];
}

void __50__VUIDeflatableNamedLayerImage__inflateLayerStack__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (objc_opt_respondsToSelector())
  {
    v5 = [v9 imageObj];
  }
  else
  {
    v5 = 0;
  }
  v6 = +[VUIGraphicsImageRenderer decodedImage:v5 opaque:0];

  v7 = [*(id *)(a1 + 32) layers];
  v8 = [v7 objectAtIndexedSubscript:a3];
  [v8 setDecodedImage:v6];
}

- (void)_deflateLayerStack
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(VUINamedLayerStack *)self layers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setDecodedImage:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

@end