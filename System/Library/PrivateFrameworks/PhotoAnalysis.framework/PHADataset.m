@interface PHADataset
- (NSArray)labeledDataSamples;
- (NSString)inputName;
- (NSString)labelName;
- (PHADataset)initWithLabeledFeatureVectors:(id)a3 inputName:(id)a4 labelName:(id)a5;
- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4;
- (unint64_t)numberOfDataPoints;
@end

@implementation PHADataset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);

  objc_storeStrong((id *)&self->_labeledDataSamples, 0);
}

- (NSString)labelName
{
  return self->_labelName;
}

- (NSString)inputName
{
  return self->_inputName;
}

- (NSArray)labeledDataSamples
{
  return self->_labeledDataSamples;
}

- (unint64_t)numberOfDataPoints
{
  v2 = [(PHADataset *)self labeledDataSamples];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  if ([(PHADataset *)self numberOfDataPoints] > a3)
  {
    v7 = [(PHADataset *)self labeledDataSamples];
    v8 = [v7 objectAtIndexedSubscript:a3];
    v9 = [v8 floatVector];

    id v10 = objc_alloc(MEMORY[0x1E4F611A0]);
    id v11 = [v9 data];
    uint64_t v12 = [v11 bytes];
    v33[0] = &unk_1F291A5A0;
    v33[1] = &unk_1F291A5A0;
    v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "count"));
    v33[2] = v13;
    v33[3] = &unk_1F291A5A0;
    v33[4] = &unk_1F291A5A0;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:5];
    v15 = (void *)[v10 initWithData:v12 type:2 shape:v14 strides:&unk_1F291AC90];

    v16 = [(PHADataset *)self labeledDataSamples];
    v17 = [v16 objectAtIndexedSubscript:a3];
    v18 = [v17 label];

    id v19 = objc_alloc(MEMORY[0x1E4F611A0]);
    id v20 = [v18 data];
    uint64_t v21 = [v20 bytes];
    v32[0] = &unk_1F291A5A0;
    v32[1] = &unk_1F291A5A0;
    v22 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v18, "count"));
    v32[2] = v22;
    v32[3] = &unk_1F291A5A0;
    v32[4] = &unk_1F291A5A0;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:5];
    v24 = (void *)[v19 initWithData:v21 type:2 shape:v23 strides:&unk_1F291ACA8];

    v25 = [(PHADataset *)self inputName];
    v30[0] = v25;
    v31[0] = v15;
    v26 = [(PHADataset *)self labelName];
    v30[1] = v26;
    v31[1] = v24;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

LABEL_5:
    goto LABEL_6;
  }
  if (a4)
  {
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"Index (%lu) is larger than total number of data points (%lu).", a3, -[PHADataset numberOfDataPoints](self, "numberOfDataPoints"));
    v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v35[0] = v9;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    *a4 = [v28 errorWithDomain:@"com.apple.PhotoAnalysis.PHADataset" code:0 userInfo:v15];
    v27 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_5;
  }
  v27 = (void *)MEMORY[0x1E4F1CC08];
LABEL_6:

  return v27;
}

- (PHADataset)initWithLabeledFeatureVectors:(id)a3 inputName:(id)a4 labelName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHADataset;
  uint64_t v12 = [(PHADataset *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_labeledDataSamples, a3);
    objc_storeStrong((id *)&v13->_inputName, a4);
    objc_storeStrong((id *)&v13->_labelName, a5);
  }

  return v13;
}

@end