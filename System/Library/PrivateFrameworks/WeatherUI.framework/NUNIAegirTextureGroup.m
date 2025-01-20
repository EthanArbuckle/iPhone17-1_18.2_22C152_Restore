@interface NUNIAegirTextureGroup
- (CLKUITexture)starfield;
- (NSArray)albedos;
- (NSArray)cloudsHi;
- (NSArray)cloudsLo;
- (NSArray)cloudsMd;
- (NSArray)emissives;
- (NSArray)gradients;
- (NSArray)normals;
- (void)preloadTexturesForSpheroids:(id)a3;
- (void)setAlbedos:(id)a3;
- (void)setCloudsHi:(id)a3;
- (void)setCloudsLo:(id)a3;
- (void)setCloudsMd:(id)a3;
- (void)setEmissives:(id)a3;
- (void)setGradients:(id)a3;
- (void)setNormals:(id)a3;
- (void)setStarfield:(id)a3;
@end

@implementation NUNIAegirTextureGroup

- (void)preloadTexturesForSpheroids:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v28 + 1) + 8 * v8) type];
        v10 = [MEMORY[0x1E4F1CA48] array];
        v11 = [(NSArray *)self->_albedos objectAtIndexedSubscript:v9];
        [v10 addObject:v11];

        v12 = [(NSArray *)self->_normals objectAtIndexedSubscript:v9];
        [v10 addObject:v12];

        v13 = [(NSArray *)self->_emissives objectAtIndexedSubscript:v9];
        [v10 addObject:v13];

        v14 = [(NSArray *)self->_cloudsLo objectAtIndexedSubscript:v9];
        [v10 addObject:v14];

        v15 = [(NSArray *)self->_cloudsMd objectAtIndexedSubscript:v9];
        [v10 addObject:v15];

        v16 = [(NSArray *)self->_cloudsHi objectAtIndexedSubscript:v9];
        [v10 addObject:v16];

        v17 = [(NSArray *)self->_gradients objectAtIndexedSubscript:v9];
        [v10 addObject:v17];

        [v10 addObject:self->_starfield];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v18 = v10;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v25;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v25 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = [*(id *)(*((void *)&v24 + 1) + 8 * v22) atlas];
              [v23 prewarm];

              ++v22;
            }
            while (v20 != v22);
            uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v20);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v6);
  }
}

- (NSArray)albedos
{
  return self->_albedos;
}

- (void)setAlbedos:(id)a3
{
}

- (NSArray)normals
{
  return self->_normals;
}

- (void)setNormals:(id)a3
{
}

- (NSArray)emissives
{
  return self->_emissives;
}

- (void)setEmissives:(id)a3
{
}

- (NSArray)cloudsLo
{
  return self->_cloudsLo;
}

- (void)setCloudsLo:(id)a3
{
}

- (NSArray)cloudsMd
{
  return self->_cloudsMd;
}

- (void)setCloudsMd:(id)a3
{
}

- (NSArray)cloudsHi
{
  return self->_cloudsHi;
}

- (void)setCloudsHi:(id)a3
{
}

- (NSArray)gradients
{
  return self->_gradients;
}

- (void)setGradients:(id)a3
{
}

- (CLKUITexture)starfield
{
  return self->_starfield;
}

- (void)setStarfield:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starfield, 0);
  objc_storeStrong((id *)&self->_gradients, 0);
  objc_storeStrong((id *)&self->_cloudsHi, 0);
  objc_storeStrong((id *)&self->_cloudsMd, 0);
  objc_storeStrong((id *)&self->_cloudsLo, 0);
  objc_storeStrong((id *)&self->_emissives, 0);
  objc_storeStrong((id *)&self->_normals, 0);
  objc_storeStrong((id *)&self->_albedos, 0);
}

@end