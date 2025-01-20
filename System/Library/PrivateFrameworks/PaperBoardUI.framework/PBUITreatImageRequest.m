@interface PBUITreatImageRequest
+ (BOOL)supportsSecureCoding;
+ (NSSet)secureCodableTreatmentClasses;
- (BOOL)configureState:(PBUIRenderState *)a3 error:(id *)a4;
- (BOOL)usesCoreImageForTreatment:(id)a3;
- (CGImage)image;
- (CGSize)imagePixelSize;
- (CGSize)requestedOutputSizeInPixels;
- (CGSize)requestedOutputSizeInPointsAtScale:(double)a3;
- (NSString)description;
- (NSString)identifier;
- (PBUIImageTreatment)treatment;
- (PBUITreatImageRequest)initWithCoder:(id)a3;
- (PBUITreatImageRequest)initWithImage:(CGImage *)a3 scale:(double)a4 downscaleFactor:(double)a5 treatment:(id)a6;
- (PBUITreatImageRequest)initWithImage:(id)a3 downscaleFactor:(double)a4 treatment:(id)a5;
- (double)downscaleFactor;
- (double)scale;
- (id)CIImage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)treatmentOptions;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)setDownscaleFactor:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(CGImage *)a3;
- (void)setScale:(double)a3;
- (void)setTreatment:(id)a3;
@end

@implementation PBUITreatImageRequest

+ (NSSet)secureCodableTreatmentClasses
{
  if (secureCodableTreatmentClasses_onceToken != -1) {
    dispatch_once(&secureCodableTreatmentClasses_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)secureCodableTreatmentClasses_result;
  return (NSSet *)v2;
}

void __54__PBUITreatImageRequest_secureCodableTreatmentClasses__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v3 = (void *)secureCodableTreatmentClasses_result;
  secureCodableTreatmentClasses_result = v2;
}

- (PBUITreatImageRequest)initWithImage:(CGImage *)a3 scale:(double)a4 downscaleFactor:(double)a5 treatment:(id)a6
{
  id v11 = a6;
  v12 = [(PBUITreatImageRequest *)self init];
  if (v12)
  {
    v12->_image = CGImageRetain(a3);
    v12->_scale = a4;
    v12->_downscaleFactor = a5;
    objc_storeStrong((id *)&v12->_treatment, a6);
    v13 = NSString;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    uint64_t v16 = [v13 stringWithFormat:@"TreatImage(%@)", v15];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v16;
  }
  return v12;
}

- (PBUITreatImageRequest)initWithImage:(id)a3 downscaleFactor:(double)a4 treatment:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = [(PBUITreatImageRequest *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_codableImage, a3);
    [v9 scale];
    v12->_scale = v13;
    v12->_image = CGImageRetain((CGImageRef)[v9 CGImage]);
    v12->_downscaleFactor = a4;
    objc_storeStrong((id *)&v12->_treatment, a5);
    v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    uint64_t v17 = [v14 stringWithFormat:@"TreatImage(%@)", v16];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v17;
  }
  return v12;
}

- (void)setImage:(CGImage *)a3
{
  self->_image = CGImageRetain(a3);
}

- (void)setIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (NSString *)[a3 copy];
    identifier = self->_identifier;
    self->_identifier = v4;
  }
  else
  {
    uint64_t v6 = NSString;
    uint64_t v7 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v7);
    v8 = [v6 stringWithFormat:@"TreatImage(%@)", v10];
    id v9 = self->_identifier;
    self->_identifier = v8;

    identifier = (NSString *)v10;
  }
  MEMORY[0x1F41817F8](v4, identifier);
}

