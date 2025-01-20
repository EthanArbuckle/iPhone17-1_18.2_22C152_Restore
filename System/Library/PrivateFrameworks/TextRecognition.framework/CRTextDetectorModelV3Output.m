@interface CRTextDetectorModelV3Output
+ (id)multiArrayForOutput:(id)a3 inNamedObjects:(id)a4 fromFunctionDescriptor:(id)a5 error:(id *)a6;
+ (id)shapeExcludingBatch:(id)a3;
+ (id)stridesExcludingBatch:(id)a3;
- (BOOL)isLazy;
- (CRTextDetectorModelV3Output)init;
- (CRTextDetectorModelV3Output)initWithRegion_score:(id)a3 script_feature:(id)a4 link_score_horizontal:(id)a5 link_score_vertical:(id)a6 orientation_score:(id)a7 text_type_score:(id)a8 table_score:(id)a9;
- (CRTextDetectorModelV3Output)initWithVisionCoreNamedObjects:(id)a3 fromFunctionDescriptor:(id)a4;
- (MLMultiArray)link_score_horizontal;
- (MLMultiArray)link_score_vertical;
- (MLMultiArray)orientation_score;
- (MLMultiArray)region_score;
- (MLMultiArray)script_feature;
- (MLMultiArray)script_score;
- (MLMultiArray)table_score;
- (MLMultiArray)text_type_score;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setLink_score_horizontal:(id)a3;
- (void)setLink_score_vertical:(id)a3;
- (void)setOrientation_score:(id)a3;
- (void)setRegion_score:(id)a3;
- (void)setScript_feature:(id)a3;
- (void)setScript_score:(id)a3;
- (void)setTable_score:(id)a3;
- (void)setText_type_score:(id)a3;
@end

@implementation CRTextDetectorModelV3Output

+ (id)shapeExcludingBatch:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 shape];
  v5 = [v4 objectAtIndexedSubscript:1];
  v6 = objc_msgSend(v3, "shape", v5);
  v7 = [v6 objectAtIndexedSubscript:2];
  v12[1] = v7;
  v8 = [v3 shape];

  v9 = [v8 objectAtIndexedSubscript:3];
  v12[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

  return v10;
}

+ (id)stridesExcludingBatch:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 strides];
  v5 = [v4 objectAtIndexedSubscript:1];
  v6 = objc_msgSend(v3, "strides", v5);
  v7 = [v6 objectAtIndexedSubscript:2];
  v12[1] = v7;
  v8 = [v3 strides];

  v9 = [v8 objectAtIndexedSubscript:3];
  v12[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

  return v10;
}

- (CRTextDetectorModelV3Output)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRTextDetectorModelV3Output;
  return [(CRTextDetectorModelV3Output *)&v3 init];
}

