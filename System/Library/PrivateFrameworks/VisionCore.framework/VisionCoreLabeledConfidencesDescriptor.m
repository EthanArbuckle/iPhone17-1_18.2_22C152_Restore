@interface VisionCoreLabeledConfidencesDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (Class)labelsFileParserClass;
- (NSArray)labels;
- (NSArray)sortedValidLabels;
- (NSIndexSet)validLabelIndexes;
- (NSURL)labelsFileURL;
- (VisionCoreLabeledConfidencesDescriptor)initWithCoder:(id)a3;
- (VisionCoreLabeledConfidencesDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 shape:(id)a5 strides:(id)a6 labelsFileURL:(id)a7;
- (id)description;
- (unint64_t)hash;
- (unint64_t)validLabelsCount;
- (void)_parseLabelsFileWhenSynchronizedIfNecessary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreLabeledConfidencesDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazilyAcquiredValidLabelIndexs, 0);
  objc_storeStrong((id *)&self->_lazilyAcquiredLabels, 0);
  objc_storeStrong((id *)&self->_labelsFileURL, 0);
}

- (NSURL)labelsFileURL
{
  return self->_labelsFileURL;
}

- (VisionCoreLabeledConfidencesDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VisionCoreLabeledConfidencesDescriptor;
  v5 = [(VisionCoreTensorDescriptor *)&v10 initWithCoder:v4];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"labelsURL"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        labelsFileURL = v5->_labelsFileURL,
        v5->_labelsFileURL = (NSURL *)v6,
        labelsFileURL,
        !v5->_labelsFileURL))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VisionCoreLabeledConfidencesDescriptor;
  id v4 = a3;
  [(VisionCoreTensorDescriptor *)&v6 encodeWithCoder:v4];
  v5 = [(VisionCoreLabeledConfidencesDescriptor *)self labelsFileURL];
  [v4 encodeObject:v5 forKey:@"labelsURL"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VisionCoreLabeledConfidencesDescriptor *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      objc_super v6 = [(VisionCoreLabeledConfidencesDescriptor *)self labelsFileURL];
      v7 = [(VisionCoreLabeledConfidencesDescriptor *)v5 labelsFileURL];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)VisionCoreLabeledConfidencesDescriptor;
  unint64_t v3 = [(VisionCoreTensorDescriptor *)&v7 hash];
  id v4 = [(VisionCoreLabeledConfidencesDescriptor *)self labelsFileURL];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)VisionCoreLabeledConfidencesDescriptor;
  unint64_t v3 = [(VisionCoreTensorDescriptor *)&v8 description];
  id v4 = [(VisionCoreLabeledConfidencesDescriptor *)self labelsFileURL];
  unint64_t v5 = [v4 lastPathComponent];
  objc_super v6 = [v3 stringByAppendingFormat:@" %@", v5];

  return v6;
}

- (NSArray)sortedValidLabels
{
  unint64_t v3 = [(VisionCoreLabeledConfidencesDescriptor *)self labels];
  id v4 = [(VisionCoreLabeledConfidencesDescriptor *)self validLabelIndexes];
  unint64_t v5 = [v3 objectsAtIndexes:v4];

  objc_super v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  return (NSArray *)v6;
}

- (NSIndexSet)validLabelIndexes
{
  v2 = self;
  objc_sync_enter(v2);
  -[VisionCoreLabeledConfidencesDescriptor _parseLabelsFileWhenSynchronizedIfNecessary](v2);
  unint64_t v3 = v2->_lazilyAcquiredValidLabelIndexs;
  objc_sync_exit(v2);

  return v3;
}

- (void)_parseLabelsFileWhenSynchronizedIfNecessary
{
  if (a1 && !a1[7])
  {
    v2 = [a1 labelsFileURL];
    unint64_t v3 = (void *)[a1 labelsFileParserClass];
    id v32 = 0;
    id v4 = [MEMORY[0x263EFF9D0] null];
    id v30 = 0;
    id v31 = 0;
    int v5 = [v3 parseLabels:&v32 fromContentsOfURL:v2 invalidLabelPlaceholderObject:v4 validLabelIndexes:&v31 error:&v30];
    id v6 = v32;
    id v7 = v31;
    id v8 = v30;

    if (v5)
    {
      v9 = [a1 shape];
      uint64_t v10 = [v9 elementCount];

      if (v10 == [v6 count])
      {
LABEL_8:
        uint64_t v25 = [v6 copy];
        v26 = (void *)a1[7];
        a1[7] = v25;

        uint64_t v27 = [v7 copy];
        v28 = (void *)a1[8];
        a1[8] = v27;

        return;
      }
      VisionCoreValidatedLog(4, @"%@ does not have the expected total label count of %lu", v11, v12, v13, v14, v15, v16, (uint64_t)v2);
    }
    else
    {
      v29 = [v8 localizedDescription];
      VisionCoreValidatedLog(4, @"Could not obtain labels from %@ - %@", v17, v18, v19, v20, v21, v22, (uint64_t)v2);
    }
    id v23 = objc_alloc_init(MEMORY[0x263EFF8C0]);

    id v24 = objc_alloc_init(MEMORY[0x263F088D0]);
    id v7 = v24;
    id v6 = v23;
    goto LABEL_8;
  }
}

- (unint64_t)validLabelsCount
{
  v2 = self;
  objc_sync_enter(v2);
  -[VisionCoreLabeledConfidencesDescriptor _parseLabelsFileWhenSynchronizedIfNecessary](v2);
  unint64_t v3 = [(NSIndexSet *)v2->_lazilyAcquiredValidLabelIndexs count];
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)labels
{
  v2 = self;
  objc_sync_enter(v2);
  -[VisionCoreLabeledConfidencesDescriptor _parseLabelsFileWhenSynchronizedIfNecessary](v2);
  unint64_t v3 = v2->_lazilyAcquiredLabels;
  objc_sync_exit(v2);

  return v3;
}

- (Class)labelsFileParserClass
{
  return (Class)objc_opt_class();
}

- (VisionCoreLabeledConfidencesDescriptor)initWithName:(id)a3 dataType:(unint64_t)a4 shape:(id)a5 strides:(id)a6 labelsFileURL:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)VisionCoreLabeledConfidencesDescriptor;
  uint64_t v14 = [(VisionCoreTensorDescriptor *)&v17 initWithName:a3 dataType:a4 shape:a5 strides:a6];
  uint64_t v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_labelsFileURL, a7);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end