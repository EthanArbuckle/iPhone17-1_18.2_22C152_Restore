@interface CRCTCCVNLPOrientationDecoder
- (BOOL)_decodeFeaturesWithInfo:(id)a3 decoderCallback:(id)a4 shouldDecodeScriptResult:(BOOL)a5 shouldDecodeOrientationResult:(BOOL)a6 shouldDecodeLayoutDirectionResult:(BOOL)a7;
- (BOOL)decodeOutput:(id)a3 imageSize:(CGSize)a4 error:(id *)a5;
- (BOOL)decodeOutput:(id)a3 imageSize:(CGSize)a4 shouldDecodeScriptResult:(BOOL)a5 shouldDecodeOrientationResult:(BOOL)a6 shouldDecodeLayoutDirectionResult:(BOOL)a7 error:(id *)a8;
- (BOOL)shouldDecodeWithLM;
- (BOOL)shouldUseModernizedDecoder;
- (CRCTCCVNLPOrientationDecoder)initWithConfiguration:(id)a3 model:(id)a4 error:(id *)a5;
- (CRTextSequenceRecognizerModel)model;
- (NSOrderedSet)characterObservations;
- (id).cxx_construct;
- (id)_buildActivationMatrices:(id)a3;
- (vector<CoreRecognition::decoder::ActivationMatrix,)_buildModernizedActivationMatrices:(CRCTCCVNLPOrientationDecoder *)self;
- (void)_create2DArraysFromInputArray:(id)a3 classSize:(unint64_t *)a4 outputArrays:(void *)a5;
- (void)setModel:(id)a3;
@end

@implementation CRCTCCVNLPOrientationDecoder

- (CRCTCCVNLPOrientationDecoder)initWithConfiguration:(id)a3 model:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v36 = a4;
  v41.receiver = self;
  v41.super_class = (Class)CRCTCCVNLPOrientationDecoder;
  v8 = [(CRCTCCVNLPOrientationDecoder *)&v41 init];
  v9 = v8;
  if (!v8)
  {
LABEL_30:
    v32 = v9;
    goto LABEL_31;
  }
  p_model = (id *)&v8->_model;
  objc_storeStrong((id *)&v8->_model, a4);
  v11 = (int *)[*p_model codemapArray];
  if (v11)
  {
    v34 = unicodeArrayToNSStringArray(v11, [*p_model codemapSize]);
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithArray:");
    characterObservations = v9->_characterObservations;
    v9->_characterObservations = (NSOrderedSet *)v12;

    if ([(CRCTCCVNLPOrientationDecoder *)v9 shouldUseModernizedDecoder])
    {
      p_begin = (void **)&v9->_spaceLabels.__begin_;
      v9->_spaceLabels.__end_ = v9->_spaceLabels.__begin_;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v15 = [&unk_1F3935D40 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v38 != v16) {
              objc_enumerationMutation(&unk_1F3935D40);
            }
            uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            v19 = [(CRCTCCVNLPOrientationDecoder *)v9 characterObservations];
            uint64_t v20 = [v19 indexOfObject:v18];

            if (v20 != 0x7FFFFFFFFFFFFFFFLL)
            {
              end = (uint64_t *)v9->_spaceLabels.__end_;
              unint64_t value = (unint64_t)v9->_spaceLabels.__end_cap_.__value_;
              if ((unint64_t)end >= value)
              {
                begin = (uint64_t *)*p_begin;
                uint64_t v25 = ((char *)end - (unsigned char *)*p_begin) >> 3;
                unint64_t v26 = v25 + 1;
                if ((unint64_t)(v25 + 1) >> 61) {
                  std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v27 = value - (void)begin;
                if (v27 >> 2 > v26) {
                  unint64_t v26 = v27 >> 2;
                }
                if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v28 = v26;
                }
                if (v28)
                {
                  v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v9->_spaceLabels.__end_cap_, v28);
                  begin = (uint64_t *)v9->_spaceLabels.__begin_;
                  end = (uint64_t *)v9->_spaceLabels.__end_;
                }
                else
                {
                  v29 = 0;
                }
                v30 = (uint64_t *)&v29[8 * v25];
                uint64_t *v30 = v20;
                v23 = (unint64_t *)(v30 + 1);
                while (end != begin)
                {
                  uint64_t v31 = *--end;
                  *--v30 = v31;
                }
                v9->_spaceLabels.__begin_ = (unint64_t *)v30;
                v9->_spaceLabels.__end_ = v23;
                v9->_spaceLabels.__end_cap_.__value_ = (unint64_t *)&v29[8 * v28];
                if (begin) {
                  operator delete(begin);
                }
              }
              else
              {
                uint64_t *end = v20;
                v23 = (unint64_t *)(end + 1);
              }
              v9->_spaceLabels.__end_ = v23;
            }
          }
          uint64_t v15 = [&unk_1F3935D40 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v15);
      }
    }

    goto LABEL_30;
  }
  if (a5)
  {
    +[CRImageReader errorWithErrorCode:-8];
    v32 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
LABEL_31:

  return v32;
}

- (BOOL)shouldDecodeWithLM
{
  return 0;
}

- (BOOL)shouldUseModernizedDecoder
{
  v2 = [(CRCTCCVNLPOrientationDecoder *)self model];
  v3 = [v2 outputFormatVersion];
  BOOL v4 = [v3 intValue] == 2;

  return v4;
}