- (CRTextDetectorModelV3Output)initWithRegion_score:(id)a3 script_feature:(id)a4 link_score_horizontal:(id)a5 link_score_vertical:(id)a6 orientation_score:(id)a7 text_type_score:(id)a8 table_score:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v105.receiver = self;
  v105.super_class = (Class)CRTextDetectorModelV3Output;
  v22 = [(CRTextDetectorModelV3Output *)&v105 init];
  if (v22)
  {
    v96 = v20;
    v23 = [v15 shape];
    uint64_t v24 = [v23 count];

    if (v24 == 4)
    {
      id v25 = objc_alloc(MEMORY[0x1E4F1E9A8]);
      id v91 = v15;
      id v26 = v15;
      uint64_t v27 = [v26 dataPointer];
      +[CRTextDetectorModelV3Output shapeExcludingBatch:v26];
      v29 = v28 = v17;
      id v95 = v18;
      uint64_t v30 = [v26 dataType];
      v31 = +[CRTextDetectorModelV3Output stridesExcludingBatch:v26];
      id v103 = 0;
      uint64_t v32 = [v25 initWithDataPointer:v27 shape:v29 dataType:v30 strides:v31 deallocator:0 error:&v103];
      id v33 = v103;
      region_score = v22->_region_score;
      v22->_region_score = (MLMultiArray *)v32;

      id v35 = objc_alloc(MEMORY[0x1E4F1E9A8]);
      id v93 = v16;
      id v36 = v16;
      uint64_t v37 = [v36 dataPointer];
      v38 = +[CRTextDetectorModelV3Output shapeExcludingBatch:v36];
      id v94 = v19;
      uint64_t v39 = [v36 dataType];
      id v90 = v36;
      v40 = +[CRTextDetectorModelV3Output stridesExcludingBatch:v36];
      id v102 = v33;
      uint64_t v41 = [v35 initWithDataPointer:v37 shape:v38 dataType:v39 strides:v40 deallocator:0 error:&v102];
      id v42 = v102;

      script_feature = v22->_script_feature;
      v22->_script_feature = (MLMultiArray *)v41;

      id v44 = objc_alloc(MEMORY[0x1E4F1E9A8]);
      v92 = v28;
      id v45 = v28;
      uint64_t v46 = [v45 dataPointer];
      v47 = +[CRTextDetectorModelV3Output shapeExcludingBatch:v45];
      uint64_t v48 = [v45 dataType];
      v49 = +[CRTextDetectorModelV3Output stridesExcludingBatch:v45];
      id v101 = v42;
      uint64_t v50 = [v44 initWithDataPointer:v46 shape:v47 dataType:v48 strides:v49 deallocator:0 error:&v101];
      id v51 = v101;

      link_score_horizontal = v22->_link_score_horizontal;
      v22->_link_score_horizontal = (MLMultiArray *)v50;

      id v53 = objc_alloc(MEMORY[0x1E4F1E9A8]);
      id v54 = v95;
      uint64_t v55 = [v54 dataPointer];
      v56 = +[CRTextDetectorModelV3Output shapeExcludingBatch:v54];
      uint64_t v57 = [v54 dataType];
      v58 = +[CRTextDetectorModelV3Output stridesExcludingBatch:v54];
      id v100 = v51;
      uint64_t v59 = [v53 initWithDataPointer:v55 shape:v56 dataType:v57 strides:v58 deallocator:0 error:&v100];
      id v60 = v100;

      link_score_vertical = v22->_link_score_vertical;
      v22->_link_score_vertical = (MLMultiArray *)v59;

      id v62 = objc_alloc(MEMORY[0x1E4F1E9A8]);
      id v63 = v94;
      uint64_t v64 = [v63 dataPointer];
      v65 = +[CRTextDetectorModelV3Output shapeExcludingBatch:v63];
      uint64_t v66 = [v63 dataType];
      v67 = +[CRTextDetectorModelV3Output stridesExcludingBatch:v63];
      id v99 = v60;
      uint64_t v68 = [v62 initWithDataPointer:v64 shape:v65 dataType:v66 strides:v67 deallocator:0 error:&v99];
      v69 = v99;

      orientation_score = v22->_orientation_score;
      v22->_orientation_score = (MLMultiArray *)v68;

      if (v21)
      {
        id v71 = objc_alloc(MEMORY[0x1E4F1E9A8]);
        id v72 = v21;
        uint64_t v73 = [v72 dataPointer];
        v74 = +[CRTextDetectorModelV3Output shapeExcludingBatch:v72];
        uint64_t v75 = [v72 dataType];
        v76 = +[CRTextDetectorModelV3Output stridesExcludingBatch:v72];
        v98 = v69;
        uint64_t v77 = [v71 initWithDataPointer:v73 shape:v74 dataType:v75 strides:v76 deallocator:0 error:&v98];
        v78 = v98;

        table_score = v22->_table_score;
        v22->_table_score = (MLMultiArray *)v77;

        v69 = v78;
      }
      id v20 = v96;
      id v15 = v91;
      if (v96)
      {
        id v80 = objc_alloc(MEMORY[0x1E4F1E9A8]);
        id v81 = v96;
        uint64_t v82 = [v81 dataPointer];
        v83 = +[CRTextDetectorModelV3Output shapeExcludingBatch:v81];
        uint64_t v84 = [v81 dataType];
        v85 = +[CRTextDetectorModelV3Output stridesExcludingBatch:v90];
        v97 = v69;
        uint64_t v86 = [v80 initWithDataPointer:v82 shape:v83 dataType:v84 strides:v85 deallocator:0 error:&v97];
        v87 = v97;

        text_type_score = v22->_text_type_score;
        v22->_text_type_score = (MLMultiArray *)v86;

        v69 = v87;
      }
      id v17 = v92;
      id v16 = v93;
      id v19 = v94;
      id v18 = v95;
    }
    else
    {

      v69 = CROSLogForCategory(0);
      if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD733000, v69, OS_LOG_TYPE_FAULT, "Please check the detector model you are using! It should return a 4D tensor", buf, 2u);
      }
      v22 = 0;
      id v20 = v96;
    }
  }
  return v22;
}

