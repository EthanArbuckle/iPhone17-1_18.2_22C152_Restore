@interface VIExtractAnnotationFromDocument
@end

@implementation VIExtractAnnotationFromDocument

VITextAnnotation *___VIExtractAnnotationFromDocument_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [VITextAnnotation alloc];
  v4 = [v2 getTranscript];
  [v2 boundingBox];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v2 confidence];
  int v14 = v13;

  LODWORD(v15) = v14;
  v16 = -[VITextAnnotation initWithText:normalizedBoundingBox:confidence:](v3, "initWithText:normalizedBoundingBox:confidence:", v4, v6, v8, v10, v12, v15);

  return v16;
}

@end