- (void)dealloc
{
  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)PBUITreatImageRequest;
  [(PBUITreatImageRequest *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  codableImage = self->_codableImage;
  uint64_t v6 = +[PBUITreatImageRequest allocWithZone:](PBUITreatImageRequest, "allocWithZone:");
  if (codableImage)
  {
    uint64_t v7 = self->_codableImage;
    double downscaleFactor = self->_downscaleFactor;
    id v9 = (void *)[(PBUIImageTreatment *)self->_treatment copyWithZone:a3];
    uint64_t v10 = [(PBUITreatImageRequest *)v6 initWithImage:v7 downscaleFactor:v9 treatment:downscaleFactor];
  }
  else
  {
    image = self->_image;
    double scale = self->_scale;
    double v13 = self->_downscaleFactor;
    id v9 = (void *)[(PBUIImageTreatment *)self->_treatment copyWithZone:a3];
    uint64_t v10 = [(PBUITreatImageRequest *)v6 initWithImage:image scale:v9 downscaleFactor:scale treatment:v13];
  }
  v14 = (void *)v10;

  return v14;
}

- (id)treatmentOptions
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [(PBUIImageTreatment *)self->_treatment canInterpolateToLowerScales])
  {
    objc_super v3 = [PBUIImageTreatmentOptions alloc];
    if (v3)
    {
      double scale = self->_scale;
      objc_super v3 = [(PBUIImageTreatmentOptions *)v3 init];
      if (v3)
      {
        double v5 = 1.0;
LABEL_8:
        v3->_originalScale = scale;
        v3->_reducedScale = v5;
      }
    }
  }
  else
  {
    objc_super v3 = [PBUIImageTreatmentOptions alloc];
    if (v3)
    {
      double scale = self->_scale;
      objc_super v3 = [(PBUIImageTreatmentOptions *)v3 init];
      double v5 = scale;
      if (v3) {
        goto LABEL_8;
      }
    }
  }
  return v3;
}

- (CGSize)requestedOutputSizeInPointsAtScale:(double)a3
{
  [(PBUITreatImageRequest *)self requestedOutputSizeInPixels];
  double v5 = v4 * a3;
  double v7 = v6 * a3;
  result.height = v7;
  result.width = v5;
  return result;
}

- (CGSize)requestedOutputSizeInPixels
{
  [(PBUITreatImageRequest *)self imagePixelSize];
  double downscaleFactor = self->_downscaleFactor;
  double v5 = v4 / downscaleFactor;
  double v7 = v6 / downscaleFactor;
  result.height = v7;
  result.width = v5;
  return result;
}

