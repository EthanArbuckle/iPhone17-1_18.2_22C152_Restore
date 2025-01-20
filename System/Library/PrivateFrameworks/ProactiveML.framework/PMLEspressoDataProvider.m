@interface PMLEspressoDataProvider
- (PMLEspressoDataProvider)initWithRowsData:(id)a3 labelsData:(id)a4 inputName:(id)a5 inputDim:(unint64_t)a6 trueLabelName:(id)a7;
- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4;
- (unint64_t)numberOfDataPoints;
- (void)clearBuffers;
@end

@implementation PMLEspressoDataProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trueLabelBuffer, 0);
  objc_storeStrong((id *)&self->_inputBuffer, 0);
  objc_storeStrong((id *)&self->_trueLabelName, 0);
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_labelsData, 0);
  objc_storeStrong((id *)&self->_rowsData, 0);
}

- (unint64_t)numberOfDataPoints
{
  return self->_numberOfDataPoints;
}

- (id)dataPointAtIndex:(unint64_t)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (self->_numberOfDataPoints <= a3)
  {
    v26 = PML_LogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      unint64_t numberOfDataPoints = self->_numberOfDataPoints;
      *(_DWORD *)buf = 134218240;
      unint64_t v35 = a3;
      __int16 v36 = 2048;
      unint64_t v37 = numberOfDataPoints;
      _os_log_error_impl(&dword_2212A0000, v26, OS_LOG_TYPE_ERROR, "Out of range index %lu requested from PMLEspressoDataProvider of size %lu", buf, 0x16u);
    }

    v14 = (void *)MEMORY[0x263EFFA78];
  }
  else
  {
    [(PMLEspressoDataProvider *)self clearBuffers];
    *(_DWORD *)buf = *(_DWORD *)([(NSData *)self->_labelsData bytes] + 4 * a3);
    -[NSMutableData replaceBytesInRange:withBytes:](self->_trueLabelBuffer, "replaceBytesInRange:withBytes:", 0, 4, buf);
    unint64_t inputDim = self->_inputDim;
    v6 = [(NSArray *)self->_rowsData objectAtIndexedSubscript:a3];
    v7 = [v6 first];
    unint64_t v8 = (unint64_t)[v7 length] >> 2;
    v9 = [(NSArray *)self->_rowsData objectAtIndexedSubscript:a3];
    id v10 = [v9 first];
    uint64_t v11 = [v10 bytes];
    v12 = [(NSArray *)self->_rowsData objectAtIndexedSubscript:a3];
    id v13 = [v12 second];
    +[PMLSparseVector sparseVectorWithLength:numberOfNonZeroValues:isSparseIndexInt64:sparseIndices:sparseValues:toDenseValues:withLength:](PMLSparseVector, "sparseVectorWithLength:numberOfNonZeroValues:isSparseIndexInt64:sparseIndices:sparseValues:toDenseValues:withLength:", inputDim, v8, 0, v11, [v13 bytes], -[NSMutableData mutableBytes](self->_inputBuffer, "mutableBytes"), self->_inputDim);

    v14 = objc_opt_new();
    id v31 = objc_alloc(MEMORY[0x263F3B768]);
    v30 = [(NSMutableData *)self->_inputBuffer mutableBytes];
    v33[0] = &unk_26D3365D8;
    v15 = [NSNumber numberWithUnsignedInteger:self->_inputDim];
    v33[1] = v15;
    v33[2] = &unk_26D3365D8;
    v33[3] = &unk_26D3365D8;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
    v17 = [NSNumber numberWithUnsignedInteger:self->_inputDim];
    v32[0] = v17;
    v18 = [NSNumber numberWithUnsignedInteger:self->_inputDim];
    v32[1] = v18;
    v19 = [NSNumber numberWithUnsignedInteger:self->_inputDim];
    v32[2] = v19;
    v32[3] = &unk_26D3365D8;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
    v21 = (void *)[v31 initWithData:v30 type:2 shape:v16 strides:v20];
    [v14 setObject:v21 forKeyedSubscript:self->_inputName];

    v22 = [NSNumber numberWithUnsignedInteger:self->_inputDim];
    v23 = [v14 objectForKeyedSubscript:self->_inputName];
    [v23 setMaxNumberOfElements:v22];

    v24 = objc_msgSend(objc_alloc(MEMORY[0x263F3B768]), "initWithData:type:shape:strides:", -[NSMutableData mutableBytes](self->_trueLabelBuffer, "mutableBytes"), 2, &unk_26D336860, &unk_26D336878);
    [v14 setObject:v24 forKeyedSubscript:self->_trueLabelName];

    v25 = [v14 objectForKeyedSubscript:self->_trueLabelName];
    [v25 setMaxNumberOfElements:&unk_26D3365D8];
  }
  return v14;
}