- (BOOL)decodeOutput:(id)a3 imageSize:(CGSize)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)decodeOutput:(id)a3 imageSize:(CGSize)a4 shouldDecodeScriptResult:(BOOL)a5 shouldDecodeOrientationResult:(BOOL)a6 shouldDecodeLayoutDirectionResult:(BOOL)a7 error:(id *)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  uint64_t v10 = a5;
  id v12 = a3;
  if ([(CRCTCCVNLPOrientationDecoder *)self shouldUseModernizedDecoder])
  {
    v13 = [(CRCTCCVNLPOrientationDecoder *)self model];
    uint64_t v14 = [v13 ctcBlankLabelIndex];

    LOBYTE(v46) = 0;
    v45 = &unk_1F38ED2E0;
    v47 = 0;
    v48 = 0;
    uint64_t v49 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v47, self->_spaceLabels.__begin_, (uint64_t)self->_spaceLabels.__end_, self->_spaceLabels.__end_ - self->_spaceLabels.__begin_);
    char v50 = 0;
    v51 = &unk_1F38ED080;
    uint64_t v52 = v14;
    char v54 = 0;
    v53 = &unk_1F38ED2E0;
    v55 = 0;
    v56 = 0;
    uint64_t v57 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v55, v47, (uint64_t)v48, (v48 - (unsigned char *)v47) >> 3);
    char v58 = v50;
    v45 = &unk_1F38ED2E0;
    if (v47)
    {
      v48 = v47;
      operator delete(v47);
    }
    [(CRCTCCVNLPOrientationDecoder *)self _buildModernizedActivationMatrices:v12];
    uint64_t v43 = 0;
    long long v44 = 0uLL;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3321888768;
    v31[2] = __150__CRCTCCVNLPOrientationDecoder_decodeOutput_imageSize_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult_error___block_invoke;
    v31[3] = &unk_1F38EE3B8;
    v32 = &unk_1F38ED080;
    uint64_t v33 = v52;
    char v35 = v54;
    v34 = &unk_1F38ED2E0;
    __p = 0;
    long long v37 = 0;
    uint64_t v38 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v55, (uint64_t)v56, (v56 - (unsigned char *)v55) >> 3);
    char v39 = v58;
    memset(v40, 0, sizeof(v40));
    std::vector<CoreRecognition::decoder::ActivationMatrix>::__init_with_size[abi:ne180100]<CoreRecognition::decoder::ActivationMatrix*,CoreRecognition::decoder::ActivationMatrix*>(v40, (uint64_t)v45, v46, 0xCCCCCCCCCCCCCCCDLL * ((v46 - (uint64_t)v45) >> 4));
    long long v42 = v44;
    CFTypeRef cf = 0;
    v31[4] = self;
    uint64_t v15 = (void *)MEMORY[0x1E01BFAC0](v31);
    if (cf) {
      CFRelease(cf);
    }
    v59 = v40;
    std::vector<CoreRecognition::decoder::ActivationMatrix>::__destroy_vector::operator()[abi:ne180100]((void ***)&v59);
    v32 = &unk_1F38ED080;
    v34 = &unk_1F38ED2E0;
    if (__p)
    {
      long long v37 = __p;
      operator delete(__p);
    }
    uint64_t v43 = &v45;
    std::vector<CoreRecognition::decoder::ActivationMatrix>::__destroy_vector::operator()[abi:ne180100](&v43);
    v51 = &unk_1F38ED080;
    v53 = &unk_1F38ED2E0;
    BOOL v16 = v9;
    uint64_t v10 = v10;
    if (v55)
    {
      v56 = v55;
      operator delete(v55);
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F56780] defaultWhitespaceCommitActionBehavior];
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F56780]) initWithCommitActionBehavior:v17];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F56750]) initWithLanguageResourceBundle:0];
    uint64_t v20 = [(CRCTCCVNLPOrientationDecoder *)self _buildActivationMatrices:v12];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __150__CRCTCCVNLPOrientationDecoder_decodeOutput_imageSize_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult_error___block_invoke_9;
    v27[3] = &unk_1E6CDC650;
    id v28 = v19;
    id v29 = v20;
    id v30 = v18;
    id v21 = v18;
    id v22 = v20;
    id v23 = v19;
    uint64_t v15 = (void *)MEMORY[0x1E01BFAC0](v27);

    BOOL v16 = v9;
  }
  v24 = [v12 textFeatureInfo];
  BOOL v25 = [(CRCTCCVNLPOrientationDecoder *)self _decodeFeaturesWithInfo:v24 decoderCallback:v15 shouldDecodeScriptResult:v10 shouldDecodeOrientationResult:v16 shouldDecodeLayoutDirectionResult:v8];

  return v25;
}

id __150__CRCTCCVNLPOrientationDecoder_decodeOutput_imageSize_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult_error___block_invoke(uint64_t a1, uint64_t a2)
{
  CoreRecognition::decoder::CTCGreedyDecoder<CoreRecognition::decoder::SpaceSegmentedPathBuilder<CoreRecognition::decoder::BaseState>>::decode((void *)(a1 + 40), (uint64_t *)(*(void *)(a1 + 104) + 80 * a2), v4);
  v2 = convertToCVNLPTextDecodingResult();
  v5 = (void **)v4;
  std::vector<CoreRecognition::decoder::DecodingPath>::__destroy_vector::operator()[abi:ne180100](&v5);
  return v2;
}

id __150__CRCTCCVNLPOrientationDecoder_decodeOutput_imageSize_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) characterObservations];
  BOOL v4 = [v3 objectAtIndexedSubscript:a2];

  return v4;
}

