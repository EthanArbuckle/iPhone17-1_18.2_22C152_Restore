@interface PKPassLiveRenderedImageSet
+ (BOOL)shouldCache;
+ (BOOL)supportsSecureCoding;
+ (id)archiveName;
+ (int64_t)imageSetType;
+ (unsigned)currentVersion;
- (BOOL)isEqual:(id)a3;
- (PKImage)ambientMaterialPropertyImage;
- (PKImage)ambientOcclusionMaterialPropertyImage;
- (PKImage)diffuseMaterialPropertyImage;
- (PKImage)displacementMaterialPropertyImage;
- (PKImage)emissionMaterialPropertyImage;
- (PKImage)metalnessMaterialPropertyImage;
- (PKImage)multiplyMaterialPropertyImage;
- (PKImage)normalMaterialPropertyImage;
- (PKImage)overlayMaterialPropertyImage;
- (PKImage)reflectiveMaterialPropertyImage;
- (PKImage)roughnessMaterialPropertyImage;
- (PKImage)selfIlluminationMaterialPropertyImage;
- (PKImage)specularMaterialPropertyImage;
- (PKImage)transparentMaterialPropertyImage;
- (PKPassLiveRenderedImageSet)initWithCoder:(id)a3;
- (PKPassLiveRenderedImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)preheatImages;
- (void)setAmbientMaterialPropertyImage:(id)a3;
- (void)setAmbientOcclusionMaterialPropertyImage:(id)a3;
- (void)setDiffuseMaterialPropertyImage:(id)a3;
- (void)setDisplacementMaterialPropertyImage:(id)a3;
- (void)setEmissionMaterialPropertyImage:(id)a3;
- (void)setMetalnessMaterialPropertyImage:(id)a3;
- (void)setMultiplyMaterialPropertyImage:(id)a3;
- (void)setNormalMaterialPropertyImage:(id)a3;
- (void)setOverlayMaterialPropertyImage:(id)a3;
- (void)setReflectiveMaterialPropertyImage:(id)a3;
- (void)setRoughnessMaterialPropertyImage:(id)a3;
- (void)setSelfIlluminationMaterialPropertyImage:(id)a3;
- (void)setSpecularMaterialPropertyImage:(id)a3;
- (void)setTransparentMaterialPropertyImage:(id)a3;
@end

@implementation PKPassLiveRenderedImageSet

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)shouldCache
{
  return 0;
}