- (void)clearBuffers
{
  -[NSMutableData resetBytesInRange:](self->_inputBuffer, "resetBytesInRange:", 0, [(NSMutableData *)self->_inputBuffer length]);
  trueLabelBuffer = self->_trueLabelBuffer;
  uint64_t v4 = [(NSMutableData *)trueLabelBuffer length];
  -[NSMutableData resetBytesInRange:](trueLabelBuffer, "resetBytesInRange:", 0, v4);
}

- (PMLEspressoDataProvider)initWithRowsData:(id)a3 labelsData:(id)a4 inputName:(id)a5 inputDim:(unint64_t)a6 trueLabelName:(id)a7
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  v39.receiver = self;
  v39.super_class = (Class)PMLEspressoDataProvider;
  v18 = [(PMLEspressoDataProvider *)&v39 init];
  if (v18)
  {
    SEL v36 = a2;
    unint64_t v37 = a6;
    unint64_t v19 = [v15 length];
    if ([v14 count] != v19 >> 2)
    {
      unint64_t v32 = v19 >> 2;
      v33 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", v36, v18, @"PMLEspressoDataProvider.m", 45, @"Number of dimensions in rows data (%lu) number of labels (%lu)", objc_msgSend(v14, "count"), v32);
    }
    if ([v16 isEqualToString:v17])
    {
      v34 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v36, v18, @"PMLEspressoDataProvider.m", 48, @"The names of the input and trueLabel can not be the same: %s", objc_msgSend(v16, "UTF8String"));
    }
    id v38 = v16;
    v18->_unint64_t numberOfDataPoints = [v14 count];
    id v20 = v15;
    uint64_t v21 = [v20 bytes];
    unint64_t numberOfDataPoints = v18->_numberOfDataPoints;
    if (numberOfDataPoints)
    {
      uint64_t v23 = v21;
      unint64_t v24 = 0;
      unint64_t v25 = 0x263F08000uLL;
      do
      {
        float v26 = *(float *)(v23 + 4 * v24);
        if (v26 < 0.0)
        {
          unint64_t v35 = [*(id *)(v25 + 1680) currentHandler];
          objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", v36, v18, @"PMLEspressoDataProvider.m", 55, @"Label value %f must be greater than 0", v26);

          unint64_t v25 = 0x263F08000;
          unint64_t numberOfDataPoints = v18->_numberOfDataPoints;
        }
        ++v24;
      }
      while (numberOfDataPoints > v24);
    }
    objc_storeStrong((id *)&v18->_rowsData, a3);
    objc_storeStrong((id *)&v18->_labelsData, v20);
    objc_storeStrong((id *)&v18->_inputName, a5);
    v18->_unint64_t inputDim = v37;
    objc_storeStrong((id *)&v18->_trueLabelName, a7);
    uint64_t v27 = [objc_alloc(MEMORY[0x263EFF990]) initWithLength:4 * v18->_inputDim];
    inputBuffer = v18->_inputBuffer;
    v18->_inputBuffer = (NSMutableData *)v27;

    uint64_t v29 = [objc_alloc(MEMORY[0x263EFF990]) initWithLength:4];
    trueLabelBuffer = v18->_trueLabelBuffer;
    v18->_trueLabelBuffer = (NSMutableData *)v29;

    id v16 = v38;
  }

  return v18;
}

@end