uint64_t __150__CRCTCCVNLPOrientationDecoder_decodeOutput_imageSize_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult_error___block_invoke_9(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  [*(id *)(a1 + 32) setActivationMatrix:v3];

  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  return [v4 greedyDecodingResultWithConfiguration:v5];
}

- (id)_buildActivationMatrices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  v6 = [v4 textFeatureInfo];
  uint64_t v27 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  v7 = [(CRCTCCVNLPOrientationDecoder *)self model];
  uint64_t v8 = [v7 codemapSize];

  uint64_t v34 = 0;
  uint64_t v35 = v8;
  v32 = 0;
  uint64_t v33 = 0;
  [(CRCTCCVNLPOrientationDecoder *)self _create2DArraysFromInputArray:v4 classSize:&v35 outputArrays:&v32];
  BOOL v9 = [(CRCTCCVNLPOrientationDecoder *)self model];
  uint64_t v10 = [v9 ctcBlankLabelIndex];

  v11 = v32;
  if (v33 != v32)
  {
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    do
    {
      id v14 = objc_alloc(MEMORY[0x1E4F56748]);
      long long v15 = *(_OWORD *)&v11[v12];
      long long v16 = *(_OWORD *)&v11[v12 + 32];
      v30[1] = *(_OWORD *)&v11[v12 + 16];
      v30[2] = v16;
      v30[0] = v15;
      long long v17 = *(_OWORD *)&v11[v12 + 48];
      long long v18 = *(_OWORD *)&v11[v12 + 64];
      long long v19 = *(_OWORD *)&v11[v12 + 96];
      v30[5] = *(_OWORD *)&v11[v12 + 80];
      v30[6] = v19;
      v30[3] = v17;
      v30[4] = v18;
      long long v20 = *(_OWORD *)&v11[v12 + 112];
      long long v21 = *(_OWORD *)&v11[v12 + 128];
      long long v22 = *(_OWORD *)&v11[v12 + 144];
      uint64_t v31 = *(void *)&v11[v12 + 160];
      v30[8] = v21;
      v30[9] = v22;
      v30[7] = v20;
      id v23 = [(CRCTCCVNLPOrientationDecoder *)self characterObservations];
      long long v28 = xmmword_1DD8CEF68;
      uint64_t v29 = 10;
      v24 = (void *)[v14 initWithBuffer:v30 domainType:0 characterObservations:v23 blankIndex:v10 pruningPolicy:&v28];

      [v27 addObject:v24];
      ++v13;
      v11 = v32;
      v12 += 168;
    }
    while (v13 < 0xCF3CF3CF3CF3CF3DLL * ((v33 - v32) >> 3));
  }
  BOOL v25 = [MEMORY[0x1E4F1C978] arrayWithArray:v27];
  if (v32)
  {
    uint64_t v33 = v32;
    operator delete(v32);
  }

  return v25;
}

