@interface CRFormContentTypeModelInput
- (CRFormContentTypeModelInput)initWithFieldArray:(id)a3 labelArray:(id)a4 fieldCount:(unint64_t)a5 labelCount:(unint64_t)a6 useFloatOnly:(BOOL)a7;
- (MLMultiArray)fields;
- (MLMultiArray)labels;
- (MLMultiArray)length;
- (MLMultiArray)num_labels;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setFields:(id)a3;
- (void)setLabels:(id)a3;
- (void)setLength:(id)a3;
- (void)setNum_labels:(id)a3;
@end

@implementation CRFormContentTypeModelInput

- (CRFormContentTypeModelInput)initWithFieldArray:(id)a3 labelArray:(id)a4 fieldCount:(unint64_t)a5 labelCount:(unint64_t)a6 useFloatOnly:(BOOL)a7
{
  BOOL v7 = a7;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CRFormContentTypeModelInput;
  v15 = [(CRFormContentTypeModelInput *)&v37 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fields, a3);
    objc_storeStrong((id *)&v16->_labels, a4);
    id v17 = objc_alloc(MEMORY[0x1E4F1E9A8]);
    uint64_t v18 = [NSNumber numberWithUnsignedInteger:a5];
    v19 = (void *)v18;
    if (v7)
    {
      v41[0] = v18;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
      uint64_t v21 = [v17 initWithScalars:v20 shape:&unk_1F3935C50 dataType:65568];
      length = v16->_length;
      v16->_length = (MLMultiArray *)v21;

      id v23 = objc_alloc(MEMORY[0x1E4F1E9A8]);
      v24 = [NSNumber numberWithUnsignedInteger:a6];
      v40 = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
      v26 = &unk_1F3935C68;
      v27 = v23;
      v28 = v25;
      uint64_t v29 = 65568;
    }
    else
    {
      uint64_t v39 = v18;
      v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
      uint64_t v31 = [v17 initWithScalars:v30 shape:&unk_1F3935C80 dataType:131104];
      v32 = v16->_length;
      v16->_length = (MLMultiArray *)v31;

      id v33 = objc_alloc(MEMORY[0x1E4F1E9A8]);
      v24 = [NSNumber numberWithUnsignedInteger:a6];
      v38 = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
      v26 = &unk_1F3935C98;
      v27 = v33;
      v28 = v25;
      uint64_t v29 = 131104;
    }
    uint64_t v34 = [v27 initWithScalars:v28 shape:v26 dataType:v29];
    num_labels = v16->_num_labels;
    v16->_num_labels = (MLMultiArray *)v34;
  }
  return v16;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3935CB0];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"fields"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(CRFormContentTypeModelInput *)self fields];
LABEL_9:
    BOOL v7 = (void *)v6;
    v8 = [v5 featureValueWithMultiArray:v6];

    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"labels"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(CRFormContentTypeModelInput *)self labels];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"length"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(CRFormContentTypeModelInput *)self length];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"num_labels"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(CRFormContentTypeModelInput *)self num_labels];
    goto LABEL_9;
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (MLMultiArray)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
}

- (MLMultiArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
}

- (MLMultiArray)length
{
  return self->_length;
}

- (void)setLength:(id)a3
{
}

- (MLMultiArray)num_labels
{
  return self->_num_labels;
}

- (void)setNum_labels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_num_labels, 0);
  objc_storeStrong((id *)&self->_length, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_fields, 0);
}

@end