- (PKPassLiveRenderedImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v36.receiver = self;
  v36.super_class = (Class)PKPassLiveRenderedImageSet;
  v13 = [(PKImageSet *)&v36 initWithDisplayProfile:v10 fileURL:v11 screenScale:v12 suffix:a5];
  if (v13)
  {
    context = (void *)MEMORY[0x192FDC630]();
    v14 = [MEMORY[0x1E4F28B50] bundleWithURL:v11];
    uint64_t v32 = +[PKImage imageNamed:@"diffuse" inBundle:v14 screenScale:v12 suffix:a5];
    -[PKPassLiveRenderedImageSet setDiffuseMaterialPropertyImage:](v13, "setDiffuseMaterialPropertyImage:");
    uint64_t v31 = +[PKImage imageNamed:@"ambient" inBundle:v14 screenScale:v12 suffix:a5];
    [(PKPassLiveRenderedImageSet *)v13 setAmbientMaterialPropertyImage:v31];
    uint64_t v30 = +[PKImage imageNamed:@"specular" inBundle:v14 screenScale:v12 suffix:a5];
    -[PKPassLiveRenderedImageSet setSpecularMaterialPropertyImage:](v13, "setSpecularMaterialPropertyImage:");
    uint64_t v29 = +[PKImage imageNamed:@"normal" inBundle:v14 screenScale:v12 suffix:a5];
    [(PKPassLiveRenderedImageSet *)v13 setNormalMaterialPropertyImage:v29];
    uint64_t v28 = +[PKImage imageNamed:@"reflective" inBundle:v14 screenScale:v12 suffix:a5];
    -[PKPassLiveRenderedImageSet setReflectiveMaterialPropertyImage:](v13, "setReflectiveMaterialPropertyImage:");
    uint64_t v27 = +[PKImage imageNamed:@"emission" inBundle:v14 screenScale:v12 suffix:a5];
    id v34 = v11;
    [(PKPassLiveRenderedImageSet *)v13 setEmissionMaterialPropertyImage:v27];
    uint64_t v26 = +[PKImage imageNamed:@"transparent" inBundle:v14 screenScale:v12 suffix:a5];
    [(PKPassLiveRenderedImageSet *)v13 setTransparentMaterialPropertyImage:v26];
    uint64_t v25 = +[PKImage imageNamed:@"multiply" inBundle:v14 screenScale:v12 suffix:a5];
    -[PKPassLiveRenderedImageSet setMultiplyMaterialPropertyImage:](v13, "setMultiplyMaterialPropertyImage:");
    uint64_t v15 = +[PKImage imageNamed:@"displacement" inBundle:v14 screenScale:v12 suffix:a5];
    id v35 = v10;
    [(PKPassLiveRenderedImageSet *)v13 setDisplacementMaterialPropertyImage:v15];
    uint64_t v16 = +[PKImage imageNamed:@"ambientOcclusion" inBundle:v14 screenScale:v12 suffix:a5];
    [(PKPassLiveRenderedImageSet *)v13 setAmbientOcclusionMaterialPropertyImage:v16];
    uint64_t v17 = +[PKImage imageNamed:@"selfIllumination" inBundle:v14 screenScale:v12 suffix:a5];
    [(PKPassLiveRenderedImageSet *)v13 setSelfIlluminationMaterialPropertyImage:v17];
    uint64_t v18 = +[PKImage imageNamed:@"metalness" inBundle:v14 screenScale:v12 suffix:a5];
    [(PKPassLiveRenderedImageSet *)v13 setMetalnessMaterialPropertyImage:v18];
    uint64_t v19 = +[PKImage imageNamed:@"roughness" inBundle:v14 screenScale:v12 suffix:a5];
    [(PKPassLiveRenderedImageSet *)v13 setRoughnessMaterialPropertyImage:v19];
    uint64_t v20 = +[PKImage imageNamed:@"overlay" inBundle:v14 screenScale:v12 suffix:a5];
    uint64_t v21 = v32 | v31 | v30 | v29 | v28 | v27 | v26 | v25 | v15 | v16 | v17 | v18 | v19 | v20;
    [(PKPassLiveRenderedImageSet *)v13 setOverlayMaterialPropertyImage:v20];

    id v10 = v35;
    id v11 = v34;

    if (v21) {
      v22 = v13;
    }
    else {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  return v23;
}

- (void)setTransparentMaterialPropertyImage:(id)a3
{
}

- (void)setSpecularMaterialPropertyImage:(id)a3
{
}

- (void)setSelfIlluminationMaterialPropertyImage:(id)a3
{
}

- (void)setRoughnessMaterialPropertyImage:(id)a3
{
}

- (void)setReflectiveMaterialPropertyImage:(id)a3
{
}

- (void)setOverlayMaterialPropertyImage:(id)a3
{
}

- (void)setNormalMaterialPropertyImage:(id)a3
{
}

- (void)setMultiplyMaterialPropertyImage:(id)a3
{
}

- (void)setMetalnessMaterialPropertyImage:(id)a3
{
}

- (void)setEmissionMaterialPropertyImage:(id)a3
{
}

- (void)setDisplacementMaterialPropertyImage:(id)a3
{
}

- (void)setDiffuseMaterialPropertyImage:(id)a3
{
}

- (void)setAmbientOcclusionMaterialPropertyImage:(id)a3
{
}

- (void)setAmbientMaterialPropertyImage:(id)a3
{
}

+ (unsigned)currentVersion
{
  return 3;
}

+ (id)archiveName
{
  return @"LiveRendered";
}

+ (int64_t)imageSetType
{
  return 6;
}

- (PKImage)normalMaterialPropertyImage
{
  return self->_normalMaterialPropertyImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_roughnessMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_metalnessMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_selfIlluminationMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_ambientOcclusionMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_displacementMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_multiplyMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_transparentMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_emissionMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_reflectiveMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_normalMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_specularMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_ambientMaterialPropertyImage, 0);
  objc_storeStrong((id *)&self->_diffuseMaterialPropertyImage, 0);
}

- (PKImage)overlayMaterialPropertyImage
{
  return self->_overlayMaterialPropertyImage;
}

- (PKImage)metalnessMaterialPropertyImage
{
  return self->_metalnessMaterialPropertyImage;
}

- (PKImage)diffuseMaterialPropertyImage
{
  return self->_diffuseMaterialPropertyImage;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassLiveRenderedImageSet;
  id v5 = [(PKImageSet *)&v7 encodeWithCoder:v4];
  v6 = (void *)MEMORY[0x192FDC630](v5);
  [v4 encodeObject:self->_diffuseMaterialPropertyImage forKey:@"diffuse"];
  [v4 encodeObject:self->_ambientMaterialPropertyImage forKey:@"ambient"];
  [v4 encodeObject:self->_specularMaterialPropertyImage forKey:@"specular"];
  [v4 encodeObject:self->_normalMaterialPropertyImage forKey:@"normal"];
  [v4 encodeObject:self->_reflectiveMaterialPropertyImage forKey:@"reflective"];
  [v4 encodeObject:self->_emissionMaterialPropertyImage forKey:@"emission"];
  [v4 encodeObject:self->_transparentMaterialPropertyImage forKey:@"transparent"];
  [v4 encodeObject:self->_multiplyMaterialPropertyImage forKey:@"multiply"];
  [v4 encodeObject:self->_displacementMaterialPropertyImage forKey:@"displacement"];
  [v4 encodeObject:self->_ambientOcclusionMaterialPropertyImage forKey:@"ambientOcclusion"];
  [v4 encodeObject:self->_selfIlluminationMaterialPropertyImage forKey:@"selfIllumination"];
  [v4 encodeObject:self->_metalnessMaterialPropertyImage forKey:@"metalness"];
  [v4 encodeObject:self->_roughnessMaterialPropertyImage forKey:@"roughness"];
  [v4 encodeObject:self->_overlayMaterialPropertyImage forKey:@"overlay"];
}

- (PKPassLiveRenderedImageSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKPassLiveRenderedImageSet;
  id v5 = [(PKImageSet *)&v36 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x192FDC630]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"diffuse"];
    diffuseMaterialPropertyImage = v5->_diffuseMaterialPropertyImage;
    v5->_diffuseMaterialPropertyImage = (PKImage *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ambient"];
    ambientMaterialPropertyImage = v5->_ambientMaterialPropertyImage;
    v5->_ambientMaterialPropertyImage = (PKImage *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"specular"];
    specularMaterialPropertyImage = v5->_specularMaterialPropertyImage;
    v5->_specularMaterialPropertyImage = (PKImage *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"normal"];
    normalMaterialPropertyImage = v5->_normalMaterialPropertyImage;
    v5->_normalMaterialPropertyImage = (PKImage *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reflective"];
    reflectiveMaterialPropertyImage = v5->_reflectiveMaterialPropertyImage;
    v5->_reflectiveMaterialPropertyImage = (PKImage *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"emission"];
    emissionMaterialPropertyImage = v5->_emissionMaterialPropertyImage;
    v5->_emissionMaterialPropertyImage = (PKImage *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transparent"];
    transparentMaterialPropertyImage = v5->_transparentMaterialPropertyImage;
    v5->_transparentMaterialPropertyImage = (PKImage *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"multiply"];
    multiplyMaterialPropertyImage = v5->_multiplyMaterialPropertyImage;
    v5->_multiplyMaterialPropertyImage = (PKImage *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displacement"];
    displacementMaterialPropertyImage = v5->_displacementMaterialPropertyImage;
    v5->_displacementMaterialPropertyImage = (PKImage *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ambientOcclusion"];
    ambientOcclusionMaterialPropertyImage = v5->_ambientOcclusionMaterialPropertyImage;
    v5->_ambientOcclusionMaterialPropertyImage = (PKImage *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selfIllumination"];
    selfIlluminationMaterialPropertyImage = v5->_selfIlluminationMaterialPropertyImage;
    v5->_selfIlluminationMaterialPropertyImage = (PKImage *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metalness"];
    metalnessMaterialPropertyImage = v5->_metalnessMaterialPropertyImage;
    v5->_metalnessMaterialPropertyImage = (PKImage *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"roughness"];
    roughnessMaterialPropertyImage = v5->_roughnessMaterialPropertyImage;
    v5->_roughnessMaterialPropertyImage = (PKImage *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"overlay"];
    overlayMaterialPropertyImage = v5->_overlayMaterialPropertyImage;
    v5->_overlayMaterialPropertyImage = (PKImage *)v33;
  }

  return v5;
}

- (void)preheatImages
{
  [(PKImage *)self->_diffuseMaterialPropertyImage preheatBitmapData];
  [(PKImage *)self->_ambientMaterialPropertyImage preheatBitmapData];
  [(PKImage *)self->_specularMaterialPropertyImage preheatBitmapData];
  [(PKImage *)self->_normalMaterialPropertyImage preheatBitmapData];
  [(PKImage *)self->_reflectiveMaterialPropertyImage preheatBitmapData];
  [(PKImage *)self->_emissionMaterialPropertyImage preheatBitmapData];
  [(PKImage *)self->_transparentMaterialPropertyImage preheatBitmapData];
  [(PKImage *)self->_multiplyMaterialPropertyImage preheatBitmapData];
  [(PKImage *)self->_displacementMaterialPropertyImage preheatBitmapData];
  [(PKImage *)self->_ambientOcclusionMaterialPropertyImage preheatBitmapData];
  [(PKImage *)self->_selfIlluminationMaterialPropertyImage preheatBitmapData];
  [(PKImage *)self->_metalnessMaterialPropertyImage preheatBitmapData];
  [(PKImage *)self->_roughnessMaterialPropertyImage preheatBitmapData];
  overlayMaterialPropertyImage = self->_overlayMaterialPropertyImage;
  [(PKImage *)overlayMaterialPropertyImage preheatBitmapData];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    BOOL v6 = [(PKImageSet *)self _isSetImage:self->_diffuseMaterialPropertyImage equalToImage:v5[3]]&& [(PKImageSet *)self _isSetImage:self->_ambientMaterialPropertyImage equalToImage:v5[4]]&& [(PKImageSet *)self _isSetImage:self->_specularMaterialPropertyImage equalToImage:v5[5]]&& [(PKImageSet *)self _isSetImage:self->_normalMaterialPropertyImage equalToImage:v5[6]]
      && [(PKImageSet *)self _isSetImage:self->_reflectiveMaterialPropertyImage equalToImage:v5[7]]&& [(PKImageSet *)self _isSetImage:self->_emissionMaterialPropertyImage equalToImage:v5[8]]&& [(PKImageSet *)self _isSetImage:self->_transparentMaterialPropertyImage equalToImage:v5[9]]&& [(PKImageSet *)self _isSetImage:self->_multiplyMaterialPropertyImage equalToImage:v5[10]]
      && [(PKImageSet *)self _isSetImage:self->_displacementMaterialPropertyImage equalToImage:v5[11]]&& [(PKImageSet *)self _isSetImage:self->_ambientOcclusionMaterialPropertyImage equalToImage:v5[12]]&& [(PKImageSet *)self _isSetImage:self->_selfIlluminationMaterialPropertyImage equalToImage:v5[13]]&& [(PKImageSet *)self _isSetImage:self->_metalnessMaterialPropertyImage equalToImage:v5[14]]
      && [(PKImageSet *)self _isSetImage:self->_roughnessMaterialPropertyImage equalToImage:v5[15]]&& [(PKImageSet *)self _isSetImage:self->_overlayMaterialPropertyImage equalToImage:v5[16]];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v31 = [(PKImage *)self->_diffuseMaterialPropertyImage imageHash];
  uint64_t v3 = [v31 hash];
  uint64_t v30 = [(PKImage *)self->_ambientMaterialPropertyImage imageHash];
  uint64_t v4 = [v30 hash] + v3;
  uint64_t v29 = [(PKImage *)self->_specularMaterialPropertyImage imageHash];
  uint64_t v5 = [v29 hash];
  uint64_t v28 = [(PKImage *)self->_normalMaterialPropertyImage imageHash];
  uint64_t v6 = v4 + v5 + [v28 hash];
  uint64_t v27 = [(PKImage *)self->_reflectiveMaterialPropertyImage imageHash];
  uint64_t v7 = [v27 hash];
  uint64_t v26 = [(PKImage *)self->_emissionMaterialPropertyImage imageHash];
  uint64_t v8 = v7 + [v26 hash];
  uint64_t v25 = [(PKImage *)self->_transparentMaterialPropertyImage imageHash];
  uint64_t v9 = v6 + v8 + [v25 hash];
  v24 = [(PKImage *)self->_multiplyMaterialPropertyImage imageHash];
  uint64_t v10 = [v24 hash];
  uint64_t v11 = [(PKImage *)self->_displacementMaterialPropertyImage imageHash];
  uint64_t v12 = v10 + [v11 hash];
  uint64_t v13 = [(PKImage *)self->_ambientOcclusionMaterialPropertyImage imageHash];
  uint64_t v14 = v12 + [v13 hash];
  uint64_t v15 = [(PKImage *)self->_selfIlluminationMaterialPropertyImage imageHash];
  uint64_t v16 = v9 + v14 + [v15 hash];
  uint64_t v17 = [(PKImage *)self->_metalnessMaterialPropertyImage imageHash];
  uint64_t v18 = [v17 hash];
  uint64_t v19 = [(PKImage *)self->_roughnessMaterialPropertyImage imageHash];
  uint64_t v20 = v18 + [v19 hash];
  uint64_t v21 = [(PKImage *)self->_overlayMaterialPropertyImage imageHash];
  unint64_t v22 = v16 + v20 + [v21 hash];

  return v22;
}

- (PKImage)ambientMaterialPropertyImage
{
  return self->_ambientMaterialPropertyImage;
}

- (PKImage)specularMaterialPropertyImage
{
  return self->_specularMaterialPropertyImage;
}

- (PKImage)reflectiveMaterialPropertyImage
{
  return self->_reflectiveMaterialPropertyImage;
}

- (PKImage)emissionMaterialPropertyImage
{
  return self->_emissionMaterialPropertyImage;
}

- (PKImage)transparentMaterialPropertyImage
{
  return self->_transparentMaterialPropertyImage;
}

- (PKImage)multiplyMaterialPropertyImage
{
  return self->_multiplyMaterialPropertyImage;
}

- (PKImage)displacementMaterialPropertyImage
{
  return self->_displacementMaterialPropertyImage;
}

- (PKImage)ambientOcclusionMaterialPropertyImage
{
  return self->_ambientOcclusionMaterialPropertyImage;
}

- (PKImage)selfIlluminationMaterialPropertyImage
{
  return self->_selfIlluminationMaterialPropertyImage;
}

- (PKImage)roughnessMaterialPropertyImage
{
  return self->_roughnessMaterialPropertyImage;
}

@end