- (vector<CoreRecognition::decoder::ActivationMatrix,)_buildModernizedActivationMatrices:(CRCTCCVNLPOrientationDecoder *)self
{
  id v6 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  id v30 = v6;
  v7 = [v6 textFeatureInfo];
  unint64_t v8 = [v7 count];
  p_var2 = &retstr->var2;
  var0 = retstr->var0;
  if (0xCCCCCCCCCCCCCCCDLL * ((retstr->var2.var0 - retstr->var0) >> 4) < v8)
  {
    if (v8 > 0x333333333333333) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    var1 = retstr->var1;
    char v39 = &retstr->var2;
    uint64_t v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreRecognition::decoder::ActivationMatrix>>(v8);
    id v36 = &v35[var1 - var0];
    long long v37 = v36;
    uint64_t v38 = &v35[80 * v12];
    std::vector<CoreRecognition::decoder::ActivationMatrix>::__swap_out_circular_buffer((uint64_t *)retstr, &v35);
    std::__split_buffer<CoreRecognition::decoder::ActivationMatrix>::~__split_buffer((uint64_t)&v35);
  }

  unint64_t v13 = [(CRCTCCVNLPOrientationDecoder *)self model];
  uint64_t v14 = [v13 codemapSize];

  uint64_t v33 = 0;
  uint64_t v34 = v14;
  uint64_t v31 = 0;
  v32 = 0;
  [(CRCTCCVNLPOrientationDecoder *)self _create2DArraysFromInputArray:v6 classSize:&v34 outputArrays:&v31];
  long long v15 = v31;
  long long v16 = v32;
  if (v32 == v31)
  {
    long long v15 = v32;
    if (!v32) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  uint64_t v17 = 0;
  unint64_t v18 = 0;
  long long v19 = retstr->var1;
  do
  {
    uint64_t v20 = *(void *)&v15[v17 + 96];
    uint64_t v21 = *(void *)&v15[v17 + 112];
    uint64_t v22 = *(void *)&v15[v17];
    if (v19 >= p_var2->var0)
    {
      unint64_t v23 = 0xCCCCCCCCCCCCCCCDLL * ((v19 - retstr->var0) >> 4);
      unint64_t v24 = v23 + 1;
      if (v23 + 1 > 0x333333333333333) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      if (0x999999999999999ALL * ((p_var2->var0 - retstr->var0) >> 4) > v24) {
        unint64_t v24 = 0x999999999999999ALL * ((p_var2->var0 - retstr->var0) >> 4);
      }
      if (0xCCCCCCCCCCCCCCCDLL * ((p_var2->var0 - retstr->var0) >> 4) >= 0x199999999999999) {
        unint64_t v25 = 0x333333333333333;
      }
      else {
        unint64_t v25 = v24;
      }
      char v39 = &retstr->var2;
      unint64_t v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreRecognition::decoder::ActivationMatrix>>(v25);
      uint64_t v27 = &v26[80 * v23];
      uint64_t v35 = v26;
      id v36 = v27;
      uint64_t v38 = &v26[80 * v28];
      *(void *)uint64_t v27 = v21;
      *((void *)v27 + 1) = v20;
      *((_OWORD *)v27 + 1) = 0u;
      *((_OWORD *)v27 + 2) = 0u;
      *((_OWORD *)v27 + 3) = 0u;
      *((void *)v27 + 8) = v22;
      *((void *)v27 + 9) = 0;
      long long v37 = v27 + 80;
      std::vector<CoreRecognition::decoder::ActivationMatrix>::__swap_out_circular_buffer((uint64_t *)retstr, &v35);
      long long v19 = retstr->var1;
      std::__split_buffer<CoreRecognition::decoder::ActivationMatrix>::~__split_buffer((uint64_t)&v35);
      long long v15 = v31;
      long long v16 = v32;
    }
    else
    {
      *(void *)long long v19 = v21;
      *((void *)v19 + 1) = v20;
      *((_OWORD *)v19 + 1) = 0u;
      *((_OWORD *)v19 + 2) = 0u;
      *((_OWORD *)v19 + 3) = 0u;
      *((void *)v19 + 8) = v22;
      *((void *)v19 + 9) = 0;
      long long v19 = (ActivationMatrix *)((char *)v19 + 80);
    }
    retstr->var1 = v19;
    ++v18;
    v17 += 168;
  }
  while (v18 < 0xCF3CF3CF3CF3CF3DLL * ((v16 - v15) >> 3));
  if (v15)
  {
LABEL_17:
    v32 = v15;
    operator delete(v15);
  }
LABEL_18:

  return result;
}

- (void)_create2DArraysFromInputArray:(id)a3 classSize:(unint64_t *)a4 outputArrays:(void *)a5
{
  id v7 = a3;
  v51 = v7;
  if (v7)
  {
    objc_msgSend(v7, "output_label_prob_map");
    uint64_t v52 = (float *)v78;
    uint64_t v8 = v83;
    uint64_t v64 = v82;
    uint64_t v65 = v80;
    unint64_t v63 = v84;
    uint64_t v57 = v85;
    uint64_t v58 = v86;
    uint64_t v56 = v87;
    uint64_t v60 = v81;
    v61 = v88;
    uint64_t v54 = *((void *)&v78 + 1);
    uint64_t v55 = v89;
    int v53 = v90;
  }
  else
  {
    int v53 = 0;
    uint64_t v55 = 0;
    uint64_t v56 = 0;
    uint64_t v60 = 0;
    v61 = 0;
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    unint64_t v63 = 0;
    uint64_t v64 = 0;
    uint64_t v8 = 0;
    uint64_t v65 = 0;
    uint64_t v54 = 0;
    uint64_t v52 = 0;
  }
  v71 = [v51 textFeatureInfo];
  BOOL v9 = [(CRCTCCVNLPOrientationDecoder *)self model];
  uint64_t v10 = [v9 outputFormatVersion];
  uint64_t v11 = [v10 intValue] == 1;

  uint64_t v62 = (uint64_t)v61;
  if ((v11 & 1) == 0)
  {
    uint64_t v12 = [(CRCTCCVNLPOrientationDecoder *)self model];
    uint64_t v10 = [v12 outputFormatVersion];
    uint64_t v11 = [v10 intValue] == 2;

    if (v11) {
      uint64_t v13 = v60;
    }
    else {
      uint64_t v13 = 1;
    }
    uint64_t v14 = v58;
    if (!v11) {
      uint64_t v14 = 1;
    }
    uint64_t v62 = v14;
    unint64_t v63 = v13;
  }
  std::vector<espresso_buffer_t>::resize((uint64_t)a5, [v71 count]);
  if ([(CRCTCCVNLPOrientationDecoder *)self shouldUseModernizedDecoder])
  {
    uint64_t v15 = v64 * v8 * v60 * v65;
    if (v15)
    {
      uint64_t v8 = 4 * v15;
      uint64_t v11 = 4286578688;
      uint64_t v5 = v52;
      do
      {
        float v16 = *v5;
        float v17 = logf(*v5);
        if (v16 <= 0.0) {
          float v17 = -INFINITY;
        }
        *v5++ = v17;
        v8 -= 4;
      }
      while (v8);
    }
  }
  unint64_t v73 = 0;
  unint64_t v74 = 0;
  uint64_t v72 = 160;
  while (v74 < [v71 count])
  {
    objc_msgSend(v71, "objectAtIndexedSubscript:");
    unint64_t v18 = (float *)objc_claimAutoreleasedReturnValue();
    double v19 = -[CRFeatureSequenceRecognitionInfo featureImageSize]((uint64_t)v18);
    if (v18) {
      float v20 = v18[2];
    }
    else {
      float v20 = 0.0;
    }
    uint64_t v21 = [(CRCTCCVNLPOrientationDecoder *)self model];
    uint64_t v22 = [v21 outputWidthDownscale];
    [v22 floatValue];
    float v24 = v23;
    unint64_t v25 = [(CRCTCCVNLPOrientationDecoder *)self model];
    unint64_t v26 = [v25 outputWidthOffset];
    [v26 floatValue];
    float v28 = v27;

    double v29 = ceil(v19 * v20 / v24) + v28 + 2.0;
    if (v63 >= (unint64_t)v29) {
      unint64_t v30 = (unint64_t)v29;
    }
    else {
      unint64_t v30 = v63;
    }
    uint64_t v31 = [(CRCTCCVNLPOrientationDecoder *)self model];
    v32 = [v31 outputFormatVersion];
    BOOL v33 = [v32 intValue] == 1;

    unint64_t v34 = v73;
    uint64_t v36 = v64;
    uint64_t v35 = v65;
    uint64_t v37 = v60;
    uint64_t v38 = v61;
    uint64_t v39 = v57;
    uint64_t v40 = v58;
    uint64_t v41 = v55;
    uint64_t v42 = v56;
    if (!v33)
    {
      uint64_t v43 = [(CRCTCCVNLPOrientationDecoder *)self model];
      long long v44 = [v43 outputFormatVersion];
      BOOL v45 = [v44 intValue] == 2;

      uint64_t v37 = v68;
      uint64_t v35 = v69;
      unint64_t v46 = v66;
      uint64_t v36 = v67;
      v47 = v70;
      v48 = v10;
      uint64_t v49 = v8;
      uint64_t v42 = v6;
      uint64_t v38 = v5;
      uint64_t v41 = v11;
      if (!v45) {
        goto LABEL_28;
      }
      uint64_t v38 = (float *)(v63 * v65);
      unint64_t v34 = v62 * v63 * v74;
      uint64_t v37 = v64;
      uint64_t v41 = v65;
      uint64_t v35 = v64;
      uint64_t v36 = v65;
      uint64_t v39 = 1;
      uint64_t v40 = 1;
      uint64_t v42 = 1;
    }
    long long v78 = 0u;
    long long v79 = 0u;
    unint64_t v46 = v30;
    v48 = (void *)v39;
    uint64_t v49 = v40;
    long long v76 = 0u;
    long long v77 = 0u;
    v47 = &v52[v34];
LABEL_28:
    char v50 = (_DWORD *)(*(void *)a5 + v72);
    uint64_t v69 = v35;
    v70 = v47;
    *((void *)v50 - 20) = v47;
    *((void *)v50 - 19) = v54;
    *((_OWORD *)v50 - 9) = v78;
    *((_OWORD *)v50 - 8) = v79;
    *((_OWORD *)v50 - 7) = v76;
    *((_OWORD *)v50 - 6) = v77;
    *((void *)v50 - 10) = v35;
    *((void *)v50 - 9) = v37;
    uint64_t v67 = v36;
    uint64_t v68 = v37;
    *((void *)v50 - 8) = v36;
    *((void *)v50 - 7) = 1;
    unint64_t v66 = v46;
    *((void *)v50 - 6) = v46;
    *((void *)v50 - 5) = v48;
    uint64_t v10 = v48;
    uint64_t v8 = v49;
    *((void *)v50 - 4) = v49;
    *((void *)v50 - 3) = v42;
    uint64_t v6 = v42;
    uint64_t v5 = v38;
    *((void *)v50 - 2) = v38;
    *((void *)v50 - 1) = v41;
    uint64_t v11 = v41;
    *char v50 = v53;

    v73 += v62;
    ++v74;
    v72 += 168;
  }
}

- (BOOL)_decodeFeaturesWithInfo:(id)a3 decoderCallback:(id)a4 shouldDecodeScriptResult:(BOOL)a5 shouldDecodeOrientationResult:(BOOL)a6 shouldDecodeLayoutDirectionResult:(BOOL)a7
{
  BOOL v105 = a5;
  BOOL v106 = a7;
  BOOL v108 = a6;
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v111 = a3;
  v110 = (void (**)(id, void))a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke;
  block[3] = &unk_1E6CDBE60;
  v107 = self;
  block[4] = self;
  if (qword_1EB58CE70 != -1) {
    dispatch_once(&qword_1EB58CE70, block);
  }
  unint64_t v117 = 0;
  uint64_t v109 = 0;
LABEL_4:
  unint64_t v114 = [v111 count];
  if (v117 < v114)
  {
    context = (void *)MEMORY[0x1E01BF820]();
    BOOL v9 = v110[2](v110, v117);
    v113 = v9;
    if (!v9)
    {
      int v14 = 1;
      goto LABEL_108;
    }
    selfa = [v111 objectAtIndexedSubscript:v117];
    uint64_t v10 = [v9 candidates];
    v115 = [v10 firstObject];

    uint64_t v11 = [v115 fullString];
    uint64_t v12 = selfa;
    id newValue = v11;
    if (!v108)
    {
LABEL_26:
      if (v106)
      {
        uint64_t v145 = 0;
        v146 = &v145;
        uint64_t v147 = 0x2020000000;
        uint64_t v148 = 0;
        uint64_t v141 = 0;
        v142 = &v141;
        uint64_t v143 = 0x2020000000;
        uint64_t v144 = 0;
        uint64_t v29 = [v11 length];
        v139[0] = MEMORY[0x1E4F143A8];
        v139[1] = 3221225472;
        v139[2] = __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_3;
        v139[3] = &unk_1E6CDB538;
        v139[4] = &v145;
        v139[5] = &v141;
        objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v29, 2, v139);
        if (v12)
        {
          uint64_t v30 = v142[3];
          BOOL v31 = v30 <= v146[3] || v30 <= 1;
          uint64_t v32 = 5;
          if (v31) {
            uint64_t v32 = 1;
          }
          *((void *)v12 + 9) = v32;
        }
        _Block_object_dispose(&v141, 8);
        _Block_object_dispose(&v145, 8);
      }
      if (!v105
        || ([(CRTextSequenceRecognizerModel *)v107->_model configuration],
            BOOL v33 = objc_claimAutoreleasedReturnValue(),
            char v34 = [v33 scriptDetectionDisabled],
            v33,
            (v34 & 1) != 0))
      {
        int v14 = 0;
        goto LABEL_107;
      }
      if (qword_1EB58CE80)
      {
        uint64_t v35 = objc_msgSend((id)qword_1EB58CE80, "stringByReplacingMatchesInString:options:range:withTemplate:", newValue, 0, 0, objc_msgSend(newValue, "length"), &stru_1F38EED68);
        if (![v35 length])
        {
          uint64_t v36 = [newValue uppercaseString];

          uint64_t v35 = (void *)v36;
        }
      }
      else
      {
        uint64_t v35 = [newValue uppercaseString];
      }
      for (uint64_t i = 0; i != 7; ++i)
      {
        uint64_t v38 = [(id)qword_1EB58CE68 objectAtIndexedSubscript:i];
        uint64_t v39 = [(id)qword_1EB58CE60 objectAtIndexedSubscript:i];
        uint64_t v40 = [v35 stringByReplacingOccurrencesOfString:v38 withString:v39];

        uint64_t v35 = v40;
      }
      if (v40)
      {
        if ([v40 length])
        {
          if (selfa) {
            objc_setProperty_atomic(selfa, v41, newValue, 56);
          }
          int v42 = [v40 containsString:@"L"];
          if (qword_1EB58CE78) {
            int v43 = v42;
          }
          else {
            int v43 = 0;
          }
          if (v43 == 1)
          {
            long long v44 = objc_msgSend((id)qword_1EB58CE78, "stringByReplacingMatchesInString:options:range:withTemplate:", v40, 0, 0, objc_msgSend(v40, "length"), @"L");
          }
          else
          {
            long long v44 = v40;
          }
          v103 = objc_opt_new();
          v102 = v44;
          uint64_t v45 = [v44 length];
          v137[0] = MEMORY[0x1E4F143A8];
          v137[1] = 3221225472;
          v137[2] = __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_4;
          v137[3] = &unk_1E6CDC678;
          id v46 = v103;
          id v138 = v46;
          objc_msgSend(v44, "enumerateSubstringsInRange:options:usingBlock:", 0, v45, 2, v137);
          v47 = [v46 allObjects];
          v135[0] = MEMORY[0x1E4F143A8];
          v135[1] = 3221225472;
          v135[2] = __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_5;
          v135[3] = &unk_1E6CDC6A0;
          id v119 = v46;
          id v136 = v119;
          v104 = [v47 sortedArrayUsingComparator:v135];

          v122 = objc_opt_new();
          long long v133 = 0u;
          long long v134 = 0u;
          long long v131 = 0u;
          long long v132 = 0u;
          v48 = +[CRScriptCategoryV1 supportedCategories];
          unint64_t v49 = 0;
          uint64_t v50 = [v48 countByEnumeratingWithState:&v131 objects:v152 count:16];
          if (v50)
          {
            uint64_t v51 = *(void *)v132;
            do
            {
              for (uint64_t j = 0; j != v50; ++j)
              {
                if (*(void *)v132 != v51) {
                  objc_enumerationMutation(v48);
                }
                int v53 = *(void **)(*((void *)&v131 + 1) + 8 * j);
                uint64_t v54 = +[CRScriptCategoryV1 unknown]();
                BOOL v55 = v53 == v54;

                if (!v55)
                {
                  uint64_t v56 = +[CRScriptCategoryV1 sequenceScriptForCategory:v53];
                  unint64_t v57 = [v119 countForObject:v56];

                  uint64_t v58 = +[CRScriptCategoryV1 latinCyrillic]();
                  if (v53 == v58)
                  {
                  }
                  else
                  {
                    v59 = +[CRScriptCategoryV1 common]();
                    BOOL v61 = v53 != v59 && v57 > v49;

                    if (v61) {
                      unint64_t v49 = v57;
                    }
                  }
                  uint64_t v62 = [NSNumber numberWithUnsignedInteger:v57];
                  [v122 setObject:v62 forKeyedSubscript:v53];
                }
              }
              uint64_t v50 = [v48 countByEnumeratingWithState:&v131 objects:v152 count:16];
            }
            while (v50);
          }

          v120 = [v104 objectAtIndexedSubscript:0];
          unint64_t v63 = +[CRScriptCategoryV1 latinCyrillic]();
          uint64_t v64 = [v122 objectForKeyedSubscript:v63];
          if ((int)[v64 intValue] <= 0)
          {
          }
          else
          {
            uint64_t v65 = +[CRScriptCategoryV1 latinCyrillic]();
            unint64_t v66 = [v122 objectForKeyedSubscript:v65];
            BOOL v67 = (double)v49 + (double)v49 > (double)(int)[v66 intValue];

            if (!v67)
            {
              uint64_t v69 = +[CRScriptCategoryV1 latinCyrillic]();
              v70 = selfa;
              if (selfa) {
                goto LABEL_103;
              }
              goto LABEL_104;
            }
          }
          long long v129 = 0u;
          long long v130 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          obuint64_t j = (id)qword_1EB58CE88;
          uint64_t v71 = [obj countByEnumeratingWithState:&v127 objects:v151 count:16];
          uint64_t v72 = selfa;
          if (!v71) {
            goto LABEL_96;
          }
          uint64_t v73 = *(void *)v128;
          while (1)
          {
            for (uint64_t k = 0; k != v71; ++k)
            {
              if (*(void *)v128 != v73) {
                objc_enumerationMutation(obj);
              }
              v75 = *(void **)(*((void *)&v127 + 1) + 8 * k);
              long long v76 = +[CRScriptCategoryV1 sequenceScriptForCategory:v75];
              if ([v120 isEqualToString:v76])
              {
                BOOL v77 = v72 == 0;

                uint64_t v72 = selfa;
                if (!v77) {
                  goto LABEL_92;
                }
              }
              else
              {
                long long v79 = [v122 objectForKeyedSubscript:v75];
                if ((int)[v79 intValue] > 0)
                {
                  uint64_t v80 = [v122 objectForKeyedSubscript:v75];
                  BOOL v81 = v72 == 0;
                  BOOL v82 = v49 != (int)[v80 intValue];

                  BOOL v83 = v81 || v82;
                  uint64_t v72 = selfa;
                  if (v83) {
                    continue;
                  }
LABEL_92:
                  objc_setProperty_atomic(v72, v78, v75, 48);
                  continue;
                }

                uint64_t v72 = selfa;
              }
            }
            uint64_t v71 = [obj countByEnumeratingWithState:&v127 objects:v151 count:16];
            if (!v71)
            {
LABEL_96:

              if (v72) {
                id Property = objc_getProperty(selfa, v84, 48, 1);
              }
              else {
                id Property = 0;
              }
              id v86 = Property;
              BOOL v87 = v86 == 0;

              if (v87)
              {
                if ([v120 isEqualToString:@"L"])
                {
                  uint64_t v69 = +[CRScriptCategoryV1 latinCyrillic]();
                  v70 = selfa;
                  if (selfa) {
LABEL_103:
                  }
                    objc_setProperty_atomic(v70, v68, v69, 48);
                }
                else
                {
                  uint64_t v69 = +[CRScriptCategoryV1 common]();
                  v70 = selfa;
                  if (selfa) {
                    goto LABEL_103;
                  }
                }
LABEL_104:
              }
              int v14 = 0;
              uint64_t v40 = v102;
LABEL_106:

LABEL_107:
LABEL_108:

              if ((v14 | 4) == 4)
              {
                ++v117;
                goto LABEL_4;
              }
              goto LABEL_112;
            }
          }
        }
      }
      else
      {
        uint64_t v40 = 0;
      }
      int v14 = 4;
      goto LABEL_106;
    }
    if ([(CRCTCCVNLPOrientationDecoder *)v107 shouldUseModernizedDecoder])
    {
      [v115 score];
    }
    else
    {
      [v115 score];
      double v16 = v15;
      uint64_t v17 = [v11 length];
      if (!v17) {
        goto LABEL_13;
      }
      double v13 = pow(v16, 1.0 / (double)v17);
    }
    double v16 = v13;
LABEL_13:
    uint64_t v145 = 0;
    v146 = &v145;
    uint64_t v147 = 0x2020000000;
    uint64_t v148 = 0;
    uint64_t v141 = 0;
    v142 = &v141;
    uint64_t v143 = 0x2020000000;
    uint64_t v144 = 0;
    uint64_t v18 = [v11 length];
    v140[0] = MEMORY[0x1E4F143A8];
    v140[1] = 3221225472;
    v140[2] = __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_2;
    v140[3] = &unk_1E6CDB538;
    v140[4] = &v145;
    v140[5] = &v141;
    objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v18, 2, v140);
    double v19 = [v11 stringByReplacingOccurrencesOfString:@"S" withString:&stru_1F38EED68];
    uint64_t v21 = v19;
    if (selfa)
    {
      objc_setProperty_atomic(selfa, v20, v19, 40);

      id v23 = objc_getProperty(selfa, v22, 40, 1);
    }
    else
    {

      id v23 = 0;
    }
    id v24 = v23;
    uint64_t v25 = [v24 length];

    uint64_t v26 = v146[3];
    uint64_t v27 = v142[3];
    if (v26 >= v27)
    {
      uint64_t v12 = selfa;
      if (v26 >= 1) {
        double v16 = v16 * ((double)v26 / (double)(v27 + v26));
      }
      if (!selfa) {
        goto LABEL_25;
      }
      uint64_t v28 = 1;
    }
    else
    {
      uint64_t v12 = selfa;
      if (v27 >= 1) {
        double v16 = v16 * ((double)v27 / (double)(v27 + v26));
      }
      if (!selfa) {
        goto LABEL_25;
      }
      uint64_t v28 = 2;
    }
    v12[4] = v16;
    *((void *)v12 + 3) = v28;
LABEL_25:
    v109 += v25;
    _Block_object_dispose(&v141, 8);
    _Block_object_dispose(&v145, 8);
    uint64_t v11 = newValue;
    goto LABEL_26;
  }