- (CGSize)imagePixelSize
{
  double Width = (double)CGImageGetWidth(self->_image);
  double Height = (double)CGImageGetHeight(self->_image);
  double v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (BOOL)usesCoreImageForTreatment:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)CIImage
{
  image = self->_image;
  if (image)
  {
    double v4 = [MEMORY[0x1E4F1E050] imageWithCGImage:image options:0];
    memset(&v8, 0, sizeof(v8));
    CGAffineTransformMakeScale(&v8, 1.0 / self->_downscaleFactor, 1.0 / self->_downscaleFactor);
    CGAffineTransform v7 = v8;
    double v5 = [v4 imageByApplyingTransform:&v7];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (BOOL)configureState:(PBUIRenderState *)a3 error:(id *)a4
{
  CGAffineTransform v7 = +[PBUIImageContainerLayer layer];
  id v8 = [MEMORY[0x1E4F428B8] magentaColor];
  objc_msgSend(v7, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

  [v7 setDelegate:self];
  id v9 = [(PBUITreatImageRequest *)self treatmentOptions];
  uint64_t v10 = [v7 imageLayer];
  [v10 setContents:self->_image];

  [v7 setNeedsLayout];
  BOOL v11 = [(PBUITreatImageRequest *)self usesCoreImageForTreatment:self->_treatment];
  if (v11)
  {
    v12 = [(PBUITreatImageRequest *)self CIImage];
    treatment = self->_treatment;
    id v31 = 0;
    v14 = [(PBUIImageTreatment *)treatment applyToImage:v12 options:v9 error:&v31];
    id v15 = v31;
  }
  else
  {
    v14 = 0;
    id v15 = 0;
  }
  uint64_t v16 = self->_treatment;
  id v30 = 0;
  char v17 = [(PBUIImageTreatment *)v16 commitToRenderingTree:v7 options:v9 error:&v30];
  id v18 = v30;
  v19 = v18;
  char v20 = !v11;
  if (v14) {
    char v20 = 1;
  }
  char v21 = v11 & v20 | v17;
  if (v21)
  {
    [(PBUITreatImageRequest *)self requestedOutputSizeInPixels];
    *(void *)&long long v26 = v22;
    *((void *)&v26 + 1) = v23;
    [v9 reducedScale];
    uint64_t v27 = v24;
    id v28 = v7;
    id v29 = v14;
    __copy_assignment_8_8_t0w24_s24_s32((uint64_t)a3, &v26);
  }
  else if (a4)
  {
    if (v15) {
      id v18 = v15;
    }
    *a4 = v18;
  }

  return v21;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v5 = a3;
  objc_super v3 = [v5 superlayer];
  double v4 = v3;
  if (v3)
  {
    [v3 bounds];
    objc_msgSend(v5, "setFrame:");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PBUITreatImageRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PBUITreatImageRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    [v4 decodeDoubleForKey:@"DownscaleFactor"];
    v5->_double downscaleFactor = v8;
    id v9 = [(id)objc_opt_class() secureCodableTreatmentClasses];
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"Treatment"];
    treatment = v5->_treatment;
    v5->_treatment = (PBUIImageTreatment *)v10;

    if (!v5->_treatment
      || ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"Image"],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          codableImage = v5->_codableImage,
          v5->_codableImage = (PBUICodableImage *)v12,
          codableImage,
          (v14 = v5->_codableImage) == 0))
    {
      uint64_t v16 = 0;
      goto LABEL_7;
    }
    [(PBUICodableImage *)v14 scale];
    v5->_double scale = v15;
    v5->_image = CGImageRetain([(PBUICodableImage *)v5->_codableImage CGImage]);
  }
  uint64_t v16 = v5;
LABEL_7:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  codableImage = self->_codableImage;
  id v8 = v4;
  if (!codableImage)
  {
    uint64_t v6 = [[PBUICodableImage alloc] initWithCGImage:self->_image scale:0 error:self->_scale];
    CGAffineTransform v7 = self->_codableImage;
    self->_codableImage = v6;

    id v4 = v8;
    codableImage = self->_codableImage;
  }
  [v4 encodeObject:codableImage forKey:@"Image"];
  [v8 encodeObject:self->_treatment forKey:@"Treatment"];
  [v8 encodeDouble:@"DownscaleFactor" forKey:self->_downscaleFactor];
  [v8 encodeObject:self->_identifier forKey:@"Identifier"];
}

- (NSString)description
{
  return (NSString *)[(PBUITreatImageRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(PBUITreatImageRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = [(PBUITreatImageRequest *)self identifier];
  [v4 appendString:v5 withName:@"identifier"];

  id v6 = (id)objc_msgSend(v4, "appendObject:withName:", -[PBUITreatImageRequest image](self, "image"), @"image");
  [(PBUITreatImageRequest *)self scale];
  id v7 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", @"scale", 3);
  [(PBUITreatImageRequest *)self downscaleFactor];
  id v8 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", @"downscaleFactor", 3);
  id v9 = [(PBUITreatImageRequest *)self treatment];
  id v10 = (id)[v4 appendObject:v9 withName:@"treatment"];

  return v4;
}

- (id)succinctDescription
{
  uint64_t v2 = [(PBUITreatImageRequest *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (CGImage)image
{
  return self->_image;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

- (double)downscaleFactor
{
  return self->_downscaleFactor;
}

- (void)setDownscaleFactor:(double)a3
{
  self->_double downscaleFactor = a3;
}

- (PBUIImageTreatment)treatment
{
  return self->_treatment;
}

- (void)setTreatment:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_codableImage, 0);
}

@end