+ (id)multiArrayForOutput:(id)a3 inNamedObjects:(id)a4 fromFunctionDescriptor:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v11 outputNamed:v9 error:a6];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 shape];
    id v15 = [v13 strides];
    uint64_t v16 = [v13 dataType];
    uint64_t v32 = 0;
    id v33 = &v32;
    uint64_t v34 = 0x3032000000;
    id v35 = __Block_byref_object_copy__11;
    id v36 = __Block_byref_object_dispose__11;
    id v37 = 0;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    id v26 = __95__CRTextDetectorModelV3Output_multiArrayForOutput_inNamedObjects_fromFunctionDescriptor_error___block_invoke;
    uint64_t v27 = &unk_1E6CDBA18;
    uint64_t v31 = v16;
    id v17 = v14;
    id v28 = v17;
    id v18 = v15;
    id v29 = v18;
    uint64_t v30 = &v32;
    id v19 = (void *)MEMORY[0x1E01BFAC0](&v24);
    id v20 = objc_msgSend(v13, "name", v24, v25, v26, v27);
    char v21 = [v10 accessReadOnlyDataForName:v20 usingBlock:v19 error:a6];

    if (v21) {
      id v22 = (id)v33[5];
    }
    else {
      id v22 = 0;
    }

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

uint64_t __95__CRTextDetectorModelV3Output_multiArrayForOutput_inNamedObjects_fromFunctionDescriptor_error___block_invoke(uint64_t a1, id a2)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)[v3 bytes];
  uint64_t v5 = *(void *)(a1 + 56);
  size_t v6 = [v3 length];
  if (v5 == 65552)
  {
    v7 = malloc_type_calloc(2 * v6, 1uLL, 0x92EE5215uLL);
    unint64_t v8 = [v3 length];

    CRConvertFloat16BufferToFloat32Buffer(v4, v7, v8 >> 1, 0);
  }
  else
  {
    v7 = malloc_type_calloc(v6, 1uLL, 0x43346662uLL);
    size_t v9 = [v3 length];

    memcpy(v4, v7, v9);
  }
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", *(void *)(objc_msgSend(*(id *)(a1 + 32), "sizes") + 8));
  v23[0] = v10;
  id v11 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", *(void *)(objc_msgSend(*(id *)(a1 + 32), "sizes") + 16));
  v23[1] = v11;
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", *(void *)(objc_msgSend(*(id *)(a1 + 32), "sizes") + 24));
  v23[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];

  v14 = objc_msgSend(NSNumber, "numberWithLong:", *(void *)(objc_msgSend(*(id *)(a1 + 40), "byteOffsets") + 8) / 2);
  v22[0] = v14;
  id v15 = objc_msgSend(NSNumber, "numberWithLong:", *(void *)(objc_msgSend(*(id *)(a1 + 40), "byteOffsets") + 16) / 2);
  v22[1] = v15;
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithLong:", *(void *)(objc_msgSend(*(id *)(a1 + 40), "byteOffsets") + 24) / 2);
  v22[2] = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];

  uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1E9A8]) initWithDataPointer:v7 shape:v13 dataType:65568 strides:v17 deallocator:&__block_literal_global_18 error:0];
  uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
  id v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  return 1;
}

void __95__CRTextDetectorModelV3Output_multiArrayForOutput_inNamedObjects_fromFunctionDescriptor_error___block_invoke_2(int a1, void *a2)
{
}