LABEL_112:
  if (v117 >= v114 && v108 && v109 >= 1)
  {
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    id v88 = v111;
    uint64_t v90 = [v88 countByEnumeratingWithState:&v123 objects:v150 count:16];
    if (v90)
    {
      uint64_t v91 = *(void *)v124;
      do
      {
        uint64_t v92 = 0;
        do
        {
          if (*(void *)v124 != v91) {
            objc_enumerationMutation(v88);
          }
          v93 = *(double **)(*((void *)&v123 + 1) + 8 * v92);
          if (v93) {
            id v94 = objc_getProperty(*(id *)(*((void *)&v123 + 1) + 8 * v92), v89, 40, 1);
          }
          else {
            id v94 = 0;
          }
          id v95 = v94;
          BOOL v96 = v95 == 0;

          if (!v96)
          {
            if (v93) {
              id v97 = objc_getProperty(v93, v89, 40, 1);
            }
            else {
              id v97 = 0;
            }
            id v98 = v97;
            unint64_t v99 = [v98 length];
            if (v93) {
              v93[4] = (double)v99 / (double)v109 * v93[4];
            }
          }
          ++v92;
        }
        while (v90 != v92);
        uint64_t v100 = [v88 countByEnumeratingWithState:&v123 objects:v150 count:16];
        uint64_t v90 = v100;
      }
      while (v100);
    }
  }
  return v117 >= v114;
}

