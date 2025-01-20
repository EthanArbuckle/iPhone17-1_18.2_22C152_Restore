@interface CRTextFeatureMultiRegion
- (CRTextFeatureMultiRegion)initWithOrderedFeatures:(id)a3;
@end

@implementation CRTextFeatureMultiRegion

- (CRTextFeatureMultiRegion)initWithOrderedFeatures:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CRTextFeatureMultiRegion;
  v5 = [(CRTextFeature *)&v29 init];
  v6 = v5;
  if (v5)
  {
    [(CRTextFeature *)v5 setSubFeatures:v4];
    -[CRTextFeature setBounds:](v6, "setBounds:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v7 = [(CRTextFeature *)v6 subFeatures];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v26;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v25 + 1) + 8 * v10);
          [(CRTextFeature *)v6 bounds];
          CGFloat v13 = v12;
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          [v11 bounds];
          v34.origin.x = v20;
          v34.origin.y = v21;
          v34.size.width = v22;
          v34.size.height = v23;
          v32.origin.x = v13;
          v32.origin.y = v15;
          v32.size.width = v17;
          v32.size.height = v19;
          CGRect v33 = CGRectUnion(v32, v34);
          -[CRTextFeature setBounds:](v6, "setBounds:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
          [v11 setShouldExpandToFullWidth:0];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v8);
    }
  }
  return v6;
}

@end