- (CRTextDetectorModelV3Output)initWithVisionCoreNamedObjects:(id)a3 fromFunctionDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CRTextDetectorModelV3Output;
  unint64_t v8 = [(CRTextDetectorModelV3Output *)&v39 init];
  if (!v8) {
    goto LABEL_3;
  }
  id v38 = 0;
  uint64_t v9 = +[CRTextDetectorModelV3Output multiArrayForOutput:@"region_score" inNamedObjects:v6 fromFunctionDescriptor:v7 error:&v38];
  id v10 = v38;
  region_score = v8->_region_score;
  v8->_region_score = (MLMultiArray *)v9;

  id v37 = v10;
  uint64_t v12 = +[CRTextDetectorModelV3Output multiArrayForOutput:@"script_feature" inNamedObjects:v6 fromFunctionDescriptor:v7 error:&v37];
  id v13 = v37;

  script_feature = v8->_script_feature;
  v8->_script_feature = (MLMultiArray *)v12;

  id v36 = v13;
  uint64_t v15 = +[CRTextDetectorModelV3Output multiArrayForOutput:@"link_score_horizontal" inNamedObjects:v6 fromFunctionDescriptor:v7 error:&v36];
  id v16 = v36;

  link_score_horizontal = v8->_link_score_horizontal;
  v8->_link_score_horizontal = (MLMultiArray *)v15;

  id v35 = v16;
  uint64_t v18 = +[CRTextDetectorModelV3Output multiArrayForOutput:@"link_score_vertical" inNamedObjects:v6 fromFunctionDescriptor:v7 error:&v35];
  id v19 = v35;

  link_score_vertical = v8->_link_score_vertical;
  v8->_link_score_vertical = (MLMultiArray *)v18;

  id v34 = v19;
  uint64_t v21 = +[CRTextDetectorModelV3Output multiArrayForOutput:@"orientation_score" inNamedObjects:v6 fromFunctionDescriptor:v7 error:&v34];
  id v22 = v34;

  orientation_score = v8->_orientation_score;
  v8->_orientation_score = (MLMultiArray *)v21;

  id v33 = v22;
  uint64_t v24 = +[CRTextDetectorModelV3Output multiArrayForOutput:@"table_score" inNamedObjects:v6 fromFunctionDescriptor:v7 error:&v33];
  id v25 = v33;

  table_score = v8->_table_score;
  v8->_table_score = (MLMultiArray *)v24;

  id v32 = v25;
  uint64_t v27 = +[CRTextDetectorModelV3Output multiArrayForOutput:@"text_type_score" inNamedObjects:v6 fromFunctionDescriptor:v7 error:&v32];
  id v28 = v32;

  text_type_score = v8->_text_type_score;
  v8->_text_type_score = (MLMultiArray *)v27;

  uint64_t v30 = 0;
  if (!v28) {
LABEL_3:
  }
    uint64_t v30 = v8;

  return v30;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3935BA8];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"region_score"])
  {
    uint64_t v5 = 8;
LABEL_15:
    id v6 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:*(Class *)((char *)&self->super.isa + v5)];
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"script_feature"])
  {
    uint64_t v5 = 16;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"orientation_score"])
  {
    uint64_t v5 = 48;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"text_type_score"])
  {
    uint64_t v5 = 56;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"link_score_horizontal"])
  {
    uint64_t v5 = 24;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"link_score_vertical"])
  {
    uint64_t v5 = 32;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"table_score"])
  {
    uint64_t v5 = 40;
    goto LABEL_15;
  }
  id v6 = 0;
LABEL_16:

  return v6;
}

- (BOOL)isLazy
{
  return 0;
}

- (MLMultiArray)region_score
{
  return self->_region_score;
}

- (void)setRegion_score:(id)a3
{
}

- (MLMultiArray)script_feature
{
  return self->_script_feature;
}

- (void)setScript_feature:(id)a3
{
}

- (MLMultiArray)script_score
{
  return self->_script_score;
}

- (void)setScript_score:(id)a3
{
}

- (MLMultiArray)link_score_horizontal
{
  return self->_link_score_horizontal;
}

- (void)setLink_score_horizontal:(id)a3
{
}

- (MLMultiArray)link_score_vertical
{
  return self->_link_score_vertical;
}

- (void)setLink_score_vertical:(id)a3
{
}

- (MLMultiArray)table_score
{
  return self->_table_score;
}

- (void)setTable_score:(id)a3
{
}

- (MLMultiArray)orientation_score
{
  return self->_orientation_score;
}

- (void)setOrientation_score:(id)a3
{
}

- (MLMultiArray)text_type_score
{
  return self->_text_type_score;
}

- (void)setText_type_score:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_script_score, 0);
  objc_storeStrong((id *)&self->_text_type_score, 0);
  objc_storeStrong((id *)&self->_orientation_score, 0);
  objc_storeStrong((id *)&self->_table_score, 0);
  objc_storeStrong((id *)&self->_link_score_vertical, 0);
  objc_storeStrong((id *)&self->_link_score_horizontal, 0);
  objc_storeStrong((id *)&self->_script_feature, 0);
  objc_storeStrong((id *)&self->_region_score, 0);
}

@end