void __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke(uint64_t a1)
{
  v46[5] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) characterObservations];
  v3 = [v2 array];
  uint64_t v4 = objc_msgSend(v3, "subarrayWithRange:", 0, 7);
  uint64_t v5 = (void *)qword_1EB58CE60;
  qword_1EB58CE60 = v4;

  uint64_t v6 = [*(id *)(a1 + 32) characterObservations];
  id v7 = [v6 array];
  uint64_t v8 = objc_msgSend(v7, "subarrayWithRange:", 14, 7);
  BOOL v9 = (void *)qword_1EB58CE68;
  qword_1EB58CE68 = v8;

  uint64_t v10 = [*(id *)(a1 + 32) characterObservations];
  uint64_t v11 = [v10 array];
  uint64_t v12 = objc_msgSend(v11, "subarrayWithRange:", 7, 7);

  double v13 = [*(id *)(a1 + 32) characterObservations];
  int v14 = [v13 array];
  double v15 = objc_msgSend(v14, "subarrayWithRange:", 21, 7);

  double v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = [(id)qword_1EB58CE60 arrayByAddingObjectsFromArray:qword_1EB58CE68];
  uint64_t v18 = [v16 setWithArray:v17];
  double v19 = (void *)_MergedGlobals_36;
  _MergedGlobals_36 = v18;

  float v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = [v12 arrayByAddingObjectsFromArray:v15];
  uint64_t v22 = [v20 setWithArray:v21];
  id v23 = (void *)qword_1EB58CE48;
  qword_1EB58CE48 = v22;

  id v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = [(id)qword_1EB58CE68 arrayByAddingObjectsFromArray:v15];
  uint64_t v26 = [v24 setWithArray:v25];
  uint64_t v27 = (void *)qword_1EB58CE50;
  qword_1EB58CE50 = v26;

  uint64_t v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = [(id)qword_1EB58CE60 arrayByAddingObjectsFromArray:v12];
  uint64_t v30 = [v28 setWithArray:v29];
  BOOL v31 = (void *)qword_1EB58CE58;
  qword_1EB58CE58 = v30;

  uint64_t v32 = +[CRScriptCategoryV1 japanese]();
  v46[0] = v32;
  BOOL v33 = +[CRScriptCategoryV1 korean]();
  v46[1] = v33;
  char v34 = +[CRScriptCategoryV1 chinese]();
  v46[2] = v34;
  uint64_t v35 = +[CRScriptCategoryV1 thai]();
  v46[3] = v35;
  uint64_t v36 = +[CRScriptCategoryV1 arabic]();
  v46[4] = v36;
  uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:5];
  uint64_t v38 = (void *)qword_1EB58CE88;
  qword_1EB58CE88 = v37;

  uint64_t v39 = [(id)qword_1EB58CE48 allObjects];
  uint64_t v40 = [v39 componentsJoinedByString:@"|"];

  uint64_t v41 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v40 options:0 error:0];
  int v42 = (void *)qword_1EB58CE80;
  qword_1EB58CE80 = v41;

  int v43 = [NSString stringWithFormat:@"%@{2,}", @"L"];
  uint64_t v44 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v43 options:1 error:0];
  uint64_t v45 = (void *)qword_1EB58CE78;
  qword_1EB58CE78 = v44;
}

