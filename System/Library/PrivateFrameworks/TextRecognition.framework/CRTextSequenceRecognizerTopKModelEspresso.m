@interface CRTextSequenceRecognizerTopKModelEspresso
- (id)outputFromOutputBuffers:()vector<espresso_buffer_t featureInfo:(std:(id)a4 :allocator<espresso_buffer_t>> *)a3;
- (id)outputNames;
@end

@implementation CRTextSequenceRecognizerTopKModelEspresso

- (id)outputNames
{
  return &unk_1F3935B48;
}

- (id)outputFromOutputBuffers:()vector<espresso_buffer_t featureInfo:(std:(id)a4 :allocator<espresso_buffer_t>> *)a3
{
  id v6 = a4;
  var0 = a3->var0;
  long long v8 = *(_OWORD *)((char *)a3->var0 + 120);
  long long v64 = *(_OWORD *)((char *)a3->var0 + 104);
  long long v65 = v8;
  long long v9 = *(_OWORD *)((char *)var0 + 152);
  long long v66 = *(_OWORD *)((char *)var0 + 136);
  long long v67 = v9;
  long long v10 = *(_OWORD *)((char *)var0 + 56);
  long long v60 = *(_OWORD *)((char *)var0 + 40);
  long long v61 = v10;
  long long v11 = *(_OWORD *)((char *)var0 + 88);
  long long v62 = *(_OWORD *)((char *)var0 + 72);
  long long v63 = v11;
  long long v12 = *(_OWORD *)((char *)var0 + 24);
  long long v58 = *(_OWORD *)((char *)var0 + 8);
  long long v59 = v12;
  v13 = malloc_type_malloc(*((void *)var0 + 9), 0x249879DuLL);
  memcpy(v13, *(const void **)a3->var0, *((void *)a3->var0 + 9));
  v14 = a3->var0;
  long long v15 = *((_OWORD *)a3->var0 + 18);
  long long v16 = *((_OWORD *)a3->var0 + 19);
  long long v17 = *((_OWORD *)a3->var0 + 16);
  long long v54 = *((_OWORD *)a3->var0 + 17);
  long long v55 = v15;
  long long v18 = *((_OWORD *)v14 + 20);
  long long v56 = v16;
  long long v57 = v18;
  long long v19 = *((_OWORD *)v14 + 14);
  long long v50 = *((_OWORD *)v14 + 13);
  long long v51 = v19;
  long long v52 = *((_OWORD *)v14 + 15);
  long long v53 = v17;
  long long v20 = *((_OWORD *)v14 + 12);
  long long v48 = *((_OWORD *)v14 + 11);
  long long v49 = v20;
  v21 = malloc_type_malloc(*((void *)v14 + 30), 0xF795E123uLL);
  memcpy(v21, *((const void **)a3->var0 + 21), *((void *)a3->var0 + 30));
  uint64_t v22 = [v6 count];
  if ([(CRTextSequenceRecognizerModelEspresso *)self engine] == 10007)
  {
    v23 = [(CRTextSequenceRecognizerModelEspresso *)self configuration];
    uint64_t v22 = [v23 batchSize];
  }
  long long v44 = v64;
  long long v45 = v65;
  long long v46 = v66;
  long long v47 = v67;
  long long v40 = v60;
  long long v41 = v61;
  long long v42 = v62;
  long long v43 = v63;
  long long v38 = v58;
  long long v39 = v59;
  long long v33 = v54;
  long long v34 = v55;
  long long v35 = v56;
  long long v36 = v57;
  long long v29 = v50;
  long long v30 = v51;
  long long v31 = v52;
  long long v32 = v53;
  long long v27 = v48;
  v37 = v13;
  v26 = v21;
  long long v28 = v49;
  v24 = [[CRTextRecognizerTopKModelEspressoOutput alloc] initWithOutputLabelProbs:&v37 outputTopKIndices:&v26 featureInfo:v6 batchSize:v22];

  return v24;
}

@end