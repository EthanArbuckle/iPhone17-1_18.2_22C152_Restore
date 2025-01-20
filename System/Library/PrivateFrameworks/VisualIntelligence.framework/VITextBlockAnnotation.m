@interface VITextBlockAnnotation
+ (id)empty;
+ (id)textBlockWithAnnotations:(id)a3;
+ (id)textBlockWithDocumentObservations:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)textAnnotations;
- (NSString)description;
- (VITextBlockAnnotation)initWithTextAnnotations:(id)a3;
- (unint64_t)hash;
@end

@implementation VITextBlockAnnotation

- (VITextBlockAnnotation)initWithTextAnnotations:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VITextBlockAnnotation;
  v5 = [(VITextBlockAnnotation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    textAnnotations = v5->_textAnnotations;
    v5->_textAnnotations = (NSArray *)v6;
  }
  return v5;
}

+ (id)empty
{
  v2 = [VITextBlockAnnotation alloc];
  v3 = [(VITextBlockAnnotation *)v2 initWithTextAnnotations:MEMORY[0x1E4F1CBF0]];
  return v3;
}

+ (id)textBlockWithAnnotations:(id)a3
{
  id v3 = a3;
  id v4 = [[VITextBlockAnnotation alloc] initWithTextAnnotations:v3];

  return v4;
}

+ (id)textBlockWithDocumentObservations:(id)a3
{
  id v3 = (void *)VIFlatMapArray(a3, &__block_literal_global_4);
  id v4 = [[VITextBlockAnnotation alloc] initWithTextAnnotations:v3];

  return v4;
}

id __59__VITextBlockAnnotation_textBlockWithDocumentObservations___block_invoke(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "blocksWithTypes:inRegion:", 8, *MEMORY[0x1E4F45CB8], *(double *)(MEMORY[0x1E4F45CB8] + 8), *(double *)(MEMORY[0x1E4F45CB8] + 16), *(double *)(MEMORY[0x1E4F45CB8] + 24));
  id v3 = (void *)VICompactMapArray(v2, &__block_literal_global_57);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v15 = v5;
  uint64_t v16 = v3;
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  textAnnotations = self->_textAnnotations;
  v13 = objc_msgSend(v11, "textAnnotations", v6, v15, v4, v16, v7, v8);
  LOBYTE(textAnnotations) = VIObjectIsEqual((unint64_t)textAnnotations, (uint64_t)v13);

  return (char)textAnnotations;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_textAnnotations hash];
}

- (NSArray)textAnnotations
{
  return self->_textAnnotations;
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  return (NSString *)sub_1DCF16018(self, (uint64_t)a2, (void (*)(void))VITextBlockAnnotation.description.getter);
}

@end