void __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend((id)_MergedGlobals_36, "containsObject:"))
  {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else
  {
    if (![(id)qword_1EB58CE48 containsObject:v4]) {
      goto LABEL_6;
    }
    uint64_t v3 = *(void *)(a1 + 40);
  }
  ++*(void *)(*(void *)(v3 + 8) + 24);
LABEL_6:
}

void __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_msgSend((id)qword_1EB58CE58, "containsObject:"))
  {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else
  {
    if (![(id)qword_1EB58CE50 containsObject:v4]) {
      goto LABEL_6;
    }
    uint64_t v3 = *(void *)(a1 + 40);
  }
  ++*(void *)(*(void *)(v3 + 8) + 24);
LABEL_6:
}

uint64_t __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = [*(id *)(a1 + 32) countForObject:a2];
  unint64_t v7 = [*(id *)(a1 + 32) countForObject:v5];
  if (v6 > v7) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = v6 < v7;
  }

  return v8;
}

- (CRTextSequenceRecognizerModel)model
{
  return (CRTextSequenceRecognizerModel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModel:(id)a3
{
}

- (NSOrderedSet)characterObservations
{
  return self->_characterObservations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characterObservations, 0);
  objc_storeStrong((id *)&self->_model, 0);
  begin = self->_spaceLabels.__begin_;
  if (begin)
  {
    self->_spaceLabels.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end